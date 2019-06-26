Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4020456393
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfFZHoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:32 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34941 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727000AbfFZHoa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:30 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bUhhHpD; Wed, 26 Jun 2019 09:44:28 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 10/16] via-camera: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:15 +0200
Message-Id: <20190626074421.38739-11-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAMxzN4FUyPeZTym9v7gc0ycLbc7FiT7ilC6KdR/vAZsnW1y5GPq1P9y+j+zRAZI5JfoUdgzCy7wAJHBCrMWWq2CxD0K8657n1s8OscrvzuZi7obxnHF
 0UXPVB1NsmhM63YiZyqDNyUTGrsrXUkgA5hUUoSgIXUf3BlewD6xgmxfB0dZPbqgj7p0RcK/Rhoc7ifO+06IdgvAr5mKRU1Img5OvtQsEnCrItIIrtoeJoHh
 Wpa+oMDwfMi2NLfYW+ugWw==
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
 drivers/media/platform/via-camera.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/via-camera.c b/drivers/media/platform/via-camera.c
index 038de7a2027a..1df1de13117d 100644
--- a/drivers/media/platform/via-camera.c
+++ b/drivers/media/platform/via-camera.c
@@ -992,9 +992,6 @@ static int viacam_querycap(struct file *filp, void *priv,
 {
 	strscpy(cap->driver, "via-camera", sizeof(cap->driver));
 	strscpy(cap->card, "via-camera", sizeof(cap->card));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1271,6 +1268,8 @@ static const struct video_device viacam_v4l_template = {
 	.fops		= &viacam_fops,
 	.ioctl_ops	= &viacam_ioctl_ops,
 	.release	= video_device_release_empty, /* Check this */
+	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+			  V4L2_CAP_STREAMING,
 };
 
 /*
-- 
2.20.1

