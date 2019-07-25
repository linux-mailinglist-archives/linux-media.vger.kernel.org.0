Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C20374E7A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 14:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388497AbfGYMs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 08:48:27 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:34473 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389308AbfGYMs1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 08:48:27 -0400
Received: from [IPv6:2001:420:44c1:2579:64cb:e917:d1ce:4f27] ([IPv6:2001:420:44c1:2579:64cb:e917:d1ce:4f27])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qdAThEXC8LqASqdAXhTlKs; Thu, 25 Jul 2019 14:48:25 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jan Kotas <jank@cadence.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-dev: fix WARN_ON(!vdev->device_caps)
Message-ID: <b424ab15-986f-ec8c-183e-a26101dc97a8@xs4all.nl>
Date:   Thu, 25 Jul 2019 14:48:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJCXSpU889EeWLIEA/kc+SNMbxroN4ulexPRFMJETk8PxTjhd4rBJWjXJfDs7deY0sv4pw3gmDZ0j+fiq1RdhVRNXfofGa9ZoGGsgiQz2ubOCKdG/0vG
 0crT9fBamchjzBCZRpPGvwnLCNg6rr74fq27EjSzQOOVp5DO9/Eo65YLMPEGQr5L7Oschwqo35oSBwgd1l9RVNxMXXDNFIpnGtTYFCBGas4jq1JPnrUudDz8
 CCAu2rbVIh0UMGydxFus5dwuSvRautVcwW7neXqeVSO29K0Ok8CUqcEXSkHGrz3qmr6C4JqOpyXIAdyT6YeYiswcsFM3GWwnWN1BrJ2dSsMf4pkSBum7Ps77
 +/nRljik
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Device nodes of type VFL_TYPE_SUBDEV have a 0 device_caps, so they
trigger this warning. Add a check against VFL_TYPE_SUBDEV.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 3c1350501c21 ("media: v4l2-dev/ioctl: require non-zero device_caps, verify sane querycap results")
Reported-by: Jan Kotas <jank@cadence.com>
---
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 3af72e3bbd65..a1c61d6f3b9b 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -859,8 +859,8 @@ int __video_register_device(struct video_device *vdev,
 	/* the v4l2_dev pointer MUST be present */
 	if (WARN_ON(!vdev->v4l2_dev))
 		return -EINVAL;
-	/* the device_caps field MUST be set */
-	if (WARN_ON(!vdev->device_caps))
+	/* the device_caps field MUST be set for all but subdevs */
+	if (WARN_ON(type != VFL_TYPE_SUBDEV && !vdev->device_caps))
 		return -EINVAL;

 	/* v4l2_fh support */

