Return-Path: <linux-media+bounces-28745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 517CDA70BC1
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 21:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1C19189A97A
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 20:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C00266B41;
	Tue, 25 Mar 2025 20:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YztrHBCz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9811A9B24
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 20:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742935718; cv=none; b=fQHSRlOImSVe/HIDo9P01nDYCx45ZINBFFN8xzIJOLEIRumw6m4W2/qznnqf9Mn3Drc2SWAjZDfDG4qbsZ/Q1v9+KcML1B0eHPycsDb1Srj2cDrFBx+WcZRm/OELUtWPTFX0oMOVxzDKwDRhvxzrsGJDbJwywthVKKuLeV8wGkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742935718; c=relaxed/simple;
	bh=GCAhGVtueceq1ubCUXU7aIifbCxnCpAKEuI8oUAtt/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4C3C/L20TB+O0CPu5an0otM11FIjOSbGCSfZKheMQF0ilmWYYAT9rcz50659HjqGheenHdMkwxVZ9XH8hchnYrB2QvzHevQHWTZp8b8UsqvK3act7bUVPl6DWIlH9Jf6tIrMB6E/k3Q1BmlD3vNIKiK4saT/UL5oAyUClKuYF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YztrHBCz; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so61231661fa.1
        for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 13:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1742935715; x=1743540515; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K52xAWNW5IEkY2W6yv56tbrXz/O78EY3OFwe6Kmcp1A=;
        b=YztrHBCzoNWWKrgGqwRsp/a+PGcUVo5CentTcWGqps4yRLNojRIoo8kQbwaoepfiwj
         SlME1qydJ5V3KnpqZmg3V5TQW6HAe84JQWVMDSG6Q8Fyy8B55dj8WRw6gil9wgvcEqsg
         2RSBSPQpebF8M93UQrAWxCz4acaUJS9bqHaJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742935715; x=1743540515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K52xAWNW5IEkY2W6yv56tbrXz/O78EY3OFwe6Kmcp1A=;
        b=jVpgbQmEdMw6/1+5TF7/3Chj5Khn5DJNEiOKaomcooq4dBBwI1AlVXfXDMcU46QMJ/
         ESVP2mP+tWjiZuPvZIt8SExpn1AL3BJsLM2TFz6eKmPYdIaDtIBZmPxnNDZfZYO3q/FZ
         gYFZY89YS5EfcOlAq6aR+Jq6mf8gfPOaixwhwRVwoS4gxSv1mKa/803gLV2eIh/Yk2Zd
         GYXdaeLssnb5SEXtiGXoPmVOsYAW9RjNEFd9lieeLdd/nB7EMLgDZ0CMb/8MuUYVyH7D
         bfMkia3G5ii4vlwKPY2e+Cp/ltlarYs5QvCQknehQLMRnmXwBmg13VDR2Jt0Pdem4Dks
         hVoA==
X-Forwarded-Encrypted: i=1; AJvYcCWy6sZ3CChzGr00x0kAd5z7w54qoH3lh1+0Jg5X2I1Zu3TSEzRPRdA085NEYT70Tf020NTprTxqNoa0nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtFX5VVSisqOYDe0YtlBYnStv4Pe5/HhwEn4HpdoNIb2cBIwj1
	k3m6d6LfllbRBcdqqr4KX5X9Z3ybxm734+UG412O6S0xQ5NYs2rOEsiPD3oj5dB3/UlfwUQ7CsZ
	UJgwcEQ==
X-Gm-Gg: ASbGncsypwW8EGYxHn/BeltGCMccMylGZxhQaczXB8XEnJFXidQf6Xf/QlSSZ9poHMu
	LPjzpzGxecnaELqFc0+ER/tZJHyaqn5LZwQTo0YT8+22WJ5DTRdaB3YIjZBesCmSULtkmoKd5Tx
	FpffAiJyfMRaywgb+Br+6jPgH9PMz7yn3J75Nq++t4SslpOteMiewid0xiTN36O2cmQSIdD2+h1
	pSXcAF6HhyzkhgzyYs8KrcrufNUPIDeLi3yVSvg9JyS6e2cUtzyShM0AOniHZ5qOl3wGfqhwbKx
	0ye7ADdvkFSHyNau+33nimMZtv9yay1szDXBrsnhrU3CH6zJezh8OEy1bedGFcOenVg/FxWMWhv
	87HqXKBcHDFztzqMjqB1h6W9rllzgiQ==
