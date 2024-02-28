Return-Path: <linux-media+bounces-6090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFFF86B167
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 15:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7F9CB29B43
	for <lists+linux-media@lfdr.de>; Wed, 28 Feb 2024 14:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1621586F5;
	Wed, 28 Feb 2024 14:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G9ktYVfR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5842C14F9D5
	for <linux-media@vger.kernel.org>; Wed, 28 Feb 2024 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709129622; cv=none; b=uCwO86M2C5IoiZSneaAz6faBgR39obpfPXFSs2k9LkdoTI/pnHG4Y+FvyLpxMCUivwHPPPhfZoDVUmef23dNHA/T5dPf/9gQZKQB01tY2rY4IbBDm2kz3gHUNSCKUGnRnzTKDfyYX7J1TlfQirqbI5ZrqmIixv/M9IQSYsosAFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709129622; c=relaxed/simple;
	bh=GZSa7w9u4wZYm52OzgA4Rz5PAaON/iHPoxrHsry7+Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyihmwj5pLOrlydIPaV655dUC9tnPrRkV5VvB/Lr0EyGPyknjV+TsTPVap7RyZg+y+PJ25GEhLkVoo5T4QV6x8qw5KqKejzQBySJ4ZEypmjVwziowRIToWW4TeaIRcArItRbnEU8k+kl6B8+Gm9w3gwHqP+iScqr6WlP/kzNuhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G9ktYVfR; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6902947c507so9502796d6.3
        for <linux-media@vger.kernel.org>; Wed, 28 Feb 2024 06:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709129620; x=1709734420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWdt7JSqxm5A0d9YCvZY0giCug1uc5yEmh3KxJvdV0g=;
        b=G9ktYVfRBg705jupUhFB0ximZlQSyXf8BFbnFkVbwCQAR2drbM6ZeRYkfuxHdm0CYD
         Vo/lO09/PdhE/TbYN5CCDuKYYdpewJ5f/mNeX7L/jwX2zLEYPJbNK/grOmnLUvT/nHae
         n2PtfR4Ju5EG906wEKQYgWVUnimBUchc8CNl149hPmfDNU+eyDGNlbseCPmBeTRTtble
         bZJ3V+JaeoZYJcLtA0XIlSj0Oeq51edFxt5/s9QZNMna+zQ3hvGivMkplwRqIPLvanLH
         JH4IxYbniVvI6epRCbaO252IfEUjK9aMP9uQmvYrFJRxDRa625jgR1GpzsS/bU0zuQ8b
         HcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709129620; x=1709734420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWdt7JSqxm5A0d9YCvZY0giCug1uc5yEmh3KxJvdV0g=;
        b=UsVgExCcFSsiUtFSiBQVBUaTRfy+NPmwegx1+KiT4ZlMBCY5BaXUt9ik2u5aTY6x9H
         S4ECzdZmKHu4f+eqgKMyKhm4tm/GVbhgacIzVAEjQ18udh49hvsAQ+I33q6Bd61MDZ4R
         z4E9L4E2S2u6qB92HJSSVZH8kY8iCxVPpPQ9PCpDV20Li82BXSvdVBQuO87ym7JDxY4q
         MmF9lKjdJapg5JzXKHIRhSNHj3gZlucEeLE1WsPK/+TD6tTXp9zq9lhU1xnLNnGPPhtW
         I6HYfrJ03fTrR+T2JGATp1t1r8k1LV0Fa8wGI4ZQmvTL8hoDWI+7XseoYz1RvP4sf5A7
         r4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmBxdYEhVWpVKDAUkd0Up/oWl33fAbi9N6TycM+tDxXudyIgOng0swxlRvcCUXCMFtK9ogvlGTxGrXfEhpOHLa3okYUsUJzMkORM0=
X-Gm-Message-State: AOJu0YzexteZJIHHySrbsZvV8VsSV24mA44VQD1CmFa0bmDn1hVBZsv2
	rWYmuBSbrSU/TW04QgweG26DzzvEYinlE4O62xL7Yz1fLwhfr/BisvosfoI1sXPFn8q0MLwTHYO
	JRPmJG2kxT4aoKx4b4GKDSG5k6VJhL+AVekQ5
X-Google-Smtp-Source: AGHT+IHhKPlutmi6jJVN+nL3TabbPZEuB5EQJ3Aa8MscJlcMNwjnLMk1ATmsWR2BYwS7KdkjnKd9gSsiJe+EUGQ14CI=
X-Received: by 2002:a0c:e450:0:b0:68f:edeb:91d5 with SMTP id
 d16-20020a0ce450000000b0068fedeb91d5mr4864685qvm.16.1709129619598; Wed, 28
 Feb 2024 06:13:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227215146.46487-1-daniel.almeida@collabora.com> <20240227215146.46487-2-daniel.almeida@collabora.com>
In-Reply-To: <20240227215146.46487-2-daniel.almeida@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 28 Feb 2024 15:13:28 +0100
Message-ID: <CAH5fLgi_Y0a=XPtgdiA9KcsmMGxn=DjvLMmSq-UF8VQtZVTccg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] v4l2-core: rewrite the VP9 library in Rust
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: wedsonaf@gmail.com, ojeda@kernel.org, mchehab@kernel.org, 
	hverkuil@xs4all.nl, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 10:56=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> +#[no_mangle]
> +pub extern "C" fn v4l2_vp9_seg_feat_enabled_rs(
> +    feature_enabled: &mut u8,
> +    feature: u32,
> +    segid: u32,
> +) -> bool {
> +    let feature_enabled =3D unsafe { core::slice::from_raw_parts_mut(fea=
ture_enabled, 8) };
> +    let mask =3D 1 << feature;
> +    feature_enabled[segid as usize] & mask !=3D 0
> +}

This seems to be the only unsafe block. Impressive!

I recommend taking an `*mut u8` here instead of `&mut u8` if you're
going to use `slice::from_raw_parts_mut`. Or, if cbindgen allows it,
take an `&mut [u8; 8]` instead and eliminate the unsafe block.

Alice

