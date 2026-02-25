Return-Path: <linux-media+bounces-53412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBMLL+5On2n+ZwQAu9opvQ
	(envelope-from <linux-media+bounces-53412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:35:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 759BE19CC10
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E04F303A3C7
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E223EF0BB;
	Wed, 25 Feb 2026 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ykmU2B6n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891643EDADB
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772048098; cv=pass; b=O3SOpkTkmlQtB6VkHHV/dJ0n5uPbl1VMO5aYqeoViPEmKCJ9FNYKZBNMCFP63xO1f4em601hJ+ksrvBuinIRIHKvK0ffmmjhod6Jc8/m0YwpVpuw9um5yvrk6IkrLW+x1NqUVfiLIhRLCBppEeF3eKXti6J4wDW3fjm4yDV9XMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772048098; c=relaxed/simple;
	bh=JcGfZZLTy1EfxpUAiB3PslYr4DWldds2kTYxvCknlIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLwZNspZlvtHc4ob2LpL1PGdRM3Yu3FabV/mNcqLYqDsNJat9yrbd8BzfVTn+ZBLkM2N6xZ0oGQn/U3G8xrCth5Vq+eXulSRHu5CrXNM6ZDKBkfEKFSoAGGGGx6YXkaxLXZkD5ZA6kP9xSzr4ZNb5XTm2IBYP9wWGH2mZha9K/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ykmU2B6n; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so14365e9.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 11:34:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772048096; cv=none;
        d=google.com; s=arc-20240605;
        b=FkxhGdcJCJXVWVRypaaZ8uc9ntPb2BJxUeNzAYjgi3EeOcQFvoDW7CQ2qHjsPK+S9a
         paHK1ZBoCuff8RIbxWorzGZsm4LhfosIxmty/jwWYD/5dr8wCVUu1ODw6UY3QdAC+vo3
         JamljdEt5OChm1LBND52RKY9xLMBMjV4abRcHmU+bqwlz8qKluqpHBndPvda+R3TyHZm
         0h3qmDQUVW1GDRur7HVTK5V4wUnEaurYHAInaom8RxUJgm7kTY/1BekUyOhkqnWBUB+o
         7k5uGMfBFRC2su76UmFoe0NTQvzgfVhsusSZHxgRIAWVj5IdOVuJ+8Yk9azxDo471r+O
         XWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JcGfZZLTy1EfxpUAiB3PslYr4DWldds2kTYxvCknlIw=;
        fh=gsO1UWf8TU6FAvXwdx5Nn87q+dkl42OEaFBWqQgmcKc=;
        b=bn1zYkTNexqbkv28vA9n1LqWHUb1b5WiU44fuVNqqoRx4dXSXkStUtPhhlV9oQC7LQ
         SkmF9WtCSCewX4xxcMHt1sSsqZv8P82eO9f+dm6ilCZV0qUexny7fLXm1nK8tNJ4Hhpw
         CP4c6oT12onVxvSd5TxtoB1TGQXcC7XKPd56C+oNWZtgdOKqy044CSRzhiQM6R2rN0fO
         tGQnsdXks4l+Yk9L2VyT8faMkW3hJg/YYGD6MGCqnpxou9tS8FwD1mDsbUCZkxvKNjhu
         k6hM9dQIZrBC89YSWbIROHm6I83QAUYLu9mOF6XmwdUnpBtLyPSrzT0i6k+HmHkv2E3g
         G7KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772048096; x=1772652896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcGfZZLTy1EfxpUAiB3PslYr4DWldds2kTYxvCknlIw=;
        b=ykmU2B6nbxVRtSHiRakR60iknARqH2wn5JcqglHjo0pVuuzAWrXE9PCgjrwBSNFGYX
         IBaBeUIdOpSnpgICdYLjKg2AlUXugT/tQvUzClwIsbaEJf/0hte21JOKqaGT7G1qOnYk
         cVgMzYdDyDNcGjQ6Hxcbu/mXImNkIxNo4NmkgRje5E566WChnMgHFiFB/ZAN1ONBGNA3
         xUrcM5p1vkhaQhKElcuehQN5CkUWFyfnfGTQa/zjz2vhksnrXM8BqOPMzov/nNwpO1M6
         QnNYKASDgEsCh+lIIJxJvEFUie/J8GdyQGiS2EF77h6Zx7myBTVzshV5EEN1oRuyXvqR
         ozQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772048096; x=1772652896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JcGfZZLTy1EfxpUAiB3PslYr4DWldds2kTYxvCknlIw=;
        b=SjJNAIR7O57UpK508p4Hgi5qVq17mmtovQEsQCSu4mtDMynO5P6MSnAsK0F3F2lPzw
         j/L+q4N3sV10YWbHM9grJFw12WVoZkVyYd+JFFMePiylLVCXmRZhuMAKtsrKcK/6zhJF
         KBLy+tr7Le0pGQNfRRf1T498D81wMD3+o+ReM4ZlbDPBvaxptn2P/WVUPWTWCa5aXWcq
         T65LQdR5p65d8jtzC+RqmEpGxTrBZ3bCbeN9ARBgf6EcnSRDeO77vWs9B9eKXKa6rETS
         RnwAD1K7QgEYK4XB2DZ0WmycpbbeJw4U8GEO7LUri9X8HTj1Bvpg/RUyuntPNT1u5lgm
         rY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7+I7im8AiJ3t8IN+QSBq1G+Avd/x11YChwIzDaSszK64PGACaA2RgzpcPSuyKiRPurH/fmG83SOGXdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxmSJkjO2rbaExkFBv/xc0tuk9ucduqGWKDbtJ9sxiBFCJ/dPD
	2ckQOVq+PNtv9z7u+GM0sWHOjEidYA4NaLLSUNXVS3Bj1VUC3kLit687IkuplTJ39uFwccocdFm
	quOw9GT1on4Flru56JIV/IXNz6AZFL8EURkCmZQcs
X-Gm-Gg: ATEYQzyUH3a6soB28X3MHkm1qvZUMYKQMIZbRQXKu4sJ1nWKZ3/WAn2nrX7zDKSSMtU
	qAPQqYK09Zbtv5jnIL6ZX6mH72LRh/5t7R4hxJQuH24qPjP1qioTadpp5KbHbNCG7mmVun14WGb
	FaFz0Y8Nw0DilWr7qPkST7CvTn+SMmXqKWhCZ7FL3C7vnhi3f3nFuF8I9iuqJHV8FkfmKy0Xoo5
	n+/r1rlMxlzwMbVxlxvQRXGihi0YsrZKUnPaEPy9pYeeA89kb4yeDxpWe394nklbdR4Ig/u6XJD
	acFd3MLgecF5fNgSmeMdDonqLoKEFoPbNjMdBRbP6rb2zPVq7vxsF4atwLlEU7Nuxb2PcQ==
X-Received: by 2002:a05:600c:628e:b0:480:274f:843d with SMTP id
 5b1f17b1804b1-483c31b00d9mr66475e9.16.1772048095548; Wed, 25 Feb 2026
 11:34:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org> <20260225-dma-buf-heaps-as-modules-v1-3-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-3-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:34:43 -0800
X-Gm-Features: AaiRm50gu1dpca-LBzWZRd4gNx9rYHRkdAZSms4Y4Ytlet4IdIIADCtT7UW67vY
Message-ID: <CABdmKX0hGSSbRFwni+Mzq9KbpxwCHzAFPc70RZVv1GmFW92fzg@mail.gmail.com>
Subject: Re: [PATCH 3/7] mm: cma: Export cma_get_name
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53412-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 759BE19CC10
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The CMA dma-buf heap uses the cma_get_name() function to get the name of
> the heap instance it's going to create.
>
> However, this function is not exported. Since we want to turn the CMA
> heap into a module, let's export it.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

