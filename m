Return-Path: <linux-media+bounces-15138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5D393758E
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 11:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84581F22F93
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 09:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B274D7E0E9;
	Fri, 19 Jul 2024 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hUNIbulk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A505B647;
	Fri, 19 Jul 2024 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721380538; cv=none; b=SKYAzb+PHks1mkgF6FmCzvXShaDwazXUC/+67eM6ZIMWg601XZmkxyB7mIsgLz8gTWnqLsio4/tYOeyOKUQbQDkRbmp/FjrV67ISnUL7n7iRxPU0SjbkxSjlLj4TDQTzaTjOiTSlLAtr4d8DsdshmLZlY3G0Fl0HBDsb4uJendk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721380538; c=relaxed/simple;
	bh=34OZEPqMBiRGznwEInwn1lCcqR4ne6+8K+BLuKwz56c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WsmOl2tFuNHCwqFeKKetZMKTQvKGHND/lG1cjMLusB9WDfpJ4GchMQRNeQjIQABhdcvUcJzby0AvZVol1hsEccfgszT3iR99WTTLAWhp1magaXuxeUwM/YrcnSFsizCVR0t1OOpLRDTSZAg7/wGYrPDeRcX5fTDMuaYdQFpsQkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hUNIbulk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-149-128.elisa-laajakaista.fi [91.157.149.128])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F860471;
	Fri, 19 Jul 2024 11:14:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721380495;
	bh=34OZEPqMBiRGznwEInwn1lCcqR4ne6+8K+BLuKwz56c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hUNIbulkwzmNqKjCw+S6UUzhdBO0kVZBusUvNUBfDfDtyfj1cT5WfQkipACJWxog6
	 OBnWYpu5ic6ZPL2eJEkUn3y4tSKUWGhEYiQofABENol0r4raZx+9vI98cgXN+Xu0eO
	 bZIM7K9ojeDvK99rOS/5j07x1gzenJhdJgciCuks=
Message-ID: <54b96a59-e897-4386-83fd-8431bbed6ba5@ideasonboard.com>
Date: Fri, 19 Jul 2024 12:15:30 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] media: cadence: csi2rx: Enable multi-stream
 support
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Jai Luthra <j-luthra@ti.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vaishnav Achath
 <vaishnav.a@ti.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-11-6ae96c54c1c3@ti.com>
 <s6zyk5t3ry7hlz6xjf2wnsefpym3meughrzyzidvht3wvogzwi@54bcbdadlp4b>
 <3byg7obpmc5xfsnr4b3secs7d2cctvbfujudwp2zxyinlo75tn@77fkdjmagj7b>
 <njzoj4seict4trpjkhu25y23abtbqwujvn7vaabxuy4v2litd4@eyw7k4mq6fve>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <njzoj4seict4trpjkhu25y23abtbqwujvn7vaabxuy4v2litd4@eyw7k4mq6fve>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/2024 12:55, Jacopo Mondi wrote:
