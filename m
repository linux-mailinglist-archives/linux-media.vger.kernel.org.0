Return-Path: <linux-media+bounces-62536-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AI4NAg8D2rFIAYAu9opvQ
	(envelope-from <linux-media+bounces-62536-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 19:08:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DAC5A9E58
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 19:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC56C36B91E3
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9931D3546E0;
	Thu, 21 May 2026 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iVD8SyLj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7696435F612
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378151; cv=pass; b=b4IoMMAkP6yKhZhHyh3UUmj9lNUhEHLUAA8RdkBsNTp6RHsNvjMQeJCJJSDmmagc2p4tFp6wfcy1zWRArmd/cwM93URCKXZYOz23Ev3QE/ozJEsIw35krpF61c/6EL+kQ6oc7sSn+oIjvz3fLQT03ngIB8bQMYaMattdgc9JVV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378151; c=relaxed/simple;
	bh=LijUQ64tSE+nBEBNKcPzJXBLxxRclxWHzLO7xc5B1bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTFByhGsAn+g99+EMyFxHuG+PQMSuhPT0zFgIGzhZj2sDuMm5Od0XWZrd9NfBfqwMFiViiUCJyD68WjS8Nh4WntbDCBP+LTot2OqyHuQUPhfw7vXMUEhDNCRSeT8Pps2uM84UyylaUwwdhtgMSlgM2Ew3A5NzdDfIppePq+itXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iVD8SyLj; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd4f7f05e90so1152478066b.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 08:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779378148; cv=none;
        d=google.com; s=arc-20240605;
        b=dKtaH/qLeU2d9tWrsNBnIjMtTfm4DFqxMeXKQ433cSWocsOAsQJZoO/yv/nghEXLhm
         6vKUdedsqQ6t4l64dIVnbDo53MNHukO0X1JlTS+NoNxLyPiitu4RUlXznQmBzcKwM8RG
         IEnMsS7J7CBqwAXmCBqsBqo93AWKKBIQqO7qKFmgVaAQnyM0jg/s56vTm65eL1QlY2Lz
         dGbK25MJTTB773H74unXIW7Q45pTzq5KTPRC0LKKPPFNvcC0GxvDBD8WVnnlOmIEwyUa
         a9i0rIMo5NkSWe8wm+nnIDsKvyDBxM759XE67fJDamx47Up6aFwT94Vk8ftqxp16d4Fe
         nOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E2fslM12sgO4F+qxOdbD1nIBWEAvdOZMDwhieZ6kPT8=;
        fh=sZcfHxkibkD7p2UsmAnTQX0YrvJxogkFRooMti9pl4E=;
        b=CZkEzVGx7DgAyrT1RpvlhGcZbymt27tlD+3Mc26yTINsIgLzkV8ZdEtc53JjUpxASo
         uOQ4LUd36Xj8teuGVwqXXk6h8WTEWX21r5MtQoO7K8LceMG7m16jyuybxVJM5x8wnKrF
         F//yHinDY0N6rrBrrb06h3cKBwsKAL8weTmApVZ0Lmrecb3i3kuRJdEJNKCjvasqjOPw
         b4j5P3uLZ/oMRegruv9kTq9x09+uYhr4Cs5Nip/wUNSOC++oGDJOoPEq1NX5L80O0Yxg
         lVtKwYkXv7UD5uL2V6Ux/1GbJyleb4/v8ApKXVZ7gwWCnidE+tRtaNCX9TJxCMRS5I4k
         zaRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779378148; x=1779982948; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E2fslM12sgO4F+qxOdbD1nIBWEAvdOZMDwhieZ6kPT8=;
        b=iVD8SyLj2EahztIh22tQiXmLD2CeTSSXHPpp7oUeBSHrzRu6jsJhVr4mPpLx6580o6
         zMT0Gs4u3KFMxnk4v1uNGQ4M/ObgPoqo5VxtAErqx4zBNWhu5sn5UT8TMmsFABWcHUBS
         +J2ERvb8ugyq4YGWj2Rw+FDwIg4llZgzPLGsQl68pF3oldLGKnwGXNOO+7s3UUmZzlBA
         CcFzjgGZ+3yfb1dVi445z6+ryxH1iOfihpmCtlzKQ+pFz95j5a3L3wAJyXMxsJL06nGa
         7HSKXpZUJMMaAHkTsx0gOsRRbo0FC0mtRB2wO9vO3n9efiN/Uyy4ByrJjBFkY95A821D
         406g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378148; x=1779982948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2fslM12sgO4F+qxOdbD1nIBWEAvdOZMDwhieZ6kPT8=;
        b=qWx/dgYeS1Qpsj5PtMDwRz0K5wNetnmyQgD+jojrVBWRFikKYt9v9Wkl7hc3UlrkTC
         6Sm3JcKPChmwQcuVVwR4/LQrytVMUTksI1te8mq8T5Sz/goXcWSdttJdY4biTYo76+eS
         rrLc37TqNGuQv63LDrPcfO20kEoyr90RkyGwbekfcWPHlnJluLjkvFlpP7ehcgrbNIpv
         7syioptr24MgdbyAPeEzZQwpoxfGHJixu0AbRcjHrGn3XbukHK3PvH/yo0GgdUPJV8YZ
         ted4Ewp7T9zgCrhGMwBMWa9/mpVaOBG9//WoFjZ7DedbYbJGmAk8l9MIlVh6pa3yDyeS
         V6wg==
X-Forwarded-Encrypted: i=1; AFNElJ+41ZwGCQfvWh9i9cWYQl133KRMr7GsMGmS9dw7YF1IKNa5VjE+nVLqabCe0517Uz7qUUDyacf9R7fJ6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu2XAPBTm+yZLyD45q6sbUFE1PcdzBVWKEDB50pOj4E+k8cooZ
	LEr7A2TrzXxl6cTYkS9i9fIVXsqrCYl6QIGTQQyetGwaPxh0+P8PDm4wrkrYiY4gNGtlsmnfPwW
	ULanfRtFMBAqCVrE8vBok98E3p7InNOm8wRv52n32qQ==
X-Gm-Gg: Acq92OEswG5p770CgtOQ3/fxo7xwMkrfZEMcePDJpNk0RTesPLapL0H/7F6kWtxcUXJ
	MePHdCQQl0jrFxpGTh2Jfo2t0Zb8F1NJ0xol02GT76uD+S/8sbpOGn9Ydmf0sLJEYrmRqkDagVO
	SSMlD7CkcantumXNJzAOU3iWL0ba5wDQhOibhOsMLiINCXFbhYlm6qK85MRF+y5OdCj3r59BH+V
	gRkyzGCN6i/liQ6QJM0fWZiMsFQ0HQhlEWQKeWGhAkFYSyOBOimkwUvOjZSiL1o64hReFZIrURF
	GeCAQKhOyI2y5prJnM/vPUIYJIYN2b+ZCXzxzuVIlCItc7LnUw==
X-Received: by 2002:a17:907:c70b:b0:bd2:616c:56a3 with SMTP id
 a640c23a62f3a-bdc12d97c62mr249495866b.10.1779378147756; Thu, 21 May 2026
 08:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-dma-buf-heaps-as-modules-v5-0-b6f5678feefc@kernel.org> <9fe0e3bc-1f04-48eb-ab79-2a7dc421a5a7@ti.com>
In-Reply-To: <9fe0e3bc-1f04-48eb-ab79-2a7dc421a5a7@ti.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 21 May 2026 21:12:16 +0530
X-Gm-Features: AVHnY4KdwJRloPYYPr3vT_nqSzNJHilDu5uFjOj7H9mPzggIRmV41fNmlJ_I7Kc
Message-ID: <CAO_48GFgBku=s_oGTudh9MQeiCtE0aov0K0UE6zavYDgvNrATg@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] dma-buf: heaps: Turn heaps into modules
To: Andrew Davis <afd@ti.com>
Cc: Maxime Ripard <mripard@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62536-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ti.com:email]
X-Rspamd-Queue-Id: 50DAC5A9E58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Maxime,

