Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A2E24F8B1
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 11:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbgHXIsj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 04:48:39 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:46553 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729562AbgHXIsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 04:48:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id A89WkNWELuuXOA89Xk1ZZz; Mon, 24 Aug 2020 10:48:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598258912; bh=U+UKD2M5L4d+rQwV3ZzL6kBBVtsgrvXj47dxjXBxdcQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jtASFwlTwZYLlwCHd4szs3I/vu8eyXKp2oMCfMymsMBI3sIrg+MTH55yA/1XYtJvz
         OOZ7mcW/Fy4xbTu2gcrwVUCpL7+IhPV63kgWl0EiHRvt+Nlb19sCrSQh+hR7COcSmQ
         UBWcw4BdTeRt49LOIlC4Vrd+es+2VB7KtnN/43uxUbkSnm90cUmSzvr8ZlCGPMepXa
         qtT3V1HKoGGGxPtHue8qg6b8NITgoFyAqtazF12rzRTtAvOwGvT2MDPx9YcocVuzt6
         OtOGsTwlCz9p8hlQtrk6HjkdkHcdKXfPQUerztqr56Unp8IbwAc7PsZLjarijiabTI
         04EcyQ/j0lEwg==
Subject: Re: [PATCH 2/2] media: uvcvideo: Convey full ycbcr colorspace
 information to v4l2
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Adam Goode <agoode@google.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200823012134.3813457-1-agoode@google.com>
 <20200823012134.3813457-2-agoode@google.com>
 <20200823145417.GC6002@pendragon.ideasonboard.com>
 <20200823150822.GD6002@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5a2882e5-c029-dde7-c6ff-bd6f57aa7850@xs4all.nl>
Date:   Mon, 24 Aug 2020 10:48:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823150822.GD6002@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNjW8k5Ep56kUjnrAk9PZkRvhDE3TfjIDPvRFpcC068nMWPmsBtnv25m3+b2g0XfD0ImNrbFZipY3Kac6nZLkxD7y1QOUGvIfvYaZcODmi66A58/VLH6
 hZjMWQzYMOnqm87cPKCGmaeXGX9jhEd6+zIvnBCUSOl8hZRRJVtIcPPca5VoqFqIUZC4hG+cxDazR9rTKk8+P4Q3QmqeC+bQLbxk4ujzZ2m9Oa8r1OXR1uHd
 553KE1u10zkSWUPBy/Rwr3wGlOmV0iCmgnDwju8Cxk4FNCpLa3rH1LiKXikYX6i+FW8moXGiS8sAuWQX252JRocqleE0U91BEsT3EwbqddEkskhheq9tou1E
 hG+/Pk8fwB8z9LPbDFP6cpmXzrK7eKm1VuxNsORhDsbFcIBUc20pCvur1geUoWLfYJfFu5fWXP/Ra1o+Ic/ORyUQCvQwWQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/08/2020 17:08, Laurent Pinchart wrote:
