Return-Path: <linux-media+bounces-2229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED30180EB56
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 13:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A81A8281119
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 12:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F4D5E0C2;
	Tue, 12 Dec 2023 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="YzleXWef"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6DBAF
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 04:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702383499; x=1733919499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DtD1SFaScFdDKdBR8P3caYzgWAoPqByAZMmpcUQewJ4=;
  b=YzleXWefgzkj/ZllY4KdQ8CcLB9hOal0cDW8gzeSAl0XLz3c3lOm7jo8
   ip3XsBIzftQjnGWdvX/to1cIwjlnlhchaVFXbJBM4Jr+ut9foTCzskKdQ
   yJEAtybUSO6ZsPajqrhD/ioV3sNbZrT6inFDPq57p1bKqm4uTnAt967fA
   p3gO/+hhwy1SloKBN7RaLzoxt2toJ0v7UtXAdWoEZI4vFa9fxzOqdL6VI
   ynT6mzIUM9NPSJSLBZYOsipKO4TGLuxVWn/UMv7XKnO3bTXN80Kvg7B6X
   lEHf5jlXx8WxZhOjijV9tCsVEtLYkGFr11y6FPI054tDV2BIEZaoBFerz
   g==;
X-IronPort-AV: E=Sophos;i="6.04,270,1695679200"; 
   d="scan'208";a="34457305"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Dec 2023 13:18:16 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CBCE4280075;
	Tue, 12 Dec 2023 13:18:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@wolfvision.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: imx415: Add more clock configurations
Date: Tue, 12 Dec 2023 13:18:18 +0100
Message-ID: <2167674.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZXhGAR2fhEOjHXcJ@kekkonen.localdomain>
References: <20231205090557.298680-1-alexander.stein@ew.tq-group.com> <20231205090557.298680-3-alexander.stein@ew.tq-group.com> <ZXhGAR2fhEOjHXcJ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Sakari,

Am Dienstag, 12. Dezember 2023, 12:37:37 CET schrieb Sakari Ailus:
> Hi Alexander,
>=20
> On Tue, Dec 05, 2023 at 10:05:56AM +0100, Alexander Stein wrote:
> > Complete the list from "INCK Setting" section in IMX415-AAQR-C
> > (Rev. E19504, 2019/05/21)
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Could you address these smatch warnings, and run
>=20
> 	./scripts/checkpatch.pl --strict --max-line-length=3D80
>=20
> on the patches?
>=20
> drivers/media/i2c/imx415.c:402:30: warning: decimal constant 2376000000 is
> between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compile=
rs
> are very likely to produce unsigned long (and a
> warning) here
> drivers/media/i2c/imx415.c:417:30: warning: decimal constant 2376000000 is
> between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compile=
rs
> are very likely to produce unsigned long (and a
> warning) here
> drivers/media/i2c/imx415.c:432:30: warning: decimal constant 2376000000 is
> between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compile=
rs
> are very likely to produce unsigned long (and a
> warning) here

Interesting, I don't have these warnings here. Is this some more recent=20
checkpath.pl not in next?
I've addressed this and some 80 char length warnings as well. As I've sent =
out=20
v2 this morning already, I'm waiting a bit more bevore v3.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



