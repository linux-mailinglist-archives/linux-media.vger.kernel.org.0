Return-Path: <linux-media+bounces-16876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA45960415
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92E321F23705
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 08:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3291917E6;
	Tue, 27 Aug 2024 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="EMe4J2wQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aQVMEw9P"
X-Original-To: linux-media@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781EB13A25B;
	Tue, 27 Aug 2024 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724746362; cv=none; b=Y6Y4LI9dsBb5BKb8LycqgXqP9sNWSQcjh641ZV6TV4g1k9uJQOIqLMzElR7H/AS7MIVP2+/W6jxEAed8xM0BMhXw/7BI9OogYwhzN2JHUJoxa/WVo8UcGOBEi0s6QflkslAX83PuAPoHxTal9fAMWYBn49KcXTFVlA7lwDUZmDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724746362; c=relaxed/simple;
	bh=qAoI/blZPQzW+zuQx2VQaHMoGi33Xpcxj3YhMr1VWPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5OUUITlgl1TSgSX+bfXtcdEYtSONNJPqi/QCnAnikhCtwba+rWF+BRq4Eu5oAfpe81hyukbGZlw2QECuS7iTA162F/0Ug0DDvPELfI+riIuYQ8XMJX1vXvElb+iXWTbFG+0LYnbZC/oTn1PVabVCWvSgypyahJW+dIAQ2EWBnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=EMe4J2wQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aQVMEw9P; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 138F0138822F;
	Tue, 27 Aug 2024 04:12:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 27 Aug 2024 04:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724746357;
	 x=1724832757; bh=t8zwrFvJJEIIj0GFYOuMXFR+QQWo68sXLTxrrRDvfck=; b=
	EMe4J2wQSqfX5pSC2S6i671AzolMKXxFAFIDR4yv3I36e3AaLN1YzCtJFa9UtSG3
	klTmRfBa7w8Q515h6xNV6t7G0GRNJjoXzjwOLu1i/+F9Jvy/hEjF11kSv0jNI3+J
	bQoig0/vq/fgHqutrHjUrlH9Gu7TMFJD7KREad8Rn/yzjRtRCDAsrgQzg6d6VVFT
	ilBPS8fVmEeBwTC+TjBvAn1gxtIj4tzpZy7+FI+fKn9yxez4163jlA/J2yHSMwVO
	+qQUnG1yr3apM9+9FwL0jkfc1N4qqzFu3IGoqY1RdG0vW7dKlnq2HfwvD7zzxOtv
	jddv1fD26thjs6QeC2P3Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724746357; x=
	1724832757; bh=t8zwrFvJJEIIj0GFYOuMXFR+QQWo68sXLTxrrRDvfck=; b=a
	QVMEw9PEWPyVaCmboHm98KDZSMyHA9lRlVpz55cpQT3O2QgrbLtlQEtXUyqPftCl
	UDu9wT9I/1IjrRhrVQGcaIxeVmNtGOTmYoIKd2OFYaVv8jHBblpdFpJht4MsYZtP
	w56XBSJlGe73n3WI63nPdI0bArruJhI9ou69VJmBCmpciKUbQJAOXXXlQPhlTiFr
	6IIIx1vRaAXezKnMedG/mF4UVzsB1u40ujqwmpW516qCEL8f02UtAir7JIgg3HR4
	q5NGlJOHnBVw82L2b16h+jUBZu/TOZJxw+5n53scwhlSTvMNMnLT5hT35RqqaSuz
	cMwxA1utwhhk3d1mlCtvA==
X-ME-Sender: <xms:dIrNZpe4ChwBRID8XCBVOOB_UTJAiW3V6qnb1lOyejdGAENUxZC2Jg>
    <xme:dIrNZnNekvcUtqkXh8JFn67ewKzLwLOgJr47d9QZILIoFvTBrNe9g7mpoBl7cCdcA
    WR7Hps-AcOxfldBGGQ>
X-ME-Received: <xmr:dIrNZijhka2HqnS_ZbZpdGBPeEZzKaQ56XatprCEcVbfRJ6jGMUAZk72YxPQnHsJjl0UF-ijp3G670RZ4l-adgNlHoKmEWyCzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeftddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeffkefgudekgefhhfejtedviedtgeetieekffeiudfhgeevteejvedtffdvke
    fftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguod
    hrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgr
    uhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiithho
    fhdrkhhoiihlohifshhkihdoughtsehlihhnrghrohdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgv
    shgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:dIrNZi86Kn32eTUwiOWQfXFrdCC5M7-qSQPs0-EVPV9mqR1HKXnuMg>
    <xmx:dIrNZlvE2Nxqsim5XXgiiM6VNl6VJmUIoq3_7oy20vOrVijWvZcc7g>
    <xmx:dIrNZhH5fzevua2aM3KL6skaZDiXhp2ckw86RHL317167b9hXdigIQ>
    <xmx:dIrNZsPji2d0PCh7in58OncSinktalmv5nQRYhTCjHfnK6fwdKRXmg>
    <xmx:dYrNZhFyupFet745qyseqxNSyNkdRlcJ8-zJWVhenmDUjcl7qZDq0Cop>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Aug 2024 04:12:36 -0400 (EDT)
Date: Tue, 27 Aug 2024 10:12:33 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: media: renesas,isp: Add Gen4 family
 fallback
Message-ID: <20240827081233.GE2636928@fsdn.se>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-2-niklas.soderlund+renesas@ragnatech.se>
 <cnca2gdh6c3kg5ybb4dxzlca5c7jsvz4tomibpkf746syejvmf@ndbq4qkykume>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cnca2gdh6c3kg5ybb4dxzlca5c7jsvz4tomibpkf746syejvmf@ndbq4qkykume>

On 2024-08-27 08:31:22 +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 26, 2024 at 04:43:47PM +0200, Niklas Söderlund wrote:
> > The ISP Channel Selector IP is the same for all current Gen4 devices.
> > This was not known when adding support for V3U and V4H and a single SoC
> > specific compatible was used.
> > 
> > Before adding more SoC specific bindings for V4M add a family compatible
> > fallback for Gen4. That way the driver only needs to be updated once for
> > Gen4, and we still have the option to fix any problems in the driver if
> > any testable differences between the SoCs are found.
> > 
> > There are already DTS files using the V3U and V4H compatibles which
> > needs to be updated to not produce a warning for DTS checks. The driver
> > also needs to kept the compatible values to be backward compatible , but
> > for new Gen4 SoCs such as V4M we can avoid this.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v1
> > - New in v2.
> > ---
> >  Documentation/devicetree/bindings/media/renesas,isp.yaml | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > index 33650a1ea034..730c86f2d7b1 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > @@ -22,6 +22,7 @@ properties:
> >        - enum:
> >            - renesas,r8a779a0-isp # V3U
> >            - renesas,r8a779g0-isp # V4H
> > +      - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
> 
> Adding generic fallback post-factum is odd, does not feel reliable.
> Instead use specific compatibles as fallbacks.

I agree, it feels a bit odd. But this was the road we hammered out at 
great pain for how to be able to move forward with this issue for the 
other IP block involved in video capture for R-Car Gen4, VIN [1]. This 
just mirrors that long discussion decision for the R-Car CSISP.

I would hate to have different solutions for the two.

1. [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
   https://lore.kernel.org/all/20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se/

-- 
Kind Regards,
Niklas Söderlund

