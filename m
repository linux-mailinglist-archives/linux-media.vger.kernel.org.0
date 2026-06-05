Return-Path: <linux-media+bounces-63948-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y0LHB5PzImqdfgEAu9opvQ
	(envelope-from <linux-media+bounces-63948-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:04:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CD964991C
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:04:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ESKRDJAS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63948-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63948-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26CF3301600F
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 16:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB538376BEC;
	Fri,  5 Jun 2026 16:02:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD16E38B131
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 16:02:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675375; cv=none; b=lczARxplxAmy2eFbjkXrAuXraBrYJupFj4qVSKVz6XDs/6I41CPRmM+LoYJAmbasRkBI7O5dZCQ+R4l8/Rani1BEiYnUqSBU3KhNQZWpgsuTIvwgmUEjOJbRDpQrskMTgv/MQJ32NCjwv2yvWs1H/DqmsH9Hop9wHF2SHpkZmHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675375; c=relaxed/simple;
	bh=6ogKfpAl98z/txSR7zK8YLVGy0Is8GYTW05mmmtNphs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z2JnQMlsWSwvkr8v43JthJvDvbKBp5JnI7AtlG5msIH/87qID3B2WdNlu8+YkTxaio0M9OBnspDOjyarCgNOubHFnzflFvS8t2bv3K1o277xBVy90G7+MFCIfpThDfOrSI884JUALy5Zkp69ftlkbRGfek9jpBhHyKyImXQd5U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESKRDJAS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637381F00893;
	Fri,  5 Jun 2026 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780675373;
	bh=zs3gRL2Jxmh2XLWYcX4fEfvoibonHfyoW/I2JwX2inc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ESKRDJAS32F/VW/1vi7P99mCUToSDleWUi+39NWijUbMzNFVA8B7I4glmGzBBm1Ip
	 GhUA0NmlVHSkEpshb4VeRbqHXdgSAzk8W27bEfSTcCM//tV3y/+vNTtPnvjz4ya0ao
	 s1pjpk1rNm+N8xXE12gfymNk5oydx9VaKGwnPm1m/WLWLuAE3E+xQkeu/xbUvGC7Pb
	 JoBf8587LJGB61midPHyIZFyPxL+McA8ALMR9ftuSRlQuLWYYFPTpHoVL40XD0iQYC
	 b17olyomuCL5Z6ghxYCEKVEploiMihsEaB80yR5y4GXL8HoBr+T81tJ/VGu826+Kzs
	 UTETLSAAygYoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dma-buf: udmabuf: validate create-list count before
 copying
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samuel Moelius" <sam.moelius@trailofbits.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
In-Reply-To: <20260605154252.2125942-1-sam.moelius@trailofbits.com>
References: <20260605154252.2125942-1-sam.moelius@trailofbits.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 16:02:53 +0000
Message-Id: <20260605160253.637381F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63948-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sam.moelius@trailofbits.com,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,smtp.kernel.org:mid,trailofbits.com:email,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9CD964991C

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Integer overflow in `udmabuf_create()` leads to undersized arr=
ay allocation and a subsequent heap buffer overflow when pinning folios on =
32-bit systems.
- [High] Unprotected initialization of `ubuf->sg` in `begin_cpu_udmabuf` le=
ads to memory leaks and data races.
--

commit a036fc929a16b1c94a5ac12cbef23efece456576
Author: Samuel Moelius <sam.moelius@trailofbits.com>

dma-buf: udmabuf: validate create-list count before copying
   =20
UDMABUF_CREATE_LIST copies a variable-length list using a byte count
derived from head.count. The list_limit module parameter is signed and
writable, so setting it negative lets a large unsigned count bypass the
limit check. The u32 byte-count calculation can then wrap, causing only
a small list to be copied while udmabuf_create() still iterates over the
large count.

Reject negative list_limit values and use checked size_t multiplication
before copying the list.

> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index bced421c0d658..264718676d485 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c

[ ... ]

> @@ -469,13 +470,14 @@ static long udmabuf_ioctl_create_list(struct file *=
filp, unsigned long arg)
>  	struct udmabuf_create_list head;
>  	struct udmabuf_create_item *list;
>  	int ret =3D -EINVAL;
> -	u32 lsize;
> +	size_t lsize;
> =20
>  	if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
>  		return -EFAULT;
> -	if (head.count > list_limit)
> +	if (list_limit < 0 || head.count > list_limit)
> +		return -EINVAL;
> +	if (check_mul_overflow(sizeof(struct udmabuf_create_item), head.count, =
&lsize))
>  		return -EINVAL;
> -	lsize =3D sizeof(struct udmabuf_create_item) * head.count;
>  	list =3D memdup_user((void __user *)(arg + sizeof(head)), lsize);
>  	if (IS_ERR(list))
>  		return PTR_ERR(list);

[Severity: Critical]
This is a pre-existing issue, but can the 32-bit addition of subpgcnt wrap
pgcnt?

In udmabuf_create(), list[i].size is a user-controlled __u64 value.
On 32-bit architectures, pgoff_t is a 32-bit unsigned integer:

drivers/dma-buf/udmabuf.c:udmabuf_create() {
    ...
		subpgcnt =3D list[i].size >> PAGE_SHIFT;
		pgcnt +=3D subpgcnt;
		if (pgcnt > pglimit)
			goto err_noinit;
    ...
}

If user space provides two items=E2=80=94one small (e.g., 2 pages) and one =
huge
(e.g., size =3D 0xffffffff000ULL)=E2=80=94subpgcnt truncates to 32 bits and=
 pgcnt can
wrap around to a small positive value. This bypasses the pgcnt > pglimit
check.

init_udmabuf() then allocates arrays sized by the wrapped pgcnt:

drivers/dma-buf/udmabuf.c:init_udmabuf() {
    ...
	ubuf->pages =3D kvmalloc_objs(*ubuf->pages, pgcnt);
    ...
}

Later, udmabuf_pin_folios() calculates a local 32-bit pgcnt =3D 0xffffffff =
and
asks memfd_pin_folios() to pin up to that many folios. If memfd_pin_folios()
returns a large number of folios, udmabuf_pin_folios() unconditionally writ=
es
these kernel pointers into the undersized arrays, resulting in an out-of-bo=
unds
write:

drivers/dma-buf/udmabuf.c:udmabuf_pin_folios() {
    ...
		ubuf->pinned_folios[nr_pinned++] =3D folios[cur_folio];
    ...
			ubuf->pages[upgcnt] =3D folio_page(folios[cur_folio],
						subpgoff >> PAGE_SHIFT);
    ...
}

Could we check for overflow when accumulating pgcnt?

[Severity: High]
This isn't a bug introduced by this patch, but does begin_cpu_udmabuf() hav=
e a
race condition when allocating ubuf->sg?

drivers/dma-buf/udmabuf.c:begin_cpu_udmabuf() {
	if (!ubuf->sg) {
		ubuf->sg =3D get_sg_table(dev, buf, direction);
		if (IS_ERR(ubuf->sg)) {
			ret =3D PTR_ERR(ubuf->sg);
			ubuf->sg =3D NULL;
		} else {
			ubuf->sg_dir =3D direction;
		}
	} else {
    ...
}

The DMA_BUF_IOCTL_SYNC ioctl triggers dma_buf_begin_cpu_access(), which cal=
ls
the exporter's .begin_cpu_access hook (begin_cpu_udmabuf()) with the dma-buf
reservation lock intentionally unlocked (as documented in dma-buf.h).

If two user-space threads invoke DMA_BUF_IOCTL_SYNC concurrently on the same
file descriptor, both can observe !ubuf->sg, allocate separate SG tables, a=
nd
establish duplicate DMA mappings.

The second thread will overwrite the ubuf->sg pointer, leaking the first
allocated SG table and its DMA resources. Concurrent readers could also ope=
rate
on partially written pointers.

Is there a lock we can hold while checking and assigning ubuf->sg?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605154252.2125=
942-1-sam.moelius@trailofbits.com?part=3D1

