Return-Path: <linux-media+bounces-12880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 310ED90275C
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 18:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BC741C20DA9
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 16:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A32414389E;
	Mon, 10 Jun 2024 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VtLdEU80";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fh/K3p8g"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D1C1EA6F;
	Mon, 10 Jun 2024 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718038784; cv=none; b=gei8pGNCdt6+0F9g7kmLe8DMClykAGX2jpkiQuKmume4nszJfd+fPQy9J4/UIrl98IlNKAMs5n/M7M1cAkE3SkPzedDrjfDFUM1hv1z7i8rU4dQJeoRCKqLDU9UKYEGhufLbMJw/6cYgcnMO5rs+g/EM+O/Wv0Uq9CxjhFvCDS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718038784; c=relaxed/simple;
	bh=3huiau6qlrNkKfWaufi5V+jQlWTAO41JYjpXr98MUIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JihWPom19Gm3YQQoRK2F/8OteLHCehww6bOE3M6spY9AduadhTT/Bs/GgSglkSSnmw9xENakieC1XIr8LJ8lX2Bw+Qls2ZcQCRCRHkzvAsVtO7SQH3KIQ0/9N8A5Z7UoF2B9xN0x2uZR1PwE+7EDBc/3fOpbjgHUx1zVsy/WVYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VtLdEU80; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fh/K3p8g; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id 8848418000EB;
	Mon, 10 Jun 2024 12:59:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 10 Jun 2024 12:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718038779;
	 x=1718125179; bh=dm/RILVXdRiU7G2dzezG7xRb98q5YeytvFv4g2s+ROM=; b=
	VtLdEU80NgLbeKybjMsLWfYo1R/oXrbTj3FncKvHJ7iOHZpMR54doPiAhbDwWKFu
	aqAfJ0FRyuR0H1zGdpL2xZ6U6zL0YPharZayYAugpNorkMXeACz/7BJBrdm0l2OP
	nXXVcZ+NxmGhAeOuWBhjjHS9zHnVhD4qraufH1YRkHCal/TPHn+cLB9e6bsgBex9
	DEApONKQX1g7xan+8GUtNr1sIW9iBqoXQh6limzBcJ5xOVuZ6vvuB/Oc+X6uX1zE
	ESrrXrXKm3LHG1jgWFhgpG/oeGqj4kAjPfsuUwEpwFlan14RU2fW3UHqQGTR8+YA
	/Jl/MfcWaYH1ZnEBloWznQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718038779; x=
	1718125179; bh=dm/RILVXdRiU7G2dzezG7xRb98q5YeytvFv4g2s+ROM=; b=f
	h/K3p8gmX/p8fSy8K7U9B5OyCosZPOHtXHR+RMpFrpZuOhc9EbCWbRiAJNqBZaM+
	p7GNRFr9XGSCO+EMf/TJft9eE07U6qF8G04Cep/OvjA38MJ+ir0JBEFSyrFFGNgx
	Rs1ZMY2XZUDx0E7/w44sdC7X+5D1kbnyiSrncqapT/rrxu5tQM4N3rxyJdshCTxY
	nuHSrizRDMl1OEoSWmQHvEawrLWaUNdQynasuTs1RiXLWK+hspXHL481lOsrpfsO
	lkt3Uc7RTOthkTFBU7UjTdm/MY4XfZnFajhHsvAKrrbElbC3x9vAMekJk6v3cqAR
	+okDv4fDwdmVIe5AHc+RA==
X-ME-Sender: <xms:-zBnZibLzWHtg4zkj8oYjpl6_9eOUnQ8nGXQa2HoOwfqqbShi2LYSQ>
    <xme:-zBnZla_IQyKlP8iRu7uUyfCRyvEbg8NAMVWOgv6jNdYdz65kx7_3p4AuWRNUX9OF
    OapWIARmfCeeJlRsrY>
X-ME-Received: <xmr:-zBnZs8T7mpi1-3YfOsqPh92ssGGXqkRPEdHIgyJhwd2_cm2adpH8FVMxMbiaOZXW3OJme5whInPqH-Ih-TnQtWFt1CVvqM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleel
    hfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:-zBnZkrV4Xb-MQaeCA7T1H8xx-paPjmfihOG3zBnVXuhfcj-NAJQ6Q>
    <xmx:-zBnZtoQRIzRU0ELbG7dbBlh3Gl5liJHBe33Ib-MvHMVWaI6G726Ow>
    <xmx:-zBnZiSl_fWVbzL6Dl4hgEoZCQY7M4PcTlaOBljiH9xDQ3DsylDdaA>
    <xmx:-zBnZto5K4dP_R1Jlp_L9R6TOzY9DQExRY8tfHFpjk9n018TtzDl2w>
    <xmx:-zBnZo3cnnWpQYJ-BpL9wi--nyYe1joPFxwibIARPeb1p3dwViVGApOX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 12:59:38 -0400 (EDT)
Date: Mon, 10 Jun 2024 18:59:35 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Conor Dooley <conor@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240610165935.GA382677@ragnatech.se>
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
 <20240610113124.2396688-2-niklas.soderlund+renesas@ragnatech.se>
 <20240610-screen-wolverine-78370c66d40f@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240610-screen-wolverine-78370c66d40f@spud>

Hi Conor,

Thanks for your feedback.

On 2024-06-10 17:03:49 +0100, Conor Dooley wrote:
> On Mon, Jun 10, 2024 at 01:31:23PM +0200, Niklas Söderlund wrote:
> > Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > index 5539d0f8e74d..168cb02f8abe 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > @@ -54,6 +54,7 @@ properties:
> >                - renesas,vin-r8a77995 # R-Car D3
> >                - renesas,vin-r8a779a0 # R-Car V3U
> >                - renesas,vin-r8a779g0 # R-Car V4H
> > +              - renesas,vin-r8a779h0 # R-Car V4M
> 
> Your driver patch suggests that this is compatible with the g variant.

Currently it is. But that not always be true, I tried to outline this in 
to cover letter.

    The V4M capture pipeline is similar to the other Gen4 SoC supported
    upstream already V4H. Currently all futures supported for VIN on V4M are
    also supported by V4H and the driver code can be shared. But as done for
    other R-Car IP bindings a new dedicated binding for V4M is created.
    This have proved prudent in the past where quirks are found even within
    the same generation as more advance use-cases are enabled.

-- 
Kind Regards,
Niklas Söderlund

