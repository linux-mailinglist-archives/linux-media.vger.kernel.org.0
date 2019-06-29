Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBC9A5AB22
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfF2M7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:59:47 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:50069 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726716AbfF2M7r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:59:47 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id hCxChYuuzAOfNhCxGhflpW; Sat, 29 Jun 2019 14:59:46 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.3] v4l2-subdev: fix regression in check_pad()
Message-ID: <f20fffad-c2e4-1aed-1644-4ed2c8395173@xs4all.nl>
Date:   Sat, 29 Jun 2019 14:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfE3mYWs/eSNYg05rCKsQ/bnHgsQWIYl3LyoUzqagwbDbgmp+bIw8JdcOjh1Aa/8oKpwg6/vx0pYU6EePl4bcGhFh/izSlAr9gZaarZc+NfzNawJ0t3xe
 usmEAu/BaLsKHoSR/f+ATfIziUMp7MKwLdnhpfHdWX1W6HkFca8iPOZMLSv0+GiBSbMLI/YIZWjttAt6osZsZQn7G2BBcDydnHsSGpiX9V/CrGBLJDI9pd5R
 C/eZrGOkszwUTdtQ4SpsWEPTuw6SH2n0OjLHuUT5RSurl4GzcydFepTsr45rpzpT
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