X-Google-Smtp-Source: AGHT+IEApOd1hIq1TpuL7/9ALqbXeYikAo2/3AM0v+h2V+gVw69F20We2AUvVk6dgQXI98q88foEgw==
X-Received: by 2002:a2e:b8cb:0:b0:30b:d40c:7eb4 with SMTP id 38308e7fff4ca-30d7e206952mr73337421fa.7.1742935714743;
        Tue, 25 Mar 2025 13:48:34 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d557b9fsm19728721fa.0.2025.03.25.13.48.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 13:48:33 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54996d30bfbso5658811e87.2
        for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 13:48:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUymma/Id22x7w6j3yy5mdQfiqzhXshBKj5YCZnoJuMO08GZHQKJHfv2Gbb4oZPK+rxpvqFTXUmaiYc0A==@vger.kernel.org
X-Received: by 2002:a17:907:95a4:b0:ac3:48e4:f8bc with SMTP id
 a640c23a62f3a-ac3f27fd3b3mr1859596466b.48.1742935307883; Tue, 25 Mar 2025
 13:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325121624.523258-1-guoren@kernel.org> <20250325121624.523258-2-guoren@kernel.org>
In-Reply-To: <20250325121624.523258-2-guoren@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Mar 2025 13:41:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
X-Gm-Features: AQ5f1JpwFc7ifwGuAhyrs4E5qPgHx1McCR38KFycRhkLFRMKTveHrmoaWi4zba4
Message-ID: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
Subject: Re: [RFC PATCH V3 01/43] rv64ilp32_abi: uapi: Reuse lp64 ABI interface
To: guoren@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org, 
	oleg@redhat.com, kees@kernel.org, tglx@linutronix.de, will@kernel.org, 
	mark.rutland@arm.com, brauner@kernel.org, akpm@linux-foundation.org, 
	rostedt@goodmis.org, edumazet@google.com, unicorn_wang@outlook.com, 
	inochiama@outlook.com, gaohan@iscas.ac.cn, shihua@iscas.ac.cn, 
	jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn, drew@pdp7.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com, 
	wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, 
	dsterba@suse.com, mingo@redhat.com, peterz@infradead.org, 
	boqun.feng@gmail.com, xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn, 
	leobras@redhat.com, jszhang@kernel.org, conor.dooley@microchip.com, 
	samuel.holland@sifive.com, yongxuan.wang@sifive.com, 
	luxu.kernel@bytedance.com, david@redhat.com, ruanjinjie@huawei.com, 
	cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com, qiaozhe@iscas.ac.cn, 
	ardb@kernel.org, ast@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, bpf@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Mar 2025 at 05:17, <guoren@kernel.org> wrote:
>
> The rv64ilp32 abi kernel accommodates the lp64 abi userspace and
> leverages the lp64 abi Linux interface. Hence, unify the
> BITS_PER_LONG = 32 memory layout to match BITS_PER_LONG = 64.

No.

This isn't happening.

You can't do crazy things in the RISC-V code and then expect the rest
of the kernel to just go "ok, we'll do crazy things".

We're not doing crazy __riscv_xlen hackery with random structures
containing 64-bit values that the kernel then only looks at the low 32
bits. That's wrong on *so* many levels.

I'm willing to say "big-endian is dead", but I'm not willing to accept
this kind of crazy hackery.

Not today, not ever.

If you want to run a ilp32 kernel on 64-bit hardware (and support
64-bit ABI just in a 32-bit virtual memory size), I would suggest you

 (a) treat the kernel as natively 32-bit (obviously you can then tell
the compiler to use the rv64 instructions, which I presume you're
already doing - I didn't look)

 (b) look at making the compat stuff do the conversion the "wrong way".

And btw, that (b) implies *not* just ignoring the high bits. If
user-space gives 64-bit pointer, you don't just treat it as a 32-bit
one by dropping the high bits. You add some logic to convert it to an
invalid pointer so that user space gets -EFAULT.

            Linus

