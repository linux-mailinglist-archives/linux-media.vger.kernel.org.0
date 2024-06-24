Return-Path: <linux-media+bounces-14058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1216914BB5
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A0032850AC
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 12:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE261E4A9;
	Mon, 24 Jun 2024 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WJ/RQJfB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p9X2j/tE"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A41913D283;
	Mon, 24 Jun 2024 12:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719233459; cv=none; b=pv4RAgqVdx8RYl8uAHPpshOB00/DqCxv8sdkmPS7sp4FvOqiURGQM23t+CKyqJ9MUmuYd+dIkFSTXqKdOfUnjFI91bBO+Jzi15EPr4F+4iX6pukF/TygPhoYOMTAtQXTbZapuYpNGJzJhwHYEx5CiV6skWehJocEMsfJ9LjPnVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719233459; c=relaxed/simple;
	bh=ctgdbibK8qrLhLFxlOx5o8uHstHifivnCLU13AWTmrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPgVWcyM1jnAdpRtZvSSvCY7f01XTU7tZCIpFeDpsCPJ6hX2IzC2FrY1OAYt+yJjelkNcqRXCbq7MewTzelRxrlF9BNr6ShHx5KxB3AXc2EDknQnVTt8Awalu1FhPpHJ0z/8QhhDP9W6T480nnFu8lIKeJkrm25W/FeH6y4hWT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WJ/RQJfB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p9X2j/tE; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 63A5511401F9;
	Mon, 24 Jun 2024 08:50:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 24 Jun 2024 08:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719233455;
	 x=1719319855; bh=9FKXmuvvtTgyfmM9iIXbD4I6XveTrAqwbHf7eAJPzeA=; b=
	WJ/RQJfBzVG+D1l1abELjvfM15tekG+OvYJULPqA7glFAyn9Ki9M7eIbbCgkqDgw
	EyvW0uicQnxj2didcqlARlZWoYPbD4W1JZNSRTikspJEsHVGRYoAAXiHoNm86tu2
	N8e5k170sVxT/tBRcd2Jt2sFOTMb6484zoMVL9VR1ASbkm23373HgKsqusY4ZUWS
	qWZDcEl5Ckg+bEYDXK+H0kz+jswaK582fAA5vYldfafHoorgUlMXhAKEuT2+5WUZ
	OeBA1lg9f6oJkNLCrxXrPB2/rW5IwoNgfakDGtELizy6vgT2ss3YvLeSNZr5Z4bN
	TlRwU2IRwROMTXbMDqSMhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719233455; x=
	1719319855; bh=9FKXmuvvtTgyfmM9iIXbD4I6XveTrAqwbHf7eAJPzeA=; b=p
	9X2j/tEKvIgXxWq+49RD+mftOE8bcSBlNfLuHJY7Rkh97CFFHZKix/mNy8hzCfCV
	GRW+PVv+FC8ijhU3JX3NcxQmftsg+5VFSCmC6gmSqW5a8NHKqh6/dheD7tcZWxzs
	9wFCfVwVzpjie84qUF347CA8k925yxYW4hT0T3AlxCpLsDZPAvdn8gzID856eQDC
	m6Ql4kkfcwB9moPaMlZohQAb9VRq9UEIfvb4gLUk9l9ynX29SchQhCBBfD4g2AO2
	b07m52xFvVP/kVQzhCjwNyP38p4BE5nTE5WQnJ6XM8YfiLaS78CIuIVjPSQk1T+H
	2X1V2Dg+bSQ3yJb8oPYlw==
X-ME-Sender: <xms:rmt5Ztctwiz3F8K08roz7edH-UYbOO2PhBF1ygaF-KVEGdKnOX3CNg>
    <xme:rmt5ZrPKBoCFA9c7IRyK_q6cftM3TtGWIoXayv_bO_sIe-XJavBZWeDo4eL5Ysjdi
    Ry1CqbiQjtRGdhDse4>
X-ME-Received: <xmr:rmt5Zmh4ZatvTyIS3NCVW6h0OLhDFSZKKxpEWPC3wNULkHyFfhj4BX0WPL8q5hjnHqKGG0BEspqwg98PE7iJwPbd0EmOuxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeektedvvdev
    jeeijeduffetjeffueeufffffeejfedvffetueevtdfffeetheektdenucffohhmrghinh
    epvghmsggvugguvgguqdhrvggtihhpvghsrdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguod
    hrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:rmt5Zm8gJZnI95QddetA_G2OshXS-ckEJabWiGwnbBSoJnm8sYYLaQ>
    <xmx:rmt5ZptNivSZ2Et8MBNxLMgNN-xJKAC56aEGP9KW6dA6PIfjPrPGEg>
    <xmx:rmt5ZlHpZtYBqU40-RM51xI2l9brak1o4zjxxLrdN-o8dvmimqE-Xw>
    <xmx:rmt5ZgOvuYYoOVPsM-8WUrFqeOWmduVt_MzyDTbfcJzmeOxFNVa-TA>
    <xmx:r2t5ZiF2i7z5WJXWHVEordjDKDBzTF0GctwGKzdB_5ELUtyU79ICxYou>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jun 2024 08:50:54 -0400 (EDT)
