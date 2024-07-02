Return-Path: <linux-media+bounces-14510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A3291F09F
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01A751C2149B
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 07:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5BD1487CE;
	Tue,  2 Jul 2024 07:58:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FBD55C1A;
	Tue,  2 Jul 2024 07:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719907133; cv=none; b=auTMrkmoaWs85K37KNmVOAdB6ocRDn5afbq6w2TiZmSw6KuZ7DsLwROGZCk+DUdBmhTEphhId3OZEM33pqMKxciy5mMnC9QTK4VKIYRQwI/ge9laYNg3qq6kOlB8dPDACwlmDT3D0r8XIxzPGH60UBn1/r0kP2uHZClU/eiHtP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719907133; c=relaxed/simple;
	bh=IisLH2oBRhtJOrVETNoSPuOiNx/XIqrSvKYNu4eJ/jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mtsEHteuxjxwJDb5+InYnxjwrFQvq+WzzJ88eSvmBiGPpimju4fwg1oCI0Gymw3FOYXepZM8qRd7M91WdLRwhtoAiApgH9esnNjvnAA7bef8mLv9wrhd+tHQlt+soJa7ZUyq2ai3/ZCm0D4gv/a+wynN+72iYcIQa95XbFiv2Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-64f4f96bbf9so11728007b3.2;
        Tue, 02 Jul 2024 00:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719907130; x=1720511930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mO8O5zgBP/PpSUSsJrGMd+bdSGPRfxLLaZZS1rFuVbY=;
        b=VsuAw9BkqgMtmTLb92K3xsA5zy9/AYKr2PRXTplQJDngd63IH3zMpDvsRc+eM3dPyX
         lwVJpMT8rTWmPtYPpt/etoAQ9aHhoRv3mUvku0Dy8sRLAjCSk8ZKZJoEU/sK6Hk1Jv7W
         K5UXamTxIKTiNRREMb2WahyoPUXIju1AhgyieYER37cWXuj+5Bq2LmYqdTIZ0jlqYH/b
         f4/2AaJw1mOiG/TkSTbQc5sPrwdMOWRjjQp7j99LhoTfl9BOiV1ph4sDIozeXOgGeiiN
         IBjlzdyjfaajExT1XYjmu+U/BE/w8YwoJiFb96mTUWBHGlpG7nfexrYcbxBv384ciIDN
         3sFA==
X-Forwarded-Encrypted: i=1; AJvYcCV/UoQYFI9Z51lBPjCEgLWK2JzsntPwne2WlJv+zeEqpWP8mzvzXxheGNOhjR0SU27ae9nvPwHNi9ApISN7FUeX7sM2Xp42OKove07WuZp5Q8O6dSClPscr1rDE0VKD/BNjMmJkeO3kMMM9vjgcrf/82dXPz4KndxNRVZR5vcvitq9xC5cLPBkwBXM=
X-Gm-Message-State: AOJu0YyDrJEkDW2pGR+LvdSW8MGRKs0YaMTekg0QFjXPGvdayZ9Te9B9
	sAiOfdjNq3yBywmyTdUxP4RuKWMGWkYBuK+WdqtQrPSxJEkVwcQiLp5LHTQ1
X-Google-Smtp-Source: AGHT+IGMUZ6qB/MBWCPLA3RZPlnwiui+Ehv/ucEjI/UixoyTCcpCXyz26khIgN+GHttceSF6ik7J+w==
X-Received: by 2002:a0d:eb93:0:b0:644:4b82:bb0a with SMTP id 00721157ae682-64c720b8173mr79440857b3.2.1719907130183;
        Tue, 02 Jul 2024 00:58:50 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9bf326desm16673117b3.114.2024.07.02.00.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 00:58:50 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-64b3655297aso33752977b3.1;
        Tue, 02 Jul 2024 00:58:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWp7lMzd//e18M0fsvRtyzZPxsskTPwITGeRosIE3KCgGAu/ZIQJRBQPGQoRO5tnONIVp5sk82nvzsrEA/YcjLLh8ttknrz8ouk5gHjL8tVGVrsMnH2PSrh93KdPCx5jlBdk4G5cDTq5fx+HrxgDqIt5N43Xt++QCmhEjItwxBSUnthNy1zy7eaTZc=
X-Received: by 2002:a05:690c:804:b0:64a:7d9b:934 with SMTP id
 00721157ae682-64c7277c728mr87346287b3.16.1719907129452; Tue, 02 Jul 2024
 00:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se> <20240624144108.1771189-6-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240624144108.1771189-6-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jul 2024 09:58:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWgtt6hvMqkxiH5zHBmdqO-dKtXBMBKVE-grQqBnm49w@mail.gmail.com>
Message-ID: <CAMuHMdUWgtt6hvMqkxiH5zHBmdqO-dKtXBMBKVE-grQqBnm49w@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: renesas: r8a779h0: Add family fallback
 for VIN IP
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 4:43=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The usage of the V4M VIN bindings where merged before the bindings where
> approved. At that time the family fallback compatible where not part of
> the bindings, add them.
>
> Fixes: 2bb78d9fb7c9 ("arm64: dts: renesas: r8a779h0: Add video capture no=
des")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v3
> - New in v4.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

