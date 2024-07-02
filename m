Return-Path: <linux-media+bounces-14511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 015D992391E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 11:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 626A1B24FF0
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E631514E3;
	Tue,  2 Jul 2024 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="NpHIw/vI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bjx6ImGF"
X-Original-To: linux-media@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F97A14F111;
	Tue,  2 Jul 2024 09:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719911179; cv=none; b=l5HTY7UdnhYRGkzhG6QhJN9ljlcTbWTQ+6bDxEKM9Cg9s4APg8mjk0JzIXxXiNk52mXE2QeAXMx9frWIvv4AcjnMgeRC4dpSBj2QJqRVG0B1gD9lbAV6XQ62wE1ItdF5PN0+DhVc8ag6QUU26Q+73yTa5keLnWDBxUrdIwR7QAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719911179; c=relaxed/simple;
	bh=yT2dU406UigV/1rd2Qpji/wju03N3iYdlfmnLKqMHCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssKznDyu+c5seVylqEy0x8TPEL10pojvTKORmbBH0GUllrzib+GHfglrk4qhjdiPzm0ocHfZeKsXjMTH3jpJX1Wr3j2xSzkyi3lwZFcsuHG8msVWsLld/lZ8apsiqRjUpnKrI4+Q8kZhOykoies+ZSiKfNzRDWGMqmLUl9TGEE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=NpHIw/vI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bjx6ImGF; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4E1BD138053D;
	Tue,  2 Jul 2024 05:06:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 02 Jul 2024 05:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719911174;
	 x=1719997574; bh=3YWozVWx8MlebHOnbd6VGG/h5yBrUd/5xxmH3DK6qxg=; b=
	NpHIw/vIfYD0/psaKVqJEHpoE3BBf6r5Ln9m8A+3mZfGEVfmsnKF+zQtT5yU4wE3
	9qAQ0OM4adID7dNLKArhgiypPBNTduU82vOvDP7Ri3FXDm5USOC54799GBC2dzxk
	IEo098b667dQp6WxF52QcwdMsXTgxanU3u0rKH04rTAMbxxeLpd8uugckKtDeom8
	w8IoyTLaffdHZtVzoIacBDOM17aRLmgtwT74o3dlI917KWNMGVEXkeFdswmbwD57
	gcbIFO06yqglhq02gy0XhuN3moZj5yToAEDZ5CAwzrXUlEpnQbT9wfpux/cZ3npa
	gR69Oz+Acd2OVJnuBjmY8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719911174; x=
	1719997574; bh=3YWozVWx8MlebHOnbd6VGG/h5yBrUd/5xxmH3DK6qxg=; b=B
	jx6ImGFFucudZg5EeazFsFAlN5v4A88LqSi8hH9Fd/bPUxPvh33L+L6N56WCTWBj
	Vey8p0D0b8x/yZ4GuOH6Lp0IYeMaO5VMWZowF2gavRbHOEU7tj9n1TcO2bljrHur
	1lG3hqdXJudhQf37UZdJ/2g58ioUj+1Zd77xRvoFkKjbPrBSXGoe7B4EhJ8s4fIP
	M9uNTPvVxfY8phXvuXWDtZEGuXszmIuXBIpkrDyTDtEjZGwJx0XZqbuBFYhijSFt
	zcSdoq7y4tulGYJ/ZNdDay6yGtmXAytU0cwe/77PV7AedPAISonya20Ss6XztK/P
	YFSQZzP39kNkIi2c8+08A==
X-ME-Sender: <xms:BcODZh8OiKAeLYhUZUvuz8KDvfz3yQdj_DL5I1SLikwBRKf5USCaZg>
    <xme:BcODZlv5J8Vs1r_Ag4tZnx7NvGc7WDKfRqcQ1MVbRbv_gTsZSpFzvKs5jtM3KURc8
    -k4eJ9qfp4wn4NSiQQ>
X-ME-Received: <xmr:BcODZvBFUZ3J2h9W8svSQJHCWHBQkacDaAa9iAjddg5K-yF8WckEn5qQshcvEzygw0xs7cJoXl20d6dQoMzCYRY_jniAq74>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehgddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfff
    jefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:BcODZlfTk96t2ZKElvqmRMf-8IF20gwpjBw_25Xj1iXrgrYrZS-J_A>
    <xmx:BcODZmPqSBctXOd5_j89vNyGeExlWAcY6zrHxHFxpPCnMSrxi0f2ZA>
    <xmx:BcODZnlay9pAZ-nnDkAoN3QWt52kDupEZMJq0BUdbpfpUvJxzuCT9w>
    <xmx:BcODZgvNB6Rx0O9MzOar4y0WcRqDGZPwQibMAe15tRxmcWsQuiXE_A>
    <xmx:BsODZnHbmmDhI7J4vJoYETIonWdE74MIC1sh-e3Ka4s87STcnmBkCTEl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jul 2024 05:06:13 -0400 (EDT)
Date: Tue, 2 Jul 2024 11:06:10 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: media: renesas,vin: Add Gen4 family
 fallback
Message-ID: <20240702090610.GA2984619@ragnatech.se>
References: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se>
 <20240624144108.1771189-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUrEf9KFKCawY_XPu0WuJwaE+Se21jx-d4X_Ef+f2S36Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUrEf9KFKCawY_XPu0WuJwaE+Se21jx-d4X_Ef+f2S36Q@mail.gmail.com>

Hi Geert,

Thanks for your review.

On 2024-07-02 09:52:08 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, Jun 24, 2024 at 4:43 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The two Gen4 SoCs released (V4H and V4M) that have a video capture
> > pipeline the VIN IP are very similar.
> >
> > The datasheet for the two SoCs have small nuances around the Pre-Clip
> > registers ELPrC and EPPrC in three use-cases, interlaced images,
> > embedded data and RAW8 input. On V4H the values written to the registers
> > are based on odd numbers while on V4M they are even numbers, values are
> > based on the input image size. No board that uses these SoCs which also
> > have the external peripherals to test these nuances exists. Most likely
> > this is an issue in the datasheet.
> >
> > Before adding bindings for V4M add a family compatible fallback for
> > Gen4. That way the driver only needs to be updated once for Gen4, and we
> > still have the option to fix any problems in the driver if any testable
> > differences between the two SoCs is found.
> >
> > There are already DTS files using the renesas,vin-r8a779g0 compatible
> > which needs to be updated to not produce a warning for DTS checks. And
> > the driver will need to kept compatible with renesas,vin-r8a779g0, but
> > for new Gen4 SoCs such as V4M we can avoid this.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v3
> > - New in v4.
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > @@ -53,7 +53,10 @@ properties:
> >                - renesas,vin-r8a77990 # R-Car E3
> >                - renesas,vin-r8a77995 # R-Car D3
> >                - renesas,vin-r8a779a0 # R-Car V3U
> 
> I think R-Car V3U should be moved below, too, as it's the first
> member of the R-Car Gen4 family, despite the name.

I was a bit conflicted about if I should do this and opted to for the 
least intrusive change. But the change seems to have landed on a good 
note, I will do a new version that covers V3U as well.

> 
> > +      - items:
> > +          - enum:
> >                - renesas,vin-r8a779g0 # R-Car V4H
> > +          - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
> 
> If all differences in the pipeline can be devised from the topology
> in DT:

It can.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

> 
> >
> >    reg:
> >      maxItems: 1
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

