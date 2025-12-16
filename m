Return-Path: <linux-media+bounces-48839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 851EECC0914
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 03:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6608E301691D
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 02:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE612DAFAC;
	Tue, 16 Dec 2025 02:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WxlGcxLF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9536318DB1E
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 02:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765850904; cv=pass; b=RzNC0Pw08Nn0OA7iME6UawgzHIiwm/2IPWrxBqeEZTFNHMXPQXYYarWxyj32Pr2QvASqCj1b06uv7F9PVpnG1kB5g2cZG7rH8BZ9GYhKHYCyRmEKP4H1Ok8AFRAjQSJLiQVI7ybsZUvLhOhalqKNEuLcrYnC3e11kyI/qYzcp3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765850904; c=relaxed/simple;
	bh=X5bsBULlMz6QGKo15fJSSkYOWsdYZVhr1CJojovu2xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMOYsGVW9PqehMd7Ww6g2UFnjjN097pWzyqW/h6NN4uOwhFr7IpPSPsc0vJPoaSyrk24PruHhze+L/3Ko2t5lBhQ0z/nlK8VGLToTteHvRiwLMiD2pYBAYQiPn3BSpRigSDgK03zLapa0At+fUs3cVmkrMWrYN1qbub7jFsDhes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WxlGcxLF; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477a1c8cc47so22285e9.0
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 18:08:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765850901; cv=none;
        d=google.com; s=arc-20240605;
        b=kv916j7iiyCVnTZ/G+YSS44/uBeCI/PJxs2cfzv4cpEsC6Zs32wtNgk0PCSsLL8lfX
         RJd2Gai7mVfmg5Cl3jVdRLPU0X+OGZZdGYPxTlTSQZktY8yxucq78b4VlWhHpb9b/rNj
         y8bj1Jqreov3EtIxszDkUj1wzDcyVIWxRlGoLDzlvAOyQDh7HIR0B9pC1t1EXCP//dYN
         bSoD08mwXtU+yhjssjGBtF7wl75D3awgQjrEAicbk+X8Ivlqlum+4FGfBLXKE7l5QAgc
         j2TV4iREJMbhuoPYklwVyqNiWkTrG1/PvtV90N+X5cJd1yT2v+0769IqIsdenZpLu7+4
         ZZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X5bsBULlMz6QGKo15fJSSkYOWsdYZVhr1CJojovu2xo=;
        fh=B2ZCvJtkmZJBFqUmXXZ5MZuHTHJICVf+V6XA0npZYmQ=;
        b=c9EHCxXuBsOd4YD7tl/tEBuAdFb32MejzFEQVlNInovCOKoj5bYM45xYlxsGfKcZnp
         DfwrgtfWHpQBo1KO6x2Q2nrUmNaXi6AhabU+8edYArUC+LVXjL+tbNznmdzagNRpuTvr
         2NxcNDf1qXwLMQq2EWkEV54XV1vXLaxG/NRjXTNUD8Gw5P97Tw+E0a2qLjvn/Vk5Vu4+
         xEtM5mo/mPVO3i+oxAng12XBc9DDLIfTxA0/D1lroobTXyAJTf1eJ3bm1o3NY8sd/OWB
         BIXo5L10H7ODtcJfizufAIcPlzJhpSDTr4YmF1DtsN9LPV6Wz0fu55M8SSIk7R5d1D3L
         5k6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765850901; x=1766455701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5bsBULlMz6QGKo15fJSSkYOWsdYZVhr1CJojovu2xo=;
        b=WxlGcxLF3Id146vkvfcXwJdkeiqh0BglMKe/hHWhUaUG2UOGWCmQNEah57l/fEmtGH
         R2orIn9Ge/tlxeQ2VPylzuleAHRfxFMlnVz6/PXA751wysroSrukeoi8m5OpCX4UeEsa
         erW8vNlS3TbLQYq70flldbjGWsIHBjSPneHOaPuxa7/BtyhWLlF8knlbG+3VblCj2iOb
         9JRf32fORu4GQ7h+5aOvuMXq65ECAfzeeIXk88RUVAj38PgJn/laBrc3tJ889RU0gj8V
         isY8jz+RMCOWlcm3P/TRIHzDk+OxxatzmTHQp0FZeDxpkPA42w7hbPaqvbg6IPcuDaD+
         wGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765850901; x=1766455701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5bsBULlMz6QGKo15fJSSkYOWsdYZVhr1CJojovu2xo=;
        b=WQtp4ZAZTJS0nX+Nco4SbbsspL4DlDMg8Zjfpxt69mDEuxMGm7XjxoFi1LF1+FvHxj
         SIFcm/l557KsVXwQk3m0l5oS57FlGsdfOED6r4Ax5urNqhIy4ZYNG8+eF9PY6UuNpLLz
         IBR914KKMShGWYT2rszo45YdtwPqK/bEHJ84HxPCmQjNhjE+ixbOWm89I+Ne+ow0P3VC
         WBaszxGgwp7XFkQk4ro5VTuP06TGS1BRa5hJtSWOMQAlfg620hzPZWM+Tj06tgsz5IZC
         cf4heYn7OVwonjhArKpZCOtMefMpEskx9Siz3S/2+eTuexh6TgZ1MeD7yITMpqnZI6If
         Y5ag==
X-Forwarded-Encrypted: i=1; AJvYcCUryXCL7aCmdGMbSMRr4AqRnFhsHfJPqnGQ18EWZjTSMeRfu5MPwYYcUBmGcU8yuV18x4ARc0bgGLPnkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YylBKGTMfBPq9TdhB7qulGmfWi7IyWnKOMLlLrUyJV35Lz7aS5v
	XuX9FGQZCT91iNFj0mb4t7J0wX6js8q6MZWVV5DLTgq2pKk/upPL01g76Poc3yOHD64rKEXLsIa
	Lf5VEA0s8DhWxjlvfUxUjJ9rBnz+ZQ6M5GHMYfnFe
