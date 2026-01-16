Return-Path: <linux-media+bounces-50927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ACAD3895B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 23:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FCEC303ADD6
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 22:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FB6313E18;
	Fri, 16 Jan 2026 22:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="INCG5uru"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9113E2EB873
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 22:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768603020; cv=pass; b=pg81+GK2I9hlNwHIVDl6Rq2monTGPKlMVTzF+CH9MLV3eTWIgqJT8FrWuY1sQfHWDYw815m3DMH+zxVrX+fIQ6Z+EdbEFczzVlXICKKx1KphaOL+apHtotAKDsV0OsamrUpNGELUf6wf82o5jigf8w3+IkkXs9JWc/9OYN9ZX+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768603020; c=relaxed/simple;
	bh=ref6+anxG3jpxuCLrmeQkq0IM/fUcznqpxMnwP+SsV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzO4SHMLKgSLirLLG8aCulkNdwAhLsPm3AqFSei2y0dXBYGNak2htF+cR/V8sZerrxWmjot8A67Ntz1BHGD88DB6BtdGm3Gls11SwW035etp783hhPOoitmdPgrQbvp99VQmtQNZpgSXwBmGfvKZOJ7b9JnYfXYFMcxlSQlf6/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=INCG5uru; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47a95a96d42so6615e9.1
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 14:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768603017; cv=none;
        d=google.com; s=arc-20240605;
        b=VKhU2CT3EQTjkQ46VIR9tCms3fBjLNGG5QfTL/Y92Wmq+3mTEte0dBgsIIaMeZ9ujI
         IukZ2ilnkWxbgkxcmsnE1aiUl5spWPaf2LSzSvoLBGaaxTXqhoLTSjOzC+bGdPllnWKd
         vas/Ef40yQkEoa2U/OS6bsWpgZh1B/k3Ky9JnMXwCxBbsAzSgfC362yG/C117e92H6pz
         Y3Wf7yBJXtzP5TDoQEhmDRIEbV0pdbVpJqCbWDsth3YUBy4KgdvNsj7mqX3z/B98UV/t
         W3EiZpyznrvBc2gw0ps2xZ/0KjOug2AGg2kxjP3yterUxo6ObEJ7yq3KL4wZ9xI6Xehz
         I25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ref6+anxG3jpxuCLrmeQkq0IM/fUcznqpxMnwP+SsV0=;
        fh=LrGOiT3cesy+jRdcxqU8q2d4VAvm1zOvw0Tik6MsjPI=;
        b=F5rX/wE+rL63qgmyOXoK+SloYDBQUOFtClUnoTEothGayPV0oF97Wld+AqeewEhyIv
         KdTjDWWtEpm0T2T4omkeR5VC+BPDreqw7JtP2r2L6bYMR3XREc9Ntkb1P/z1SLgu1fLf
         F1HJCooe/yhkslHOBlvF+ciK2XuIiqnR76Rls6RYc0QZSlBPFhrmtGDjSB+S95HxBwy/
         1g9WbLMJkNmQPxY8R3FvihTTJQw7NBVLTIEx8VF57ZSxGmG1l08blFws3xul+Qu3nocG
         8LGaPojLgdwPrGXC94QkNaengKmfB4c/oO8ra2T6S1FrkyO3ZwufVZOI6m3oiYayT9K3
         092Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768603017; x=1769207817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ref6+anxG3jpxuCLrmeQkq0IM/fUcznqpxMnwP+SsV0=;
        b=INCG5uruMk3TL25a7R/8pYQXYIm8ftTGhlRlGPOZfsTcbL81bFhttl9HffYkj1sUHO
         ERu4jkmqeqKXaYNSklwcuSToAbX1zwL+80Kv43mEpAaEItEGP0AFP8gU0tj+rJgwg2XG
         p4Yy+hLvcndC0aHEZIO3Z6z4cqgqQQiYx/5dw2FvpdS8gpFe+tQ98FMqOKlCSTt9OeDf
         QGkurgLwgB30qnalCD3heqxbWXQnBFIm29rv3nhMcr1yzHu5P9RbFI5OAZoiQ6Cym6Px
         sEcYF4USWuQCmFKZtdPIsdjPtu3XSb/XgLMGzmdmDtA360jWg5Ml2AADQoDz2B/VjIQQ
         Ez2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768603017; x=1769207817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ref6+anxG3jpxuCLrmeQkq0IM/fUcznqpxMnwP+SsV0=;
        b=R4EkaefKm86kb6ogD1b4043/FRzJtIyxGt2eGZBDrhnS8DcCcdYO3KkRn2NVKdIa39
         BWa4whyPsBNK0OsIuyohJV1oR6UlswOFgPJcQBIj1Cw2jIwunIdcJE86aj2Tkt+Z0WUP
         2XL9o+ZMWoU1XeedgDuAj/EhO/h4GJi9CKacx4cfQ83I4Mb5OyM7b1LH3oGNPPAQlg5R
         xzxqsOz35snFyO7ZjQlday/3U+pG9CjN01or9r4SPluhN1QwHY/vExzqjKztfA9/LgiX
         0ListuqHDtTH2OqjtTmvPrkTZ44Jk7LIH3sWz9myYu/jzX4CPcRJb0FX78HfyU9q2qIC
         +bCg==
