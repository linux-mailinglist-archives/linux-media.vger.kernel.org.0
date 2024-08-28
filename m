Return-Path: <linux-media+bounces-16990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E187496217B
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 09:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CD3D282073
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 07:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D5B15AAC8;
	Wed, 28 Aug 2024 07:40:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC8F1591E8;
	Wed, 28 Aug 2024 07:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830856; cv=none; b=l31pa+M4Y4R4eCCZ6llJ4bSuxlhjsowryv8AeX4hpffG+p7MpL/Oull/hSfqMn9iPDbog1XkAL+6TN9ya+1Vg/vf2h/tEAkWCckUXnZKRGBtEY075YtvUpStxE/p7YXs7HI+xvfe4llzO9d6F/XXDHJzQ1bhg0/+X3mr40ga7lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830856; c=relaxed/simple;
	bh=J2VeRerYHEewozCYqhNkqVV3XJ1ppYpW9qTO2ttgw3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=em3iQItvy0QGgSOl9FQ7VQgCcPRV6O6sdztN9AHtU/6310AAZz8QhA/LGX76F6EWt43E+1H8as3tcEiN7ramJR0jvJzp280dNAepsArTvVpECZVaovJZ8VmAbW+tmdpUtLJVZSDR2VAt2urfgOmgDb0+nZ7vIFVzjiJ5CoTcJVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6d0e7dfab60so9979777b3.3;
        Wed, 28 Aug 2024 00:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724830853; x=1725435653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U87NJLWqEtr8onqgxy5X3mqSmi8VAMgZtbTOu+LINCc=;
        b=PIEyJTB9MHzTQPAPq0ql3tJBBPdk95xa7O84L0daZh7AtnvTkGO1RTeWnlVuTIGB67
         lC9LZaxM136LBUJpVTKnFm6j5HREQifL4H4qUkbykpAIVdGFORKedQxAMY/Rgxn799KB
         JWDPaWD3v16+tFm51n8g2LYXEuwjQ0q7VgDQXyr+/aHjMboyD7CNfODT/NchT7kf+EAY
         3bgzsP7Fuq3MASrSjrZX+wTK2MeM00oakdiKxmZf0Ute75lQVqTirEWcy7xpp60SWQtg
         49JoXx3Kp0k7tOKfMKiY4FahClyyT1iyrG4lBe/rMmCyxfFVUw42iL+vrD4uKse/G+/r
         9GCw==
X-Forwarded-Encrypted: i=1; AJvYcCW1pq+iiQQLnCvqfSeFnG6/JDsifGhZc6fdGVTj8jPQcTd0k4oK2gKeluSRLKzpTRuejSfPzreINBMr@vger.kernel.org, AJvYcCWYasUmfl2lHqQ5Vk1p1dRn4finmH18wF5tTIx1Nrc8xC1t/WRu9PjDKbzec8JjIhfcGQ1ewvTgJP2TseA=@vger.kernel.org, AJvYcCX6mSwVc1/FDBp6dG4y9kXEc1LJKaDkmO364uOVRaZEO89mjJiFVZhY5w3MdcvBnCmw1PsQamJH07vt2oHD+k4cz8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyC7LkpVFFBxqAbdvszJuE80Bhx7/jVDfINn/6oizRSkFX4nT9
	hT78T4S1hxtbpfUBH+5Jw7iXbaOIle4Ubu4jHTsSxrhxT4sHXb4f5XCfXgUj
X-Google-Smtp-Source: AGHT+IHXm2rhLuZWBckxbh3tzH65mJH0iTcmPoFRM9qTkUZ+RGZ2CDMOxUA5RH9w/W3O5gPt4U4f4w==
X-Received: by 2002:a05:690c:2e07:b0:6b3:f01c:9a57 with SMTP id 00721157ae682-6c627d0972fmr142503217b3.35.1724830853032;
        Wed, 28 Aug 2024 00:40:53 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e500a79sm22458097b3.137.2024.08.28.00.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 00:40:52 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6d0e7dfab60so9979607b3.3;
        Wed, 28 Aug 2024 00:40:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrwmtKJmxaymxIrQ3Bwpw6N6bflGkqeehrv9aXMC6WmpSoWtxFI75NPBXF0eGMcJ9NcxQ8ZK2vvOZW@vger.kernel.org, AJvYcCWVFEQNpeNSEt9J/0qLSttMxAUCDaVZkMmo5F0DgV6cuEXEMIgpdWUrO2sMr6It9nQ5+ZqHWzGvqmbOjwg=@vger.kernel.org, AJvYcCXIdm0u7/A5LeGhUmZohyhtfszhcFGut3PT5aC7PDDEImoGVFT09kaxAEP1HIikrzD5iI80gkReZos0THxfPoZJq+4=@vger.kernel.org
X-Received: by 2002:a05:690c:458a:b0:6be:523:af4d with SMTP id
 00721157ae682-6c624dcbf3cmr140445697b3.11.1724830852463; Wed, 28 Aug 2024
 00:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se> <20240826144352.3026980-7-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240826144352.3026980-7-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 09:40:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXq+gs+OE6nRRM1dUGAkX-tn6jk0D5fbJ4Xiv4ecxkFqw@mail.gmail.com>
Message-ID: <CAMuHMdXq+gs+OE6nRRM1dUGAkX-tn6jk0D5fbJ4Xiv4ecxkFqw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a779h0: Add family fallback
 for CSISP IP
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 4:44=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The usage of the V4M CSISP bindings where merged before the bindings
> where approved. At that time the family fallback compatible where not
> part of the bindings, add them.
>
> Fixes: 2bb78d9fb7c9 ("arm64: dts: renesas: r8a779h0: Add video capture no=
des")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - New in v2.

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

