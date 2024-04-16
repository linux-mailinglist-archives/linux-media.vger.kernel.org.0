Return-Path: <linux-media+bounces-9543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBE8A6E88
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 16:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 775C11F21AB2
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 14:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FC512EBFA;
	Tue, 16 Apr 2024 14:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cghWaJWH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6107A12D771
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713278266; cv=none; b=VPIlqDQqCpl/3C6q831Xf5/AaYlau29VhNoiCZkFUA8u2Qia55LEEq5SqponbeU3o+cvoTF/w9fMjil4LSf/3dJQ+vdfEdOXZq4nyzXWXTp0jeUrPCYx5m0K2k8oineWzGBvBBMPv8XujtTk9ReejPw/xGG1DjUIhhTvpyd0so8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713278266; c=relaxed/simple;
	bh=0ol+QydM1nqadfk6tQghjGgJTbryjpZmaEs0zqoqNZo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=AlPgxt7rkIR1fkPhO3OXbC7+8q8c0KS0rCwkClwKIzYjPCeFbhfMH6DzESy1lW4MuWk/Z57Gd/05Ww7PMsGE+shZYarQ+AfPvoUQ1aGfr7onhdJ/8TwaYrms4BbOSYJSmW7tNal2v3F5Jqgdqmk/bu7NF4nFqL2bfBDE18gc2PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cghWaJWH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 974EDDFB;
	Tue, 16 Apr 2024 16:36:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713278215;
	bh=0ol+QydM1nqadfk6tQghjGgJTbryjpZmaEs0zqoqNZo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cghWaJWH1gA353O4P8Y/IQ3n/J+ABPUpwKkpJbLG6NFYtqUwZ6Vep2dxBha6Lg7MZ
	 kcLWfovy53yMT6y8wQOPyjukCV1KPSyaSK907g7pFXclohqWJvF+4Ot/W/wqPFBhYL
	 aw2glnvuaZDxqoZ6MHCu6zmO/5KuGiUt2dqOuFdo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHp75Ve2tyqYM0ChjW=ETjJ27xNmtJ3dDK-2pneanuQEwyFRxg@mail.gmail.com>
References: <20240415120220.219480-1-hdegoede@redhat.com> <20240415120220.219480-12-hdegoede@redhat.com> <Zh08SP60QytSz3aQ@smile.fi.intel.com> <294058a6-72dd-4973-95ee-eaed0c908131@redhat.com> <CAHp75Ve2tyqYM0ChjW=ETjJ27xNmtJ3dDK-2pneanuQEwyFRxg@mail.gmail.com>
Subject: Re: [PATCH 11/23] media: atomisp: Remove test pattern generator (TPG) support
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Date: Tue, 16 Apr 2024 15:37:39 +0100
Message-ID: <171327825938.342316.14749757279066216268@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Andy Shevchenko (2024-04-16 14:34:45)
> On Tue, Apr 16, 2024 at 12:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:
> > On 4/15/24 4:40 PM, Andy Shevchenko wrote:
> > > On Mon, Apr 15, 2024 at 02:02:08PM +0200, Hans de Goede wrote:
>=20
> ...
>=20
> > >>              unsigned int hblank_cycles =3D 100,
> > >>              vblank_lines =3D 6,
> > >>              width,
> > >
> > > Urgh... These comma operators probably is subject to replace with sep=
arate
> > > definitions or being grouped on a single line (as it suppose to be in=
 this
> > > case).
> >
> > That indeed is ugly, but fixing this is out of scope for this patch,
> > so I've added an extra patch to the set to address this:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/=
?h=3Dmedia-atomisp&id=3D48d93af9d9b0fd40a21a656cb8cd8e25700bfed5
>=20
> WFM, thanks!
>=20
> Btw (yes, I see you tagged that already, so just FYI then)
> (1 + (stream->config.pixels_per_clock =3D=3D 2));
> is an interesting way of using
>=20
>  (stream->config.pixels_per_clock =3D=3D 2) ? 2 : 1);
>=20
> which likely can produce slightly better code (due to use of constant
> 2 twice), although it is a pure speculation by me.
>=20
> --=20
> With Best Regards,
> Andy Shevchenko

