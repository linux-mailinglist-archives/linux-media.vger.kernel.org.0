Return-Path: <linux-media+bounces-15274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1442939417
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 21:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1559B219C6
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 19:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AFA17085D;
	Mon, 22 Jul 2024 19:19:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CF01C695;
	Mon, 22 Jul 2024 19:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721675976; cv=none; b=mxcW8dvuJebs61dTprRDReWNBl8AgKQKjkY1bwukr0/8lu6TUvv1vG/BS98Pb+ldgMTVc7oOi7AawQldiuE6HedKOagmA0blJfJLb4tNz/4VqxCrerv40ndTKupW3TYquAuX+DRkSywL/sySK/zyoW3Yi98u+CTJkBvQZ9JH57U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721675976; c=relaxed/simple;
	bh=F6tdgoxHmbHywL1bTJUHvCgNS0eivvXkjsomsnH/DUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdiAdlb+ImKimW+tF+Xp0Kz/4GwwFtLE7gQ9LEI6UMs/BTYtbDkkV8idf1/C7lWzTQRzmZNhvva5nigz3Lt130PMhPSFLTKIe75PE/6ktjvO8XElycArRP5p0A8WLAHXUi4ysMwoaGHUzVTxbgobmPHRNTvIGQrLuAHJMtFadKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-661d7e68e89so33940877b3.0;
        Mon, 22 Jul 2024 12:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721675973; x=1722280773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAErRK34Xe8ThdBPmcqB8a+EFP80SYmedsGYuAMjeXE=;
        b=wXmwyjYkz/LbkKH8mKKvQLf3Vwoh03mZ3ICkDTpMi4PCQDg6S2BcW/ywdf6CTuKIt6
         Bt9pSCJAeHIRpFxMTIfLrUS2e9FpsDSUQCIP8OT2Ajn4mFzSgha74Oopg33CJJCiO8qv
         U+hazyKgxTy81/9UuT+1/Yhv4BgGpfGijmx4IUKSz3MMzaADYYXIjyHEp6QW5bG9ZKKB
         IXi/wI3gE9+v1xvUtjAc3HsINQCQ0ORG2+zsUZbTJPAELT2ZtQ05FMGUBh/BVqE4f1RL
         QjRHzHrcFgjwtjZPrbH04K/EnRhvMR0KqHRzHMH5ilDlTf+PGIjidmTpL9Wd4trlc6no
         GVzg==
X-Forwarded-Encrypted: i=1; AJvYcCVam5co5Iq835/vzVqoNEwcMh9/GA1WO+Zf6femp/L4PhxFzR0++XtY/Q2H0oCO4q71etpFoyNvEwLpBz5bp8HhM1x8FoZZcBmHsdZaQ3reMR2sUGXDxw3lZPaG91EFTbmaRgy4Ljq4D4A=
X-Gm-Message-State: AOJu0YwPwn6gesfMLejBaBc01VMTah+bjZUEbxEazppqoNlgx13dR6Mm
	xySn+AS5zpyFJNG5DzHn7mpfEucFagGlLrtfZd8O7FKcqbXgD+Lr5FBbXcfS
X-Google-Smtp-Source: AGHT+IGIHOm4F1mrGs+YS/ekkWXxwBO6UcDCWrhDRFvTqHfP+zJ5LwlOHfBGGEgDOLd7R8bwtHBMiA==
X-Received: by 2002:a05:690c:4988:b0:64a:8adc:f978 with SMTP id 00721157ae682-66a678c644fmr54452517b3.12.1721675973298;
        Mon, 22 Jul 2024 12:19:33 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-66953bd542dsm17565727b3.86.2024.07.22.12.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 12:19:33 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-65f7bd30546so34090097b3.1;
        Mon, 22 Jul 2024 12:19:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWdXKN7yBe46n3nNoirNmI+CKeLdK7ElIN1Z/mnOwUawbA/nk+m/Xy6hoKQBYETFO31dmci++fdO263GWXDgvKCEP1u6mt/ZAO49dfX1bty3HUrdd09W5GlHytMJsqdy0T06B014E6w0I=
X-Received: by 2002:a81:7c0b:0:b0:651:ee07:76c with SMTP id
 00721157ae682-66609d6a8d9mr102480547b3.15.1721675972917; Mon, 22 Jul 2024
 12:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8e1c6c3a32919603072bb7278c66b4d469f7e762.1721661958.git.geert+renesas@glider.be>
 <ol5jiqwo26s6nrl3a3x4qcs7etxkbzbaz24lah2vgdsfj7qifr@5wnrk3tjr6n4>
In-Reply-To: <ol5jiqwo26s6nrl3a3x4qcs7etxkbzbaz24lah2vgdsfj7qifr@5wnrk3tjr6n4>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jul 2024 21:19:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzoVDzw34mYP2_R9bo3JTC36-j-=wV7LPfApNut2ngNg@mail.gmail.com>
Message-ID: <CAMuHMdWzoVDzw34mYP2_R9bo3JTC36-j-=wV7LPfApNut2ngNg@mail.gmail.com>
Subject: Re: [PATCH] media: raspberrypi: VIDEO_RASPBERRYPI_PISP_BE should
 depend on ARCH_BCM2835
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Naushir Patuck <naush@raspberrypi.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, David Plowman <david.plowman@raspberrypi.com>, 
	linux-media@vger.kernel.org, kernel-list@raspberrypi.com, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Mon, Jul 22, 2024 at 5:59=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> On Mon, Jul 22, 2024 at 05:28:28PM GMT, Geert Uytterhoeven wrote:
> > Currently, the Raspberry Pi PiSP Backend (BE) ISP is only present on th=
e
> > Broadcom BCM2712-based Raspberry Pi 5.  Hence add a dependency on
>                                         ^ nit: double space

Yep, double space after a full stop.

> > ARCH_BCM2835, to prevent asking the user about this driver when
> > configuring a kernel without Broadcom BCM2835 family support.  The
>
> double space before "The" as well

Likewise.

> Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks!

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

