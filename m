Return-Path: <linux-media+bounces-33355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDA2AC3B19
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 10:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6785F1895A0F
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 08:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C76C1E1DE0;
	Mon, 26 May 2025 08:05:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7B11B0439;
	Mon, 26 May 2025 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246751; cv=none; b=HWezS5Xu7mgylgTHhwHkh87aS6Rp188aHYdIBZofvN5xXR45YpocKGCAa8XCvroXtZ7K0XaL6bU0+gEWJ32Qdmp0EEj8Nq77Z495nhp29oYupwtzAWfhWiOs+XrOuVvUOLRxOFbXDWwcIspZAc7AdggGv5/E1qCk8F1e+pPxHNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246751; c=relaxed/simple;
	bh=VAks8kelq3T1bF1cj0QNfQxuyzA2YkGqf6FnO2lYeYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJ3DFi5l6JWVA5xgCmV7ysyYmfHmpxvHEkH+sm55WGTHE+t/qfLp5WAH+sNUnM4aRylYf18j0kYcCXW4NJbak2tkU4xaPgnZ3UW3krtd1V4t5CKhSTyFv3Ej6rtHEBWnDGViafmmIszig06sGLvCbszkUf3D1lgyUi76gGuR+Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-527a2b89a11so661310e0c.2;
        Mon, 26 May 2025 01:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748246748; x=1748851548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZExsB6c5QDJ1XTRzVwWuTeLT5rh0r2AKMowtMpKktA=;
        b=cby/Yh6jYi3WpU8pmE9Zp6j8f0MA4jc4wTBehQZJFSQJR9/XPUv6foxXjikSV1P9yS
         sQDRwCxu9N2aZgSpYbQ5etSBifFL8+aKpL27ubKZAXhHz7+Gh76Ck2qnP8o+gKwF3a6S
         avre684meAUst4PewOlQyQw65xJer2WlEFmYvCtGYG2fGJ3Udan+O6ztIkcLXnWgCm9y
         gfD93D7npJ4GJ2e/+/uuNFnOT+VYO/QteF/rRd5yH66cV6MINjm/rXeKwfA3XIup/vwi
         STr9VrHCgT3eKP42OqA3Z2vs6nfgvIz4VdqMJCuC0y8S4L0mex/Y9jud2uXfm4NqZ9sV
         cb6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAa2qa5CJw/nbK63QB2yXNaDuucu0OTet6zMn+hsiTujRQ0rgqx9IetM3RlPceutkvwKtxccaWGrjHB/Y=@vger.kernel.org, AJvYcCVhQSw2EZeSb4Yk3/v+vUyN5ySqSVTYkBP3AS0IcweyexnBqIiX1q/64Jbtw8K3NrfmQiAUM2uYnwlegyjhg9ypQiY=@vger.kernel.org, AJvYcCWhratJEzOxh/g1w3o255uIQ7UOGKQnrOEQXdXoo7/L4wANNYniL7NPtHMzAOuBWCyEmRWNToc/1CnVDxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh9fbPBQIJCVdK/UEemXwW+DbhDnMNzkKceh9xOKAa7Af82IKa
	r1xPQCVQrLKeFAkpooEyGOl0y1qmgnF4PMNLfU0HHbjh3yY8mg54ZfvjjOFFkclF
X-Gm-Gg: ASbGnctEJsFMBN5PABzyCFTASPvd6d+cgnSrz+d6yHrGtF1TJPFxmSU7MD4ov40SDye
	hmeDZvM+/uVn7M0cSXN0Yx/5Lfz7iC2Ywgg9xDS5s+KRD3496simBsaCUUF4RAJQo9DhwRHd/q3
	glBtAMvaivXjwmylcXlW4kVChEF4HG4mRSdj969fFw6bdISu7YjKtXvYBhQRaX/Y/SXDjBElo0y
	iBK8ItY9nBNX5xjFmKeibkZuEpBTCCsdKxdRs4iTcdoAplFWk/tUuhrA6RBmAIg78jd17nWEFAp
	jxuW0GTmxRvJYdnq+ywcj4VbzcTjxcYKD1E8dFpDaDR2QQvvCIp0fTaR8fDqXhxAPKUgxvmDM9w
	rGXCsRMtxPw4u1Q==
X-Google-Smtp-Source: AGHT+IFqt+kNOXU/fUK2YfRkmNHuU3HzVNV8qFPCdwb0iQhdJqM30k5qEiQF2MbkYcnH6r0Uc0o5Jg==
X-Received: by 2002:a05:6122:30e4:b0:52a:791f:7e20 with SMTP id 71dfb90a1353d-52f2c4ca21fmr6157940e0c.4.1748246747737;
        Mon, 26 May 2025 01:05:47 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53011b001fesm75002e0c.18.2025.05.26.01.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:05:47 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4dfa5cee94fso304470137.1;
        Mon, 26 May 2025 01:05:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZaUY3MnM9YwHAmOhU8SCQbr5luXhsQ+TIlmtlkjKzjz8bGLxsOVjy+3F80vn+DJ8zl8GaXXhvTFvxIzg=@vger.kernel.org, AJvYcCVHJSxmzD+NgMCIngo0VcXBBVWlY60ooiax59OsE2JcP8zroWBDLa0XTfGfETylPr2otp/8y0OtPt6l39jjClL/368=@vger.kernel.org, AJvYcCX1bpJGvfGdOH4R+c3smEFG7FGNvrzU5leRrmu587I0n7x0N4ixzwlHJRCGVgn3rd1TXyVH9b15TyWh3YI=@vger.kernel.org
X-Received: by 2002:a05:6102:3e24:b0:4dd:ad88:b9bb with SMTP id
 ada2fe7eead31-4e424094745mr6288510137.10.1748246747377; Mon, 26 May 2025
 01:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526075236.13489-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250526075236.13489-1-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 May 2025 10:05:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeeYzJpw0KV+0jCys2hFGu6W3247dh92_jeAAznMy9-w@mail.gmail.com>
X-Gm-Features: AX0GCFudv3U8dEnoIEg69dXge7iYJr7SZXstqqV0oANNyqHo0hGk0mjtoQN8w1o
Message-ID: <CAMuHMdVeeYzJpw0KV+0jCys2hFGu6W3247dh92_jeAAznMy9-w@mail.gmail.com>
Subject: Re: [PATCH] media: rzg2l-cru: Fix typo in rzg2l_cru_of_id_table struct
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 May 2025 at 09:53, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Correct the misnamed .data member for the RZ/G2L CRU. Rename
> `rzgl2_cru_info` to `rzg2l_cru_info` to match the intended
> naming convention.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

