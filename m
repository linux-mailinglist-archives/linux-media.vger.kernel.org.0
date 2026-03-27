Return-Path: <linux-media+bounces-57351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMo2IvPdxmkoPQUAu9opvQ
	(envelope-from <linux-media+bounces-57351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:43:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D16F34A53F
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CA263035339
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8BD38C428;
	Fri, 27 Mar 2026 19:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q7cSjeKh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613F5351C0F
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 19:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640622; cv=pass; b=kv6Iniro/w348bhNgiJU4ym5Buo0EA/QONw+rz+jea/jIauGEA3X56nWbi5Wl3w60P7WirzuJ6e3hRw1Kp4HVHxH42AdFt3hDtAjTq+9SHwxOTzg74ie4kmYG4ikYj7e7Yeu3uztXi/x0CFq3IL8Hi1Q4JQJ5jT+/VenBauooqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640622; c=relaxed/simple;
	bh=mAa0q11vT2K7+sL7S++M6Oz+Ma+owZM4tYL8Ai5PqnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUPTuEUWMriCjdnQl2LHJEeoLXk0Xu9PMYacNTpWiwKQ1mxGhWKfiDqhmrWTBHPEhRoUSGUyNWtJEhKnYLP2aQMk1Sf0rHGly1iyE3qnsIiwc+Y1o4R3lXpl7Z/1OKrQotnDhjhxtlkHqYMw5M1WyR5n6aPELn8m7VbkfA3PcTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q7cSjeKh; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48569636800so17385e9.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 12:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774640613; cv=none;
        d=google.com; s=arc-20240605;
        b=FhpgywMrTiDimDJzmly5oBRhi3mjw+j0pnoWBpof9q3FXMIbUlc9OUEro2FXDklCbb
         JrNntWJhfjB0p7ojXdbY9jdTk04NQFlC7E3OtRIe50J/070VvYU94+MQhhaZMik2xIZL
         aboHyvQcGJRtpIS2zp6463z0Xr3gyMk1dzCBIwQ1ild9jpc2TbjSacA5GL91tDKfX4LW
         2hlLwOg5hEbSh+u2bb9HuTU+IbdF9g7nWbfv+q7rn1ol71i3f8MQbmVAb+b3/gSxOzFf
         YdjVUR+CJeicBswK64qFCem3b2gRLiXKO70fsgvdk4nbMFvX6YBA2MbmcfpwXZktg0/h
         9PhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7tjhOfzQT3ZRSG3eV9w6+z7kzXwwNkzHiubxpA2Yl+8=;
        fh=YJg+KS5l2reww1leNAbvlJmqlv1adHYhlGbCo8S9xf4=;
        b=MVZpj2rR8NTwUENh9pfS9rzCpz0dStN5QvGP3ojjFTSUmYXG8SA34Vo6TNn8bkWhJP
         noKWWqrOOYTYcscgpw93HoVqVX0CZ+IBj6Kd4i+sbQWj7bOomxIYEa+WmnBJRfEHRvXi
         o23espxhn9ISXWfozcV7SmcwkcTpSrZitHvL2tsPQ9T4M3drEQ1h7CHVGILNWCIKl5bb
         qKRtiGJ7RnXe2ljRbvRZsbnqqxE7mceFldkuE9bLC+PCHebbLyPBhRN/0ssFkRv41dYu
         atux9RL1/txNpDyZvade0ao9pS4lzY7TYLgsoaFOJ23NA5RzHt9sPZcUMB884Y8OAtSv
         csHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774640613; x=1775245413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tjhOfzQT3ZRSG3eV9w6+z7kzXwwNkzHiubxpA2Yl+8=;
        b=Q7cSjeKhHCwuGlkZq/YCc/RlNHR+44fyHh+aTSG2RbfHZByYnLLJA90ar5/LWkNEWM
         EGBG5xORemebyD7/nsmZL5AaumS2Ug3Ib2rEyLFZ3xewOthiqfj2z4uJxsYyPijk4QZl
         sqjdeYGf1OMJ81KsK8CRh6J6Ak48MxteHloz5owaTRgwlUzWk08E0ZMNRkeoY/LtFYJ0
         gwJzUqcAQP5jZI4/BDmg4nTtT7+eMZMUef7i6Uq6ScaAG5AfDjTYEhIqy/SwgndzPlzn
         5fUuIVZ+NVgEI7tslnRQRg+pH9CznU1hvBKQMFlG0uprqWoJpXn8OXy37y7/x40HTM92
         +4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640613; x=1775245413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7tjhOfzQT3ZRSG3eV9w6+z7kzXwwNkzHiubxpA2Yl+8=;
        b=Q1/BiuYdN55ZRDcZ5p0gujupNMVdS37gUI0tRbea+kYCEpPK9Ph+9YRW4MF0SH1dp3
         3C8FeC6UZJgQcdPBN8mOWMjOHLX0cMGeZYALLjYZ4LogzMjWdn5w3Oh4N0jV3/aVWi9L
         W1q6JgJind8hBQUAPdirlE7SR9UnLCKvSAJ1ygUDX7Lg3ysWLSzMdoSQ/Ewg9F5iMYm7
         iBk3H025sRrw/TFcMDohUJchWlWTZ4Mtu6uSDV2vWB6EnkWVtbWxBEnwn2uDM8j8r+zC
         WExQUco9WFvS5L2C+okQR8BhxQb/jjxcQUoeMh3WyoPbSOkqJCN7zGNYV3Z40BCKDVM5
         bexA==
X-Forwarded-Encrypted: i=1; AJvYcCUS4A332UB5wLdbRnorHkdy9kwLsWc4Wf0MU1SLh6nmPKy3Jy17FUTPvjYHHjMPo7qc8jZSk4rlKBSK8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YySSWBv9Fj4OiMWFOQKElpb1qVkD/XkYMhUAeulhzicfqq1nWzs
	PtdE6I1kT8KUoLJuNncAlnkJjP1jV0CvfDfUXT0SBWW5nKdvngqtD8j6TAJsCzFh2XAaKPx1ipx
	P/T/NPIGi3ojxNk9ww44Hupz/TWL5xG2xrdi1hyIf
X-Gm-Gg: ATEYQzwACTUGuUJEUuqMxCzw+FetoizSNgHOt0zdVYRWkxRV2WbOZ+O2wE71ztaXxji
	YFnfEm9rKQ3gON7k6KcH8nhEvXKYWsEiW5g6YDPMFFOtCX95SjRvIHg30IBMugOXkJ8+9yF9c3L
	Su1YiQ963sudUkrJpmLodzY6vXZq4ERv0dDtoxxj8psMMKGklY9ki9GzM+yLk7YbLOhHA1GSzYB
	VlbJybZtg42mt75ARKWk+t6+Mw6dJ2cofDj+yDeUfe/rNWDe7nuuacb7EGmTP9l2wOVbMdU4uHb
	bMyLqiHGCbry2iwUkGt9UMN66td3jRXVqcNb0q3tHx2njv+uZZ8ApmJF6zy1vfBQ06Ko
X-Received: by 2002:a05:600c:898:b0:483:6a76:11a6 with SMTP id
 5b1f17b1804b1-4872fb4af58mr49025e9.5.1774640612616; Fri, 27 Mar 2026 12:43:32
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325192352.437608-1-jiri@resnulli.us> <20260325192352.437608-3-jiri@resnulli.us>
In-Reply-To: <20260325192352.437608-3-jiri@resnulli.us>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 27 Mar 2026 12:43:20 -0700
X-Gm-Features: AQROBzBYesqFRGc3W9I0GrvLQe43hwnK276StdxFy-fmLYpUjceKHOTqIZ5lfxQ
Message-ID: <CABdmKX2G-RavjPxmeTH4iiawNqN8ronj5dytYxKTYRJvtDXoFg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: system: add system_cc_shared heap
 for explicitly shared memory
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57351-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D16F34A53F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 12:23=E2=80=AFPM Jiri Pirko <jiri@resnulli.us> wrot=
e:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Add a new "system_cc_shared" dma-buf heap to allow userspace to
> allocate shared (decrypted) memory for confidential computing (CoCo)
> VMs.
>
> On CoCo VMs, guest memory is private by default. The hardware uses an
> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> Intel TDX) to control whether a given memory access is private or
> shared. The kernel's direct map is set up as private,
> so pages returned by alloc_pages() are private in the direct map
> by default. To make this memory usable for devices that do not support
> DMA to private memory (no TDISP support), it has to be explicitly
> shared. A couple of things are needed to properly handle
> shared memory for the dma-buf use case:
>
> - set_memory_decrypted() on the direct map after allocation:
>   Besides clearing the encryption bit in the direct map PTEs, this
>   also notifies the hypervisor about the page state change. On free,
>   the inverse set_memory_encrypted() must be called before returning
>   pages to the allocator. If re-encryption fails, pages
>   are intentionally leaked to prevent shared memory from being
>   reused as private.
>
> - pgprot_decrypted() for userspace and kernel virtual mappings:
>   Any new mapping of the shared pages, be it to userspace via
>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>   of the direct map. These must also have the encryption bit cleared,
>   otherwise accesses through them would see encrypted (garbage) data.
>
> - DMA_ATTR_CC_SHARED for DMA mapping:
>   Since the pages are already shared, the DMA API needs to be
>   informed via DMA_ATTR_CC_SHARED so it can map them correctly
>   as unencrypted for device access.
>
> On non-CoCo VMs, the system_cc_shared heap is not registered
> to prevent misuse by userspace that does not understand
> the security implications of explicitly shared memory.
>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

