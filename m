Return-Path: <linux-media+bounces-53410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMQHLlFOn2nNZwQAu9opvQ
	(envelope-from <linux-media+bounces-53410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:32:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B68E19CBC9
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E979A303E3A0
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826823EDADB;
	Wed, 25 Feb 2026 19:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eiCWT66x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575263AE6F4
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772047948; cv=pass; b=aEpsSBBbY+5wUYYM8lrWjfTGPRV1TzgeMjqRpAHhAE2KJ00o90ISICZxWVl3WB4gYpaGmf7pFN14tuYBpff7GeDD2y1DCdWhexygV640rFLPZJUq35w94no/wN5gJbsFt46DdQDcyTJ9YD1/KrLND7ahsYMDj4xvVlj9EgA4yGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772047948; c=relaxed/simple;
	bh=jgvQ9LOkQazsPmWMTTjFvYurOXwrvdriypbs6xoQIpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IU5pTe5SXU/5groX8K8mJ0uAV7qtHoxSbP/1ONEE0HWokQDfLv7zvrcMDbcyKNa/VHt5pUp3FhWRcu6QqvxNGcVF4JfkBfh7sVaYzwff+Bpmgar1BiXUUevhLo2l71GiaRlUOWLoq853J97AZku5zZTXmdICgFMh3J8f3gz1xiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eiCWT66x; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48318d08ec2so9975e9.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 11:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772047944; cv=none;
        d=google.com; s=arc-20240605;
        b=jLPqLLiuRQ4YOmAmD7apx/2qXKLZ1rnnkfrZPrqVg/4SkPDyhFPUcOlJ2ZjTqYURqj
         N08p7/zFVTu/KklD0Fh1LMuQj/z6mdO2VuKL6ys+mKxyaDYW5zHoEhvQLQ630eK2yCV7
         CVlLmCh8Xy7sFx8DZ0C8/SR9UHCa6D/2g/gj7pOrC0WMIlhgXSbS+vxpZczt+24SUdER
         o6SYjhqlbKSR7Bucgdd6X/SPgeMQA3QuIvLtN6iapAJ4hk1/z7Q6kxAWj2vmEn0sdaup
         2ZT7wG22ueMImQjGoIihEdzx7Sr5OpjBfdTXYDZgre7yTkKPPRzVSnuBy5ZF9vlS5NWd
         C7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jgvQ9LOkQazsPmWMTTjFvYurOXwrvdriypbs6xoQIpY=;
        fh=e++vVq8bMg2ul2XBAr3v84fo2zHorRWw2bGYYLMIBLA=;
        b=Ubvx4LAM6G2XmDWy+J6uIICtOf024CxpflB+hECSPS+WDwF1Qvr2GPKhvCTy7t8A+N
         NLgfRACkaRbNGmOSHCVKmuBAUZYaQqIZsagpfMZM2Eko0QQJbTj6N8ZI92zUhc1rIUkw
         O8VJAzd7WNXdZMS12K2D6PEp/d0sAI8IFcYEeyMb0++QhnuW+DyFgIxaJ+dnSRP1TLrT
         bJge58lH+vxafLOp+3o+lxS3D+WCsD6E6rMhz7TvAspvB7xWQ7GlA1fZLfY8Gwrdb54w
         D2fY4Gkv7yfCWufhYi3YjpFELaLfhKAnXtn2yO8lSf914lOxoDOmNtGFF65gD1pDaGYr
         38gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772047944; x=1772652744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgvQ9LOkQazsPmWMTTjFvYurOXwrvdriypbs6xoQIpY=;
        b=eiCWT66xam/dbbgWgd/SPvlFmdaOV2ScWFQ4ag6ILAPXyS/iBojQDnn4iB6SlcOTxq
         NpY9VcJaUjSKUGytGv1Iql08EsKixYcqd7urqc77PNc3ipRDgyfWSlzB3Mr2s8CCEO3N
         OfVzPFF2crveFBUbi1E+df08l33hG9h7dlZ3bjqvk9CRyfzTPSjre8pCssESAVhLFCYP
         xJ4Vlvck/4lqS6jcCSJakDmZEasogCvggq87JoQ/lAIwFeYtY1ZoENv4ZnN3vblWGBQv
         KTwGqIOU5/yHCno4IyxuK8X874SDZoci6WhRg8A8kEz37i/06R6FJ5ewN87iakpAIUsf
         btXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772047944; x=1772652744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jgvQ9LOkQazsPmWMTTjFvYurOXwrvdriypbs6xoQIpY=;
        b=tu79Wbu24rDLayAj2KrICrBaqTRhdYu32XoHwrfk3xgrWXC3QX+vj0jDZ3sPSX181W
         LR+gNdoUXCOQ/J1B0BU/aSviLYQoCZpdHcsS1feAl58EucmoeuhVellD10bBA4tkAFGg
         H2XyTZcMuQPPAzGOmplVZdFiyOi6zxEuLQBXT+4xKH/Zyfqbok405oKh0++N+jLD2v3S
         RRtyk/eUakQMV7LndZ0Rd1HQ2rLy+QjKzbPNzlKffAXPJ7ryct+D9di5YzGQozBPzYyV
         HsqkJ4BKIxLQFYgCXFFjXmhzNcC9/ouxPbob95nRHOoupKRHURHrWMQt9wXle0vACL3Z
         cHHg==
X-Forwarded-Encrypted: i=1; AJvYcCVWWX1HetetBH1I056glX3Z+tdzJLq9MbeCbQtgstu8NPAnuhysAhb3dNqrWL2b+Kr3mqV5T4IWyeSYWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvYhbKlnj74OCB2eAduqXjmI+EUkMBeIGu3/ygdm/gjbJ2asfy
	Vh55rlaA9qATAwx8h63e+YieWR1bxn4/KicvFXfDYsh8pqe8wsAzFHplOEaFikcXMJwDszaOZ08
	eAxJNXtdgQnRXaevns84PfW0aBuTF9aV5+rf4G9SV
X-Gm-Gg: ATEYQzy5pHibLwj45Apdh5/TWYwUMP6LVW4RnmG3cKgsmV8FUTXbQf2stKB5u43x0nx
	2Rf5iFAolhdAhJUSFwXvygs+ZwT7xNt/xrQxfJ8O2V9Yo979HldJL4cf+hDQgQkHNGyUvqd+b8i
	uB5Z/wmpN0INZ++sjG9ZJToxwHEdjSRbDQfR+3/+PXDVpfdzcCIYNaPmNhJFz6JciiVk3nxKJOk
	Vog5A19DFH2rlkeNeU6EDJIS+pY5cr9KMKRlwROVF/7FbZt541RvvfSE5bfGwYXcEkbkNp73Mtu
	Z89n4eY75vKKsf1w9TW9QQ+QwUo7jhZBhkccnnjyVw6ewSfKLuW9vhYR0XJSSv9Kd3HiCQ==
X-Received: by 2002:a05:600c:628e:b0:480:274f:843d with SMTP id
 5b1f17b1804b1-483c31b00d9mr64725e9.16.1772047943193; Wed, 25 Feb 2026
 11:32:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org> <20260225-dma-buf-heaps-as-modules-v1-1-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-1-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:32:11 -0800
X-Gm-Features: AaiRm50SiWoOS9CfY38Fs_M7N-g3DOx_BZCYfNv6nN_YOmBm3wEPmTfvWS_ulms
Message-ID: <CABdmKX2_+zh9jg+Wc9iS-YndB1KefC6+fQZ5G7f1LyyCtuP67g@mail.gmail.com>
Subject: Re: [PATCH 1/7] dma: contiguous: Turn heap registration logic around
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53410-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7B68E19CBC9
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The CMA heap instantiation was initially developed by having the
> contiguous DMA code call into the CMA heap to create a new instance
> every time a reserved memory area is probed.
>
> Turning the CMA heap into a module would create a dependency of the
> kernel on a module, which doesn't work.
>
> Let's turn the logic around and do the opposite: store all the reserved
> memory CMA regions into the contiguous DMA code, and provide an iterator
> for the heap to use when it probes.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

Thanks! I disabled this registration in the Android kernels where we
build all dmabuf heaps as modules instead of built-in, so I can undo
that if this is merged.

