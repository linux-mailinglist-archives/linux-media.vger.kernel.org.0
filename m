Return-Path: <linux-media+bounces-35165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 421A4ADE977
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 13:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A910E189D6C5
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 11:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358E12877DA;
	Wed, 18 Jun 2025 11:00:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F485286D5F;
	Wed, 18 Jun 2025 11:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750244413; cv=none; b=KEMoMlR5zeyw9NOwhzW3W2KISqcbv02vqKRhF67ohXQ+/f21UdrG3nCfJq/GBlekPpOJs7iIH9d4147rqKA4xuXpcKnFlhRTLns0oRvm7xkzPeiWWR2fVV2K2iV3bl5f7PjPtKefv83uqkgXauEphLNa+sd2BRnS4mxPWi8MuSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750244413; c=relaxed/simple;
	bh=fcqmySiAxgH1p25v8bAr7GkQqhAkvOFUCTybvCND8y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I20qzNCE6Km8gf6afdbNLJCAYpVPRO1yMq64UETHT70Lx/nG63XWslmr7+KKtzvQ7+7lY6SpeyeZkHUzk+xtFKkj+CTy6criWHVV8AIAt8sWUiDsRuE/BsyPHcs0oEbQ2y5K32Y7emPTnY+owtwQVEU0qsmz4ylIFkTwPUnr3/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-528ce9731dbso1448495e0c.0;
        Wed, 18 Jun 2025 04:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750244411; x=1750849211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vF5z62EcBdkEovQwBEsneqpM7mwYIGWcugi0Sew1IO8=;
        b=EAhTcFOHOih5K4L89xG1wf6p1A4vGEy44hnSuCD5DlBD8Rl6Dm+FeaDQssYVPvFZ+X
         y98PIsGHc/g4h/KIDLDAb94RRpUx51MkV59L+1FtO6pNqJKwhqMUYPiR2rZMTsEXHwM/
         u8QXqM7hL7k1C7iOpUtDc0vthPQkDRm0m1aOsbB2Ngp70NBph7cEiB+TzQaeRWU2cfLr
         ghlA00SematimpX0ywpQ5+7gmlEnXN/YRCJ63RLNuq0likdiMe0Fm+jWRxF75pY/6oAt
         fcP0Yj+6N2qPT122MLymWW7B1vPPfvRpdyAl02xLHFM/hSCPrmDE1NY9CbYUmM/qWSl5
         ueVg==
X-Forwarded-Encrypted: i=1; AJvYcCUKK8WD7ehAk6xUibwbYzH26+Ki2N3v5ydkZO8bgvq9UzPFkK7Tw4oRkeyvA87GUfyyjxYCFbVlbGEhXA==@vger.kernel.org, AJvYcCVA4Qoh0W/VbCNnD2kVsGlkoh+UkgBW6IzdCwnuv2aemgVyivNkEJSOCquqzFJqsQlHrxjPdMWItZvNXdDOBX4UfGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBB5RAD6nEsBIQDec1qVvDmQCWv+xPZgqzWCQEGAG9N/07WeS7
	zgLYItuBzyFvHXM796rVZx+OSRS6cM/L7w0BMFRFmUuefMb+0LnvM2IZNhz3bGG6
X-Gm-Gg: ASbGncvyMBP3ldB7zDMED1IAgL5SeTrAWO65ipaqmg/ROrMzuXdFpkCZv5eAbc2UzVx
	GQXvKg/C2j6Y7CsDgaLW9tCQYze9xo9EOpk2DNlqK+aE3bDya8GSyJbigcCF+tfjNEkaMRnKX/8
	zatYRp17wTigie1seBa3vN1xeUmEvWOpcbxVZRQu5l6InG+xKHXfWtTsbOFVwEarTQy9wdz9LaO
	6M67ZkdRYRdX4x2NlEjENl4oDUJeaJ0arA7VtVx8TfP5GKakEYJ+logQV0WNlRwMVfbSYAy5cQd
	V3m/DSvurmoVNFLXRjKRdyRy/tniaLQRdSyOLzdVgiRRexIVAo/8LEZiowHKVEjyRFX+gf+1SH7
	m+pPhWuOuiX3dCWxej05okNhG
X-Google-Smtp-Source: AGHT+IEz0b9PkjuCSs0CUYNhPgRAcn8kh7JNSTjctBEojb7N/tqE4ZXvGaqlGwb3WcjL0bX3qQnQ6w==
X-Received: by 2002:a05:6122:547:b0:531:2906:7524 with SMTP id 71dfb90a1353d-53149ae3d1bmr12572310e0c.6.1750244410732;
        Wed, 18 Jun 2025 04:00:10 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313e05f3f7sm1998699e0c.47.2025.06.18.04.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 04:00:10 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e79de9da3fso1956338137.1;
        Wed, 18 Jun 2025 04:00:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjU3qA8hJfxcR8mJIl94BPxxL29N8jojXgzsH5qHo6d5P9+cD2PX5Am1Az5z+P+cWSamxOsnamv3LN2g==@vger.kernel.org, AJvYcCWeC62z0mrztMMQdgX/Lrw2CQQMCYz6iaMZj/bJz4O/ZO72yZOZ44h+PvpnJCLv2es/iHQwEAHln6NY3KaC5l44K04=@vger.kernel.org
X-Received: by 2002:a05:6102:149e:b0:4e7:bf04:412e with SMTP id
 ada2fe7eead31-4e7f5f6a398mr12433160137.0.1750244409939; Wed, 18 Jun 2025
 04:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-8-niklas.soderlund+renesas@ragnatech.se>
 <20250612231504.GE10542@pendragon.ideasonboard.com> <CAMuHMdWn01G-kyFgM+7e+TDaoN4ekSuM=c0kcByFLDsVBVvgwA@mail.gmail.com>
 <20250618085840.GD28826@pendragon.ideasonboard.com>
In-Reply-To: <20250618085840.GD28826@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jun 2025 12:59:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFH9iKGOsgMt+nqSMFCg-u3b=iTWeqP0tWeuYWseLbtA@mail.gmail.com>
X-Gm-Features: Ac12FXznMcqGdZWnsrklnJKOXMeU-UDvegX21ab7j8bqsOLeykNffSbHpElZsG8
Message-ID: <CAMuHMdXFH9iKGOsgMt+nqSMFCg-u3b=iTWeqP0tWeuYWseLbtA@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] media: rcar-vin: Merge all notifiers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Wed, 18 Jun 2025 at 10:58, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Jun 18, 2025 at 09:44:02AM +0200, Geert Uytterhoeven wrote:
> > On Tue, 17 Jun 2025 at 21:48, Laurent Pinchart

> > [ deleted 132 lines of quoted patch ]

> > Thanks, but please trim your replies, I had to scroll three times
> > through your email to find this ;-)
>
> I intentionally don't, as I find it annoying when people do :-)

I find it annoying to have to search for the needle in the
haystack, and I'm not alone:
https://elixir.bootlin.com/linux/v6.15.2/source/Documentation/process/submitting-patches.rst#L352

Thanks!

> > [ deleted 262 lines of quoted patch ]

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

