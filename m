Return-Path: <linux-media+bounces-30566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B7BA94A80
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 03:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50C37189136D
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 01:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E331EFFB1;
	Mon, 21 Apr 2025 01:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O38jb5/4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA11E7C27;
	Mon, 21 Apr 2025 01:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745199821; cv=none; b=UBZbEP+K4wm/eGGtUWyKqLdPD7Jrslj+/FQH6BNNw8aNOt/BOelAmMh+qTSbx/LUojQ2S58Q1ABjc1i+XZHoA/PqiIyW/3Nh26qMr5VDn1MTRKCHfkHm1QodCrmR35bzoFjYh/4UcD5c3/xtscBvUlQDE2RWr0hJqw3m5lGSNMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745199821; c=relaxed/simple;
	bh=MOYF82J+ac9gABW8VzDV2CQ2CSZs0LmILZ99u8uayZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBKBiVjZBMu3quHwkGF7Poa3UYo6ctLZncWX88RO6CNXeiIT8G0DYnJrcVHv8Giq+AY/ClY5L0AU8J1mOHSXb1FPnSAaWw/GisA693YxnxJUkesA5QU4brDdXrpCurx7j5PWPBE3BCq7RHWjRj80gEfp82XRqoNMvLYg0IC/Oec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O38jb5/4; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b10594812so3621053e87.1;
        Sun, 20 Apr 2025 18:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745199818; x=1745804618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpS0KEUlLdQcSMNwZJjnNvJaeGfYxduqpah6Qs8zdH8=;
        b=O38jb5/4uaAcEJgNWWLQwnZb11rG7lITaCFlTMtCRHn5dDV4hBfZQA5J1J8YvpQeku
         4gi+cjIotyPsuqQzG11kBWu2TNBaequn8ybnvp5jj6/CazT+iU1N7obivycCAFwfWJ8J
         Dq0a+xTZJsO0o2OH2fHU/fE56qKRz6hDBjWn8NUocJSzbRCxB66vTlCFbwmW8MAHEpsC
         3pjIZJSdPuLRXwetX/B1QfIDkqS28QJ1x05wlbMg0ckGdoF4Oy8VdKjx1r4qgBWJTehK
         IyJ3wRsM0/Z4uDDpdM+MCxMruNdfym1rJVHd/3sLGIq6mFDI+i7d6CZI65HMO7FhZgq7
         slGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745199818; x=1745804618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpS0KEUlLdQcSMNwZJjnNvJaeGfYxduqpah6Qs8zdH8=;
        b=Ap4WC8QpaVofVE1ILdAxl5os3Xo+3Hg4bHR1e9PK6GZVyBG2pN8yytQoTt7wgjXwQB
         EVKdQaFWQadFGEeS2R6/wMBG85wOI6DkE/34jcTttXMqrxmfSFRvNqVz4j2faXR5seA7
         7YBlDuTR3AhLd8ozLXQvND20Mk4J6L2oo4QHz7xzRABUB4CPdsUUIHAFu1wi1UYR6IM/
         VnbKU+u6vPY2x54lEZK6a7/hJkf//hxxP4RNj73COSvRCcHAwmKs8051zhz5+NiMQO8u
         +Uv/pYEK8tT16XGOR0mtdz99LEFlD50iJthWOh5nS1EUXiJIC7sIT9Nxmg6bE+7CXVZi
         T95g==
X-Forwarded-Encrypted: i=1; AJvYcCU9saDmo113Na/As0DZu7Pc2si1Qt7oTsFBcD4HA7CMAJj4FZ98s2nt1szWWR8XYGX7AWzwBJnFbNcSXy0=@vger.kernel.org, AJvYcCUsQs+/u4EuzDF5SwZbEppd9AAFTmq6mGBOism2ii25xtQxsQ0crqEi04ORxVoVvemn1gjI7MF4DcabVReZ@vger.kernel.org, AJvYcCV1rJRG9VuOxVQUdlnxGNE6xrBoauiOhaobdEhHE3BtZUl9J0xraiYXoH/IFthw5J8kVnIAL9xb02nE4fU=@vger.kernel.org, AJvYcCX0vMASYanrx4jv82VosnktSciwyjUlUD9XhrsIm71+KUllKIrhm/gpYv27ffKIXCtlA31TP9opJxIk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6rHU1iG9VV9Apq8DoQBN5PPVouSTpd/EttM3HjdJYcEdSyGOe
	OnZuUlJnIpAzyIkAwyhYH8NfQsZOkfmNUJtAGnVM3WVfdq5RSvphoLIiTmMMuOHmiqxoXGS5KMG
	s0yEo6xWB8V+NRTTM81dh4oTpPaE=
X-Gm-Gg: ASbGncvphEyGp/3bCUOYsQuCWLtG0EHVRM7O1OMs6PhYQ58lpqzJr3Cy+OMmoWDp5Mq
	G4zD5juJZEjxok6c/RSSELiNG6g43q//EUOfPOLMYo4DDpODZ5rHSMCQwzVOgAdUS5EhyZjIfvE
	b8gd3bUUDRaah6xJS/H76lDg==
X-Google-Smtp-Source: AGHT+IHNdRDDCkNPMCQPVOMIJFLxy2Rn/DmGrNa5Qiist6NyTZ7EYMUFG7UDfR4A8e66olcb9KNltjgQKOTJhDVu8qg=
X-Received: by 2002:a05:6512:3d89:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54d6e61a9bdmr2967588e87.3.1745199817687; Sun, 20 Apr 2025
 18:43:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413-tegra-cec-v4-0-b6337b66ccad@gmail.com>
In-Reply-To: <20250413-tegra-cec-v4-0-b6337b66ccad@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 20 Apr 2025 20:43:26 -0500
X-Gm-Features: ATxdqUFyihmJ0tUQEv8u_PoNpcqZdxte4yh-YD150uJwUoMIq9SpK5CAACPvM5s
Message-ID: <CALHNRZ-+4cVgK0FAuPir2-m4O2Kvib=VBXL4E9kVjvxx0e1B=Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Tegra CEC Updates
To: webgeek1234@gmail.com
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 2:35=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> This series updates Tegra hdmi cec support to be usable out of the box
> on Tegra210 through Tegra194.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v4:
> - Fix review comment on patch 1
> - Link to v3: https://lore.kernel.org/r/20250409-tegra-cec-v3-0-91640131d=
fa2@gmail.com
>
> Changes in v3:
> - Update patch 1 to fix lint warnings
> - Link to v2: https://lore.kernel.org/r/20250408-tegra-cec-v2-0-2f004fdf8=
4e8@gmail.com
>
> Changes in v2:
> - Dropped patch 2, per request
> - Added change to declare fallback compatibles instead, as per request
> - Update patch 1 to allow fallback compatibles
> - Link to v1: https://lore.kernel.org/r/20250407-tegra-cec-v1-0-e25dd9577=
b5f@gmail.com
>
> ---
> Aaron Kling (4):
>       media: dt-bindings: Document Tegra186 and Tegra194 cec
>       arm64: tegra: Add fallback cec compatibles
>       arm64: tegra: Add CEC controller on Tegra210
>       arm64: tegra: Wire up cec to devkits
>
>  .../devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml | 14 ++++++++=
++----
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts         |  6 ++++++
>  .../boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts     |  6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi                   |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts         |  6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi        |  6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi                   |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts         |  6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts         |  6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi                   |  9 ++++++++=
+
>  10 files changed, 57 insertions(+), 6 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250407-tegra-cec-7e3a7bef456f
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>

Friendly reminder about this series.

Sincerely,
Aaron Kling

