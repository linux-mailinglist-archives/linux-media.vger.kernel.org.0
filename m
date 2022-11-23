Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F03A636152
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 15:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237108AbiKWOR2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 09:17:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237374AbiKWORZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 09:17:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05A631F81
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 06:17:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 71621B81FF5
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 14:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67210C433C1;
        Wed, 23 Nov 2022 14:17:18 +0000 (UTC)
Message-ID: <a0db73c5-fd80-cce5-8669-0b26128304e7@xs4all.nl>
Date:   Wed, 23 Nov 2022 15:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Handling of colorspace fields in image format
Content-Language: en-US
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <CAPY8ntC4XjhTC5jQd6OZF_6WsS+BLUD1QbxzjKTTLdiSgO2VzA@mail.gmail.com>
 <9afffc8e-00b0-fdfc-93fa-3fcb648ad5e6@xs4all.nl>
 <CAPY8ntBz10bc1c119EZVSCM2E0iw5Nt6jbeAb3x_6qDNOuRO5g@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAPY8ntBz10bc1c119EZVSCM2E0iw5Nt6jbeAb3x_6qDNOuRO5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On 23/11/2022 10:52, Dave Stevenson wrote:
> Hi Hans
> Thanks for the response
> 
> On Tue, 22 Nov 2022 at 14:23, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 11/22/22 12:49, Dave Stevenson wrote:
>>> Hi Hans
>>>
>>> This has come about from a discussion with Laurent over how to handle
>>> colorspace fields, whether a particular configuration is legitimate,
>>> and whether we're looking at the correct behaviour. You're the go-to
>>> person for that sort of question :-)
>>>
>>> - CAPTURE queue (in this case on a M2M ISP device, but that doesn't
>>> really matter).
>>> - Limited colorspace options are available from the device (standard
>>> SDTV BT601 limited range, HDTV BT709 limited range, and JPEG's BT601
>>> full range).
>>> - VIDIOC_ENUM_FMT flags returns V4L2_FMT_FLAG_CSC_COLORSPACE. It does
>>> NOT set V4L2_FMT_FLAG_CSC_XFER_FUNC, V4L2_FMT_FLAG_CSC_YCBCR_ENC, or
>>> V4L2_FMT_FLAG_CSC_QUANTIZATION. (No documentation saying this isn't
>>> permitted, and why have 4 flags if they aren't independent).
>>> - VIDIOC_S_FMT called with V4L2_PIX_FMT_FLAG_SET_CSC set.
>>>
>>> Which colourspace fields from the format are applied?
>>
>> If only V4L2_FMT_FLAG_CSC_COLORSPACE is set, then only the colorspace
>> field from userspace is applied. Which is almost certainly wrong
>> sicne switching between the colorspace that is received and the
>> colorspace that you want requires complex calculations. And if a
>> device can do that, then it certainly can also allow userspace to
>> override the other three colorimetry fields. So setting just
>> V4L2_FMT_FLAG_CSC_COLORSPACE makes no sense.
>>
>> The V4L2_FMT_FLAG_CSC_* flags come into play if you want to allow
>> userspace to convert the colorimetry of the captured data to another
>> colorimetry. That's often not supported, the colorimetry fields are
>> just filled in based on what was captured. Often there is some support
>> to convert between YCBCR/RGB/QUANTIZATION settings, so such devices
>> can set V4L2_FMT_FLAG_CSC_YCBCR_ENC | V4L2_FMT_FLAG_CSC_QUANTIZATION
>> if they want. This is typically a 3x3 matrix + one vector in the hardware.
> 
> It's not a simple 3x3 matrix + vector in this case, and selection is
> via an enum.
> 
>>>
>>> The driver is saying that only colorspace is supported, and [1] says that
>>
>> No, the driver is saying that it can convert to another colorspace
>> if requested to do so by userspace, while leaving the xfer function,
>> ycbcr encoding and quantization range untouched.
>> That's a highly unlikely situation, and I think it's likely a bug
>> in the driver. It should probably drop that flag.
>>
>>> "The first is the colorspace identifier (enum v4l2_colorspace) which
>>> defines the chromaticities, the default transfer function, the default
>>> Y’CbCr encoding and the default quantization method"
>>> so we have all 4 parameters defined via the defaults.
>>> I read it that the ycbcr_enc, quantization, and xfer_func values
>>> passed in should be ignored and replaced with the "default" values
>>> derived from the colorspace value (use V4L2_MAP_XFER_FUNC_DEFAULT,
>>> V4L2_MAP_YCBCR_ENC_DEFAULT, and V4L2_MAP_QUANTIZATION_DEFAULT)
>>> Is this a valid interpretation?
>>
>> No. First of all, unless one or more of the V4L2_FMT_FLAG_CSC_* flags are
>> set, the driver fills in these fields, and ignores what userspace
>> filled in. So [1] just describes what these fields mean, and that you
>> can use those DEFAULT macros to determine what the actual xfer_func,
>> ycbcr_enc or quantization is if the driver left those values to 0.
>>
>> What those defaults are depends on the chosen colorspace field.
>>
>>>
>>> Confusion comes from [2] for V4L2_PIX_FMT_FLAG_SET_CSC saying:
>>
>> So if this flag is set, then userspace can ask the driver to convert
>> to specific colorimetry settings, if supported (what is supported is
>> indicated by the V4L2_FMT_FLAG_CSC_* flags returned by ENUM_FMT).
>>
>>> "If the colorimetry field (colorspace, xfer_func, ycbcr_enc, hsv_enc
>>> or quantization) is set to *_DEFAULT, then that colorimetry setting
>>> will remain unchanged from what was received."
>>> What is "received" in this case?
>>
>> This relates to a capture device, so for an m2m device that means
>> the colorimetry that userspace set for the output device.
> 
> This is an ISP. What is the xfer function, ycbcr encoding and
> quantization range settings for a Bayer image with colorspace
> V4L2_COLORSPACE_RAW? The documentation does not work for that use
> case.

