Return-Path: <linux-media+bounces-24245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B1BA01448
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 13:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 082193A3C34
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 12:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8441A8F80;
	Sat,  4 Jan 2025 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uCE6/0Jx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gFYmsnnZ"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1B72AF1C;
	Sat,  4 Jan 2025 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735993081; cv=none; b=U/oJv8pFHR/SVO9taEqIE3/I3Yea2T+E84Gn/lTy000JbikHJVWCCpbHiSVyAj67K+6EmoMjtZNagPN22WMKw5jZIoLUDxmleHWOPXLfcc5M5sBgj7eQmqa9AW+znbJiYJgxvfF4DAAJlV1EbjmjZMbngGWs4Gw98Xq2fcmD1JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735993081; c=relaxed/simple;
	bh=3/zp+xbAnh/GW5BHVr2/xuQ3/eRzbj/fuY/yqs0+xkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4wSsuqMFHWW2OZznhocKiTZSFi2fiKIpBycFQtMXLNnz/eKGRtsMhKmy3C6TqZOQi2K6Ue0tOmWou8wvok5Hgb25EyWHJ+YcxuBuRfCsdHP4aGAFvWaNkhv8mf0P/8rAB//Q9POA0Mala6c2Q/2uur9knrbviWkf0ySdo1khG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uCE6/0Jx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gFYmsnnZ; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E15FC2540112;
	Sat,  4 Jan 2025 07:17:58 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 04 Jan 2025 07:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1735993078;
	 x=1736079478; bh=nYNf1Wpr/jWWdGiF/YzURuwYGM1YwK5EdczkNpcg6Qg=; b=
	uCE6/0JxxuapKWqFfJO22MnNkVElVn2kV2JJnct0iP7bS+6DKylK1ZQpZUviK4yY
	uz9LcupdoeCtNYeOEeebJ7bP+KrerKMVuJPmp6Q3oIE0c5CZdO8Cjac3G5yGeWTH
	IHbSCy0nkJ8FjPvTLll1tYBz+j27OOopCl62KQGWPsWZXe1WQMpvX6j11j5fRiBj
	Kn4wv9PGgt/bXymjHsJMcodt8AS2vwe/LQQx1q9F6MgFQy3wQv8e1Cw58ryd2Zoy
	lY3elrNa/ynNym0mPi7X6vpeWPoFukr1K8jJNIp62L4UgAYoKWSZE3UStvwNmH95
	m7nYn7LWyie4FKhg+RmJaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735993078; x=
	1736079478; bh=nYNf1Wpr/jWWdGiF/YzURuwYGM1YwK5EdczkNpcg6Qg=; b=g
	FYmsnnZqBcMS6IeHjk5Rq/cqAFtlwwF+YkEsUHN1ohslXChr6/MtddAHTE9/UqRo
	CneHIDu7B/kqR1Ek3xJePL1QtOmbUujF+xH0djPlMPYu6/hA8VyPVSSVrm/F1toW
	QoilDjxNUvEz8QnoDfqiHBeK28xecpcH74e0D/fkc/I27CBeUB5p5gyyi5k0rDHi
	SP9aqBt0YGsyl5zgbFNwS/3JSVd93/NpQyj9QOIFBqooIEamPP5m7bjyUhzwERHy
	/PYjb/ilbFijsxCHxoYHm4Q/U7jgMZxNEB0sP1NwV868FpW0MP6Qff+FOjWYeH/J
	qZFawvLWDWIziaL2/UIeQ==
X-ME-Sender: <xms:9iZ5Zyb6zSb9T7ACZ-97wuYc01JY_H1j7hhf4H1TcsUB8zZQnuSi1w>
    <xme:9iZ5Z1bCb2svzncJvYY7StnCb0ozRAAkuRkIvJZVcjGdp3t5EGn2kL6IGqc0dxRwB
    duoF518ZPenGZnWTwU>
X-ME-Received: <xmr:9iZ5Z89a19kwd7PFaXfbIG1v7dLNy5ffAUw3WLAVb8HOBKVIj-T9fZ8PI2TO3S85W1pg7mtzdEP_DtfvNE4SIRzY1pt3N85S8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefiedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepshgrkhgrrhhird
    grihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghh
    rghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmh
    gvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9iZ5Z0oQ_7mdyiBS5d1Ka79Pc3y7UdMGHv_plBZo02joasfXQgvqrQ>
    <xmx:9iZ5Z9ovuMabvZYk448T7Yz5AjMaKHxe_mhhttA5k-Qof0vuh0BCkA>
    <xmx:9iZ5ZyTYSMHBWmhwXqtm482pP6R_Oizs5Rdm4rQn9VAd-i4hzysuPw>
    <xmx:9iZ5Z9rwAap4Af03GoUznIxCr-oRrjH2XLrtvbjCWrw5r0pvFotwkg>
    <xmx:9iZ5Z-Q7FVQ9_yTI1Z-nzy5LhrodV2uo4QxT2WEf8qOQq7wse-8UP_RC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Jan 2025 07:17:57 -0500 (EST)
