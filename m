Return-Path: <linux-media+bounces-24259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15406A0207B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 09:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FB4B3A10DC
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 08:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84C81D88D0;
	Mon,  6 Jan 2025 08:15:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4382D1D63CA
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 08:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736151317; cv=none; b=n3QGLmx50KmSwwWEU4GOtAWj7Vbp11kaY3FUU1Z49CAZhwrQrAlW2xZmF86805hMsZikPB+ukV6E8GXd4+dUQsrgmkTQd6ixZNSCkL8rap3sUZXVN1nLfjf7zGwGQCbpWbtTujgRJ7fgMECcZjgX84TX3QuQ9aaiMdze9/6Td84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736151317; c=relaxed/simple;
	bh=3zrhuWdl+eSUohS/d98KHCrJsBZfsUuxgan6ZSCqeDY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mXYkE+vr36Ifx/wjYpo/cOuqTKUYDT9yDihSvyYXfel1F7SVZ/OgaytNaG5/KkgJ85CW9hGyh88n0mO1B/OVfz6F3kn2xFRnO7NHjdA9JK46tbIFqCp2AZE3JymeQKTdnakked0p0PLornin7cquUApNevVY+URTuCv032iZFJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUiGS-0000bP-RT; Mon, 06 Jan 2025 09:15:08 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUiGR-0078GA-0V;
	Mon, 06 Jan 2025 09:15:07 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUiGR-0008Ss-2m;
	Mon, 06 Jan 2025 09:15:07 +0100
Message-ID: <e2cd8a249820913562350c786116d91d447f437a.camel@pengutronix.de>
Subject: Re: [PATCH] media: coda: Add system resume interface
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Xiaolei Wang <xiaolei.wang@windriver.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 06 Jan 2025 09:15:07 +0100
In-Reply-To: <20241221031455.1361778-1-xiaolei.wang@windriver.com>
References: <20241221031455.1361778-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Sa, 2024-12-21 at 11:14 +0800, Xiaolei Wang wrote:
> When the system goes into sleep mode, the dependent
> power will be turned off, so when the system resumes,
> coda_hw_init() needs to be called, otherwise it will
> get 'CODA PIC_RUN timeout' after resuming.
>=20
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/platform/chips-media/coda/coda-common.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/driv=
ers/media/platform/chips-media/coda/coda-common.c
> index 289a076c3bcc..e6e3f5ec24f6 100644
> --- a/drivers/media/platform/chips-media/coda/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda/coda-common.c
> @@ -3340,6 +3340,7 @@ static int coda_runtime_resume(struct device *dev)
> =20
>  static const struct dev_pm_ops coda_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(NULL, coda_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resu=
me)
>  };
> =20
>  static struct platform_driver coda_driver =3D {

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

