Return-Path: <linux-media+bounces-32778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD789ABBE3F
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF2787AE165
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 12:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B715277816;
	Mon, 19 May 2025 12:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SzMtRY3N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A36620C00E
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747658886; cv=none; b=N+jh1qmgeRUUcxZY2EvLx6FSh64dmgF9gf76ACKxpElpXL6xyyq+hBfGeaEAS4zWIxCrf4ZkdTMVpLvHpdyB+OCcO9HLADbHobT0RuJm80HsWj79xDIIBAP4SNko6m8JRqODp8F25RizDfdP634DxX/eVBEb0bgeM93bAXDUrh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747658886; c=relaxed/simple;
	bh=igubFTuiPkbS6JSKLxGsWich1XGl828jfLaDUGg0i/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H04Jm/7cu1jr53/thlljlvEfGJ2jJn+1YTCxpeKR8pF3Owe0aoRynWQj6HftWxjSTdAkpsqXJkK5WW5eeJo7rCSAe+g3ckRYmKA5y9Etxz27E1WwtNbFWdDMucfDSSqJMysM8sQ7zPTcIGaDku/rsXNQ+Sx4gKbpYYsWKHWayb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SzMtRY3N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4A41446;
	Mon, 19 May 2025 14:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747658862;
	bh=igubFTuiPkbS6JSKLxGsWich1XGl828jfLaDUGg0i/s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SzMtRY3Nktc/zM2zVMlgWIL560Ck5gJPTqnTJoEOhfVS9HIgYxRxGj01DyGMO7dz8
	 7jK1hu5b+rzFiqxUgZtdjeTdw/dgoh6XTT2MIQw3bSV3yIaTca3Yy2zwixZmYxYylm
	 SOtls38KPr61m4bC2hqvoFdLN4ej9uM+FY2NkHh8=
Message-ID: <ee50afef-7836-4e44-8cf7-007f4d4b6b1b@ideasonboard.com>
Date: Mon, 19 May 2025 13:47:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-4-dan.scally@ideasonboard.com>
 <aB4OfjTGktdu7Yos@tom-desktop>
 <i4g722z6a3i4xnre6b3ne76w7acxcjy2j3ztww4ndvabungeuw@ovecz2bqewr6>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <i4g722z6a3i4xnre6b3ne76w7acxcjy2j3ztww4ndvabungeuw@ovecz2bqewr6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 09/05/2025 15:50, Jacopo Mondi wrote:
