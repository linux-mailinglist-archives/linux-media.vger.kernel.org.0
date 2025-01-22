Return-Path: <linux-media+bounces-25135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB888A192B9
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 14:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1356216C264
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 13:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAFD213237;
	Wed, 22 Jan 2025 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DONllKxT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4C94E1CA;
	Wed, 22 Jan 2025 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553122; cv=none; b=WK7U9mB5an9JakQ6g+jF5uhnjFKeQszF1aQmjS/WHLfIxwjsv0HnSy9RVae7HVGkekdK6khWUWo1ufMAETwZSXBH9Wt7zuMWNfXFx+zxOYwXtDtsu6yvR3XdwkFtXpWIMlXrR8OouguE1RdJzdcCvRE++uW8UCsLRWtTaOf5YNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553122; c=relaxed/simple;
	bh=IonhbDV5qukCWQ0rxAw5GlLOaxQ3uuEIenHy01XD090=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ML1Iea1oxh4c1rA9grBIkcgwBXhgY0SRUKznsfJq5U8vZnMz2vOrpbKXDUBxP4g7F/FOpylKKuur9D8AyY7Co2rNdgxG7Kdj1rCgH/88cqVOliGcE1oDRJRkqLy1PraBkP46O4VE+yJvqL+VsHo27PRdrlWIgneXvt2RH5mjeaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DONllKxT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B22D520;
	Wed, 22 Jan 2025 14:37:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737553055;
	bh=IonhbDV5qukCWQ0rxAw5GlLOaxQ3uuEIenHy01XD090=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DONllKxTbjDzKszdB7Mvp2SoeJt30Gecf9qsePw+hxwW3PyB3GiCqEV/VuuHZmsK+
	 fPV94kRUojaTvEnGEY4L9eEfJuYrz43tKVSqvU51d/+XzsP85Jdf2HZei9aKe9rUx2
	 ImjPX9xkjumgm1Vc4emWR4t530pVUL1z/NpVLfv0=
Date: Wed, 22 Jan 2025 14:38:34 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: keke.li@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v5 05/10] dt-bindings: media: Add amlogic,c3-isp.yaml
Message-ID: <jja74umhccvvg2nmolavpuaafsqrqj6pylyrblhcem4so4hz2j@fyutf4duwyrv>
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
 <20241227-c3isp-v5-5-c7124e762ff6@amlogic.com>
 <0815e122-1f77-4f87-bc9d-386cc423c171@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0815e122-1f77-4f87-bc9d-386cc423c171@kernel.org>

On Fri, Dec 27, 2024 at 08:22:22AM +0100, Krzysztof Kozlowski wrote:
> On 27/12/2024 08:09, Keke Li via B4 Relay wrote:
> > +
> > +  clocks:
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    items:
> > +      - const: vapb
> > +      - const: isp0
> > +
> > +  assigned-clocks: true
> > +
> > +  assigned-clock-rates: true
>
> No, drop these. Request re-review if you add new properties.

Why ?

I think the patches should be re-checked and it's fair to ask to drop
the rb tag. But the idea that patches once reviewed should not be
modified between two different versions of the same set seems really..
debatable ?

>
> Best regards,
> Krzysztof
>

