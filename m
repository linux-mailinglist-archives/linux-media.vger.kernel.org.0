Return-Path: <linux-media+bounces-56872-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBUBKsCBwmlneQQAu9opvQ
	(envelope-from <linux-media+bounces-56872-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:21:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 188EE308159
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2F6531530C3
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5A73F6601;
	Tue, 24 Mar 2026 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ceMNUD5O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AAB3F0AA3
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354493; cv=pass; b=A9sOeQ1UP03EeWGO4taqDlN/JEEV1f3vhMu/P2DI2cz+RjRY0iPz1fQU4vnUtl5WKXNZwcige4YxzIyGwWfva/YDAsuzZQEVveBYrgW9II/9y3cZI/VLXD6On1wUzbvgSULeJUpQ7sTjsN/KiaV+Yh8oLPfM472uwPuKbhxJi0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354493; c=relaxed/simple;
	bh=Bt0GjCbdHErDh2NSInWIxmaigd4B1HrIivlH1Nponi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZD1wL0VGZvp36sE1eQtRiKGQaIwAkJWXEpBzkRcm4lX49MySw0jXmoC+tVsb6LFfSfivOkX5nEApvO1jBzR2RmrbNf47EBZMli2K1DTxl+USsJnbsN1rbFC7Lk6QRKNTqT9DYA0UoYKVVVlQMLSO524JIF5Q/Yg8yC1nfDbQp9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ceMNUD5O; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50b6c45781aso664701cf.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:14:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774354488; cv=none;
        d=google.com; s=arc-20240605;
        b=N1bTdAjioEJyGMrY9aHyv5McpLYXkRkCTMjrgpgkwknYZgSshuRkUXsknJ1bI7hUrw
         JAcBO4sR36Ireom4dNGbySmq7JCna+PC1bmITE3nEcVd5FaEtStrZqiyiUHeeDPzUe9f
         VNftmIGRJkT3B4Pw8BVIltMBHZ/Hi14KKA8x+5IyW+7wYKeYqhsqkkGw8tOv9ibsLkRE
         iK8QpJB8ATVrlBgdAQyiIqzmVaYLhaiTOuDICPX+lkHF7cLpibDoR8J9XL7d7JpO20D1
         jfV1nN6EAYV9a700aLKt+1j2Aqibcw9TM+l5+J/DN3s5vfj6rzy6usUc8PYCWM1g/Kvl
         7gIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=38JEbVN9/czZUHowiTyQJJi+NFgr4A1LQF8NnXOZQbo=;
        fh=GYqY5QDtKIsI+qgFdnaU/ZPjNnePX0zQ2TwglK++5ec=;
        b=SuwvK/Yj5vsaUR+QFsQ1qk4EiVjwlV/LqwRvDRH/HzN2BjjNT+7A4jehjnM5+EAagy
         brdmV3m4MIpjgtMfgwY+jxiYrsh5TR8dl88LPhSMGeoYpVcASBkx8ztHoHSBLIgnAga+
         6znYnPZZHQLubZGkJdhPlgGwkadolrZSL/R6KjuaeugV1xalJWMnSkG/4S5yhmAJJfsN
         xnrSZ75zM1KXQ/2xpvX+z3I5m0kfNSa34aHnDjr5hwm/owWcxIcGMNN7mrPF0v6d2VjW
         vHe/dwNnfoCLL5Ax+JOFup8M/bvr8QwVxDJeh/el79mnT5WFx+5EDBmQ8SxIJhFe/b08
         Ru1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774354488; x=1774959288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38JEbVN9/czZUHowiTyQJJi+NFgr4A1LQF8NnXOZQbo=;
        b=ceMNUD5OjQ7M2cFFx6Rn4n5MR6uVrPw50TUEylfvHmyXgnep3voCCTeFMU/3V8LkOC
         fTHxwrvq4kwhdT5CuUV0ho+/IvQJ4NFxrMzx6WrW+vvBd0yQ39gq/KgoAauVgNnVwYB/
         ppuJAZQqHX7JVkoJwErvS2/GaC+ovUGQK2Zs+5tM7Iy2pHCCiZHh1uCb8wYgjQECPoUR
         YHNhyzp6+sGl95TZWQFRJRSs0HCS64Mar5CRAotydOjKSMjRj9b73qoYX0fPktkv6U2a
         ezkkiFcfgp+bPLgQYa0pjzGfu5KPC/jtqyom7toGWEShyu3TV4+Ctk0HSBes/tfYmzsd
         4WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354488; x=1774959288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=38JEbVN9/czZUHowiTyQJJi+NFgr4A1LQF8NnXOZQbo=;
        b=MmB98h3k19kYhTlyHCtdWCsOJHhhoihZ0/+S2EWbq6q6rArkDs/vKMqIJRi6kH9FKy
         GwXLt2CxauNUbqx+JZ3O2WmJh8H3cFS4UW2t9EN4wu/DzBS+4AoZf3zweTgKsvksobuM
         gYxeXbX0MVLFZB0ptwyaSbJ+FtaJG6B0OqOmahRnysm+uul3Pa77EDPpnno6zKQCz2w0
         8cM64DPD6Re/e2OhVSbFJY+myek13RQ032ersDeYYVsDUZZH0KMW88XuKUwm7cVz3uiB
         5MO3QCZwzlVDkn5dWv6rY6sNHUcppowFCq5sfMFe0oInPlG1dr/cuReeDUA3injHLrZd
         Ns5g==
X-Forwarded-Encrypted: i=1; AJvYcCX4ACW0wuTSkBtyWcBTLOixXNNvd41G2jzfQ400Uu9kJ6BG+/agd0aazGsvcQ8oA4DlKt0flv7Uypv0EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy8T1nFpQVbmZQGNQm6R+rEsEUiuWguK28vY0824fQClhXq6Fd
	WGkWzhre9LdQhT0mmAbAEObfLTgZRdYa41uIUU9RbEUPlr4I789An/wmYucFVqmCL+GtZfkP9Oi
	5mQJprFE2bSHvF6VU9ur33Y2C1opszyJdjHkHs4px
X-Gm-Gg: ATEYQzwjEP5rllvdf5hKR9zYIZuKRa5T0XyIPkNuyJcf6f7hLlJ59vzOSgbQPYPXNDt
	t8pNJ0Eq8QilkVefmhkUJnUyv803N6XIsOkEtRDRa+q84y8JPEIxEJ522pgNSLwmDpXR2Qali+0
	Hg1WYCZI1ve7uSOUesOuezzEo+OWSQZpwT6E04DrvHTUtGM1izyyVq9R9qIXBwUG6ZVv5XcvIXx
	ma7jPZcXVOmCmTD8EUdLxRoZLre66qw4Ustw0BdKocsa3D04eApyG38a2kVII5rICnmI3rykHqm
	mvq4Z1PMRUep99hQJyKzN6vTuyr4odhENQyaE6W/
X-Received: by 2002:a05:622a:514e:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-50b6fbd1411mr15608601cf.8.1774354488033; Tue, 24 Mar 2026
 05:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305123641.164164-1-jiri@resnulli.us> <ablV_f_l7wD2m63E@google.com>
 <20260324120057.GC8437@ziepe.ca>
In-Reply-To: <20260324120057.GC8437@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 24 Mar 2026 12:14:36 +0000
X-Gm-Features: AQROBzDTh0ODj4C3lU1UM-hZHPuBDyd64_bmAvFt0-7PB-OKq8PhbYOrLNqJZ2s
Message-ID: <CAFgf54qoFhvVR2yfROGaTJmLcjuLACswVFv=trqgJwGb_DB3zA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev, 
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org, 
	suzuki.poulose@arm.com, steven.price@arm.com, thomas.lendacky@amd.com, 
	john.allen@amd.com, ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56872-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smostafa@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 188EE308159
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 12:01=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Tue, Mar 17, 2026 at 01:24:13PM +0000, Mostafa Saleh wrote:
>
> > On the other hand, for restricted-dma, the memory decryption is deep
> > in the DMA direct memory allocation and the DMA API callers (for ex
> > virtio drivers) are clueless about it and can=E2=80=99t pass any attrs.
> > My proposal was specific to restricted-dma and won=E2=80=99t work for y=
our case.
>
> How is this any different from CC?
>
> If the device cannot dma to "encrypted" memory, whatever that means
> for you, then the DMA API:
>  - Makes dma alloc coherent return "decrypted" memory, and the built
>    in mapping of coherent memory knows about this
>  - Makes dma_map_xxx use SWIOTLB to bounce to decrypted memory
>
> There is no need for something like virtio drivers to be aware of
> any of this.
>
> On the other hand if the driver deliberately allocates decrypted
> memory without using DMA API alloc coherent then it knows it did it
> and can pass the flag to map it.
>

The problem is that the DMA API currently gets confused by this; it
can end up double decrypting the memory or using the wrong functions
as mentioned in [1]
In addition to the complexity it adds to the already complicated DMA
code. I don't have a strong opinion on how to solve this, but I
believe we need clear boundaries (and wrappers) for cases where memory
encryption is expected as it is starting to spill into the kernel.

[1] https://lore.kernel.org/all/20260305170335.963568-1-smostafa@google.com=
/

Thanks,
Mostafa


> > I am wondering if the kernel should have a more solid, unified method
> > for identifying already-decrypted memory instead. Perhaps we need a
> > way for the DMA API to natively recognize the encryption state of a
> > physical page (working alongside force_dma_unencrypted(dev)), rather
> > than relying on caller-provided attributes?
>
> Definately not, we do not want the DMA API inspecting things like
> this.
>
> Jason

