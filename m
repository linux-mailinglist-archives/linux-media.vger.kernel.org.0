Return-Path: <linux-media+bounces-26478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D893A3DD0D
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFE8A16DB26
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECF31FCF6D;
	Thu, 20 Feb 2025 14:36:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B3A1E32BD;
	Thu, 20 Feb 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740062201; cv=none; b=U0A6hGR7JdmzUxow4MGht0hIzNVCjg/uc693cQtRD8E38maTtVCref2Ufqb6BfaUjtI3yWoYq4pzpW56oc2Ej8MhN6wzTjmO57GufBwiGrOX6nk/5WTyDGQtTk/CBK7ZxxH5lVzp3mm3Mwf+xodVrtCfRPTzqEtAQZGKA/ZGvnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740062201; c=relaxed/simple;
	bh=jFVPJDOBUZyCdWk8xy5m/2iCATeanJQQE/XiObJ0FRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEG9uAibd/REwricEacSqaNsQANIjdwe/Lf4aQ0B894yNCFg76AQzz0NuoszuxxIK0J2Iau9v2X85BahMxRZDIZMR19hWsWhSHmolHIwQBebjGhQo0W1lj2YzL41cG1UleOi+47UNNh9CB/ybKLUwJYqvtKcb+icy6SqCpJbGL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51eb181331bso363684e0c.0;
        Thu, 20 Feb 2025 06:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740062197; x=1740666997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLsstvr+2wvMkW/NVaitwURxkfA+PbFMqhyTnZnrvpc=;
        b=ZKF2Sfs4ES3gbAhz0+bDJspnYd5SZyy1kyuXTy8a39zUuIzR2x9Xi1rBQcN6nwXi1W
         jrnkFkmHtYha4H6JezatcZSWCJorEYGWT5O2h1wSpRW6+CbJRPu9RFkmQg0hXDx8Cfop
         ph1veOYOH7735YMzwmRkpoAGfQtLjc0fenrgiWRjgV7M9j4T/hf6MUjBGnfpmRm0LKNJ
         AA0XZ95W9aX6g8LhidHGBbaMkc5gei4i188fLOh/eNyv58ngDBqJMi4HE+WlE1DtJNla
         sCA98ZbuC+D2oPipKjSOvTJHDSqA1Vs2imuy9J5M6y7PNTxQCPWoA+oUf8TyQYVfRagv
         Ur7w==
X-Forwarded-Encrypted: i=1; AJvYcCUah6QzFoWc5HyfDuPYfJPdqReGfLiXzfTp4Rq5fAiKF6/7g/cyWt2CvrYDBdTcGcCui8w9C7S6ky+5ZIw=@vger.kernel.org, AJvYcCX9+E0/0vwertYmQchkrkGNr3rFzCNr+03MgblOuCg0USFJPnsmjX4wCSaTgBFbFurPEKprMrI7M8Dh@vger.kernel.org, AJvYcCXBzVc1B1q3OI/EH261GdbYMQz4XOhCfpsoaVsDPbk1zi6mVbLeqp17bnuPygPJGZAyuiie+W2cz1oax6J+@vger.kernel.org, AJvYcCXiQaHfeS4+DYdcfdIs6iv58C/Hqo2swEFHR5UGiX5zLUSdtH0kvsx3ipjz4De9mD6lh+CRbm1A185g@vger.kernel.org
X-Gm-Message-State: AOJu0YyD6/Xzqk+ukh9zxC9mN24fuPAfG9f0iicBqJYq8Hl+BWcU/BK8
	p5OEJMDefxm16CRVuDCDihBVf8y4EGQeEJK915DEuJYwh355W1uIBl9zuQgu
X-Gm-Gg: ASbGncsS8qC944xWxjtYUo5/b6iUp6OO7FoXG2W3sTLDmugdJPn39m8pwxPwl3wsOg7
	SiQWA2DChPkZkOo8d0FdRgyGIP3uxPfznp2vn9FEz7JFX93j6A7ZDagB47Bb3bI6LXsQwn7sIX0
	xJVTJzrncLonBEmIoVLOUT2PGl+Fw1lDshn7wD1ej/c0pRV1HfD2PZiqbEdANcYhpUCqpZQkArS
	8c9yZkGDW78TQd1xycK6sAAAkCNgg7BGPm4wLqNs2CJzHCd5HyxYw/1lFX1VSQBYS9LiNR1ar0l
	x4diN5wotDW3+yTC+6bRlfdQpWQwLSvseenlFdV6H3Zp6S30WUQNUg==
X-Google-Smtp-Source: AGHT+IH5YgVuU+q5QxnBO53JMh0jrsv0/nOk5xWC5Cb/HT3jJaCRN90HJbP+AUcLIlFfnze9GtfCMg==
X-Received: by 2002:a05:6122:20a3:b0:520:6773:e5c5 with SMTP id 71dfb90a1353d-5209dbffe19mr11412455e0c.7.1740062197375;
        Thu, 20 Feb 2025 06:36:37 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520b9a3aca3sm2180924e0c.20.2025.02.20.06.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 06:36:37 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4be68eadf2fso338293137.1;
        Thu, 20 Feb 2025 06:36:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVG3GZgM9jyWUCJOPJjUpBfXkksjq9FA2SOH/EjnmPNsIljZ/QHFgDJmkWQPH/ZJwlG40dXJtNFs4mnOx0=@vger.kernel.org, AJvYcCVQgfaaweQ3ISbvVpAfvAX419mRai94+QX8VNKNQzhrSXP+g+3DVevQAZ2WJCmKjBTm+on++YlvA9f3@vger.kernel.org, AJvYcCVbmX8qAYvVkpGmnwpyNm2rb3EvovkCvSU8YN6l7+fNxbGreF9q0GElw0y2TrVEieALBEFhth8wBQsIZLuS@vger.kernel.org, AJvYcCX1ZbT8V5WM5qCcP5s42IwdX2YUNRsJfUS000Qup8MGmDxpV66Rkh6bBXUuPUYnbQdqS9w+CrzDYaa5@vger.kernel.org
X-Received: by 2002:a05:6102:2c88:b0:4bb:d7f0:6e74 with SMTP id
 ada2fe7eead31-4bd3fe4fbf8mr13157485137.21.1740062196923; Thu, 20 Feb 2025
 06:36:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com> <20250210114540.524790-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250210114540.524790-2-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 15:36:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXeKfFWQV8DDBY1dFEqsg5BstxXGXF8+OL8UEBSKHt3CQ@mail.gmail.com>
X-Gm-Features: AWEUYZnLFePd-1BqPnNONu7LKQ5aLnNkBdAFzP3SPXlTLKm6lkXDlAm8vW2tagc
Message-ID: <CAMuHMdXeKfFWQV8DDBY1dFEqsg5BstxXGXF8+OL8UEBSKHt3CQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] clk: renesas: r9a09g047: Add support for CRU0 clocks,
 and resets
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 12:46, Tommaso Merciai <tomm.merciai@gmail.com> wrote:
> Add support for CRU0 clocks and resets along with the corresponding
> divider.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

