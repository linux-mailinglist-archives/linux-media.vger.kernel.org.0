Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27D8E564A0
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 10:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfFZIaX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 04:30:23 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:52421 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725954AbfFZIaX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 04:30:23 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g3Jph3qNs7KeZg3JthhYFQ; Wed, 26 Jun 2019 10:30:21 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] staging/most/video: set device_caps in struct video_device
To:     Andrey Shvetsov <andrey.shvetsov@k2l.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <71e17ffc-c934-07c6-b9e0-758222ed3a90@xs4all.nl>
Date:   Wed, 26 Jun 2019 10:30:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA3864ptf7ambrjKSoTpydNrsNvcnR4V1H3+wqZTb7iqkCbSO20VhOiEoTZNxiqstPxCwfRdCoHEsmBhPIksZr9cdanaJufFPE/cVXN1zRQ9KxyiavpU
 K8PDEnt2NEfHEdCM9DXqRGS01cm6EfjJ3JX/cQlIu4NcycQdSmPqKLwybcGfB3OWpzPZyklSXNTmykeiZYTLguaQB2vFQ5RWVBVM0H6TWX/HMsJlM5gYoIG3
 uaPT8PHBTAaiy1hFkK20mg==
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
Hi Andrey,

I noticed this new staging V4L2 driver. FYI, please CC any future patches to
this driver to the linux-media@vger.kernel.org mailinglist as well so we can
review it. I'll post a review of this driver later today as well. In the
meantime, I'd like to get this patch in since during the upcoming 5.4 cycle
we will require that the device_caps field of struct video_device is set
correctly.

Regards,

	Hans

Changes since v1:

- drop V4L2_CAP_TUNER since this device has no tuner.
---
diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index adca250062e1..7d12ab6c60a1 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -250,11 +250,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strlcpy(cap->card, "MOST", sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
 		 "%s", mdev->iface->description);
-
-	cap->capabilities =
-		V4L2_CAP_READWRITE |
-		V4L2_CAP_TUNER |
-		V4L2_CAP_VIDEO_CAPTURE;
 	return 0;
 }

@@ -366,6 +361,7 @@ static const struct video_device comp_videodev_template = {
 	.release = video_device_release,
 	.ioctl_ops = &video_ioctl_ops,
 	.tvnorms = V4L2_STD_UNKNOWN,
+	.device_caps = V4L2_CAP_READWRITE | V4L2_CAP_VIDEO_CAPTURE,
 };

 /**************************************************************************/
