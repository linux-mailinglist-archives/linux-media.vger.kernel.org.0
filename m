Return-Path: <linux-media+bounces-40383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82925B2DA2C
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E3341C4656F
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E052E2DF1;
	Wed, 20 Aug 2025 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TI2qX7Er"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC1A2E285C
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755686256; cv=none; b=NepcZrDJlnzVPFAeqHc186QIFAjaa0nih2ImdScTlIx42iHrSFzFRrh0tyzcPAOfCYK4N2FMDTyNMnBA2T4YhfJZoSJMyXgRK06hNzuhSyRDGY14RZF8ganEythrtvM96adsKHzH8K388GhQgSykRKNHPhE6t2lcbfZ5F9VQVnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755686256; c=relaxed/simple;
	bh=OFo08HW/KntH/I83D/UysFYPhvG9LOa+MqmK//stgcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+BeRA8YYnFf6EpNNAHkbIkFSeNGMk5WuN1OeJ+suqFZUXtbo2rv3pZQykPYwDSsILA4bZF+o65wNDxRjXlsh6MTqH3sKnZ1Ia++lzqUzkM9lhcezsButhLTcHZwdVSDnjXT4kDf2y3Q6TkdS2MLTBWBlhtI+FAcy6rAN/3+szg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TI2qX7Er; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-50f85c8a9f8so2453132137.0
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 03:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755686253; x=1756291053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGbsuPE+0ODe6PuJ1PHV7gxJ5+99ZGIndY0/S7JkxJw=;
        b=TI2qX7ErOX6/ux8LjBozZEpW8ZIq7CT0tV05bBWakADb+/EJwy3mdWqqTpoxmp/rsm
         xtNmWK6C5EI3lQSdCWJnHJhVNFxO+mG9iknEIC+ySh/TnmRa8v9jXou4Ifbh7QSYfMfb
         C2oboOrN3H/a6vCH0NnUVPwNoy27AS7lDYsww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755686253; x=1756291053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGbsuPE+0ODe6PuJ1PHV7gxJ5+99ZGIndY0/S7JkxJw=;
        b=DuDy/R3Kx52YKv4e4gQt5coPZ2aUR0bpB4694kx1ZCkGBNATxAXkr36/1dsdxPGXpO
         wJhbx4EbqHjL9UIonOollX8sZThMLKSrq82wJrCco0A9AxEMgqsG7FEvtloIa67gaHYO
         aTVNaTYaH85u929es21OFt96jqR+jfb8kM8PxuSOCOuVwSpaxObEb086xMwBnDinpiQr
         NJdiHbjYxKi7hmMIG4vIYY6bOSt0+NmemNZZ/yGNDHyY/4bZZ9kmdUaPVWCDsfATGsPA
         9CGQTn3GxfPXSourQ8qJAe+87QXseMJCE0xQH38thC5fms/DPAj7vXuqwC7U80vtEdrf
         m1rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYeyHW7+Vb6x+1UQuf7bIbjn0V13Cpn8uodQ/Q03P76Z7xdncWuxRckG0dQRU57YbxqLQ5bsGKqCdwPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX6+AXQiDBZOU5S9LpTjVWgUQpcH0+xgqDDxLx0bDfxs7F6xrH
	kUHJlYqmxjjjM/uENDA4/DWuIImQz7r5eCKHmqulWr9umhO5TFTQXddmKXyG/VvYGkQz8+bA1xN
	Qwvk=
X-Gm-Gg: ASbGncsZrz90j3qPqdcQLztysCwpfa8CNtEg0Ngk/PgcuVTUgXxwtRb6W1Vep1X1l8k
	MGhC1DOYQcGggn2nrCRTXe+O/eUuIb+DBbzlpw2x4LZdMUshlpirFliPZ2N3kcph9SUfsTe0MIc
	svxK4YLRzfzHz/tQJXWpKEmK7zrxBqUwr0Hrp4z/HO0jd+wSsKYh8MOIdhh7tqXT8TDi0XHq5ZI
	EZo7L/bt2Lw+po99oAeYOLtS+KeDfAUwVu4HPW7l0H7iJLZ8UjZ0OzikT9doXazR9aC8C1szhyA
	//RXVtDWtJg6ITaEsi1aPeZh1QxOglQiqI9B37mQL2woYrvKZzXb5Rs5kJB6eC29xXwSRF5IQH1
	iGDDtofDEJQBZXInEwUYgXROZgCzlIAapO9QTsvogDc/hp/CmY4g/uREHernWKZThcLMN
X-Google-Smtp-Source: AGHT+IH8WRPkja5N6EKf0mmjueicJ2hbhil3QlYLhuN29kXu6TNtFhn9zXH3kXDStqXncEC6fqfnSA==
X-Received: by 2002:a05:6102:6a8c:b0:4e5:9380:9c20 with SMTP id ada2fe7eead31-51a4f53ba28mr646548137.2.1755686252937;
        Wed, 20 Aug 2025 03:37:32 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-51713f939edsm1934032137.15.2025.08.20.03.37.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 03:37:32 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-50f88bd4b96so4276494137.1
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 03:37:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJkRZYH0Lh85IfdG2RhI7YqWR59cELfpV5YTeN5isGt2aSBaws7RoE1OnY1FYQU2FJuSubs+Ix6Ji/uQ==@vger.kernel.org
X-Received: by 2002:a05:6102:d8a:b0:4ec:c513:f3d with SMTP id
 ada2fe7eead31-51a519bb1b2mr649649137.25.1755686251925; Wed, 20 Aug 2025
 03:37:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820075405.1041838-1-wenst@chromium.org>
In-Reply-To: <20250820075405.1041838-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 20 Aug 2025 18:36:55 +0800
X-Gmail-Original-Message-ID: <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
X-Gm-Features: Ac12FXxxuLvE-_OGknatHaznIwKXRs2-9K8o-wweiJyigK7q1-hAihk8TkEg5BU
Message-ID: <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 3:54=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Previously a mutex was added to protect the encoder and decoder context
> lists from unexpected changes originating from the SCP IP block, causing
> the context pointer to go invalid, resulting in a NULL pointer
> dereference in the IPI handler.
>
> Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> context. This causes a big warning from the scheduler. This was first
> reported downstream on the ChromeOS kernels, but is also reproducible
> on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even though
> the actual capture format is not supported, the affected code paths
> are triggered.
>
> Since this lock just protects the context list and operations on it are
> very fast, it should be OK to switch to a spinlock.
>
> Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect dec=
oder context list")
> Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect enc=
oder context list")
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Switched to _irqsave / _irqrestore variants even in helper only called
>   by IRQ handler (Tomasz)
>
>  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-----
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
>  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  5 +++--
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-----
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
>  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  5 +++--
>  7 files changed, 28 insertions(+), 20 deletions(-)

Reviewed-by: Fei Shao <fshao@chromium.org>

