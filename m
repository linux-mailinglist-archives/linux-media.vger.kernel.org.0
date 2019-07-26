Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2C3576AD4
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 16:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387717AbfGZOBO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 10:01:14 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:55225 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388432AbfGZOBM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 10:01:12 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id r0mRhXjmVur8Tr0mUhyb3N; Fri, 26 Jul 2019 16:01:10 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.3] vivid: fix missing cec adapter name
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Message-ID: <cd7a3809-ac0b-3165-68b1-3ee82b94b653@xs4all.nl>
Date:   Fri, 26 Jul 2019 16:01:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAbmPbEG8APXobTbLZyDKtBIpUuiJNaJL3+rEFhBI2bJZzKVxpNzievQyolZZE3y1mi0qH7gGl/QLrVy+GATFDKW/IsyOYMCpmXeQND19maXzFQGZ+bD
 3T57e85aziRowZTRxElkIVaf83pxoG2LX3d5Xo8zAcpGYHFmEJ9xWbVkyCEgx/W0Is+2LZAZYILmPBwGHiWVCKtw+6BGLFI89m4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit "vivid: reorder CEC allocation and control set-up" missed that the CEC adapter
needs a valid vfd->name, and that was now filled in after the CEC adapter was
created, leading to an empty adapter name.

Fill in the name earlier.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 4ee895e71abb ("media: vivid: reorder CEC allocation and control set-up")
---
diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index 8e1ebc94943e..53315c8dd2bb 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -1099,6 +1099,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)

 	/* start creating the vb2 queues */
 	if (dev->has_vid_cap) {
+		snprintf(dev->vid_cap_dev.name, sizeof(dev->vid_cap_dev.name),
+			 "vivid-%03d-vid-cap", inst);
 		/* initialize vid_cap queue */
 		q = &dev->vb_vid_cap_q;
 		q->type = dev->multiplanar ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
@@ -1122,6 +1124,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	}

 	if (dev->has_vid_out) {
+		snprintf(dev->vid_out_dev.name, sizeof(dev->vid_out_dev.name),
+			 "vivid-%03d-vid-out", inst);
 		/* initialize vid_out queue */
 		q = &dev->vb_vid_out_q;
 		q->type = dev->multiplanar ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :
@@ -1265,8 +1269,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	/* finally start creating the device nodes */
 	if (dev->has_vid_cap) {
 		vfd = &dev->vid_cap_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-vid-cap", inst);
 		vfd->fops = &vivid_fops;
 		vfd->ioctl_ops = &vivid_ioctl_ops;
 		vfd->device_caps = dev->vid_cap_caps;
@@ -1312,8 +1314,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)

 	if (dev->has_vid_out) {
 		vfd = &dev->vid_out_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-vid-out", inst);
 		vfd->vfl_dir = VFL_DIR_TX;
 		vfd->fops = &vivid_fops;
 		vfd->ioctl_ops = &vivid_ioctl_ops;
