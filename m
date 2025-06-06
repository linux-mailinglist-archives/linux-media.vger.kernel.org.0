Return-Path: <linux-media+bounces-34241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D2AAD021E
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C6273AA87C
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174462882D9;
	Fri,  6 Jun 2025 12:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Epb6M8li";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LinPWa1e"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18CD2868BD;
	Fri,  6 Jun 2025 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212416; cv=none; b=Gf8iKr7lxHW6FmFnHY++c3rd4LIUDXZUiHqT3xdD0D8mJXq4oeaa8vKrmJoAd5DetGqObtUYnAmkwUM+5ScEkaFqXKqxXavfal3NVgdWjCzQuV4PXD0MIMuB6RuxRQz7DDL2/lww6HEeGD8uadbGfnbRlMgxoIPw9qjqLErAN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212416; c=relaxed/simple;
	bh=NprR1ehoDfTDot6OFdq1lOyMlHXFb+t2rc/rBu2GTRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyyVlOh3cZ2YpZsRK6ZbyRFErt2GRrARnwhfC+YrOWD3FlCVRddyXCOZgiRUMB/S8P2723U49wYm5et0jd6/V9z35b08sxrhZyxOZHLCl0OW9Xm7gTAuBCm+SHtpB7LwgPBCnx4NdjiadG3QwLBvmCm8V9p+Lq0I9VGb1kS9X34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Epb6M8li; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LinPWa1e; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id BE7061380388;
	Fri,  6 Jun 2025 08:20:13 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 06 Jun 2025 08:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749212413;
	 x=1749298813; bh=F5eKTBewbMvoySvWxVy/ldrx72GRUC0xaamMpK6cgZM=; b=
	Epb6M8lidkBw4TYXg+ox28A0BAv5NMAGmTl2NSSdJI5Zy/6fSvpYFzIeFiOVuNfU
	A4+kyvKj46s/5ntJ9FD/mPEjgC8g699m9YQBHls5Qm68jMWC6/Re07cpeYzogfu2
	Hjgt3Y1KHODlEJ6g0NbIBB+EUioz14ZCDI22sE9zqw7j8IHBSSv8bnxPsFTVs6uT
	/gBuBTwe1C4TAfJpDtHWt6iGgIai1eG8IMLovIKnnOWW0msAOZ8D2p0p4Ynj4/YQ
	yQ1wmfhIDt2qbV2lQsiFMHviYCBCmOMflTP+Voh50nkrwQh1yamwf5PKjulayW1Z
	VPaAT92lY/zF21CQq+QU3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749212413; x=
	1749298813; bh=F5eKTBewbMvoySvWxVy/ldrx72GRUC0xaamMpK6cgZM=; b=L
	inPWa1eYPdNbPoQ46r6hYmsN/Fc+6cTO8GfCUab68A3NYdPi/Uu6Q9fbrMiLgWuw
	4mIrNJU5BBv8Ot8yXBXlIKwXczHI+mgqgS1+XLUqW/11/2+a/Jeai3686ThrAGkN
	l5bO6BhQUrrT4pUNxx9yn/jSIa33/ijfLHCOv6p7F5Or90OolQMUdfESYyRDh0Ho
	Dbk3rThv9hQdJa0Ym+nglZHk7oeUgOz1RdfXRmnPjA5rCGRf2ylrezn0Ch69XH0w
	9r90X9jXsTvRb3VCM3IIsvGqw5VFyUxntlFsmGOhvaN6nr2+hspll9XQPKB52IUl
	RvLJN9IQiOwnydVO/xbJw==
X-ME-Sender: <xms:_dxCaKXpJtNpVwaa9UEKcwrv3hwp1vPJLZ0YdRKyY1PSNjeUEnWy-Q>
    <xme:_dxCaGnVjZ_nOU64m848wWfCQ2V7rRoBgzQqkZ3Fhc5LETj_tjqwMpfJIOKMTc2JL
    o2ARbKikXVMHAFlMOo>
X-ME-Received: <xmr:_dxCaOaLTB_ZyxHMtg9_yoiP-GtnA1e55Tgm1av8QxCtnN0ceiFimcWtXzPGXiIpXZTjuEezk1RxDqe_9oduMbYEx66UEevWBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeelfefg
    tddtleeljeeuuddvteefledtfeefjeduheeiffffudetgeejieegffduffenucffohhmrg
    hinheptghsihdvrdhvtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeht
    ohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurd
    gtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpth
    htoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepmhgthhgvhhgrsgdohhhurgifvghisehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgr
    rhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsg
    horghrugdrtghomh
X-ME-Proxy: <xmx:_dxCaBWhM8rsJjvx3-70ez0ilJ4xJNl3yrsiGfieUHJDQPcabPrjIw>
    <xmx:_dxCaEk4VGwgK_qgqObZYD4-p_oOesSUfY4MiD8Ue-zxEQ3kxc4WGg>
    <xmx:_dxCaGcpoHw49EvVkFk40OEg51JKSevfkXZLLIha_HOG30y-9fw0KA>
    <xmx:_dxCaGG89eTEPOQ3KjbWLyzjBtzwByRy4lZdyLK2AtMR89NVVRvWdg>
    <xmx:_dxCaI_LXh4v8xuHxDH79cIn3CdDxZBAHb2AuvBNnCDnsUo-cKPd5yg3>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 08:20:12 -0400 (EDT)
