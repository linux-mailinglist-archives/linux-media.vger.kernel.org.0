Return-Path: <linux-media+bounces-67102-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id czUiNRs5T2qjcQIAu9opvQ
	(envelope-from <linux-media+bounces-67102-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 08:00:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD5D72CF50
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 08:00:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=nHsfvq04;
	dmarc=pass (policy=none) header.from=samsung.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67102-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67102-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 980F5305A21F
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 05:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190E53AEF3A;
	Thu,  9 Jul 2026 05:58:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA09D3ACEE2
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 05:58:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576682; cv=none; b=AayXyhi54Dd9hxgEyfGV+REmaKxmxkyS/nCzyoI3ZDDZXeQfS7KxKq2K67G7fqR1+wNxNv21LyjiEA0tCNTzy8VWp6v696/dmQFIWfZNFKU3QL2fVvl31nFGnFnG3y2qLFiaeE49UVk3Ay8rEx5h0cb9eSLNx8pI+dlPN6zxdJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576682; c=relaxed/simple;
	bh=Zdgm6ypeCj85THhMqvVHmebAMp8dCbupRfxM4egHB7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:In-Reply-To:
	 Content-Type:References; b=ULlUPt6VAxHABoShzb5e/uCnGfSZ/CUypTWC5iAKFqqL/H/qAT0olIkzqe5jEg2rdovxmq+u+ryXz6m6m7T3tWnbTRMebAxpCSFJKfP+2iTtIlar8MxwBYfVVobnyuag38LL6FmEoWZ85muDQg5jYm5VWEeY6b7uNCcuvFFbHH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nHsfvq04; arc=none smtp.client-ip=210.118.77.12
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260709055759euoutp0272e83538c1a9ab28522db548296d3775~AiYo6OdTb0293002930euoutp02K
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 05:57:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260709055759euoutp0272e83538c1a9ab28522db548296d3775~AiYo6OdTb0293002930euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783576679;
	bh=3AS/MseAZNiwcFBJmOS/F4a/wQ4SpwXPmdblJclCDRo=;
	h=Date:Subject:To:From:In-Reply-To:References:From;
	b=nHsfvq04mcs9lAJV0tb0DvDsS+ZAduXZsZWLBXd5Ab/sZEMepat3GolmgrUjUvWa2
	 TcSj22Oaop91mT+UPdF300HesSlGhl0uCZmIjUIiISUlyUxOsBW4I1mK9lLVm3qIJn
	 RDLEhPOcAvOprRaM8NhXjorWVelWlGDs5FX2laSw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260709055758eucas1p184de37a1e60c04038218737c814f70e6~AiYoq3JnI0814308143eucas1p15;
	Thu,  9 Jul 2026 05:57:58 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260709055758eusmtip26d8a30a9996f75174508660d9fc97912~AiYn0yFQ63000330003eusmtip2G;
	Thu,  9 Jul 2026 05:57:58 +0000 (GMT)
Message-ID: <586acc4d-2a59-4cee-a774-70786c586893@samsung.com>
Date: Thu, 9 Jul 2026 07:57:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 4/5] media: s5p-mfc: Treat bitmap size as allocation
 failure
To: Yury Norov <ynorov@nvidia.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260709020312.133977-5-ynorov@nvidia.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260709055758eucas1p184de37a1e60c04038218737c814f70e6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260709020355eucas1p2dc8d045376aadfd3860eb0a88da2aca6
X-EPHeader: CA
X-CMS-RootMailID: 20260709020355eucas1p2dc8d045376aadfd3860eb0a88da2aca6
References: <20260709020312.133977-1-ynorov@nvidia.com>
	<CGME20260709020355eucas1p2dc8d045376aadfd3860eb0a88da2aca6@eucas1p2.samsung.com>
	<20260709020312.133977-5-ynorov@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.15 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ynorov@nvidia.com,m:andrzej.hajda@intel.com,m:mchehab@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-67102-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FD5D72CF50

On 09.07.2026 04:03, Yury Norov wrote:
> bitmap_find_next_zero_area() uses an out-of-range return value to
> indicate failure. Check for values greater than or equal to the bitmap
> size so the caller does not depend on the exact failure sentinel.
>
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c
> index 5ba791fa3676..b25ad2a37196 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c
> @@ -43,7 +43,7 @@ int s5p_mfc_alloc_priv_buf(struct s5p_mfc_dev *dev, unsigned int mem_ctx,
>  
>  	if (dev->mem_virt) {
>  		start = bitmap_find_next_zero_area(dev->mem_bitmap, bits, 0, count, align);
> -		if (start > bits)
> +		if (start >= bits)
>  			goto no_mem;
>  
>  		bitmap_set(dev->mem_bitmap, start, count);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


