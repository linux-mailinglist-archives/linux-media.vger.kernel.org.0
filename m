Return-Path: <linux-media+bounces-57911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H57DMP5zWkdkAYAu9opvQ
	(envelope-from <linux-media+bounces-57911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 07:08:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEAE383DCC
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 07:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A49F03061450
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 05:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A3436D9E1;
	Thu,  2 Apr 2026 05:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R9CVOwEq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A18361DD0
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 05:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775106423; cv=pass; b=H5FnyKzR1o3EnrbaLBjw9dHJSx7BRb+n4bFU4T+uZgH+onOisFZNF2QFXNCjOX5r3FwsW9aHlAuaowO214ekSFWg/rjmSsM4P7GguQDOLpfdOfhJJM4VJTY25VggP7+tmM6d+b3np1G9KrONXw0cKQlEfOq51L2yngFCG387gCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775106423; c=relaxed/simple;
	bh=Qf3x6hVmCFdUqtHFD5VJaVdwz6bPu+MVKVWepeQR03o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gya0U8cl65HU5NWXQ5yh1sESLU/lZLV1Jep2BolkSrUj4i8h4INA/NfWYEDjGMYzCKEJG9GtopbhBgOMwuseA++5xzsF6HLDpFTus7R8zyjglut61FTfNC6dJZW6WnxjhoFNZBEl49aRJwXYq7PfBX7x+/LXELLHgswsiBc96r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R9CVOwEq; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9bfcbaa81eso66780266b.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 22:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775106420; cv=none;
        d=google.com; s=arc-20240605;
        b=MXRJav9GBnQBXlkm4LwqzMwTpYbpqUuCJSTnq4zVz5FX2ZO6DgmyRm8Ku3QmiW2A5r
         GZR7SgghgYNWPVX47ngL/OBSg+ul/qTAPja5qZh/imSG+Kk+0U9sXD+mBn8kVXzJ7+v0
         7k7aG1TO40pPNwWZBA/V4ULN3W6r8n+L1uzf7Xze8YRzL7e6i4GdAxskhCeLmXtOqLXO
         SKD3R0ZfniKWrb+3+LqnpyUyIekl1okyHScoYHAB2kyBs1mfEpa9KXndKkwx59xQmdlG
         NRIvcoAVXpzxTbwSOjKV+jho+eU5JM42jKDQzYHowT2FwXbNH7Z8iZ+fzemza163nI0F
         tc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qf3x6hVmCFdUqtHFD5VJaVdwz6bPu+MVKVWepeQR03o=;
        fh=H4xjLokPGCP00EokTkqwThFdEGtWT0EUqA2TVXsr1B4=;
        b=gk+YOrd3hJ8RQm+0EBt4uzuJ2Okv//SFU11eLaC6f/cP0ff40ulYY5wG+VhLQxVhPX
         UUTgjXpgJJeYrVzXCYcuw+GjheqXbRUHTB1zmFXxKz6FZJ38kYbBBtSLhOVa3ClAB7yi
         Np2tXAoGUydT7RzPwcAvGHzcZmLzrmJVj6lNMUBKQMYoqUFg2+2FoZgBMEnBHGqY8GMh
         nLguS8AmM7HKZBTlhnivTRIV1yBz5VBd10WkSn+eSB6gmWLDJosr4pB42zhNrs5M0l+Q
         YyY3l8I4R0veDt7+cHH/1too0PNARnnEPiWvTa5uPMvwNGRguKrpVWo7tIQrvfMoXmPN
         thIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775106420; x=1775711220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qf3x6hVmCFdUqtHFD5VJaVdwz6bPu+MVKVWepeQR03o=;
        b=R9CVOwEqukrkqXxkjwTJEN5EzjRQlsnmR8V7ZmCp97xdyGwGCGtkVXUkFpqyS1K6iE
         e8WgyDGhYvPi8h1mDiOMr1yUZt41vHhEfbvk8zOCPijXMqIQgA31buemToatXRn5XCSA
         q37RZ7BoYCsjMpy9MPDVR11bxGePQUljVUJTmozIulQjD5Z0Tythj0E1chYkteBwcrwj
         VmBF5e511R4wkY2TiB9w4vdN/2414DQ7mZs9kMlIfgt0ZIhYLUw4ATe1vPiGGYqc58FX
         8tCH5HAnqYFwtF+EA+qbGoJh4YvjnOhX45acoLvq+UJeoDuI8AvkM7nBgwOyQXG1xTAb
         yiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106420; x=1775711220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qf3x6hVmCFdUqtHFD5VJaVdwz6bPu+MVKVWepeQR03o=;
        b=cI9vgHwWpGi8Jx/wQ42ZWMS4moR+BxmiUOBftqFCxYW8LGtVHdL9cL4wWc47LmXwez
         vy8ZPoi3ZTomtYPvcRrbtkW/IofpT9GPaytHooxbkmmZK2vyXbjef5hGvI6Z4spi755N
         sg/CZGgejqD4RoKhpH89m7YoBZdaMG+/f+IMtf68CxWVI9Dx+yNYhp59bECXoEvWcHEL
         xhdjUA2j7gGWpxhJz0UIoJXe5rpEPy4jj4THq4sZcUAGy1aurRQxk2Ib7JKDbTKSQXn/
         3VxFVoOcVMKx2cGEnes7P2mqyKEi2wHiG+b28P461oU1Ou7d7ZrRx36zukpWQPAbJCbi
         fFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWS5lUCTcnFQiel7VECR4NDRMqGIcRqgaueJHYl1Ah0mOrvxF1XNiFJArduslIgfm3/4WrLhDknC137g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCsfyNA605g/ys7jWcTtUrACOCN9A8UO4gLKu3IG4IXSMFpLQp
	cUmEqDUSH5lnlUPYoK5qTaVyPyS6pnZt+y44r/2n52iZbvGyvgpQfDXbjaTJoATXBF8pAQQ83Rl
	htlIyDxdwkTsuTlEAhhAaX7Zpy872TuInxh1nxW2wzQ==
X-Gm-Gg: ATEYQzyyoG21xzxgmJqwSD0f1G9hr7pmO9M5ulRdVBb9nuXllFXsllmL+n3UydFcNjW
	iKu83d7lADUHtNyKNKihAXJzHqKHAbK91gaXD2Wshf5ubTTLWnCgnuZ7KOyEK/ZhZL80u10PcC/
	YahcecYBHwJye7vdzy/HxVpLsVG8skVXLjJeILN+UG2PQMTIQDtEojjSgEDlSjRBSw3cZ1M6wlj
	J6DDoAX8QARHPpr2XDItp56Q9Quty+dDrXxwYkyf9qMYJTk0hdxh2G/3HpVodjOr2TImwKqsA10
	qQQPgYrSRe3D9R30lhGD6XveP2uFvLXpyYvmC70=
X-Received: by 2002:a17:906:f185:b0:b97:4e42:23ef with SMTP id
 a640c23a62f3a-b9c138f8b82mr248056566b.16.1775106419953; Wed, 01 Apr 2026
 22:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260331100026eucas1p19bdc2aaca4c9a48c6f6ac8fec71478d8@eucas1p1.samsung.com>
 <20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org> <46397de2-eedf-4e09-a83a-3b683d154fe7@samsung.com>
In-Reply-To: <46397de2-eedf-4e09-a83a-3b683d154fe7@samsung.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 2 Apr 2026 10:36:48 +0530
X-Gm-Features: AQROBzCJbHUqpXNhrktgFRPzZ2TP3XLnRpMznWDVTmhDI0Xxoe_pLYi4105Frnw
Message-ID: <CAO_48GEFQE_FJjuq1UqP=DC6LJE8jjE3C+4FdAyB4uEZDsnFJw@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] dma-buf: heaps: Turn heaps into modules
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Maxime Ripard <mripard@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Albert Esteve <aesteve@redhat.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57911-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,linaro.org:dkim,linaro.org:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5AEAE383DCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Maxime,