It wasn't clear to me that this was specifically about raw Bayer.

For COLORSPACE_RAW there really is no xfer_func as such. V4L2_MAP_XFER_FUNC_DEFAULT
sets it to NONE for COLORSPACE_RAW, but the documentation for NONE is a bit
misleading since it says that that means linear. For COLORSPACE_RAW is really
means custom. I am wondering if a XFER_FUNC_RAW or _CUSTOM should be introduced
to properly signal this. I am certainly not opposed to that.

The YCbCr encoding will be DEFAULT for Bayer (really, it is ignored, but
it is good practice to set it to DEFAULT in that case). If you DO convert
to YCbCr, then it has to follow some standard.

The quantization range will be FULL for Bayer. Again, something else doesn't
make sense for Bayer.

> 
>> A typical m2m device will just copy the colorimetry fields from output
>> to capture format. If you want it to act as a csc device, then it will
>> have to advertise the relevant V4L2_FMT_FLAG_CSC_* flags.
>>
>> If it converts between different pixelformats (e.g. RGB to YUV), then
>> there is an implicit csc step, of course, but the result will be using
>> the default rules.
>>
>> Example: userspace passes a frame with V4L2_COLORSPACE_BT2020, V4L2_XFER_FUNC_709,
>> V4L2_YCBCR_ENC_DEFAULT (n/a) and V4L2_QUANTIZATION_FULL_RANGE, and wants
>> a NV12 back. The colorimetry for that will be V4L2_COLORSPACE_BT2020,
>> V4L2_XFER_FUNC_709, V4L2_YCBCR_ENC_BT2020 (most likely, hw limitations might
>> force this to 709 or 601) and V4L2_QUANTIZATION_LIM_RANGE.
>>
>> So this is all determined by the driver, not userspace.
> 
> Now I pass a Bayer frame of colorspace V4L2_COLORSPACE_RAW,
> V4L2_XFER_FUNC_NONE in, and ask for NV12 out. What properties do I use
> on that NV12 frame please?

