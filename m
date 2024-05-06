Return-Path: <linux-media+bounces-10882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63B8BCFC7
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3F3528840C
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F5B13C3D1;
	Mon,  6 May 2024 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cB8KE7sd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BZVTgaaJ"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F329F13BC3E;
	Mon,  6 May 2024 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715004727; cv=none; b=MsQiMs/L+YjIvqcluiqm5yN/AqdoB0WlZEye3wtJYs0B2IH+XUUdI92CN76byhpMU9LT0bO2z0v1ChnKI5d8HAl8/rkGBg4JaTXMkLwLqZxdlzjffbPLosqC6aZXXWj32lVHlWUIU3i96tHpRsEhiAH48gBgA0xdaMSmW3xqN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715004727; c=relaxed/simple;
	bh=gb5/axJ8s2R8JiiA2knJsjVHjpgCrHNMxJh+0mvKlf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbR4VqnXu+MdOd4O8IJ5rhJ/3YVYDCeq8TcuQndqgKkCT/GhIYwfZs5s3GRVKSp+UBmjP/wChHCXDVayAT4OxKsOuX7IYdl/vrHmpsoMzGH5cYHtCdWIedCfZzM/nTo/p2VPPYpCVcAjgP1Hidv/hqN7O/oLU6CSBpbiBMPf0w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cB8KE7sd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BZVTgaaJ; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 86C801C00156;
	Mon,  6 May 2024 10:12:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 06 May 2024 10:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715004723;
	 x=1715091123; bh=IgHnjuHs0IYCmVaYX7ODY9I2tZqAoPzzv+v+MwP5CI8=; b=
	cB8KE7sduYt8duXIhpBE5UQ8PXUJ6nKNQuIvpKbqA6WrlS5BWq3pbaPeMFTiSM8k
	ZF0TUpbhSyOxm52imnVZSJfCdDZlRVzG5GmtqxwjwjEciLH1ypmcbYTyCgHqCPsY
	p/U+9FBUz3jb8kh8SRxalTWuIPAAPgbphJBgL3s4mCOOsWz+mI83cCT9FsIbgcbL
	SUBfi4EJAu3vSR0pnyRWVLXm6U/XWFuq05YEstdpqFNIOwUN7v7PLZP3sC/v+XWl
	uugREu6KE2kfcnMOpzPAns3fIOHajhfVhMlPAoM3nhPxIBTwy9cK2dO97QstBtr6
	oQ04O8KrO+2+VhjoBmnaEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715004723; x=
	1715091123; bh=IgHnjuHs0IYCmVaYX7ODY9I2tZqAoPzzv+v+MwP5CI8=; b=B
	ZVTgaaJFpyihmld8F0yZTg2FAXi+/HLaqWxM7LqP44rbRUeCKpUO6G+pjjCBAiKG
	0HQjuakei6iN3Q48+V+6CUDfCTuW1AhMBg6oq5QKzDjG7f/Gx06lTjTfMxG529+M
	y53PdZKgZye9tz9r1EVJTE0WmSZ+QMs3hHoUA3XSNBe0XGwxnLqS4w4aDdatzCFh
	MZh1Bd5Hpa8P9Q3iK0xKlTU8rWtF5Mx1Sek5VHkxnEk3fhVPhy+jvFjaOZxMyd0x
	OX9MjCW/Lgp0RFDN3u5dPvdra/LvS0SseWVG4vqbpMTRKvn7W0rJNJN0qvEkZ88I
	y7Imz3TbtwFW/3J3+ijdA==
X-ME-Sender: <xms:MuU4Zhb45swsmKpi5z-dFiBs84bCV40H5j094AsMeJn2s1d3d-7aDw>
    <xme:MuU4ZoaBedGgFh9BGZRxChopJgjkQQlO2Qv54lc_ztYS2NjbBchT6fUiW8mwy4Tw4
    a-NYyIG4ilAgWxh_l0>
X-ME-Received: <xmr:MuU4Zj_iAu5pgR11pccMbX7VeIJNWDBfCCrVGAYAX3zt3LyleVT3Jtrntfs1UjZx9Zmz6gNie2l_Xnij0BQ-PMGvF1vixkI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddviedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:MuU4ZvpadmcHlUi-U3UQGrlP06-Z9fs6ME0ZjRuNjt-oG_iQukUeDA>
    <xmx:MuU4Zsoc3Un0sSU00a6d2WCvORbu9XiHs_mxLkB-tMBs8g6sAKq9kg>
    <xmx:MuU4ZlRaIVKTrzFziCQtFxLS2fd7okvL4EJ985Z_wKQP0igau5G7Xw>
    <xmx:MuU4Zkp_aH8zJUUm4ux9BEMxEti7XxldarYmmL3aho1Xnp0whDY5dg>
    <xmx:M-U4ZkJ5_gXW9-keHChhTXJDLY7pOS3jufvt2P3vPT8lbCDuiXF2PUjN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 May 2024 10:12:02 -0400 (EDT)
