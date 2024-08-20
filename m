Return-Path: <linux-media+bounces-16525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED05957FA4
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 09:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C4D21C22C10
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 07:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F658154C15;
	Tue, 20 Aug 2024 07:31:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB8618E343;
	Tue, 20 Aug 2024 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139060; cv=none; b=ARrfjBH2GjvkemuMk9l7olrcO2Ykett9bcqo9EBGR1huKM28S8DNIgGUHICB/rIpbSP5DHfcAz0Mko8GEKLiiymouXYHEFgOr0jPzdnDDJdN0zeHb1gLHq96bPbyOZU80A85I5eYL5TZdJ0KCaQJTo265XncNic2nv69HAz5lzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139060; c=relaxed/simple;
	bh=fW5KiLgzATrOa+ligv574e5DQ7kaqoG0Bdm83waIpz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sCz+uI3GXIOq0hH/ONs2E7FYJ99jWiTgFv2hPmiqSUUMmzjRf0vwpUn2iyUrTEgp3zKAFCTUfPG0WtDB5CEI04/lRaUh6OmsYpOlIVQpRFAT32X0mNMgwRBnqi2TXU1zV3t6wLn3PrEFByuNU+kbz0jQ1FokTU2LKP6+PLuKJ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e165825ebfdso227249276.0;
        Tue, 20 Aug 2024 00:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724139057; x=1724743857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0H50jTyoouDa6ORloLu1VqNTnkbwOR7/9zv3neReQk4=;
        b=xDalT8w9FmcsUF8Z8bBFUPWueB0WAUlZw0lsRoZjRTbBML9zqgp5fhG+XKiejqC3HN
         QVifHDLJp/M8V7mPMl6QYDmNr/B4988O1XZCtL+hwsDQW2wWxlbH3ReQoooYss/wQ9qn
         MyZ9fe3syEr2OP9oL3sXxiAyqJvngLG7EX+F+90JQ31xER0ZWRpUqUnZc5mgXdxdTets
         UOqwGrO8QFLvjAfmK8WCNPJMB5Us+MvyS/wqpr5wsJSqNREWcCpRM6cFoVwyrfbx0wP/
         D15224vP/b9U3Wg8Eoo8h/TaJUX7eD5ECPyXUXTMuHCWTu6hsYs2l69QboxXhjbFTjbc
         s+Eg==
X-Forwarded-Encrypted: i=1; AJvYcCW/IT8ygHYEEUwC0mKaFVzgwm9igpmxDp1T6LhRSZXPCD821M6NREBBf58nhS+sC1M5dRLhO0UbTXwYVFVnLXes3Yc=@vger.kernel.org, AJvYcCWETO9NkuxEKk9Ju2fv/CAd8KZb8OHRW+BCJiysowMs3sAE7H/D2PjHVIZ8e48eEyu6JkF4mvhskYIv@vger.kernel.org, AJvYcCWmR75/Qq9+pGNwUcZ2oyx/RhMyhspP/wFedPbGBpDnXzyruQ/VYhd3VthLKdINQ+pIOskeYlB0wuh2d3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc8Zj2JqGEm6C9GwrS+SP/1+mDfGzOXDOPGDiUCKk250bmIZGl
	Ozp6JsnfMPljKFVIcaPSVLpwGvAMyUBAbKEVyI4ffK/PupucWr75OqrjoGj3UnM=
X-Google-Smtp-Source: AGHT+IFX4TbIGxQ++lkADqTJzGN9yX43wgmlf510u+i3vvxQa9Gczn5nmVvPfn9GmBV5CSkBSOTOWg==
X-Received: by 2002:a05:6902:2312:b0:e0e:af13:b773 with SMTP id 3f1490d57ef6-e1180eed075mr13870714276.23.1724139056745;
        Tue, 20 Aug 2024 00:30:56 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1172008bdfsm2391745276.51.2024.08.20.00.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 00:30:56 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ba0527a2e7so18990807b3.2;
        Tue, 20 Aug 2024 00:30:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUg4iaSO9cK9Qroka2+ueCyVzdHzG9LMr99HsC9aBdbMWyihOWLnRqbW9Cz+V+WrLMSu959hQOdQ8b8@vger.kernel.org, AJvYcCWPwqGbzkKcd77zvtKMURVxpgOig5v4VNIlQ8bN5bSnfHDRPxxcWMPsrC6Lh01fNYRSolwBvF1Nku8LGbPtCz6Ko7w=@vger.kernel.org, AJvYcCXLY7P+7RQ8pdm2gHeDfJJwH8jne8qOoAdZ09GkzjeCsVZyZIy0V2GO7PvyDe7B7FXKnip5RKCvGgUTr3o=@vger.kernel.org
X-Received: by 2002:a05:690c:7013:b0:627:de70:f2f8 with SMTP id
 00721157ae682-6b1ba7e4845mr143768397b3.14.1724139056036; Tue, 20 Aug 2024
 00:30:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se> <20240704161620.1425409-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240704161620.1425409-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Aug 2024 09:30:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnzbWrOZeEJ-R3Lz_zFe4BjKGCBPOvme-5EPQ+PLpYxw@mail.gmail.com>
Message-ID: <CAMuHMdWnzbWrOZeEJ-R3Lz_zFe4BjKGCBPOvme-5EPQ+PLpYxw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] arm64: dts: renesas: r8a779a0: Add family fallback
 for VIN IP
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 6:16=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> To make it easier to support new Gen4 SoCs a family fallback compatible
> similar to what is used for Gen2 have been added to the VIN bindings.
> Add this fallback to the V3U DTSI.
>
> There is no functional change, but the addition of the family fallback
> in the bindings produces warnings for V3U for DTS checks if they are not
> added.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v4
> - New in v5.

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