Bayer frame:
colorspace = RAW
xfer_func = NONE
ycbcr_enc = DEFAULT (ignored)
quantization = FULL

NV12 frame:
colorspace = RAW
xfer_func = NONE
ycbcr_enc = 601 for SDTV, 709 for !SDTV
quantization = LIMITED

> Likewise I could pass in RGB with colorspace V4L2_COLORSPACE_SRGB and
> ask for NV12 out that is to be JPEG encoded. How do I ensure I get the
> appropriate conversion parameters?

RGB frame:
colorspace = SRGB
xfer_func = SRGB
ycbcr_enc = DEFAULT (ignored)
quantization = FULL

JPEG frame:
colorspace = SRGB
xfer_func = SRGB
ycbcr_enc = 601
quantization = FULL

(or you just set colorspace to COLORSPACE_JPEG, which is a shorthand for this)

> 
>>> There is no inherent colourspace for
>>> the device as it is M2M, so does that come back to being default
>>> anyway, or reflecting the OUTPUT queue which might be Bayer and have
>>> no range? Can we still ignore them all as the relevant
>>> V4L2_FMT_FLAG_CSC_* flags aren't set?
>>>
>>> Hopefully you can enlighten us.
>>
>> So, to recap:
>>
>> 1) for an m2m device it is userspace that provides the colorimetry data
>>    in the output format. For a regular capture device it is the
>>    video receiver driver that sets it (typically determined by the
>>    sensor driver or a video receiver driver).
>> 2) Implicit CSC conversion might take place when converting between
>>    different pixel formats. Typically this will only affect the
>>    ycbcr_enc and quantization fields, since that's usually all that
>>    is supported. The colorspace and xfer_func fields are just copied
>>    from the output pixelformat.
> 
> As above, RGB or Bayer in to NV12 out makes no sense to copy
> colorspace and xfer_func fields from the output pixelformat.

Perhaps you should describe what your m2m device actually *does*? Ah,
you did at the end :-)

The m2m devices that I know just convert RGB to YUV or JPEG (or vice
versa). In both cases the colorspace and transfer function remain as-is,
so copying these two values from the output pixelformat is the right
thing to do. It's all you have, nobody else can fill it in. Typically
userspace will get this information from the sensor or video receiver.

The process of converting a raw Bayer sensor to something presentable
is something an ISP does, but the end result will have to specify
valid (i.e. non-raw) colorspace/xfer_func/ycbcr_enc/quantization colorimetry,
otherwise nobody will know how to interpret the resulting frame.

> 
>> 3) If explicit CSC conversion is signaled by the driver by setting
>>    V4L2_FMT_FLAG_CSC_* flags, then userspace can request specific
>>    colorimetry results, and the hardware will be configured by the
>>    driver to give that result.
> 
> Not all results are achievable by all hardware.
> So do we set all the V4L2_FMT_FLAG_CSC_* flags and just alter the bits
> of the request that aren't supported in a way that the driver sees
> fit?
> 
>> I hope this helps!
> 
> Sort of, but only by muddying the waters.
> 
> Flipping it around then and asking how it should be implemented.
> 
> We have configuration for the ISP output path that produces 3
> configurations regardless of input format corresponding to:
> - V4L2_COLORSPACE_JPEG, V4L2_YCBCR_ENC_601, V4L2_XFER_FUNC_SRGB,
> V4L2_QUANTIZATION_FULL_RANGE

Here you request the JPEG pixelformat, so that forces the output
configuration. So no need for any V4L2_FMT_FLAG_CSC_* for this pixel
format.

> - V4L2_COLORSPACE_SMPTE170M, V4L2_YCBCR_ENC_601, V4L2_XFER_FUNC_709,
> V4L2_QUANTIZATION_LIM_RANGE
> - V4L2_COLORSPACE_REC709, V4L2_YCBCR_ENC_709, V4L2_XFER_FUNC_709,
> V4L2_QUANTIZATION_LIM_RANGE

