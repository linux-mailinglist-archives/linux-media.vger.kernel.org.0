Return-Path: <linux-media+bounces-8676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B983898EA8
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 21:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A816E1C247AF
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 19:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB2D1332A9;
	Thu,  4 Apr 2024 19:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="15A6ci6h"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CB212D201
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712257733; cv=none; b=FhmvrwFICXhP97iIdhMhmaFicwm3I+llYJ9NL3HXI5EsfIgym8sxf2wunrlOkocJsRmqixAfistJY3TWSuJYwJQ6NFP74UAJdXLTanhEWx4AF0J30NzBjFCK3cSUS6tFeB5Icxr9Y+paSAMaeO7Eu1ofaIGJ9DC2jcZ1Q1/vRMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712257733; c=relaxed/simple;
	bh=lK/sZg2+YaDoVcd3x4vtTrRNxSLH9ovOZykld4Ofh9w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IM8KBq5n//vhzpf2Lj+xNXW/sZCOqUGJk1HkncGi+d8y04TDqV8+q2QYeyaRt8PizaStDCkn/iu7yuQD/sXyubpNTxOtwKqcojgjfQK1pYY7gJy8CvWHplW7Rg+8LI81fAst5r6uvZZ0e38t3HOLzPJY6//6cHgrUsDAiwVeq8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=15A6ci6h; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712257729;
	bh=lK/sZg2+YaDoVcd3x4vtTrRNxSLH9ovOZykld4Ofh9w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=15A6ci6hVLmcgouxIhPmmElS7kzpK2I+NkngbMukjvlJXoAGsK/h+W9Q4ZfvvRGJq
	 9AnxAdvV8YI7CmhxkIQfpGNZedBoTvwyg/IUGEcm1MnQGy0FzyU1XfgbCnDC6Lqrdx
	 /jrqn7AJXl6B6EFBcFm61hTJAzapco2gnGZcBUh0R5AlKQKvd0brUQKD4TVNzcNbpi
	 5My5v8ckUygD6TFfVHUdfoW+drqCRtiAQxnBCkjpxN6wOrFPLscN2WP39/4RpU/kYO
	 87rNFcwDYYGcBXTzrnqe+9iJA4vUJErfLgbVsvDSWpcJPvwTQzkLhhv00u+VQ4wrO4
	 bAvTrnQ0BdYnQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 510173780029;
	Thu,  4 Apr 2024 19:08:47 +0000 (UTC)
Message-ID: <f4c81aa71feebf86e98be45484e82e0446bbfa95.camel@collabora.com>
Subject: Re: [ANN] Media Summit 2024: where to hold it?
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
  Sean Young <sean@mess.org>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat
 <alain.volmat@foss.st.com>,  "stanimir.k.varbanov@gmail.com"
 <stanimir.k.varbanov@gmail.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Dave Stevenson
 <dave.stevenson@raspberrypi.org>
Date: Thu, 04 Apr 2024 15:08:43 -0400
In-Reply-To: <20240404153543.2c0f99e0@coco.lan>
References: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>
	 <20240404100928.GK23803@pendragon.ideasonboard.com>
	 <20240404153543.2c0f99e0@coco.lan>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 04 avril 2024 =C3=A0 15:35 +0200, Mauro Carvalho Chehab a =C3=A9cr=
it=C2=A0:
> Em Thu, 4 Apr 2024 13:09:28 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
>=20
> > > So we have to make a choice this year: we can co-locate with the gStr=
eamer
> > > and XDC conference in Montreal, Canada on October 7 or 8, or we can
> > > organize a meeting somewhere in Europe ourselves. One possibility is
> > > to try and co-locate with the Open Source Summit Europe/LPC conferenc=
es
> > > in Vienna, Austria in the week of September 16-20. Another is just to
> > > organize something ourselves somewhere in Europe. But that's a last r=
esort,
> > > co-locating with a conference is generally more appealing for people.=
 =20
> >=20
> > We also floated the idea of co-locating with Embedded Recipes, but that
> > has been cancelled this year (partly due to the ELC changes).
>=20
> Embedded Recipes would work as well - or some other smaller conference - =
but=20
> I guess right now the only open source scheduled event in Europe seems to=
 be
> OSS/LPC.
>=20
> > > The advantage of picking Montreal is that the gStreamer conference is
> > > more applicable to the work we do, and we can get a meeting room ther=
e
> > > free of charge. Besides, I've never been to Montreal :-) =20
> >=20
> > Montr=C3=A9al is nice :-)
>=20
> Montr=C3=A9al sounds nice to visit, but I would be traveling just for the
> Media Summit, as I'm not doing any gstreamer-related work. So, for me,
> it won't be much different than a standalone Media Summit. I suspect
> that locating there will limit the audience to the ones also working
> on Gstreamer itself or working at one of its sponsors.

The XDC conference is also happening in the same time period. I believe som=
e of
us do have both media/graphics interest in their daily work.

regards,
Nicolas

>=20
> Being in North America, probably OSS would be a better fit, as other
> Kernel developers could be around, and it will likely have a more
> diverse audience. However, April is too close, so unpractical.=20
>=20
> There is OSS Japan In Oct, where we could have Kernel developers from=20
> other subsystems also there. But again, as most developers are in Europe,
> it probably means that the audience may not be as diverse as if we do
> the event in EU.
>=20
> Also, I guess travel budgets are still tight this year, so, IMO an event
> in Europe sounds more likely to have a more representative set of people.
>=20
> >=20
> > > But can we get enough of the core media maintainers there? There is n=
o
> > > point otherwise. I suspect that the same company travel constraints t=
hat
> > > were present last year are still in force this year.
> > >=20
> > > If we pick Vienna instead (assuming we can get a meeting room for a d=
ecent
> > > price), would that work better? =20
> >=20
> > I think we can figure out sponsorship to pay for a room.
> >=20
> > > So if you are a core media maintainer, or an active media developer i=
nterested
> > > in joining a Media Summit, please let me know if:
> > >=20
> > > 1) Montreal, October 7 or 8, works for me!
> > > 2) Vienna, one day in the period September 16-20, works for me!
>=20
> Can't really say what works, as it will depend on having the travel
> arranged/approved, but LPC/OSS Europe in Vienna will likely work better
> for me.
>=20
> Thanks,
> Mauro
>=20


