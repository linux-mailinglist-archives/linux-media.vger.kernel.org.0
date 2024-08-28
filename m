Return-Path: <linux-media+bounces-16986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6596212A
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 09:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1038B1C22F80
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 07:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9454A1591FC;
	Wed, 28 Aug 2024 07:32:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B430328DB;
	Wed, 28 Aug 2024 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830342; cv=none; b=K25NZBRSbunxwQE+EaTrWI/vwIzLbPFHSmqkGyXpE/rYDhybro5HIuU0yThz3hXQTimkIKC8I88iAQWVj7GdW7/2w6ZpQkTcRk3eR97XyDWsd3EJnhhKjb1ApkB74FGC4+29F8O6yKvuPRxnYPI4LAs1ELtovtRKwuB2vrbuqg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830342; c=relaxed/simple;
	bh=/rPBhO3HLSDANWT3IFWoqDavEcyRr4FZ11Cdw2c7/OY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNr8Yha1fBlsvzgd4i9T2TG0Wzw3ChAKRVbN25kqypMxi217EYvnqPYjw4t1V+loAtOFYnyTorg8gs/CLl7xaAw+52xCdErQ8ezG5s6Sd8OiEH+VL5Vj6lf3SN4t0lt/Amq5MlUezR9d1XB7bOjrlx5jCrHiUW8Us48+Wypv+SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6b99988b6ceso63064447b3.0;
        Wed, 28 Aug 2024 00:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724830339; x=1725435139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfMBAdZ2+1uCouqw8tuNCPL20ti0ukNzXqrUZnkeAsc=;
        b=CDW5Sr/cgbRSTkn8j7sSup90O4IXYrsi0/u5ca4cR4C05Vts1DJLM7nXdrqXWDOpmW
         aWf3OOHJ3S/UZgGqb/Fb+JzfKqJCd6K54U7cY0Koc/MU76olbKX1q8vF/MOhwjT61QRJ
         WbZbRpwO6+omsXzyRHGypJ9EtvkUt95QWFGvkVvEce4pT0b89X8FCawq8/eRfRuxOCFc
         LCTKY9zrVK2ogMSI8p34Fwf7oC1YYwLHPalMyx/+p1wP1wVZpGVxScq6wb8KpqswLD1Z
         zZC2wY30ewQdHGgjBjsjWbElOuzpBrTZVzdnxkl4AaJSwCD709Gh6xZGtNKH/9KZAIb3
         2JwA==
X-Forwarded-Encrypted: i=1; AJvYcCWqKurOT8Eg3jfiuuV3zjq9QDHLWTKP24AK7b1ubNvARCGoxxohbj1MRqglwenj1t8PR4JHuWOxLH2p@vger.kernel.org, AJvYcCX+axrY4qDudr1HEupGTlhwCcVU81j8Rk6nP1ndHYCwovhfUCpQuafJfviGQSDU4zsSZ/G4XUBo9KlAUaw=@vger.kernel.org, AJvYcCXGiZ331Bq0PTNm/+bQSs+pj8y9eN98qTy3PkmOFiZT3TuNyE3S2wSEvYOpSxSizx32jH07aRcHIQw9sg4GFNK0nbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7xb4t+2GDRiRS3LxyLB4KnMcHMEKhYsKzzM0oo7P6vKoggW8T
	EmgCnHHLu6Voh+Byd9y4lpnu8lFIjZyao8l5PxgTgzLvqeXgLPOQh/fUubRf
X-Google-Smtp-Source: AGHT+IEoSESO5l36iwTFgVofcmcdzpWa8eKIm8m+AblZ7kPmTUIaeigPc/nQwqURIMbTVgTt43263Q==
X-Received: by 2002:a05:690c:4288:b0:61b:3364:d193 with SMTP id 00721157ae682-6c6295314d9mr134735917b3.40.1724830338917;
        Wed, 28 Aug 2024 00:32:18 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39dd47b31sm22521287b3.115.2024.08.28.00.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 00:32:18 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-699ac6dbf24so56928957b3.3;
        Wed, 28 Aug 2024 00:32:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+UMNIVNXQhGCmqTkotwYZZsXDFCXpPQj9Gup5sKWE3VPnXeYJ+i8RGZrPwW9YOoUUDH6SclUonABwt5erLwrfzE4=@vger.kernel.org, AJvYcCXCgwvIPk4mmkVblAuLEbzlbRc/rrl09Wpz9CREqd44i3vy6PzSZEzLudGq/cNUOShuia9HShaT6MWT3U8=@vger.kernel.org, AJvYcCXLwYWOfIBIcbs9nVeT6I81BZ7XhBm5rqPpixcy1Vh9hZ1eH138k2ulUXzIHuH8sDZ1fPkxdApJHC4k@vger.kernel.org
X-Received: by 2002:a05:690c:ecb:b0:6ae:1e27:c994 with SMTP id
 00721157ae682-6c6248e8e21mr168941247b3.3.1724830338255; Wed, 28 Aug 2024
 00:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se> <20240826144352.3026980-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240826144352.3026980-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 09:32:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoD-xxrr=wB1qJRyP82JepwXch3sAk+yi1ua_LeL1X5A@mail.gmail.com>
Message-ID: <CAMuHMdXoD-xxrr=wB1qJRyP82JepwXch3sAk+yi1ua_LeL1X5A@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: renesas: r8a779g0: Add family fallback
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
> in the bindings produces warnings for V4H for DTS checks if they are not
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

