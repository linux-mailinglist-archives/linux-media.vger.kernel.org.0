Return-Path: <linux-media+bounces-21624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 050329D375B
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 10:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5BF4282C3D
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 09:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF6419CC36;
	Wed, 20 Nov 2024 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="alaojDzS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PsAOIOEQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADFD15C15F;
	Wed, 20 Nov 2024 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732096068; cv=none; b=MbAfggHWUvwnWBu4E8Gj34UWeA46yAwqFws+fW+SMA9MZ3OELV2LssHDwuQxl3UZaepdnZyHyGrxCHnV+4xibwv+K7dGYxtWfqXwd6ZMoKAEgvFDRsjhIL/7cu9jSkkQONQ3WmJRtz7DFtbE8HbLMS6LtS3PvxOerj1OHa8GUpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732096068; c=relaxed/simple;
	bh=5ZyhF4+JpDSOAiJy1FlB8lD77wwk3IteGZEMtzByJrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z24qn84HitI7+VE7CP6Y9YX4gSlFcs2nBkkwHgd7ScQgVTCQc4Kw79ScfxAE5581IkgvcJ+UmgB+XlKQqTyrJC+cYtUpxroptAO4hQ+uy8jTV9kLdGQU7pGO9U5yoTaCy27fEaByrQ740AfECtEW6PDszlQOyXvXZONpkUMVaaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=alaojDzS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PsAOIOEQ; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E05C025401A6;
	Wed, 20 Nov 2024 04:47:43 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 20 Nov 2024 04:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732096063;
	 x=1732182463; bh=cLmLgK8o79bQ1+bKApcLpo+mE3WZa2SFq/bNwaTW+hs=; b=
	alaojDzSIYLLYUhjmRqlCLysoXUeqBwM8bTxHBDHujyQ338Ch/IDjmPFU9tybWi3
	rwtKcdeqO+5kWMGEGLhIE8uCSQMrK08e3BooZT8dFiXjBicOSZgUMYr5OaB7KZcz
	Jwf78B49oMQ/nvboj0w41/jNgEFkrs/uGb7zYULyxmtZ2VWKtWCXMT9C0tfSq5hl
	My21KoXksh7cGG5GqdkZlkO/Gd3e4sWhCaDixb9z9wVcQVMMZXcAjqHdXlWKGlk6
	lF+55vnayAhU5OWoUOlwdZ/Yvd+xt5A2zNNM7iNV2Nh3qh1XRDR6v8pQyeghrs8q
	gZOoMuHYppfKOX+Cm6ENvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732096063; x=
	1732182463; bh=cLmLgK8o79bQ1+bKApcLpo+mE3WZa2SFq/bNwaTW+hs=; b=P
	sAOIOEQOZEZaZ1smGA8X1owI1cg2dTeH6lmPVVOBha1UFVKGEkeaIDJyxlPe575D
	mzpSvxCyd5npacMU1UWA/8HPfvazIKvyXiDKJ7J1qRS11iy3gL5Ms7VFbESYezx+
	P0dNnHLIP4KpuAiwvQ1oG8U/80RrOIqpgozmymIlNHY3L/iLxSjFHEK1J9pNCwYq
	5zjoViWrjpK2G8/lBVZZ5fpYe8XSNJ17EeSuqRzBSE9thRL+0UPt5MBkULlwGg8M
	YlUu7CqLaIa9RUN+ei6et4wyLIZX6hatkOO9FOTUqOckuUpSLLy3c/csOoP4Hrkh
	/e9ukaqwfe3ADg2ddwFsg==
X-ME-Sender: <xms:PrA9Z1J9SsNr0mkilJ3zfbfd5V32mxiO8sYkRRn-QpCKvtI7PBqBog>
    <xme:PrA9ZxIk3f7dMq-_KhxYgGVxU49xiyv_5KupkZQt-D4Nv__1UbPyaGv4AUZAjdgyt
    rXPVpxMbHN4w4X3q0Y>
