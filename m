Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6415AA03
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 12:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbfF2KAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 06:00:30 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:52825 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726818AbfF2KA3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 06:00:29 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id hA9gh73Xa2g2jhA9jhepQp; Sat, 29 Jun 2019 12:00:28 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v5.3] v4l2-subdev: fix regression in check_pad()
Message-ID: <5686be05-660e-ee01-06a0-5505479c34c8@xs4all.nl>
Date:   Sat, 29 Jun 2019 12:00:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPgaOJMqwE7aBU3EBLv4xVOydmB+cBKpg5AFf/0h4NGWCa/40NoG45+88cCSuz8dBKtMHb+C5I8ffhAFzt6SLf6MgWKnC/nQjwIW5wKNOP0jG6TXx8Iq
 jF0+R8BqUpyvK6Ts0Ds4qhROW6Jo8qbygDm+72zej9rAu3God+QG7zgm+b0NKAtp/kCuUynWHffuClijP9+YRNjBm8UcBOcx7RTuppfDq6wIf2lI8+2iXfat
 uEZyHYFMzkv87kGNE7pxFytRoj4lKeeop5GgtAsgcG8uC8so/Xu705J0psdJvlCG
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

sd->entity.graph_obj.mdev can be NULL when this function is called, and
that breaks existing drivers (rcar-vin, but probably others as well).

Check if sd->entity.num_pads is non-zero instead since that doesn't depend
on mdev.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Fixes: a8fa55078a77 ("media: v4l2-subdev: Verify arguments in v4l2_subdev_call()")
---
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 21fb90d66bfc..bc32fc1e0c0b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -124,16 +124,11 @@ static inline int check_which(__u32 which)
 static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
 {
 #if defined(CONFIG_MEDIA_CONTROLLER)
-	if (sd->entity.graph_obj.mdev) {
-		if (pad >= sd->entity.num_pads)
-			return -EINVAL;
-		return 0;
-	}
+	if (sd->entity.num_pads)
+		return pad >= sd->entity.num_pads ? -EINVAL : 0;
 #endif
 	/* allow pad 0 on subdevices not registered as media entities */
-	if (pad > 0)
-		return -EINVAL;
-	return 0;
+	return pad ? -EINVAL : 0;
 }

 static int check_cfg(__u32 which, struct v4l2_subdev_pad_config *cfg)
