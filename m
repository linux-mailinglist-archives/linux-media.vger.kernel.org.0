Return-Path: <linux-media+bounces-19814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018879A33DD
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 06:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69B14B2304B
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 04:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D57017557C;
	Fri, 18 Oct 2024 04:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8ji2qLC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC79A20E31F;
	Fri, 18 Oct 2024 04:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729225937; cv=none; b=P/wUwCb1SXlS9dgDTzbTwSbVaim91WcGqUrbtQR1DEtz2U1oFBxsgpsObojp83TX+sS3dlNVcxG4vL1vmWd0GulQRCiq+JcDp9OUjGvKHl9Ys50rPGZWpsMOmkIiiWAs3D4bRCb/nwSvYqjAgDDaIAiZDbdHlziNs2ogMjWiYpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729225937; c=relaxed/simple;
	bh=l4ggZ3ZuNybj5hJCbt5R/5ZHKRtxVoVJSgTqAUuXJBY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+9qAiywQWj58W5hFJ+M7lbRGXYHYPFdn5A35oUi+Z23MHa8xO7MPaaSmIyeYaNSAnXUUu2+lsr5lbryGCcVmhc4sVYXfbSK6HkV2p4ZVWoD4l1qgkaSXReHOCXCl7PrRfIGA0sy3b8AFsuKHlpnFLyxG9hVMt/vv7rRCdW7Q+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8ji2qLC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5A1C4CEC3;
	Fri, 18 Oct 2024 04:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729225936;
	bh=l4ggZ3ZuNybj5hJCbt5R/5ZHKRtxVoVJSgTqAUuXJBY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W8ji2qLCWma5PeMgN+jaey2PpjQ0ditQIRLMrxjP43CMTPD7M2m3dMx/nLqWoogkt
	 +Ey9MzOJ9hpPnjyPb6YQFPmktlPOD8+dZ+3s7BX/60DrmhoCboKTqg7dEW7Xl/ezrj
	 BQVd+9Ikwkm8D2BvebFsGxIPkZrZD4tzHhsDLN2QbnBpSk8Zt4ThPcK1if45x1g3/T
	 Jvwuj8pLy/zYZiHAbx95LM0m93n/whT8GQV7dWoGb2mQ07ZGRHeJuY4fBtL0UOkMuA
	 KsnbkfJTqW0o8skzacX1y5f8ytVLOOnDHIKFuzmdqVKRRxwV3KH6OWBCqBAitBNrGG
	 39cYbAYqlLZgQ==
Date: Fri, 18 Oct 2024 06:32:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Martin =?UTF-8?B?VMWvbWE=?= <tumic@gpxsee.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Martin Tuma
 <martin.tuma@digiteqautomotive.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 05/13] media: mgb4: protect driver against spectre
Message-ID: <20241018063209.69a76bb1@foz.lan>
In-Reply-To: <b5fcb290-5374-4ff3-b74c-a1bd3c802ef0@gpxsee.org>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
	<4675c8e726c7d55bbecf9f4772370daa8b46ccd3.1729074076.git.mchehab+huawei@kernel.org>
	<b5fcb290-5374-4ff3-b74c-a1bd3c802ef0@gpxsee.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Wed, 16 Oct 2024 13:59:18 +0200
Martin T=C5=AFma <tumic@gpxsee.org> escreveu:

> On 16. 10. 24 12:22 odp., Mauro Carvalho Chehab wrote:
> > Frequency range is set from sysfs via frequency_range_store(),
> > being vulnerable to spectre, as reported by smatch:
> >=20
> > 	drivers/media/pci/mgb4/mgb4_cmt.c:231 mgb4_cmt_set_vin_freq_range() wa=
rn: potential spectre issue 'cmt_vals_in' [r]
> > 	drivers/media/pci/mgb4/mgb4_cmt.c:238 mgb4_cmt_set_vin_freq_range() wa=
rn: possible spectre second half.  'reg_set'
> >=20
> > Fix it.
> >=20
> > Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 d=
river")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >   drivers/media/pci/mgb4/mgb4_cmt.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/media/pci/mgb4/mgb4_cmt.c b/drivers/media/pci/mgb4=
/mgb4_cmt.c
> > index 70dc78ef193c..a25b68403bc6 100644
> > --- a/drivers/media/pci/mgb4/mgb4_cmt.c
> > +++ b/drivers/media/pci/mgb4/mgb4_cmt.c
> > @@ -227,6 +227,8 @@ void mgb4_cmt_set_vin_freq_range(struct mgb4_vin_de=
v *vindev,
> >   	u32 config;
> >   	size_t i;
> >  =20
> > +	freq_range =3D array_index_nospec(freq_range, ARRAY_SIZE(cmt_vals_in)=
);
> > +
> >   	addr =3D cmt_addrs_in[vindev->config->id];
> >   	reg_set =3D cmt_vals_in[freq_range];
> >    =20
>=20
> I still do not fully understand the exact vulnerability here, but the=20
> patch should definitely not do any harm, so I'm ok with it even if it's=20
> real purpose would only be to silence the smatch warning :-)

With Spectre, just checking if freq_range is between 0 and the
size of the array is not enough, as malicious code could use CPU
speculative logic to retrieve data from memory outside the limits
of the array.

As freq_range is specified by the user via sysfs attribute
frequency_range, it is subject to Spectre v1 attack as described
at Documentation/admin-guide/hw-vuln/spectre.rst.=20

Silencing smatch is a plus.

>=20
> Reviewed-by: Martin T=C5=AFma <martin.tuma@digiteqautomotive.com>

Thanks!

Thanks,
Mauro

