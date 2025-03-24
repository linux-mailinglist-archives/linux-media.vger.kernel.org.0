Return-Path: <linux-media+bounces-28613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1145A6D644
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 165C8188E0AE
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F4925D21E;
	Mon, 24 Mar 2025 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SfCAn7tE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xiBH4ekJ"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A229433A6;
	Mon, 24 Mar 2025 08:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805320; cv=none; b=vEa+fgZHm4lw28FZP/gp/irpi5YCyetWDNZ9pLpo9F/Tg5qruqeDVERpsrKFAfRT9GDgy7vc7EZzLa61CMpmc43CBlZ1hI4HXYU9DhwOwKsFHVChz9B1K2uM29BdKLsGKQsN3PQ73DhQMbYrFtG+sfGDMXPeRrad5tE6haZ/bqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805320; c=relaxed/simple;
	bh=cwYcZRPCXPa9emtvchfdiZ66o4ChkzTRAs+VQebJAwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTp2P2d+JgUmt+wYaaDyfCwIDziZXUDA2hEiILH8On3sP8/iOg9s55CkLlnbTBi+sXAXX9XtxTk9qumyj1yKr6iN339rUWJ7IaDcv8bcliP3sLTaFo5eicuUix3X1Io1NfYN3a/qFEEH2u9Suz+7WSO556QnY2iF633huXXAEJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SfCAn7tE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xiBH4ekJ; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4C5BA11400D4;
	Mon, 24 Mar 2025 04:35:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 24 Mar 2025 04:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742805316;
	 x=1742891716; bh=HNAvz1h/RancO+tAPGxOIbKhxi5ud3TT5gGiuFDk/Gk=; b=
	SfCAn7tEbPjF8yz83ZCXa1g2Ruy6rCNcPUiewQ7yuTg2mNb39gAESafAqJbuGhZX
	GYaFNZDBO6QZUQBUpuE2kDZVNZZUk+SUJPqKcFzFK7330aFNAoNoX2N47mfhx6XR
	Z6VYqn5KLDTwk4UB162rGVrxGSsFK1TFSfLaWzbZVrGiBrTpZvJgw/pv1z//LPJ0
	eR9uq78PeySoHy9EuaexDJ0g+mXJNSrsf6ccrULDoHvGhWSTeYyeMC6iIttVYKHw
	wHD+0LM4yiakjlnaioSSm+EIv8PVyw6dU+g5trxD9A9VQBE4ew4NfAfDOsalpn1G
	vKD4f/G4KXQkWzWV49m2Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1742805316; x=
	1742891716; bh=HNAvz1h/RancO+tAPGxOIbKhxi5ud3TT5gGiuFDk/Gk=; b=x
	iBH4ekJv+ipmT3CCUF7vpBuE/PcVlb2ARBAjfopG8q0iHOfbtFGP1S+83mLUewAw
	hxMlN+QKFnuqle9lkgKpdoxi9djnHIkn0p43wLQRZw4x+K0RByRvOOhb+aOW8xs8
	25DqYKrEdleiJwiZKHkNR9YYDcGznz5dsYqoa+bVGy4rqMjI0sztss2j4eAWEcGB
	TSS48pqEJKlfmVcaxGfDzGhGikauWKBP74quwY5knx12bE0rYUVX8j/Pq5qaH8sR
	Bt7sS8xKDmDplfg5KoeS+Us5dwHmS+1Kzc3RmmTz2ZLczb41c/tlVDY0EiB8yZCb
	VqOK6U+nV6J48oofVGL1Q==
X-ME-Sender: <xms:RBnhZ89Kt0IuPLZplJCv41C31cytLM-1O-ORJdiXH8QVwiyiPGbSag>
    <xme:RBnhZ0vwCtYHqOpz3VrVEnZZ8DyvsXcfnfXyUxzmuFpu89-4Se4ILUKg0nj65IdH2
    TnnVNPw3EdGbSI2rds>
