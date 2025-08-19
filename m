Return-Path: <linux-media+bounces-40235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 442F0B2BB5C
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 10:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22F3B7AC687
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 08:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CB9310629;
	Tue, 19 Aug 2025 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWIdL6dI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BDC1F0E53;
	Tue, 19 Aug 2025 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755590712; cv=none; b=RGdj1mOecy7YRDwah2eKSwDRtKVGzyQ3hduD+6Cg7aZgMM6wNp91q52crMeMLhhulvXbEL3ZS+Xd6ptdV8D08/YbptZGBv1xwXmb6y5f0VyNCuTs1DAxVIt78hrLMTiFwsARGSdLUgUq1FfPalHBW6FfK5+yCJXMDJXsb2YcZSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755590712; c=relaxed/simple;
	bh=7D2lu1XiIJLgkqOJxhZAOvejc3pJcyHHWN6n/QZKSeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g6P0+GLuVzBuBKBkTVhDh0JcQBxRBdSiCn2g4rRsMyYpWFYXzR6a4vO0oQKjta1XxkeVqyvJDO0bYEQIDFTVL67bNS8sSVC/5TKKbGA4hm+R70WUceeC89wobU21OTI28mlBB8b0L6Bc7G09rK37i93PAaaB6dZyTfSmnDrHObs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWIdL6dI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9d41bea3cso5309148f8f.0;
        Tue, 19 Aug 2025 01:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755590709; x=1756195509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANL4eqc4c2Z6/VW3UjUZpN2VLn82HdG6n4R8Y98/RD4=;
        b=PWIdL6dIkWiqN2HucFlw3vjuZDz4FRqnKBJovThuE6xcJDOpIuL9jNcDu2csGGLexZ
         imN1yJj04/LAvl2S/0PbufGm7RkC9DcXfkfs92li9k8bZxSseawZDr+YCC+EDLwceIGH
         KCQXSSpw6Q+ISMvtcqPDZFtQOpgscESekPF9SC50/8sMi9FfgidyPrbqncjU0DCsAblh
         OH8s6lGX+AREl8c8D0++AoQcNVPr9GRCWlzit5o2EzsPhEGSdjvEzyhAcrRchixLF0DG
         ASAtYBhpH9P1j9VeWG+yqZlWg8zrr/1nS/8iu8s19BOwFmW5k5JO1yu8sDwm2A86g7NN
         3DOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755590709; x=1756195509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANL4eqc4c2Z6/VW3UjUZpN2VLn82HdG6n4R8Y98/RD4=;
        b=N4yk17eK8cE5JhxW2rVx3lTEQYeOA1mC9OsEmB08RuCWNPdd50wg1gkE/e0GDmQRVu
         BSiUCbsMYFW3A6Ar6ffW5zKdDyS4UX8UsssMxl1uVlJ5DV25rprHdQot8Td8TIMkKp3p
         sVkAvJJdykI50P6C7jbDOGk8Mv8dDOXmHiYqrmlDp7zZb9c2lf7zO55Hs/pbLyhp+sMq
         1WFFTveNOVnS/T9W/Nw+Wg2LZtgrMWihIJ5CK8IoJlZ7PSw+/5qswG2El1O+6qbLY/Va
         ipJ2CJVP1ORaB5DBszUghSlXjq+V0FgP1B57V+9e4scBFVdShoKkE7pc+Er1XBEel/4W
         SgyA==
X-Forwarded-Encrypted: i=1; AJvYcCU8El20JkUkLnCRFfJh48gemIBmVSuliCdU8enAiGl8MbFJOQ5wRS+uziPNzlVbYnBRT+eoLP+lv7NS@vger.kernel.org, AJvYcCVXJsjgbw5ZbHLq2ldwu7BsLCs0uITUQAblc5TXCyZfv59PTQMDv+BLpB4CnyQVIDLwfZ0lzrx7JKr8CqMic/74U5k=@vger.kernel.org, AJvYcCVyaLJxYpZOQKgIJmyqjp87Wkbd4pL0Xzz205mX98JYqTdqtgz5oj86QhXU7YbTsgPV6n2DcdoPtmztM1oq@vger.kernel.org, AJvYcCXqTXudHwkHJyZ7DqZbkC7H6dzObf72Xe0AlTQwaK8AI3+ggffUcLSpUTkdT45h/nvdIE3FodlMcJQ3iDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYuQm3pba8rgHjlGb8Jf8Ed55JPU2gQnsweUo9UXwczvwQ8O7q
	jAUUclZEx/kPaj3QFAn1xM0/iel4phEZ/36pKOsIwztr+Qy8xN6Eo+9nVdBMUZ4nO0WV+6m7xcn
	3eOzCt+wx+VSzH/2fbYKI3KGCw3ThXnk=
