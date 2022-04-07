Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41AB94F7549
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 07:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240847AbiDGFYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 01:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237688AbiDGFYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 01:24:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A360119250
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 22:22:35 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43FB0499;
        Thu,  7 Apr 2022 07:22:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649308952;
        bh=lm/82HxnVmCNwXVBuAC6hsJxDHCU91WqEz8pMnWVOaA=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=utwN4zqIPxiNnNIk5pM4K+PNe9+AHJoK3yEbdz1uJB42lKgDWSIYIeox1kGu1lEzp
         SVbGMPh8rXKKL2Jyh/i4QarLjw5SrToTrj8EBlUttNNq0ShTkf+d09M8ToYtdYnOum
         6z7S2ySk3t6uJUh956dB0nTWVESrSLVYTgzDJPUk=
Message-ID: <8790d418-a00d-8c7b-6798-4c0dc6f42087@ideasonboard.com>
Date:   Thu, 7 Apr 2022 08:22:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 3/8] media: subdev: add v4l2_subdev_get_pad_* helpers
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
 <20220324080030.216716-4-tomi.valkeinen@ideasonboard.com>
 <b3276db7-05fc-a79e-3fd7-10d25feb5bc6@xs4all.nl>
 <e4bb1a30-67ba-30b1-63fb-52b0724b9612@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <e4bb1a30-67ba-30b1-63fb-52b0724b9612@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/04/2022 16:52, Hans Verkuil wrote:
> 
> 
> On 06/04/2022 15:36, Hans Verkuil wrote:
>>
>>
>> On 24/03/2022 09:00, Tomi Valkeinen wrote:
>>> The subdev state is now used for both try and active cases. We should
>>> rename v4l2_subdev_get_try_* helpers to v4l2_subdev_get_pad_*, but due
>>> to the size of that change lets add temporary wrapper helpers which can
>>> be used in drivers that support active state.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>
>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>>> ---
>>>   include/media/v4l2-subdev.h | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>> index 1bbe4383966c..b9587a265b32 100644
>>> --- a/include/media/v4l2-subdev.h
>>> +++ b/include/media/v4l2-subdev.h
>>> @@ -1042,6 +1042,16 @@ v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
>>>   	return &state->pads[pad].try_compose;
>>>   }
>>>   
>>> +/* Temprary helpers until v4l2_subdev_get_try_* functions have been renamed */
>>> +#define v4l2_subdev_get_pad_format(sd, state, pad) \
>>> +	v4l2_subdev_get_try_format(sd, state, pad)
>>> +
>>> +#define v4l2_subdev_get_pad_crop(sd, state, pad) \
>>> +	v4l2_subdev_get_try_crop(sd, state, pad)
>>> +
>>> +#define v4l2_subdev_get_pad_compose(sd, state, pad) \
>>> +	v4l2_subdev_get_try_compose(sd, state, pad)
> 
> Actually, wouldn't it be better to rename the try helpers and
> add #defines for the old names?
> 
> I think I prefer that.

Yes, that's a good idea.

  Tomi
