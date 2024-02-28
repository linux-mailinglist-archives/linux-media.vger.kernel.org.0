Return-Path: <linux-media+bounces-6084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA68A86B05D
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 14:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64AC928AFCC
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 13:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F8D14AD28;
	Wed, 28 Feb 2024 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JqZU0ryw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9D714AD3B;
	Wed, 28 Feb 2024 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709126983; cv=none; b=VIWZMWyPlFet6VdeUCeAuIA3Blt31VgqNJbWfUBKZG+4kH32wxa71NLYZScEJEBBVOE3IJC4TNfIhFUPCxZ/smZfv8SMAkKokdVPqu5IwxUQltFiYtXRtOSH++x6wiJEaB5UooIYPEn/aeuUBHHQ3eKUpnUD1lfY8XFl50p9lHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709126983; c=relaxed/simple;
	bh=KMc3LwgppypqgRYYPFF8XXt1Ts7hpQ8Ayf2w/ZDZqrk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gCPL4xntwJcwpO9ocR60fkeu4XpelWHIO6S5m0WBiGJJMM1mcuB4pqyDzX2v8YBGa2SWuwApMmRCM9eo38HAQZQR2e2a0glf9/yxZ9pX0qiDKK4KWb88cGVXM37g5tg7D9K0HIGbW4NkhnM8Uyg6xYKlS8cU3vtYaD51IjjVDkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JqZU0ryw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 365A52B3;
	Wed, 28 Feb 2024 14:29:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709126967;
	bh=KMc3LwgppypqgRYYPFF8XXt1Ts7hpQ8Ayf2w/ZDZqrk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JqZU0rywtBxXcgHgD8BwnrshNWtQ0+jURxnTPd8b2UhZuePlHki6GYR5D06UjVfTi
	 I3XPrSIV2LV15L3odePqPVEu7NPauhuNaos3oT6x69y/RWfKnIz42T8VFshAoVGJB7
	 zFvY26X4L0Ehf4g9TLJ+0/BZ7u0zKsCJOtsObr2I=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Zd8xC0HkZfSo29id@valkosipuli.retiisi.eu>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com> <20240214141906.245685-4-dan.scally@ideasonboard.com> <ZdxwE3omXmUjfLMn@valkosipuli.retiisi.eu> <mylttlhcnxe5e37m2ar6xgtus6dbr56teyyp74qm7l2d3wejwv@ewpbhpjr3v4m> <Zd8xC0HkZfSo29id@valkosipuli.retiisi.eu>
Subject: Re: [PATCH v2 3/5] media: mali-c55: Add Mali-C55 ISP driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, laurent.pinchart@ideasonboard.com
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>
Date: Wed, 28 Feb 2024 13:29:36 +0000
Message-ID: <170912697659.1011926.1657561990919797055@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Sakari Ailus (2024-02-28 13:11:39)
> Hi Jacopo,
>=20
> On Wed, Feb 28, 2024 at 01:50:14PM +0100, Jacopo Mondi wrote:
> > > > +const struct mali_c55_fmt *mali_c55_cap_fmt_next(const struct mali=
_c55_fmt *fmt,
> > > > +                                          bool allow_raw, bool uni=
que)
> > > > +{
> > > > + if (!fmt)
> > > > +         fmt =3D &mali_c55_fmts[0];
> > > > + else
> > > > +         ++fmt;
> > >
> > > fmt++, please.
> > >
> >=20
> > Can I ask why ? (here and in the next occurrences you have reported)
>=20
> It's much, much more common and using that form makes the code easier to
> read. The rest of the driver primarily uses variable++, too, AFAIR.
>=20
> So you should use ++variable only when you need it.

I don't think this is a hot path, but I'll never forget my C tutor
telling us how ++i is more efficient than i++ somewhere to do with the
opcode ordering, and not having to make a copy [*1]

Though I bet any clever optimising compiler could spot this anyway.

[*1]. Whatever plausibility there is based on a 20 year old memory and
should be verified elsewhere.

--
Kieran


>=20
> --=20
> Sakari Ailus

