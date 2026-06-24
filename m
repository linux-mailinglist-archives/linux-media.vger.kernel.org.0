Return-Path: <linux-media+bounces-65597-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pGdBLFBSPGp3mggAu9opvQ
	(envelope-from <linux-media+bounces-65597-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 23:55:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AAD6C1A06
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 23:55:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=s90tUPY+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65597-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65597-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7285E303A919
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 21:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69639296BBC;
	Wed, 24 Jun 2026 21:54:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10C827603C
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 21:54:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782338082; cv=pass; b=HNJr4mqpHAUZvOk7GH3fkat27BrXy7nsNnQhq4XLRsSfBr47jEf3redD6Qvs4Q3c7euXiA/JhVmeyZIQHJlphthN5BGgoEzkurp2LGuheS2mZQnitjaNOwo3PkMxcagiPnjNQZG2l3ExXIV8mH5dVaVl+IQ622/6jhqz8ld6fx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782338082; c=relaxed/simple;
	bh=ZTrHJ97i/HXy/80n1CkjHQVe25k8L9XANtESl/zkkyY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bSxYVsG9XvvXgbjz78zHkmtoua9vK+5FY8+/s7KFdaJIg6sV6epuZhdwNIIcLYLp6B8iFDiJ/4h979s0Aafbov/qK2nq7qrGZLtJDZtku59nBQCJ0gCZp2gaNoLS16mLk1nQhFZChQ9dPwFyuJCapH1/6WlSj3veSRmrfJ+BaMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s90tUPY+; arc=pass smtp.client-ip=209.85.128.172
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7dbcb505578so18827327b3.3
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 14:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782338081; cv=none;
        d=google.com; s=arc-20260327;
        b=CbWcRnzqlD3BD2Y0hiIpPYr4NqhGgsh1lCKjPL8Rj0GIFFoAba20aixKwATcs4wWpQ
         8xOw+lTfInLuweyQr3tjukJtIV2M4OtxpBn80hz4hiZzBRiM+FuHYPU10OmfHcswspf6
         CTAIq2SGiMDk7VfRqHJZsLLFkyoncf4CLcgiHxRAvC9hNbx0mkRzFlL46NyCSXYm6uNi
         rtQTryOd8hjCcfGSjDYUkZrk4IwQwjpgpJlKaPJUiknK6hPnbEBMsJ1+LUluJHDkWOfk
         8f3Ve2ns8g947uvjDmPOzWW89mUAoDorZdrjd1nrvifn9pDgfXQBPyEvqZ7tIn1BG/oN
         noxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Bh8+6SvsunFH7emI3915MXGw0/i4y8PizMc/TEhnjUg=;
        fh=slFF6v+dkNnWFFxr9pL1FVCMM6P0osuLOXshWvCPIno=;
        b=hEh0BHbnhfXj3pxIRoNWWx1L9ljwTFIPt+fZSyYEjb8lQced/7LrMUO3BYhb4ls4Fg
         nQBIe8y1Da+XbLQeDFh+GNmv2xeJwzEs/lgbtmR++VS+DbZjbnEOsF4W2wACeVebnkUX
         sMuw02N8IcRslsLgUeN6u8THZIRm0Ocwzyv88QXd2nF6JQ/Ll2NLmnXR5SCkExjcRva1
         53Rkb/DIJwP5CPwaGNNRIvtnC5jn6FEFME3OmoGyV3QXrKgG2xnFnIR1LToVwvWnxCgV
         swAMh5rl2BfyWmU5WjFem9dRUHPJmv+O0IjWPeQ+8YdILIHDx8L0wxL8ghLyy9rMr8gA
         5JjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782338081; x=1782942881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh8+6SvsunFH7emI3915MXGw0/i4y8PizMc/TEhnjUg=;
        b=s90tUPY+fK7BVbRx0upfs2YkFEBxbJPYvkU+vxahX6Ps6iAAgaWDv0GwXa7glpzLX+
         u9P46KhNkmAmiLIa0RFBZGdSW5xQR0erdWQ/yLhHZUS0aLcEf7hlqm6gbzwfdE+sleBd
         vZJdBpVOZ+Y3eqP+mSQUIpiMC1x8BnMmEK0WkmJoJ9V6uL7zOooHs+Rh3Mi9WBWyI+gZ
         4BOxhUB7Il2uM8EwlXwzEgOaOcu1G5Lq+hEvd3s9pCeKuJ0jSpgOdOykkjNv7mi7eFj8
         Rrsx140obOXhc1dzv6qRUcjRWw5IhqlBvJ0a3kGFLwKH1yYAjCpQ75KHAQEVvwIwoyk5
         H8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782338081; x=1782942881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh8+6SvsunFH7emI3915MXGw0/i4y8PizMc/TEhnjUg=;
        b=oUrGa3M291x+4jzWNAVhT0+f3mqcK+uEPIlU4qEw+DdW3/9PRC8J2oB0uAct1kH364
         Kb1xO2zTShYwnehyiir1as+hIsEkmi+C1wg2E6RuZ0NtQ6834mD/DRYc5+jY2szXW8bQ
         oSq6u3qcNFdFbb9ASJHopGB1qhHLH+LaGDwCCbobMk33JRQ12Ab3E9rHeahUbUM3SACF
         r8QaWU7N+7jL6EQRVfMpLayfue8TGPAxLbSyybFJ9QB8C4KM1QWOqLHuhDXYF34A0ZRq
         fnNdCGy5Y4ryb9d0Y8HwiUqJ+LS/Nkfd0tfizWxICJLVISz2/YNQhZFnXrgIzWausd+H
         k+Og==
X-Forwarded-Encrypted: i=1; AHgh+RpVdn28phQgUpwfSKpjuBxJqZJuLxPezolwzMRs5k6UPj0r+Hw5cMxJJndMeJwaRN2Oftm2GaQILQZtVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVVHUaB7G4HspvB1AWTsYzEUsmE8Ik2GjuKPW++9SV2mQt0C/0
	fTHb7k57U8s0uiZTxaQWm7G8QPely5bUjtH5tWY1bskrWeotBUIfhL0LeGVqUDMX9V6qYZqw+nF
	Z08XioFsb9dbo9hFoyyaSAfDk2e+/Zs8=
X-Gm-Gg: AfdE7cmE402k2FdYURWQlPL6l0RjEBla9GhZI6uYbQReSoz7LBpv7c6SJqFMVj4ku7j
	CIbGtZYxuc7IROAJn663ez/wIpJNXhmwlAHol1ikO/G+V2uptW3todhNLtzGpqsnqUBlwpT1WSJ
	rTY+i3kqF0Kb01m3SApsAPDVLTZjGvzgcCUPnDMGZpcJ8jhwXwexinf3IFTyLR98CbKF2MWWFWz
	DRnf5xth8mGdL8mx5b+TVC3QyWGnM5bF5xGgodM3UOeUD0TP2rjmhKyfILXG0B7MPW8+pLA
X-Received: by 2002:a05:690c:7248:b0:7bd:8ce4:92b with SMTP id
 00721157ae682-80a6a296427mr41307b3.17.1782338073547; Wed, 24 Jun 2026
 14:54:33 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 24 Jun 2026 14:54:33 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 24 Jun 2026 14:54:33 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Wed, 24 Jun 2026 14:54:33 -0700
X-Gm-Features: AVVi8Ce_wcOOGQACiJ7fmfSkprpRmGytkZE_GUVedaUXOaW1g6FuUzDMUNPcyPM
Message-ID: <CAMuQ4bUb-nH9F3S+-qCAeC1z2NVi2MuzNirJdTNbq66BtCDfQg@mail.gmail.com>
Subject: [PATCH v2] dma-buf: udmabuf: avoid list copy size overflow
To: Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65597-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linaro.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08AAD6C1A06

UDMABUF_CREATE_LIST copies an array whose element count comes from
userspace. The count is bounded by the list_limit module parameter, but
that parameter does not need negative values.

Make list_limit unsigned so its type matches the u32 count field. Also
use memdup_array_user() for the list copy so the element-count
multiplication is checked before allocation and copying.

Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
Changes in v2:
- Make list_limit unsigned as suggested by Christian.
- Keep the checked array copy and drop the local u32 byte-count temporary.

 drivers/dma-buf/udmabuf.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index bced421c0..e34a3b135 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -21,8 +21,8 @@
 #include <linux/udmabuf.h>
 #include <linux/vmalloc.h>

-static int list_limit =3D 1024;
-module_param(list_limit, int, 0644);
+static unsigned int list_limit =3D 1024;
+module_param(list_limit, uint, 0644);
 MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit.
Default is 1024.");
 static int size_limit_mb =3D 64;
 module_param(size_limit_mb, int, 0644);
@@ -471,12 +471,11 @@ static long udmabuf_ioctl_create_list(struct
file *filp, unsigned long arg)
 	struct udmabuf_create_list head;
 	struct udmabuf_create_item *list;
 	int ret =3D -EINVAL;
-	u32 lsize;

 	if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
 		return -EFAULT;
 	if (head.count > list_limit)
 		return -EINVAL;
-	lsize =3D sizeof(struct udmabuf_create_item) * head.count;
-	list =3D memdup_user((void __user *)(arg + sizeof(head)), lsize);
+	list =3D memdup_array_user((void __user *)(arg + sizeof(head)),
+				      head.count, sizeof(*list));
 	if (IS_ERR(list))
 		return PTR_ERR(list);

--=20
2.54.0

