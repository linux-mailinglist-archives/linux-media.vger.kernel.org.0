Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE0B5B0591
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 15:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiIGNpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 09:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbiIGNpg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 09:45:36 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B394D3A482
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 06:44:47 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id e20so20443688wri.13
        for <linux-media@vger.kernel.org>; Wed, 07 Sep 2022 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date;
        bh=qvMkdXxB9XF3BP/V27nkxV6dEnEowp0IO7DwwY/3xg4=;
        b=f+dXohNJTKXYhlI7kZ1MfrfqvryuCHJk/RKM91G7vMKPNJT735c+ZIo5Eetx5y1RmM
         RYWfHJ7M5OQFQHrc5fX5UKj6VpkMRMrk57jxj3xH232ced2+qpF4X1no/+84w321FJQa
         T/bFXBNnH3O/szhIe4wTVqbHA4aTUWZ+80HEhgnTVHsbVOBXWUO+Umqt7kSfjvNxCam2
         2ufqd71ENQIOFF8bAajxCaPTaA3l03n/Gw94T8N3AYbiNNAi+SDZoKRQDkUeRARFbchd
         m5Jc5ic6mfrq93BjMxapZuQrJDy/Nxj8SIxJQRea6YlB1LTxvWRsnBjXfkB1D1eKkx8x
         IWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qvMkdXxB9XF3BP/V27nkxV6dEnEowp0IO7DwwY/3xg4=;
        b=C23VYlApkQjf1D8WOfgysiQruUIburvLKrUaGpSzzkQhqEBEJPtRHHT7y2JttugxuQ
         WapnBj3PryXWn4djYhjdird/jaD94GVBd4av/FwBHIdkN/c9Sc3mYEx7NirVxZz9LW/0
         D4Piw2XawpMptKGvW5qknQxfWTGICZvWcnY8VcQxSJjNvb1/aHpue/lmipLsJLH774m3
         9ZfLl2k8QMXAk+G+4netF80oJDz9rWkVv6BlALMYNuLZsNcXuTk/spiGnoz0n2XhV2+a
         iPOXKFphfL4Re0nhojZsfYGgzGyEj5orgjtdXV2Ex66SjE3yZzg4gei0gMPwN4Lps4PQ
         8KeA==
X-Gm-Message-State: ACgBeo1GCnq3hhIh7I4yUmAjDA6Bq5nnBL3uQK7BXw+8UTtKmBFjEy2U
        ACOaVbDEa6N3ghNozywctx9gWDN2G6s=
X-Google-Smtp-Source: AA6agR4JyiISLqfeL51lBIuv0wJZILQbLlelh/hbi8/bLlH0xVKK9BiWyDQv7My1cYml3IiQ5QcKcw==
X-Received: by 2002:a5d:6088:0:b0:228:e0c5:da5f with SMTP id w8-20020a5d6088000000b00228e0c5da5fmr2078254wrt.221.1662558286090;
        Wed, 07 Sep 2022 06:44:46 -0700 (PDT)
Received: from [192.168.2.202] (pd9ea37fb.dip0.t-ipconnect.de. [217.234.55.251])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b003a608d69a64sm26816797wmo.21.2022.09.07.06.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 06:44:45 -0700 (PDT)
Message-ID: <db44a24b-2a9a-6682-4825-eedc4ecb1340@gmail.com>
Date:   Wed, 7 Sep 2022 15:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To:     sakari.ailus@linux.intel.com
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        tian.shu.qiu@intel.com, tomi.valkeinen@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220825190351.3241444-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] ipu3-imgu: Fix NULL pointer dereference in active
 selection access
Content-Language: en-US
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20220825190351.3241444-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, 25 Aug 2022 22:03:51 +0300, Sakari Ailus  wrote:
> What the IMGU driver did was that it first acquired the pointers to active
> and try V4L2 subdev state, and only then figured out which one to use.
> 
> The problem with that approach and a later patch (see Fixes: tag) is that
> as sd_state argument to v4l2_subdev_get_try_crop() et al is NULL, there is
> now an attempt to dereference that.
> 
> Fix this.

Thank you for this fix, this however only addresses
imgu_subdev_get_selection(), but the issue is also present in
imgu_subdev_set_selection(). I assume that a similar fix is needed for that.
I've added a diff for that below. Feel free to squash that into your patch or
let me know if I should submit this separately.

Regards,
Max

---
  drivers/staging/media/ipu3/ipu3-v4l2.c | 25 ++++++++++++-------------
  1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 2234bb8d48b3..079f2635c70d 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -223,10 +223,9 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
                                      struct v4l2_subdev_selection *sel)
  {
         struct imgu_device *imgu = v4l2_get_subdevdata(sd);
-       struct imgu_v4l2_subdev *imgu_sd = container_of(sd,
-                                                       struct imgu_v4l2_subdev,
-                                                       subdev);
-       struct v4l2_rect *rect, *try_sel;
+       struct imgu_v4l2_subdev *imgu_sd =
+               container_of(sd, struct imgu_v4l2_subdev, subdev);
+       struct v4l2_rect *rect;

         dev_dbg(&imgu->pci_dev->dev,
                  "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
@@ -238,22 +237,22 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,

         switch (sel->target) {
         case V4L2_SEL_TGT_CROP:
-               try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
-               rect = &imgu_sd->rect.eff;
+               if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
+                       rect = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
+               else
+                       rect = &imgu_sd->rect.eff;
                 break;
         case V4L2_SEL_TGT_COMPOSE:
-               try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
-               rect = &imgu_sd->rect.bds;
+               if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
+                       rect = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
+               else
+                       rect = &imgu_sd->rect.bds;
                 break;
         default:
                 return -EINVAL;
         }

-       if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
-               *try_sel = sel->r;
-       else
-               *rect = sel->r;
-
+       *rect = sel->r;
         return 0;
  }

--
2.37.3

