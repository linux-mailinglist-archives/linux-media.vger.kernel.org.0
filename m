Return-Path: <linux-media+bounces-8658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 095848988DE
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 15:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B704C28F3EA
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 13:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D51F127B52;
	Thu,  4 Apr 2024 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ttq0vNwk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA048613E
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712237750; cv=none; b=Vn3lQMkcmbAI34HaKnzCbJ5HsCfsw8kfdWC/P4fx6Nd9KGBAbz08hMmj3CBjJo0cGVMIptgX4fyQSVMGq0BssLHy1mfBI1hO63Vz9ofWaOpckqN2HT82vk9kbeHbRpLi56nx7OiXAYST+zz7onWlZUrdNpB3ZCB232twdWhmggY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712237750; c=relaxed/simple;
	bh=OWz6wJ4xYl69vYDFwyOD3q6YmEyrx1uAODlaxqkdPJw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ha2iTnXOTCTFpVa2z92MVJzMLp/amQItWoQiv5PQW1oIMAWUrHEUgBj1QfXSJkcdjW7fk/+f9QHLvSX6y8cEQ3Zx9T2ERfbSbNRlXANoLeUsC4ymfy2+Y3KsQZBeNOsfZfD1V+fOGEo0N0IlsElIXQE0TO6Gjfg+G1ylPze9XX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ttq0vNwk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E528AC433C7;
	Thu,  4 Apr 2024 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712237750;
	bh=OWz6wJ4xYl69vYDFwyOD3q6YmEyrx1uAODlaxqkdPJw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ttq0vNwkaLSOA6ls9Rp0fG/678nJVueLsjBFQ2kIeBRlzeSg5j3L1azd/HH87ev4c
	 yBiaTSYwPuAne6XhAf0jysWii6jyTo7NVYAsInTK0eHlhBoTXMKpre3+S4l3mx4QVw
	 oMhFClaGb4FEjdDivEc1JPvg3Vzaq2AT93x2w7xYCfwu2eVsSOtS7VbJctWVMNJVnl
	 9DHIV5+oV8zzevgybqk9id3i0KscbP53MH7cxi/plZgFVJTdJ3xux8ivSpKsDsFDiQ
	 ElY5unLr4FlGRaHqdk883BkBMtiBzty+jVMk69jNuDg+r6ErvJE+MwTJCEZKm6sknV
	 wXbQWkWfCWadw==
Date: Thu, 4 Apr 2024 15:35:43 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sean Young <sean@mess.org>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>,
 Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat
 <alain.volmat@foss.st.com>, "stanimir.k.varbanov@gmail.com"
 <stanimir.k.varbanov@gmail.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.org>
Subject: Re: [ANN] Media Summit 2024: where to hold it?
Message-ID: <20240404153543.2c0f99e0@coco.lan>
In-Reply-To: <20240404100928.GK23803@pendragon.ideasonboard.com>
References: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>
	<20240404100928.GK23803@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Thu, 4 Apr 2024 13:09:28 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> > So we have to make a choice this year: we can co-locate with the gStrea=
mer
> > and XDC conference in Montreal, Canada on October 7 or 8, or we can
> > organize a meeting somewhere in Europe ourselves. One possibility is
> > to try and co-locate with the Open Source Summit Europe/LPC conferences
> > in Vienna, Austria in the week of September 16-20. Another is just to
> > organize something ourselves somewhere in Europe. But that's a last res=
ort,
> > co-locating with a conference is generally more appealing for people. =
=20
>=20
> We also floated the idea of co-locating with Embedded Recipes, but that
> has been cancelled this year (partly due to the ELC changes).

Embedded Recipes would work as well - or some other smaller conference - bu=
t=20
I guess right now the only open source scheduled event in Europe seems to be
OSS/LPC.

> > The advantage of picking Montreal is that the gStreamer conference is
> > more applicable to the work we do, and we can get a meeting room there
> > free of charge. Besides, I've never been to Montreal :-) =20
>=20
> Montr=C3=A9al is nice :-)

Montr=C3=A9al sounds nice to visit, but I would be traveling just for the
Media Summit, as I'm not doing any gstreamer-related work. So, for me,
it won't be much different than a standalone Media Summit. I suspect
that locating there will limit the audience to the ones also working
on Gstreamer itself or working at one of its sponsors.

Being in North America, probably OSS would be a better fit, as other
Kernel developers could be around, and it will likely have a more
diverse audience. However, April is too close, so unpractical.=20

There is OSS Japan In Oct, where we could have Kernel developers from=20
other subsystems also there. But again, as most developers are in Europe,
it probably means that the audience may not be as diverse as if we do
the event in EU.

Also, I guess travel budgets are still tight this year, so, IMO an event
in Europe sounds more likely to have a more representative set of people.

>=20
> > But can we get enough of the core media maintainers there? There is no
> > point otherwise. I suspect that the same company travel constraints that
> > were present last year are still in force this year.
> >
> > If we pick Vienna instead (assuming we can get a meeting room for a dec=
ent
> > price), would that work better? =20
>=20
> I think we can figure out sponsorship to pay for a room.
>=20
> > So if you are a core media maintainer, or an active media developer int=
erested
> > in joining a Media Summit, please let me know if:
> >=20
> > 1) Montreal, October 7 or 8, works for me!
> > 2) Vienna, one day in the period September 16-20, works for me!

Can't really say what works, as it will depend on having the travel
arranged/approved, but LPC/OSS Europe in Vienna will likely work better
for me.

Thanks,
Mauro

