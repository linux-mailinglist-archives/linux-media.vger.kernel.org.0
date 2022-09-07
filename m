Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1D1F5B0F20
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 23:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiIGV3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 17:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiIGV3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 17:29:05 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4955C04EA
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 14:29:04 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e16so3327613wrx.7
        for <linux-media@vger.kernel.org>; Wed, 07 Sep 2022 14:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Yap2AvD5D0pIjSKbsBK8jMZ0slZVrJL6K+mCYKZ6hyk=;
        b=JIdCYEC9NE67owaeraWCLidt4Xi2yvaAxNtmmxdpEHxpgBvR9foFA9/jfPyTC4/kDN
         xk/pkV0oFx1+o0pH4OTEKsQE67sE+T8+Fu63BWkG1eNoz1nbnW4rS3qXMWltIjdvsa8g
         ueF0J1iUdRbuPYNN/suqj31/zBi9Se35cuqzCxSbmWrUuDXTBfF7Qkr9kYhIsUx39ZjY
         JSW7gORAnfcK3U9Gmedc3lrzaijyYN+oEl7M2m1liZXIRml91ATDBfv8tvX+pIOdnESQ
         vhY6Qtvas9nqP6/vngE0pd+ZeWa5qzJcnhU43TTVDEvXqRUn6+VrpWW8Wy24o3Kdmzk5
         k3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Yap2AvD5D0pIjSKbsBK8jMZ0slZVrJL6K+mCYKZ6hyk=;
        b=RmFHjPS6TkKXRWR8b/oHdni574brr9avD8mYR2EibvzEzcTRUro+Pb/HROOWhMMLGT
         Y7b2X/L+0IvRkHCTm21LXuFOPVzD+SzzHaNTKSlR4GOLPB8eZ4TIN3GF26FdB/V8IL6p
         gWp3ToufgaFCO61o3dXp4HhMsaQJiGi4X08hhRYfFlA5BS6jE80XRsyVpiKY0MEeL/jm
         6ZRMV6mCrBSXccK7IF2Q9iwO1nX03mCrBgnwyNs3D4cShFYM4ZsEXZAfoEoKs//Z1LEo
         ICSjMvhnnFF8CXfU6wsamWuCHou9LtirKvkVn0Mx56OZZf0djBl0vzlHhmaRNc35w93W
         1Tcw==
X-Gm-Message-State: ACgBeo3HTI+gAW9Kdpmec5DRDtQ4XDXkdE0NjNRzUA1iXraroRBEwSy9
        Khz8am6OquFcN0U6tUV6hHYP1qnXyNk=
X-Google-Smtp-Source: AA6agR7wcDFkVd/39M8w7A8KcQFWf46eSBkwM4jeZPxiFjB0pUP2h4J5tEXVK/apfN6bc5PuXSMqoA==
X-Received: by 2002:a5d:4904:0:b0:228:610b:296d with SMTP id x4-20020a5d4904000000b00228610b296dmr3443827wrq.450.1662586142893;
        Wed, 07 Sep 2022 14:29:02 -0700 (PDT)
Received: from [10.22.0.7] ([37.120.217.162])
        by smtp.gmail.com with ESMTPSA id k35-20020a05600c1ca300b003a3170a7af9sm312366wms.4.2022.09.07.14.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 14:29:02 -0700 (PDT)
Message-ID: <f5ad22cc-4ac7-219f-c52f-ea5edc6be6c3@gmail.com>
Date:   Wed, 7 Sep 2022 23:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/1] ipu3-imgu: Fix NULL pointer dereference in active
 selection access
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, tian.shu.qiu@intel.com,
        tomi.valkeinen@ideasonboard.com
References: <20220825190351.3241444-1-sakari.ailus@linux.intel.com>
 <db44a24b-2a9a-6682-4825-eedc4ecb1340@gmail.com>
 <YxjsUhnZIyvmwGyR@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <YxjsUhnZIyvmwGyR@pendragon.ideasonboard.com>
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

On 9/7/22 21:09, Laurent Pinchart wrote:
> Hi Max,
> 
> On Wed, Sep 07, 2022 at 03:44:44PM +0200, Maximilian Luz wrote:
>> On Thu, 25 Aug 2022 22:03:51 +0300, Sakari Ailus  wrote:
>>> What the IMGU driver did was that it first acquired the pointers to active
>>> and try V4L2 subdev state, and only then figured out which one to use.
>>>
>>> The problem with that approach and a later patch (see Fixes: tag) is that
>>> as sd_state argument to v4l2_subdev_get_try_crop() et al is NULL, there is
>>> now an attempt to dereference that.
>>>
>>> Fix this.
>>
>> Thank you for this fix, this however only addresses
>> imgu_subdev_get_selection(), but the issue is also present in
>> imgu_subdev_set_selection(). I assume that a similar fix is needed for that.
>> I've added a diff for that below. Feel free to squash that into your patch or
>> let me know if I should submit this separately.
> 
> This looks like a problem indeed. I'll let Sakari decide what he wants
> to do. Adding wrappers along the lines of
> 
> static struct v4l2_rect *
> imgu_subdev_get_crop(struct imgu_v4l2_subdev *sd,
> 		     struct v4l2_subdev_state *sd_state, unsigned int pad,
> 		     enum v4l2_subdev_format_whence which)
> {
> 	if (which == V4L2_SUBDEV_FORMAT_TRY)
> 		return v4l2_subdev_get_try_crop(&imgu_sd->subdev, sd_state, pad);
> 	else
> 		return &imgu_sd->rect.eff;
> }
> 
> (same for the selection rectangle) and using them through the code may
> help.

Thanks! That does seem a good idea. I'll include those in the patch.

Regards,
Max

> 
>> ---
>>    drivers/staging/media/ipu3/ipu3-v4l2.c | 25 ++++++++++++-------------
>>    1 file changed, 12 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
>> index 2234bb8d48b3..079f2635c70d 100644
>> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
>> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
>> @@ -223,10 +223,9 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
>>                                        struct v4l2_subdev_selection *sel)
>>    {
>>           struct imgu_device *imgu = v4l2_get_subdevdata(sd);
>> -       struct imgu_v4l2_subdev *imgu_sd = container_of(sd,
>> -                                                       struct imgu_v4l2_subdev,
>> -                                                       subdev);
>> -       struct v4l2_rect *rect, *try_sel;
>> +       struct imgu_v4l2_subdev *imgu_sd =
>> +               container_of(sd, struct imgu_v4l2_subdev, subdev);
>> +       struct v4l2_rect *rect;
>>
>>           dev_dbg(&imgu->pci_dev->dev,
>>                    "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
>> @@ -238,22 +237,22 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
>>
>>           switch (sel->target) {
>>           case V4L2_SEL_TGT_CROP:
>> -               try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
>> -               rect = &imgu_sd->rect.eff;
>> +               if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
>> +                       rect = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
>> +               else
>> +                       rect = &imgu_sd->rect.eff;
>>                   break;
>>           case V4L2_SEL_TGT_COMPOSE:
>> -               try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
>> -               rect = &imgu_sd->rect.bds;
>> +               if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
>> +                       rect = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
>> +               else
>> +                       rect = &imgu_sd->rect.bds;
>>                   break;
>>           default:
>>                   return -EINVAL;
>>           }
>>
>> -       if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
>> -               *try_sel = sel->r;
>> -       else
>> -               *rect = sel->r;
>> -
>> +       *rect = sel->r;
>>           return 0;
>>    }
>>
> 
