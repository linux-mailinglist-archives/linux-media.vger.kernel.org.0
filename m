Return-Path: <linux-media+bounces-10893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5B98BD0E0
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6538280EF2
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2000B154BE0;
	Mon,  6 May 2024 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lmXWUN7E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hDxvadfD"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF17381AA;
	Mon,  6 May 2024 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715007518; cv=none; b=IJS3wMbeziz97ZE62QujdXaYhBs6T06m+Z9d2jkgJBA0mH8ZAz9Ifgl8l7PDGZXlLdhT6WS7WOMl+p7PQ4oYLPDtv7RRh1L9H122lfOD6YqVpvbJs38PMtm5+92MojRLWmaPIAU+hkYD2FX9p0QuaJorhKNL/D81Wloqdsgnd9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715007518; c=relaxed/simple;
	bh=8Y6HWIy+ODEJoy8yIBEyIdUkjNXnB1qbEUq3O1aMbQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlEfATmiUvuDp1TIR5oF2QX6X6d26NlB3HOm3GKtg+rUWV5d1wBhQ36I3Y5Po/ySK77PefWnISyhaoto+9rlRUZ6Q2rrySL0/11Q1adbaTEbhyJrk4IjbVell7cW+cy9LKNnV15l4EMftQq2rwGH5KJIrlzgRcksAaSLVdsOTn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lmXWUN7E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hDxvadfD; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id E6D801C00117;
	Mon,  6 May 2024 10:58:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 06 May 2024 10:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715007513;
	 x=1715093913; bh=hYR7G9ID3+Vx2k9ecv2IxG7SXALtsc3mBZo/DPNpFVs=; b=
	lmXWUN7EQAQc9nd/BCaCYlvVtW8lXxKe7oFPqkCw+v+ka2PWkVZV4/Y42tHdl1Od
	D/Ou5E8VbUzs9Wdmd7Bc6EUXuKR/62e9YbhEis1yKqhjFS96utyUE6qHTi1YtgCh
	hGeVXnDodMN1d+RF7oRXiTJLrXe+EOJtilBaQiCQe3rQkyB+ypPWGMS6omKdfotO
	e02FCuURmMZsX5ovb10LhHq4L4z2++0A/Ut6xYSJ2ySg4q09+BKCYZn6IfM+MIuS
	kXjsRgv+WZUbQ1sTgmJe5fH1j0IULuqOlk1gn9oxIeX2+GojglrlxBurD4ddXS5O
	TIpjSLNm9okMf9lSZHjLvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715007513; x=
	1715093913; bh=hYR7G9ID3+Vx2k9ecv2IxG7SXALtsc3mBZo/DPNpFVs=; b=h
	DxvadfDDT76JsU3SwcRhcqtzf/5w+Vj1LhA6pYSR1NtK7xHj+fjkrz7IqtyqB48S
	HcAJUPxDlpW6HK1g6lGyiF++GsmWzzdawavM2l75fHNLr1GqrIee6CT2OX4mJ/wh
	AOiFOn3dDW5JeUE2/nZXvFkDx29L5AYiH69ow/crrJuRYn6htX5CYgrbQVSSOxWO
	0t5LSAucgGoi3LxX9aOTu5hNyPvnLjjzONt9zAaxGv+zbHY0TETVI5OOdMRhHPYC
	BwD8H26AYxTTANF0iPBZPj3rJAe4HAeSSuVKNcnUBmjaN8v/Mgo3rB+g9LlaQPeB
	Kk/MfL1QhbhM68QHj0+sA==
X-ME-Sender: <xms:GfA4ZpHqGVWGrqPTSkoBW7JqC-C0tkuuSTmfMOfLqmbnSPxSnU1RVw>
    <xme:GfA4ZuVBaciHKlo5ytd6xuK7hWF6zfkm0qPtUhc4C-e_wRdXeOTDuS31iRDq8nfXy
    E5cakGwr-8Rg2A8aeA>
