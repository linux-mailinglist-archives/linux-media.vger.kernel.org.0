Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9D54565F0
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 11:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbfFZJwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 05:52:21 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:53457 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725379AbfFZJwV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 05:52:21 -0400
Received: from [IPv6:2001:420:44c1:2579:95e:6256:39de:52a6] ([IPv6:2001:420:44c1:2579:95e:6256:39de:52a6])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g4bAhWHH7SfvXg4bDhK2QV; Wed, 26 Jun 2019 11:52:19 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>
Cc:     Florian Echtler <floe@butterbrot.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] input/touchscreen/sur40: use COLORSPACE_RAW
Message-ID: <25bfb7ad-0c12-3d47-81b1-6feb1906cd42@xs4all.nl>
Date:   Wed, 26 Jun 2019 11:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBMr5/JgxIQfuHBGSv/a8sgbsFYxLAs1xDDRDpLmOgjda0I1f16knr0njRE8bqXvawhlNtIculjIHqPfFWuVefA1wdp7PK5D39meArZ7F9u8LS1WWVSz
 K3qXUvjdAZ3QY6adxe82Y3pmYS9mDFxF+X3TdKwhwNzb2u40L2lcl1arsbuY5K3wAKfO+jIahY51Dr/XpmmViN1p7wXu+uBfqtxNwQ6R7UUH7ogqr1OoXOI1
 KA4j2xgyqG7XBsNZiDsKhv+Dy2eV5g68YoTEAS4CcKZGKul9l101NWYUKWawDlC7M+VBBHO/wRpa2Jiqtvb2xTn9y+otRcEihNaT7gXWsVvMID8Ap4BBzLVQ
 TRtjNLeJwCJIVHtWcqj0nbOBAPu+4VcciR6qZ1cia7S4SQSfhDA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver set the colorspace to SRGB, but that makes no sense for
a touchscreen. Use RAW instead. This also ensures consistency with the
v4l_pix_format_touch() call that's used in v4l2-ioctl.c.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Dmitry, do you want to take this, or shall I? I have no preference.
---
diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 00cb1ba2d364..3fd3e862269b 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -186,7 +186,7 @@ static const struct v4l2_pix_format sur40_pix_format[] = {
 		.width  = SENSOR_RES_X / 2,
 		.height = SENSOR_RES_Y / 2,
 		.field = V4L2_FIELD_NONE,
-		.colorspace = V4L2_COLORSPACE_SRGB,
+		.colorspace = V4L2_COLORSPACE_RAW,
 		.bytesperline = SENSOR_RES_X / 2,
 		.sizeimage = (SENSOR_RES_X/2) * (SENSOR_RES_Y/2),
 	},
@@ -195,7 +195,7 @@ static const struct v4l2_pix_format sur40_pix_format[] = {
 		.width  = SENSOR_RES_X / 2,
 		.height = SENSOR_RES_Y / 2,
 		.field = V4L2_FIELD_NONE,
-		.colorspace = V4L2_COLORSPACE_SRGB,
+		.colorspace = V4L2_COLORSPACE_RAW,
 		.bytesperline = SENSOR_RES_X / 2,
 		.sizeimage = (SENSOR_RES_X/2) * (SENSOR_RES_Y/2),
 	}