X-Forwarded-Encrypted: i=1; AJvYcCVIgDMcKLWwbW1N7oofTM5fdIQtt/36R1r5z6YIlQKsPBm40KDHk43ym9chQe8Q5GCY+doNi18qYZJAIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysMHgElmmoPq8fowhBmbd5EK/OFHe/nyY5AVAz5YzgRczzvapo
	sCVfyVfWb5gaio4QBxZpWeQnb2uYpA3GZi1+EMmDb7DSL3NQjXj9VIisPjBeHgAgcir9wWKhfUn
	K7va/BTgltc54p3+c5EslRx1YMwYiFq2YSF38Nb3w
X-Gm-Gg: AY/fxX57NtZ6bFvf7aL0T+n+N0895we47qUF9f7pIsSHDKYtwN4FBy6KeJot+KvV5RW
	760USpsYcMKMiAbeL6W0hOFvFhD8DCKs/+MOzVp3nKV+ur/cBMAVacq3pVWuTR0ExDHjDZ25034
	M7HOs6FeDsIHXjK6eIyw0hH0R1adHYsZ8c7VarJzfgcrJQZpLFnqAQHWeJEdtRf8yBjrcHD15BN
	YumYUH6YZgaZTa080GRly1D0rTaV5RXWGV0KagFUAyR2IJ7ZvwpSDx+cgAzYsYwhzjKYWfqsBO2
	2BgUApaBq1s4X/E2gTsglKF1cDgUXZfkTxa3
X-Received: by 2002:a05:600d:111:b0:477:563a:135c with SMTP id
 5b1f17b1804b1-4802781fa1dmr195595e9.0.1768603016926; Fri, 16 Jan 2026
 14:36:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com> <20260116-dmabuf-heap-system-memcg-v3-1-ecc6b62cc446@redhat.com>
In-Reply-To: <20260116-dmabuf-heap-system-memcg-v3-1-ecc6b62cc446@redhat.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 16 Jan 2026 14:36:44 -0800
X-Gm-Features: AZwV_Qj0Dz4LSBCQIqyfkjH-g5gAHdJ-h5DhHq4dUYsXKP4PwrirabqAetr4Apw
Message-ID: <CABdmKX1ZCkF2N1Esi6Uo=jK=soXZe_eWhSSxHtMTcRWs-ZUYog@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dma-buf: heaps: add parameter to account
 allocations using cgroup
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
> Add a parameter to enable dma-buf heaps allocation accounting using
> cgroup for heaps that implement it. It is disabled by default as doing
> so incurs caveats based on how memcg currently accounts for shared
> buffers.
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