X-Gm-Gg: ASbGncsBXwS6Yat0l6nvn0jCAbJYf7erjNR8Ojcxv/tiNBStnXv0KQlmusRo4yZr8ZR
	ET2LWkFs+6L8xvFA2CMUjQufKcN+sjMxRaS+1bK22uN9Us71t/1EIQgcFhhvd3P6zWDadx4vTyZ
	AmMBqVEtybFHKaYdBvMaAMlgRAmJy7qcVpfwFL/C12bnlD+sWFZGJC94MSFuQdw53soPiywtT1W
	V0lThcnAz2x6OYcLSo=
X-Google-Smtp-Source: AGHT+IGtOQDNg3kF5jiIef48AJmJAKtuzf05XKGxWscWdQEmBb78iJLtbMb6FhejPIP3ViLY8d9EByCDVYhxmgiO+wM=
X-Received: by 2002:a05:6000:24c3:b0:3a4:d64a:3df6 with SMTP id
 ffacd0b85a97d-3c0ea3cf081mr1243907f8f.3.1755590709246; Tue, 19 Aug 2025
 01:05:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819074849.18696-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250819074849.18696-1-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 Aug 2025 09:04:43 +0100
X-Gm-Features: Ac12FXwP6aAzckbYtKHTXYsVgG7EEJVdj8641v3LJru05N6R22v4gGUTmjytJPA
Message-ID: <CA+V-a8t3PD0Ev7OpSRpHeOx0TLd=XqVe=rLUnzrJ=fVRbiWWyQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: dt-bindings: renesas,rzg2l-cru: Improve documentation
To: Biju <biju.das.au@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 8:49=E2=80=AFAM Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Drop CRU prefix from clocks and interrupts description.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Ref: https://lore.kernel.org/all/20240909143358.GA2013-robh@kernel.org/
> v1->v2:
>  * Updated commit description
>  * Dropped CRU prefixes from clocks and interrupts description.
> ---
>  .../bindings/media/renesas,rzg2l-cru.yaml     | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.ya=
ml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> index 47e18690fa57..0a57b9d15318 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> @@ -32,15 +32,15 @@ properties:
>    interrupts:
>      oneOf:
>        - items:
> -          - description: CRU Interrupt for image_conv
> -          - description: CRU Interrupt for image_conv_err
> -          - description: CRU AXI master error interrupt
> +          - description: Interrupt for image_conv
> +          - description: Interrupt for image_conv_err
> +          - description: AXI master error interrupt
>        - items:
> -          - description: CRU Interrupt for image_conv
> -          - description: CRU AXI master error interrupt
> -          - description: CRU Video Data AXI Master Address 0 Write End i=
nterrupt
> -          - description: CRU Statistics data AXI master addr 0 write end=
 interrupt
> -          - description: CRU Video statistics data AXI master addr 0 wri=
te end interrupt
> +          - description: Interrupt for image_conv
> +          - description: AXI master error interrupt
> +          - description: Video Data AXI Master Address 0 Write End inter=
rupt
> +          - description: Statistics data AXI master addr 0 write end int=
errupt
> +          - description: Video statistics data AXI master addr 0 write e=
nd interrupt
>
>    interrupt-names:
>      oneOf:
> @@ -57,9 +57,9 @@ properties:
>
>    clocks:
>      items:
> -      - description: CRU Main clock
> -      - description: CRU Register access clock
> -      - description: CRU image transfer clock
> +      - description: Main clock
> +      - description: Register access clock
> +      - description: Image transfer clock
>
>    clock-names:
>      items:
> --
> 2.43.0
>
>

