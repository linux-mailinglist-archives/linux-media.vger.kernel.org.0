Return-Path: <linux-media+bounces-53416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wARRMIxTn2nXaAQAu9opvQ
	(envelope-from <linux-media+bounces-53416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:54:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A47619CF71
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFDE2302B4FB
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143813EDADB;
	Wed, 25 Feb 2026 19:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wwhcy+D8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC08395D94
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772049286; cv=pass; b=KGBZZt55vlJfNt7lD/94gzbjvtwzBDe+DG7VW9uCbEHRq9z9EDRGGfm3nFVaASlTpTvK01QW4fPAYEsB7C9OAPiLB6QGDi9bGttMe8p5jtdyhkT9FEU7RcIaa7G9Pgr6C2D1H2XDR04L07q3r1iqT1BWRCteSa8d8s8WAhRP1Rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772049286; c=relaxed/simple;
	bh=5kHOrLDbHDmcLU0mU/NKuQBxgp05tP5/RxjExBXg+n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOXVEPeD+esQtz/WzxC5qU2Bt28rfVSNReiGuGR+4p564p2pMWK/f1vFeSJI4o8RhOYvNJTmMrfOo2bTr4BoEPbKMGHFLg1eqmwgFvH8OFbv1CGOdDmWpNBHfJJiZV57kdt+ltuC8iP3AcfuFhILaYIv84o/crFB6U25dvrcX/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wwhcy+D8; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48371d2f661so12515e9.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 11:54:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772049284; cv=none;
        d=google.com; s=arc-20240605;
        b=aEow4pGCuSS2aJCePMTWccPWFmdDt77cGFHQtLWIKhoPlK9i2zzKLC+qo//whAtQtP
         6i+d5UNjbH6dt5bs5P/3zqqTFBSh/rA17PQdo+Rw0p3QS5xNcO/Ug0wkR4b9ZoSPtcsZ
         yro9T/fvGhnMVCbr1IGRNmrdTJtgYMiVZtr/AfQ8YlEFcs2vVmM9eA6dFkpCPgZBRw6o
         e6Fa4wThmwmVfARo+9uBqgHQSYlzKoBwHYTw20XtL7kx259ymPNmCmKpwSooizVGLlUF
         wtyFuiRZAAmtmfKKjkjO1MkXbzIv6X5eD/UW40PigL1FceHS5xSyq68s1WD+d5jq43EP
         MNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5kHOrLDbHDmcLU0mU/NKuQBxgp05tP5/RxjExBXg+n4=;
        fh=ADI7eUNkomVQEC9C3H48QCbx9ZLlcIkyYDp/WE8yI0I=;
        b=YjuE079ybZukxCsNp+BXxCNky/J4pbZkD8nnIJ+e5KeyfXCW4kwJcpyq0g4V+spcW0
         sQZJj5JWg7cTr7H0LDWVHnBpHQ3dJIIWsalTJ1hDuLZzZNns2TJMAXr/jY1t62z0jfmt
         hI1UMruD/2w1rVpAu9EV6pL98TjE5Mgx7ALzp9cFvM88j1DhQbLYcyuwnr4XThPh/9v+
         VbrYQmvKH/AEVpIAJIkpGhenfJ2gpjgehQbHusXsiUIRrQ2DMFxLJvAxr+HqgxZ1b0GK
         T+FsRHLvy56i/lOv1KcHLx/Q2u2Exf+PoGbIQ7k1PhTZ9uMevVmYJgJ2rW4SsowW5I9a
         /Xqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772049284; x=1772654084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kHOrLDbHDmcLU0mU/NKuQBxgp05tP5/RxjExBXg+n4=;
        b=wwhcy+D8Pn0S/21xP2wj1QjDCNCwpUNlQvtevCyui9rBjeSMqk59Oy3brUhLIPZwZ5
         pjp8dqS6ocvNrpFL+sTu6MwRsBlj1un6MNZccY14uVBISVhXTMkEDeN0z3CHCAli4OVX
         BcbQJ76I+KkfHuMeaNQdz/RS6pL/APi86YpAfTkBXwqbj7u9YM+nsIIfFqzK1H60h+wK
         9AW4J+barkwrbZVT0DNg7HetztKy8Jn+SVD4fkK2yZfA8vEo9w5O3V9VceUAmr6n75lg
         T+JdVVS67yhAncFhCfAndf+XRaAGLrjBnmBQfLEU4hqsxCy0e1RX7y6G0/ycYkjEPh9y
         xeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772049284; x=1772654084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5kHOrLDbHDmcLU0mU/NKuQBxgp05tP5/RxjExBXg+n4=;
        b=NCLRQmJr9oWr3LIpmdYUjhHhCW8p0fKGEP604N7voU9jkN3Ik4vlGKq5DRucw/rCbR
         00hJIN7WSl9KoSUOry7f6MSrdiFkNKjau1z5J8CF2hepCPcGq3udll3T5LwN2lpo+Bkz
         PPdQYVdiUGVknKibrdaAOHmqtG96srr4t8uf4RDzyipslWUx9WRN74kV7umsXRz9IJGV
         0qSM2prpYNsqqaGbIIIP/kzBCZ36Egb0gC+dulpbfk2dK1bY3fTXVKiau9u3N4xRcc2B
         aMsdclSQZ3NOI0N7ZU3i90uyqdAoQW26p6a8zXhjuEyWcnRSijd7Sk3dQdOCd5udnTQD
         y0iw==
X-Forwarded-Encrypted: i=1; AJvYcCXUY3CXMJ5/5jheGEzvz9xdzl7QXo6VuvHbKNkMbowgTBs9Pd8YXwVjhyTGss9DFlNOodCyxTmMZzk6iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaxT1az2sc+aJygMPQfEVL1tW6i1Xanma5Xbd3rM9UMznxCAJO
	yshXB1SaBmpPCmUeZ+QNTDUH5K7X3antH54OmKjO0JTzUYWwVP1LbuMN+BvWH3zJy/tLbcR3m1j
	wEfJ92e9ftOpyA9lyEYhEus1oEpEHb8PpWnhVoEJg
X-Gm-Gg: ATEYQzwBBjdbajsvEaQaPZqHiqjJnWKewctMcGh2IWkIDRDtle2PL6T63DUTdhvLoIb
	VH8sBgQJHvbDK5wBgdmuQlvf/a5RsUcVojZftmvKg/Qqg1VwCWGxaeOhqXueZuPl3K20v65pB6D
	mVGwLdZFPBZsvJUhvp36IPoHj18a5U/dTJPX8uT9UJNOKuQUYsXrbpRShxgdQcXpM6VetF58qvU
	VbZMm1sMh/YqG0Zsh+7J/ZsfvQpmpMMYvR25ELsf/QjvAPLjbiXJ4o0SdrKnZ9+u/nQf55MtO3w
	4lgYL7mh7wQXNc0TRBRlyBiqZjcGo25neE1gUFjq4jPPIU33tOp5m95tYGDGBm5kcz7xEA==
X-Received: by 2002:a05:600c:a011:b0:47d:7304:d759 with SMTP id
 5b1f17b1804b1-483c31a1fbfmr90505e9.15.1772049283315; Wed, 25 Feb 2026
 11:54:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org> <20260225-dma-buf-heaps-as-modules-v1-6-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-6-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:54:31 -0800
X-Gm-Features: AaiRm51QwXByHIj_4EAMjL0iJavUr_3DqvTRveBK0_qkEAD8H59M0Ces2LdyWWw
Message-ID: <CABdmKX26Q-DXsLEMbvsYbw_JotHpGk3zFDccAJaqir4aSBdt0w@mail.gmail.com>
Subject: Re: [PATCH 6/7] dma-buf: heaps: cma: Turn the heap into a module
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53416-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A47619CF71
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Now that all the symbols used by the CMA heap are exported, turning the
> CMA heap into a module becomes pretty easy: we just need to add the
> usual MODULE_* macros, import the proper namespaces and change the
> Kconfig symbol to a tristate.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

It'd be good to add a note that heap modules can't be unloaded (unless
we add more code to verify there are no live heap allocations). With
that:

Reviewed-by: T.J. Mercier <tjmercier@google.com>