X-ME-Received: <xmr:GfA4ZrIkgTKHJ1vcAutgcFbtKKF9YPF8jA13JbkR0wp145uFXen8_aiVy65su4S8-fAV_96p94F_wqMo133OAeooYxzViDk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddviedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:GfA4ZvH37_xp4AFqxPQD5iSOBLitHDlVg1sVMDTQRow5on8hcdY3qw>
    <xmx:GfA4ZvXbXhegoQSjvLZvekM76Qn42LdXM_E5ePQs0VgDmh4WWDX0lg>
    <xmx:GfA4ZqNhxOnbJ0j4oCZBBR-J1so2sIMySIPHZK-bCsr4odbiHKGg8Q>
    <xmx:GfA4Zu2VN8emC0RDN5elmoO3E4gu9oyJfv7RFODuyi1HlviIwsfrlw>
    <xmx:GfA4ZmEPa2MTi6r6GyQQuwteoNPxjt-Sk7yZJDYVsmybfNRY1bJ1tVlo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 May 2024 10:58:32 -0400 (EDT)
Date: Mon, 6 May 2024 16:58:30 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/11] media: adv748x-csi2: Validate the image format
Message-ID: <20240506145830.GF720810@ragnatech.se>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-8-jacopo.mondi@ideasonboard.com>
 <20240506113730.GA1017753@ragnatech.se>
 <xcvfc2rphz52r6vyexlmjdqwmsudlu4urx2ngn3g55hmsh44yf@nw4rwfresuy7>
 <20240506141201.GE720810@ragnatech.se>
 <jh5eeatxmbqrllo5ff4bi22xsrfqibcw7j74ug6oycmvxg5sxg@rqccohyfouqa>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jh5eeatxmbqrllo5ff4bi22xsrfqibcw7j74ug6oycmvxg5sxg@rqccohyfouqa>

Hello Jacopo,

