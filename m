Return-Path: <linux-media+bounces-48838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B08BCC0901
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 03:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AE4A3002FFD
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 02:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AD32D8793;
	Tue, 16 Dec 2025 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Toz29npL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9992D8782
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 02:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765850835; cv=pass; b=eDZmUFHk+3JoAqsYQwALUUS/kIIq0lCx5tA1dtOYRUazpPXZbTCttZ+/R0lmAHKK4o+Lq7jxeH1hHFa09XZb4fpZnhe4uUKphTSPjB+Wj66+5uIfpAf6qBTQBuxEZrafMOFUQtaCwdWV/wWhD34m4xnK11WIkU2fmrbJS+MXjUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765850835; c=relaxed/simple;
	bh=etZ0EK6rCv46UcJh/ala8M9Aq++W1rrlstabB9Q2neI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZmBgmzldRaYt4y5zzX0ANwtzcHTJjUHEVyR46G/TjrBCStbI0OY1886jKD9mwFzXbITwFsKs+lwm7rqm2I3Z7+WO7ipRZXXK1z8u8NDaK69dE2l+5g6XgZZPJqlY9e/0dNeHTBNOvChJkjDoCvt7L/6H0f6KRK37lx3EldaDq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Toz29npL; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47a95a96d42so10055e9.1
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 18:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765850831; cv=none;
        d=google.com; s=arc-20240605;
        b=fk4S58aDCTmLBIsLbtzQFDgh/ZcUt0u2lvWL0Z+AYJliNdbTZ1X2YgOArrr5AOm/t0
         TPWDGlF8JWm8Kt7FnEaKemXTEdyjKrYHec3gRDILdNpol3KgyElJOoLCTTNFhsF4cEp3
         zjPYsg8xQ6yVEZ9QImgnkGuW6G7fjin9OdY10jplfPTTxhd28KF4990eHeLVMm0L/MXT
         s5N1TkQYzuyGxnzrzUec6CtMa9D6dP7aB2t66mPuuVrr0MOAr3ZO5FUPbc8aUKcKx4cu
         j/kf+9uEJgj8lUw1qy7OtWq2F0SklcqIIoMI8U+X3X/A/KSCrDhBmwskqHLjTq7pYDPe
         oV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=etZ0EK6rCv46UcJh/ala8M9Aq++W1rrlstabB9Q2neI=;
        fh=snAjRdxMWfgqL3NOI/lTDPzlglORxKsu3Qavg/EsIEI=;
        b=huh/wK50TRjIP6eKW+YXeZyY0qa6jHWqzqcuOEHKaGQv8LgSs2OVxWlnFwFSGaPrcp
         SXXff8Bdg2WGkaOYln4dk+5rnTXUjcI0I21/SCHELXBwVM2jEZeuF8mbe5yeSaYsqiEG
         Io3usmvu+XRfJwS6cM7lzsVqLLuFhVH/DvHj7YhQBKBecBUI+ATIBatrKsYjrNt9heF/
         Xu3jH4wBLqgECwDDz8uLFR4rmBcpH2tcHULjM0f/hd6emEJIQm+tqMJGGaNpYCx5Qmql
         7+NamiNGKVA4Bv7TV00QySIYgJuUZEiYM0yITWKyuSKa7GDO0Jwz4rhtxunDIjs2iU4F
         zPIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765850831; x=1766455631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etZ0EK6rCv46UcJh/ala8M9Aq++W1rrlstabB9Q2neI=;
        b=Toz29npLtpCdH8OrYK2tnpaO42jN210w3LG33Iru2emJZbi0du8XCqbnVvDxVRS6Cz
         7bYACv2m9O/hR7Pk2b74vpjBX2/tsxI+YZWmyaWDEL5S5hlQT/X1cPmiMSOiw+DHPrff
         +bdckdFHLUK+WuSzimLRPRMNqVMrTjYYIk0jF1XJzwqPYHkC+aJvn9ds0cBDIIbIs1F1
         NN9bQNOCvr7+dFwborrMYMileFsYxoL7nu3IeZqVgttFVZPICyZ85IWnlt5O45DC75hL
         mkGNN2XivIogrbqdCz6PT9KIlmgzYkTSq4Kam2tIXh2EgY5baG7T0BmfeWPA+eh/q/Zw
         DIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765850831; x=1766455631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=etZ0EK6rCv46UcJh/ala8M9Aq++W1rrlstabB9Q2neI=;
        b=f5DeePQMJ7y2OiUBWH9SXn0I6F6tvLw/jgHTbOg7DiuOIcfhJEx+L5pMZ6IGVpLLZs
         4P4mRhrhfgoHy1DiJZ6oIrOUZd7CYGOrsaAZZ6vVMmVDZEQItpVoTC9r49tAW5Q19YwJ
         tcXTTpqf4LD0m+asITvsVtITSBcBTa81FREtDm0MvTKgJ90pVJhty9T2oYzG2Lgp6NBj
         rP4dMspt8Mh4CMCTn8IMgV8nJw4MAnQGeTeqDho+zsddhLYWS+qH3+rMEtv8zNrnuwCZ
         bNo3thsZrdExaYsVugSHODNICRfRB66vesdZJ7bRmBgAw4XGJnsmRMWrOflwlzUs5BvK
         LnwA==
