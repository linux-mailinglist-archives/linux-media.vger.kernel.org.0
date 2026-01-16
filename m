Return-Path: <linux-media+bounces-50919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68CD37AD9
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 18:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 052F5303A3AD
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDFD2836B1;
	Fri, 16 Jan 2026 17:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RxUO0nOq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8B78F26
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768585502; cv=pass; b=gUsef3tfmHMrLNzmSjJ/GXF/h2urOzlfsNORRAZDaooYwZJZS6z1oT7S4w6JytgdsJRZUp6PgWEt7dw5krRawmfOckGSwL9oKZng3vsEy94/lpsNq7JwcW5uLGsMMqdCFUBbK/yabK0kUKkML9LMi/dDxESmFM5vK10AJ2+XTrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768585502; c=relaxed/simple;
	bh=GzPM6m/HbxhKRxR+S7Sv/G1H5dr7DZ20ISXH1PzgeLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Okqm88LlG8OUlZJNMSQdEnnQFQwI3hHzh+8d3i6I2QPc5KL0fmMopGJKyrQIPqxzXfALUa5PTO2Lah0JiufRruxiIb6pe1K0u9LIKfNOlz7pM9wpcMX1rbPfNWTrQ1860uhqkZVSLblUjTX9/jJRFq4wSrRNuVIlsQNpzMiSYzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RxUO0nOq; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5014b5d8551so7961cf.0
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:45:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768585500; cv=none;
        d=google.com; s=arc-20240605;
        b=cxKqV0e5+WmyrzhD9P9VsqVPDNWh7VCVNmL7MDYzI4XRZnVFht4S0TBsZ4xMa7kPmQ
         /zUso0MUCfSQhI+KikSD13zcO/t5CwJh4fIVeZMovc0tRD9C1A35yUp1fObWNZPZ+uxa
         xSUHsHVCu790Lf7NkXouEQvWwylIakZF+pZage9H/yti52ZxrlSVHWR41qtZ7tHtM3v4
         UEFgUU3IZizAnyNGKQrptzuOpjofGufRVK5u2Jp3cYTlmZWITNU5jNSZEeuzEX+K09KT
         QybexEqff0PWSYyBwSYhYda7+xZdBcHD5Z33jR4MEIAsVcuWjQtYhNyWqQTCI5qUzElf
         vkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gl4zFmzxCsueRoLVdUzaTLfY6+bubb8ahnOUlhxx4jc=;
        fh=EQHGvdXMZje9y8YpxiuQOOnt/SJY0wE7Tf8X8ujZSfQ=;
        b=UkSuxvOrTtnM0VNvb8d8+twGH0SR6MwxRlRJ35aM4XyTsb+9y+ZSgWyoeMfFR2ko0/
         sLeRcLJnIfbPVbM4BqQMbJAUBlQv72nN4LcQIVnH8M2P6M/RfOFZagpRAjriFhQAtQYz
         +EVqwtnm8/U+E3g7bC0oZlu4gnk9+jh4up0DDSmj7aMOP+MxT+md8XlH/9Th+bTPU6Pv
         oSB4yEteMd5frvTdlZIxkyhmsJ1jYIYBGSp0L35vFmU4+I6aitRmfC+BmRtmWR1wjfb5
         ZmTjpZY4H+h2mSDmM6WUj+hgRLAlxKvCnvu6lBabEDrR4CuMUSi9P/ZaFIb/RoUWvYaw
         +lZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768585500; x=1769190300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gl4zFmzxCsueRoLVdUzaTLfY6+bubb8ahnOUlhxx4jc=;
        b=RxUO0nOq7jdpG20AZ3hXqGae97I8C71/22nC13ddkyHUdU3de8MJuUEOmtDrzuAaCF
         MIHeT8WVMKscd6DvPKf+9X5609VfgJcRdjDejiCws9kAnOrTQP7uxRYeaHqhZ9xeRakr
         f/4dggw0CK18Y1K4XzFfTp1+fwO1gX4ix9tjCs6Al4XNQ9kiMdnNhNsPt1amp3xrqYIB
         QSfm6iXiVRlGwGDjZzFxr9ccFwFmpf4NrSE8JK9wqlv22oOlMEBa1C3tkPVMJouEoo2/
         CvBD31wP0U++q3p/aIJJd2lfzU4ksJyVtYM2MaVekqwSl3aqOEw5tGdedAXTOuMJ7uR3
         YcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768585500; x=1769190300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gl4zFmzxCsueRoLVdUzaTLfY6+bubb8ahnOUlhxx4jc=;
        b=CVRALeyMG3ZVrJWLK/op9r683Aj2k/lPcW7aw/PEOamk198CcIa7ZZFAcCk0h4CgBq
         kh6G2ZAdXnR6rIM0HdMMijgIe8rCuomNFVwtd+g5r3zB857pYyBiWim3cJCJRdHnytAP
         i8ix5IisVl2idsEXwIrnEvWUqa5BPqX7tcq8D7/4ZEFK0uqrmckDbLi6NlpODFf4qsO7
         YDYRdeEuqg5ctq+Un80+h7KQWmIcjUBrHohgNSpZJoehmu41XH5S7dAKO0DP8sePPjy3
         /gksbTkOc+8gK6zEBnVPhCr/8AowFdHooyK/ueB5oMQYj3KMQf6Tv1jg85wuw2dJ5q59
         sA+A==
