Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28875154EA4
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 23:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgBFWHm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 17:07:42 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45048 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727797AbgBFWHe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 17:07:34 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 80441294421
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH] media: staging: rkisp1: rsz: return to userspace the crop value in bayer mainpath
Date:   Thu,  6 Feb 2020 19:07:11 -0300
Message-Id: <20200206220712.1243438-4-helen.koike@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200206220712.1243438-1-helen.koike@collabora.com>
References: <20200206220712.1243438-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If bayer format is set in mainpath, then crop is not supported.
The core was just reseting crop but wasn't returning the values back to
user space.

Return values taken in consideration by the driver to userpace.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index d986953d268b..9de6744f0900 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -503,6 +503,8 @@ static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
 		sink_crop->top = 0;
 		sink_crop->width = sink_fmt->width;
 		sink_crop->height = sink_fmt->height;
+
+		*r = *sink_crop;
 		return;
 	}
 
-- 
2.24.0

