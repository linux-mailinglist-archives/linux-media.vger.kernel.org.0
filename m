Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDADC5638E
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfFZHo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:29 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:50687 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726076AbfFZHo2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:28 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bShhHoC; Wed, 26 Jun 2019 09:44:26 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 04/16] fsl-viu: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:09 +0200
Message-Id: <20190626074421.38739-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPhWcZmTM3uGjHlmVJfH7WGtY8O4exJsKuN6Y6jgaswPyPeLEYLnsiA8QAPwUtSX9L1yu2hoKRQ+jutvRzCZtKYMn2IXFeVoFaBej1YUvmJujVnI0Zq7
 SbSRkngWPdJNYblni/6ubPpDnFbT5VDqi6Mkn3RY49CBxANUckalSAK/Rr5X0Maf7mxwmQXwS3CmdJZs5mqABS2blvUxWCxDXKpXufglqNeLYSSkRCx63Rjf
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/fsl-viu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index 691be788e38b..bf5392f0d61c 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -563,11 +563,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(cap->driver, "viu", sizeof(cap->driver));
 	strscpy(cap->card, "viu", sizeof(cap->card));
 	strscpy(cap->bus_info, "platform:viu", sizeof(cap->bus_info));
-	cap->device_caps =	V4L2_CAP_VIDEO_CAPTURE |
-				V4L2_CAP_STREAMING     |
-				V4L2_CAP_VIDEO_OVERLAY |
-				V4L2_CAP_READWRITE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1380,6 +1375,8 @@ static const struct video_device viu_template = {
 	.release	= video_device_release,
 
 	.tvnorms        = V4L2_STD_NTSC_M | V4L2_STD_PAL,
+	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+			  V4L2_CAP_VIDEO_OVERLAY | V4L2_CAP_READWRITE,
 };
 
 static int viu_of_probe(struct platform_device *op)
-- 
2.20.1

