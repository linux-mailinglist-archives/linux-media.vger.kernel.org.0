Return-Path: <linux-media+bounces-37003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C21AFB4B4
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E214188776E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD4F29B228;
	Mon,  7 Jul 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t++THqT9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112411FF1C7
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895323; cv=none; b=P2+2zsyf4ccyxgJ7v4DclKjidZeigyHIwqo5xy5oMxiM1UrQzCT1oe9/I4fP2Z8es/tnbXuOsCBILp1looXmuiSbAQOBEG4XVeFdz1eVJnci75yLbjQgS5Sg+EJyqiD0Hs9wG4E68bdc8x16NhbBBExUXL5tsjTJB3WFDpehUwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895323; c=relaxed/simple;
	bh=O8hQBASf5iMOBLgxVLic0uuXr1IXkFH1Kh4Bty5fihM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mM4jSNnCRSvVGZGd/Qc9cTVv/LN85nYN/sW1/z5SdqedGWw2kSzXpdG/V3opeGqLA9vanETU9CXMG/x+UhPJfsRrD0d26ZkHYOCCwMrtx1yUr+0GbZVvRGAaQ35XEMy/cA/PGMoB2sVndEmzOOP8yroJ/+/8gXGbl9Z9UikNjq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t++THqT9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so4634843a12.1
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751895320; x=1752500120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iglN2fDJo6Jj8oOAA17PlpCWLQPcfqHRK3QqDqJauNc=;
        b=t++THqT95wpZgG/8BQyOvlDdpS61ZE5mR5RIGRcuwNE0bFbY3U5+c0F3bPrvTcDeWL
         +r/f9QOjdiw16LIXmsn9jRKfaXrLZUcsozK67OV5m2IKpFq0iTaNG6NgzIVwEIF0/Erl
         61kbwrrqb25HXLB9SleCLITSkJsKPhhZHC+UX5Y+Eg24a2MfiW5ZgmTQ8OdxQjRKzKjr
         fzyvKq2FxjNuzDuHm0jP59RjqP0fdjpyvESC6K3fb/Nv5QYkJEH+PaZ5AuLE8c6mxx8k
         HSmbnr5g9DIdWpQwcndOJQ4exk3xXvvt1i4sQ/3Ea/3+fX1SPvOH4WB8S4oIVvH34a1/
         fGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751895320; x=1752500120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iglN2fDJo6Jj8oOAA17PlpCWLQPcfqHRK3QqDqJauNc=;
        b=g4SojiCCL4K9YUkFjPjh8NuNOTq/bf7vAPpKcKTO//e7EPz2f09H2r7T/6h8WfMSOJ
         u6GLcNq9WbDnOAOiVRPG527MkuRccjxZUjeo9wnQxzoFBInk/RfbX1r6Axfdjz48wurq
         GjuKNMYdygaoVnQwUITZeE0pCO19wkXfpbahQXMDWMVoLgzpZksTcXCmpf08KQ9G5tdx
         z2W9oHJakbtuRmH3rJtsKJe5WYGVOnGXtAzyCfxrAaxarggekLCBAPmtlH2RC9qlWVSN
         x3+gwe+pvhV9sGingq7NM842oYBm+rVzNODNChrKGH6ubGWtSfE+lCC7XX8B2Y2WzFFv
         iBgA==
X-Forwarded-Encrypted: i=1; AJvYcCUjKO2ALdK7YiTbOHkHruvvXCvcYaqRGaimg7dsDxZ+n8GKl55mMTegqHt5sOrOBxCfBFgiqwE1pge8Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzngfDc2yF99bz9UscQCaSnZbYpXp2AaSDjGVqkP5uVuM5VfCkh
	O6bAu/5lO/8yXcjMhnhiReTW+e5PMMZ/sVSoQYS/kM+ypbov35CMz5yafnCQi9GVZ9KjvZKzX7L
	YGdtWAWDj+JfBXHAHl5gjCMWOzareEj+Z0DdzWiz1wA==
X-Gm-Gg: ASbGncvMLYWZq7TuIUS6qKZ2aff9IX6XNNT/hclFWHA+t4flaVn3Q6n2m14Q873d9yf
	TwiI7kmFdfUAsRW00h9rFBjfeKG7E2CefSTFSCs7xKQssKxEOJtWs4gGlvYntKWyNxqxsq4gX5B
	dHUh+g8fmZmzBIiDUSTUWvFjCHUOy1DdDsoBkZ8z1ZPscsDyUPLuCOrCoaxkM/73sf2njCKLt/4
	bGIE4qMdVOfiw==
