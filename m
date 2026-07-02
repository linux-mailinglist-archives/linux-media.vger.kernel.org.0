Return-Path: <linux-media+bounces-66402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J72DAYmvRmpbbgsAu9opvQ
	(envelope-from <linux-media+bounces-66402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:35:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD596FC201
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:35:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=VztCoPJA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66402-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66402-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7BEC31EDE61
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 17:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D45384CE9;
	Thu,  2 Jul 2026 17:58:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CA3320A37;
	Thu,  2 Jul 2026 17:58:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015093; cv=pass; b=g1rCVbb84szZvH14t2WjV5RN4LYzgqt+6UM7cPc4BulAoLXzTPnC1QYHQaxv2IWRTkJQlocCMjoe8ikWZfjwVQq0PiN8THFsbwSHItCSU29xkFI8t6vGYvfRUK2k3G1c4gkHs0SR57u0QqnrmnR4TycNFzK8qljwAG3CB/7ZOcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015093; c=relaxed/simple;
	bh=MWXAacyEKktBwIfFlAg536BelDUxSDm2HUQ2rWkgDnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UM+gamkhhXaKEQ6t8J/7gbY8yOVNBGtXl50yArhNHQj7hDTnU39JnLYOKbcU80jyBV/RlHund2Ug8gAxh+H1Ymoxy06fvrNVjEE8kcZLVrcMtwhfnRDPkMeTJhuMw39n/JDH7kjn4bfRHW82mOazglUMWTwUY7PuNAio0BhKVw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=VztCoPJA; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1783015078; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eEysXMWkIgmgQq62POpwZyPtReROdfp9DcRBZm7J7VV9L4T7f4D2D5hFLYpH/NCy9AaIJcgohrMXouNd49NWhM17YEM6u0nS/7krbK+tiZh8sm0HdioSI5Qr8mAYiCp2jgOAoxKXSc2SQIh6u0Uz4ZMpfJy7U+mxDOGfs6HdGDs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783015078; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x3FGYaIm4+Bx0K10N4oUqaYj+E/e8FPAh9PHboSXrzk=; 
	b=iLAJCtbo+PF1YEckzcYGJMNbMdlyWKKsn4MZmtCHAMDSq4/OMk/3CZZ+sTQZCRio4a1qm9EAucAlT5GUejBiLdGZuwrtc/mWiqL3kcVuVtBMPAYUpxwjtCagLBWW7V9genwWzRzaTyrEpD4DzdsLuFAPyT9bA8eFioGBNJ2U+po=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783015078;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=x3FGYaIm4+Bx0K10N4oUqaYj+E/e8FPAh9PHboSXrzk=;
	b=VztCoPJASoeUL1MHjKIt2nXkDdHMArt4uv52ZZ0C//hsZI+W7r113xfrbRdRHzgY
	m2uDcnQbTcPhFJpJE8lz7S1Cg6eiIs6EukYNgDQ3+p7jJxkicf7zyzwQm2kLEUb7RAA
	nJfETZp4mAlqmpWI0r8G7dWVcVaLDngAQrvI/t44=
Received: by mx.zohomail.com with SMTPS id 1783015076593286.68618795309317;
	Thu, 2 Jul 2026 10:57:56 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Hans Verkuil <hverkuil@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: Re: [PATCH] media: rkvdec: Propagate platform_get_irq() errors
Date: Thu, 02 Jul 2026 13:57:54 -0400
Message-ID: <u6-dHgmpTzmKPiphpyUkbA@collabora.com>
In-Reply-To: <20260701111203.62092-1-ahmisaranrao@gmail.com>
References: <20260701111203.62092-1-ahmisaranrao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66402-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ahmisaranrao@gmail.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:hverkuil@kernel.org,m:boris.brezillon@collabora.com,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vanguardiasur.com.ar,kernel.org,sntech.de,collabora.com,vger.kernel.org,lists.infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BD596FC201

Hi Vadlamudi,

On Wednesday, July 1, 2026 7:12:03=E2=80=AFa.m. Eastern Daylight Time Naras=
imharao=20
Vadlamudi wrote:
> platform_get_irq() returns a positive IRQ number on success and a
> negative error code on failure. It no longer returns zero. The driver
> currently returns -ENXIO for all failures, which loses useful errors
> such as -EPROBE_DEFER.
>=20
> Return the error from platform_get_irq() directly.
>=20
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c index
> 1d1e9bfef8e9..37683a6bb40f 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1818,8 +1818,8 @@ static int rkvdec_probe(struct platform_device *pde=
v)
>  	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>=20
>  	irq =3D platform_get_irq(pdev, 0);
> -	if (irq <=3D 0)
> -		return -ENXIO;
> +	if (irq < 0)
> +		return irq;
>=20
>  	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  					rkvdec_irq_handler,=20
IRQF_ONESHOT,

Thank you for the patch ! And sorry for the HTML email before. So for the=20
record:

Reviewed-by: Detlev Casanova <detlev.casanova@collabora.com>

=2D-
Detlev.



