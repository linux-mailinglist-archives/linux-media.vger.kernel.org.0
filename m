Return-Path: <linux-media+bounces-15364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C293D67B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 18:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C451EB227D6
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 16:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F118517C208;
	Fri, 26 Jul 2024 16:00:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328D63CB;
	Fri, 26 Jul 2024 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722009611; cv=none; b=pMsLHAu6UWOaxOl0xhS3PLy64dqSpErZCbc/dk5dYz8XCGp52YSft9NFLC1QYwO8JitmSQi/uDqFw1NLJ2glFHxN5Us9eZB1rUguoVzzw4/PCTqvIts8UzzSqjnLiab8yiECFFnQ/5NNMDw2f9wXnLgnfpjFTqEi0JKmevUDgoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722009611; c=relaxed/simple;
	bh=dbk46o4klY563aZ0IIIucrpCdpuoSTX7A2aI9Q/uEhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEaSIALajsy4Il4AWkWQqxrTrnCeA/GWdys5J0BanriQhkwi9nwJYCbjeL0YohWyY7CAzJmjdBjMfVxKmK/FxCctrjjVpRKBb5pgMP0ZKsHJ7POHm42z+nsaQeNSDJ/Dx+vG5m2P/NXpqERxqcWwylrSGrqaGNJIaBPEuQN1miA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e05e94a979eso2508641276.0;
        Fri, 26 Jul 2024 09:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722009609; x=1722614409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Zr4zVf0tByiVUM8gJOjdG3+41nY7cH/+OyGeKVMZcs=;
        b=ED35GhXAS67DqrOjVRjyufGKPHW2AX3oFWXGQdkTo7wT1kZ3xhnmIC2qowajVusJvu
         77aCSZNFHKuSVKJlJb2MxzjEXn2x8/Y9QFiBNSzmKLIuRChvAwCwrSI1hmmfQZxW96mk
         aA74xqCBqjKJkv8Jtugput7x82vCAI+AvDjcFgp2ISVi6RS+P0HVrLwWhG+X9gfoqAMH
         dedONo3vT+F+JMkXYqghdFWgyG6B9u6YQtVt0Du/ABsp4z1ZLUbKyNuJ/ZKUEKB66efg
         AAEciHTIitkbTwWM+Sdwx6rcSPvZ0NCsLu4dxhnNttvDYQhOFXyHybplL6yJI+fRyxbS
         VFBA==
X-Forwarded-Encrypted: i=1; AJvYcCVx0GHzA90qKor3+w8qKHTyDRMsUOYRnU2HhyokXGseFX57Out9xl+BARel2P49Re+6/Es8RksYtokSnrKbkZuw3+bjRevSoWYv1TM10I2XPSlq5VFpHm9hdhlfNbKX2DuufvRVeoxFrnCorm9r4M1r3I7oJ5plCnNqEcaytkV+yYZ20jMr7R0rYbc=
X-Gm-Message-State: AOJu0YzOb6CkN8n7AQtAJ4PmEhITTe2EVG9l3ylSoe9oFweKVM92wLXv
	JDafvQSG9GPGDmkdOP3zp3O27e1TvP/S7AtEQcR3i//TUlVh/T4gr2/8FmZT
X-Google-Smtp-Source: AGHT+IEwIOyqRwhaZ8wuCvTsFjh6Kx5iqXKqR+SncCC00y9nxbh6osxgNFowNpCpkQF5V5CL/xPMKg==
X-Received: by 2002:a05:6902:c07:b0:e02:bef4:adcd with SMTP id 3f1490d57ef6-e0b5593bfddmr327276.17.1722009608660;
        Fri, 26 Jul 2024 09:00:08 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b2a70d3dfsm779745276.41.2024.07.26.09.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 09:00:06 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6518f8bc182so27575347b3.0;
        Fri, 26 Jul 2024 09:00:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWyusv5E37aqkoiZaqn3QQVUm5tBR8QhQ5wVdO5FnAcpqTbYKtoucI27j4goSb4/VtmU2p8Tgp6L6491IIjjeedRSAT0guy/YIBfLBEYvK6Kh1xT8jfUEw3YOrNgFob/FA8N3a6QjSbQlA8JiTC8UNRuortTMdbTyyHeQY4tSbtB99gI5ONidWJEw=
X-Received: by 2002:a05:690c:6c0a:b0:664:fd78:e3b3 with SMTP id
 00721157ae682-67a2934b6f5mr146507b3.5.1722009605355; Fri, 26 Jul 2024
 09:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com> <20240709135152.185042-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240709135152.185042-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 17:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViNLQkZFYrYzc5EW=oz7MRp8Rd7=nfbH1uFFS-3P3CoA@mail.gmail.com>
Message-ID: <CAMuHMdViNLQkZFYrYzc5EW=oz7MRp8Rd7=nfbH1uFFS-3P3CoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: dt-bindings: media: renesas,fcp: Document
 RZ/G2UL FCPVD bindings
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 3:52=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Document FCPVD found in RZ/G2UL SoC. FCPVD block is similar to FCP for
> VSP found on RZ/{G2L,G2LC,V2L} SoCs.
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

