Return-Path: <linux-media+bounces-32781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1550EABBE99
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B6DA7A9C10
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA77279793;
	Mon, 19 May 2025 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hGWTzcpV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A39279337
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660033; cv=none; b=fxk7kCyfO8S0bk9eo9wziSeNIjz/bETy7j6S8obui/7ehjGFfeBVLAiyE3GUtNPMvn7aiZbMexkSK0LySCdM4ud0ZcVhraNurkoSThvk5PjuTWp+C/qkK7nrwtdLfoH5k11Lpwb5lXdzTGzD6epHMNOy5KrDW0nlJ9Ub+SVuICI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660033; c=relaxed/simple;
	bh=Z18geQt9kV2VcJFHiPdFKzqytEL4qtUxvCaBl6E04q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfYXXwtxxq6GrylNK5vLfAuqnDlSvhFlmYR35kJ4GI2MmGytHDB72LP3SvNMZ5VGCitjEMAKJDTuZS+CuDNR9tWAMLH7SJl9Mk+kowTip7TNzTEyDncf8c0elXRYfHedJG0FFzehwRuJXk0976cldYFtcdhTp1Bex/y2CYfblcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hGWTzcpV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81887446;
	Mon, 19 May 2025 15:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747660008;
	bh=Z18geQt9kV2VcJFHiPdFKzqytEL4qtUxvCaBl6E04q0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hGWTzcpVRhLJ5fiD60pDeX15SyAw34CCYiXuyG31JLyTt1pzk+jGm0Z964w3W4eVV
	 Sq2GFxpPk5khwYYuz0zkaE3j2XbpnjdUWlELve7KglZszn/+KZuD35SnmERSMnZtg+
	 DIdp5AGNKjsCAM2rbDOOM/116ZJVysVuRQsQ/EQg=
Message-ID: <dad4c6dd-b3d6-4a2e-a418-fe311cf871c4@ideasonboard.com>
Date: Mon, 19 May 2025 14:07:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-4-dan.scally@ideasonboard.com>
 <aB4OfjTGktdu7Yos@tom-desktop>
 <i4g722z6a3i4xnre6b3ne76w7acxcjy2j3ztww4ndvabungeuw@ovecz2bqewr6>
 <3eb69cea-b511-412e-a126-ce246c2491df@bp.renesas.com>
 <CA+V-a8v4rw9dD04obCT+gs1Npas3nopeC+xjU0bcBYCNwrqzhA@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <CA+V-a8v4rw9dD04obCT+gs1Npas3nopeC+xjU0bcBYCNwrqzhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi again

