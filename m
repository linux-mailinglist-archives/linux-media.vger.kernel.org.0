Return-Path: <linux-media+bounces-19732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFD19A0592
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 11:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10EE71F229AF
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 09:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678F4205E3F;
	Wed, 16 Oct 2024 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gjH9Khxt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5269D20493E;
	Wed, 16 Oct 2024 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729071088; cv=none; b=dTbqkPOViZRVzQPqSGcKNTgxmjE4p/tdIyeRku9xRyeNLSU0zDi6iO+MvMfsUX1UGv2uQ6N31P/07WSyN5uTNnccDWIvAIC5N5zoJIHDKUK/rLYco2MDrvZ7wvm9JDxxzE/gjkabFX3KuTGQagDfLkGCm0cXru1Dpw2s4bSbuxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729071088; c=relaxed/simple;
	bh=/L1b9AdL2HXgz34mhyUDEDVV3REaYKbjl+/94hIA/do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZ7yk3zsneZ+rK5CdFT/aTeFhXbBzhyh2FEm4nG0Y7KcbkYm36tD9o983yKoUCPxAV4lbH/WnuNWegcgl3SX/LGXQxFjpSzZaLKqXwvqo1P/8dVVUJG09OCyt1W5gNjxEWHGM1CVad1Xniwn/8Yl3I5gxZP7SzuTgkPWd7pU5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gjH9Khxt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52FA06B5;
	Wed, 16 Oct 2024 11:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729070982;
	bh=/L1b9AdL2HXgz34mhyUDEDVV3REaYKbjl+/94hIA/do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gjH9Khxt6IcPMuZRhN6kvYGfD8HQm+UH2speJKoL6MW2pbzMD0Gm9atZ9d4X2gA6g
	 9+joutHiIx1jS1rclR4pmaqmQGGRcuXPW+yKMoHCPuuzbMMljSdI1+TPAB8W6s04og
	 xjaG0DWERNwc/szo8OaMewwnSCEaOK4o7LJRuqvo=
Date: Wed, 16 Oct 2024 12:31:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Todor Tomov <todor.too@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
Message-ID: <20241016093120.GF2712@pendragon.ideasonboard.com>
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
 <7ecxjoa7aije46cxmkyfd6ihxnqw4wleqkioddomxbwlu7qtrc@4dkfitppeksu>
 <6f461cb3-3a41-4a3d-b9b2-71b1c6be77f7@linaro.org>
 <9510b546-28fa-4fb4-b06e-0af5f9fd3bbb@kernel.org>
 <20241014202920.GE5522@pendragon.ideasonboard.com>
 <f265576c-7d83-40cb-b857-7ec54ef9ab46@kernel.org>
 <20241015112806.GA2712@pendragon.ideasonboard.com>
 <20241015194418.GA1244454-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241015194418.GA1244454-robh@kernel.org>

Hi Rob,

On Tue, Oct 15, 2024 at 02:44:18PM -0500, Rob Herring wrote:
> On Tue, Oct 15, 2024 at 02:28:06PM +0300, Laurent Pinchart wrote:
> > On Tue, Oct 15, 2024 at 08:11:18AM +0200, Krzysztof Kozlowski wrote:
> > > On 14/10/2024 22:29, Laurent Pinchart wrote:
> > > > On Mon, Oct 14, 2024 at 10:47:31AM +0200, Krzysztof Kozlowski wrote:
> > > >> On 14/10/2024 10:31, Bryan O'Donoghue wrote:
> > > >>> On 14/10/2024 08:45, Krzysztof Kozlowski wrote:
> > > >>>> I do not understand the reasoning behind this change at all. I don't
> > > >>>> think DT maintainers ever suggested it (in fact, rather opposite:
> > > >>>> suggested using unevaluatedProps) and I think is not a consensus of any
> > > >>>> talks.
> > > >>>
> > > >>> No there is not but then, how do you give consistent feedback except 
> > > >>> proposing something to be a baseline.
> > > >>>
> > > >>> On the one hand you have upstream additionalProperties: false and 
> > > >>> unevaluatedProperites: false - it'd be better to have a consistent 
> > > >>> message on which is to be used.
> 
> There are 3 options:
> 
> - no $ref => additionalProperties
> - has a $ref:
>     - additionalProperties and list ref-ed properties
>     - unevaluatedProperties and don't list ref-ed properties
> 
> I do debate (with myself)

Those are the best and worst debates at the same time :-)

> that that is too complicated as many don't 
> understand the difference. We could go back to always using 
> additionalProperties which is what we had before unevaluatedProperties 
> was added. The other option is always use unevaluatedProperties. 2 
> things have stopped me from going that route. I don't care to fix 
> 'additionalProperties' treewide which would be necessary to implement a 
> meta-schema or check that unevaluatedProperties is used. It's not 
> something I want to manually check in reviews. The other reason is just 
> to not change what the rules are again.
> 
> > > >>
> > > >> Well, I am afraid that push towards additionalProps will lead to grow
> > > >> common schema (video-interface-devices or video-interfaces) into huge
> > > >> one-fit-all binding. And that's not good.
> > > >>
> > > >> If a common binding for a group of devices encourages you to list its
> > > >> subset, then it is not that common.
> > > >>
> > > >> Solution is to fix that, e.g. split it per classes of devices.
> > > > 
> > > > I think splitting large schemas per class is a good idea, but the
> > > > problem will still exist. For instance, if we were to move the
> > > > CSI-2-specific properties to a separate schema, that schema would define
> > > > clock-lanes, data-lanes and clock-noncontinuous. The clock-lanes and
> > > > clock-noncontinuous properties do not apply to every device, how would
> > > > we then handle that ? I see three options:
> > > 
> > > Why is this a problem? Why is this a problem here, but not in other
> > > subsystems having exactly the same case?
> > 
> > I won't talk for other subsystems, but I can say I see value in
> > explicitly expressing what properties are valid for a device in DT
> > bindings both to inform DT authors and to perform validation on DT
> > sources. That's the whole point of YAML schemas, and I can't see a good
> > reason not to use the tooling we have developed when it has an easy way
> > to do the job.
> 
> This topic is just one piece of validation. A property being used that's 
> defined, but meaningless for a device is low on the list of what I care 
> about validating. I can't see how it would cause an actual problem? A 
> driver is going to read the property and do what with it? Could it be an 
> ABI issue ever? I can't see how other than a driver failing for some 
> reason if it finds the property, but that seems a bit far fetched.

I agree the risk of issues at runtime is quite low. My personal take on
this is that the additional complexity of specifying "$prop: true" in
the bindings is low (for me at least), and the increased correctness in
DT sources to avoid confusion for DT readers is worth it. I also like
how more explicit bindings cleary show in a single place what properties
are expected, making it easier for DT authors. That's a personal opinion
though.

-- 
Regards,

Laurent Pinchart

