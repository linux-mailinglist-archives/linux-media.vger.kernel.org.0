Return-Path: <linux-media+bounces-50667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C63ADD1DACE
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 971F9300FFA9
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9A734F46C;
	Wed, 14 Jan 2026 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="LEF7DDqI"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A79346AE6;
	Wed, 14 Jan 2026 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383934; cv=none; b=AjcFakhb/rqJZ56e1X2Gd0FJI1rXZbO5Gom88x+NI4vKbQ5jfGGNr0TNxsgIXiC4sCcQyUgY0tiCzryeHdWDpPxJJTkY3vw/m9hrgE/m7vqaq2LliVkyE7j6QQ6waL4NV7k/ZKxXQVA4t07WNPalFgAXsiD/rZSE+riqCwC4Z9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383934; c=relaxed/simple;
	bh=4s68DC+2mswJ6A8dMZQo+rSzZlzvTgAlP4PrnLOKuXY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ogvxFi08AD8umPzggAzQPWyWL0scznJUod5dE4jCO/oGLpzJTZv9ff7ygXlU4JgoN3AJhaoll/l2JwcVTMDxMS9+6ChW+jO16hJwSaUAOCT3OJ54HdSqlU/b13UG3sDEm1gf9MuN/AAczUXy1bd06n0X05hGsjcOZaW1YYTs/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=LEF7DDqI; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768383916; x=1768988716; i=markus.elfring@web.de;
	bh=bcLrI0SZWFnMdPodRkxB8WeM6Ny/jApsSr+75eyXMec=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LEF7DDqI4y/oITIOl8/EO7rA0lCnCez3Egth4N3mQQnhUxbGWJ5QFGtUOM9h09/g
	 qmvWWiCY9lbFC9/VPGs27t+WFEFZwQtTPn0mnPOTAjsprNEiNcaf68Y9kZIwOgqQe
	 ideBGk39hwIWrZxQRshR1qv183xlOVvnDQwg4qKAzqBPbCwsKLzJOn3cXCA+ZD8Wg
	 +/XW9HLDsWggQDW9+nU2brRR7RVF/jMBWJll2R6/uJHgMf8MfenrTiuIiZhwoi009
	 om5/R9BcwS6/QstIGuDCGjCV5XcZZaDkucm5hA5RKWtom1s4M0+4GfMYaAK0+DGEq
	 njNz+flbqU7codY1AA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.218]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MNfYN-1vU5ku3vAZ-00J5av; Wed, 14
 Jan 2026 10:45:16 +0100
Message-ID: <b2c34f3e-9856-4811-a434-333930176162@web.de>
Date: Wed, 14 Jan 2026 10:45:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bin Du <Bin.Du@amd.com>, Sultan Alsawaf <sultan@kerneltoast.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, linux-media@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Alexey Zagorodnikov <xglooom@gmail.com>, Anson Tsao <anson.tsao@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>,
 Dominic Antony <Dominic.Antony@amd.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@amd.com>, King Li
 <king.li@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Phil Jawich <Phil.Jawich@amd.com>, Pratap Nirujogi
 <Pratap.Nirujogi@amd.com>, Richard Gong <richard.gong@amd.com>
References: <20251216091326.111977-5-Bin.Du@amd.com>
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251216091326.111977-5-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lbjGKRiTmm2mlucyNgfxTqyAdPZ3Vl3W6N/asEJk5bbhP+mOWxL
 dPOvuBMIBvkcTd8ghFjOumes9zjGAEwF6YwcieBBqiedxDyiekEaMMe4aBpEP8jjrTwGqcX
 wicHtVD+84fuAzKlGYlJo2tJwTaKpXncpyXlQGfehCrzECuE+kb+jG6UuJBAW+4BEUz05IU
 jAsSkXEKSckD7GjvXxmMw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XmaeJ0citoY=;DYHw0bl78YqX3w6O7+eShiDKYBs
 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
 AOFLNIN0=

=E2=80=A6
> +++ b/drivers/media/platform/amd/isp4/isp4.c
=E2=80=A6
> +void isp4_intr_enable(struct isp4_subdev *isp_subdev, u32 index, bool e=
nable)
> +{
=E2=80=A6

> +	spin_lock_irq(&isp_subdev->irq_lock);
> +	intr_en =3D isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_EN);
=E2=80=A6
> +	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_EN, intr_en);
> +	spin_unlock_irq(&isp_subdev->irq_lock);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irq)(&isp_subdev->irq_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/spinlock.h=
#L571-L573

Regards,
Markus

