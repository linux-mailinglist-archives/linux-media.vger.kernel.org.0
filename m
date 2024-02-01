Return-Path: <linux-media+bounces-4581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0884636E
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 23:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A242A1C2518F
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 22:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D698E405CF;
	Thu,  1 Feb 2024 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y2sUzDTq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7A23FB34
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706826390; cv=none; b=qlWsujUz1JZh1B3og+jZX4KBsRdH+Po3k4uAztI7bLbo7xMgvBrQiGF71Ehf6/962k0omFv6BAGxWOT25x/xTVeaqtcdvMDAOh2Rg434jxZv88foGTQdTPE0R7LAwOvtXpJgUNfbkq7hHfzZR/AwbignEWbQkJQrKKWzqg5Sa60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706826390; c=relaxed/simple;
	bh=g1niz+9BFP8nJJvQSZtstaXWeqGreuVXwyIK+21IaXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KaZqCTQuq0Downn/zlLc0WsrKmnu1Zqa8t++c9+0hZjzk8qaRS4IPMVxx6HTUDMKZhcsaSIgEpmkoXWTK/ZlH2jCszm1GsH44ol8HpDfFvDGPPb98zs94kYpCegynqc6Lw9syYY0UGrd9k5RHQyDyw0sbEexceqK64MRSg2SFIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y2sUzDTq; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-46b35fad293so578369137.1
        for <linux-media@vger.kernel.org>; Thu, 01 Feb 2024 14:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706826387; x=1707431187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1niz+9BFP8nJJvQSZtstaXWeqGreuVXwyIK+21IaXQ=;
        b=Y2sUzDTqMNuq2LzRYMJ2GlU9BO6W+f/1pmQLHYXUfbCvU7tgwRHhY9fPU9PS4ZiRR8
         Cd0z4e4zrmZ//iqvBng9HRHRqgrN2atants60IeG+KzI85kYnfLPNcehqSB5ZwX2CbN7
         Q15Nt+B2z878uj+vMtVJppo5mqdtoUCfADGQRqHyO1UVsXncSOHHGnL2LB/iTRl9ZbRP
         yiGdXnCiJqwvkFGQF5QqdWGlQlkChh/rJr8rwK7X2EHvu7YUEGhoOWYYXOuko2jQiFUK
         Rk1u5IbEDkWq8vLsWnvlEkOkVPmfvwBaJcKprAAkUKWCYrOQSRcVAUN7BTpK3OyaeuW+
         EL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706826387; x=1707431187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1niz+9BFP8nJJvQSZtstaXWeqGreuVXwyIK+21IaXQ=;
        b=cf+2lHZtDemaD9a0E13MEOXHZ5cBOjf0DyDP1e9AnLTrHA25vfRFcSJC8B2eStSefX
         zYi8aWFoZgMGVTsRAooI46XtNlQngyIb8PZxXsToCYqobAIQTLGsTc2HxJ1RplMvHxeR
         XjKhQqZAmGG/bWm/OhdG09br94DYe2TfYv8MLQBrgHI5Xjab0A/QJsRsxY4Vc6BiB9gG
         eehQAocc07QS0kJEbifdfZVq4EWeZXh9tzpktup9ghlJAixcc6Raubyms8j42d9fDPik
         wJe9A9cF5pV7Y3zC9MWWtdvBDxnCUeMGsz4/7QqbLxPXExZDvX2JgTDtGIISyYh0XKcU
         ZrXw==
X-Gm-Message-State: AOJu0Yx3Cc5OM8F3ey39LhcWEdfbx8uCESDOpOr8g1xZ8keNLv2slhFj
	V6MclEx4vzWBX15fb+pKBdG1ZFjDAAAgYVtjdGhdgw+KO7pCuPjq9OAmVhdHVdrUa8nzbKVHsiq
	FnrraPDWxv5MhZaCC6WYcVLVXvotzZmb7uWqZ
X-Google-Smtp-Source: AGHT+IFCuKF6QiU+ny6kuZUF3GaDPIhQfm+qSFreoCq2anMqN2UYkMUcoGIgF+ZV3z+Yz9/V09IBhzG82IgRKFYsfqw=
X-Received: by 2002:a05:6102:806:b0:46a:fd91:c15b with SMTP id
 g6-20020a056102080600b0046afd91c15bmr339945vsb.13.1706826386679; Thu, 01 Feb
 2024 14:26:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
 <20240128-fix-clang-warnings-v1-3-1d946013a421@chromium.org> <20240201221654.GC2240065@dev-arch.thelio-3990X>
In-Reply-To: <20240201221654.GC2240065@dev-arch.thelio-3990X>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 1 Feb 2024 22:25:48 +0000
Message-ID: <CABCJKudd3SUy3Qor7Tc0zyJsSAWy0PavbbBFALuWEpBa32pBCQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: mediatek: vcodedc: Fix Wcast-function-type-strict
 warnings
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mike Isely <isely@pobox.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 10:17=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Sun, Jan 28, 2024 at 02:12:22AM +0000, Ricardo Ribalda wrote:
> > Building with LLVM=3D1 throws the following warning:
> > drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32=
: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsign=
ed int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned =
int, void *)') converts to incompatible function type [-Wcast-function-type=
-strict]
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I am not positive because I don't have any hardware to test this driver
> but I suspect this patch is just hiding the warning without actually
> addressing the issue that it is pointing out.

Agreed, this won't fix the issue. The correct solution is to drop the
cast and change the handler type to match the pointer type (i.e. use
const void* for the first argument).

Sami

