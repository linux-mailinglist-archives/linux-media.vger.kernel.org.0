Return-Path: <linux-media+bounces-53415-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPPsHTRTn2mraAQAu9opvQ
	(envelope-from <linux-media+bounces-53415-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:53:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E60F619CF40
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51C11305093A
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C555C3DAC02;
	Wed, 25 Feb 2026 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iv9iB1W2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDE33D34AA
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772049197; cv=pass; b=J6DeiGxgX8+ynsQBREhobHyd6DtVm020H5W7iw2pCBYVSjwCjFiXfuUhnwVDXg1LuAnUZ0FeCXgH+DFViJeLRACtto8t0PkcOWWQj5UO0zw0IaOprSPw6yNaJ1HE1hsaBOGhPKpnDTJ3F4lsVgB3doXkc4N7Q4lHTS6r13s0A8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772049197; c=relaxed/simple;
	bh=hACZJJD++mSXl52TK006Yejdc4mpWUq5FI/WaqBAg/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=na1YCO+39Z/sas9ZeR/LN99RUUJdv81Prne84bTserrhp1d7Wut/dxb/6YDb9hov4jYHHJmA5mGBywZ9ba5HRDAbE6nNu7tzOa1WvCtQk8rMwpxxrXsyvKbphNY9YP1wZY9zFUcGtLANc8GjmlZ2mbK6llZeqpmqS6JSeg4oTpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iv9iB1W2; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so14255e9.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 11:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772049194; cv=none;
        d=google.com; s=arc-20240605;
        b=j7hIJgwsLzn0IaaFz/wm/yK4cBPul1UAUUU9GPUj7lfsdQbCMp8cEf05p7IxhZJKTc
         87pq+rmDntw4ARCvX8bzDQxN8BZ+HvXEZde59C886qVA0sevDRXSIW1kkLzGYcW/ovqm
         /XvSOf9VTilTqpAHjWFoZ4mGh1tfQIltHm8Q6NJNjliYDrlViZsvdh1CTdqr3M04pOMy
         +xpQe5zyjSV2Pzl4U0L5py99YbcaBTJrdMqjKKaPRl3rHqrAjqIVLJQDQvvA9tYCT1S3
         WbIJMxV3oAyk/bkvEwYYkcImVBVx+xmTkvDye7jCYqSBqDEBXpW8iOzJA7/OoDno4CEE
         YUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hACZJJD++mSXl52TK006Yejdc4mpWUq5FI/WaqBAg/g=;
        fh=1Bg+kmSs5xXWOtqZP6/tOpqEVvEwn2ZKcDHGgVNmplw=;
        b=IltJbhAHhOfO0DL/q+4K5U/4HA/qUu22hQvA2dak6ZUdTlkBNMyld+78t7KWq1Ajx5
         6RxkooyfbfSdR8g7mMSZhBn4CYyItmh+WZ9SN/mgNbBWo1i8zS/T4OJeEuJI9WGuLwBk
         3oysNbnAvuiA+jKnS7wybT98QNGsqSP2CzMG66fWr7MzXpzY7Hj6yeYExiLQdTj4okSo
         tFSHPcsw8P6b6VZpsvMz2kEa6ZGtr+iJp0DVlVF2ySLORofcyTdD2523huLwRdxZlqfY
         fEtFYYpEy6Ndu+huhg9nknTWk8Fa4PU2YutSCeBv/7NcFCixoPYy6dhtcPBhxBrAbNIh
         MHMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772049194; x=1772653994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hACZJJD++mSXl52TK006Yejdc4mpWUq5FI/WaqBAg/g=;
        b=Iv9iB1W2Svc8Xhr3JSwFhQlnWMV8qhc6cGAmEXuxDaaw8YAhIHUQHDttqkgoX3QS/n
         Wlnn7CehuUlI4GeZh0J/WtRp6w70CT2Qfg5tFQiXziCiryCebaXtY8zhNIRltGMPw4dM
         xegNJvOh6gV8YK8BWkrtgFyU8/RjjiNG9VmB57J0SKyGyTUw12Jjl/Wj/bAbqdc7Y2ck
         LnuUhYQQeUgYVeXiXPFhOZ879AeR+cwx1skCXbnCF0MOSNiBrRLnditp74XrfYO7ffCl
         Kz3wScuTONCCrap7YhWatCPsvrsuD5k9Wlkk26LC0H0R3wtzdaXKMB0jMNQe2QJN3q6k
         wncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772049194; x=1772653994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hACZJJD++mSXl52TK006Yejdc4mpWUq5FI/WaqBAg/g=;
        b=Cx8M4fV8CZevgbB5Mtv9IjZp9uvVuMQw8Vtq3D4Q7mm+p3lNp+NvR/al2a+dNzWVZG
         MD+R8HDDFFuKW85duVCVCcmYRezB4TPAQ3YYgAv43VDJxypEfJAK8gOtYQd1AHqhEF4t
         CXGfPVPJGgrcLKM01AZCNh7xHMJTZsNtdlsthQXTvjg5ZxeW16Pehxb8oRtlsP4/HDMu
         bkPzS2t9X/F3XKAS4yitAM9Jq5QKEPCBrcAw2O0PAroNvU+HtBiXVAXzH8Kb5oebMbdv
         kQUh4P7rMJ5Pv3rsskOjI1COEhJUgZMmm1vEY9zd3+vzckgEXfo12q6l2rBAMLJfoD7w
         xRXA==
X-Forwarded-Encrypted: i=1; AJvYcCXbrsca8dcuHtArv91O57S2TyzJxa5g4Pp1xsELA6MVOhHQzO85XGGXonvU+sneg1jI7nRX6W1eaUchiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOdSQ5ngcxdPexliHu6uis8wP7H1hY4Pmm55L5kNdxDTMzcvoF
	xzSZ434qqhKU/XDHaHkjQ4ahSgmf+9vDW69zoEu185GCHJMTKuAeQuKbGcj9oP03WpXBn5U17c+
	4830Id2GU2MOPyF9omFG61ANnpYXP2IWn2AdbFGQC
X-Gm-Gg: ATEYQzz+cQAPI4I48elOWRDE5+vwfOhRuxwfiDgm4dPip14jwsrSE6/tHnmrklqOHXy
	wakCApVKL7X6i4+1fZELxWc/uD/nqk4GKiGbLyGZVF1T+12GCbCPSMg16ADesJpDnSIOMIcgf4P
	H1xYJVP0Jx5qL4jfFHUnvRU3KJq8fzWtGIOr1zy/hP6+OyN4PYNsqPC60c8Hrk13b14CGjMU3FI
	N/hNCdAVxHjpXcys6gTzpWYhDKjFWosbAXC8kiM27ZZAS4cE4t7sd/mA/zsogyjnY/FOzTfcitB
	hV0beRKQKjKovvhVTTLmzoMkD+FQ2pH+W4MyOhAscyd8YizFRdzLO5tB5ov8KcTVrueYAg==
X-Received: by 2002:a05:600c:214:b0:480:683f:743d with SMTP id
 5b1f17b1804b1-483c318c6b5mr64755e9.14.1772049193912; Wed, 25 Feb 2026
 11:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org> <20260225-dma-buf-heaps-as-modules-v1-5-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-5-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:53:01 -0800
X-Gm-Features: AaiRm53o2gSjT2_weYbg6Rd6sN6ASK7REyXNCnGoEQl1VXmkJdy1tVVm-ZBs7YY
Message-ID: <CABdmKX2KfL6q2nNAkZJ3r-Pp5JPq-sj2VpQp5bU5Hct68bedwg@mail.gmail.com>
Subject: Re: [PATCH 5/7] dma-buf: heaps: Export mem_accounting parameter
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
	TAGGED_FROM(0.00)[bounces-53415-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: E60F619CF40
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The mem_accounting kernel parameter is used by heaps to know if they
> should account allocations in their respective cgroup controllers.
>
> Since we're going to allow heaps to compile as modules, we need to
> export that variable.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

