Return-Path: <linux-media+bounces-4432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C774984287D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 16:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59F66B2288F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 15:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A57823D3;
	Tue, 30 Jan 2024 15:56:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A89881AB9;
	Tue, 30 Jan 2024 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706630160; cv=none; b=CoNNXvSPCSy/ehHhwBhVA2zmKX0560ZLNFxe6b4MDC4CUwhmIcZn3VierZRoS0DcebsYm5an6tTJWPVEpfjbq9+R3Hm+L7m+Z4rKd0uzb/IRXy/UMtzZPM48dev9xA55uT131lj47qzyXFmHpBX9/A/L15zVYot5KnKVmFSeakA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706630160; c=relaxed/simple;
	bh=L1jfrPI6QJ3MUqMI9joGiZNlAIlci14JEGMA2yifzBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MO60t2lRDfx71IyK5t/WGgyOEzzZ9a8kZFTWgSyeXxkNCFVnc3bhLmBydFSa/1UT9OsLp8kjGxt2INcQoiEH1MJ7Ftw10b6JerVe4xWWlvHsjXtn7IkHj48BA2uPtHN9Wli9YoEDYCpZMj/ochycUgzXwnq/GJx50n4VO14rmwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60403c28ff6so1155977b3.1;
        Tue, 30 Jan 2024 07:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706630158; x=1707234958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuGKsC/Qb0iWtMpNOKS9WF0ULfacZ26+xBZVFiU6nPw=;
        b=qsSNennfm8UoIswJSRjyf5iPUV1hmwVE19yYRy/SUTmrYAmZ5SNQlbMEEw8aDfu9os
         q2YZ8kz5FBiVGG3iM0KZEJKh5OM46hLx1WtGKlTIxFZEa0uIRkn++TY6tynv0/TTFSku
         HGFJaJNSvMDXpGYZ2gbaUeBHIBpNN1pS2LIUpzx0UZRU2Xd+Kaz8hCPSR1vmg5Unqz7n
         65RiZtCO5uzAMVjDPEJOixkeJz5ccX2tZJjdSn4n6E3XS1NUzxdNvKlHiYAkJZh67fAB
         31WG3YQixghzNIr2+OJMZjKw7GoGeVBfAiQwv57sHwnnqbrQdHrP5svGLbKOIFlaYLU1
         V6cQ==
X-Gm-Message-State: AOJu0YxMMkNbms1prPb3SzZTy7cKL75NlcPkNGP92ZN9MIF0sU6RIUI9
	hBkgoCIHjLiDEj9WccBIIoS7tGM0DtHCL272KMDZoiMJi1H5UzNHFPhXQ+8rLtA=
X-Google-Smtp-Source: AGHT+IGYpQAHwCWpkJWzCsPciOYxY6jhHjUNh0Ec2bMYcgrExPcCZ+Dn4brg+xCokzUdDosKS1O9Ng==
X-Received: by 2002:a81:b187:0:b0:5ff:4b02:73b9 with SMTP id p129-20020a81b187000000b005ff4b0273b9mr6803940ywh.21.1706630157837;
        Tue, 30 Jan 2024 07:55:57 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id c72-20020a814e4b000000b006029c00d1d4sm3272344ywb.43.2024.01.30.07.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 07:55:57 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6002317a427so34119557b3.2;
        Tue, 30 Jan 2024 07:55:57 -0800 (PST)
X-Received: by 2002:a05:690c:f88:b0:602:cd33:533e with SMTP id
 df8-20020a05690c0f8800b00602cd33533emr8265544ywb.25.1706630156852; Tue, 30
 Jan 2024 07:55:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com> <20240126133116.121981-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240126133116.121981-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 16:55:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHTOrPh=rDX_Mc6F7aLGSOv4uxwMr_1w-Q1PXvpoxt4Q@mail.gmail.com>
Message-ID: <CAMuHMdXHTOrPh=rDX_Mc6F7aLGSOv4uxwMr_1w-Q1PXvpoxt4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/G2UL CSI-2 block
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 2:31=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Document the CSI-2 block which is part of CRU found in Renesas RZ/G2UL
> SoC.
>
> The CSI-2 block on the RZ/G2UL SoC is identical to one found on the
> RZ/G2L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v1->v2:
>  * Added Ack from Conor Dooley.
>  * Dropped driver reference from commit description.

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