X-ME-Received: <xmr:RBnhZyAKEH3CcHCXZDn3U-zHCIn2e0LOSGFEqFw_iPwRSDFlCQAx48OqH7jVxrVRjMirTZQ-ChRqpXMbRdfZYymZ25X_ARZbyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpehnihhklhgrshcushhouggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpefg
    vedtueejhefgueekuedtjedtheeijefgieffgeevveeuvdejheefvdeiuefgleenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthh
    grrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjrggtohhpohdr
    mhhonhguihdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpth
    htohepkhhivghrrghnrdgsihhnghhhrghmodhrvghnvghsrghssehiuggvrghsohhnsgho
    rghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:RBnhZ8d7UAM_IHge2oLepkQ808LcxT5nfa6amoh1sbYFUXVE3OtsSg>
    <xmx:RBnhZxNCMaJx79RA-e0JebwIMCb4drOaWqCnj3wcEiqfVWU6uhr7ZQ>
    <xmx:RBnhZ2nQwDQk4OvrIycG9KxO1Qpop2QWb6Ob_3XSzWIh99rho1T5tw>
    <xmx:RBnhZzukwFJDNjOhVwgFl8iBPt9FFEV0gagitEzLqk5kqa12hYCSPA>
    <xmx:RBnhZ0cjDWPcvF3AQ7LaoDwpILFKoBJmVDXqmwh2LwpfYM5kFfQMFgJ4>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Mar 2025 04:35:15 -0400 (EDT)
Date: Mon, 24 Mar 2025 09:35:13 +0100
From: niklas soderlund <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 7/7] media: vsp1: pipe: Add RAW Bayer formats mapping
Message-ID: <20250324083513.GA2884853@ragnatech.se>
References: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
 <20250321-v4h-iif-v6-7-361e9043026a@ideasonboard.com>
 <20250321215634.GB11255@pendragon.ideasonboard.com>
 <dkatmlnysvsy3g4n3m53bzxcqx4avklzfctxgjv4hl6sd7fte3@vlfsvasn53d7>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dkatmlnysvsy3g4n3m53bzxcqx4avklzfctxgjv4hl6sd7fte3@vlfsvasn53d7>

Hello Jacopo,

