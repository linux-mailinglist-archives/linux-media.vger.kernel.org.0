Return-Path: <linux-media+bounces-50928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C7144D38962
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 23:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF47530213C1
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 22:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FDB314D03;
	Fri, 16 Jan 2026 22:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xl72k2fq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB18314B84
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 22:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768603028; cv=pass; b=Jj3qnJNacTuM0QI7XeOE9frgm3WyokhCGnsYhQwGbOT0N1tsGfZDk2Xu74IBhcsuycTcoFcPl2t+nSEjKrMhOvQQ1OunArXjtVC2JfCsZ9sg4tspa0PPT037XpSZwlTr7qMQYUT0mzBQIxwwKfg/pnUjYk3B4IzflLiMHK0xBgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768603028; c=relaxed/simple;
	bh=nPj7qs12piP/bjZVzPpDAGGP7hNz3JwnoCUD9QPt/xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=phd+n6Xo6zgmTIZYuppvLGERcqmEWdd6lpxTpJnq7lsc+U7YUXmQZRGyMFmWkPnPRLj5NC3VQADC95uPhV/WxXa6h4ybq+zgXzj9D6rmopAhzrNDdlHl0SssYoYKiZFzJCmd4zXT32XVtIsSi3C2KyzFMch+x/JdcIDznWVQjsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xl72k2fq; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee730612dso19095e9.0
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 14:37:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768603026; cv=none;
        d=google.com; s=arc-20240605;
        b=iNqRbPCvSzOCCtVmPv9aEwUYTiMIySTt5zWV7XA4UDnxvf+hfVUc3mUILuHipoqPrB
         d1kiPpYm4KIvH9PD7FqNLXFOAp6PxjaTydzYLisbycSLnzi8U9/0ZIItEnm8ECkFSLHr
         /WqzNJzFAXr07gJK+r1CA7BDvrnHIO0alu07MMJjjySwtUfpCQqEln0J7Lc/NBMUK0Dj
         aZbX4IInalFnBy9uha40yZXdFA7toceKy0MOUHJXpRG2NE4fYA//teesCSOQAhZygq1q
         1upgX/topdo1ETM0sv9bJ09XP05wPpD+ZLxNYwzODOdLKbgUrQMbf2ijqT5EaadTZVH2
         Q/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nPj7qs12piP/bjZVzPpDAGGP7hNz3JwnoCUD9QPt/xg=;
        fh=CgTwQCEUTCaPTk5lMa4PHN+9w4vuYDfnaQ9kRNYmEfg=;
        b=DaOgX0/+TsO4zy3VwtaxFv/R4i+JSVq6057PCjbas6tcPhb8D+obW2n1O0NL+hseGW
         F+pPNYosZPW7i0EOnMeQqvMu3vX4HWcuH2qxcssxO/8CduI0oVOSVUsvD9ZI1juG2WLB
         2cHgmqV5i303m5xpAdfOKG7lmsLKzqOjKjTZpVyreTy3abNudKsQ1JWVTYsIymxsZ7NV
         +6rAh08BJohaDJSNbw9DPtFVRP5XpCx+HQVsvhfXB4GdBda6KWXsaXvWceES70/LsjZd
         /8IiOsgrnQbEoFm4HQCxkEY0CKTBZd/RVrMXCf8qO2BD9gyGQp5mAea0X8bR0ri8Q3Nd
         H4TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768603026; x=1769207826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPj7qs12piP/bjZVzPpDAGGP7hNz3JwnoCUD9QPt/xg=;
        b=xl72k2fqYHjiS6W1Bp8wz7gdD1XQVrRR66r4/t9pttzsGBiFRv9bo8pUlclCm+u/Ir
         +YKA7yvqZ7tRsbi4zpl4VJaAx07zWoul0PSqoo/q0uUFEkb/hgrkibLkAacv4Y5nigGm
         JbaIMVS9DVP1Fl18Hu4u7VnQj/5Flz/t0KYFFmz+1HChpj5QJrwo2n5lV7YGZb0FwOFS
         yuCKZrDbUZ01uRoYUTg0teVeXM8uzOAyfapTQxHIQI/jxXElIbfhEE4fH9AoJ5IgZUgx
         TVfAlTSizoJN/15TjS0WJ5XcM74tDGiB1aM/cEp8wevZ4t2s4CrNzKDjPLlY53mMoRRl
         dJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768603026; x=1769207826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nPj7qs12piP/bjZVzPpDAGGP7hNz3JwnoCUD9QPt/xg=;
        b=iPmlQEWFzZpUrdtWtBJX0hz0bpFxuZeCagKUNK/ZUFQWPXkG1lAqF0CQ1eRB3FdIdR
         +rEjynu/nxYbcOirFPL+BkDoS5neHLrzqRNeUbjleiOjiG2z/uhe2E2WGbVGnUDzXO+t
         E9YF5dLG7As1zuODDCDblE8IS/N7mTBz1KGRbiZqCTlKNub5exEnVFOfaNRHIVfMxMDO
         SwFqCSW9h+z64ih3UlBl00OKqIDC8K2UTj+P4WL9H3ytX3RwqK6TX4r6yH1evdB03qHC
         Xm12PvR0F8qRcDgirxoiCOgsIehMXeydcbo7kIBmT2diRdQFs43gEi8YdMBMfdhfL0Cr
         yMJA==
