Return-Path: <linux-media+bounces-34596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DECAD6C4F
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 096F5189E409
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F9F22D4F9;
	Thu, 12 Jun 2025 09:33:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10BD22A1E6;
	Thu, 12 Jun 2025 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720834; cv=none; b=HKH3/ck9IxDR4XH8bKJ24f873HMRbOmww9peBBcvY6oN+n9CYcHpsRVgQddxxaN4KbFkrrDZU6rDA+uI7Sdd3DPASXTg12W6yF5dFt/l/0nPPsZtSiaATZqpMxfAVwBaFS0ZrIkUhgcKXP8I/Kgr/2KtQiVwaXn4XsCygurU6Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720834; c=relaxed/simple;
	bh=3ME4uAr82A5FCxKsaE3r3YBp3wrOVKkc2TwWb/wzwa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObV9cV+VtEdgb2qMPLsmBCG8sBgKc2qcIQxYSZS1Ji6sl22WmMu50QOaZUZAlsusclZpAgXs817OQc7V7qa06+gxnF2n2nVhqn6outkS2ea48FYcjy8od7lLH6vOpunjgbS9z/rbMzgX6q5N8rdeF2jaPr/DXAvj9b0eZ5OWHUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-525b44b7720so223028e0c.0;
        Thu, 12 Jun 2025 02:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749720831; x=1750325631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xmt7U++OOW6yZB65AZURgC6J9cCyi6Rv4N4Xo2Z9FpI=;
        b=UaTnMgYMHJrIX3SqEzh576K5GaChjo7N+lGHOPKHFys8pyvmMk5Mz8bRFG3U8I8NoT
         CNmlCcUNslhf+ybVkewrWyj7DUGxlAxzDEbSb5EyrUBVeWyx2kC4+TmZ7CrjD2AjQ4xC
         7BzuVQSjT9H2Th8faIGB3jz1U5SahqR0Q7OR7WM3rzrR527X8r4/V0pl1GFQYIT4a0Mp
         3e+iCusiwpEPOP77NP7HfXJcycmfgqY1aJLq04gCK415BzITkF096cn16Pthm8D+TzV9
         73mAnL1cSZq7uhBfXOWEGV+Vcr1rcxzfZYMSZkHDrhUjVYmN9lf+UhthZQ5NlJk8gAJ4
         8Xog==
X-Forwarded-Encrypted: i=1; AJvYcCVwgECzFfkrLJlrO/6J1DUaphfGP0YysmFtU2Opmma310Th7XqyPJQVJc6qLnCTKIur/Iw32W7QM06LHiOvNkgWH4s=@vger.kernel.org, AJvYcCWTrHPxazQMGEn4sX4XdiR52UuXC2KkxalU27IsRIirYGuNZibOmCtCWaKIawsmlTDMz4oYyd7QdgxyfCM=@vger.kernel.org, AJvYcCWsbEKh2xUfvOUU3SlvaC1al1xRf4+3kKjcXJkJ0GINHbVrNG0/F6SWPkbUrboFi1bH3/Vcn9kzP+9nhdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6DC1cuTgm2H2TgrhENGd284efH3JjecDmAx2ijE0QC9MrKrma
	w/1vB6RvdYVsHMunDOhyguwlrSqnyuPEZ95oY7/guFXNTYf2BRpT2st/poFhFTWf
X-Gm-Gg: ASbGnct+h0xYab6dTKzzR1kgNo8zQhkxTVkQtpu+305tBJE4a+yyZkXq764A3/x4kZ7
	eDsbIFJMIZKu2SYsb2DYiA164wUOgyccDlNVxe+O0go0cW9RLku+uZYe/BlDsZ8ZvUMyPKs7Y/W
	Zz2ixJclj57H6XIXBi+v5it6u4rbd14lCU0k0rEe6Z3J7TCNIf+cN384bqOipbCX0Yt95GUxNS9
	kE1cPSLwguLw4yNvTKu8w65Sl6ZzBTpADBTj0y40NkSIO+4XsPR+nh9UsuXzDTls7ijM2P0dq3P
	p257PIRJp8CEjLONUqFTlAcTiLKR+/JGw8QneffgKaf/2Hj2zLKlAXtjQsaAZpx6PBqowYFkWqo
	HMuQV6tOnShiTEHin9LqcPzLq
X-Google-Smtp-Source: AGHT+IGIm7TD1mgYxgSZaHW0X0Ilf89P5i4ewplfyZlGdK+qpe3j4IHGLfx8a6hJ8tBEVYY+QkUoqg==
X-Received: by 2002:a05:6122:2024:b0:530:5996:63a2 with SMTP id 71dfb90a1353d-5312ce5ba11mr3131133e0c.7.1749720831181;
        Thu, 12 Jun 2025 02:33:51 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f01259249sm228702241.9.2025.06.12.02.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 02:33:51 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87ecc02528aso186980241.2;
        Thu, 12 Jun 2025 02:33:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVA5v+s9xSIFX1LcnOF5TIPGbqCCjV9Ze4Jn/nBMqQftA5ZC6qt55kOipVjLCoYUq3Is8En6queJ7k87mrkBQu4ws=@vger.kernel.org, AJvYcCUr1pXq6ewsvwxKP+CB9nyKFEXoGRzeKIIVrbieOXw9CjcJt+UCJJ4BkdFLS9CKUbxUHEDsIkDMy9XqqXI=@vger.kernel.org, AJvYcCXftIYNvs5scKVLIVZ5Bp5kVdbOy121GylwN+nPE4y9XSAzfIChJdGvScWr7kXpFf4TrNhvC6nbhGQMU7s=@vger.kernel.org
X-Received: by 2002:a05:6102:41a0:b0:4e5:9fbe:79f1 with SMTP id
 ada2fe7eead31-4e7ccd99bfbmr2984995137.24.1749720830818; Thu, 12 Jun 2025
 02:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-2-9f17277ff1e2@ideasonboard.com> <20250611232956.GQ24465@pendragon.ideasonboard.com>
In-Reply-To: <20250611232956.GQ24465@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 11:33:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVU0JJDff539YBMhM8xNQVf5Ufiw1D9TXitzsGWXPBMAg@mail.gmail.com>
X-Gm-Features: AX0GCFtY_lX4OASbuVWIV2IK1zyzigbX0AJWMSKSYwfSLRBfpIvsSDPq1QLb6bM
Message-ID: <CAMuHMdVU0JJDff539YBMhM8xNQVf5Ufiw1D9TXitzsGWXPBMAg@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: vsp1: Reset FCP for VSPD
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Koji Matsuoka <koji.matsuoka.xm@renesas.com>, 
	LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent, Jacopo,

On Thu, 12 Jun 2025 at 09:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jun 09, 2025 at 09:01:43PM +0200, Jacopo Mondi wrote:
> > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> >
> > According to H/W manual v1.00, VSPD must be excecuted
> > FCP_RST.SOFTRST after VI6_SRESET.SRST. So this patch adds it.
> > VSPDL is not applicable.
>
> According to the R-Car Gen3 H/W manual v1.00, the FCP must be reset
> after resetting the VSPD, except for the VSPDL. Do so.

"Rev.1.00"

Stil, that is a very old version. "Rev.2.40" is 6 years younger...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

