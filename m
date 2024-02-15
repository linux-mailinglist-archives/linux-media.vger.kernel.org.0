Return-Path: <linux-media+bounces-5219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF35856534
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 15:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 906FA1F24511
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 14:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34BD13175E;
	Thu, 15 Feb 2024 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fK9xup7P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A542131743;
	Thu, 15 Feb 2024 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708005662; cv=none; b=ISXgSPJQJ5hLMCqNkC25XBlpsi8aOaOf8r8MrgDW+cJPo0fH1R2ek9PUd++mynqSRoDFXDNQlpmWk8Z1b24Q8IF2EsVb2DcWH8cF2yqs4V8oYYfANnPwJtEUDmEMLG9BRJmoTlDg3t9kgtu3CGdrDV5nbBjgFE4ZS+MyIg0BJ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708005662; c=relaxed/simple;
	bh=AoV2FcT5GnLVyJhfwTJTRdtE/FdznPqSlJ0AXzkDRJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQ5yiaa8qspZL6RoA/Jy2fPWp59l9xZn1b8EOsb4ThnjRJPvvNZmu26IasDL+LipMJehl6gjCdgQR1GfYd5iZN37Bm3rXkRybXqTyc3+3ECFfAt8Tam2BMWYiG46kFaR9KrtrY9SwHYSOlZKGpXXFpNMUZeiuvtPeMk0e+yjGJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fK9xup7P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D0DC433F1;
	Thu, 15 Feb 2024 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708005661;
	bh=AoV2FcT5GnLVyJhfwTJTRdtE/FdznPqSlJ0AXzkDRJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fK9xup7PvbUOxhbTFEOLPjDlrRTI/2iVmYTdg6CD47kThNboaW11h5UinQfXKm/Xb
	 hZxnxfP2s5esDnti2QIfXNUARJIJrXrP5sVGc9m+YNlUDAWduo+iWBsvz+kp5cDDjX
	 3dS0yXWs7LQybkJZuG45s5idnNWlun82WdEBgC6GvGn4zanciBSH9A7Cmn5ezjpOsV
	 yH1hofPbl8XU85CmmP3rZaGGVZy5qtdHaDaUtRr2HV1pgN9N/l3k0rZpM6U72JpbkJ
	 5YQdEy0OtN15ZADZ+np0ZClW4sDXUYeFaqiSViHxC6sOYvljk1JHLhpVBGesxfrs3A
	 2KnE+uc4Uh3qg==
Date: Thu, 15 Feb 2024 08:00:58 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 6/8] media: dt-bindings: Add bindings for Raspberry Pi
 PiSP Back End
Message-ID: <20240215140058.GA4147262-robh@kernel.org>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-7-jacopo.mondi@ideasonboard.com>
 <7f7979af-8eda-48cd-a334-bb64ddf5b9b8@linaro.org>
 <myfjzqh4wqa3lf4dcrgaswrarlh7sril6vz3mtnbz646rwxylt@oz75b5j5srot>
 <b55f4d1e-2e77-4539-8d18-8d8f2185b501@linaro.org>
 <5db2c830-2615-4416-9bb1-18fcd2a3a980@ideasonboard.com>
 <CAEmqJPo-A4wiAiuCa2pb84UU_rTTo9i5P9Kj6eo78MFEs1Y45w@mail.gmail.com>
 <20240213104405.GB5012@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213104405.GB5012@pendragon.ideasonboard.com>

On Tue, Feb 13, 2024 at 12:44:05PM +0200, Laurent Pinchart wrote:
> On Tue, Feb 13, 2024 at 08:35:39AM +0000, Naushir Patuck wrote:
> > On Tue, 13 Feb 2024 at 07:28, Tomi Valkeinen wrote:
> > > On 12/02/2024 11:05, Krzysztof Kozlowski wrote:
> > > > On 12/02/2024 09:50, Jacopo Mondi wrote:
> > > >
> > > >>>> +properties:
> > > >>>> +  compatible:
> > > >>>> +    const: raspberrypi,pispbe
> > > >>>
> > > >>> Nothing more specific? No model name, no version? It's quite generic
> > > >>> compatible which in general should not be allowed. I would assume that
> > > >>> at least version of Pi could denote some sort of a model... unless
> > > >>> version is detectable?
> > > >>
> > > >> The driver matches on a version register and that should be enough to
> > > >> handle quirks which are specific to an IP revision in the driver
> > > >> itself.
> > > >>
> > > >> Considering how minimal the integration with the SoC is (one clock, one
> > > >> interrupt and one optional iommu reference) even if we'll get future
> > > >> revisions of the SoC I don't think there will be any need to match on
> > > >> a dedicated compatible for bindings-validation purposes.
> > > >>
> > > >> However I understand that to be future-proof it's good practice to
> > > >> allow a more flexible scheme, so we can have a generic fallback and a
> > > >> revision-specific entry.
> > > >>
> > > >> Would
> > > >>
> > > >>    compatible:
> > > >>      items:
> > > >>        - enum:
> > > >>          - raspberrypi,pipspbe-bcm2712
> > > >
> > > > bcm2712 is manufactured by Broadcom, not Raspberry Pi, so it should be
> > > > rather Pi model?
> > >
> > > Indeed, this is something I don't get. If the BE is in the bcm2712, is
> > > it not a broadcom IP? Why is raspberrypi in the compatible name at all?
> > >
> > > Naush, Dave?
> > 
> > The Backend (and Frontend) IP are both owned solely by Raspberry Pi,
> > and the BE is instantiated on the BCM2712.  So I think "raspberry" in
> > the compatible string is correct here.
> 
> Following what we do with other SoCs, we could have
> 
> 	compatible = "brcm,pispbe-bcm2712", "raspberrypi,pispbe";

Nit: brcm,bcm7212-pispbe

Otherwise looks fine to me.

Rob

