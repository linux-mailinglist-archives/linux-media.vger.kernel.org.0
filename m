Return-Path: <linux-media+bounces-29239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D7A79015
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 15:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E8917A48E8
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 13:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E13723BCF7;
	Wed,  2 Apr 2025 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmDk59IA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D9923AE9B;
	Wed,  2 Apr 2025 13:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601317; cv=none; b=nU/MGuMEnl2ea4YSSTFCO0BUKm5SjSfRKw2MUU7WhwgKSDpcLNNGgBzOmuxrc2Ourj4xjuz/2DTpq9CQ9EKLCFG5/pnkvUPOY7om2oYLXpp3w4rGEBK3V1W7nio50J92jnod9tYDbGkKE8KD/HitIpUPx0qUKQUgMEx+Sf0JCXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601317; c=relaxed/simple;
	bh=eQCpkCk5h1UrR9g12wED7jzmu/yx1Vr1khO64UK4mqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RL0lalw6OXXIwoyXxwqd3oEczqDGILMydAdRC84nJz3W3OUAcndGbxRcCGX7Au98didPk5wDOj/Zgxrj1nwE8EAWluWMKpMh+SViMGSy9TD5MjKHrauUFjpaPf3p/oA0zuyq03N+LQKE8WHUFmJL7n7uVjOJJvk0VwEtej3vGoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmDk59IA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CBFC4CEEB;
	Wed,  2 Apr 2025 13:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743601317;
	bh=eQCpkCk5h1UrR9g12wED7jzmu/yx1Vr1khO64UK4mqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bmDk59IAqetVZB3o1WumomzfDyWDK1CnWMxG8EqHly/4z8TGl20h2pfulhKNHz/gM
	 8g8iGeqFrnmOt/R37HfUZaftCGRqlR5WcsttwRjJQ1qqHCyUtavwh5wy+1r+++fdHp
	 5Cq7vHjJjucV5B7lFnMzrHtwoI4VSX0jUFdsSIbnPtrKBUHj9TxHJc0KN4tjahXrSu
	 ShY03KYDvgs8G1Bau3W7Pnm9uAho9C3JXAKhTTmW0DN4uAGuWmVLQ1Xqr+pMZU+Wsb
	 rfMXdzdE6Jsv28L637qzIWJAMf0JogszVqr68tfAiyHzIt2WuZJhx0oyBsZUiPWam3
	 uqBH8fVmwIHaA==
Date: Wed, 2 Apr 2025 08:41:55 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
 binding
Message-ID: <20250402134155.GA85771-robh@kernel.org>
References: <20250401-b4-vd55g1-v2-0-0c8ab8a48c55@foss.st.com>
 <20250401-b4-vd55g1-v2-1-0c8ab8a48c55@foss.st.com>
 <20250402-curvy-seriema-of-blizzard-b1c4d9@krzk-bin>
 <228ddf41-e1d0-4d06-9e0e-9e0dad841688@foss.st.com>
 <fd874f4d-d68c-4443-8bb6-115246f4407b@kernel.org>
 <a0c62797-3c4c-453c-938b-d43666f3b264@foss.st.com>
 <7d501bf2-a017-4c02-a96f-184a7d648b6a@foss.st.com>
 <9f128ce9-6a26-435c-b133-0da80120de2d@kernel.org>
 <20250402124605.GB13181@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402124605.GB13181@pendragon.ideasonboard.com>

On Wed, Apr 02, 2025 at 03:46:05PM +0300, Laurent Pinchart wrote:
> On Wed, Apr 02, 2025 at 12:27:08PM +0200, Krzysztof Kozlowski wrote:
> > On 02/04/2025 11:41, Benjamin Mugnier wrote:
> > > On 4/2/25 11:38, Benjamin Mugnier wrote:
> > >> On 4/2/25 11:11, Krzysztof Kozlowski wrote:
> > >>> On 02/04/2025 10:34, Benjamin Mugnier wrote:
> > >>>> Hi Krzysztof,
> > >>>>
> > >>>> On 4/2/25 09:08, Krzysztof Kozlowski wrote:
> > >>>>> On Tue, Apr 01, 2025 at 01:05:58PM +0200, Benjamin Mugnier wrote:
> > >>>>>> +    properties:
> > >>>>>> +      endpoint:
> > >>>>>> +        $ref: /schemas/media/video-interfaces.yaml#
> > >>>>>> +        unevaluatedProperties: false
> > >>>>>> +
> > >>>>>> +        properties:
> > >>>>>> +          data-lanes:
> > >>>>>> +            items:
> > >>>>>> +              const: 1
> > >>>>>
> > >>>>> Not what I asked. Now you miss number of items. Just use the syntax I
> > >>>>> proposed. Or was there any issue with it?
> > >>>>
> > >>>> No issue I just misunderstood and thought const: 1 was impliying
> > >>>> maxItems: 1. I'll add maxItems back.
> > >>>
> > >>> That's just longer way to express what I asked for. So I repeat the
> > >>> question: why not using the syntax I asked for?
> > >>
> > >> I guess I didn't understand what you asked for.
> > >> May I ask you to write it ? That will help me a lot.
> > > 
> > > By 'it' I mean the binding.
> >
> > I wrote it last time. I don't think that copying the same here would
> > change anything. If I can look at v1, you can do as well.
> 
> Reading your comment on v1, I would have come up with the exact same
> result as Benjamin's v2. I can't figure out what alternative description
> you meant.

The '-' or lack of is the key part here. That's easy to miss visually 
and the significance is missed for newcomers. It is worth mentioning the 
significance when that's the issue even if providing the exact code to 
use.

Rob

