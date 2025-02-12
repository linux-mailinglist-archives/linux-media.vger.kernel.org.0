Return-Path: <linux-media+bounces-26080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3C2A32DAB
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 18:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F7BA1679C6
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 17:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03DB25D531;
	Wed, 12 Feb 2025 17:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/nhsGZJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026C625C714;
	Wed, 12 Feb 2025 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739382131; cv=none; b=n2aCFYtS4GNle0gAQ1v1DqTbMSi3hwOO0bnINtQm+J7dNUhbf1JqcYuaRtXp1+ODGh1ZnCEu4h0cCUjapzNmAuWd9Mr1DvoZXlAeUoshxBv/VNcoQzq9tkb3e1+x4fnJUwcOl1X9lCxFzRFwqikH2z9ICRxUXICf2ABYZ68la4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739382131; c=relaxed/simple;
	bh=gvMacjYyYQk94s54Wdhgrs9J+Z35HAb77tj9gfoFtHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYAw3WMScraULSdlaXCR+BYmuOVOUOAPli4H2IixbAqqhjiF0OpqWtoNDt9kVdvlBCAAMvcJcCh+GdvscBQaSTa5gKZou1Ow6aOkrB1IxeO9UawfWk+ZB9ffWiWSvUQchK3D/niGJqCeWdH5d8HXNhYN+LWi/pYWmhDdQh+InGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/nhsGZJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59632C4CEDF;
	Wed, 12 Feb 2025 17:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739382130;
	bh=gvMacjYyYQk94s54Wdhgrs9J+Z35HAb77tj9gfoFtHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/nhsGZJUv2HiNnaxelm0242nKDHVNIoV+P8PrwFXyf4w9jnYsCyGnnPqztG5Mv25
	 Tb4ziwX+y+3WUC/DxF3UYHJvRRQ+f93wYxBfL1jT3IFcX1KKATrbqWYqNJaSfqPE41
	 8t4jQFBXgxXBZv7POWOQU+xGmV3Pi3xfIwRoOMMN13aSyWs99yf4cWMmcFQN8t+Ar6
	 VjUrvi67u0FIP/3bZ69UlZir262B9bgvAEHR4Db7F2MFsyVH3kTDZUYwxlWHsHvqHG
	 pl3Lf3RqgrIbcZtkruBpWF6/7dwClg5s+KNyyN9W9P/8I98jmbUofmAY4/cKwOIGEs
	 fkGak97LVa5nQ==
Date: Wed, 12 Feb 2025 11:42:09 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: i2c: maxim,max96717: add new properties
Message-ID: <20250212174209.GA3890372-robh@kernel.org>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
 <20250207112958.2571600-4-laurentiu.palcu@oss.nxp.com>
 <20250211-ecard-dallying-94ced9b29fd9@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-ecard-dallying-94ced9b29fd9@spud>

On Tue, Feb 11, 2025 at 06:46:10PM +0000, Conor Dooley wrote:
> On Fri, Feb 07, 2025 at 01:29:55PM +0200, Laurentiu Palcu wrote:
> > Add 'maxim,override-mode' property to allow the user to toggle the pin
> > configured chip operation mode and 'maxim,fsync-config' to configure the
> > chip for relaying a frame synchronization signal, received from
> > deserializer, to the attached sensor. The latter is needed for
> > synchronizing the images in multi-sensor setups.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  .../bindings/media/i2c/maxim,max96717.yaml    | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> > index d1e8ba6e368ec..fae578d55fd4d 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> > @@ -42,10 +42,35 @@ properties:
> >        number must be in range of [0, 10].
> >  
> >    gpio-controller: true
> > +  gpio-reserved-ranges: true
> >  
> >    '#clock-cells':
> >      const: 0
> >  
> > +  maxim,override-mode:
> > +    description: Toggle the operation mode from the pin configured one.
> > +    type: boolean
> 
> type: flag

Err, no.

You can do as-is or:

$ref: /schemas/types.yaml#/definitions/flag

I am neutral as to which way. If I wasn't we'd make the meta-schema 
enforce one way or the other.

Rob

