Return-Path: <linux-media+bounces-43405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACD0BABAF4
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 08:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 926A41887AC9
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 06:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9020129AAEA;
	Tue, 30 Sep 2025 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKgSCAt1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B116929992A
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 06:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759214454; cv=none; b=KrAqXcfPyipXGwW1QjDPGEiwNT/AUoQQhEYsZpOSv5gJVhc9Bov4on9Tmr7BCCqNOAV3s7c+d+KsHHTb5zxV7tXGKM5KpgLXOPN513Ivh7X7LHhUEhOfiC/qFogDdrI67N1nCt+fuSeBoCnDyND6ligXPSvHGJ+hYDCQBaxJkgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759214454; c=relaxed/simple;
	bh=aY796e7ZjDJ3GpkqwDAOoDMWoCinINh6cbC/Z6IAkio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAtOvhSeIjk7cMzMFfV2u+MLR54QKPYCC9Cz/hDIgGXi2Mdu2OEbJaKcybOo1mHNeciIcxZpVQ4lSJ+BMpVnor461KaxETre54vFW0f3/sSCZpAyIVwxEIk7smpo8Dbg0ArDUdxRRAWFZDz6hX64jYNrwESq1rS4xSObHsv13S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKgSCAt1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B8AC19422
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759214454;
	bh=aY796e7ZjDJ3GpkqwDAOoDMWoCinINh6cbC/Z6IAkio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DKgSCAt1CIUjTAPD85phyC6/D/engFWoLogA9Yz5lqVjDmSESvd0ZOchbg0bW326x
	 SW3YgAa4BKIk40LZ6tlKLlg0+2AmH9iEDSDkRkpUyTmOL/yMRy6+l1DvFG4sNq92g5
	 sy/a90b1stw+87lspEOgUef61/I56Yjy0Gx9rS9WSeSmXvC14Dd7DfSTvudUdeHmvs
	 hyf2tiiH4u7VKMaBdzQnBPsrh+0ulbD0H5T3ez6ZO2r1S0BXDt/Ie+UoPYrB2Y77Zw
	 nJdGsBiHyj7wChYx6E02wVyxskB4mWT6pVJP8RRkE4qkvJfPssQ/OibpAGmtBcuzZ0
	 my/RmbK0cZuXA==
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2698d47e776so48196215ad.1
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 23:40:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFwEdnh8lfjfRlpRhUbNeiBA3TbHVO2+4Trpn2++n97zOFOpODkqXSBMSNvlMwILdCVlmSBiLk+4bBiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcd6zgC0CyNp7lA3+IGPSD3ACP5pCd3fOdSnRDR3A+OIVXQLxR
	GPN1d7c4c01bTmC+ye5+pfjR62rbw0T0mpdx4/uwkGERyjV8WIo7TXku7CjrFxJpXY9lwikdm6U
	aNa7XE9YKE5rwkCZaMYBn5RkrMhd6OTM=
X-Google-Smtp-Source: AGHT+IFilulwB7yZKk8NWBisCkRd9EVIUP8wmRYd1pqL/aVk/i4cqOXK4Ip+OXNthJdD/mk9ed9ZzEkUxbiiEQK8Lsg=
X-Received: by 2002:a17:902:f68d:b0:276:842a:f9a7 with SMTP id
 d9443c01a7336-27ed4a5aab7mr219005735ad.57.1759214453755; Mon, 29 Sep 2025
 23:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250930035525epcas5p3a1238a3a7bc6e52113838397187e36ba@epcas5p3.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com> <20250930040348.3702923-3-h.dewangan@samsung.com>
In-Reply-To: <20250930040348.3702923-3-h.dewangan@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 30 Sep 2025 15:40:41 +0900
X-Gmail-Original-Message-ID: <CAJKOXPc+ass6ftbxrodVzXVPFW+8rUYW=VyxsmGTU1wR_jBiAg@mail.gmail.com>
X-Gm-Features: AS18NWBGk7OJKwPJ5iy8_Rm-Qzpd87k2vQsijdmZj27-buhGtUmwdQhJcd2WDg0
Message-ID: <CAJKOXPc+ass6ftbxrodVzXVPFW+8rUYW=VyxsmGTU1wR_jBiAg@mail.gmail.com>
Subject: Re: [PATCH 02/29] arm64: dts: mfc: Add MFC device tree for Auto V920 SoC
To: Himanshu Dewangan <h.dewangan@samsung.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com, 
	ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Sept 2025 at 12:55, Himanshu Dewangan <h.dewangan@samsung.com> w=
rote:
>
> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
>
> Introduce the device=E2=80=91tree entries for the Samsung Exynos AUTO V92=
0
> multimedia=E2=80=91function controller (MFC). The patch defines:
> - Reserved memory regions for firmware and CMA buffers.
> - Core0 and Core1 memory mappings.
> - The main MFC node with basic properties (compatible, reg, interrupts,
>   clocks, DMA window, firmware name, debug mode, etc.).
> - Per=E2=80=91core sub=E2=80=91nodes (MFC=E2=80=910 and MFC=E2=80=911) wi=
th their own sysmmu,
>   firmware region, and configuration parameters.
> - Resource table listing supported codecs and their capabilities.
>
> Adds full support for the V920 MFC hardware to the mainline kernel
> device=E2=80=91tree, enabling proper memory allocation, interrupt handlin=
g and
> codec operation on this platform.
>
> Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
> Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
> ---
>  .../dts/exynos/exynosautov920-evt2-mfc.dtsi   | 187 ++++++++++++++++++

No, there are no such files. Don't push your downstream here.

>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |   1 +
>  2 files changed, 188 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dt=
si
>

This doesn't belong to media patchset, don't combine them.

Anyway, you completely disregarded DTS coding style and how we were
Samsung DTS. Please don't send us downstream code.

I won't be reviewing this, you need to start from scratch looming at
other recent code.

Remember also about Samsung maintainer profile, although with such
completely broken and non working bindings it's pointless now - this
code couldn't even be reliably tested with them.


Best regards,
Krzysztof

