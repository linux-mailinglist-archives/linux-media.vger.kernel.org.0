Return-Path: <linux-media+bounces-34626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B7BAD712B
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 15:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9D73B20F8
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 13:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A020F23E226;
	Thu, 12 Jun 2025 13:07:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A881123C51D;
	Thu, 12 Jun 2025 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733638; cv=none; b=IqovIDX83/h9qzgyBW6cWM00qeuhPzVYniSXWoGNNXi2JAwUEZdSv8iTCv14SZ0pT8O4XIJIYFPXcucT6R+xHjkiaTtjIyMsYhJwrp+vmY98oFXKI3auQXLSzqlkPv4i5IDVsHJN+2fw4BKy92Z3r4mbD6UQlhYpk90NCpgz7tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733638; c=relaxed/simple;
	bh=wBKRFq6rYxOSLdAisI+UzSf+xPxZDJpvacOyb5g4tI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PURNG6tAJpW0hfyySwpKvGLjMbrtvl09pTdYQO2SL5Ggo/0peHEqogkT68jP2vz9for5eOrwBRm4yXek6WvKd6e74r9T7AZCRaGH6X45fuejwcAjKk7yMAD6gaCGKstCkM2cvzFivUr1PG3U2uLinNm7Rf0+XjAmzhvrBWeaShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fabe9446a0so9357526d6.2;
        Thu, 12 Jun 2025 06:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749733635; x=1750338435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxG4XFj1ImjQQShhaVDyKBI2ecWh2m2KGH/gX/QkK2s=;
        b=icgoJLPwmmAiDB1wuR7koYaXO7i73dLT0wZQx6uJqFro9KvCVfyXECJd3msaq0+VPP
         PDgF+3gS2NrVdoYfiMZL5UMgg884tUz3xJkYmQiMCKVTHI0rUkVqzKnHSAr6rS+Mtiu3
         6XmSIESSueLRUOF4ZASQyjAnnafYHk9MnULMIpVxOn8uqFm0/OW4ezxlFDtKm3dmIiZG
         soUH0W+skggVFUDdZvZkOt0ZWpU3PB1+HOgrh2wO9k3Bs9AJYnvED5RcP6iPtaBe4FF4
         qKiCz6aY4ZiEyd0tVVS3qAkQkrOSv7R4q6YnCrjmg7cDMhp3tVnVee04LdwP52pKFywJ
         DGwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy68z8IjZv7gBR0lcWqS509g2lMzm73h3styZVxXsjMoWtxkyhBY2IFgBRatY9NZInr5OS3+Ye9xhZ@vger.kernel.org, AJvYcCWUYQBd+Q6WSORWEVwvCe9dK5Ue8NGLbBY5x2MWQ+lfd3Rcuq9WPerNJcTNtepvKlaV085Hig1hTPQ7+AnVA91dcBk=@vger.kernel.org, AJvYcCXHOaUQ7Z7EO7f1MKl8df/G6OlDASFiEhbT2MWDp/HqY4REMeVwSNBtHqTV6gtHzeTwvJx//qTtB+7oaH3b@vger.kernel.org, AJvYcCXzVzdle+8qKit7mNo4LkJ5Cr4Ai9KzSEP5o66FnGTwM8ceP3wUFXXEq/KEUGs2Oc4Yd0mlfLlGr0yCONE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCRU1BMHU1WNaHAWxTkdbHr28VY2UVy59TqIC2MqG9DcbVBAog
	dZtzLEM53IMEqedrzOurgvS4XAWRGNtP7Dud+KAwnu4pM2d3kilIwtdE2uiVTY66
X-Gm-Gg: ASbGncvnv7zOvPmob7Zeh8M5GNIyw1rwvBOoiOHx3vtX6jFg4FPj5TgeioM9lORMVHV
	w+Qz+UX9dId9zCMaGUVpe9d4PBBQa14Te50j4Vax2KsEVR0KpgTBLLbUaxG67bvysDBdlkIXFoD
	rC87JqniK5ADgMKP3Qe0gAhYSmqW3zKyNA8HQVhqPCIUgYomT9GjsO2NUND909HmyPo9d9o6HK5
	a9SNiar8BwUUORuPh0EvQs3nJ5vi6K3eSKeWkaw1PWw4CVDf0/hHdqRTg2lB4GR71i5mUnKos3P
	a8qXApbm5TIC/a1c9Qy0bli5FxdTbQgr3YHMreSZVmYYMcNsSpGw7rjD5SyNLotQp715Y0mTV01
	RxwnGh+BPmjVT1zqSFPqw0fi+
X-Google-Smtp-Source: AGHT+IFYvtZXV7JvfDrZ0aDzYSw3QxZORz/yxlpLP8B0BFPPSlaHs3PBEWd7Tu7m9W+eb6rpbCHdYQ==
X-Received: by 2002:ad4:5f45:0:b0:6fa:bba5:c617 with SMTP id 6a1803df08f44-6fb2c3284cbmr128319646d6.10.1749733634674;
        Thu, 12 Jun 2025 06:07:14 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c31c8csm9661026d6.65.2025.06.12.06.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:07:13 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fae04a3795so9061016d6.3;
        Thu, 12 Jun 2025 06:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0Q5IIFrmAbDrEsb/Q/4bBMFVJCbPDkV+Yv+OGlszofnBkLdl+2JHc2AkLJJbV4NVZ+MMlYoMdUEtMth8=@vger.kernel.org, AJvYcCVmu9BdVyIvkGtrwCLuJjwlCEhjJZ02pUaEIok++kQCtPQgR+mrqDXy0kHg6rH5hbt4YEOLQgE2kSn2bh70DnUvIgA=@vger.kernel.org, AJvYcCWLC57G9uRcNe+jwz3a3BCDsungwhGYyQe5/nqQyf5gXrzJAwyvTOqJHL9iVHc/ZTcnPMKD0S78pFEE@vger.kernel.org, AJvYcCWfgEGUjLPFOo1YpVpuRMIlJ7PBnxrJt+OjGtlt0WoT9a7fCuD89Ba+3ccwZmBxnrVJem0+BJXwWmZpKhXx@vger.kernel.org
X-Received: by 2002:ad4:5d41:0:b0:6fa:c492:2db7 with SMTP id
 6a1803df08f44-6fb2c32a622mr113612426d6.13.1749733633161; Thu, 12 Jun 2025
 06:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250530154148.374663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530154148.374663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 15:07:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtZLOPGHENxzvstwuwSufcyiz5MRyVm+PsYGzmCad4-Q@mail.gmail.com>
X-Gm-Features: AX0GCFtrpAFbKSjvDdgYmIswbQ09TJYJObCg2V7BVeFNJLdX6euTF6YacydZblk
Message-ID: <CAMuHMdWtZLOPGHENxzvstwuwSufcyiz5MRyVm+PsYGzmCad4-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: renesas,fcp: Document
 RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 17:41, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The FCPVD block on the RZ/V2N SoC is identical to the one found on the
> RZ/G2L SoC.
>
> No driver changes are required, as `renesas,fcpv` will be used as a
> fallback compatible string on the RZ/V2N SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