On Tue, 31 Mar 2026 at 18:24, Marek Szyprowski <m.szyprowski@samsung.com> w=
rote:
>
> On 31.03.2026 12:00, Maxime Ripard wrote:
> > The recent introduction of heaps in the optee driver [1] made possible
> > the creation of heaps as modules.
> >
> > It's generally a good idea if possible, including for the already
> > existing system and CMA heaps.
> >
> > The system one is pretty trivial, the CMA one is a bit more involved,
> > especially since we have a call from kernel/dma/contiguous.c to the CMA
> > heap code. This was solved by turning the logic around and making the
> > CMA heap call into the contiguous DMA code.
> >
> > Let me know what you think,
> > Maxime
> >
> > 1: https://lore.kernel.org/dri-devel/20250911135007.1275833-4-jens.wikl=
ander@linaro.org/
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>

Thank you for this patch series; now that it is needed by more folks,
I think we can merge this.

Marek, I'll coordinate with you on this - thank you!

Best,
Sumit.


>
>
> Applied again patches 1-5 to my dma-mapping-for-next branch. I hope this =
time it
>
> won't cause new problems in linux-next.
>
>
> Here is a stable branch to apply remaining dma-buf heaps patches:
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git=
/log/?h=3Ddma-contig-for-7.1-modules-prep-v4
>

>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>


--
Thanks and regards,

Sumit Semwal (he / him)
Senior Tech Lead - Platforms and Virtualisation
Linaro.org =E2=94=82 Arm Solutions at Light Speed

