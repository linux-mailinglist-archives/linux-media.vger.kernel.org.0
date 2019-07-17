Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF72E6B8CA
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 11:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbfGQJDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 05:03:52 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39841 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726106AbfGQJDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 05:03:51 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id nfqjhuob40SBqnfqnhZQVq; Wed, 17 Jul 2019 11:03:50 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/4] ov7670: don't return ENOTTY if SUBDEV_API is not set
Date:   Wed, 17 Jul 2019 11:03:44 +0200
Message-Id: <20190717090345.26521-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717090345.26521-1-hverkuil-cisco@xs4all.nl>
References: <20190717090345.26521-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfK4r2Y09IVqQUIu98/siE+sfNhBLRnTg9JWdEf/rzV/0IGuSyiGzdsOXtv0kojlf5QJu417UZIdNVrHBh0auOGJTpCI7EhpejY/vhHm86FekM6Q//xz4
 luPBedxA6GT+mqQD7O4BmE4NCIwlwG9MqCZNPBH5nLqFHkDyQFQ0q1y7ASiSC1TO2FMqBijdgPaTC92HaNtTXcBc1bgdAmXig+UCY9MsuFEczLJTKwD5j/MJ
 1czN6KF1KVI/qKO1BN5Ciw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If CONFIG_VIDEO_V4L2_SUBDEV_API is not set, then it is still possible
to call set_fmt for V4L2_SUBDEV_FORMAT_TRY, the result is just not
stored. So return 0 instead of -ENOTTY.

Calling get_fmt with V4L2_SUBDEV_FORMAT_TRY should return -EINVAL
instead of -ENOTTY, after all the get_fmt functionality is still
present, just not supported for TRY.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/ov7670.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index a70a6ff7b36e..53e238e98d11 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1030,10 +1030,8 @@ static int ov7670_set_fmt(struct v4l2_subdev *sd,
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
 		mbus_fmt = v4l2_subdev_get_try_format(sd, cfg, format->pad);
 		*mbus_fmt = format->format;
-		return 0;
-#else
-		return -ENOTTY;
 #endif
+		return 0;
 	}
 
 	ret = ov7670_try_fmt_internal(sd, &format->format, &ovfmt, &wsize);
@@ -1116,7 +1114,7 @@ static int ov7670_get_fmt(struct v4l2_subdev *sd,
 		format->format = *mbus_fmt;
 		return 0;
 #else
-		return -ENOTTY;
+		return -EINVAL;
 #endif
 	} else {
 		format->format = info->format;
-- 
2.20.1

