Return-Path: <linux-media+bounces-30997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3A6A9C102
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE0249A6390
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91280236426;
	Fri, 25 Apr 2025 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="huTZpKpX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E0023535C;
	Fri, 25 Apr 2025 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569752; cv=none; b=HoetbsDE7tACyNTzON2onvV46XfMD004GKRQMzS5l3PHgtkgE1DNO3iw5S+TjaplgI15watksjiIkyEAgeB+oflU+J/U64q0Ikty1ZmCRBmEkFfgEuFV/DcrJ2iUhSzPkTfoWIDrtkjrizucqSXNUK1hfpzFjZpQs+6GiwVTYYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569752; c=relaxed/simple;
	bh=2OZ3oMp4cEq/mYK1OeziCpM9vL9iHbwI9O5aD4tiH8k=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lTN1euRbbVGst7rfMN6gbBdr7yiBfrg9O/RzexDcAQnYWNi4akeiTv7OFdTqU06N+S+xB7vGE1mbU+PmZwZh0qwBKRK/YtXpCsuf6HXk7o8IRnwAOiotm8mTJrVQhf7bbx7Pj/aGPttg3fBRolcr1bhWok2CRgccGWoyca4/mxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=huTZpKpX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A911982;
	Fri, 25 Apr 2025 10:29:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745569745;
	bh=2OZ3oMp4cEq/mYK1OeziCpM9vL9iHbwI9O5aD4tiH8k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=huTZpKpXmk3Skvu6kqgIALyLUAZ+xfR2+qsxVi3IJ63hdR6nn1nlueY1pz/UR+tOr
	 O1FQr56eXDoZDVYJJja5+7Up9WvFoo0uMweyyG1UhrjBmSS2Qbr2/0eKxxaG/zHJdx
	 peKF8LHRqtxM5LPaFuKdm/PqSA3iSryqmObM1ocs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aAtAtp2epJCs0RaN@valkosipuli.retiisi.eu>
References: <20250422122052.12601-1-kieran.bingham@ideasonboard.com> <aAtAtp2epJCs0RaN@valkosipuli.retiisi.eu>
Subject: Re: [PATCH] media: imx335: Use correct register width for HNUM
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Umang Jain <umang.jain@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Date: Fri, 25 Apr 2025 09:29:05 +0100
Message-ID: <174556974502.1586992.17161446827676482147@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Sakari Ailus (2025-04-25 08:58:46)
> Hi Kieran,
>=20
> On Tue, Apr 22, 2025 at 01:20:52PM +0100, Kieran Bingham wrote:
> > From: Umang Jain <umang.jain@ideasonboard.com>
> >=20
> > CCI_REG_HNUM should be using CCI_REG16_LE() instead of CCI_REG8()
> > as HNUM spans from 0x302e[0:7] to 0x302f[0:3].
> >=20
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>=20
> Does this need Fixes:/Cc: stable tags?

Aha, yes. I think we could/should add:

Fixes: 8f0926dba799 ("media: imx335: Use V4L2 CCI for accessing sensor regi=
sters")

which is when the conversion happened.

Thanks.

> > ---
> >  drivers/media/i2c/imx335.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index db424b178e98..0418875e996c 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -31,7 +31,7 @@
> >  #define IMX335_REG_CPWAIT_TIME               CCI_REG8(0x300d)
> >  #define IMX335_REG_WINMODE           CCI_REG8(0x3018)
> >  #define IMX335_REG_HTRIMMING_START   CCI_REG16_LE(0x302c)
> > -#define IMX335_REG_HNUM                      CCI_REG8(0x302e)
> > +#define IMX335_REG_HNUM                      CCI_REG16_LE(0x302e)
> > =20
> >  /* Lines per frame */
> >  #define IMX335_REG_VMAX                      CCI_REG24_LE(0x3030)
>=20
> --=20
> Regards,
>=20
> Sakari Ailus

