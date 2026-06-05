Return-Path: <linux-media+bounces-63868-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SXJ3Cvd2ImpoXwEAu9opvQ
	(envelope-from <linux-media+bounces-63868-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:12:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A5C645D1A
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:12:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FVw2+DsW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63868-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63868-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 165FA3112254
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 07:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A377477983;
	Fri,  5 Jun 2026 07:03:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C7A453486
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 07:03:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643034; cv=none; b=fyslMVtZrN3FHQWDesMVJMurIrg13cTUsoFlrrKULYfFYStBVjKut1Dbt5DVHxaVaMIlby0izYWVlc+qrvHKLrQ4SuQcoYzWTEEgYhf6eH5pTzXxrGVNV0l2BSRTTkDh7s1gkuFzhGUJfsAMPGZn6ar/19qJT02Se5oUgn5Lvdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643034; c=relaxed/simple;
	bh=pJ1O6zeqzB+QdEQwhuMD3IHNudrYqlzztAJlLNKZuAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J+eQ3d9+9lIlK8iyK+IjjITSv+GGuGTBMGyi9Y3Z7/hkHHisxyBG8ELSjjNvePOjQxi5uKlH3SxBrL2RdHlkw2HKnlfa4EZvDINjGkE6yrag29poqxtFoJHAUjJMnMPstnq/fEa2pNpYRFClGya9Ua7QTTgt0Qu/qB0N1KqxrcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVw2+DsW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2234B1F00899;
	Fri,  5 Jun 2026 07:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780643031;
	bh=thH+xSmRJ1p6dFMBZ3hCjI7fi88DZ7AkWXao4AYRp8s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FVw2+DsWpy2wK5av9l0leoiIWq6JhOKhGJXx/JjScaMOGqxnT7j6hvVswF5wLgyfF
	 4craqBz0YKoGO3RIJnyUgFrGG9Q1XthDP19ot7lQtvG0iLqA9spK9Z87affEcrG+Zj
	 a18uBES1hpo/SmP1+DvtsxBx6TVedhSIRRlmSd/wEzNkzGo2n1AIj/eP490MY421jx
	 n+UUVe2kioiMuxVi9r8J+b3a0lLoGQ5y6qUHNLkkBVvSCjp3fF1WBE33Ix7aPbTV/c
	 jkDkCM+CobAg1pseVlyiRcJvbw3Mg2Ri9kIZv0Gl1tsV3ZaTt0/wPFhA1Y/PBYE5lt
	 HeMyo8dZb7wuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/4] udmabuf: emit one sg entry per pinned
 folio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bobby Eshleman" <bobbyeshleman@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
In-Reply-To: <20260603-tcpdm-large-niovs-v1-2-f37a4ac6726c@meta.com>
References: <20260603-tcpdm-large-niovs-v1-2-f37a4ac6726c@meta.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 07:03:50 +0000
Message-Id: <20260605070351.2234B1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63868-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bobbyeshleman@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,smtp.kernel.org:mid,lists.linux.dev:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71A5C645D1A

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The scatterlist construction merges contiguous pages into a single=
 segment without respecting the importing device's DMA maximum segment size=
 constraints, which can also overflow the 32-bit SG length field for gigaby=
te-sized folios.
--

commit 0cf8c9573968c851d2a1981909f322167f021ced
Author: Bobby Eshleman <bobbyeshleman@meta.com>

udmabuf: emit one sg entry per pinned folio

This commit updates get_sg_table() to walk folios and emit one scatterlist
entry per contiguous run of pages in a folio. It coalesces entries for large
folios instead of emitting strictly one sg entry per PAGE_SIZE.

> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 94b8ecb892bb1..f28dd3788adad 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c

[ ... ]

> +/* Count the contiguous folio runs in @ubuf, one sg entry per run. */
> +static unsigned int udmabuf_sg_nents(struct udmabuf *ubuf)
> +{
> +	unsigned int nents =3D 0;
> +	pgoff_t i;
> +
> +	for (i =3D 0; i < ubuf->pagecount; i +=3D udmabuf_folio_nr_pages(ubuf, =
i))
> +		nents++;

[Severity: High]
Does this count assume each contiguous run can always fit into a single
scatterlist entry?

If the importing device has a restrictive DMA maximum segment size, will th=
is
under-allocate the sg_table since large runs might need to be split across
multiple entries?

> +	return nents;
> +}
> +
>  static struct sg_table *get_sg_table(struct device *dev, struct dma_buf =
*buf,
>  				     enum dma_data_direction direction)
>  {

[ ... ]

> -	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> -		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> +	sgl =3D sg->sgl;
> +	for (i =3D 0; i < ubuf->pagecount; i +=3D run) {
> +		run =3D udmabuf_folio_nr_pages(ubuf, i);
> +		sg_set_folio(sgl, ubuf->folios[i], run << PAGE_SHIFT,
>  			     ubuf->offsets[i]);

[Severity: High]
Can run << PAGE_SHIFT exceed the importing device's maximum DMA segment
size (dma_get_max_seg_size(dev))?

If the hardware descriptors are limited (e.g. to 64KB), a large merged
segment might get truncated during I/O by the importing driver.

Also, if a system supports gigantic folios (e.g., 16GB HugeTLB), could
run << PAGE_SHIFT exceed UINT_MAX? sg_set_folio() stores the length in the
32-bit sg->length field, which would silently truncate the value.

> +		sgl =3D sg_next(sgl);
> +	}
> =20
>  	ret =3D dma_map_sgtable(dev, sg, direction, 0);
>  	if (ret < 0)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-tcpdm-larg=
e-niovs-v1-0-f37a4ac6726c@meta.com?part=3D2