X-Forwarded-Encrypted: i=1; AJvYcCVyEmGkNgKPcSBgtpBUxzAQaYsave63S95rxHObt5gQ11H04Kw7cj3heSdJv4+X2oHi3gj4ujVhziBOFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7WNYjJjuYPLaKZapHBkje52Yx+LN370dIQfUglgV2W0ExU5fU
	YvlzIUO8AdLP7LOSb2+VOYi+XtetT33B7LBQDdHlVdUx1axr+1x9TUmua0EbFwDwhK4XY3GIoua
	eKTLWaGspKGCttr5yyuCC/XfFSo5PI3mPI+TdKIPG
X-Gm-Gg: AY/fxX51lF08M1OEVQxzPuT0SRrU544luUmPYk76zZP2IYYn4bd5fD5/Y2pySk49QMs
	o6mz1O4ssOw86zjheDQObJCPz7CSyx/MuoINmvkPBT27PvkGXHkM0Y3MvOdawojXPq+jy2vqIwz
	vkRmd42yo2Eu9sOa+/AdWZnMxi6ysQCUPMLtT9AZ3K1LOd6QoryxCP0FmN7sjEnmXDsqfEq03aP
	P9iZiG/DfLQ/UhuFOJoco9E7ENiX4NBkKUOk3spOFbazL66JUbw/dYk9db3P57vKTO2oWGFDwrK
	/x33EQu8ID4qdeJNlMPzgtWu1A==
X-Received: by 2002:a05:622a:14ce:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-502a367be59mr5220311cf.3.1768585499718; Fri, 16 Jan 2026
 09:44:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
In-Reply-To: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 16 Jan 2026 09:44:46 -0800
X-Gm-Features: AZwV_QhmPRtd-UpS9Tj_-Xhzhu9qNDWnH_sMlLv41UkfjrVz_e5Kte0Y6tFqWfs
Message-ID: <CABdmKX32wj4yHAKMT7v9Na9CFwNM=Lfcop-dPYmcAt=jaygdBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dma-buf: system_heap: account for system heap
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

On Tue, Jan 13, 2026 at 1:33=E2=80=AFPM Eric Chanudet <echanude@redhat.com>=
 wrote:
>
> Capture dmabuf system heap allocations in memcg following prior
> conversations[1][2]. Disable this behavior by default unless configured
> by "dma_heap.mem_accounting" module parameter.
>
> [1] https://lore.kernel.org/dri-devel/Z-5GZ3kJDbhgVBPG@phenom.ffwll.local=
/
> [2] https://lore.kernel.org/all/CABdmKX2_UOENujpW0dXe0Z0x+4V3onfGDmHf1DMO=
XfDha6ddOA@mail.gmail.com/
>
> Changes in v2:
> - Add a module parameter to enable dma-buf cgroup accounting, disabled
>   by default.
> - Split system_heap logic in its own commit.
> - Link to v1: https://lore.kernel.org/lkml/20251211193106.755485-2-echanu=
de@redhat.com/
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
> Eric Chanudet (2):
>       dma-buf: heaps: add parameter to account allocations using cgroup
>       dma-buf: system_heap: account for system heap allocation in memcg
>
>  drivers/dma-buf/dma-heap.c          | 5 +++++
>  drivers/dma-buf/heaps/system_heap.c | 9 +++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> ---
> base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
> change-id: 20260102-dmabuf-heap-system-memcg-c86a381d663a
>
> Best regards,
> --
> Eric Chanudet <echanude@redhat.com>

Thanks for adding the param, LGTM. Looking forward to v3.