> Hi Jai
> 
> On Tue, Jul 16, 2024 at 03:04:55PM GMT, Jai Luthra wrote:
>> Hi Jacopo,
>>
>> Thanks for the review.
>>
>> On Jul 12, 2024 at 18:09:48 +0200, Jacopo Mondi wrote:
>>> Hi Jai
>>>
>>> On Thu, Jun 27, 2024 at 06:40:06PM GMT, Jai Luthra wrote:
>>>> Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
>>>> of data over the same physical interface using MIPI Virtual Channels.
>>>>
>>>> The V4L2 subdev APIs should reflect this capability and allow per-stream
>>>> routing and controls.
>>>>
>>>> While the hardware IP supports usecases where streams coming in the sink
>>>> pad can be broadcasted to multiple source pads, the driver will need
>>>> significant re-architecture to make that possible. The two users of this
>>>> IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
>>>> have only integrated the first source pad i.e stream0 of this IP. So for
>>>> now keep it simple and only allow 1-to-1 mapping of streams from sink to
>>>> source, without any broadcasting.
>>>>
>>>> With stream routing now supported in the driver, implement the
>>>> enable_stream and disable_stream hooks in place of the stream-unaware
>>>> s_stream hook.
>>>>
>>>> This allows consumer devices like a DMA bridge or ISP, to enable
>>>> particular streams on a source pad, which in turn can be used to enable
>>>> only particular streams on the CSI-TX device connected on the sink pad.
>>>>
>>>> Implement a fallback s_stream hook that internally calls enable_stream
>>>> on each source pad, for consumer drivers that don't use multi-stream
>>>> APIs to still work.
>>>>
>>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>>>> ---
>>>>   drivers/media/platform/cadence/cdns-csi2rx.c | 407 ++++++++++++++++++++-------
>>>>   1 file changed, 313 insertions(+), 94 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>>>> index 2ec34fc9c524..b0c91a9c65e8 100644
>>>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>>>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>>>> @@ -90,6 +90,7 @@ struct csi2rx_priv {
>>>>   	struct reset_control		*pixel_rst[CSI2RX_STREAMS_MAX];
>>>>   	struct phy			*dphy;
>>>>
>>>> +	u32				vc_select[CSI2RX_STREAMS_MAX];
>>>>   	u8				lanes[CSI2RX_LANES_MAX];
>>>>   	u8				num_lanes;
>>>>   	u8				max_lanes;
>>>> @@ -179,27 +180,43 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>>>>
>>>>   static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>>>>   {
>>>> +	struct v4l2_ctrl_handler *handler = csi2rx->source_subdev->ctrl_handler;
>>>>   	union phy_configure_opts opts = { };
>>>>   	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
>>>> -	struct v4l2_subdev_format sd_fmt = {
>>>> -		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
>>>> -		.pad	= CSI2RX_PAD_SINK,
>>>> -	};
>>>> +	struct v4l2_mbus_framefmt *framefmt;
>>>> +	struct v4l2_subdev_state *state;
>>>>   	const struct csi2rx_fmt *fmt;
>>>>   	s64 link_freq;
>>>>   	int ret;
>>>>
>>>> -	ret = v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
>>>> -					    &sd_fmt);
>>>> -	if (ret < 0)
>>>> -		return ret;
>>>> +	if (v4l2_ctrl_find(handler, V4L2_CID_LINK_FREQ)) {
>>>
>>> Do you need to do this by yourself ? afaict v4l2_get_link_freq()
>>> already checks if V4L2_CID_LINK_FREQ is available, and if not,
>>> fallsback to use PIXEL_RATE.
>>>
>>>> +		link_freq = v4l2_get_link_freq(handler, 0, 0);
>>>> +	} else {
>>>> +		state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
>>>> +		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
>>>> +							0);
>>>> +
>>>> +		if (framefmt) {
>>>> +			fmt = csi2rx_get_fmt_by_code(framefmt->code);
>>>> +		} else {
>>>> +			dev_err(csi2rx->dev,
>>>> +				"Did not find active sink format\n");
>>>> +			return -EINVAL;
>>>
>>> Is this possibile ?
>>>
>>>> +		}
>>>>
>>>> -	fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
>>>> +		link_freq = v4l2_get_link_freq(handler, fmt->bpp,
>>>> +					       2 * csi2rx->num_lanes);
>>>
>>> Do we want to allow falling back on PIXEL_RATE for multiplexed
>>> transmitters ? I presume this will give you invalid results anyway.
>>
>> This is mostly done to avoid breaking any single stream sensor that does
>> not have the LINK_FREQ control, and was working with this bridge before.
>> Thus the warning below for multi-format sources.
> 
> Is it possible to allow usage of PIXEL_LINK only for non-multiplexed
> transmitters ?
> 
>>>
>>> I would simply call v4l2_get_link_freq(handler, 0, 0) to force the
>>> usage of LINK_FREQ which will become mandatory for transmitters
>>
>> Ah I did not know LINK_FREQ will be mandatory soon. Any threads I can
>> look at where this was discussed?
>>
> 
> I meant mandatory for multiplexed transmitters, which will have to be
> 'forced' to use LINK_FREQ as PIXEL_RATE doesn't make much sense for
> them

In CAL driver's multiplexed streams patch I have:

> 	/*
> 	 * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls back
> 	 * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
> 	 *
> 	 * With multistream input there is no single pixel rate, and thus we
> 	 * cannot use V4L2_CID_PIXEL_RATE, so we pass 0 as the bpp which
> 	 * causes v4l2_get_link_freq() to return an error if it falls back to
> 	 * V4L2_CID_PIXEL_RATE.
> 	 */
> 
> 	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
> 
> 	if (state->routing.num_routes > 1) {
> 		bpp = 0;
> 	} else {
> 		struct v4l2_subdev_route *route = &state->routing.routes[0];
> 		const struct cal_format_info *fmtinfo;
> 		struct v4l2_mbus_framefmt *fmt;
> 
> 		fmt = v4l2_subdev_state_get_format(state,
> 			route->sink_pad, route->sink_stream);
> 
> 		fmtinfo = cal_format_by_code(fmt->code);
> 		if (!fmtinfo)
> 			return -EINVAL;
> 
> 		bpp = fmtinfo->bpp;
> 	}
> 
> 	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
> 	if (freq < 0) {
> 		phy_err(phy, "failed to get link freq for subdev '%s'\n",
> 			phy->source->name);
> 		return freq;
> 	}

  Tomi