Date: Fri, 6 Jun 2025 14:20:11 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 11/15] media: rcar-isp: Call get_frame_desc to find
 out VC & DT
Message-ID: <20250606122011.GH2770609@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-11-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-rcar-streams-v3-11-026655df7138@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2025-05-30 16:50:40 +0300, Tomi Valkeinen wrote:
> Call get_frame_desc to find out VC & DT, instead of hardcoding the VC
> routing and deducing the DT based on the mbus format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 108 +++++++++++++++++-------
>  1 file changed, 77 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index a04cbf96b809..887d8eb21a3a 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -225,24 +225,86 @@ static void risp_power_off(struct rcar_isp *isp)
>  	pm_runtime_put(isp->dev);
>  }
>  
> -static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
> +static int risp_configure_routing(struct rcar_isp *isp,
> +				  struct v4l2_subdev_state *state)
>  {
> -	const struct v4l2_mbus_framefmt *fmt;
> -	const struct rcar_isp_format *format;
> -	unsigned int vc;
> -	u32 sel_csi = 0;
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_subdev_route *route;
>  	int ret;
>  
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK, 0);
> -	if (!fmt)
> -		return -EINVAL;
> +	ret = v4l2_subdev_call(isp->remote, pad, get_frame_desc,
> +			       isp->remote_pad, &source_fd);
> +	if (ret)
> +		return ret;
>  
> -	format = risp_code_to_fmt(fmt->code);
> -	if (!format) {
> -		dev_err(isp->dev, "Unsupported bus format\n");
> -		return -EINVAL;
> +	/* Clear the channel registers */
> +	for (unsigned int ch = 0; ch < 12; ++ch) {
> +		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), 0);
> +		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch), 0);
>  	}
>  
> +	/* Clear the proc mode registers */
> +	for (unsigned int dt = 0; dt < 64; ++dt)
> +		risp_write_cs(isp, ISPPROCMODE_DT_REG(dt), 0);

I agree with Laurent's comments, do we really need to clear these 
registers?

> +
> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
> +		const struct rcar_isp_format *format;
> +		const struct v4l2_mbus_framefmt *fmt;
> +		unsigned int i;
> +		u8 vc, dt, ch;
> +		u32 v;
> +
> +		for (i = 0; i < source_fd.num_entries; i++) {
> +			if (source_fd.entry[i].stream == route->sink_stream) {
> +				source_entry = &source_fd.entry[i];
> +				break;
> +			}
> +		}
> +
> +		if (!source_entry) {
> +			dev_err(isp->dev,
> +				"Failed to find stream from source frame desc\n");
> +			return -EPIPE;
> +		}
> +
> +		vc = source_entry->bus.csi2.vc;
> +		dt = source_entry->bus.csi2.dt;
> +		/* Channels 4 - 11 go to VIN */
> +		ch = route->source_pad - 1 + 4;
> +
> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +						   route->sink_stream);
> +		if (!fmt)
> +			return -EINVAL;
> +
> +		format = risp_code_to_fmt(fmt->code);
> +		if (!format) {
> +			dev_err(isp->dev, "Unsupported bus format\n");
> +			return -EINVAL;
> +		}
> +
> +		/* VC Filtering */
> +		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
> +
> +		/* DT Filtering */
> +		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
> +			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
> +
> +		/* Proc mode */
> +		v = risp_read_cs(isp, ISPPROCMODE_DT_REG(dt));
> +		v |= ISPPROCMODE_DT_PROC_MODE_VCn(vc, format->procmode);
> +		risp_write_cs(isp, ISPPROCMODE_DT_REG(dt), v);

Also as Laurent suggested I thin it would be nicer to build these 
registers up in a local variable and do the writes once outside the 
loop. That way the clearing of the register will take care of itself ;-)

> +	}
> +
> +	return 0;
> +}
> +
> +static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
> +{
> +	u32 sel_csi = 0;
> +	int ret;
> +
>  	ret = risp_power_on(isp);
>  	if (ret) {
>  		dev_err(isp->dev, "Failed to power on ISP\n");
> @@ -256,25 +318,9 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  	risp_write_cs(isp, ISPINPUTSEL0_REG,
>  		      risp_read_cs(isp, ISPINPUTSEL0_REG) | sel_csi);
>  
> -	/* Configure Channel Selector. */
> -	for (vc = 0; vc < 4; vc++) {
> -		u8 ch = vc + 4;
> -		u8 dt = format->datatype;
> -
> -		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
> -		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
> -			      ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
> -			      ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
> -			      ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
> -			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
> -	}
> -
> -	/* Setup processing method. */
> -	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
> +	ret = risp_configure_routing(isp, state);
> +	if (ret)
> +		return ret;
>  
>  	/* Start ISP. */
>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