Here you select a YUV format (NV12 or similar). The default colorimetry
it should select is V4L2_COLORSPACE_SMPTE170M for SDTV and V4L2_COLORSPACE_REC709
otherwise. If you want to allow this to be overridden, then that can be
done with V4L2_FMT_FLAG_CSC_COLORSPACE for these two pixelformats.

If userspace selects an unsupported colorspace, then the driver should
pick a supported colorspace (almost certainly you would want V4L2_COLORSPACE_REC709).

> (Those should be the the same ycbcr_enc, xfer_func, and quantization
> as the defaults for each colourspace, and translate to the normal
> values used for JPEG, SDTV, and HDTV respectively).
> These are selected by enum and we are not proposing on adding any extra ones.
> 
> The input is going to be Bayer with colorspace set to
> V4L2_COLORSPACE_RAW. There are therefore no colorspace parameters that
> can be "left unchanged" or otherwise copied from the OUPTUT queue.

So this device does a lot more than most m2m devices: it apparently knows
how to convert the raw Bayer data to a proper picture.

I do wonder if it is really converting correctly to these three colorimetry
permutations. If you give it a test pattern, then save the result in these
three format and visually compare them, do they look identical? If the ISP
really does convert correctly, then you should not be able to see any
difference. There is a clear difference between V4L2_XFER_FUNC_SRGB and
V4L2_XFER_FUNC_709 when seen side-by-side. Note that the difference between
V4L2_COLORSPACE_SMPTE170M and V4L2_COLORSPACE_REC709 is pretty much impossible
to see, they are very close.

> 
> What is the correct way to allow userspace selection of those options
> within V4L2?
> 
> 
> Looking at the datasheet for TC358743 (a chip that your company
> maintains the driver for), it can convert the incoming HDMI to 6
> output formats via the VI_REP register field VOUT_COLOR_SEL:
> RGB Full
> RGB Limited
> 601YCbCr Full
> 601 YCbCr Limited
> 709 YCbCr Full
> 709 YCbCr Limited
> This is the same situation as for our ISP - configuration through an
> enum even though there is more complexity underneath.
> 
> Currently the driver always selects 601 YCbCr Limited for UYVY output,
> or RGB Full for 24bpp RGB.
> If we were to extend that driver in a non-media controller system to
> allow selection of the converted colourspace, how do we enforce those
> restrictions?

That chip can only convert between RGB/YUV and limited/full quantization
range. The colorspace and xfer_func will be whatever is received in the AVI
InfoFrame of the HDMI video stream. So this is a typical example of a
3x3 matrix + vector implementation. It comes with a bunch of default matrixes
(hardcoded and selected by the enum), but I believe it can be manually set
as well. I can't remember if that's done in this driver.

If you want to manually set ycbcr_enc and quantization, then you would
have to specify V4L2_FMT_FLAG_CSC_YCBCR_ENC | V4L2_FMT_FLAG_CSC_QUANTIZATION.

> Under MC you get a similar set of flags in V4L2_MBUS_FRAMEFMT_SET_CSC
> for struct v4l2_mbus_framefmt and set_format, and
> V4L2_SUBDEV_MBUS_CODE_CSC_* in struct v4l2_subdev_mbus_code_enum, so
> the same principles will presumably apply there too.

Yes.

> (I'm noting that the tc358743 driver currently doesn't bother setting
> any of the colorimetry fields other than colorspace).

I believe the driver predates these additional colorimetry fields.

Regards,

	Hans

> 
> Thanks
>   Dave
> 
>> Regards,
>>
>>         Hans
>>
>>>
>>> Cheers
>>>   Dave
>>>
>>> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/colorspaces-defs.html
>>> [2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-v4l2.html#v4l2-pix-fmt-flag-set-csc
>>

