Return-Path: <linux-media+bounces-15363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5873D93D677
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 17:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 182B2283920
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 15:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D0217C7B2;
	Fri, 26 Jul 2024 15:59:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7181859;
	Fri, 26 Jul 2024 15:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722009549; cv=none; b=sIXPt/e5eJO+s8p1Ip9duvNn/sPcNQeOOFMgv7iEdYzfuwK982Iy/lYGLekm3WrUCoVTq/jesJztr+omaOwCKy9lcrejtPI1x8aMrOJlTS8pIb/eoKppmz2PPNGKDYUFaiuN8/l0cGEpjoIUaBE6dQ+lvO6j3LZ/Cxm4MTfMUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722009549; c=relaxed/simple;
	bh=crA37YaML+rXGrEsDITOoqspQjZQI9X9NlzNGhHIBX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQwYUp5duvPLBbmBDrpGWYH080hAu4mYvuarhdkVw7lyMiQZk7lxSaxBKuGgn9nvI6HiP0rgFrITNu+uEUTnBVeZ/CZaYnDWGDwOtghjtatI5eVDHNa/3zR0B7NXyxHHBRE1s7fSclOQA2RkRb4I6rwqoJ77yE96RYRnp7z3lr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6512866fa87so22084377b3.2;
        Fri, 26 Jul 2024 08:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722009545; x=1722614345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAC+MsDTv+DlN3mwJ29nUh+OmbwuhM01evF7KKXplsI=;
        b=quu5WnQ4KJGtiSWWxa46laFZjeKMOeoZujzU5tWNyVIovyFRWM0Utrut5f7rsuV2OT
         qwnz+fZBmt5hf2VKEybZkD66xAQ/SZxgBAxPjwaFD21n7+BWxaOCbzLVZPsIyE+dh5xX
         S6gRzl662aFtTDQKsoL2UxKGsIqa1fhC+cIgZh3IUzcqMDmUeH7o3IyNmBWU31EKxxud
         pmPJuDwiSmt65L+CJEAtOT4HEFDMBkJvayUMVttWNRbluiXZkj5alt8ZCp7A3LWSjBN3
         frjU2mPQkY2rGA+3HY57sBU9iylxi4tjBfUHajQt0Y6BuyWpiOtpyVeGhCXf16xltFgW
         CNAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFTtGAoYw15JxFEAFyFKydFrgP09G62q4kwLyY+rQ7w4jDrAYFCu5LWCsqVrEaaIBJLDr2ErLYi0JFdr4qLMBCOaP//fAHo86V2lYQDh4cmgiPgEI02QqlEzPUW3lEldbWixJ95XLBqrUHRmOtuFEHinBdeWESg9P51Vgy3syOm5XVUTlnLZFKqkI=
X-Gm-Message-State: AOJu0Yzd7i6FXWIZq6f8reN4JNt8U16iqBEyEq0knV800dz6ShYVhkIa
	l5ZjjBoI/Row8mJQwHpvF9QsgSfhOzpBg5D96JqFaCE5QYUchC92o+ERCJm6
X-Google-Smtp-Source: AGHT+IHWNXz37mNjh0Mw9SNhQ6qsE5KPtXvnTsholDRi/KuvcY4ZbM8MuyZXzaQsPRzRr+nH5/6iCA==
X-Received: by 2002:a81:8ac4:0:b0:66b:ae3b:3591 with SMTP id 00721157ae682-67a06442f27mr2603327b3.17.1722009545530;
        Fri, 26 Jul 2024 08:59:05 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b11a18csm9362097b3.99.2024.07.26.08.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 08:59:04 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6512866fa87so22083937b3.2;
        Fri, 26 Jul 2024 08:59:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsfz2xGUKOyuP3YDmcmP+/35TiJdI+9J6lU0EKoJOUJnSftWUbgdmpdc3csM34QC4mu2Ln916nMx1p7t77qzlBVUFKvwXQT4rG8ZbSQgjFi1yiiT1BQBEATNKZA1BeCc93khq8IZEg7uJd9PFVSh15ZFAIJrNPKecbdYj94zJNY4YOaXUScmIwFLQ=
X-Received: by 2002:a0d:c8c6:0:b0:64a:d5fd:f19e with SMTP id
 00721157ae682-67a04ffdb2emr2651627b3.3.1722009544487; Fri, 26 Jul 2024
 08:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com> <20240709135152.185042-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240709135152.185042-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 17:58:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrV1X+0GBLQG3SyAVckxnqhZt6vyx611i5R0vSm8p2Ug@mail.gmail.com>
Message-ID: <CAMuHMdVrV1X+0GBLQG3SyAVckxnqhZt6vyx611i5R0vSm8p2Ug@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] media: dt-bindings: media: renesas,vsp1: Document
 RZ/G2UL VSPD bindings
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 3:52=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Document VSPD found in RZ/G2UL SoC. The VSPD block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added Ack from Conor.

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

