Return-Path: <linux-media+bounces-9544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 856378A6E9C
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 16:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B14661C21B5C
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 14:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6530812EBC8;
	Tue, 16 Apr 2024 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YkSKJDmp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A1A1DFE1
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713278449; cv=none; b=UiN0vMv/o7vVrft8PQTA3UnZLsyjq/sjqhnFcGobM8egefW0l0cY33YhKVv4P4jGsVLt9XtWHjmyzsFVl03tYJzTFe1g+kba5zKBHDxRKVrkFaadoe0R/AazXviKkE0jtKMSC/2SdSmeSYGRJe7u8PFEA95elX25wb5b2xF4/gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713278449; c=relaxed/simple;
	bh=j2zCvMW/8UYuCDaazELYkhkkmY046/79zD+3DpaeiIA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=djyZYoCz+pHlx9LulRNflcHe6TVowWuhzqnKTraMDM/C235DXlnl2gcSOv+fiOHu92LGiDr6/V9Zv+TpxgfYCnBpKaTerITirAGW0w3uEZPfV2bmKHTru69ekCBKR6G9HH8A1BYePmi4Tf7V69g9LohYKjy4tNlcJbV5EGrLKX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YkSKJDmp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D246F1653;
	Tue, 16 Apr 2024 16:39:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713278399;
	bh=j2zCvMW/8UYuCDaazELYkhkkmY046/79zD+3DpaeiIA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YkSKJDmpfOY8la9u9ce0rBXIWXxYYLArrimfzaLauLFadQOXMxePmjl0QgYbpLkK9
	 nKZHFA+7Zw2FU1N4XiJTX9ZfKZ3m5wlR6yE8I5KruKI5vyES4cjgfhQaNGkbrQWFwC
	 CTxmtlhOAFNDi3v1R/ACMUCddUGbNPjM+4DaCJMk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <171327825938.342316.14749757279066216268@ping.linuxembedded.co.uk>
References: <20240415120220.219480-1-hdegoede@redhat.com> <20240415120220.219480-12-hdegoede@redhat.com> <Zh08SP60QytSz3aQ@smile.fi.intel.com> <294058a6-72dd-4973-95ee-eaed0c908131@redhat.com> <CAHp75Ve2tyqYM0ChjW=ETjJ27xNmtJ3dDK-2pneanuQEwyFRxg@mail.gmail.com> <171327825938.342316.14749757279066216268@ping.linuxembedded.co.uk>
Subject: Re: [PATCH 11/23] media: atomisp: Remove test pattern generator (TPG) support
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Date: Tue, 16 Apr 2024 15:40:43 +0100
Message-ID: <171327844339.342316.3750832654489118780@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Kieran Bingham (2024-04-16 15:37:39)
> Quoting Andy Shevchenko (2024-04-16 14:34:45)
> > On Tue, Apr 16, 2024 at 12:25=E2=80=AFPM Hans de Goede <hdegoede@redhat=
.com> wrote:
> > > On 4/15/24 4:40 PM, Andy Shevchenko wrote:
> > > > On Mon, Apr 15, 2024 at 02:02:08PM +0200, Hans de Goede wrote:
> >=20
> > ...
> >=20
> > > >>              unsigned int hblank_cycles =3D 100,
> > > >>              vblank_lines =3D 6,
> > > >>              width,
> > > >
> > > > Urgh... These comma operators probably is subject to replace with s=
eparate
> > > > definitions or being grouped on a single line (as it suppose to be =
in this
> > > > case).
> > >
> > > That indeed is ugly, but fixing this is out of scope for this patch,
> > > so I've added an extra patch to the set to address this:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commi=
t/?h=3Dmedia-atomisp&id=3D48d93af9d9b0fd40a21a656cb8cd8e25700bfed5
> >=20
> > WFM, thanks!
> >=20
> > Btw (yes, I see you tagged that already, so just FYI then)
> > (1 + (stream->config.pixels_per_clock =3D=3D 2));
> > is an interesting way of using
> >=20
> >  (stream->config.pixels_per_clock =3D=3D 2) ? 2 : 1);
> >=20
> > which likely can produce slightly better code (due to use of constant
> > 2 twice), although it is a pure speculation by me.

Ooops, I didn't mean to send that. Well I wrote something but then
closed it when I wasn't going to bother and instead some how sent an
empty mail ..

So now I guess I should actually say what I wasn't going to end up
saying? haha.

This was too intriguing (to me) so I threw it in godbolt, and for
various levels of compiler optimsations, both options generate the same
code, even with -O0. Of course the different optimsation levels produce
different code, but the two options above always match at the given
level.

Fun with godbolt ;-)

https://godbolt.org/z/hYjrvK6hn

> >=20
> > --=20
> > With Best Regards,
> > Andy Shevchenko

