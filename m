Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4C6183ECF
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 02:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgCMBqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 21:46:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48528 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbgCMBqs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 21:46:48 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id D3028296FBE
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, kernel@collabora.com,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH 2/3] media: staging: rkisp1: do not call s_stream if the entity is still in use
Date:   Thu, 12 Mar 2020 22:46:25 -0300
Message-Id: <20200313014626.3103091-3-helen.koike@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200313014626.3103091-1-helen.koike@collabora.com>
References: <20200313014626.3103091-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If stream is being used by another stream, then .s_stream callback
shouldn't be called.

This fixes the following behaviour:

When performing smultaneos stream from both capture devices, stopping one
streaming would make the other to stall, since it disables all the shared
entities from both pipelines.

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Hi,

I'm not sure if it is ok to check for entity->pipe, since I didn't see
other drivers doing this.
Please let me know if you have any other suggestion to verity if the entity
is marked as streaming.

Thanks

---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 97091e5a6e6c..e665381b5af0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -892,6 +892,10 @@ static int rkisp1_pipeline_disable_cb(struct media_entity *from,
 {
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
 
+	/* subdevice is already enabled */
+	if (curr->pipe)
+		return 0;
+
 	return v4l2_subdev_call(sd, video, s_stream, false);
 }
 
@@ -900,6 +904,10 @@ static int rkisp1_pipeline_enable_cb(struct media_entity *from,
 {
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
 
+	/* don't disable subdevice if it is still in use by another stream */
+	if (curr->pipe)
+		return 0;
+
 	return v4l2_subdev_call(sd, video, s_stream, true);
 }
 
-- 
2.25.0