On Thu, 30 Apr 2026 at 21:43, Andrew Davis <afd@ti.com> wrote:
>
> On 4/27/26 5:04 AM, Maxime Ripard wrote:
> > Hi,
> >
> > The recent introduction of heaps in the optee driver [1] made possible
> > the creation of heaps as modules.
> >
> > It's generally a good idea if possible, including for the already
> > existing system and CMA heaps.
> >
> > The system one is pretty trivial, the CMA is now easy too with the
> > reworks we got in 7.1-r1.
> >
> > Let me know what you think,
> > Maxime
Thanks for the series; merged to drm-misc-next.

Best,
Sumit.
> >
> > 1: https://lore.kernel.org/dri-devel/20250911135007.1275833-4-jens.wiklander@linaro.org/
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> > Changes in v5:
> > - Rebase on 7.1-rc1
> > - Add a patch to enable the heaps in arm64 defconfig
>
> Could you do this for ARM (multi_v7_defconfig) also? Actually seems
> loongarch has Heaps enabled by default and I've seen it default enabled
> on some x86 distros too. Maybe someday having the base Heaps + System Heap
> set to "default y/m" as they should always exist for any arch would be an
> idea. Anyway for this series all LGTM,
>
> Acked-by: Andrew Davis <afd@ti.com>
>
> > - Link to v4: https://lore.kernel.org/r/20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org
> >
> > Changes in v4:
> > - Fix compilation failure
> > - Rework to take into account OF_RESERVED_MEM
> > - Fix regression making the default CMA area disappear if not created
> >    through the DT
> > - Added some documentation and comments
> > - Link to v3: https://lore.kernel.org/r/20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org
> >
> > Changes in v3:
> > - Squashed cma_get_name and cma_alloc/release patches
> > - Fixed typo in Export dev_get_cma_area commit title
> > - Fixed compilation failure with DMA_CMA but not OF_RESERVED_MEM
> > - Link to v2: https://lore.kernel.org/r/20260227-dma-buf-heaps-as-modules-v2-0-454aee7e06cc@kernel.org
> >
> > Changes in v2:
> > - Collect tags
> > - Don't export dma_contiguous_default_area anymore, but export
> >    dev_get_cma_area instead
> > - Mentioned that heap modules can't be removed
> > - Link to v1: https://lore.kernel.org/r/20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org
> >
> > ---
> > Maxime Ripard (4):
> >        dma-buf: heaps: Export mem_accounting parameter
> >        dma-buf: heaps: cma: Turn the heap into a module
> >        dma-buf: heaps: system: Turn the heap into a module
> >        arm64: defconfig: Enable dma-buf heaps
> >
> >   arch/arm64/configs/defconfig        | 3 +++
> >   drivers/dma-buf/dma-heap.c          | 1 +
> >   drivers/dma-buf/heaps/Kconfig       | 4 ++--
> >   drivers/dma-buf/heaps/cma_heap.c    | 3 +++
> >   drivers/dma-buf/heaps/system_heap.c | 5 +++++
> >   5 files changed, 14 insertions(+), 2 deletions(-)
> > ---
> > base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
> > change-id: 20260225-dma-buf-heaps-as-modules-1034b3ec9f2a
> >
> > Best regards,
>

