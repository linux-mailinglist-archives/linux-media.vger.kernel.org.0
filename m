Return-Path: <linux-media+bounces-12151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEA18D34A2
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 12:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DA2AB2145B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 10:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625D617F38B;
	Wed, 29 May 2024 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MzNXaqIB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3746117BB0D
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716978697; cv=none; b=KPjgUIHxO+QAto8ATArHAKQp3YJU29jICR1z7Uwb1pteiIndLJ8/hoF0eD2UM3njl1EqKtgxkC/njK64JeUXbtss3DvYHr/9tT+AsWNqYXthd2QHH0rNq3ecrBhUocR1moDumh6nGo6rscW+Mtgb20gAcSfpTKNrXKavQ5Fwq8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716978697; c=relaxed/simple;
	bh=DS+16H0AoYGVFQHMjyOcarJ501kZjn4XcqcccgjkI58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpYtwssuWRbbbsO6o3r99Gb0aRK2PJefBXT3bELUMylMilfWATHcsmxhuT7LvgYdcsjiZ8Q3pKuqqD3M7CRfmCfCGqjO2K2LEeR00EyC7ZW0rxB4v6GwQyO1Ek7qA1ZrVU8/X8JZwvQDz3vBMiwuc4XmNjEhmBQfyzbjztPDM+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MzNXaqIB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41fef5dda72so47375e9.1
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 03:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716978694; x=1717583494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T+4C++Ip51NQNCNOm8O3oTdvMVRbk5XM6uYT3Xq7q4=;
        b=MzNXaqIBR/0xwGgjUKeChJoLpQncynqZ7lvM+p6bSvkUATTGovQ8V16IxcIhjAriRS
         sAEkmzwJLmjZdew093p/qXys6dvtpHljdqCfFb/MsWHZuB8tKA8BNw4HGViDFewVgv2c
         vIFye8uYVb+UNlrj3AGodxUZJn92UA1Bxgm4X+pprEij/AzwIZGqtPD2eJbs/XlqmkFr
         Boixuvy87GkUAEcoSF6vHW0SeX6L2erjQyXoh9LmGlbI5h6tc+PcO6A+b1RjZaYrPcCk
         4SAkypvQgoJRSjFIVU83Sg6mfEF5EF9rz5/4kCTxqp6BuJrv2Rbtd/Qx956YRPfkcNXA
         JTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716978694; x=1717583494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T+4C++Ip51NQNCNOm8O3oTdvMVRbk5XM6uYT3Xq7q4=;
        b=Q1Fslyio2o9U5G3uWmzApVTK9sQPbAyBPkknx+IEPfKPGjsyA+9ObsKWajWvollu9B
         lSGI0u+AgF+A6b1UwqkGRNbiJUc2EOGrMm3BuDYion1KHi11gM8rT+ZKPsV6QFBKTW1a
         qdN9feEqiZ9O0wjTF6rT3C/6CEZX9Uz/8I6MMeXgQiT5xWHQCR7VGUDj2qQUDGGz2UPz
         DKvPjokDCIxO+EAz3iqNw6ZzWaYMwYEVrUM+8pvRJlDT5Hn+BMOSlFx/b4TXAz7QG3KR
         RSLNAjkcAQiXx5gGv/KFL3m6R2V4Wt+76ykLFtx7ypG30kLr/pGFGDvWBbrEnSy7n3Me
         drrA==
X-Forwarded-Encrypted: i=1; AJvYcCW3A79dAwmTeaOut3FZdihXyUuCUEfgIqhTqhgEs338fHVPSrJ6uFmlU3GYATWRFBZYIDBsq4jx4S2xYsVKW7RfgMbLZ4FDN5NLZ4M=
X-Gm-Message-State: AOJu0YxNFJm8yMMHh89z7gGQJwae6E/UbWh1wF07m+UNlnG4sa1XTrNw
	kU2qBEM/+PPigkgqOZIKt08J799OxnmQEiWJIt0k6Gw4RT3mMi0RqVR1IlyUDn63VcOa6Vpufm1
	9r2rF+p3zj56nGKjBix/dWTBrI5UCiPf2usA=
X-Google-Smtp-Source: AGHT+IF06N0AywzCp/IQE6BefdLVbzE7nu58juaSZM1QzbsQ9KSqgjIx7pyF//JuzfivcCk7P8QZxUDTY6QzUp2n4Jk=
X-Received: by 2002:a05:600c:3b18:b0:41f:a15d:2228 with SMTP id
 5b1f17b1804b1-42122909a1cmr1457685e9.0.1716978694494; Wed, 29 May 2024
 03:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522090158.121797-1-21cnbao@gmail.com>
In-Reply-To: <20240522090158.121797-1-21cnbao@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 29 May 2024 03:31:22 -0700
Message-ID: <CANDhNCqr4MtkEXG4uBOViPAODQnuQOgpdNZCmP4yvVSNwnU5ew@mail.gmail.com>
Subject: Re: [RFC PATCH] dma-buf: align fd_flags and heap_flags with dma_heap_allocation_data
To: Barry Song <21cnbao@gmail.com>
Cc: sumit.semwal@linaro.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, tjmercier@google.com, christian.koenig@amd.com, 
	Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 2:02=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> From: Barry Song <v-songbaohua@oppo.com>
>
> dma_heap_allocation_data defines the UAPI as follows:
>
>  struct dma_heap_allocation_data {
>          __u64 len;
>          __u32 fd;
>          __u32 fd_flags;
>          __u64 heap_flags;
>  };
>
> However, dma_heap_buffer_alloc() casts them into unsigned int. It's uncle=
ar
> whether this is intentional or what the purpose is, but it can be quite
> confusing for users.
>
> Adding to the confusion, dma_heap_ops.allocate defines both of these as
> unsigned long. Fortunately, since dma_heap_ops is not part of the UAPI,
> it is less of a concern.
>
> struct dma_heap_ops {
>         struct dma_buf *(*allocate)(struct dma_heap *heap,
>                                     unsigned long len,
>                                     unsigned long fd_flags,
>                                     unsigned long heap_flags);
> };
>
> I am sending this RFC in hopes of clarifying these confusions.
>
> If the goal is to constrain both flags to 32 bits while ensuring the stru=
ct
> is aligned to 64 bits, it would have been more suitable to define
> dma_heap_allocation_data accordingly from the beginning, like so:
>
>  struct dma_heap_allocation_data {
>          __u64 len;
>          __u32 fd;
>          __u32 fd_flags;
>          __u32 heap_flags;
>          __u32 padding;
>  };

So here, if I recall, the intent was to keep 64bits for potential
future heap_flags.

But your point above that we're inconsistent with types in the non
UAPI arguments is valid.
So I think your patch makes sense.

Thanks for raising this issue!
Acked-by: John Stultz <jstultz@google.com>

