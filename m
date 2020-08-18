Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E767248059
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 10:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgHRISY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 04:18:24 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55520 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgHRISU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 04:18:20 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8F70429901E
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v6 6/6] media: staging: rkisp1: rsz: set flags to 0 in enum_mbus_code cb
Date:   Tue, 18 Aug 2020 10:18:06 +0200
Message-Id: <20200818081807.23134-7-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818081807.23134-1-dafna.hirschfeld@collabora.com>
References: <20200818081807.23134-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The resizer calls the enum_mbus_code cb on the source pad of
the isp entity since they support the same formats.
The only difference is that the isp entity allows setting the
quantization and sets the flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION.
The resizer should therefore set the flags to 0.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index c66d2a52fd71..155e0817f3a6 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -444,6 +444,7 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
 
 	/* restore pad */
 	code->pad = pad;
+	code->flags = 0;
 	return ret;
 }
 
-- 
2.17.1

