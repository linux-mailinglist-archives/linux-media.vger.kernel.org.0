Return-Path: <linux-media+bounces-48886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FE7CC3429
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 803043014D8F
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D915E31ED71;
	Tue, 16 Dec 2025 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lBpNpKAY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FBB3A5C0C;
	Tue, 16 Dec 2025 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892124; cv=none; b=YusuZQgR0PhPHw3yxAJiqlplEWlGWsLdqlyGnY0RiUDlbsOSeoiibYEFtZr/2g3m9L/XsWosF/vLdRF/wmvrGJ9RMd2ElQfoCcZ3k1XHFh6bDiY5dapmycIdcRwLceiwoCPRSx+zguuvnNqL5rG0FJ9iy2RS8dL7G8hC9z08Lww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892124; c=relaxed/simple;
	bh=pQOwGLqnKVAfLMRsv9sN2tY8boBffUrnszYOn5hvOvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iV1sbp6rpVpVhL5nV9OuUCD+/ycllMSohHxiDt424d1pLlQb7h5Upyg4JVGuInskqYiwNABtOqjlIOnPAtqd+j5+9XhW3EEfr2u0r0qmb9rOM2h717uduWk3gczIzFnofabrHuABYPURqvCsiEaYTrkfySsziy8lniYNXxU5tGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lBpNpKAY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C9EA581;
	Tue, 16 Dec 2025 14:35:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765892112;
	bh=pQOwGLqnKVAfLMRsv9sN2tY8boBffUrnszYOn5hvOvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lBpNpKAYrW8ksLCQ1V033kXQ4x/44sWjD3V6UnXQRDcMtICTXi72LDhCOIH1mVGrQ
	 P8FQqAXlYgpSP5pYnjfC7qOCuxyLcjaiMa7LI2kwoaOmOtwxiKhd8gToRXNZnqLxVC
	 JusrGXdzomz7/O4gNVI40u42PtKLMV9nzI5bfGdw=
Message-ID: <0e0a99e1-0ea2-4683-8e0d-b5511b7a9d5e@ideasonboard.com>
Date: Tue, 16 Dec 2025 15:35:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] media: rcar-isp: Call get_frame_desc to find out
 VC & DT
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-11-026655df7138@ideasonboard.com>
 <20250606122011.GH2770609@ragnatech.se>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250606122011.GH2770609@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 06/06/2025 15:20, Niklas Söderlund wrote:
