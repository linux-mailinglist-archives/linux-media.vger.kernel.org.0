Return-Path: <linux-media+bounces-10860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C368BCCEA
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 13:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAE2A28378E
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 11:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E2F143727;
	Mon,  6 May 2024 11:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="haYAWO22";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bAdQMvMn"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB3139FF4;
	Mon,  6 May 2024 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714995457; cv=none; b=s02xA6YHy5W1gA75YjG/HVUOcJ/b+ZNLlNWzIv8UpM4EBLH1CQi07I7xhni052k9LUG6m0RgtxHfHsZoG6jX1MJ1594aHsHD3LPNEgz5qk1RdfJqn2GKqaEY773cqI195zUvRwFyVu+oFIJi78AKaeltlHxYEW5k6DkXTCnrbPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714995457; c=relaxed/simple;
	bh=IL52Qh3CpOKISjo/G+zib0XNtVS9052Zkh5wZvGhKEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryUjVtVtAWfb0eZiTxoYj+7+vMebNLt4Qnix8sLTqTFcaO0Ng7j1Y+PrG4AWT2ZkZsIazHVBlTbE2+vY3hcB4uZ62oqqe1l43prcf6ERGuEHA+B5383R7SvPUqtVQ0IguRS6GZ3FAPtXHd7zDfSPuF5zMJtKEbx3oM9lMgShpI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=haYAWO22; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bAdQMvMn; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id 4BCF7180013F;
	Mon,  6 May 2024 07:37:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 06 May 2024 07:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714995452;
	 x=1715081852; bh=kILgmZX+igP54Fj8GwI7Umkzb1nVGrcQEa87X+pv/Fc=; b=
	haYAWO22K4Lj2tJtAa+zmJofYHwLFPvhFpIyDaFDh9OjYkISBV/oGsQIp9gZ1C/n
	8vqRJzvm8SKRuLB5zXsD5PW3G4fbDErcY+SlDbWHsrg7ip9Ly5FVaYCsQTP/2moH
	gZfJu+oBwlcIRPLRGoDcWdN1S2kOKSO0i3XtyBqBE48wpbf6w5fKY71lY9WzWu0G
	2U8J7XVmvG6wzmv99YoUMEBh8sgrT+5x0F35+NqthzTpoLApIMnEDEtD4hmY8/Wp
	e0Juea1XIw+VapviyRXR+wcLjv7xSo03GSpdsm/nCLtuajL74eD1rtCvWeJ+LWI7
	ET8vq72QIqC2kKrIzRLNiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714995452; x=
	1715081852; bh=kILgmZX+igP54Fj8GwI7Umkzb1nVGrcQEa87X+pv/Fc=; b=b
	AdQMvMnKmCMxVdgdc032YwcchRT3dJ/EcQZYA3/QW/OftCdhXWg98KX7MiUoat39
	Piw3VEK5kmeKR1YGqSeCL+l10p9qyfb4BNgj1Ytf8BXiOXhq39AEzopjI4jO9Ofi
	GoJVgRoPJGTp10/vkqnrFJAx1ApzEZaC3F2RaZ9Uw/OHk/k1Wm6EevDRhTAUFOQi
	5lvoVbYswxl7kCSVRv6N5LoraHfEkpPkA7TiuekhMn5wm63lNdHHs8pk6iDxnZ+f
	VT+LlvL5b62phxtFwj3RzXjI3JgfZpwtXQWxJX4lHlJQ02Un1ITDqbGmT2H3qXQt
	7FiMJLxrRijwfL4zTW+jQ==
X-ME-Sender: <xms:_MA4Zp-O_q8uYAQEuBCHmlWS9cBXCYEDHIcqMrH8PQGk8ECeJR9EmA>
    <xme:_MA4ZtuvD0i5XwSdhimnfGH6DEl4oHYToH4Q2vpXVsIVvLAQO7AaUABF5ZKL5dFpm
    Gi-WRiGJFqZazyqIpo>
