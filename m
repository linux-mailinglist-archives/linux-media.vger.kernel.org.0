Return-Path: <linux-media+bounces-23648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B98AA9F5888
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 405AE165281
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B0A1F9F6D;
	Tue, 17 Dec 2024 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0cWBRzx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48718192D69;
	Tue, 17 Dec 2024 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734469984; cv=none; b=NGENmPgzKwVd6jByc9PSgmx0ztCY1A13xgnkByzFmwxiV+yoqjxBYkybXWrHKx/pAQwqBs33HBj8IDH/zhV3WQ0CoEzG7V2/QLogWCcVllF2O3BVm3qwgVlum6YN5rqI+ybOU4enjmByXyvn9BkTryofMDbz9L9Pd2hT/0zQe4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734469984; c=relaxed/simple;
	bh=RSlut8jUC8sevFzKiIGq9DG8Ecu/yvybyXCy7aSosFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C07XkivuHr7Wj8NNTKw6UhdqmAPzMYAJoXmsCxaUlkkMV0y9R0SFnoU5HktZEoVJbzIHeFrg7QHmgXbS5wApT3ug8k/m8Nx7URgrMFMBP6upGgb5YOXhHrf4EMwlp4pxX13Xg+ZPUp31FlJcZ9EbN1oA3yHN3/joNWtxXbI4ScY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0cWBRzx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734469984; x=1766005984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RSlut8jUC8sevFzKiIGq9DG8Ecu/yvybyXCy7aSosFQ=;
  b=G0cWBRzxhRoG3y6S7W2N/kbuBC+7EjQQ/4KxA4Bds7UhCTOm/bd02/TR
   HTkj7OxPZQ+qmmJ1Ab44moqzeVGoPSPqpoVlgNatmU1z+YCwXcwORlni4
   QOm2ySXCYWJkJxC4dQKB4DDFTpwXh+YONLD0ZqLaRj504N2lblDUBjYmo
   aSElppOzrPodGrOLpBa5ErZsA//n4KRGTiJ5EqY/ilFmiS4eu/thjibZL
   EsPE0+3pYNIm6E4GDx2PXe38OW3Ct98/4vdbk1aTcesuJw72tgTm3wT+M
   xUorb3uM08eM7RIjUBwyh82Gq3+v8Bzlq5dJmhQRnLr3IEx771ZaRsJ7w
   Q==;
X-CSE-ConnectionGUID: TNhKecAORh+Q8nCAe/NsdA==
X-CSE-MsgGUID: NgpGJLd0T9OrgtfvjK8DUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34640517"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34640517"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:13:03 -0800
X-CSE-ConnectionGUID: zNA3MaSrSiiBsrQK8IoBcA==
X-CSE-MsgGUID: TS6rTs+rQfySfEs9bMD6Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98457163"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:12:59 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E9F8C11F89A;
	Tue, 17 Dec 2024 23:12:55 +0200 (EET)
Date: Tue, 17 Dec 2024 21:12:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: media: clarify stm32 csi & simplify
 example
Message-ID: <Z2HpVyVEs7jn0VPd@kekkonen.localdomain>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
 <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
 <20241217-crawfish-tiring-792c535301d0@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-crawfish-tiring-792c535301d0@spud>

Hi Conor,

On Tue, Dec 17, 2024 at 06:24:42PM +0000, Conor Dooley wrote:
> On Tue, Dec 17, 2024 at 06:39:19PM +0100, Alain Volmat wrote:
> > Clarify the description of the stm32 csi by mentioning CSI-2 and
> > D-PHY.
> 
> > Remove the bus-type property from the example.
> 
> Why? What's there to gain from the example being (seemingly?) less
> comprehensive?

As the device has D-PHY, other options are excluded. I.e. that property is
redundant for this device.

> 
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> > index 33bedfe41924..e9fa3cfea5d2 100644
> > --- a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> > +++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> > @@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  title: STMicroelectronics STM32 CSI controller
> >  
> >  description:
> > -  The STM32 CSI controller allows connecting a CSI based
> > -  camera to the DCMIPP camera pipeline.
> > +  The STM32 CSI controller, coupled with a D-PHY allows connecting a CSI-2
> > +  based camera to the DCMIPP camera pipeline.
> >  
> >  maintainers:
> >    - Alain Volmat <alain.volmat@foss.st.com>
> > @@ -109,7 +109,6 @@ examples:
> >                  endpoint {
> >                      remote-endpoint = <&imx335_ep>;
> >                      data-lanes = <1 2>;
> > -                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> >                  };
> >              };
> >  
> > 

-- 
Kind regards,

Sakari Ailus

