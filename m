Return-Path: <linux-media+bounces-25144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3DBA19338
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 15:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1BCA188D693
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 14:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9188213E6E;
	Wed, 22 Jan 2025 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sIzCN8cI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C082116E4;
	Wed, 22 Jan 2025 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554441; cv=none; b=Rnezvpk4carj/KrlB2hOSYcVkVAcKNShdlsjolP7oIAvfnpURG2KO1CTCSm9OGROOACldI27U1aSl91tCcQs4jIKW+zI7CtVwybsBMg4lE3pegGvdj/HO6+z0kNuFmXLrEgEn+NnaD0x4cbien4DuqvIhqLuzpS8p872xJFBIR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554441; c=relaxed/simple;
	bh=HsvV+iApH/Af8R0txMRq49HNpdwtt4bM5fO76Ni3tD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxqEpnS1iikUHNicKbTor8ty5mwdOa23ndz6vGFMPsib765RDVEOYolY2HmbyHS5RCRYdRxa6yx8mykNRw/AfXdcsR7lvLY0vEKFg0ldswY5WLK/1gOXVzreIwSyPGDehCha7xOchZyC/PJrsGxa1gW8yWaXiAUxiTU/K5pCbNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sIzCN8cI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C99317E0;
	Wed, 22 Jan 2025 14:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737554374;
	bh=HsvV+iApH/Af8R0txMRq49HNpdwtt4bM5fO76Ni3tD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sIzCN8cIMxP0gFQjYqwXC6g/YUNqpzISF2qy5/j5JENWELYjTHPOAGRF7u5rBA8a6
	 Onnh21tqS9dCzbmefpmlW3KDZVHoVV8Io2wLY40lbh3T2f1Vpds5QgJZO01MaDsTth
	 q9S7UmYjysQOiWxTfyHwU8cOfk2XfWJ7tQ29C+2Q=
Date: Wed, 22 Jan 2025 15:00:34 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v5 01/10] dt-bindings: media: Add
 amlogic,c3-mipi-csi2.yaml
Message-ID: <x57kn2zaxl5ep4owimw456jsao6ictnkilsfhrrbkr4ty3y6hw@bfc625f7rat7>
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
 <20241227-c3isp-v5-1-c7124e762ff6@amlogic.com>
 <712ed366-233d-477b-b760-907b3d77a7db@linaro.org>
 <002e2ffc-3ef7-41aa-846f-3900694de675@amlogic.com>
 <htggncswmu7on2btxkkzvhgrey3yvafjsedtpx3a5ze2gtyxb3@ecyuawmn6q2v>
 <fd993f74-1d95-4cb8-b6d4-dfbe0931a03d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fd993f74-1d95-4cb8-b6d4-dfbe0931a03d@linaro.org>

Hi Krzysztof

On Wed, Jan 22, 2025 at 02:48:07PM +0100, Krzysztof Kozlowski wrote:
> On 22/01/2025 14:36, Jacopo Mondi wrote:
> >>>> +  assigned-clocks: true
> >>>> +
> >>>> +  assigned-clock-rates: true
> >>> NAK
> >>>
> >>> Adding new properties *INVALIDATES REVIEW*. Otherwise you can sneak
> >>> whatever crap past reviewers.
> >>>
> >>> Drop all new properties and drop my review tag.
> >>
> >>
> >> OK, will drop all new properties and drop your review tag. Thanks
> >>
> >
> > Krzysztof why should new properties added in-between two revisions be
> > dropped ?
>
> You connected two independent issues.

Well, it seems Keke did as well:

> >> OK, will drop all new properties and drop your review tag. Thanks

If new properties get removed, the tag can then stay, right ?

> It is not that some new properties should be dropped, because I don't
> like new stuff. It's that these two particular properties - added in
> this version, but that's coincidence - are not appropriate and should be
> dropped because of that reason: not appropriateness.
>
> >
> > I understand the "drop my tag if you make changes" but I don't get why
> > the newly added properties should be removed.
>
> They are neither needed, nor beneficial. Core schema provides them.
>

Ok, this is the bit I was missing. I thought that having

  additionalProperties: false

in the schema means that properties not explicitly listed are not
valid, but schema validation passes without specifying the two
properties, so yeah, these should be dropped.


> Best regards,
> Krzysztof

