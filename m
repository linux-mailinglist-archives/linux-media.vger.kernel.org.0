Return-Path: <linux-media+bounces-56480-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG+DMN/+vGn15AIAu9opvQ
	(envelope-from <linux-media+bounces-56480-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:01:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 257F02D6EBE
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30C103091781
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E76D364E86;
	Fri, 20 Mar 2026 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Pscm422y"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFBB3644C9
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773993604; cv=none; b=JgaDLXcfkP6gQrbEtVBH1uDSHJKYSjtI/x5awgwzdTghFhl9XwJrDryLhHkrf5AKQXLzFaz2SsCBzvVQ7S+HI74QrOwdR/csKmUrmFFEuCis8AEkBZjffnpEu0mxbu39yjwJ1EP3p/vqQ70cW/GNfDjdkX7d/mM5PutJOcDesPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773993604; c=relaxed/simple;
	bh=HPpGwfuFzXf1sMOcck8YSRZm2+TSPrhGY9dG07VqcUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=oCd6Eg+fLB4EMZ2os+/1X5PPwo4whPXeJhA9pCjGsRJ3RVGVGC0oFgo9DWvlNe3GElCVMp+pEkazzJCeXxZ2GtNoGrSITj09CtpAYf7fcyYr1E4qLgCrw2n49833KiMtfOYdojoH//7GBlyxEtB3kH7MG+ez2MplxJ4hGX3HMAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Pscm422y; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260320075952euoutp01b4b121403ee2b64d27192cdbb78ee9a3~efcXl6AFz1401214012euoutp01Q
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 07:59:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260320075952euoutp01b4b121403ee2b64d27192cdbb78ee9a3~efcXl6AFz1401214012euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773993592;
	bh=bagVJH+MEvrpzI0KecUI8aBmeZE84fBwnnlwBT7sG9I=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Pscm422ye0MT5g/mYXfjxJpczYYq2KnO0AAsBJmHHmY1m/gKGzuOFbOCBF/6afiIF
	 edTrwG2OKaoas2e2mR7aXNz6fmNxb/3doFWD3qa/iHu2btNIrNlShTBsySYrAcD3/e
	 edu6osNO8TfDYxaYUhMMiUfByRPOF9uC8nAGP9xk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260320075951eucas1p2ee4f774eec93464aa99acb3509bfd4a7~efcXOCUOP0250502505eucas1p26;
	Fri, 20 Mar 2026 07:59:51 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260320075950eusmtip1136c02642e2399f808c9bfd2329dbaf5~efcWgSL8Q0430404304eusmtip1f;
	Fri, 20 Mar 2026 07:59:50 +0000 (GMT)
Message-ID: <7b2a7e76-9025-41b8-8136-7af867d8146d@samsung.com>
Date: Fri, 20 Mar 2026 08:59:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [RFC PATCH] media: vb2: use ssize_t for vb2_read/vb2_write
To: Zile Xiong <xiongzile99@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil
	<hverkuil@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260320065445.75351-1-xiongzile99@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260320075951eucas1p2ee4f774eec93464aa99acb3509bfd4a7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260320065508eucas1p10be4e6428076c2f2d396eb4474d64935
X-EPHeader: CA
X-CMS-RootMailID: 20260320065508eucas1p10be4e6428076c2f2d396eb4474d64935
References: <CGME20260320065508eucas1p10be4e6428076c2f2d396eb4474d64935@eucas1p1.samsung.com>
	<20260320065445.75351-1-xiongzile99@gmail.com>
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56480-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.958];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 257F02D6EBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.03.2026 07:54, Zile Xiong wrote:
> vb2_read() and vb2_write() return size_t, but propagate
> negative errno values from __vb2_perform_fileio().
>
> This relies on implicit signed/unsigned conversions in callers
> (e.g. vb2_fop_read()) to recover error codes:
>
>      __vb2_perform_fileio() -> -EINVAL
>      vb2_read()             -> (size_t)-EINVAL
>      vb2_fop_read()         -> -EINVAL
>
> This relies on implicit conversions that are not obvious.
>
> These helpers are exported (EXPORT_SYMBOL_GPL) and part of the
> vb2 API, so changing their return type may affect existing users.
>
> However, they conceptually follow read/write semantics, where
> ssize_t is typically used to return either a byte count or a
> negative error code.
>
> Switch vb2_read() and vb2_write() to ssize_t, and update
> __vb2_perform_fileio() accordingly.
>
> This is an RFC to gather feedback.
>
> Signed-off-by: Zile Xiong <xiongzile99@gmail.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

vb2_fop_read() and vb2_fop_write() return ssize_t type, so the same 
should be used for vb2_read() and vb2_write(), as well as 
__vb2_perform_fileio(). This issue was there from the beginning of this 
code, so it would make sense to add:

Fixes: b25748fe6126 ("[media] v4l: videobuf2: add read() and write() 
emulator")

> ---
>   drivers/media/common/videobuf2/videobuf2-core.c | 6 +++---
>   include/media/videobuf2-core.h                  | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index adf668b213c2..8a2b8156e9da 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2990,7 +2990,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
>    * @nonblock:	mode selector (1 means blocking calls, 0 means nonblocking)
>    * @read:	access mode selector (1 means read, 0 means write)
>    */
> -static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_t count,
> +static ssize_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_t count,
>   		loff_t *ppos, int nonblock, int read)
>   {
>   	struct vb2_fileio_data *fileio;
> @@ -3154,14 +3154,14 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
>   	return ret;
>   }
>   
> -size_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
> +ssize_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
>   		loff_t *ppos, int nonblocking)
>   {
>   	return __vb2_perform_fileio(q, data, count, ppos, nonblocking, 1);
>   }
>   EXPORT_SYMBOL_GPL(vb2_read);
>   
> -size_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
> +ssize_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
>   		loff_t *ppos, int nonblocking)
>   {
>   	return __vb2_perform_fileio(q, (char __user *) data, count,
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 4424d481d7f7..bf20bcb1d366 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -1093,7 +1093,7 @@ __poll_t vb2_core_poll(struct vb2_queue *q, struct file *file,
>    * @ppos:	file handle position tracking pointer
>    * @nonblock:	mode selector (1 means blocking calls, 0 means nonblocking)
>    */
> -size_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
> +ssize_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
>   		loff_t *ppos, int nonblock);
>   /**
>    * vb2_write() - implements write() syscall logic.
> @@ -1103,7 +1103,7 @@ size_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
>    * @ppos:	file handle position tracking pointer
>    * @nonblock:	mode selector (1 means blocking calls, 0 means nonblocking)
>    */
> -size_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
> +ssize_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
>   		loff_t *ppos, int nonblock);
>   
>   /**

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