On 15/05/2025 12:59, Lad, Prabhakar wrote:
> Hi Tommaso,
>
> On Fri, May 9, 2025 at 4:41 PM Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
>> Hi Jacopo,
>> Thanks for your comment.
>>
>> On 09/05/25 16:50, Jacopo Mondi wrote:
>>> Hi Tommaso
>>>
>>> On Fri, May 09, 2025 at 04:17:34PM +0200, Tommaso Merciai wrote:
>>>> Hi Daniel,
>>>> Thanks for your patch.
>>>>
>>>> On Tue, May 06, 2025 at 01:50:12PM +0100, Daniel Scally wrote:
>>>>> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>>>>
>>>>> The rzg2l_csi2_calc_mbps() function currently tries to calculate the
>>>>> link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
>>>>> of the remote subdevice. Switch the function to v4l2_get_link_freq()
>>>>> which correctly targets V4L2_CID_LINK_FREQ before falling back on
>>>>> V4L2_CID_PIXEL_RATE if the former is unavailable.
>>>>>
>>>>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>>> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>>> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>>>> ---
>>>>> Changes in v4:
>>>>>
>>>>>      - Used separate s64 variable as return value for v4l2_get_link_freq()
>>>>>        and as the mbps variable for do_div() to avoid compilation warnings.
>>>>>
>>>>> Changes in v3:
>>>>>
>>>>>      - Fixed mbps sign
>>>>>
>>>>> Changes in v2:
>>>>>
>>>>>      - None
>>>>>
>>>>>    .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 +++++++++----------
>>>>>    1 file changed, 12 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>>>> index 9243306e2aa9..8870c2cb8104 100644
>>>>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>>>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>>>> @@ -282,28 +282,25 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
>>>>>      const struct rzg2l_csi2_format *format;
>>>>>      const struct v4l2_mbus_framefmt *fmt;
>>>>>      struct v4l2_subdev_state *state;
>>>>> -   struct v4l2_ctrl *ctrl;
>>>>>      u64 mbps;
>>>>> -
>>>>> -   /* Read the pixel rate control from remote. */
>>>>> -   ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
>>>>> -   if (!ctrl) {
>>>>> -           dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
>>>>> -                   source->name);
>>>>> -           return -EINVAL;
>>>>> -   }
>>>>> +   s64 ret;
>>>>>
>>>>>      state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
>>>>>      fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
>>>>>      format = rzg2l_csi2_code_to_fmt(fmt->code);
>>>>>      v4l2_subdev_unlock_state(state);
>>>>>
>>>>> -   /*
>>>>> -    * Calculate hsfreq in Mbps
>>>>> -    * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>>>>> -    */
>>>>> -   mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
>>>>> -   do_div(mbps, csi2->lanes * 1000000);
>>>>> +   /* Read the link frequency from remote subdevice. */
>>>>> +   ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
>>>>> +                            csi2->lanes);
> div needs to be updated in v4l2_get_link_freq() as below so that when
> subdev has only V4L2_CID_PIXEL_RATE we get the correct value.
>
>          ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> -                                csi2->lanes);
> +                                csi2->lanes * 2);
>
>>>>> +   if (ret < 0) {
>>>>> +           dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
>>>>> +                   source->name);
>>>>> +           return -EINVAL;
>>>>> +   }
>>>>> +
>>>>> +   mbps = ret;
>>>>> +   do_div(mbps, 1000000);
>>>>>
>>>>>      return mbps;
>>>>>    }
>>>> I tested this series with an imx219 image sensor connected to the CSI-2
>>>> RX IP of RZ/G3E:
>>>>
>>>> Some notes:
>>>>
>>>>    - pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
>>>>    - hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>>>>
>>>> Then hsfreq should be:
>>> The old code seems to call 'hsfreq' the per-lane bandwidth
>>>
>>> -      * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>>>
>>> And not the per-lane frequency as the variable name and the commit message
>>> suggest
>>>
>>>>    - hsfreq = link_freq * 2
>>> if that's the intention, due to CSI-2 DDR, then you're correct I
>>> think ?
>>>
>>> Seeing that also Laurent has reviewed it, and Prabhakar tested it, I wonder
>>> if we all have missed that the original code didn't have a / 2
> I agree the orignal code missed a / 2. I think we need a fixup patch
> (so that this can be backported) and then this change to use
> v4l2_get_link_freq().
>
>>> Dan, did you ever notice issues during your testing ?
>>>
>>> Also, with the introduction of 15f0035bfd0a ("media: v4l: Support
>>> passing media pad argument to v4l2_get_link_freq()") it's probably now
>>> better to pass the source's pad to v4l2_get_link_freq() ?
>>>
>>>> Please correct me if I'm wrong.
>>>>
>>>>
>>>> After applying this series. I'm getting the following issue testing the
>>>> imx219 sensor with SRGGB8_1X8 and SGRBG10_1X10 color format.
>>> Does the error go away if you multiply the link_freq by 2 ?
>> Yes the error goes away on my side using:
>>
>> mbps = ret * 2;
>>
> I tested the above with an OV5645 sensor and see no issues.


Actually, I'm missing something here. Tommaso, you're using an imx219? So V4L2_CID_LINK_FREQ should 
be 456000000 and V4L2_CID_PIXEL_RATE should be 182400000. The original calculation (assuming a 
10-bit format and 2 lanes) is 182400000 * 10 / (2 * 1000000) = 912. That's double the link frequency 
in Mbps (456) so I understand that the / 2 was missing...but the function with this patch applied 
should return 456 already...so if that's the correct value then I'm confused as to why you'd be 
seeing errors and why multiplying the return by 2 would fix them. What am I missing?


Thanks

Dan

> Cheers,
> Prabhakar

