Return-Path: <linux-media+bounces-29232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB91A78EDC
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 200F618925CD
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508922397BE;
	Wed,  2 Apr 2025 12:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QNtZlNBd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A82E1F2BBB;
	Wed,  2 Apr 2025 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597992; cv=none; b=tBbXt+SAeuCIQTRqWdRBkOX+gOgAcES4Y0WnDvD8/h3ocfOx2p6B3msvNuUsF3rSf9LYumPcBmd3XIyDELgSJ8lzjFefya+dP9yNTizZtDn4KBiu3EHi3q8Ue0PSHHbJodMvQsKoZH4nuPI6jfkKvAJIexcDLxkU3IDaZGAVuwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597992; c=relaxed/simple;
	bh=RKR7bdFOIqZEt3jCxHjv6sy16GgjixF70npH2yYLpT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTJOWMwYg0SP69GtC5+dwm2KoW4qMSaMIAGK6/YZOqnDPmZFWWsWmguFVcr0YM2pxwAdRY4qOT14ytKPDzWYzkhno8j8aaU7ZQ/BpaiONm4XjXw3NRgWsAQdCa7jqSicGXJtxEGKnHVA3LcrjCx5GkeKL+0AEIeGSwzwEW5VSAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QNtZlNBd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54DD063B;
	Wed,  2 Apr 2025 14:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743597876;
	bh=RKR7bdFOIqZEt3jCxHjv6sy16GgjixF70npH2yYLpT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNtZlNBdhWzgbnPNmjZAGDVOjcS6jPWoPqm1ufjEOBIkoSy/PwZtoyRRx4Wq7xJzT
	 xuz3GbCZAn9Iqdl50ekcFBrdFZmb9JiLYnc5hXRMoWa8bYXn+IlSLLo1O+JwiG23PH
	 4rjsXGs5pFQPXXkAFprHyoluTHqV3xPko5etj7Ic=
Date: Wed, 2 Apr 2025 15:46:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
 binding
Message-ID: <20250402124605.GB13181@pendragon.ideasonboard.com>
References: <20250401-b4-vd55g1-v2-0-0c8ab8a48c55@foss.st.com>
 <20250401-b4-vd55g1-v2-1-0c8ab8a48c55@foss.st.com>
 <20250402-curvy-seriema-of-blizzard-b1c4d9@krzk-bin>
 <228ddf41-e1d0-4d06-9e0e-9e0dad841688@foss.st.com>
 <fd874f4d-d68c-4443-8bb6-115246f4407b@kernel.org>
 <a0c62797-3c4c-453c-938b-d43666f3b264@foss.st.com>
 <7d501bf2-a017-4c02-a96f-184a7d648b6a@foss.st.com>
 <9f128ce9-6a26-435c-b133-0da80120de2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9f128ce9-6a26-435c-b133-0da80120de2d@kernel.org>

On Wed, Apr 02, 2025 at 12:27:08PM +0200, Krzysztof Kozlowski wrote:
> On 02/04/2025 11:41, Benjamin Mugnier wrote:
> > On 4/2/25 11:38, Benjamin Mugnier wrote:
> >> On 4/2/25 11:11, Krzysztof Kozlowski wrote:
> >>> On 02/04/2025 10:34, Benjamin Mugnier wrote:
> >>>> Hi Krzysztof,
> >>>>
> >>>> On 4/2/25 09:08, Krzysztof Kozlowski wrote:
> >>>>> On Tue, Apr 01, 2025 at 01:05:58PM +0200, Benjamin Mugnier wrote:
> >>>>>> +    properties:
> >>>>>> +      endpoint:
> >>>>>> +        $ref: /schemas/media/video-interfaces.yaml#
> >>>>>> +        unevaluatedProperties: false
> >>>>>> +
> >>>>>> +        properties:
> >>>>>> +          data-lanes:
> >>>>>> +            items:
> >>>>>> +              const: 1
> >>>>>
> >>>>> Not what I asked. Now you miss number of items. Just use the syntax I
> >>>>> proposed. Or was there any issue with it?
> >>>>
> >>>> No issue I just misunderstood and thought const: 1 was impliying
> >>>> maxItems: 1. I'll add maxItems back.
> >>>
> >>> That's just longer way to express what I asked for. So I repeat the
> >>> question: why not using the syntax I asked for?
> >>
> >> I guess I didn't understand what you asked for.
> >> May I ask you to write it ? That will help me a lot.
> > 
> > By 'it' I mean the binding.
>
> I wrote it last time. I don't think that copying the same here would
> change anything. If I can look at v1, you can do as well.

Reading your comment on v1, I would have come up with the exact same
result as Benjamin's v2. I can't figure out what alternative description
you meant.

-- 
Regards,

Laurent Pinchart