X-Gm-Gg: AY/fxX5vgIvs8M7VQISaNev8TMRHFMYEL4ov0WKtPzGqJUUoq/bzMzhdQqrawItDet7
	heXB8D/IqznsnxThCEdFYFc1+HGBNvbYaLXPIfpWk7/j2pdsEmd2utJS4KW9k5w3HOV88cccsMw
	SxGF3p47ddId7Wnkkno797wmWmYoIZIQWd0x9fs19Vn/7BLDl3Gjt879yqHSS6XXs8XPR20itDX
	0dUdMo3dS+n02Ub69oARtY97IBB7n8Xqk2pslJU+J+C4gx/+xI/ITW7sANOkGAlwuUSpS8jtsHb
	pZzjdNGOZZlMN6oQPMYidz0K8kDy
X-Google-Smtp-Source: AGHT+IFy6wLOsC060mVmB9YoWUm0Z5j4XnF5LngURno1tGmqsHKnjp9hIaHtC1jrdIxRXLXpgf9/cJDauopceh8NjdU=
X-Received: by 2002:a05:600c:8a0d:10b0:477:779a:67fc with SMTP id
 5b1f17b1804b1-47bd797450emr116845e9.5.1765850900900; Mon, 15 Dec 2025
 18:08:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211193106.755485-2-echanude@redhat.com> <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick> <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>
 <20251215-garnet-cheetah-of-adventure-ca6fdc@penduick> <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>
In-Reply-To: <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 16 Dec 2025 11:08:09 +0900
X-Gm-Features: AQt7F2ou8MoET7GIPVWKsZ-i26gYeKvHlpUnDll8hGkIZCEC5OR1rT4MBoIc71U
Message-ID: <CABdmKX1XE5dzB9go1AStRY4B5-TrFF4pvCR+JLxPeOahso+ePQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 11:53=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 12/15/25 14:59, Maxime Ripard wrote:
> > On Mon, Dec 15, 2025 at 02:30:47PM +0100, Christian K=C3=B6nig wrote:
> >> On 12/15/25 11:51, Maxime Ripard wrote:
> >>> Hi TJ,
> >>>
> >>> On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> >>>> On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redh=
at.com> wrote:
> >>>>>
> >>>>> The system dma-buf heap lets userspace allocate buffers from the pa=
ge
> >>>>> allocator. However, these allocations are not accounted for in memc=
g,
> >>>>> allowing processes to escape limits that may be configured.
> >>>>>
> >>>>> Pass the __GFP_ACCOUNT for our allocations to account them into mem=
cg.
> >>>>
> >>>> We had a discussion just last night in the MM track at LPC about how
> >>>> shared memory accounted in memcg is pretty broken. Without a way to
> >>>> identify (and possibly transfer) ownership of a shared buffer, this
> >>>> makes the accounting of shared memory, and zombie memcg problems
> >>>> worse. :\
> >>>
> >>> Are there notes or a report from that discussion anywhere?
> >>>
> >>> The way I see it, the dma-buf heaps *trivial* case is non-existent at
> >>> the moment and that's definitely broken. Any application can bypass i=
ts
> >>> cgroups limits trivially, and that's a pretty big hole in the system.
> >>
> >> Well, that is just the tip of the iceberg.
> >>
> >> Pretty much all driver interfaces doesn't account to memcg at the
> >> moment, all the way from alsa, over GPUs (both TTM and SHM-GEM) to
> >> V4L2.
> >
> > Yes, I know, and step 1 of the plan we discussed earlier this year is t=
o
> > fix the heaps.
> >
> >>> The shared ownership is indeed broken, but it's not more or less brok=
en
> >>> than, say, memfd + udmabuf, and I'm sure plenty of others.
> >>>
> >>> So we really improve the common case, but only make the "advanced"
> >>> slightly more broken than it already is.
> >>>
> >>> Would you disagree?
> >>
> >> I strongly disagree. As far as I can see there is a huge chance we
> >> break existing use cases with that.
> >
> > Which ones? And what about the ones that are already broken?
>
> Well everybody that expects that driver resources are *not* accounted to =
memcg.
>
> >> There has been some work on TTM by Dave but I still haven't found time
> >> to wrap my head around all possible side effects such a change can
> >> have.
> >>
> >> The fundamental problem is that neither memcg nor the classic resource
> >> tracking (e.g. the OOM killer) has a good understanding of shared
> >> resources.
> >
> > And yet heap allocations don't necessarily have to be shared. But they
> > all have to be allocated.
> >
> >> For example you can use memfd to basically kill any process in the
> >> system because the OOM killer can't identify the process which holds
> >> the reference to the memory in question. And that is a *MUCH* bigger
> >> problem than just inaccurate memcg accounting.
> >
> > When you frame it like that, sure. Also, you can use the system heap to
> > DoS any process in the system. I'm not saying that what you're concerne=
d
> > about isn't an issue, but let's not brush off other people legitimate
> > issues as well.
>
> Completely agree, but we should prioritize.
>
> That driver allocated memory is not memcg accounted is actually uAPI, e.g=
. that is not something which can easily change.
>
> While fixing the OOM killer looks perfectly doable and will then most lik=
ely also show a better path how to fix the memcg accounting.

You think so? I can see how the OOM killer could identify that a
process is using a dmabuf and include that memory use for its decision
making, but the memory for it won't be reclaimed unless *all* users
get killed, which isn't easily known right now.

> Christian.
>
> >
> > Maxime
>

