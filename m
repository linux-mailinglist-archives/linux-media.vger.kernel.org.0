Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5C67A9946
	for <lists+linux-media@lfdr.de>; Thu, 21 Sep 2023 20:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjIUSMl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Sep 2023 14:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjIUSM1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Sep 2023 14:12:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1620D7B45D;
        Thu, 21 Sep 2023 10:37:09 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D701C433A9;
        Thu, 21 Sep 2023 07:11:16 +0000 (UTC)
Message-ID: <5292ce53-643e-44f0-b2cc-cb66efee9712@xs4all.nl>
Date:   Thu, 21 Sep 2023 09:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 09/11] media: uapi: Add
 V4L2_CID_USER_IMX_ASRC_RATIO_MOD control
Content-Language: en-US, nl
To:     Shengjiu Wang <shengjiu.wang@gmail.com>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
        tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, alsa-devel@alsa-project.org,
        linuxppc-dev@lists.ozlabs.org
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com>
 <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl>
 <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/09/2023 08:55, Shengjiu Wang wrote:
> On Wed, Sep 20, 2023 at 6:19 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 20/09/2023 11:32, Shengjiu Wang wrote:
>>> The input clock and output clock may not be the accurate
>>> rate as the sample rate, there is some drift, so the convert
>>> ratio of i.MX ASRC module need to be changed according to
>>> actual clock rate.
>>>
>>> Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control for user to
>>> adjust the ratio.
>>>
>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>> ---
>>>  Documentation/userspace-api/media/v4l/control.rst | 5 +++++
>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 1 +
>>>  include/uapi/linux/v4l2-controls.h                | 1 +
>>>  3 files changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
>>> index 4463fce694b0..2bc175900a34 100644
>>> --- a/Documentation/userspace-api/media/v4l/control.rst
>>> +++ b/Documentation/userspace-api/media/v4l/control.rst
>>> @@ -318,6 +318,11 @@ Control IDs
>>>      depending on particular custom controls should check the driver name
>>>      and version, see :ref:`querycap`.
>>>
>>> +.. _v4l2-audio-imx:
>>> +
>>> +``V4L2_CID_USER_IMX_ASRC_RATIO_MOD``
>>> +    sets the rasampler ratio modifier of i.MX asrc module.
>>
>> rasampler -> resampler (I think?)
>>
>> This doesn't document at all what the type of the control is or how to interpret it.
>>
>>> +
>>>  Applications can enumerate the available controls with the
>>>  :ref:`VIDIOC_QUERYCTRL` and
>>>  :ref:`VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` ioctls, get and set a
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> index 8696eb1cdd61..16f66f66198c 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> @@ -1242,6 +1242,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>       case V4L2_CID_COLORIMETRY_CLASS:        return "Colorimetry Controls";
>>>       case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:               return "HDR10 Content Light Info";
>>>       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:      return "HDR10 Mastering Display";
>>> +     case V4L2_CID_USER_IMX_ASRC_RATIO_MOD:                  return "ASRC RATIO MOD";
>>
>> Let's stay consistent with the other control names:
>>
>> "ASRC Ratio Modifier"
>>
>> But if this is a driver specific control, then this doesn't belong here.
>>
>> Driver specific controls are defined in the driver itself, including this
>> description.
>>
>> Same for the control documentation: if it is driver specific, then that
>> typically is documented either in a driver-specific public header, or
>> possibly in driver-specific documentation (Documentation/admin-guide/media/).
>>
>> But is this imx specific? Wouldn't other similar devices need this?
> 
> It is imx specific.

Why? I'm not opposed to this, but I wonder if you looked at datasheets of
similar devices from other vendors: would they use something similar?

And the very short description you gave in the commit log refers to input
and output clock: how would userspace know those clock frequencies? In
other words, what information does userspace need in order to set this
control correctly? And is that information actually available? How would
you use this control?

I don't really understand how this is supposed to be used.

> 
> Does this mean that I need to create a header file in include/uapi/linux
> folder to put this definition?  I just hesitate if this is necessary.

Yes, put it there. There are some examples of this already:

include/uapi/linux/aspeed-video.h
include/uapi/linux/max2175.h

> 
> There is folder Documentation/userspace-api/media/drivers/ for drivers
> Should this document in this folder, not in the
> Documentation/admin-guide/media/?

Yes, you are correct. For the headers above, the corresponding documentation
is in:

Documentation/userspace-api/media/drivers/aspeed-video.rst
Documentation/userspace-api/media/drivers/max2175.rst

So you have some examples as reference.

Frankly, what is in admin-guide and in userspace-api is a bit random, it
probably could use a cleanup.

Regards,

	Hans

> 
> Best regards
> Wang shengjiu
>>
>>>       default:
>>>               return NULL;
>>>       }
>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>> index c3604a0a3e30..b1c319906d12 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -162,6 +162,7 @@ enum v4l2_colorfx {
>>>  /* The base for the imx driver controls.
>>>   * We reserve 16 controls for this driver. */
>>>  #define V4L2_CID_USER_IMX_BASE                       (V4L2_CID_USER_BASE + 0x10b0)
>>> +#define V4L2_CID_USER_IMX_ASRC_RATIO_MOD     (V4L2_CID_USER_IMX_BASE + 0)
>>>
>>>  /*
>>>   * The base for the atmel isc driver controls.
>>
>> Regards,
>>
>>         Hans