X-Forwarded-Encrypted: i=1; AJvYcCXMcBYZc63C5rt1/dhQRo+ZBF6mIeLoP2unKgo5aY5kJmtgU5QG4Tgfa9/qOKg7I0Nq4lVNPG8uqqLBVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyE4mGeZOcaNc5lHjes1VBt+4d/t1HpJcg44EsQYpbpOowPJ1N
	y/eSgpQYb+87FVGfFwfCfMUm+o3rxwazaI5tXtDdF/4UN7bGh3ja6+bH2Ht3xSXFzqS0WD7OrRI
	VmC2Z0F13MSJQiRQnM1yZPHKNuQeiB1U6o4wb2TT7
X-Gm-Gg: AY/fxX49w9H6dqwMRf/+WIKZALeVNWvtvwsvhkTdLp1kQRWKVIYWW5Xmayd3cbeFWbF
	06mIK5dD2VO4AFNtbYSoyXBQMcuenyI2Cfe/KhV1k6xKRMvGxteUA8VR5JMG0Ldi/+s2/sNVD6R
	vmRTo/uavAyFkg7xzti6EaEKNmc2QnuTgzk3luojDuKgio+OHN6j+MNBnp6moYbyzfveWxDVUEu
	JbDXSKjQfouXkqf3+kouI4wud2GN98Kp7PrCFPcHGrrfc0K9n24N4RvFvdj3J0/MVftl8s8uqw6
	AMByS43tBhM6oQHpT1lBspZSdg==
X-Received: by 2002:a05:600c:4884:b0:47e:de1d:ce99 with SMTP id
 5b1f17b1804b1-480278c7966mr158495e9.12.1768603025656; Fri, 16 Jan 2026
 14:37:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com> <20260116-dmabuf-heap-system-memcg-v3-2-ecc6b62cc446@redhat.com>
In-Reply-To: <20260116-dmabuf-heap-system-memcg-v3-2-ecc6b62cc446@redhat.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 16 Jan 2026 14:36:53 -0800
X-Gm-Features: AZwV_Qij6KmRcwRqfzeiTk7l4B0hSiDhM7NFKcXm1BXyseKimbBVodrdbzenvJQ
Message-ID: <CABdmKX21XWwwOWZ969GT=DOu7_aofKR7E6+4iMggbELVM=zYAQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dma-buf: system_heap: account for system heap
 allocation in memcg
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 12:06=E2=80=AFPM Eric Chanudet <echanude@redhat.com=
> wrote:
>
> The system dma-buf heap lets userspace allocate buffers from the page
> allocator. However, these allocations are not accounted for in memcg,
> allowing processes to escape limits that may be configured.
>
> Pass __GFP_ACCOUNT for system heap allocations, based on the
> dma_heap.mem_accounting parameter, to use memcg and account for them.
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