X-Forwarded-Encrypted: i=1; AJvYcCWSH/znlw8E8YNLTiPw1ROXUmPhuXJxre7+NFeRIDwGaTe9Y8EewLD9zzlStqBwwLAm/QARmYAShIpTjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHE5GEhtk57m2BVnrzpbdVRVV0bFvSbaFkj9f7/8URlblsTIE1
	8vSLaM33VSHP0iThTqIwyctMFqJZwqqtnmHsvepn4EDiP9nohxC8r4KMt03jvCNRPdgIAB8wu0x
	kOEH831CyYlHrM0uaU08I5uTkCUq9xB2b8k7dS3dE
X-Gm-Gg: AY/fxX460rqDaloVL4SBpcOKYGMzoAqc1WokoZ6taIoLAIEGBZVOGsDvYJWQTcOc6yX
	duVKf05HQCUVtNg5o5Az9Tw8HX+K6YZ4J5r7uBlFV/tYV5shVQ2jpDtp7S9Qu6zKER9KgXfG/FA
	1TQ+dx2ciO/NLVihHlXkj/6ClUZ14oIdk+vlBwBb1vf98t9O+SDy4YzZuPIq90csBqHEoZCMbnF
	P0D4zFtSn4kobRLnWTRrFEwTo6aBvy+sGqhcTNJs0xoi6KTrOb7auUwRuAbeirWh3gB0Kl4zyVz
	8jVS5WNp0dsUAaScQQsV8ZNGiG1JOjRE9oWv9do=
X-Google-Smtp-Source: AGHT+IEUmHtyIm4mkuG1Lw9nrtCCNOT3mva1Q+G2lidhB9qtF9TON4fldFLcKbTg56beBWDZhQDUCL/VH1kJamQBSf8=
X-Received: by 2002:a05:600c:8a0d:10b0:477:779a:67fc with SMTP id
 5b1f17b1804b1-47bd797450emr116395e9.5.1765850831139; Mon, 15 Dec 2025
 18:07:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211193106.755485-2-echanude@redhat.com> <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
In-Reply-To: <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 16 Dec 2025 11:06:59 +0900
X-Gm-Features: AQt7F2qPBf3y-Wy7fvkcCllXNhzIQ5MM-o21_RdxOwKfkIHj_isVetCaxCEFurk
Message-ID: <CABdmKX1HgSzUPS1Ot93tpctgunfHt_F_XNROB6zzpu_u0oH2=A@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
To: Maxime Ripard <mripard@redhat.com>
Cc: Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Christian Koenig <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 7:51=E2=80=AFPM Maxime Ripard <mripard@redhat.com> =
wrote:
>
> Hi TJ,

Hi Maxime,

> On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> > On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redhat.=
com> wrote:
> > >
> > > The system dma-buf heap lets userspace allocate buffers from the page
> > > allocator. However, these allocations are not accounted for in memcg,
> > > allowing processes to escape limits that may be configured.
> > >
> > > Pass the __GFP_ACCOUNT for our allocations to account them into memcg=
.
> >
> > We had a discussion just last night in the MM track at LPC about how
> > shared memory accounted in memcg is pretty broken. Without a way to
> > identify (and possibly transfer) ownership of a shared buffer, this
> > makes the accounting of shared memory, and zombie memcg problems
> > worse. :\
>
> Are there notes or a report from that discussion anywhere?

The LPC vids haven't been clipped yet, and actually I can't even find
the recorded full live stream from Hall A2 on the first day. So I
don't think there's anything to look at, but I bet there's probably
nothing there you don't already know.

> The way I see it, the dma-buf heaps *trivial* case is non-existent at
> the moment and that's definitely broken. Any application can bypass its
> cgroups limits trivially, and that's a pretty big hole in the system.

Agree, but if we only charge the first allocator then limits can still
easily be bypassed assuming an app can cause an allocation outside of
its cgroup tree.

I'm not sure using static memcg limits where a significant portion of
the memory can be shared is really feasible. Even with just pagecache
being charged to memcgs, we're having trouble defining a static memcg
limit that is really useful since it has to be high enough to
accomodate occasional spikes due to shared memory that might or might
not be charged (since it can only be charged to one memcg - it may be
spread around or it may all get charged to one memcg). So excessive
anonymous use has to get really bad before it gets punished.

What I've been hearing lately is that folks are polling memory.stat or
PSI or other metrics and using that to take actions (memory.reclaim /
killing / adjust memory.high) at runtime rather than relying on
memory.high/max behavior with a static limit.

> The shared ownership is indeed broken, but it's not more or less broken
> than, say, memfd + udmabuf, and I'm sure plenty of others.

One thing that's worse about system heap buffers is that unlike memfd
the memory isn't reclaimable. So without killing all users there's
currently no way to deal with the zombie issue. Harry's proposing
reparenting, but I don't think our current interfaces support that
because we'd have to mess with the page structs behind system heap
dmabufs to change the memcg during reparenting.

Ah... but udmabuf pins the memfd pages, so you're right that memfd +
udmabuf isn't worse.

> So we really improve the common case, but only make the "advanced"
> slightly more broken than it already is.
>
> Would you disagree?

I think memcg limits in this case just wouldn't be usable because of
what I mentioned above. In our common case the allocator is in a
different cgroup tree than the real users of the buffer.

> Maxime