Date: Mon, 24 Jun 2024 14:50:51 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240624125051.GC3655345@ragnatech.se>
References: <20240619153559.1647957-1-niklas.soderlund+renesas@ragnatech.se>
 <20240619153559.1647957-2-niklas.soderlund+renesas@ragnatech.se>
 <20240619-passage-iodine-9f944b26a30d@spud>
 <20240619185607.GT382677@ragnatech.se>
 <20240619204321.GU382677@ragnatech.se>
 <20240620-gating-coherent-af984389b2d7@spud>
 <20240620172237.GA3623951@ragnatech.se>
 <CAMuHMdUaWMiQ_wrmX14uwkeU1D_55ehmJD8+GZ4eydWfw4Mi-Q@mail.gmail.com>
 <20240624092029.GB3655345@ragnatech.se>
 <20240624-rented-danger-300652ab8eeb@wendy>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624-rented-danger-300652ab8eeb@wendy>

On 2024-06-24 11:36:40 +0100, Conor Dooley wrote:
> On Mon, Jun 24, 2024 at 11:20:29AM +0200, Niklas Söderlund wrote:
> > Hi Conor,
> > 
> > On 2024-06-21 09:21:24 +0200, Geert Uytterhoeven wrote:
> > > Hi Niklas,
> > > 
> > > On Thu, Jun 20, 2024 at 7:22 PM Niklas Söderlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > On 2024-06-20 17:27:00 +0100, Conor Dooley wrote:
> > > > > > +      - items:
> > > > > > +          - enum:
> > > > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > > > +              - renesas,vin-r8a779h0 # R-Car V4M
> > > > > > +          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
> > > > > >
> > > > > > If so I can see that working as I could still fix any issues that come
> > > > > > from differences between V4H and V4M if needed. If so do you think it
> > > > > > best to add this in two different patches? One to add the
> > > > > > renesas,rcar-gen4-vin fallback (which will also need DTS updates to fix
> > > > > > warnings from exciting users of V4H not listing the gen4 fallback) and
> > > > > > one to add V4M?
> > > > >
> > > > >
> > > > > I would just do:
> > > > > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > index 5539d0f8e74d..22bbad42fc03 100644
> > > > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > @@ -54,6 +54,9 @@ properties:
> > > > >                - renesas,vin-r8a77995 # R-Car D3
> > > > >                - renesas,vin-r8a779a0 # R-Car V3U
> > > > >                - renesas,vin-r8a779g0 # R-Car V4H
> > > > > +      - items:
> > > > > +          - const: renesas,vin-r8a779h0 # R-Car V4L2
> > > > > +          - const: renesas,vin-r8a779g0 # R-Car V4H
> > > >
> > > > @Geert: What do you think about this? This would be a first use-case for
> > > > compatibles crossing SoC DTS files that I know of. I'm a bit uneasy
> > > > going down this road.
> > > 
> > > Me too ;-)
> > > 
> > > > Would this not also effect the existing users of renesas,vin-r8a779g0
> > > > which would now need something similar to what you propose below with a
> > > > list of SoC compatibles and a fallback.
> > > >
> > > > >
> > > > >    reg:
> > > > >      maxItems: 1
> > > > >
> > > > > Which requires no driver or dts changes. That could become:
> > > > >       - items:
> > > > >           - enum:
> > > > >               - renesas,vin-r8a779h0 # R-Car V4L2
> > > > >               - renesas,vin-r8a779i0 # R-Car R4P17
> > > > >           - const: renesas,vin-r8a779g0 # R-Car V4H
> > > >
> > > > FWIW, on Gen2 where fallback es where useful compared to Gen3 we did
> > > > this with "renesas,rcar-gen2-vin".
> > > 
> > > We do know there are differences (albeit probably small) among the R-Car
> > > Gen4 VIN implementations, so I am reluctant to add a family-specific
> > > compatible value.  Typically we only use a family-specific compatible
> > > value if the IP cores are known (or better, assumed ;-) to be identical.
> > > 
> > > And sometimes our assumptions turn out to be wrong...
> > > See slides 25-33 (last two for the numbers) of my talk at ER2019
> > > https://embedded-recipes.org/2019/talks/herd-your-socs-become-a-matchmaker/
> > 
> > Do Geert's slides help to explain the R-Car perspective on why a 
> > family-specific fallback compatible might not be desirable, and why the 
> > SoC specific one is proposed? 
> 
> IIRC, it was you that wanted to use a "family-specific" fallback, I
> don't understand what you want from me. If you look back at even the
> context in this email, you can see you suggesting one and my counter
> point.

Sorry that I'm spreading my confusion around and taking up your time.  
I'm trying to understand if Geert's reply helped outline why a single 
SoC specific compatible is being used here, if so I was hoping a revised 
commit message would make this solution acceptable.  

If not I will try to summaries the issue and the different proposals so 
we can find a design that works and address some of the confusion before 
sending a new version.

-- 
Kind Regards,
Niklas Söderlund

