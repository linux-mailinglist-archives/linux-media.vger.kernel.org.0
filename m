Return-Path: <linux-media+bounces-31325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 243E8AA0EAB
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 16:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62ED216E107
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 14:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9672D321E;
	Tue, 29 Apr 2025 14:25:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA6727CCD7;
	Tue, 29 Apr 2025 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936708; cv=none; b=sLfL8kS22KOK7INKX1NJH0eDtPcqzSzLmXuJByOXybqXR+fCE0ZWpUihLThWOmCZVX0/XKJhK8xaHiT0vLgZBknQFoqpiEFEp9ew2Z+WGMVjshP8a/XYZajnnrHq4gPfzlA3kMildtNRbh5aw9xaAxsHXgGVtj2Gt7ECK/gUEYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936708; c=relaxed/simple;
	bh=DX19r16KLz2YlQBtpGqVjz7Hv8n8PkjImtOOoYr43l8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5rz9hQmOnz3mwJJynG41yvK0dDB1dFqvYDAteotdn6kHg3/iF2Qo4z3C5OHnaOa9ySbWtd1yRIKfj04Zr9YgWfRbWNzPwVbB6ITJrr2XbeTmyPyKMG2ZCh/yoif8aFTWZnpYJLab/kFfy3NVGfp+Np1L1AQ15UYNTc6b1/BrsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5568355ffso554059285a.0;
        Tue, 29 Apr 2025 07:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745936704; x=1746541504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPRdC5iy2IMbXuhbS37MgOLZ/VT/r6x/KR0GknHB3LE=;
        b=szNrgc3eDC3i7VdZpS32yjFB02aHAGqTUm/knUNT204jOanpdpq+wborRcCJeYr5Yz
         XQ4GAnWVLTiQOGUtmxVOOBfeOkFFKGo1otNERgezOd1Jj686LAva5vHl+q2CBBYMPGqQ
         M5ySmo56hBB5eCbL1dTOqQ0fryhBn3Zg4kNRfN2rtzB2aT2IYsnP43S9K9k5n4+XucOG
         B4sJZL0WqEwTED5+meVEhubz3G2HGiP7i4BkXacIW8e0IwmN/c/4TYTlLMH4V4xBV0GK
         orEVGiOQOHKdXJ//CKMwa+Uv0FhwGBZGZzrHLm6ylnjuLpb6IyW72qOca8SUxjX3IYYL
         2ZeA==
X-Forwarded-Encrypted: i=1; AJvYcCU+McisDgWrwSiINQqe1BzM2f50xn3gdid2HzqrSjj28btgCEfCANw02Ovh2IsS3jtLxqVYFW26pbSNeeE=@vger.kernel.org, AJvYcCUrKDO7XrUrEbT2paFMWF87XPqziOOTJQKhtjkYXfBJVR7gD2XsN4qq3LRkiztgoji7Cf5Fff85g50LHV4=@vger.kernel.org, AJvYcCWbPaBgkPNuX+jlHptf9xRxO7/ZAywp4nNCzIVEUd8+ol77m9+2oCeLnytqcV/DyakByz/c2QFz0YkxIiWVWF1OERw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuhEDna0TDJYs2MdeHWW3HECLuTqBThreGr3Kqb9cKtiag8Y38
	GQmgfcV9CRvQ8o+w1kKPPk34G79JzzXR6oSBqcht5Dw3gUiPZDNfw0OCOia8
X-Gm-Gg: ASbGncuon5wKyKini2N3ck/2RyFtksVCB53LzK/BQRZ2s9urfOsVI02hV/9cwnYtJla
	3mdhz3ghn5m2M3WxLS1nzRPfJjb47yH8U4iQhJcugA67rX17aAn+1gxJhVBRyLaLMAcpTHdP+/s
	wOdty6P+ZoQuIsNM99Ya/FHrPk6jQBYqRa6GVyJJ3kEgv/S00jHGMDiRg7+PWZaRqRKnvzbGc5r
	LiTNFcdpgLOGKGHJ+lltr9U0/vqCgDz/TyBQsd/RtyHJ7YnCHUU+SxWNWtgmD3NLBYGdeYxXXEn
	N5rljhn1J8H+INXZ0YiksBD0SY3TPO0iGiTR4n7gFJqup1jNSY+sA3N2fYh8zpHMZSlDGC5Ur4x
	iR0l+9ttLkTgP4nPWnw==
X-Google-Smtp-Source: AGHT+IEfSypkfjJl3AO0hG44VdBvb+wJmWPi4X5qZLgUXKanArekPPbgIRA42HLRqCuJFIdS2OlXcQ==
X-Received: by 2002:a05:620a:f15:b0:7c5:4b6a:d862 with SMTP id af79cd13be357-7cabe6042d0mr403995485a.33.1745936703520;
        Tue, 29 Apr 2025 07:25:03 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958c91a6asm743795485a.17.2025.04.29.07.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:25:03 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c07cd527e4so655600485a.3;
        Tue, 29 Apr 2025 07:25:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxVfzdz6k9tCHVQhVMZHSNpbaO3feSCWBLW5OqJILCGKBSnJPvL9istNaqwwDFCzE88jBxKKHf5dZT2Hg=@vger.kernel.org, AJvYcCX+rnRdNsj9/0uKZSoiHQiJBFNWKSFEM7LKyNo6gjuTIE3kJUrEvywQxzhcNYI4y0NjTewvWHWuZtZuvyg=@vger.kernel.org, AJvYcCXPjIa8paWQyYAcgK//HUXcI8fn0D9/T2xC5i6/CxAAjUq/R+m0Ui4RxefItBtFzj3HDIwlUErtMQQE2jqGZTGC85I=@vger.kernel.org
X-Received: by 2002:a05:620a:298f:b0:7c5:ccc0:2382 with SMTP id
 af79cd13be357-7cabe664725mr414807985a.52.1745936702330; Tue, 29 Apr 2025
 07:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250429091609.9947-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250429091609.9947-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Apr 2025 16:24:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUamzW-EHWGTYkQ6kpd-9MCv--EEPEvLsEcTqhYD0tRKg@mail.gmail.com>
X-Gm-Features: ATxdqUG_PvP853fKenNijxNbhg8xA687vv2RiNUNugVRz_EZt1svi55PqUibURk
Message-ID: <CAMuHMdUamzW-EHWGTYkQ6kpd-9MCv--EEPEvLsEcTqhYD0tRKg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: renesas: rzg2l-cru: Simplify FIFO empty check
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 11:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Collapse FIFO empty helper into a single return statement by removing the
> redundant `if (amnfifopntr_w == amnfifopntr_r_y) return true;` path. Make
> `rzg2l_fifo_empty()` directly return `amnfifopntr_w == amnfifopntr_r_y`
> to improve readability without changing behavior.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.mountain/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