X-ME-Received: <xmr:PrA9Z9vfiAY8GSCO5qVUfRHzi-URfulxpoHkfKAmk5HtEhhcYcqvCaOAWAux_ZR3MG8CrP6RnCAvpLWiNIlXP4TM0OWb-gvpLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeggddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvle
    einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
    dpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehs
    rghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhope
    hmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggv
    rhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhgruhhrvghnth
    drphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepug
    gvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:P7A9Z2Z-LU6h39Ved_VkIkyX17Gdw1uEimmOtti0TxZxepXx9B6xIw>
    <xmx:P7A9Z8Y5Ol9H3BO6YDU3IZ87wJqQ_9c_uN0EWswG83r1RXh37RpOkA>
    <xmx:P7A9Z6AZIVNfEaL8vKsQGV2m2ZHKY6tUTr_HQLGjxXBys6EWwYbngQ>
    <xmx:P7A9Z6Y6O_QwmrHukppB0CtO-Yids6CQ0UuxALycV_M7AathYEOeaA>
    <xmx:P7A9Z5TJWqCtphDe9RUU8Yjf7QboitSSKIS0RVYiRFurYKP9-ZOuynyv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Nov 2024 04:47:42 -0500 (EST)
Date: Wed, 20 Nov 2024 10:47:41 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] media: dt-bindings: Add property to describe CSI-2
 C-PHY line orders
Message-ID: <20241120094741.GS5315@ragnatech.se>
References: <20241119221249.539610-1-niklas.soderlund+renesas@ragnatech.se>
 <20241119221249.539610-2-niklas.soderlund+renesas@ragnatech.se>
 <Zz2YjNHk-ZTlXztw@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zz2YjNHk-ZTlXztw@kekkonen.localdomain>

Hi Sakari,

Tack för din feedback!

On 2024-11-20 08:06:36 +0000, Sakari Ailus wrote:
> Hejssan, Niklas!
> 
> Tack för de här lapparna!
> 
> On Tue, Nov 19, 2024 at 11:12:46PM +0100, Niklas Söderlund wrote:
> > Each data lane on a CSI-2 C-PHY bus uses three phase encoding and is
> > constructed from three physical wires. The wires are referred to as A, B
> > and C and their default order is ABC. However to ease hardware design
> > the specification allows for the wires to be switched in any order.
> > 
> > Add a vendor neutral property to describe the line order used. The
> > property name 'line-orders', the possible values it can be assigned and
> > there names are taken from the MIPI Discovery and Configuration (DisCo)
> > Specification for Imaging.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../bindings/media/video-interfaces.yaml      | 20 +++++++++++++++++++
> >  include/dt-bindings/media/video-interfaces.h  |  7 +++++++
> >  2 files changed, 27 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > index 26e3e7d7c67b..95491e5779ba 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > @@ -210,6 +210,26 @@ properties:
> >        lane-polarities property is omitted, the value must be interpreted as 0
> >        (normal). This property is valid for serial busses only.
> >  
> > +  line-orders:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 8
> > +    enum:
> > +      - 0 # ABC
> > +      - 1 # ACB
> > +      - 2 # BAC
> > +      - 3 # BCA
> > +      - 4 # CAB
> > +      - 5 # CBA
> 
> Do you know hardware documentation using lettes for the lines? I do agree
> it seems less confusing but I've seen only numbers being used.

Yes the R-Car IP core documentation and schematics uses the ABC naming 
for the lines. Unfortunately the documentation is not public.

> 
> > +    description:
> > +      An array of line orders of the CSI-2 C-PHY data lanes. The order of the
> > +      lanes are the same as in data-lanes property. Valid values are 0-5 as
> > +      defined in the MIPI Discovery and Configuration (DisCo) Specification for
> > +      Imaging. The length of the array should be the same length as the
> 
> s/should/must/
> 
> As this is a requirement for DTS authors in particular.
> 
> > +      data-lanes property. If the line-orders property is omitted, the value
> > +      must be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
> 
> I would:
> 
> s/must/shall/
> 
> > +      busses only.
> > +
> >    strobe:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      enum: [ 0, 1 ]
> > diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> > index 68ac4e05e37f..88b9d05d8075 100644
> > --- a/include/dt-bindings/media/video-interfaces.h
> > +++ b/include/dt-bindings/media/video-interfaces.h
> > @@ -13,4 +13,11 @@
> >  #define MEDIA_BUS_TYPE_PARALLEL			5
> >  #define MEDIA_BUS_TYPE_BT656			6
> >  
> > +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC	0
> > +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ACB	1
> > +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BAC	2
> > +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA	3
> > +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CAB	4
> > +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CBA	5
> > +
> >  #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> 
> -- 
> Med vänliga hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund

