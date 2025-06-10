Return-Path: <linux-media+bounces-34387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B28AD2E77
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68CFE3B1C9C
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 07:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3877427AC35;
	Tue, 10 Jun 2025 07:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="S9xEOQ0N";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="R6H7mn5w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DA14685;
	Tue, 10 Jun 2025 07:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539851; cv=none; b=Nj9cl5q1AC8m1PuvYwTcaFMTvagjJf0RmS2M0NtZ7eQLICQ7cJnPZRukRBNYSH1Rh7NC8kuSZBnb2TxoiJB/T6rpH22r/t+6IHQJ2v/8FpqDagj3L0n/Go+PAg9lfrI1/m+mYrmze46p2j47QLTOj3iVwSqilvVuz7yRMOMP/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539851; c=relaxed/simple;
	bh=b524pXN0OU7FxMQnzBXONAWxgxBRb1kNYLmMh0RMgMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LFt6ZrZ9tsP7KdAS4xgAz5wjzp/byN6OKfsUrMlloQsw5PtXf+dICbStdIHHja7A2zZ2Efrz6NHQ5hRhGS3nL9P39RPa61EXYbWqlgBWJrPmDwY/6NyDHO8IluAxfqzfA8c+YxNZIQo03HaBNp06mdxoLGFMt1KgNYM0j9YgcdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=S9xEOQ0N; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=R6H7mn5w reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749539848; x=1781075848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5UniAvZESTfn+wymekpIinnCdI455GXxoi6+/rhJB6I=;
  b=S9xEOQ0N0nmZ88rvu/GdubQ3Wb41WoW3K2wDXiBfNPHuMAH+DQ0qSJG/
   N2dD1OWwriSp0FdfEXDScDjvmtcDdnTAHWWuO6gFg28MnFr6ijQgEDUSw
   EK1koQkGl8W5RN4gJFHLRE3B7ey71ppopc1K/yWKy10MplzPD83128/35
   t/lE3RYctYns3JSPgZiU0ZP2gSktplLCg6MD+twh7XM3uYWGG5p4FWOsy
   ptPOjdkubgLD870TJI4GJ/2XnowxIc0U/8dW1q6xPFdBi8GaN6c7oMRGv
   PxNpof3LRnIMF8NEd/m2hHC8G93X+dBnvhFrwqmEzvhAx3eiO2BNCCrpX
   w==;
X-CSE-ConnectionGUID: 72KKQk/iQpGdmGt2S3iHxQ==
X-CSE-MsgGUID: kcsNPqIcT7i6fBLfqngXGw==
X-IronPort-AV: E=Sophos;i="6.16,224,1744063200"; 
   d="scan'208";a="44535224"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Jun 2025 09:17:25 +0200
X-CheckPoint: {6847DC05-1E-569BE4A0-ECC5EE08}
X-MAIL-CPID: 6C1A0426CFBAA0EE75CFBB7B038D90B1_3
X-Control-Analysis: str=0001.0A006372.6847DC2D.0002,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 827F4164205;
	Tue, 10 Jun 2025 09:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749539841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5UniAvZESTfn+wymekpIinnCdI455GXxoi6+/rhJB6I=;
	b=R6H7mn5wx8Yy1iyCyKn5ow/XqlgymnT62kYF+4BvsSfoR27tqm8c7A4pnUvpGXztHfePgM
	xADbNnPcy2kdOyMtcA3gSUFmyUM+0QR87TGSKmPrEJbdXMCrmnu1LdmiDr/9EEbtckPQcb
	0GjHa1XG1YjD4gVASESHYz9Ju4mi9jJkcN/Dwo8C2s4/axza7JtmEn1ksAk0h6no3reGOV
	eQqSLia3zNlF76r87KWnrg+u9LxiEP9qp/Mkr3uqxt/OAk9x/dECdVyGs0lrlFVX9n2hRr
	/bHuKKxJ+jb5h1GzAQKpI0IQ8c9aZ3tzILA5aJxWAf1QG2P6JJ0CiSm8N0ZwOA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH 3/8] media: imx-mipi-csis: Log per-lane start of transmission
 errors
Date: Tue, 10 Jun 2025 09:17:20 +0200
Message-ID: <5020258.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250608235840.23871-4-laurent.pinchart@ideasonboard.com>
References:
 <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Laurent,

thanks for the patch.

Am Montag, 9. Juni 2025, 01:58:35 CEST schrieb Laurent Pinchart:
> The CSIS has per-line start of transmission error interrupts. Log them
> all, instead of only the first data lane.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index b652d59851c2..e27467e6372f 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -100,7 +100,7 @@
>  #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
>  #define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
>  #define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
> -#define MIPI_CSIS_INT_SRC_ERR_SOT_HS		BIT(16)
> +#define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
>  #define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
>  #define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
>  #define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
> @@ -241,7 +241,10 @@ struct mipi_csis_event {
> =20
>  static const struct mipi_csis_event mipi_csis_events[] =3D {
>  	/* Errors */
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),	"SOT 0 Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),	"SOT 1 Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),	"SOT 2 Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),	"SOT 3 Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