X-ME-Received: <xmr:_MA4ZnD68MW0nr1zljp875noeSyNZrKLZVUwqyA3Wyo9UEW_6oRZD39GRLd3JyZM4wumW5Ca3TqJPhkgDTC5RpnxmGK6zGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddviedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:_MA4ZtetvgyZuOUAWYVk5FwoHLZE4yah0I6G7BHereXqAaLrQcqpdw>
    <xmx:_MA4ZuPy1q1e_wftmpJQXn1XYoUNx-PKP2z3DuQXM-JPI-LEJ2QNCA>
    <xmx:_MA4Zvn452bSHLDM32xzp48ufzdBGutvxcK3KqXrlTjkKPW3ru-5XA>
    <xmx:_MA4ZotJniCexeGoGBXzF0OwYuzda8ESx8uHY7cyJtVRVdFgcTHFbQ>
    <xmx:_MA4ZtfmAC3gnZo-kMcw1UfbXfB2I1KWjKwZAEi2FREVk2T8GEnxa8KU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 May 2024 07:37:31 -0400 (EDT)
Date: Mon, 6 May 2024 13:37:30 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/11] media: adv748x-csi2: Validate the image format
Message-ID: <20240506113730.GA1017753@ragnatech.se>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-8-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503155127.105235-8-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2024-05-03 17:51:22 +0200, Jacopo Mondi wrote:
> The adv748x-csi2 driver configures the CSI-2 transmitter to
> automatically infer the image stream format from the connected
> frontend (HDMI or AFE).
> 
> Setting a new format on the subdevice hence does not actually control
> the CSI-2 output format, but it's only there for the purpose of
> pipeline validation.
> 
> However, there is currently no validation that the supplied media bus
> code is valid and supported by the device.
> 
> With the introduction of enum_mbus_codes a list of supported format is
> now available, use it to validate that the supplied format is correct
> and use the default YUYV8 one if that's not the case.

With the update tests for the change in patch 4 I hit multiple issues 
with this patch for CVBS capture.

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 27 +++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 219417b319a6..1aae6467ca62 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -215,6 +215,23 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx,
> +					 unsigned int code)
> +{
> +	const unsigned int *codes = is_txa(tx) ?
> +				    adv748x_csi2_txa_fmts :
> +				    adv748x_csi2_txb_fmts;
> +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> +
> +	for (unsigned int i = 0; i < num_fmts; i++) {
> +		if (codes[i] == code)
> +			return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_format *sdformat)
> @@ -222,7 +239,15 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
>  	struct adv748x_state *state = tx->state;
>  	struct v4l2_mbus_framefmt *mbusformat;
> -	int ret = 0;
> +	int ret;
> +
> +	/*
> +	 * Make sure the format is supported, if not default it to
> +	 * YUYV8 as it's supported by both TXes.
> +	 */
> +	ret = adv748x_csi2_is_fmt_supported(tx, sdformat->format.code);
> +	if (ret)
> +		sdformat->format.code = MEDIA_BUS_FMT_YUYV8_1X16;

If adv748x_csi2_is_fmt_supported() returns non-zero you default to 
MEDIA_BUS_FMT_YUYV8_1X16, which is fine. But the non-zero return code is 
propagated at the end of this function and to user-space falling the 
IOCTL.

Fixing that I hit another issue that kind of shows we need this format 
validation ;-)

The TXB entity only supports MEDIA_BUS_FMT_YUYV8_1X16 formats, the AFE 
entity only outputs MEDIA_BUS_FMT_UYVY8_2X8... So with format validation 
in place it becomes impossible to connect AFE to TXB and breaking CBVS 
capture on Gen3. As a hack I added MEDIA_BUS_FMT_UYVY8_2X8 support to 
TXB and I can again capture CVBS with patch 1-8 applied.

>  
>  	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
>  						 sdformat->which);
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