On 2024-05-06 16:36:01 +0200, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Mon, May 06, 2024 at 04:12:01PM GMT, Niklas Söderlund wrote:
> > Hi Jacopo,
> >
> > On 2024-05-06 15:21:30 +0200, Jacopo Mondi wrote:
> > > Hi Niklas
> > >
> > > On Mon, May 06, 2024 at 01:37:30PM GMT, Niklas Söderlund wrote:
> > > > Hi Jacopo,
> > > >
> > > > Thanks for your work.
> > > >
> > > > On 2024-05-03 17:51:22 +0200, Jacopo Mondi wrote:
> > > > > The adv748x-csi2 driver configures the CSI-2 transmitter to
> > > > > automatically infer the image stream format from the connected
> > > > > frontend (HDMI or AFE).
> > > > >
> > > > > Setting a new format on the subdevice hence does not actually control
> > > > > the CSI-2 output format, but it's only there for the purpose of
> > > > > pipeline validation.
> > > > >
> > > > > However, there is currently no validation that the supplied media bus
> > > > > code is valid and supported by the device.
> > > > >
> > > > > With the introduction of enum_mbus_codes a list of supported format is
> > > > > now available, use it to validate that the supplied format is correct
> > > > > and use the default YUYV8 one if that's not the case.
> > > >
> > > > With the update tests for the change in patch 4 I hit multiple issues
> > > > with this patch for CVBS capture.
> > > >
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > ---
> > > > >  drivers/media/i2c/adv748x/adv748x-csi2.c | 27 +++++++++++++++++++++++-
> > > > >  1 file changed, 26 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > > > index 219417b319a6..1aae6467ca62 100644
> > > > > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > > > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > > > > @@ -215,6 +215,23 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > +static int adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx,
> > > > > +					 unsigned int code)
> > > > > +{
> > > > > +	const unsigned int *codes = is_txa(tx) ?
> > > > > +				    adv748x_csi2_txa_fmts :
> > > > > +				    adv748x_csi2_txb_fmts;
> > > > > +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> > > > > +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> > > > > +
> > > > > +	for (unsigned int i = 0; i < num_fmts; i++) {
> > > > > +		if (codes[i] == code)
> > > > > +			return 0;
> > > > > +	}
> > > > > +
> > > > > +	return -EINVAL;
> > > > > +}
> > > > > +
> > > > >  static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
> > > > >  				   struct v4l2_subdev_state *sd_state,
> > > > >  				   struct v4l2_subdev_format *sdformat)
> > > > > @@ -222,7 +239,15 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
> > > > >  	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> > > > >  	struct adv748x_state *state = tx->state;
> > > > >  	struct v4l2_mbus_framefmt *mbusformat;
> > > > > -	int ret = 0;
> > > > > +	int ret;
> > > > > +
> > > > > +	/*
> > > > > +	 * Make sure the format is supported, if not default it to
> > > > > +	 * YUYV8 as it's supported by both TXes.
> > > > > +	 */
> > > > > +	ret = adv748x_csi2_is_fmt_supported(tx, sdformat->format.code);
> > > > > +	if (ret)
> > > > > +		sdformat->format.code = MEDIA_BUS_FMT_YUYV8_1X16;
> > > >
> > > > If adv748x_csi2_is_fmt_supported() returns non-zero you default to
> > > > MEDIA_BUS_FMT_YUYV8_1X16, which is fine. But the non-zero return code is
> > > > propagated at the end of this function and to user-space falling the
> > > > IOCTL.
> > >
> > > Ouch, I think in my tests the error message got ignored
> > >
> > > >
> > > > Fixing that I hit another issue that kind of shows we need this format
> > > > validation ;-)
> > > >
> > > > The TXB entity only supports MEDIA_BUS_FMT_YUYV8_1X16 formats, the AFE
> > > > entity only outputs MEDIA_BUS_FMT_UYVY8_2X8... So with format validation
> > > > in place it becomes impossible to connect AFE to TXB and breaking CBVS
> > > > capture on Gen3. As a hack I added MEDIA_BUS_FMT_UYVY8_2X8 support to
> > > > TXB and I can again capture CVBS with patch 1-8 applied.
> > >
> > > Thanks for testing analog capture, I don't have a setup to easily do
> > > so.
> >
> > You can test it with the pattern generator on any Gen3 board.
> >
> 
> ah well
> 
> > >
> > > Should we make the AFE front-end produce 1X16 instead ? The format is
> > > only used between the AFE and TXs after all, changing it shouldn't
> > > have any implication on the interoperability with other devices.
> >
> > Not sure, the list of formats supported by each entity in the ADV748x is
> > added by patch 'media: adv748x-csi2: Implement enum_mbus_codes' in this
> > series.
> 
> > Where did the list come from?
> 
> From the chip datasheet ?
> Section 9.7 "MIPI Ouput format"

Thanks I found it now, maybe add that to the commit message of that 
patch? I was hunting for register values in the register control manual 
and found nothing ;-)
> 
> >What formats do the AFE support?
> 
> The AFE doesn't really "support" any format in my understanding. It
> connects to one of the two TXes with an internal processing pipeline,
> and the TX transmits the received video stream on the serial bus.

Ahh! I think we found the root of the issue we talked about the other 
day in the VIN format handling about 1X16 vs 2x8 and CSI-2 ;-) That 
likely came from this setting.

Yes, with the information from the datahseet I do think we should change 
adv748x_afe_enum_mbus_code() to report MEDIA_BUS_FMT_YUYV8_1X16 instead 
of MEDIA_BUS_FMT_UYVY8_2X8.

> 
> > Why is the formats supported different between TXA and TXB ?
> 
> You should ask the chip producer :)

If only we could. Imagine how much time we save if we could talk to them 
and have datasheets instead of guessing half the time ;-)

> 
> >
> > > >
> > > > >
> > > > >  	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
> > > > >  						 sdformat->which);
> > > > > --
> > > > > 2.44.0
> > > > >
> > > >
> > > > --
> > > > Kind Regards,
> > > > Niklas Söderlund
> >
> > --
> > Kind Regards,
> > Niklas Söderlund
> >

-- 
Kind Regards,
Niklas Söderlund