> Hi Adam,
> 
> (CC'ing Hans Verkuil)
> 
> On Sun, Aug 23, 2020 at 05:54:24PM +0300, Laurent Pinchart wrote:
>> Hi Adam,
>>
>> Thank you for the patch.
>>
>> On Sat, Aug 22, 2020 at 09:21:34PM -0400, Adam Goode wrote:
>>> The Color Matching Descriptor has been present in USB cameras since
>>> the original version of UVC, but it has never been fully used
>>> in Linux.
>>>
>>> This change informs V4L2 of all of the critical colorspace parameters:
>>> colorspace (called "color primaries" in UVC), transfer function
>>> (called "transfer characteristics" in UVC), ycbcr encoding (called
>>> "matrix coefficients" in UVC), and quantization, which is always
>>> LIMITED for UVC, see section 2.26 in USB_Video_FAQ_1.5.pdf.
>>
>> Isn't this valid for MJPEG only though ? There's not much else we can do
>> though, as UVC cameras don't report quantization information. Shouldn't
>> we however reflect this in the commit message, and in the comment below,
>> to state that UVC requires limited quantization range for MJPEG, and
>> while it doesn't explicitly specify the quantization range for other
>> formats, we can only assume it should be limited as well ?
>>
>> The code otherwise looks good to me.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Please let me know if you'd like to address the above issue.
>>
>>> The quantization is the most important improvement for this patch,
>>> because V4L2 will otherwise interpret MJPEG as FULL range. Web browsers
>>> such as Chrome and Firefox already ignore V4L2's quantization for USB
>>> devices and use the correct LIMITED value, but other programs such
>>> as qv4l2 will incorrectly interpret the output of MJPEG from USB
>>> cameras without this change.
>>>
>>> Signed-off-by: Adam Goode <agoode@google.com>
>>> ---
>>>  drivers/media/usb/uvc/uvc_driver.c | 52 +++++++++++++++++++++++++++---
>>>  drivers/media/usb/uvc/uvc_v4l2.c   |  6 ++++
>>>  drivers/media/usb/uvc/uvcvideo.h   |  5 ++-
>>>  3 files changed, 58 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>> index 431d86e1c94b..c0c81b089b7d 100644
>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>> @@ -248,10 +248,10 @@ static struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
>>>  	return NULL;
>>>  }
>>>  
>>> -static u32 uvc_colorspace(const u8 primaries)
>>> +static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
>>>  {
>>> -	static const u8 colorprimaries[] = {
>>> -		0,
>>> +	static const enum v4l2_colorspace colorprimaries[] = {
>>> +		V4L2_COLORSPACE_DEFAULT,  /* Unspecified */
>>>  		V4L2_COLORSPACE_SRGB,
>>>  		V4L2_COLORSPACE_470_SYSTEM_M,
>>>  		V4L2_COLORSPACE_470_SYSTEM_BG,
>>> @@ -262,7 +262,43 @@ static u32 uvc_colorspace(const u8 primaries)
>>>  	if (primaries < ARRAY_SIZE(colorprimaries))
>>>  		return colorprimaries[primaries];
>>>  
>>> -	return 0;
>>> +	return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
>>> +}
>>> +
>>> +static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_characteristics)
>>> +{
>>> +	static const enum v4l2_xfer_func xfer_funcs[] = {
>>> +		V4L2_XFER_FUNC_DEFAULT,  /* Unspecified */
>>> +		V4L2_XFER_FUNC_709,
>>> +		V4L2_XFER_FUNC_709,      /* BT.470-2 M */
>>> +		V4L2_XFER_FUNC_709,      /* BT.470-2 B, G */
>>> +		V4L2_XFER_FUNC_709,      /* SMPTE 170M */
>>> +		V4L2_XFER_FUNC_SMPTE240M,
>>> +		V4L2_XFER_FUNC_NONE,     /* Linear (V = Lc) */
>>> +		V4L2_XFER_FUNC_SRGB,
>>> +	};
>>> +
>>> +	if (transfer_characteristics < ARRAY_SIZE(xfer_funcs))
>>> +		return xfer_funcs[transfer_characteristics];
>>> +
>>> +	return V4L2_XFER_FUNC_DEFAULT;  /* Reserved */
>>> +}
>>> +
>>> +static enum v4l2_ycbcr_encoding uvc_ycbcr_enc(const u8 matrix_coefficients)
>>> +{
>>> +	static const enum v4l2_ycbcr_encoding ycbcr_encs[] = {
>>> +		V4L2_YCBCR_ENC_DEFAULT,  /* Unspecified */
>>> +		V4L2_YCBCR_ENC_709,
>>> +		V4L2_YCBCR_ENC_601,      /* FCC */
> 
> I may have spoken a bit too fast. Doesn't FCC differ from BT.601 ?
> According to https://en.wikipedia.org/wiki/Talk%3AYCbCr, the former uses
> 
>  E'Y = 0.59 E'G + 0.11 E'B + 0.30 E'R
>  E'PB = – 0.331 E'G + 0.500 E'B – 0.169 E'R
>  E'PR = – 0.421 E'G – 0.079 E'B + 0.500 E'R
> 
> while the latter uses
> 
>  E'Y = 0.587 E'G + 0.114 E'B + 0.299 E'R
>  E'PB = – 0.331 E'G + 0.500 E'B – 0.169 E'R
>  E'PR = – 0.419 E'G – 0.081 E'B + 0.500 E'R
> 
> We seems to be missing FCC in the V4L2 color space definitions.

The differences between the two are minuscule. Add to that that NTSC 1953
hasn't been in use for many decades. So I have no plans to add another YCC
encoding for this. I'll double check this in a few weeks time when I have
access to a better book on colorimetry.

> 
>>> +		V4L2_YCBCR_ENC_601,      /* BT.470-2 B, G */
>>> +		V4L2_YCBCR_ENC_601,      /* SMPTE 170M */
>>> +		V4L2_YCBCR_ENC_SMPTE240M,
>>> +	};
>>> +
>>> +	if (matrix_coefficients < ARRAY_SIZE(ycbcr_encs))
>>> +		return ycbcr_encs[matrix_coefficients];
>>> +
>>> +	return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
>>>  }
>>>  
>>>  /* Simplify a fraction using a simple continued fraction decomposition. The
>>> @@ -704,6 +740,14 @@ static int uvc_parse_format(struct uvc_device *dev,
>>>  		}
>>>  
>>>  		format->colorspace = uvc_colorspace(buffer[3]);
>>> +		format->xfer_func = uvc_xfer_func(buffer[4]);
>>> +		format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
>>> +		/* All USB YCbCr encodings use LIMITED range as of UVC 1.5.
>>> +		 * This is true even for MJPEG, which V4L2 otherwise assumes to
>>> +		 * be FULL.
>>> +		 * See section 2.26 in USB_Video_FAQ_1.5.pdf.

Not true. I checked the FAQ: the FAQ describes what happens when a video renderer
incorrectly interprets the decoded JPEG color components as limited range instead
of full range (which they are to be JPEG compliant). JPEG always encodes YCbCr as
full range.

>>> +		 */
>>> +		format->quantization = V4L2_QUANTIZATION_LIM_RANGE;

What about sRGB? That uses full range.

Regards,

	Hans

>>>  
>>>  		buflen -= buffer[0];
>>>  		buffer += buffer[0];
>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>> index 7f14096cb44d..79daf46b3dcd 100644
>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>> @@ -279,6 +279,9 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>>>  	fmt->fmt.pix.sizeimage = probe->dwMaxVideoFrameSize;
>>>  	fmt->fmt.pix.pixelformat = format->fcc;
>>>  	fmt->fmt.pix.colorspace = format->colorspace;
>>> +	fmt->fmt.pix.xfer_func = format->xfer_func;
>>> +	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
>>> +	fmt->fmt.pix.quantization = format->quantization;
>>>  
>>>  	if (uvc_format != NULL)
>>>  		*uvc_format = format;
>>> @@ -315,6 +318,9 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
>>>  	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
>>>  	fmt->fmt.pix.sizeimage = stream->ctrl.dwMaxVideoFrameSize;
>>>  	fmt->fmt.pix.colorspace = format->colorspace;
>>> +	fmt->fmt.pix.xfer_func = format->xfer_func;
>>> +	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
>>> +	fmt->fmt.pix.quantization = format->quantization;
>>>  
>>>  done:
>>>  	mutex_unlock(&stream->mutex);
>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>> index 6ab972c643e3..6508192173dd 100644
>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>> @@ -370,7 +370,10 @@ struct uvc_format {
>>>  	u8 type;
>>>  	u8 index;
>>>  	u8 bpp;
>>> -	u8 colorspace;
>>> +	enum v4l2_colorspace colorspace;
>>> +	enum v4l2_xfer_func xfer_func;
>>> +	enum v4l2_ycbcr_encoding ycbcr_enc;
>>> +	enum v4l2_quantization quantization;
>>>  	u32 fcc;
>>>  	u32 flags;
>>>  
> 

