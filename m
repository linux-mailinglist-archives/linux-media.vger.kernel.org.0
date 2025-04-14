Return-Path: <linux-media+bounces-30107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A7A8793D
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7FC171CAF
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8EA2676D0;
	Mon, 14 Apr 2025 07:40:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61CC25A34F;
	Mon, 14 Apr 2025 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616439; cv=none; b=tq4I2XqvOC0KrP/N6jT9zF2eC6kLKGBd0iux99FytfqOSOPKGJ3aWcTV5vbdoX6RFZnGqN6s1pAPgbLbhWxKYCly0Yt1TSQhaiOyYJ8T7kVorudExDbYkDKfxCEF3t9sHQ05VHwEqgm3Eahrg2B6Qnv1NfdqLvFD4NdyWIinpqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616439; c=relaxed/simple;
	bh=Ct3vfTLORykoP6RIltuCN5Ld0Dvk7nT0g1EVMJ2ROzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3m2bXgXEWL7d4NFjHDs+lf1ZWq+NJAh3MgZ6jSQHMvSw1MWvrMLENdKb4WIMfpDtFfsP5BkeClVHR3E34X0guMjv0tO5XbHCygIFKTtIBnw7AP9oR3NxqLmHridoqU+9zwwFg5V7XjqqTFxQb9OVG1kLqplHqSHnkVx25wz1DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86fab198f8eso1674672241.1;
        Mon, 14 Apr 2025 00:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616435; x=1745221235;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LzE+zgFtgedhb6W2N26UzNrxZkj97rEyrUJHMyxVqA=;
        b=KSbcLQsz3eS1vmLJxjx24YI9SmP7oSLLb53dBNL4e4oezeqMOei5/N+r+b7/rb1HwX
         eHXRQpmAEuEZbRlT8YOqxktbnJCbwxQRx+XLYzMjtIpPcewsbCbpQ18HZzZv9smHRapr
         w79qOtgwXl4hKIEXyhTURkgCdFKo4gdQuXgT0+4c2GDfQdyl59Ul+03Ss/0NcrPPfOW+
         nKE2DKSXJaxcLcBJ4pO6Ani61nTvWIAaWYeuBbWdnxhDfJeWFPy1HgmH/mQWbOanvYvg
         WCjBvilmY+GMoS1hzHBAJvil0hc3leqsVTOO2sBELgg8FzxFOvIU75tk9kFAUQv3Z7pH
         r4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0BRxZ9c1f//JBBy6LyndqkRmBCBDiZtVMoeRwffD3cuqFJAvjlDdhGKgCxAf4S8GozlNmj4NUyeuOSWscqzF1zgA=@vger.kernel.org, AJvYcCUTSvoMn48fFWM3pj9px9BHsTT8DK8qlf8wtHNqMxdAHVmu8Nar+cC/k/eyWt3nwY7cicNw6y8E8PxB@vger.kernel.org, AJvYcCUy6f67+mhSzHKvqeEo0pS1L3Zs0/aPIqZMDBuUsPQHP1Lm7AMeEZH+ZZ0o4NPcphXj/Ge8dz+FKwxzkCI=@vger.kernel.org, AJvYcCVMtZhh43Vy+lijUbTxzQO2bbLvRplZpZnrd2hZ1vibcwRWISgs4Q7am5BFKqaYrUnCCLzfhF19U7/JPqu8@vger.kernel.org
X-Gm-Message-State: AOJu0YxAazFzwbx94fOKDIc/KYED7TZqBIYBJ41l5hRTLSQj4i9iCKGY
	zF1KKGUL1a864t3YoabuJqN4qLyRvAqJVuA5qDqzCVHUX7mSaDP81X1+Jpao
X-Gm-Gg: ASbGncvlT3syerNMOuogg+Mxoa9wujor9iBRogctHl9e811eoTK5atQEMQU6yXLvVXg
	cq9bmoiuKDSx4CrQKtfAvFeSqSny3WKWdNnzd8z5vGHtm1XVc4pJW+0bIeqvPCgIuns2ULLvCpt
	i7FXi0fEyWyJ5e7r37upZKeUvmcDNoMsVrs8vu944yWalvlNEIZjkITfMYrCFspmu2uNBLBzLoF
	q/qAmgHUvltCMS2oFBMoBGpKV0SuGorn2qNuIV1lsfxUOv6IaAnnsVmefv1eFNWar2ydTgXqETg
	Ei9JZOI8lF50acCRj/7eN6/dHGATJdxUEQr7dvAps0KuV4oUKii0eDoZqx6a2SKiIXYT2wo3T4Z
	e6OgV/+S+9YcOXw==
X-Google-Smtp-Source: AGHT+IEmSxgIs11VPganL2YjUtMongGxb1dYEaaXeFFF7N067673asbk1sPHbgmTa3l2Zlm4j+SSMw==
X-Received: by 2002:a05:6102:4407:b0:4c8:55b8:6fad with SMTP id ada2fe7eead31-4c9e5003037mr6871923137.17.1744616434659;
        Mon, 14 Apr 2025 00:40:34 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-875571374c5sm2099244241.11.2025.04.14.00.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 00:40:34 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86fab198f8eso1674657241.1;
        Mon, 14 Apr 2025 00:40:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjCrKVyMmcNJVoD75geAZU30SyiiNVvA7X9CkJPZnXhqmyY+Pabhbsb0jViVK1fhp8Nr/9/b2KMMF5@vger.kernel.org, AJvYcCUnDjS7/WRFLFd9jGcSPeqI2mZdTj+GH/U7ELUYL6X2xA12Cnt1KIZYoaRR2EhDtEg4ZgzGXih775FCoYk=@vger.kernel.org, AJvYcCUyqAHhJk+jGCroOdfGszEoJsgihfCU2/JRG64zMXp26GD3FQ0Ae7YrDfmByvLGdl4zp0Tp4Uw8s6HQPxovXuScLuc=@vger.kernel.org, AJvYcCWLCAdvfbTbqnFyJhEGeR5tL+1x4OOrosDs2pwTyoD1bTUJivrCmsjo02xJK5pWRqxw/z3ydW8R/zWn8dmi@vger.kernel.org
X-Received: by 2002:a05:6102:1496:b0:4c2:2beb:b726 with SMTP id
 ada2fe7eead31-4c9e4eec0a6mr7199015137.10.1744616433816; Mon, 14 Apr 2025
 00:40:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Apr 2025 09:40:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNGPTD=hPPZ1KxPYrJrokZJyydDreevABDt+yZpm-e7A@mail.gmail.com>
X-Gm-Features: ATxdqUFpjXsSuwhsVa5xMC42Ipema_d7yp3wp2dKsq6N99JJxJ9xMHZcx2GotOU
Message-ID: <CAMuHMdWNGPTD=hPPZ1KxPYrJrokZJyydDreevABDt+yZpm-e7A@mail.gmail.com>
Subject: Re: [PATCH v7 00/17] media: rzg2l-cru: Add support for RZ/G3E (CSI2, CRU)
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Fri, 11 Apr 2025 at 19:06, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> In preparation of supporting the CRU/CSI2 IPs found into the Renesas RZ/G3E
> SoC, this series adds driver/dt-bindings support.
> This adds also some minor fixes into rzg2l-csi2 and rzg2l-core drivers.

[...]

Thanks for the update!

Can you please summarize what was changed in v7, compared to v6
which you posted just one day earlier?
Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

