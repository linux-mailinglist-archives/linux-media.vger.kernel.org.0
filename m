Return-Path: <linux-media+bounces-13818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C580B910768
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25003285679
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D591F1AED4A;
	Thu, 20 Jun 2024 14:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hShq5juN"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C751ACE7C;
	Thu, 20 Jun 2024 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718892204; cv=none; b=MbxZTS60Bfi1ptAhDB0yf4qCf51ayRW+fpHc0Qjrld87aF0Zsb85Q+mDx6s3NtK1W8pGVeYeQ0EQ1rLMEUXym6giRpduokqn5EEKY4Tkw0TlZk5AIR4RbeulFrxigBp7EntcO1Z3L2iLgjYScl2N3uN+qiFV+mp0PbKkR38EWxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718892204; c=relaxed/simple;
	bh=xUOYsCDdVtUL6hlGl8tCl7Hz7xJj589qLC+r4STEt1c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QQUCri0TnFuhnzQxia2alj4hIq2IHrNvnZvWfh+8wyu/fRFWpKGSvXSchoK6LTdxMIrmL8sTiAYbjYWIEcz2HH2E9FOxIMYC2XNjc5YTlI2CCDy+/qP7rNhDRQC0Y7L/oD16VS0Vd1svX98qt8vZqf8haEALpUxVPDqvenlO61A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hShq5juN; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718892200;
	bh=xUOYsCDdVtUL6hlGl8tCl7Hz7xJj589qLC+r4STEt1c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hShq5juNr8MUXwUlaamUy2JujTyhRLfNxg0Lgy/7bhuJHlS+ZrppoglPsP9Rscw9C
	 PvIVAWhJw2HoQlkcBIWToL+7ImIsOHzsEgqyZT0mU9xgGtppUvp3+Jn/OiIdNPuZD6
	 cTAnA3xsmkYRxCIVjSx46BkqvgVM3Q6+OhDrJ8rsYof+eTL3P9IbXdyyIvOzR/rd4f
	 d5998ObmQimbWl2FhUmo2ta5ApedzYM5Rho9KahDZy4BymxZa7dnbwap3wS7RtA4kd
	 O9/2OWFMLzi9nQ8TvHM5WZcMHtnse3AGOZP0GRLfOgGaF15/cnMzUpZsPQkYnQsHiz
	 O2nHqO8QP8fmQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2E8FA37821B9;
	Thu, 20 Jun 2024 14:03:19 +0000 (UTC)
Message-ID: <bc8796ef8107507e99df079f6d7ce2575ead3cab.camel@collabora.com>
Subject: Re: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support
 runtime suspend/resume
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, Devarsh Thakkar
	 <devarsht@ti.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "sebastian.fricke@collabora.com"
	 <sebastian.fricke@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,  Nas Chung
 <nas.chung@chipsnmedia.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>,
 "b-brnich@ti.com" <b-brnich@ti.com>
Date: Thu, 20 Jun 2024 10:03:15 -0400
In-Reply-To: <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
	 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
	 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
	 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jackson, Devarsh,

Le mercredi 19 juin 2024 =C3=A0 23:56 +0000, jackson.lee a =C3=A9crit=C2=A0=
:
> Hi Devarsh
>=20
> If there is no feeding bitstreams during encoding and decoding frames, th=
en driver's status is switched to suspended automatically by autosuspend.
> And if we don=E2=80=99t use autosuspend, it is very difficult for us to c=
atch if there is feeding or not while working a pipeline.
> So it is very efficient for managing power status.
>=20
> If the delay is very great value, we can adjust it.

One way to resolve this, would be if someone share measurement of the suspe=
nd /
resume cycle duration. With firmware (third party OS) like this, the cost a=
nd
duration is few order of magnitude higher then with more basic ASIC like Ha=
ntro
and other single function HW.

Yet, 5s might be to much (but clearly safe), but getting two low may means =
that
we suspect "between two frames", and if that happens, we may endup with var=
ious
range of side effect, like reduce throughput due to suspend collisions, or =
even
worse power footprint. Some lab testing to adjust the value will be needed,=
 we
have very little of that happening at the moment as I understood.

Nicolas

>=20
> Thanks
> Jackson
>=20
> > -----Original Message-----
> > From: Devarsh Thakkar <devarsht@ti.com>
> > Sent: Wednesday, June 19, 2024 10:00 PM
> > To: jackson.lee <jackson.lee@chipsnmedia.com>; mchehab@kernel.org;
> > nicolas@ndufresne.ca; sebastian.fricke@collabora.com
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> > hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>; lafley.kim
> > <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; Nicolas Dufresne
> > <nicolas.dufresne@collabora.com>
> > Subject: Re: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support r=
untime
> > suspend/resume
> >=20
> > Hi Jackson,
> >=20
> > Thanks for the patch.
> > On 17/06/24 16:18, Jackson.lee wrote:
> > > From: "jackson.lee" <jackson.lee@chipsnmedia.com>
> > >=20
> > > Add support for runtime suspend/resume in the encoder and decoder.
> > > This is achieved by saving the VPU state and powering it off while th=
e VPU
> > idle.
> > >=20
> > > Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> > > Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> > > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >=20
> > [..]
> > >  static int wave5_vpu_probe(struct platform_device *pdev)  {
> > >  	int ret;
> > > @@ -268,6 +301,12 @@ static int wave5_vpu_probe(struct platform_devic=
e
> > *pdev)
> > >  		 (match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "");
> > >  	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code=
);
> > >  	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
> > > +
> > > +	pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
> >=20
> > Why are we putting 5s delay for autosuspend ? Without using auto-suspen=
d
> > delay too, we can directly go to suspended state when last instance is =
closed
> > and resume back when first instance is open.
> >=20
> > I don't think having an autosuspend delay (especially of 5s) bodes well=
 with
> > low power-centric devices such as AM62A where we would prefer to go to
> > suspend state as soon as possible when the last instance is closed.
> >=20
> > Also apologies for the delay in review, this didn't caught my eye earli=
er as
> > commit message did not mention it either.
> >=20
> > Regards
> > Devarsh