Date: Sat, 4 Jan 2025 13:17:56 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: v4l: fwnode: Parse MiPI DisCo for C-PHY
 line-orders
Message-ID: <20250104121756.GG808684@ragnatech.se>
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
 <20241121134108.2029925-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXwqb7vhUeoMKDDJO5dp-V3LmnURZLSC1_ko=YL=cNyUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXwqb7vhUeoMKDDJO5dp-V3LmnURZLSC1_ko=YL=cNyUA@mail.gmail.com>

Hi Geert,

Thanks for your review.

On 2024-12-27 14:31:11 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Thu, Nov 21, 2024 at 2:41 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Extend the fwnode parsing to validate and fill in the CSI-2 C-PHY
> > line-orders order properties as defined in MIPI Discovery and
> > Configuration (DisCo) Specification for Imaging.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v1
> > - Use array instead of switch to get printable line order string for
> >   debug output.
> > - Wrap lines harder for 80 chars instead of 100, but keep string formats
> >   on same line even if they break the 80 chars.
> 
> Thanks for your patch, which is now commit 573b4adddbd22baf
> ("media: v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders") in
> media/master.
> 
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -250,6 +261,36 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
> >                 } else {
> >                         pr_debug("no lane polarities defined, assuming not inverted\n");
> >                 }
> > +
> > +               if (have_line_orders) {
> > +                       fwnode_property_read_u32_array(fwnode,
> > +                                                      "line-orders", array,
> > +                                                      num_data_lanes);
> > +
> > +                       for (i = 0; i < num_data_lanes; i++) {
> > +                               static const char * const orders[] = {
> > +                                       "ABC", "ACB", "BAC", "BCA", "CAB", "CBA"
> > +                               };
> > +
> > +                               if (array[i] > 5) {
> > +                                       pr_warn("lane %u invalid line-order assuming ABC (got %u)\n",
> > +                                               i, array[i]);
> > +                                       bus->line_orders[i] =
> > +                                               V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
> > +                                       continue;
> > +                               }
> > +
> > +                               bus->line_orders[i] = array[i];
> 
> This does not do any translation (unlike v4l2_fwnode_bus_type_to_mbus()
> to translate from MEDIA_BUS_TYPE_* to V4L2_MBUS_* definitions) ...
> 
> > +                               pr_debug("lane %u line order %s", i,
> > +                                        orders[array[i]]);
> > +                       }
> > +               } else {
> > +                       for (i = 0; i < num_data_lanes; i++)
> > +                               bus->line_orders[i] =
> > +                                       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
> > +
> > +                       pr_debug("no line orders defined, assuming ABC\n");
> > +               }
> >         }
> >
> >         return 0;
> > diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> > index 5bce6e423e94..e7f019f68c8d 100644
> > --- a/include/media/v4l2-mediabus.h
> > +++ b/include/media/v4l2-mediabus.h
> > @@ -73,6 +73,24 @@
> >
> >  #define V4L2_MBUS_CSI2_MAX_DATA_LANES          8
> >
> > +/**
> > + * enum v4l2_mbus_csi2_cphy_line_orders_type - CSI-2 C-PHY line order
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC: C-PHY line order ABC (default)
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB: C-PHY line order ACB
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC: C-PHY line order BAC
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA: C-PHY line order BCA
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB: C-PHY line order CAB
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA: C-PHY line order CBA
> > + */
> > +enum v4l2_mbus_csi2_cphy_line_orders_type {
> > +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC,
> > +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB,
> > +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC,
> > +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA,
> > +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB,
> > +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA,
> > +};
> 
> ... hence these values must be identical to the corresponding
> MEDIA_BUS_CSI2_CPHY_LINE_ORDER_* in
> include/dt-bindings/media/video-interfaces.h.
> So please provide a safe-guard to make sure they do not become out
> of sync.

This is a good point, I will create a follow up patch to address this.  
Thanks for spotting it!

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