Date: Mon, 6 May 2024 16:12:01 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/11] media: adv748x-csi2: Validate the image format
Message-ID: <20240506141201.GE720810@ragnatech.se>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-8-jacopo.mondi@ideasonboard.com>
 <20240506113730.GA1017753@ragnatech.se>
 <xcvfc2rphz52r6vyexlmjdqwmsudlu4urx2ngn3g55hmsh44yf@nw4rwfresuy7>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xcvfc2rphz52r6vyexlmjdqwmsudlu4urx2ngn3g55hmsh44yf@nw4rwfresuy7>

Hi Jacopo,

On 2024-05-06 15:21:30 +0200, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Mon, May 06, 2024 at 01:37:30PM GMT, Niklas Söderlund wrote:
> > Hi Jacopo,
> >
> > Thanks for your work.
> >
> > On 2024-05-03 17:51:22 +0200, Jacopo Mondi wrote:
> > > The adv748x-csi2 driver configures the CSI-2 transmitter to
> > > automatically infer the image stream format from the connected
> > > frontend (HDMI or AFE).
> > >
> > > Setting a new format on the subdevice hence does not actually control
> > > the CSI-2 output format, but it's only there for the purpose of
> > > pipeline validation.
> > >
> > > However, there is currently no validation that the supplied media bus
> > > code is valid and supported by the device.
> > >
> > > With the introduction of enum_mbus_codes a list of supported format is
> > > now available, use it to validate that the supplied format is correct
> > > and use the default YUYV8 one if that's not the case.
> >
> > With the update tests for the change in patch 4 I hit multiple issues
> > with this patch for CVBS capture.
> >
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/adv748x/adv748x-csi2.c | 27 +++++++++++++++++++++++-
> > >  1 file changed, 26 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > index 219417b319a6..1aae6467ca62 100644
> > > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > @@ -215,6 +215,23 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
> > >  	return 0;
> > >  }
> > >
> > > +static int adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx,
> > > +					 unsigned int code)
> > > +{
> > > +	const unsigned int *codes = is_txa(tx) ?
> > > +				    adv748x_csi2_txa_fmts :
> > > +				    adv748x_csi2_txb_fmts;
> > > +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> > > +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> > > +
> > > +	for (unsigned int i = 0; i < num_fmts; i++) {
> > > +		if (codes[i] == code)
> > > +			return 0;
> > > +	}
> > > +
> > > +	return -EINVAL;
> > > +}
> > > +
> > >  static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
> > >  				   struct v4l2_subdev_state *sd_state,
> > >  				   struct v4l2_subdev_format *sdformat)
> > > @@ -222,7 +239,15 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
> > >  	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> > >  	struct adv748x_state *state = tx->state;
> > >  	struct v4l2_mbus_framefmt *mbusformat;
> > > -	int ret = 0;
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * Make sure the format is supported, if not default it to
> > > +	 * YUYV8 as it's supported by both TXes.
> > > +	 */
> > > +	ret = adv748x_csi2_is_fmt_supported(tx, sdformat->format.code);
> > > +	if (ret)
> > > +		sdformat->format.code = MEDIA_BUS_FMT_YUYV8_1X16;
> >
> > If adv748x_csi2_is_fmt_supported() returns non-zero you default to
> > MEDIA_BUS_FMT_YUYV8_1X16, which is fine. But the non-zero return code is
> > propagated at the end of this function and to user-space falling the
> > IOCTL.
> 
> Ouch, I think in my tests the error message got ignored
> 
> >
> > Fixing that I hit another issue that kind of shows we need this format
> > validation ;-)
> >
> > The TXB entity only supports MEDIA_BUS_FMT_YUYV8_1X16 formats, the AFE
> > entity only outputs MEDIA_BUS_FMT_UYVY8_2X8... So with format validation
> > in place it becomes impossible to connect AFE to TXB and breaking CBVS
> > capture on Gen3. As a hack I added MEDIA_BUS_FMT_UYVY8_2X8 support to
> > TXB and I can again capture CVBS with patch 1-8 applied.
> 
> Thanks for testing analog capture, I don't have a setup to easily do
> so.

You can test it with the pattern generator on any Gen3 board.

> 
> Should we make the AFE front-end produce 1X16 instead ? The format is
> only used between the AFE and TXs after all, changing it shouldn't
> have any implication on the interoperability with other devices.

Not sure, the list of formats supported by each entity in the ADV748x is 
added by patch 'media: adv748x-csi2: Implement enum_mbus_codes' in this 
series. Where did the list come from? What formats do the AFE support?  
Why is the formats supported different between TXA and TXB ?

> >
> > >
> > >  	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
> > >  						 sdformat->which);
> > > --
> > > 2.44.0
> > >
> >
> > --
> > Kind Regards,
> > Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund

