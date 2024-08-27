Return-Path: <linux-media+bounces-16943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B483B961657
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 20:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC758B22901
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 18:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3871D1756;
	Tue, 27 Aug 2024 18:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="s34m8H/o";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bh2Nl+zB"
X-Original-To: linux-media@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D04C1D4604;
	Tue, 27 Aug 2024 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781820; cv=none; b=oOYEM46rTdeVwV9irkRKLQKmU3zYr55n9TrqNUAf5sPTc/0d1Gs+nFB+/ueArROs4XYzRqWCWbQvlCBqC9SS+E9OOtOxjYXrXZdHw0mQTasff4HFhESZVYSyPfnJUO/0ZSvXLUlJPPmZjESlMvOE0iM75up07GUDK9rQSRIkovM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781820; c=relaxed/simple;
	bh=fi75CE9Dmnr402+Qru85rQJ+VU/jjpjocjDbI+llpcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgZ0OWAmVM65CXEvylu+BY6Cwhsa4z/6Fj1EvHyLnMXPShX4Zrkw6biUXggjmO/ymYnm58fdFpTAwZF2elcjbb57/+tLOQzdn2Fyg9U55QAcQSuxS4O07+7dM4nbJrPSQp0A3BCZsusnU3YHUwaufJ4I4BS1bM/eXwFoG6enEIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=s34m8H/o; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bh2Nl+zB; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 67C29138FC5C;
	Tue, 27 Aug 2024 14:03:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 27 Aug 2024 14:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724781817;
	 x=1724868217; bh=cn4ZviJGDcdyhhzDBSryAJZ+KuZM5gRUrsULy8EG294=; b=
	s34m8H/oz8CnQon+ffKodLcUuHJUaBAC32+Xcdjllz3kioVmUP334t/6k19M11zq
	tHMV0y84iMEM2g9QAQ5BAEQUz6USfwFrEOc8KNP0sJQYAPAoJeOl+EvTpEWjfvlZ
	jyLePSBKaUZdwEM6hdkGa+GthhFs0Yn4RqiDed37lF3jIWgfYBCha8TtjLCtuB5f
	E9ktYL2Fa9dJ2uIYzVyln4panoqFwizWYiK/5PJ4+y9riZ1ON2awhRyzBPaazDab
	on0J6W7lgfC+gVbGMIBIE3An5bunf2/4KJ/kmyeO5F6a28rqn6V0uJXUc/Pq8r4W
	bSta/Jm2XQGpgDmIYZcq6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724781817; x=
	1724868217; bh=cn4ZviJGDcdyhhzDBSryAJZ+KuZM5gRUrsULy8EG294=; b=B
	h2Nl+zBZBZXHFeW49rUu2OhDiYiUQ+3OqHOCb7BHAOvGSVik0lS2tnx0Qyo5T5WT
	OKTfC/xZoxXGYCTV7TyvfehFlGq3IYV/DpKrTU234pbnMbny/fMzXy+6ElmYua7o
	D/3HyTtnaMeJfsoQAAVhbRRcigybxrBbwhc6L4dD8lX8fBW1uLFyrE0cb3xVT5YK
	ARMBowHRCVP9yToO56YbzDXBp7nE7+QtPXdom5y8XDa5Sa4OEKUABXqcRVfe95KC
	/sBTbMBewokaHZHer0qQSClqeRei9+ISb/0fuNeZm2ECyDWRbpIJ17FNNUG8PR0V
	dP8h8FicwlhPXaDbW4hug==
X-ME-Sender: <xms:-RTOZjZMnREAYueLgxbjuYc_8cuNJLqOmBIKmCa0ulF6HC5HFjtwyQ>
    <xme:-RTOZiYTMDBqTK08p2f4yKs-1DHPFkmOl5g9UsGEZbpVar0iYyFbvMrOfYmeaqeU0
    AubgsckOIUjHRNYMu4>
X-ME-Received: <xmr:-RTOZl-jFEj2oKZRmkSAoTo_61ZTbQATUmezVwm9e1cQ3RubtIyuItu7ya38mIeJPuUn0J2qJpdTjPSMYORgiMFIMWV1Mdh5Hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeftddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftd
    dvleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrd
    hsvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrod
    gutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhho
    uhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlih
    hsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:-RTOZppVCH7HxsyUmpT8DF67RJL_l0gPI5lMHhmPEoaynm3dY1Ihag>
    <xmx:-RTOZuqSsNhGgd7rYY-XfjGsP2F6BpPbvzRHT8x1TfL4l7D7F6FJgw>
    <xmx:-RTOZvRly8PwQG_qBO4NBsV9wh_6fdccvWt3Zh4RHFCO_CAYdgSrIA>
    <xmx:-RTOZmoywSLz8k7jDklbWk0B0vbyVpvKFxFtWkay9xjUFCZQ3D1_YA>
    <xmx:-RTOZrTdlj41cuq2t39m2__EBzNDVMZRWkb_MNolwm--W_z08XhYOeH2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Aug 2024 14:03:36 -0400 (EDT)
Date: Tue, 27 Aug 2024 20:03:34 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: maxim,max96712: Add compatible
 for MAX96724
Message-ID: <20240827180334.GI2636928@fsdn.se>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-2-niklas.soderlund+renesas@ragnatech.se>
 <7dadf8dd-ad54-4e4f-a336-adc3444df4b0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7dadf8dd-ad54-4e4f-a336-adc3444df4b0@kernel.org>

Hi Krzysztof,

Thanks for your feedback.

On 2024-08-27 16:53:20 +0200, Krzysztof Kozlowski wrote:
> On 27/08/2024 15:18, Niklas Söderlund wrote:
> > The MAX96712 and MAX96724 are almost identical and can be supported by
> > the same driver, add a compatible for MAX96724.
> 
> The driver statement in this context is meaningless. You did not make
> them compatible so what does it matter?

Agreed, this commit message can be improved.

> 
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > * Changes since v1
> > - Group in series together with driver change.
> > ---
> >  .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> > index 6c72e77b927c..26f85151afbd 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> > @@ -25,7 +25,10 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    const: maxim,max96712
> > +    items:
> > +      - enum:
> > +          - maxim,max96712
> > +          - maxim,max96724
> 
> Driver change tells these are compatible and version is detectable.
> Express it in the binding with fallback or explain in commit msg why
> they are not compatible.

It is, and as you point out the commit message can be improved. It 
should have made it clear that what is supported by the staging driver 
(test pattern generator) is similar for the two devices, the full device 
have larger differences.

Before this driver can move out of staging the full GMSL side of things 
needs to be added and there they differ more and will need different 
bindings as one device have more PHYs then the other for example. Run 
time detecting is not enough to be able to verify that in DTS files.

I will fix this for the next version.

> 
> 
> Best regards,
> Krzysztof
> 

-- 
Kind Regards,
Niklas Söderlund

