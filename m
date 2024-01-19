Return-Path: <linux-media+bounces-3927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEC1832A41
	for <lists+linux-media@lfdr.de>; Fri, 19 Jan 2024 14:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86D98285308
	for <lists+linux-media@lfdr.de>; Fri, 19 Jan 2024 13:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303AC524CD;
	Fri, 19 Jan 2024 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="nbsVU4+4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461D4F1F6
	for <linux-media@vger.kernel.org>; Fri, 19 Jan 2024 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705670504; cv=none; b=c53TBC61OdqAWhVIvGhqkgMaZtiwrJAC4PU0TvvTlyBmwUnGHEdV8qni/LZT/nnx8WzdjNi9fIvrFdn+gx8w7FLoptpXLkfMRzz2LjIo90pef7h+CU9SQLALTDN0lf0i62qsackQHI5XSlAjj9p/ygEczTKSmEewyEzXpKrAhh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705670504; c=relaxed/simple;
	bh=K1IPxdVy4fZCng5xG6VcSYUD6J37h5oqvNUACa9ePoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=igaCd1pyuVUh6nBv9BN6OqoeU5d9oA3p2H+ZRSrzRbo+tfvH67tPKb+ugapYHytYeT/BPPzDdrxIaQmtREo8doLSel4B8hcKuQFhRviwxu5VFVCY+6LLnucMg4CuqhSlqhBTR16wKvWlt7rSr/i2WYIUoliZ2nT1Ac6Pz9Zd0fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=nbsVU4+4; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705670500; x=1737206500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CIxJzAcS+XeBrCCuEb7lQaNC4+Wn5Lkt43iOlbH8Qbo=;
  b=nbsVU4+4JCgQOL0JaFgiQl93rSf1jpq73LlKXZociMviBbafczytTDr0
   J4gU97BdzS53jOSeDcX1rGsWIBUTTPNzHxa/KgvGzYTO5wPLM4BiVVoG0
   qvhFmElo/lB8F9a9UHUTTU/NxwzJgLzGk2ISQR0mhYUQHxy5Rs6W20Bjc
   9MncENNXnOIsDryzeq8jYGxfAYuEwkj7ifu7o8KTjNuuiYP+tehPodz/U
   StKpH0DJonQr5Fr11lTzTq7XEzVWTtBMiPFWToo1oyQ+q5QEb0DUZaXN7
   VTdOSHHOAWteEtJJ33za/6rMOg1R6QJtqSZsVVfVchonZXv9lN7ykJBsO
   Q==;
X-IronPort-AV: E=Sophos;i="6.05,204,1701126000"; 
   d="scan'208";a="34982808"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Jan 2024 14:21:32 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C6909280075;
	Fri, 19 Jan 2024 14:21:32 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@wolfvision.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: imx415: Add more clock configurations
Date: Fri, 19 Jan 2024 14:21:32 +0100
Message-ID: <3602834.R56niFO833@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240108105242.GC20868@pendragon.ideasonboard.com>
References: <20231212072637.67642-1-alexander.stein@ew.tq-group.com> <20240108105242.GC20868@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Laurent,

Am Montag, 8. Januar 2024, 11:52:42 CET schrieb Laurent Pinchart:
> On Tue, Dec 12, 2023 at 08:26:35AM +0100, Alexander Stein wrote:
> > Hi,
> >=20
> > this small series converts the driver to using CCI helpers.
> > On top of that more clock setups are added to the driver.
> > These are all taken from the datasheet. I suspect they all can be
> > calculated dynamically later on.
> > Tested on TQMa8MPxL + MBa8MPxL + ISP + Vision Components IMX415 camera.
> >=20
> > While working on the driver I notived that imx415 sets mbus code to
> > MEDIA_BUS_FMT_SGBRG10_1X10, while imx290 uses MEDIA_BUS_FMT_SRGGB10_1X1=
0.
> > But the datasheets show the same color coding pattern. But both settings
> > seem to be correct, e.g. the resulting image has correct colors.
>=20
> The difference may be in the crop settings, of possibly flipping.

I checked the flip ("inverted operation") settings on both sensors. The=20
readout direction seems to be identical. Cropping areas are a bit different=
,=20
and currently unconfigured. But left margin is 12, so I don't see how that=
=20
could effect color order.

Best regards,
Alexander

> > I had to remove the identity check locally. I suspect that Vision
> > Components interjects reading some registers.
> :
> :-(
>=20
> I'm getting increasingly annoyed by vendors who play such tricks.
>=20
> > Changes in v2:
> > * Removed explicit selection of REGMAP_I2C
> > * Dropped patch 3 for now. Mode selection shall be done by dynamic
> > VMAX/HMAX>=20
> >   calculations later on
> >=20
> > Best regards,
> > Alexander
> >=20
> > Alexander Stein (2):
> >   media: i2c: imx415: Convert to new CCI register access helpers
> >   media: i2c: imx415: Add more clock configurations
> > =20
> >  drivers/media/i2c/Kconfig  |   1 +
> >  drivers/media/i2c/imx415.c | 651 +++++++++++++++++++++++--------------
> >  2 files changed, 416 insertions(+), 236 deletions(-)


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



