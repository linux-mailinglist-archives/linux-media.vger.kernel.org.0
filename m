Return-Path: <linux-media+bounces-11258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BD78C198C
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C13D1C21EE4
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 22:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A725B12D209;
	Thu,  9 May 2024 22:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Gclsw9K8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="br8MMyBm"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC48770E0;
	Thu,  9 May 2024 22:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294643; cv=none; b=JJZuE2GtRGa7sfS8VB2TuBeqecu/p/I28lHuf3o1KClEtCUaxmSr2H6vvnOw8WJ3FUUDSBwMoM7jb6k0qDdYqHIoahA1i7rzwaMTcRCFMVbm0iiZL283KI+9JRX586hynhp9iEFr4H0qhWc+O2VRrtyM+64HTvRWZaf+iT9/U9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294643; c=relaxed/simple;
	bh=wzPffF9SfX5JI4cMvxJ4SkKp1pMGIz7XCsUHDbT/1ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3zPfHUMoKk56MZt/bfLcO9cfRbob4JB+0yNKSJEX3TbtwSkPP+iuV/2ASKSC5oAMWft5+O6Fcfo5NVygRu506cnb8PxSGhSJftxFVLADHbKqSMDtU3JytzsL5K0dtrlZQ5k7l6LjFI0hNUIzPqvm8MINS5IpEyX1X6eyinU08c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Gclsw9K8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=br8MMyBm; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id AF08211400D4;
	Thu,  9 May 2024 18:44:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 09 May 2024 18:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715294640;
	 x=1715381040; bh=dunrG/NqGGx4y/rWE3h0EDx8tfHhJ/M+ZCHoODBBz24=; b=
	Gclsw9K8mU8teyDgWo7eQm3NGyaT6nJq0HgjrwqOjtmn9QmGlQCFCI9sT3FcthTF
	81lGoevMEkNH5Cfi503wTIUIYHyta+cWrt5mReD4JexA1o12f+ahv0evOuxLWYdI
	mac4V+tc7l8wzNfeHgiuc3UlTQYXptBD5k1Xw90PuS9TQYK+X9ARYSqNql3T0Yyo
	ybM7mDti4z3YKTiTD5ACaKtGM9b0Z/UexN15XcqfhMsKCa54Kpd36nyw99TpyGbj
	+YNGpzm1m2L7bjSlWcNK4S+1sRQzYdFoXXf5psDeazgiYvXMldaej8q0pYIHxst8
	UT8OQdudE/RaJFrh1M8lsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715294640; x=
	1715381040; bh=dunrG/NqGGx4y/rWE3h0EDx8tfHhJ/M+ZCHoODBBz24=; b=b
	r8MMyBm0HnMnJaQpCIqf21/ygZ9xVDEvjwQv5MOgvVxKTCC+qOUTOmcsDM3gYN/c
	VamWhnXlMIz1hNZPcwiriVw1FmgBuQePq3XPqftKRpSnk0mFW1G8bN7Mls7oQIk8
	SaVUdnHaKKYsa3j/uzFXebDD/7r8gzoVG8g9uq2iMooz+pmtY4SUQ7Q3O4lUEV70
	uF6fBsFI1SDZV//LYPA1emjJlRE7H+Ifcz/cuqBNHK0excAYPGE7b1yBMwdDXcON
	uF4gB9ZYcSo+n1rL3UGREX1YxiazugaP8agZ1kz58DyHLaOnZjRmXeC2aYJFf9ih
	mAVHuvZ04XBS63pHXZKww==
X-ME-Sender: <xms:sFE9ZtbJTODCtchV9QaXeBNGfMd89HBIQ1V5avGqca-BmulhQZ1vvg>
    <xme:sFE9ZkZQRmufCFeTgjLJUx0zOfkTuibLKAcg0sY_jzhDsmvJNnxvemp-u0aRx4XYA
    _LA0p2IV7qSqghhjwQ>
X-ME-Received: <xmr:sFE9Zv9p94TlyaGuAkRtfsQ8_aphYPCBcYwAUjY5CobeXTFxaPEdODjTnjLF40oIGWYF782G1qudqKznuJ2Jw7kv_Fj8-lk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeffedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:sFE9ZrqnigS_rmaGTDbAY6MGmApMsb9L4mCkP8h78-JBlf8cYVs8MA>
    <xmx:sFE9ZopKdqnQV2kDHnHa6yD9tlctYQZ665g3hGb1KBA0nAxP-mKPig>
    <xmx:sFE9ZhRVdFKKaZpha5Fs-pCVnpSYJHrgcte6gj3-gSLbkvAk0reITg>
    <xmx:sFE9ZgrDBdm96vCsyq0fIvAR92RPZpyOL2gKz8ACy_kbW25Jv0TKMg>
    <xmx:sFE9ZgJ4nFs4kQeavPg9GbixU0ixmRgIlsM8uq1CjRg3rdDgumxE_7QH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 18:44:00 -0400 (EDT)
Date: Fri, 10 May 2024 00:43:58 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 05/11] media: adv748x-csi2: Implement enum_mbus_codes
Message-ID: <20240509224358.GT1385281@ragnatech.se>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
 <20240509161403.111789-6-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509161403.111789-6-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for your patch.

On 2024-05-09 18:13:55 +0200, Jacopo Mondi wrote:
> Define a list of supported mbus codes for the TXA and TXB CSI-2
> transmitters and implement the enum_mbus_code operation.
> 
> The TXB transmitter only support YUV422 while the TXA one supports
> multiple formats as reported by the chip's manual in section 9.7.
> but the HDMI and AFE subdevices only provide RGB888 and YUV422, so only
> list those ones here.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 45 ++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 5b265b722394..29b18b6c8b0e 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -14,6 +14,15 @@
>  
>  #include "adv748x.h"
>  
> +static const unsigned int adv748x_csi2_txa_fmts[] = {
> +	MEDIA_BUS_FMT_UYVY8_1X16,
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +};
> +
> +static const unsigned int adv748x_csi2_txb_fmts[] = {
> +	MEDIA_BUS_FMT_UYVY8_1X16,
> +};
> +
>  int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
>  {
>  	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
> @@ -139,6 +148,41 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
>   * But we must support setting the pad formats for format propagation.
>   */
>  
> +static int adv748x_csi2_enum_mbus_code(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *sd_state,
> +				       struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> +	const unsigned int *codes = is_txa(tx) ?
> +				    adv748x_csi2_txa_fmts :
> +				    adv748x_csi2_txb_fmts;
> +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> +
> +	/*
> +	 * The format available on the source pad is the one applied on the sink
> +	 * pad.
> +	 */
> +	if (code->pad == ADV748X_CSI2_SOURCE) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index)
> +			return -EINVAL;
> +
> +		fmt = v4l2_subdev_state_get_format(sd_state, ADV748X_CSI2_SINK);
> +		code->code = fmt->code;
> +
> +		return 0;
> +	}
> +
> +	if (code->index >= num_fmts)
> +		return -EINVAL;
> +
> +	code->code = codes[code->index];
> +
> +	return 0;
> +}
> +
>  static struct v4l2_mbus_framefmt *
>  adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *sd_state,
> @@ -228,6 +272,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
>  }
>  
>  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
> +	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
>  	.get_fmt = adv748x_csi2_get_format,
>  	.set_fmt = adv748x_csi2_set_format,
>  	.get_mbus_config = adv748x_csi2_get_mbus_config,
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

