Return-Path: <linux-media+bounces-12504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0CD8FAC56
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 09:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B3801C213B9
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 07:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0871411D8;
	Tue,  4 Jun 2024 07:43:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B29F140399;
	Tue,  4 Jun 2024 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487011; cv=none; b=nd1YfPth+aiUWSYzZLf8HxVFXgEXBHkTz1sHLM68udZL73heK2PFIi33RrwF3DRo3V5PGUIjf39SSmHr4fekjuirnNPmQ+UwpkUtcclY2fCM4wQbl1Lbxc9BuUduL1WRv6IHCBjpTJzCIuHV6x6SXvK9cOef4Vp8Ozo6gtC2YKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487011; c=relaxed/simple;
	bh=amAXDqO7NUNvUAMQ98AmXoymVFem6B1PHzgszlp0n9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCvjcW/C8/b9GxZi6/iFamb35b4h886t59fgmB4XqnWKR0nkn/gvS49y5JhGNUPUz2G1RGV5iQ338o7l+9fj01CkGeJCWlHHs+IXq/z9HHXgxkHaxIDTMLxW2zI1LcSdso4X6sRbzf/m5xu7kzuPJiGiBRxfkLm/BmKBeXjvLQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-62a2424ed00so55193087b3.1;
        Tue, 04 Jun 2024 00:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487009; x=1718091809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl0/qZK6Xs6+vehlrTCMsO5n2PAF37JLMCSBbCoV/Zk=;
        b=WNcuq2JwIzA2I17lVx6SR5KFG/2tuBpQONO99sxZ1B1y1j4KKYGSY9IRow4Q0T/99k
         mkgm+alwNIR8i+vh6Z7q8T5tMNWfTzTpQZN2DLkrUzYtGuQSdjSmrgKKI76fKDG4JOWb
         +qXJ51rmMV97fSAQCPU+NOOOgaWRRcAQd2prenb85Dn5LYSaBCqw8il7uUVlVjw+9jmG
         PPBiiCBhp6G15Uf0CbYS5LquZJARZp7LkJvs5QHaIL+WLXK/Dm3d5ZqE02S1VBNrYwY2
         34ZOwd6yGgVFhLuSRFVFPULrPI3gw6E/pPI5SikMe+ow71BM0GwNUdWSUkKbzVhGXBH2
         emrA==
X-Forwarded-Encrypted: i=1; AJvYcCWJUOPhmOjrFOU8uHIlaTSjImKvvbTZDQmXojwOKJsDvb59d59cvX+8zEgHQqZFYUIL1ZwOAiz37793NZ9+XFYJB89qofb7xk8bPqeR2lol5izdBGhNtIYSTdTMqE75fbx1lSWKxaURE+Enyk6pDC381qB/EJ/s8Iw/21NnRAEnEAOGuzyJROdsHPc=
X-Gm-Message-State: AOJu0YyhFZqjFTGjXGLJm3SyIWgI4+/bgtkKPX/87CFsgGkjPJf+TF18
	0TqMurie4HtwyEHdLQxhTOizJ56vBUj/PeGUtpTptBpcOQOEURCcjh+egTY+
X-Google-Smtp-Source: AGHT+IGfJh3yoJmi3pMlGbuHQEl1ym32Gkmjy9x75UdFNQ7kcviAjtG+VpJElqTQBABgYX1WTSDeyg==
X-Received: by 2002:a05:690c:82d:b0:627:7e65:979 with SMTP id 00721157ae682-62c7973fafdmr118109927b3.24.1717487008682;
        Tue, 04 Jun 2024 00:43:28 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765b9256sm17626167b3.5.2024.06.04.00.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 00:43:28 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-62a2424ed00so55192877b3.1;
        Tue, 04 Jun 2024 00:43:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/eMP7gD/MxidVidvN8arpj3+hAHFq4748iw2ufpc5at2JN0eofcGmQHiH4Zt4sR91cIoT2QBxZ7vijiWjGvT/EAVEL3N6x2mNPZJFhaW17rep2o0eUaU/hDWWbPdm2TEhrnfWRfEcsbmXoicLtLuzGhh/68tJKTKktYjiBH8VEevJdmB5N7ktSnY=
X-Received: by 2002:a25:8205:0:b0:dfa:6ecc:d924 with SMTP id
 3f1490d57ef6-dfa73bc3317mr11048601276.5.1717487008055; Tue, 04 Jun 2024
 00:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527131849.1678877-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240527131849.1678877-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2024 09:43:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJhrNe8pbQrBtuDbVu9djhs47oUyCLnjLW4tGDVPyCfw@mail.gmail.com>
Message-ID: <CAMuHMdWJhrNe8pbQrBtuDbVu9djhs47oUyCLnjLW4tGDVPyCfw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: renesas,vin: Add binding for V4M
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 3:19=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

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

