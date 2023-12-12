Return-Path: <linux-media+bounces-2196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D480E4F3
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 08:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D7081F22C29
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 07:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC6B171CE;
	Tue, 12 Dec 2023 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="OXlIPJkG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803F8AB
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 23:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702366594; x=1733902594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rDc/Sq0qKwTiFZaNWJYiYKAK0r3rWa5om6iCMIVcoFM=;
  b=OXlIPJkGBNyvsI8QoP+RWqARknlYyeWWe8EwjOoLXb5MW1PMU6hfru3c
   AnYHx75OEctRTTpYFQsE2uyhOWR/arv5NgmgKA92Q2aIkNqotyiEK28gA
   DD8xP88Havurvo2mUytdrgkfmyani/4QKGcgmUzMbJR6C7MFvYyIcdpzk
   QcUQUmifghnnQXZRqVyiWxqoTdMi3JrW0kVEBCt0BK4MaLX/Eq8cmZZ7k
   Irn93vjxTHpMhsAM1jcteVB11rfO+MOKJhjSSQXHF8LQ7nnDCIgXOlfFa
   T159aqHGTRY4L8NWxDOpP2bbg95VK7KPSafkzPIoaYaKOgvCTPAsya8ye
   Q==;
X-IronPort-AV: E=Sophos;i="6.04,269,1695679200"; 
   d="scan'208";a="34447669"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Dec 2023 08:36:32 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A41F9280075;
	Tue, 12 Dec 2023 08:36:32 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@wolfvision.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: imx415: Add more clock configurations
Date: Tue, 12 Dec 2023 08:36:34 +0100
Message-ID: <4532114.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231212072637.67642-1-alexander.stein@ew.tq-group.com>
References: <20231212072637.67642-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Am Dienstag, 12. Dezember 2023, 08:26:35 CET schrieb Alexander Stein:
> Hi,
>=20
> this small series converts the driver to using CCI helpers.
> On top of that more clock setups are added to the driver.
> These are all taken from the datasheet. I suspect they all can be calcula=
ted
> dynamically later on.
> Tested on TQMa8MPxL + MBa8MPxL + ISP + Vision Components IMX415 camera.
>=20
> While working on the driver I notived that imx415 sets mbus code to
> MEDIA_BUS_FMT_SGBRG10_1X10, while imx290 uses MEDIA_BUS_FMT_SRGGB10_1X10.
> But the datasheets show the same color coding pattern. But both settings
> seem to be correct, e.g. the resulting image has correct colors.
>=20
> I had to remove the identity check locally. I suspect that Vision Compone=
nts
> interjects reading some registers.
>=20
> Changes in v2:
> * Removed explicit selection of REGMAP_I2C
> * Dropped patch 3 for now. Mode selection shall be done by dynamic VMAX/H=
MAX
> calculations later on

I forgot to mention: This series depends on [1] which is yet to be applied.

Best regards
Alexander

[1] https://lore.kernel.org/all/20231102095048.3222110-2-alexander.stein@ew=
=2Etq-group.com/

> Best regards,
> Alexander
>=20
> Alexander Stein (2):
>   media: i2c: imx415: Convert to new CCI register access helpers
>   media: i2c: imx415: Add more clock configurations
>=20
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/imx415.c | 651 +++++++++++++++++++++++--------------
>  2 files changed, 416 insertions(+), 236 deletions(-)


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



