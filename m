Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 442255AB28
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 15:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfF2NAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 09:00:15 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:50069 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726716AbfF2NAP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 09:00:15 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id hCxehYv5RAOfNhCxihfluL; Sat, 29 Jun 2019 15:00:14 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2 for v5.3] v4l2-subdev: fix regression in check_pad()
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <9885852d-d77e-7bfe-80d4-c4ff20443529@xs4all.nl>
Date:   Sat, 29 Jun 2019 15:00:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfARQPSnX6ld+x/Tlq42MnUMm6xDWAaNcyf9K068xw7T0R4cXxGz2cdwlPR2qabRVm12WCaxSc/ubHPGK7jA1jBMD4B6h+b8Tnud/4ZYOgPMPSxhOCF6s
 Tv8LQ+omQNF4e5mc75B8OYDcjvlU5sry0hXGQ6rvvOjDul1DmogLrJuB6iOYypU8GVG/y3Q0leaPkIyqqJOWJfD3s7PMDW3ty7ddlsYCLCEHWKacywitioo3
 DXGR1giMiKlKTsUXqitrOr0rrcpW8hrGiY3Rgenq+7XaU8UBWFPahLopEsLL9rUq
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
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes in v2:

- Don't change the coding style, just fix the bug.
---
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 21fb90d66bfc..25c73c13cc7e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -124,7 +124,7 @@ static inline int check_which(__u32 which)
 static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
 {
 #if defined(CONFIG_MEDIA_CONTROLLER)
-	if (sd->entity.graph_obj.mdev) {
+	if (sd->entity.num_pads) {
 		if (pad >= sd->entity.num_pads)
 			return -EINVAL;
 		return 0;
