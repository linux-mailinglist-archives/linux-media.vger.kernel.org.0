Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25CF2B93D1
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 14:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgKSNnk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 08:43:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgKSNnk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 08:43:40 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F96C0613CF;
        Thu, 19 Nov 2020 05:43:40 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id D8C411F4585F
Subject: Re: [PATCH v5 1/7] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
From:   Helen Koike <helen.koike@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        hiroh@chromium.org, nicolas@ndufresne.ca, Brian.Starkey@arm.com,
        kernel@collabora.com, narmstrong@baylibre.com,
        linux-kernel@vger.kernel.org, frkoenig@chromium.org,
        mjourdan@baylibre.com, stanimir.varbanov@linaro.org
References: <20200804192939.2251988-1-helen.koike@collabora.com>
 <20200804192939.2251988-2-helen.koike@collabora.com>
 <20201002194935.GB1131147@chromium.org>
 <f5c9f7cd-f8e1-0671-b4d9-8ed79917b0aa@collabora.com>
 <20201119054544.GA590258@chromium.org>
 <bec73ecd-e420-ccb3-810c-c98ba93dfdab@collabora.com>
Message-ID: <c506f6d5-de80-9992-0316-89d35ad93d34@collabora.com>
Date:   Thu, 19 Nov 2020 10:43:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <bec73ecd-e420-ccb3-810c-c98ba93dfdab@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/19/20 7:08 AM, Helen Koike wrote:
> Hi Tomasz,
> 
> On 11/19/20 2:45 AM, Tomasz Figa wrote:
>> On Sat, Nov 14, 2020 at 11:21:26AM -0300, Helen Koike wrote:
>>> Hi Tomasz,
>>>
>>> On 10/2/20 4:49 PM, Tomasz Figa wrote:
>>>> Hi Helen,
>>>>
>>>> On Tue, Aug 04, 2020 at 04:29:33PM -0300, Helen Koike wrote:
>> [snip]
>>>>> +static void v4l_print_ext_pix_format(const void *arg, bool write_only)
>>>>> +{
>>>>> +	const struct v4l2_ext_pix_format *pix = arg;
>>>>> +	unsigned int i;
>>>>> +
>>>>> +	pr_cont("type=%s, width=%u, height=%u, format=%c%c%c%c, modifier %llx, field=%s, colorspace=%d, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
>>>>> +		prt_names(pix->type, v4l2_type_names),
>>>>> +		pix->width, pix->height,
>>>>> +		(pix->pixelformat & 0xff),
>>>>> +		(pix->pixelformat >>  8) & 0xff,
>>>>> +		(pix->pixelformat >> 16) & 0xff,
>>>>> +		(pix->pixelformat >> 24) & 0xff,
>>>>> +		pix->modifier, prt_names(pix->field, v4l2_field_names),
>>>>> +		pix->colorspace, pix->ycbcr_enc,
>>>>> +		pix->quantization, pix->xfer_func);
>>>>> +	for (i = 0; i < VIDEO_MAX_PLANES && pix->plane_fmt[i].sizeimage; i++)
>>>>
>>>> This is going to print 8 lines every time. Maybe we could skip 0-sized
>>>> planes or something?
>>>
>>> I'm already checking pix->plane_fmt[i].sizeimage in the loop, it shouldn't
>>> print 8 lines every time.
>>>
>>
>> Oops, how could I not notice it. Sorry for the noise.
>>
>> [snip]
>>>>> +int v4l2_ext_pix_format_to_format(const struct v4l2_ext_pix_format *e,
>>>>> +				  struct v4l2_format *f, bool mplane_cap,
>>>>> +				  bool strict)
>>>>> +{
>>>>> +	const struct v4l2_plane_ext_pix_format *pe;
>>>>> +	struct v4l2_plane_pix_format *p;
>>>>> +	unsigned int i;
>>>>> +
>>>>> +	memset(f, 0, sizeof(*f));
>>>>> +
>>>>> +	/*
>>>>> +	 * Make sure no modifier is required before doing the
>>>>> +	 * conversion.
>>>>> +	 */
>>>>> +	if (e->modifier && strict &&
>>>>
>>>> Do we need the explicit check for e->modifier != 0 if we have to check for
>>>> the 2 specific values below anyway?
>>>
>>> We don't, since DRM_FORMAT_MOD_LINEAR is zero.
>>>
>>> But I wanted to make it explicit we don't support modifiers in this conversion.
>>> But I can remove this check, no problem.
>>>
>>
>> Yes, please. I think the double checking is confusing for the reader.
> 
> ok.
> 
>>
>>>>
>>>>> +	    e->modifier != DRM_FORMAT_MOD_LINEAR &&
>>>>> +	    e->modifier != DRM_FORMAT_MOD_INVALID)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	if (!e->plane_fmt[0].sizeimage && strict)
>>>>> +		return -EINVAL;
>>>>
>>>> Why is this incorrect?
>>>
>>> !sizeimage for the first plane means that there are no planes in ef.
>>> strict is true if the result for the conversion should be returned to userspace
>>> and it is not some internal handling.
>>>
>>> So if there are no planes, we would return an incomplete v4l2_format struct
>>> to userspace.
>>>
>>> But this is not very clear, I'll improve this for the next version.
>>>
>>
>> So I can see 2 cases here:
>>
>> 1) Userspace gives ext struct and driver accepts legacy.
>>
>> In this case, the kernel needs to adjust the structure to be correct.
>> -EINVAL is only valid if
>>
>> "The struct v4l2_format type field is invalid or the requested buffer type not supported."
>>
>> as per the current uAPI documentation.
>>
>> 2) Driver gives ext struct and userspace accepts legacy.
>>
>> If at this point we get a struct with no planes, that sounds like a
>> driver bug, so rather than signaling -EINVAL to the userspace, we should
>> probably WARN()?
>>
>> Or am I getting something wrong? :)
> 
> Make sense, I'll restructure this for the next version.
> 
>>
>> [snip]
>>>>> +{
>>>>> +	const struct v4l2_plane_pix_format *p;
>>>>> +	struct v4l2_plane_ext_pix_format *pe;
>>>>> +	unsigned int i;
>>>>> +
>>>>> +	memset(e, 0, sizeof(*e));
>>>>> +
>>>>> +	switch (f->type) {
>>>>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>>>>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>>>>> +		e->width = f->fmt.pix.width;
>>>>> +		e->height = f->fmt.pix.height;
>>>>> +		e->pixelformat = f->fmt.pix.pixelformat;
>>>>> +		e->field = f->fmt.pix.field;
>>>>> +		e->colorspace = f->fmt.pix.colorspace;
>>>>> +		if (f->fmt.pix.flags)
>>>>> +			pr_warn("Ignoring pixelformat flags 0x%x\n",
>>>>> +				f->fmt.pix.flags);
>>>>
>>>> Would it make sense to print something like video node name and/or function
>>>> name to explain where this warning comes from?
>>>
>>> I would need to update the function to receive this information, I can try but
>>> I'm not sure if it is worthy.
>>>
>>
>> I don't have a strong opinion on this, so maybe let's see if others have
>> any comments.
>>
>>>>
>>>>> +		e->ycbcr_enc = f->fmt.pix.ycbcr_enc;
>>>>> +		e->quantization = f->fmt.pix.quantization;
>>>>
>>>> Missing xfer_func?
>>>
>>> Yes, thanks for catching this.
>>>
>>>>
>>>>> +		e->plane_fmt[0].bytesperline = f->fmt.pix.bytesperline;
>>>>> +		e->plane_fmt[0].sizeimage = f->fmt.pix.sizeimage;
>>>>
>>>> This doesn't look right. In the ext API we expected the planes to describe
>>>> color planes, which means that bytesperline needs to be computed for planes
>>>>> = 1 and sizeimage replaced with per-plane sizes, according to the
>>>>> pixelformat.
>>>
>>> Ack.
>>>
>>> Just to be clear, even if we are using a planar format that isn't a V4L2_PIX_FMT_*M
>>> variant, we should describe every plane separatly.
>>>
>>> For instance, if V4L2_PIX_FMT_YVU420 is being used, then f->fmt.pix.bytesperline
>>> will have data, and we need to calculate bytesperline for all 3 planes, so we'll fill
>>> out:
>>>
>>> f->plane_fmt[0].bytesperline = f->fmt.pix.bytesperline;
>>> f->plane_fmt[1].bytesperline = f->fmt.pix.bytesperline / hdiv;
>>> f->plane_fmt[2].bytesperline = f->fmt.pix.bytesperline / hdiv;
>>>
>>> I'll update this for the next version.
>>>
>>
>> Yes. This basically gives us a unified representation across all
>> pixelformats and allows userspace to handle them in a uniform way, as
>> opposed to current uAPI.
> 
> Right, I already updated this in my wip branch for next version.
> 
>>
>> [snip]
>>>>> +		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>>>>> +			e->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>>>> +		else
>>>>> +			e->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>>>>> +
>>>>> +		for (i = 0; i < VIDEO_MAX_PLANES; i++) {
>>>>> +			pe = &e->plane_fmt[i];
>>>>> +			p = &f->fmt.pix_mp.plane_fmt[i];
>>>>> +			pe->bytesperline = p->bytesperline;
>>>>> +			pe->sizeimage = p->sizeimage;
>>>>> +		}
>>>>
>>>> Same here. A blind copy is not enough. For non-M formats, the plane
>>>> parameters need to be filled according to the pixelformat.
>>>
>>>
>>> Right, following the idea above, we need a different handling if we
>>> aren't using a M-variant of the pixelformat, and we also need to
>>> convert the pixelformat from the M-variant to non-M-variant.
>>>
>>> I'll also need to save that the original format was a
>>> M-variant or not, so I can convert it back as expected.
>>
>> I'm still reading the rest of the series, so it might be answered
>> already, but did we decide to do anything about the pixelformat codes
>> themselves? If both M and non-M variants would be allowed with the new
>> API, then I guess there isn't anything to save, because the original
>> format would be preserved?
> 
> I was working with the idea that M-variants wouldn't be allowed.
> But then, we have cases where non-M-variant don't exist, such as:
> 
> V4L2_PIX_FMT_YVU422M
> V4L2_PIX_FMT_YVU444M
> 
> (at least, I couldn't find non-M-variant equivalent for those)
> 
> But actually, I don't think we formally decided this (and it seems
> easier to implement if both are allowed).
> 
> Should we allow both variants in the Ext API ?

I see 3 options:

1) Ext API doesn't accept M-variants and return -EINVAL.

    But this doesn't seem to be the v4l2 way, where we avoid returning
    errors and try to adjust to what we think it is better.

    At the same time, this could allow us, in a very remote hypothetical
    future situation, to remove the M-variants from the kernel when/if
    the old API gets obsolete.

    Future ENUM_EXT_FMT won't enumerate M-variants in this option.

2) Ext API accept M-variants without normalization.

    The driver can receive both variants, and need to handle both as
    equivalents, i.e. if (V4L2_PIX_FMT_YUV420M || V4L2_PIX_FMT_YUV420)

    Both can be returned to userspace.

    Future ENUM_EXT_FMT can enumerate M-variants in this option.

3) Ext API accept M-variants with normalization.

    If userspace uses V4L2_PIX_FMT_YUV420M, the framework converts
    to V4L2_PIX_FMT_YUV420 before passing it to the driver.

    Only V4L2_PIX_FMT_YUV420 is sent back to userspace (even if userspace
    used the M variant, the kernel normalizes it, which is a similar behavior
    when userspace try to use a non-supported resolution and the kernel
    adjusts it).

    (we could also leave this pixelformat normalization to the driver,
    but I don't see a reason to that)

    Future ENUM_EXT_FMT won't enumerate M-variants in this option.



I'm leaning towards option 3, please let me know your thoughts.

Thanks
Helen


> 
> Thanks
> Helen
> 
>>
>>>
>>> I'll change this and submit for review.
>>>
>>
>> Cool, thanks.
>>
>> Best regards,
>> Tomasz
>>