On 2025-03-24 09:27:56 +0100, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Fri, Mar 21, 2025 at 11:56:34PM +0200, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Fri, Mar 21, 2025 at 04:45:39PM +0100, Jacopo Mondi wrote:
> > > Add formats definition for RAW Bayer formats in vsp1_pipe.c.
> > >
> > > 8-bits RAW Bayer pixel formats map on VSP format RGB332.
> >
> > s/map on/map to/
> >
> > > 10, 12 and 16 bits RAW Bayer pixel formats map on RGB565 insted.
> > >
> > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > ---
> > > v3->v4:
> > > - Fix SWAP bits for RAW 10, 12 and 16
> > > ---
> > >  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 72 ++++++++++++++++++++++++-
> > >  1 file changed, 71 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > index 8e9be3ec1b4d..a51061738edc 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > @@ -30,10 +30,80 @@
> > >   */
> > >
> > >  static const struct vsp1_format_info vsp1_video_formats[] = {
> > > -	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> > > +	/* Raw Bayer 8-bit: Maps on RGB332 */
> > > +	{ V4L2_PIX_FMT_SBGGR8, MEDIA_BUS_FMT_Y8_1X8,
> > > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > > +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> > > +	{ V4L2_PIX_FMT_SGBRG8, MEDIA_BUS_FMT_Y8_1X8,
> > > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > > +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> > > +	{ V4L2_PIX_FMT_SGRBG8, MEDIA_BUS_FMT_Y8_1X8,
> > > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > > +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> > > +	{ V4L2_PIX_FMT_SRGGB8, MEDIA_BUS_FMT_Y8_1X8,
> > >  	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > >  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > >  	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> >
> > Similarly to the media bus codes, could we have a single entry, using
> > V4L2_PIX_FMT_GREY ? Same below with V4L2_PIX_FMT_Y10, V4L2_PIX_FMT_Y12
> > and V4L2_PIX_FMT_Y16.
> 
> mmm, the SRGB mbus codes come from the R-Car ISP input image format.
> I understand these are multiple identical entries, but having
> somewhere a translation from SRGB->Y formats just to have fewer
> entries here it feels a bit of an hack
> 
> >
> > This would still duplicate entries, as V4L2_PIX_FMT_Y1[026] are
> > essentially treated the same, and they are identical to
> > V4L2_PIX_FMT_RGB565. We could ask the ISP driver to use
> > V4L2_PIX_FMT_RGB565 (and V4L2_PIX_FMT_RGB332 for 8-bit raw) when
> > configuring the VSPX, but that's a bit of a hack.
> 
> Indeed, but I don't think 3 "duplicated" entries are any bad, if
> that's how the HW work.
> 
> >
> > Another option would be to handle the translation in
> > vsp1_vspx_rwpf_set_subdev_fmt(). I would still in that case only expect
> > the V4L2_PIX_FMT_GREY and V4L2_PIX_FMT_Y* 4CCs from the ISP driver. This
> 
> Do you expect the ISP driver to translate SRGB to Y formats ?
> 
> 
> > patch could then be dropped.
> 
> So are you suggesting to translate in the ISP driver
> 
>         SRGB8 -> RGB332
> 
>         SRGB10/12/16 -> RGB565
> 
> Niklas, what do you think ?

I would rather keep the true formats in the API between the VSP and ISP, 
that is keep it as is. If really needed maybe a translation in the VSP 
driver prior to querying vsp1_video_formats[] could be added? But this 
driver is complex enough as-is :-)

> 
> 
> >
> > What's your preference ?
> >
> > > +
> > > +	/* Raw Bayer 10/12/16-bit: Maps on RGB565 */
> > > +	{ V4L2_PIX_FMT_SBGGR10, MEDIA_BUS_FMT_Y10_1X10,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> >
> > The bpp values are used to calculate memory offsets. Unless I'm
> > mistaken, you should use 16 here, not 10.
> >
> 
> I'm rounding up in the vspx driver. However it is true these formats
> are sampled in 16bpp chunks, so I can use 16 here.
> 
> > > +	{ V4L2_PIX_FMT_SGBRG10, MEDIA_BUS_FMT_Y10_1X10,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > > +	{ V4L2_PIX_FMT_SGRBG10, MEDIA_BUS_FMT_Y10_1X10,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > > +	{ V4L2_PIX_FMT_SRGGB10, MEDIA_BUS_FMT_Y10_1X10,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > > +
> > > +	{ V4L2_PIX_FMT_SBGGR12, MEDIA_BUS_FMT_Y12_1X12,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > > +	{ V4L2_PIX_FMT_SGBRG12, MEDIA_BUS_FMT_Y12_1X12,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > > +	{ V4L2_PIX_FMT_SGRBG12, MEDIA_BUS_FMT_Y12_1X12,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > > +	{ V4L2_PIX_FMT_SRGGB12, MEDIA_BUS_FMT_Y12_1X12,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > > +
> > > +	{ V4L2_PIX_FMT_SBGGR16, MEDIA_BUS_FMT_Y16_1X16,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > > +	{ V4L2_PIX_FMT_SGBRG16, MEDIA_BUS_FMT_Y16_1X16,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > > +	{ V4L2_PIX_FMT_SGRBG16, MEDIA_BUS_FMT_Y16_1X16,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > > +	{ V4L2_PIX_FMT_SRGGB16, MEDIA_BUS_FMT_Y16_1X16,
> > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS,
> > > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > > +
> > > +	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> > > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> >
> > This doesn't seem right, the patch is changing the V4L2_PIX_FMT_RGB332.
> 
> If I'm not mistaken V4L2_PIX_FMT_RGB332 was
> 
>         { V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
>           VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>           VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
>           1, { 8, 0, 0 }, false, false, 1, 1, false }
> 
> and is now
> 
>         { V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
>           VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>           VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
>           1, { 10, 0, 0 }, false, false, 1, 1, false },
> 
> Seems like I messed up the bpp
> 
> With that fixed the diff looks saner. Thanks for spotting.
> 
> 
> >
> > >  	{ V4L2_PIX_FMT_ARGB444, MEDIA_BUS_FMT_ARGB8888_1X32,
> > >  	  VI6_FMT_ARGB_4444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > >  	  VI6_RPF_DSWAP_P_WDS,
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

