Return-Path: <linux-media+bounces-16987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5E96212E
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 09:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4F92284050
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 07:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540241591E8;
	Wed, 28 Aug 2024 07:33:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C2914A4DE;
	Wed, 28 Aug 2024 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830399; cv=none; b=dIFzHKge5xkj1i8rgRP3t6hn2wcITs4kr4DZMxvjin6HbSDESAv1DBS16o7LX0KQvGcJBLi2FM05tokPksoOvwGk2Jz8MvtigV+cGsaMTtvmhug5WelgtcqsIaCFTM/gybZ6NNoFyoeMeFeUZOe9zTJyHdiiLBmsAKWPXSysdUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830399; c=relaxed/simple;
	bh=lWaVD2xoVbNz7M+XVoZsL/Kbi8PcHnZL1tO807QwRCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eitf7+DS9wcIAB/wNDoIZmdmiJvAwfvqbdZ9nR53xptnF5sv9mVmOhZxx1jlcvmDWaIYzRplqW9J97WxjeRaEQ3TmPgFuYn2laFWfIdvWrN2u34s+lbzVaLtdZIrup24O9kOSKfL4yf5w4L4eaYBUkfYZj7TRz9Kt1o7NvrCkUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6b5c37a3138so57170897b3.1;
        Wed, 28 Aug 2024 00:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724830396; x=1725435196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnAffBKqMnLu3f8wh+RWtsFDmeg5p1TouWawZKfR+7I=;
        b=GQM1uPeVrQmNnjG/5Eyj8nkjgZMUe26CoV3knSEYRR+AySY5HpIxtZ8EqR69BpSfPb
         JIeo2N7WG7WUK9K5/Bv35X7b7kZ3Q1JsAgP5KVO5drkgrE3NDrRxKBf01nSagw8WCGv9
         JgXwwuR427BDGEivdz/kytbdq6UhAwUNE4Q0SN4XG8Jx3WB368s0qMdzis7wCwcbMWpS
         ViDcFxLm/nrqhOprWHlj2HcnoNmB8TxYhr7vGQnjGl+15aU0JUUt8+Gdj2H+PUT7dAOZ
         IWeoTyV+yodv1UORpTymQE/elJjtuOAGDnrh7NGQpih1KCp/935FIGgyWeTJCEpSRfok
         JC8A==
X-Forwarded-Encrypted: i=1; AJvYcCW2jzJ4GX4IQyTl4gWz98fPYzU+I+rcOWqIo/zcICFLIGSAY8hZFF/DWl7P2D42YNBBBpmkayatVPXb@vger.kernel.org, AJvYcCX75pksRkJU65wDniFEPlsgmoMpGsSm3y8UOR0k0ss4QoPDRc6l5oW576R4DmJiMsm2MIBzfS1/PKG/tKLDDtG0mTs=@vger.kernel.org, AJvYcCXXhy0xGDaCCM/xMcwvdwEJIdQh/PzQkSszealJgQfu6S39FZuqYXhHWFcV+YrMKxtw3kv5Xxcf8aSssyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ48qTLYYNp+HjQxP2otTSuha/ABzZfSjtvPZP3ILLn6H2dcbT
	thfyDKvefj+pRXqMceXm6mpD8L6MaswGUkrLGu2gryHRV+5Q8hWh4EvYTN+q
X-Google-Smtp-Source: AGHT+IFd/CoVkUVuQY4n+HOcok+6l6I7OJx3U3MH3CaPK6bwVXHhJgYHLVp6pMz9SpOGSLpca32rQg==
X-Received: by 2002:a05:690c:f81:b0:6cf:8d6f:2c17 with SMTP id 00721157ae682-6cf8d6f330bmr72282737b3.8.1724830396006;
        Wed, 28 Aug 2024 00:33:16 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39a756a6esm22429727b3.56.2024.08.28.00.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 00:33:15 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b5c37a3138so57170857b3.1;
        Wed, 28 Aug 2024 00:33:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdJ9jvpLZcg/UAbqRA1XreNvGuNn0ux6OT4zV5kxLf427rAdbvic4ig6pn7oNo/rsMz/WD9ALO8p5RYY7jbW2AJCs=@vger.kernel.org, AJvYcCUgCMlhd1T6wb4QHKOe59c4mUR/Tr7mXiLxepgnE20WFrk6J4BP2kGpPAj9r90ZXTty5/fEEApRYBqS@vger.kernel.org, AJvYcCVrPbTKitHvhBuw4l2821F2yv/usdud0CCPfzNtL0Prb91wqj0WhfRY1P5Nf44Z23d4+5RZGk/J+8OfpIk=@vger.kernel.org
X-Received: by 2002:a05:690c:15:b0:615:1ad2:1102 with SMTP id
 00721157ae682-6c625a4c7abmr216409677b3.11.1724830395503; Wed, 28 Aug 2024
 00:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se> <20240826144352.3026980-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240826144352.3026980-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 09:33:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKBY+NE97329ODMDgGBvKGOFdotgHN9kk8nCAPLvuH-g@mail.gmail.com>
Message-ID: <CAMuHMdWKBY+NE97329ODMDgGBvKGOFdotgHN9kk8nCAPLvuH-g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: renesas: r8a779a0: Add family fallback
 for CSISP IP
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 4:44=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> To make it easier to support new Gen4 SoCs add a family fallback
> compatible similar to what was done for VIN on Gen4.
>
> There is no functional change, but the addition of the family fallback
> in the bindings produces warnings for V3U for DTS checks if they are not
> added.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - New in v2.

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

