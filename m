Return-Path: <linux-media+bounces-6085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0020386B082
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 14:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 909C61F28A92
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 13:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D95814AD28;
	Wed, 28 Feb 2024 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h3VTok+z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F26914EFC5;
	Wed, 28 Feb 2024 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709127529; cv=none; b=UFYDoL1RNICqw9/huGr0FuJiChlNsf4rXKH1F68Rjs99ufw0D4oUbI6dAI6ExK18vHUIZDkcK6R0tiHg6jh8WnUudCNIGgOV2b5Kl+fBym+7uj1bKNDBO7plYDYSu/T13WbB4/0AjIpyjxfThsEyEV7kdGI8pod5y+KFQL14gRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709127529; c=relaxed/simple;
	bh=9L/WArr+jbZ+dLvbzeoxB0IrvGQgJwXUQ6aC4idN5D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tg0ewCKFC/aIMejhwsMccfdLBhkQlKFwg+RlbALv+mO4CVmTXVa5EvuiiAuSVAjZumFY2MBz5hqvU0RD61Hx+rbW8vtQJGqZS1nV0UJ5WdY8Sw+Q/8YE+DDlZ/Zz6yDZJZhxLMS3RyK8APkQJ7nWGKdhSMC8oWGudtWqBgz6jFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h3VTok+z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E8272B3;
	Wed, 28 Feb 2024 14:38:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709127513;
	bh=9L/WArr+jbZ+dLvbzeoxB0IrvGQgJwXUQ6aC4idN5D0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3VTok+zTYvQKTpNbUHZt/7WIMkca+g2lCK7Q+UDYp0kz5kVvETQjmJd9LcoW5zs1
	 v8Kmu9rQjvkoLhsFmhL/bw/536mtD+JZ4ec+fD0iWclm1W7z1++izZkI8ixbjVnxk8
	 JVslvs6J+GqccIIRnwF2NoMdGSOeUA1EZfcJLago=
Date: Wed, 28 Feb 2024 15:38:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org
Subject: Re: [PATCH v2 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <20240228133847.GA9863@pendragon.ideasonboard.com>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-4-dan.scally@ideasonboard.com>
 <ZdxwE3omXmUjfLMn@valkosipuli.retiisi.eu>
 <mylttlhcnxe5e37m2ar6xgtus6dbr56teyyp74qm7l2d3wejwv@ewpbhpjr3v4m>
 <Zd8xC0HkZfSo29id@valkosipuli.retiisi.eu>
 <170912697659.1011926.1657561990919797055@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170912697659.1011926.1657561990919797055@ping.linuxembedded.co.uk>

On Wed, Feb 28, 2024 at 01:29:36PM +0000, Kieran Bingham wrote:
> Quoting Sakari Ailus (2024-02-28 13:11:39)
> > On Wed, Feb 28, 2024 at 01:50:14PM +0100, Jacopo Mondi wrote:
> > > > > +const struct mali_c55_fmt *mali_c55_cap_fmt_next(const struct mali_c55_fmt *fmt,
> > > > > +                                          bool allow_raw, bool unique)
> > > > > +{
> > > > > + if (!fmt)
> > > > > +         fmt = &mali_c55_fmts[0];
> > > > > + else
> > > > > +         ++fmt;
> > > >
> > > > fmt++, please.
> > > 
> > > Can I ask why ? (here and in the next occurrences you have reported)
> > 
> > It's much, much more common and using that form makes the code easier to
> > read. The rest of the driver primarily uses variable++, too, AFAIR.
> > 
> > So you should use ++variable only when you need it.
> 
> I don't think this is a hot path, but I'll never forget my C tutor
> telling us how ++i is more efficient than i++ somewhere to do with the
> opcode ordering, and not having to make a copy [*1]
> 
> Though I bet any clever optimising compiler could spot this anyway.
> 
> [*1]. Whatever plausibility there is based on a 20 year old memory and
> should be verified elsewhere.

In C I wouldn't expect any practical difference. C++ is a different
matter, as the prefix and postfix operators can have different
implementations.

-- 
Regards,

Laurent Pinchart

