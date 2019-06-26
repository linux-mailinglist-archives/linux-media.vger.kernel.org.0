Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E178156390
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfFZHo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:29 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:33505 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726946AbfFZHo2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:28 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bThhHoX; Wed, 26 Jun 2019 09:44:27 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 07/16] marvell-ccic: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:12 +0200
Message-Id: <20190626074421.38739-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfK5lngGVNa+o3sMUctkGWqBSwmYTdwh9qXbm6bcB1vfyH7RxcPDxrwCVg8cgs+jACveYg4HHrUQnKwy+MnlHag+f1uaaf99B+b+4kJd9myxOnEnMgUhc
 v/3Wvz9gnARXX8aCHGTHPt+eQ08svZQS86Aa/aMzzJilWMTAln29gUfd0n6VnxXQSWuDeiGQabfxOs8GRuwvHuXB/CFnGex8187wDV0ZAG8SKuEvLIKxqSpD
 45amXT7LCYMjXzYcNKINwA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 drivers/media/platform/marvell-ccic/mcam-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index dc30c48d4671..69862c44e409 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -1357,9 +1357,6 @@ static int mcam_vidioc_querycap(struct file *file, void *priv,
 	strscpy(cap->driver, "marvell_ccic", sizeof(cap->driver));
 	strscpy(cap->card, "marvell_ccic", sizeof(cap->card));
 	strscpy(cap->bus_info, cam->bus_info, sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1698,6 +1695,8 @@ static const struct video_device mcam_v4l_template = {
 	.fops = &mcam_v4l_fops,
 	.ioctl_ops = &mcam_v4l_ioctl_ops,
 	.release = video_device_release_empty,
+	.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+		       V4L2_CAP_STREAMING,
 };
 
 /* ---------------------------------------------------------------------- */
-- 
2.20.1

