Return-Path: <linux-media+bounces-16877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3754896041B
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3375283665
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 08:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963B21946CC;
	Tue, 27 Aug 2024 08:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="klVFeogV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z2iEVlU6"
X-Original-To: linux-media@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4083C13A25B;
	Tue, 27 Aug 2024 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724746422; cv=none; b=cr7lBfyRJ1nATh6cv2OpJtcsUbX4So+4ZThXnKNHu1nyQ//aIQOYqnseadm2VRBIrbalthngkxSvY3jfd8QuvtIZ/NEmL9WjkOyQIom/k0J40o0svfCwc4DsuECyrXMk0grgQINC8Im4K9Ygp1zAh/az8EfVsUWl58B4cfnhPOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724746422; c=relaxed/simple;
	bh=CfhXaRPdfpF00dLmUGho2oyCI1F5FmEj8etU3p9RS88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dr2x2J3bUanMIlWLw/vq6qzsM75B1JdDoozMI9IihGwJUDsz1k4iHwUh9EqgWhxt/VE5NDJbIU0FoNw/YJMYSHKuPxCYa+pUivNIy83Hr2pzIwYaHR7eWLvOdziJlndwwYjpXfyBLYxiP7g0dF5MWRpEjGpRcnpdNyH/wPLfv9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=klVFeogV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z2iEVlU6; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal [10.202.2.42])
	by mailfout.nyi.internal (Postfix) with ESMTP id 548D8138AFCD;
	Tue, 27 Aug 2024 04:13:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 27 Aug 2024 04:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724746419;
	 x=1724832819; bh=Bj52+IBQqf17DJDFuJwh8RF0KaDsj5FNtKw9uv5SD08=; b=
	klVFeogVvc/wX2Wh9eYtm/Xe0a7tnUiVtUM/g29I013SoFV8T/LU6ULmbwCUXXQv
	VAERy+qDmhbuPdL9haja3YTQcGA1iVy30QmUVUVbhTxQn7wdhQqgI+pPeHUIWENC
	LyQM6U8ZoWC0wlVeHXd8siDfjBOpDy8LyFi8HxBITzjDrBDl8OG51Uqyj/HEZunz
	dHHDVRb0nvrTSU7auLnN3VoygshV/fp2wI3h4dCMlC5Ek/DqLkn7nRGHEhNy4BEF
	Z/PxfQY5ofuGd9C09Z2qPSZdmg889quoMnZR0jid3OGpCLYIFVsa5gWHdCxZskuV
	+CJAGbUFW8AptMggH6QbvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724746419; x=
	1724832819; bh=Bj52+IBQqf17DJDFuJwh8RF0KaDsj5FNtKw9uv5SD08=; b=Z
	2iEVlU6AySOh+LHy12Eom+8p4KahQALBSjHFN1a0PM4VIzt5m1hysWWBJqspRY/Z
	jOwZbQJ3MkhWhCbFb1LrTlddanhiENeEuAdE8y4Mr7LN6B8786bbZRUqgOco7Oy4
	ftlQ/jvT+tcavlv6ATJAubAZuNPMqWwaTG7E4euMtD7Ts0NQkzmrJhydfg+NDAJX
	kLzW1a3BX7yhQiVrOPQvAIN9ds9lBW3ZcO2k1UlOO5cn8/MxWSkvRCmzI2RJlBNQ
	7mgfs5AZhPCvAAM6Z1RDGnvhz10R0XVP17Rt4LpXK4nTi0ns0pVuQiz/mvahKwxm
	XqU4XISmULAd1Pg63D9BA==
X-ME-Sender: <xms:sorNZrHzBZUEAHB8j1pySikiOefROTCnmsS3HXi8zsfHv7AmsS1Pcw>
    <xme:sorNZoXkmzk9Pjfke4f0OrVmLm0muQ_-kdnNfshyrOXNezW4OzojJ4r4QFX6hqCP7
    dQSf--VQjNAjDRebxo>
X-ME-Received: <xmr:sorNZtIirI55iDXR6ch7mL7f7zGmfR1P-IFDgH-Pd9aORyitEVhHeTH7jPuW_dO5CJBIcL8UYM2IBINdit58IGh_HnKvzuxcOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeftddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    sghijhhurdgurghsrdhjiiessghprdhrvghnvghsrghsrdgtohhmpdhrtghpthhtohepmh
    gthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhi
    nhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehrohgshh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohif
    shhkihdoughtsehlihhnrghrohdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihgu
    vghrrdgsvgdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:sorNZpHrDuHaKesZEN5vAJi0TUK35njdnKn5p_flax9cgBooI4MU9Q>
    <xmx:sorNZhVX7l6C5zHn0CYbn8WjVxKjvhH10ES3jWzrCF-o6_2b2LTjkg>
    <xmx:sorNZkOO-otrHHME7Pq0mK627DrJ42IJUES0mDpMkwiWNBB6ZKs3sQ>
    <xmx:sorNZg1W4GcU9zIhqAk0TrM5E4Z0Qp0zXuMyKHZer_tryr3alVH0Rw>
    <xmx:s4rNZqPYHN1Oj_1psNkrDX2GZiCgvlR-zpP5UldM4m5nsQRLmjSL0HDU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Aug 2024 04:13:37 -0400 (EDT)
Date: Tue, 27 Aug 2024 10:13:36 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] media: rcar-isp: Add family compatible for R-Car
 Gen4 family
Message-ID: <20240827081336.GF2636928@fsdn.se>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-5-niklas.soderlund+renesas@ragnatech.se>
 <TY3PR01MB11346E6810025CECA51A86B53868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB11346E6810025CECA51A86B53868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>

Hello Biju,

Thanks for your feedback.

On 2024-08-26 14:48:07 +0000, Biju Das wrote:
> Hi Niklas Söderlund,
> 
> Thanks for the patch.
> 
> > -----Original Message-----
> > From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Sent: Monday, August 26, 2024 3:44 PM
> > Subject: [PATCH v2 4/6] media: rcar-isp: Add family compatible for R-Car Gen4 family
> > 
> > Add the Gen4 family compatible. This will be used instead of a SoC specific compatible for the new
> > Gen4 SoC V4M. Two Gen4 boards (V3U and
> > V4H) have already been added prior and their bindings need to be kept for backward compatibility.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v1
> > - Reworked to add a family compatible instead of V4M specific one.
> > ---
> >  drivers/media/platform/renesas/rcar-isp.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
> > index 4512ac338ca5..6504c7025a40 100644
> > --- a/drivers/media/platform/renesas/rcar-isp.c
> > +++ b/drivers/media/platform/renesas/rcar-isp.c
> > @@ -429,8 +429,11 @@ static int risp_probe_resources(struct rcar_isp *isp,  }
> > 
> >  static const struct of_device_id risp_of_id_table[] = {
> > +	/* Keep to be compatible with old DTS files. */
> >  	{ .compatible = "renesas,r8a779a0-isp" },
> > +	/* Keep to be compatible with old DTS files. */
> >  	{ .compatible = "renesas,r8a779g0-isp" },
> > +	{ .compatible = "renesas,rcar-gen4-isp" },
> >  	{ /* sentinel */ },
> 
> Nit pick:
>     Comma can be dropped from last entry.

Indeed it could be dropped from the "sentinel" entry, but that would be 
a different patch.

> 
> Cheers,
> Biju
> 
> >  };
> >  MODULE_DEVICE_TABLE(of, risp_of_id_table);
> > --
> > 2.45.2
> > 
> 

-- 
Kind Regards,
Niklas Söderlund

