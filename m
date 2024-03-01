Return-Path: <linux-media+bounces-6254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D05386EAF0
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2A68B245AB
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 21:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB13A56B9E;
	Fri,  1 Mar 2024 21:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ke/foRsU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1471920DCD;
	Fri,  1 Mar 2024 21:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709327471; cv=none; b=Ev0C9sVGJk4YvvO8Hrt19q4awP6BGPRiuYYQPHm4cZvVO1Cobiv2NvMEyGd2LPF6e8Lp/SNDPUUoUYR2qN0BWK5j0wLLWdFYKkW/4GLUj88kT6QOGoeMwDvmMR3v7l2+9yeyLW5PTlmak2xHtaq7WleT1pPSlAkU5xuuW0KOm0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709327471; c=relaxed/simple;
	bh=PareT5Uh8qyKXVJmbXssDGNU+1BT0dFwAwAWmEQRgfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMSXrUeaziyxpW7F+j7RY8xs+lf8+f0T9V3SLJjdpC5SHDxNZQ6Fg9cnaDUarI9wQsmct0zYF1cJCMiIk60+ChixSMZfhkJHIE8ORAMULxoIGyAeLQRddaiutf5uO5CngNOGXnX+dcNeE9qH5e82Uhp4ggVFSELlJ9Nuv3xPZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ke/foRsU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38681C433C7;
	Fri,  1 Mar 2024 21:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709327470;
	bh=PareT5Uh8qyKXVJmbXssDGNU+1BT0dFwAwAWmEQRgfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ke/foRsUxfyuNyennmryYOLtImZiHI/U9cBz9KR4XL5KcRw/J3ekb0E2Wsj2RsYof
	 FESedK9y3YvMR/MhHPRE0N3iD8mB0cvI3Fo9sPvrcSDlGC38nEPOGUV0nmAeFD2ay/
	 L8oeCj+Z4vmhDmSnRNE/nTwKOFXsFmVbVHhDMlQ6RHNILq0ZTo/BmTZKbuVIJgqxqr
	 gDuqaJvsSD9SS1T63uKw0ZnI0s5hk9/Bse6VdB8Czn9qAh1gALPXAAMtFwK7V73Evl
	 EKpp8i9NFqjhEPgOHO9HabxpTHU/4uy6+8aEMuu8AB7ngJSf0MlFfFjDE/0DQFNk9e
	 thFTy1aoc9ZiQ==
Date: Fri, 1 Mar 2024 15:11:07 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: dt-bindings: nxp,imx8-isi: Allow single port
 for single pipeline models
Message-ID: <20240301211107.GA3037358-robh@kernel.org>
References: <20240223140445.1885083-1-alexander.stein@ew.tq-group.com>
 <20240223140445.1885083-3-alexander.stein@ew.tq-group.com>
 <20240223141630.GA1313@pendragon.ideasonboard.com>
 <20240223141731.GB1313@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223141731.GB1313@pendragon.ideasonboard.com>

On Fri, Feb 23, 2024 at 04:17:31PM +0200, Laurent Pinchart wrote:
> On Fri, Feb 23, 2024 at 04:16:31PM +0200, Laurent Pinchart wrote:
> > Hi Alexander,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Feb 23, 2024 at 03:04:44PM +0100, Alexander Stein wrote:
> > > In case the hardware only supports just one pipeline, allow using a
> > > single port node as well.
> > 
> > This is frowned upon in DT bindings, as it makes them more complicated
> > for little gain. The recommendation is to always use a ports node if a
> > device can have multiple ports for at least one of its compatibles.
> 
> And reading the cover letter, I see this causes warnings. I think we
> need guidance from Rob on this.

The warning is for:

ports {
  port@0 {};
};

It should/could be changed like this to fix it:

ports {
  port {};
};

But I've also said some warnings are guidance, not absolute. This is one 
of them. Some devices have optional port@1. In those cases, switching 
between 'port' and 'port@0' depending on 'port@1' makes little sense.

Rob 