X-Google-Smtp-Source: AGHT+IET++QyEw80P77BIRzs6JWa9kHBMfwtkMIUTg5pCT3exqjnCE5AHFUJIOdI1A973C72FUTiNPTJJ/5qE+IOutw=
X-Received: by 2002:a50:eb0c:0:b0:607:32e8:652 with SMTP id
 4fb4d7f45d1cf-60ff3c0d6e8mr6977121a12.19.1751895320263; Mon, 07 Jul 2025
 06:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610131231.1724627-1-jkangas@redhat.com> <aGvHUTC7Kbe9lru3@jkangas-thinkpadp1gen3.rmtuswa.csb>
In-Reply-To: <aGvHUTC7Kbe9lru3@jkangas-thinkpadp1gen3.rmtuswa.csb>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 7 Jul 2025 19:05:09 +0530
X-Gm-Features: Ac12FXyRxHcDe4-WqyYgc42A2U_9x5Uy_U3EHMTjmhyPcBLa1jvXKcYwtoIgS80
Message-ID: <CAO_48GHtUG_hTFvLVQfG06FxdO_6z5m0WofXKh=WhgCjNguxPg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] dma-buf: heaps: Use constant name for CMA heap
To: Jared Kangas <jkangas@redhat.com>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, mripard@kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jared,

On Mon, 7 Jul 2025 at 18:40, Jared Kangas <jkangas@redhat.com> wrote:
>
> On Tue, Jun 10, 2025 at 06:12:28AM -0700, Jared Kangas wrote:
> > Hi all,
> >
> > This patch series is based on a previous discussion around CMA heap
> > naming. [1] The heap's name depends on the device name, which is
> > generally "reserved", "linux,cma", or "default-pool", but could be any
> > arbitrary name given to the default CMA area in the devicetree. For a
> > consistent userspace interface, the series introduces a constant name
> > for the CMA heap, and for backwards compatibility, an additional Kconfi=
g
> > that controls the creation of a legacy-named heap with the same CMA
> > backing.
> >
> > The ideas to handle backwards compatibility in [1] are to either use a
> > symlink or add a heap node with a duplicate minor. However, I assume
> > that we don't want to create symlinks in /dev from module initcalls, an=
d
> > attempting to duplicate minors would cause device_create() to fail.
> > Because of these drawbacks, after brainstorming with Maxime Ripard, I
> > went with creating a new node in devtmpfs with its own minor. This
> > admittedly makes it a little unclear that the old and new nodes are
> > backed by the same heap when both are present. The only approach that I
> > think would provide total clarity on this in userspace is symlinking,
> > which seemed like a fairly involved solution for devtmpfs, but if I'm
> > wrong on this, please let me know.
> >
> > Changelog:
> >
> > v4:
> >   - Fix ERR_PTR() usage for negative return value.
> >
> > v3:
> >   - Extract documentation markup fix to separate patch.
> >   - Adjust DEFAULT_CMA_NAME per discussion in [2].
> >   - Warn if the legacy heap name and the default heap name are the same=
.
> >   - Fix DMABUF_HEAPS_CMA_LEGACY prompt.
> >   - Touch up commit log wording.
> >
> > v2:
> >   - Use tabs instead of spaces for large vertical alignment.
> >
> > [1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@t=
i.com/
> > [2]: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=3Dc71kzFFaWK-fF5rCdn=
r9P5h1sgPOWSGSw@mail.gmail.com/
> >
> > Jared Kangas (3):
> >   Documentation: dma-buf: heaps: Fix code markup
> >   dma-buf: heaps: Parameterize heap name in __add_cma_heap()
> >   dma-buf: heaps: Give default CMA heap a fixed name
> >
> >  Documentation/userspace-api/dma-buf-heaps.rst | 11 +++---
> >  drivers/dma-buf/heaps/Kconfig                 | 10 ++++++
> >  drivers/dma-buf/heaps/cma_heap.c              | 36 +++++++++++++++----
> >  3 files changed, 46 insertions(+), 11 deletions(-)
> >
> > --
> > 2.49.0
> >
>
> Hi Sumit,
>
> Just wanted to check in on this since discussion has died down this
> iteration: what's the status on this series? If there's anything I can
> do to help, I'm happy to lend a hand.

I'm sorry, I had to be out for a bit due to some personal reasons;
overall it looks good to me. I'll apply it very soon.

Thank you for your patience!

>
> Thanks,
> Jared
Best,
Sumit.
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Senior Tech Lead - Android, Platforms and Virtualisation
Linaro.org =E2=94=82 Arm Solutions at Light Speed

