Return-Path: <linux-media+bounces-3585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F40682B459
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 18:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3FFB286C10
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 17:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC0152F7B;
	Thu, 11 Jan 2024 17:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X/l/injh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB6E52F60
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56CFFAF2;
	Thu, 11 Jan 2024 18:51:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704995512;
	bh=YQpVXminYM3X8kR+2xWExpDjZDR4B3WkqrZIUgOjkwo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=X/l/injhZtO3sZXw6QpMN38Z3B1eDEZJwB0QekCt4i87oS3XvPa1NvXC2sfndL5Su
	 c01yTFp8Q3qkx5Ux0PwM0PLT3yfNAxj95qClhI1AFKRZuDwdnhShjxzAu287CYL7Wj
	 XrhJFPjtFuXts2nOAUwWPF2WaHm8lUcn8dvJFDmI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231203170057.GB22111@pendragon.ideasonboard.com>
References: <20231201150614.63300-1-marex@denx.de> <CAOMZO5BssVez71=uCYd0XhL02xd1TrUyTzCc1fq_sWfENLaoTA@mail.gmail.com> <890ae113-7c7f-4214-9b00-ce00fc570567@denx.de> <20231203170057.GB22111@pendragon.ideasonboard.com>
Subject: Re: [PATCH] media: nxp: isi: Check whether pad is non-NULL before access
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>
Date: Thu, 11 Jan 2024 17:52:55 +0000
Message-ID: <170499557567.3227220.6762054427400627231@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Laurent Pinchart (2023-12-03 17:00:57)
> On Sat, Dec 02, 2023 at 07:44:47AM +0100, Marek Vasut wrote:
> > On 12/2/23 03:27, Fabio Estevam wrote:
> > > On Fri, Dec 1, 2023 at 12:06=E2=80=AFPM Marek Vasut <marex@denx.de> w=
rote:
> > >=20
> > >>          pad =3D media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> > >> -       sd =3D media_entity_to_v4l2_subdev(pad->entity);
> > >> +       if (!pad) {
> > >> +               dev_dbg(xbar->isi->dev,
> > >=20
> > > Maybe dev_err() here instead?
> >=20
> > That dev_dbg() is aligned with the prints in the rest of the function=20
> > and it's not like kernel should do dev_err() into kernel log every time=
=20
> > userspace does something wrong.
>=20
> We usually use dev_dbg() for errors that can be easily triggered from
> userspace, to avoid giving unpriviledged processes an easy way to flood
> the kernel log.

When this call returns it will also report a dev_err "Failed to enable
pipe":

[   56.806321] mxc-isi 32e00000.isi: no pad connecxted to crossbar input 0
[   56.813655] mxc-isi 32e00000.isi: Failed to enable pipe 0

Personally - I'd make this print dev_err so the /reason/ we failed to
enable the pipe is also stated.

But I can confirm this is a bug and fairly easily trigged by attempting
to capture from the ISI through the libcamera simple pipeline handler,
which (I believe) does not do any route handling at present.

Which ever log level:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


And this needs to go to stable, as this caused a null-pointer-deref for
me on a v6.6 tree.

--
Kieran


>=20
> > > Anyway:
> > >=20
> > > Reviewed-by: Fabio Estevam <festevam@gmail.com>
> >=20
> > Thanks !
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