> Hi Tommaso
>
> On Fri, May 09, 2025 at 04:17:34PM +0200, Tommaso Merciai wrote:
>> Hi Daniel,
>> Thanks for your patch.
>>
>> On Tue, May 06, 2025 at 01:50:12PM +0100, Daniel Scally wrote:
>>> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>>
>>> The rzg2l_csi2_calc_mbps() function currently tries to calculate the
>>> link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
>>> of the remote subdevice. Switch the function to v4l2_get_link_freq()
>>> which correctly targets V4L2_CID_LINK_FREQ before falling back on
>>> V4L2_CID_PIXEL_RATE if the former is unavailable.
>>>
>>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>> ---
>>> Changes in v4:
>>>
>>> 	- Used separate s64 variable as return value for v4l2_get_link_freq()
>>> 	  and as the mbps variable for do_div() to avoid compilation warnings.
>>>
>>> Changes in v3:
>>>
>>> 	- Fixed mbps sign
>>>
>>> Changes in v2:
>>>
>>> 	- None
>>>
>>>   .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 +++++++++----------
>>>   1 file changed, 12 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>> index 9243306e2aa9..8870c2cb8104 100644
>>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>> @@ -282,28 +282,25 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
>>>   	const struct rzg2l_csi2_format *format;
>>>   	const struct v4l2_mbus_framefmt *fmt;
>>>   	struct v4l2_subdev_state *state;
>>> -	struct v4l2_ctrl *ctrl;
>>>   	u64 mbps;
>>> -
>>> -	/* Read the pixel rate control from remote. */
>>> -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
>>> -	if (!ctrl) {
>>> -		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
>>> -			source->name);
>>> -		return -EINVAL;
>>> -	}
>>> +	s64 ret;
>>>
>>>   	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
>>>   	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
>>>   	format = rzg2l_csi2_code_to_fmt(fmt->code);
>>>   	v4l2_subdev_unlock_state(state);
>>>
>>> -	/*
>>> -	 * Calculate hsfreq in Mbps
>>> -	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>>> -	 */
>>> -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
>>> -	do_div(mbps, csi2->lanes * 1000000);
>>> +	/* Read the link frequency from remote subdevice. */
>>> +	ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
>>> +				 csi2->lanes);
>>> +	if (ret < 0) {
>>> +		dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
>>> +			source->name);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	mbps = ret;
>>> +	do_div(mbps, 1000000);
>>>
>>>   	return mbps;
>>>   }
>> I tested this series with an imx219 image sensor connected to the CSI-2
>> RX IP of RZ/G3E:
>>
>> Some notes:
>>
>>   - pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
>>   - hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>>
>> Then hsfreq should be:
> The old code seems to call 'hsfreq' the per-lane bandwidth
>
> -	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>
> And not the per-lane frequency as the variable name and the commit message
> suggest
>
>>   - hsfreq = link_freq * 2
> if that's the intention, due to CSI-2 DDR, then you're correct I
> think ?
>
> Seeing that also Laurent has reviewed it, and Prabhakar tested it, I wonder
> if we all have missed that the original code didn't have a / 2
>
> Dan, did you ever notice issues during your testing ?
I don't recall any, but this patch has been in my tree for a long time, so possibly hidden by it.
>
> Also, with the introduction of 15f0035bfd0a ("media: v4l: Support
> passing media pad argument to v4l2_get_link_freq()") it's probably now
> better to pass the source's pad to v4l2_get_link_freq() ?


Ah thanks for pointing that out - the _Generic() magic had hidden it so I hadn't noticed that it had 
changed.

>
>> Please correct me if I'm wrong.
>>
>>
>> After applying this series. I'm getting the following issue testing the
>> imx219 sensor with SRGGB8_1X8 and SGRBG10_1X10 color format.
> Does the error go away if you multiply the link_freq by 2 ?
>
> Thanks
>    j
>
>>
>> [  947.305876] rzg2l-cru 16000000.video: Invalid MB address 0xe8bf8300 (out of range)
>> [  947.305876] rzg2l-cru 16000000.video: Invalid MB address 0xe8bf8300 (out of range)
>> [  947.339165] rzg2l-cru 16000000.video: Invalid MB address 0xe8c9e900 (out of range)
>> [  947.339165] rzg2l-cru 16000000.video: Invalid MB address 0xe8c9e900 (out of range)
>>
>>
>> I'm suspecting that this could be related to this formula.
>> Let me know what do you think.
>>
>> Thanks in advance!
>>
>> Tested using:
>>
>> root@smarc-rzg3e:~# media-ctl -p
>> Media controller API version 6.15.0
>>
>> Media device information
>> ------------------------
>> driver          rzg2l_cru
>> model           renesas,r9a09g047-cru
>> serial
>> bus info        platform:16000000.video
>> hw revision     0x0
>> driver version  6.15.0
>>
>> Device topology
>> - entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
>>              type V4L2 subdev subtype Unknown flags 0
>>              device node name /dev/v4l-subdev0
>>          pad0: Sink
>>                  [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>>                  <- "imx219 0-0010":0 [ENABLED,IMMUTABLE]
>>          pad1: Source
>>                  [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>>                  -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]
>>
>> - entity 4: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
>>              type V4L2 subdev subtype Unknown flags 0
>>              device node name /dev/v4l-subdev1
>>          pad0: Sink
>>                  [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>>                  <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
>>          pad1: Source
>>                  [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>>                  -> "CRU output":0 [ENABLED,IMMUTABLE]
>>
>> - entity 7: imx219 0-0010 (1 pad, 1 link, 0 routes)
>>              type V4L2 subdev subtype Sensor flags 0
>>              device node name /dev/v4l-subdev2
>>          pad0: Source
>>                  [stream:0 fmt:SGRBG10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
>>                   crop.bounds:(8,8)/3280x2464
>>                   crop:(1008,760)/1280x960]
>>                  -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]
>>
>> - entity 17: CRU output (1 pad, 1 link)
>>               type Node subtype V4L flags 0
>>               device node name /dev/video0
>>          pad0: Sink
>>                  <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]
>>
>> # IMX219 TESTING SGRBG10_1X10
>> v4l2-ctl -c horizontal_flip=1 -d /dev/v4l-subdev2
>>
>> media-ctl -d /dev/media0 --set-v4l2 '"imx219 0-0010":0[fmt:SGRBG10_1X10/640x480]'
>> media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:SGRBG10_1X10/640x480]'
>> media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:SGRBG10_1X10/640x480]'
>>
>> v4l2-ctl -d0 --set-fmt-video pixelformat=CR10,width=640,height=480
>> v4l2-ctl -d0 --stream-mmap --stream-count=100
>>
>>
>> #  IMX219 TESTING SRGGB8_1X8
>> media-ctl -d /dev/media0 --set-v4l2 '"imx219 0-0010":0[fmt:SRGGB8_1X8/1920x1080]'
>> media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:SRGGB8_1X8/1920x1080]'
>> media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:SRGGB8_1X8/1920x1080]'
>>
>>
>> v4l2-ctl -d0 --set-fmt-video pixelformat=RGGB,width=1920,height=1080
>> v4l2-ctl -d0 --stream-mmap --stream-count=32
>>
>> Thanks & Regards,
>> Tommaso
>>
>>> --
>>> 2.34.1
>>>