> Hi Tomi,
> 
> Thanks for your work.
> 
> On 2025-05-30 16:50:40 +0300, Tomi Valkeinen wrote:
>> Call get_frame_desc to find out VC & DT, instead of hardcoding the VC
>> routing and deducing the DT based on the mbus format.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>  drivers/media/platform/renesas/rcar-isp/csisp.c | 108 +++++++++++++++++-------
>>  1 file changed, 77 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
>> index a04cbf96b809..887d8eb21a3a 100644
>> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
>> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
>> @@ -225,24 +225,86 @@ static void risp_power_off(struct rcar_isp *isp)
>>  	pm_runtime_put(isp->dev);
>>  }
>>  
>> -static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>> +static int risp_configure_routing(struct rcar_isp *isp,
>> +				  struct v4l2_subdev_state *state)
>>  {
>> -	const struct v4l2_mbus_framefmt *fmt;
>> -	const struct rcar_isp_format *format;
>> -	unsigned int vc;
>> -	u32 sel_csi = 0;
>> +	struct v4l2_mbus_frame_desc source_fd;
>> +	struct v4l2_subdev_route *route;
>>  	int ret;
>>  
>> -	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK, 0);
>> -	if (!fmt)
>> -		return -EINVAL;
>> +	ret = v4l2_subdev_call(isp->remote, pad, get_frame_desc,
>> +			       isp->remote_pad, &source_fd);
>> +	if (ret)
>> +		return ret;
>>  
>> -	format = risp_code_to_fmt(fmt->code);
>> -	if (!format) {
>> -		dev_err(isp->dev, "Unsupported bus format\n");
>> -		return -EINVAL;
>> +	/* Clear the channel registers */
>> +	for (unsigned int ch = 0; ch < 12; ++ch) {
>> +		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), 0);
>> +		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch), 0);
>>  	}
>>  
>> +	/* Clear the proc mode registers */
>> +	for (unsigned int dt = 0; dt < 64; ++dt)
>> +		risp_write_cs(isp, ISPPROCMODE_DT_REG(dt), 0);
> 
> I agree with Laurent's comments, do we really need to clear these 
> registers?
> 
>> +
>> +	for_each_active_route(&state->routing, route) {
>> +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
>> +		const struct rcar_isp_format *format;
>> +		const struct v4l2_mbus_framefmt *fmt;
>> +		unsigned int i;
>> +		u8 vc, dt, ch;
>> +		u32 v;
>> +
>> +		for (i = 0; i < source_fd.num_entries; i++) {
>> +			if (source_fd.entry[i].stream == route->sink_stream) {
>> +				source_entry = &source_fd.entry[i];
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!source_entry) {
>> +			dev_err(isp->dev,
>> +				"Failed to find stream from source frame desc\n");
>> +			return -EPIPE;
>> +		}
>> +
>> +		vc = source_entry->bus.csi2.vc;
>> +		dt = source_entry->bus.csi2.dt;
>> +		/* Channels 4 - 11 go to VIN */
>> +		ch = route->source_pad - 1 + 4;
>> +
>> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
>> +						   route->sink_stream);
>> +		if (!fmt)
>> +			return -EINVAL;
>> +
>> +		format = risp_code_to_fmt(fmt->code);
>> +		if (!format) {
>> +			dev_err(isp->dev, "Unsupported bus format\n");
>> +			return -EINVAL;
>> +		}
>> +
>> +		/* VC Filtering */
>> +		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
>> +
>> +		/* DT Filtering */
>> +		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
>> +			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
>> +
>> +		/* Proc mode */
>> +		v = risp_read_cs(isp, ISPPROCMODE_DT_REG(dt));
>> +		v |= ISPPROCMODE_DT_PROC_MODE_VCn(vc, format->procmode);
>> +		risp_write_cs(isp, ISPPROCMODE_DT_REG(dt), v);
> 
> Also as Laurent suggested I thin it would be nicer to build these 
> registers up in a local variable and do the writes once outside the 
> loop. That way the clearing of the register will take care of itself ;-)

I can do that, but I'm not sure I see the need from performance
perspective. We're talking about a few register reads & writes, once,
when enabling the first stream.

Would the code be more readable? I'm not sure... Here we do all the
writes related to a single stream in one iteration, which is nice.

But I don't have strong opinions either way.

 Tomi

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>> +{
>> +	u32 sel_csi = 0;
>> +	int ret;
>> +
>>  	ret = risp_power_on(isp);
>>  	if (ret) {
>>  		dev_err(isp->dev, "Failed to power on ISP\n");
>> @@ -256,25 +318,9 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>>  	risp_write_cs(isp, ISPINPUTSEL0_REG,
>>  		      risp_read_cs(isp, ISPINPUTSEL0_REG) | sel_csi);
>>  
>> -	/* Configure Channel Selector. */
>> -	for (vc = 0; vc < 4; vc++) {
>> -		u8 ch = vc + 4;
>> -		u8 dt = format->datatype;
>> -
>> -		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
>> -		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
>> -			      ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
>> -			      ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
>> -			      ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
>> -			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
>> -	}
>> -
>> -	/* Setup processing method. */
>> -	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
>> -		      ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
>> -		      ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
>> -		      ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
>> -		      ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
>> +	ret = risp_configure_routing(isp, state);
>> +	if (ret)
>> +		return ret;
>>  
>>  	/* Start ISP. */
>>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
>>
>> -- 
>> 2.43.0
>>
> 


