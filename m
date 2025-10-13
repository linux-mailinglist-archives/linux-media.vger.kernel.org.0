Return-Path: <linux-media+bounces-44328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF098BD4C72
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 18:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA47A188BE52
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582A030FC28;
	Mon, 13 Oct 2025 15:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kmc+EicW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02DA30E0FF
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 15:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370474; cv=none; b=Mc0F67kD5HV1w5tLcnXJYIAwS435hL0RW/ZkiobzBb5sc4Lkg+GmowvpqRnRIW8jbHG8rUYY2Y0DhI+RA2TheieHnbHbfc4SC+n9xTPk97jPZ4NfItlVPsYm2Drbe1i9INgun6QFiwk6h9uX5SiobVQJ4UmiD6daQ9zKdVLLa5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370474; c=relaxed/simple;
	bh=g6TFFFPGjr50jQR7xQx4h+CFBPxdsLdChbbFuSFu0bM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lADH9VqKHsZfhSKBdvKawZlV0mehC29Dyuut6cWdB0xKIHBP/1PQLY0+4BTYYDJdgN6Xeh7pMFNRn1gUq4618xmGcrpjtlhWELpiNNt4NpHkRz9G/eZt33sZk+NAncSrO/xUOmLnCd9m9iL53Ko5j8eGJRGDF/O5ZI1C8XGdtMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kmc+EicW; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-373a56498b9so53567541fa.1
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 08:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760370470; x=1760975270; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YBeBnLojRUp+3BGjW9hqqMrpXMlk2wEyeaFT1Bjf2RU=;
        b=Kmc+EicWOnGGJv7h3XU37uIanIetzI2Y0gIysTNKa/jbxzrsW/u18lpFhrh7ojoUdp
         DyUguXAGeDupQIpwgNmb7DO+NhXzZSZpVeqy/rRHSeolzqlsVu/AjK4bxGImmJk55QD3
         io9iZfQTNBWNUciKMpgtbWdrYXU1Awjdihq7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370470; x=1760975270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBeBnLojRUp+3BGjW9hqqMrpXMlk2wEyeaFT1Bjf2RU=;
        b=j0UU8SW0esOKN5SuUFw0IULeW6AWako26SXcWHh2snopi0K8nwpRZfYmJ+X0eAoS+j
         nx0Cg8KBZh9VqcIcaxoUSTdjBMx/yklf2s6YOx8zZ4aNraorNBYO+3NzkAE8t1fX03+s
         /gW6g5whtHemgewA4RjO48f6CARPcleeqz0dfCO2+QkINBE1DPEv08jWQndPSFeVqgVg
         8vkfmVl/5iItqUz4z2622ch2x/MBt/expT+mY1oJmyirHXwIxckF+/kPc4Gxeib6NGXm
         9oJ6jpt/3fGF3pQu5LOFFhibPizY09w91PQWoLQREnj/P+1n9BdPxOB7Aa4mF/GhMhxJ
         uRXg==
X-Forwarded-Encrypted: i=1; AJvYcCXpavqn5GGbUDfJaYOyXZb7bEOS4ET6LtQuog1q294gJde3vUQvKJ6X0MS0qZ0uXL/dOQfTtJjgsS+sXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywdy2/agENqiXtdAB1TJMaCzb9MaRyxEVSX9r7Ca1v1rdWf0op
	clPaWSK1yiH9y9n19KYNzNnQFXVzFp+JjUDweMwukozg/P0l5ZNBnG5JRJ8HnGXaAARihaUPER4
	ebjt7qg==
X-Gm-Gg: ASbGncuOL02BqkJvyuhTKe7m1qkINoHzSNxriACsqV/7fNv+Teses0SPbrR8g+xWcIi
	JkWqSuqoONhNrJlV92z+LAub6CVle6C7T5qZEe9RGYMX21Sei7WoB/dMEcWbbsatpIMUfAjTnfN
	VUTQhHhwwCVIq7AuHbN2pfERnin13kgPH1Pq4vy1P0cnYT0ch7525UnTY0HtB8sk0l6+Mnt1Xen
	gpUz0Ses448ncoCXG6dmlUkEi2UXlo819dPPULI7YwEJQIvsxwF3IdKnCJUSV0uxCy/5TDaMkxu
	VO1K5Oh8Gp35A61MckXVyZMcqI2PeiaVhb2sInO2B0u5uPAMOAFcCjSYQb8F8ug2XLyw0FCfWJJ
	BbK45ua3xTraK2Cys+FFN4fZ3zOaw18TWkHNeWsRfyDcVmcACqIM2BXzG9pwyHXyg67PW9/itaW
	ctz87KyaCeJ9NJHQ==
X-Google-Smtp-Source: AGHT+IHN8/7m0YlanhNOM/XTdcf3QecDvWFP/2vwJgVqcBNvoAdCd9M89F2yv8xYY/3izkFXjI4Kzw==
X-Received: by 2002:a05:6512:1093:b0:57d:8379:784b with SMTP id 2adb3069b0e04-5906f46ae16mr6161601e87.24.1760370470534;
        Mon, 13 Oct 2025 08:47:50 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563812sm4239240e87.61.2025.10.13.08.47.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:47:49 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso6608934e87.1
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 08:47:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIsxjZ63b3/cLqJ/NX/Cz1s7MDlg9hKeP1avsgc4gKJ74kL73qTOChqDMNrwiwu6a/rv3CO6IxugL2eQ==@vger.kernel.org
X-Received: by 2002:a05:6512:1329:b0:581:bdb8:6df9 with SMTP id
 2adb3069b0e04-5905e1ffebamr6390861e87.10.1760370468172; Mon, 13 Oct 2025
 08:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-dts-v1-1-5731ed92684a@chromium.org> <aO0eLbLCGLKf6sF+@lizhi-Precision-Tower-5810>
In-Reply-To: <aO0eLbLCGLKf6sF+@lizhi-Precision-Tower-5810>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:47:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCu2hdaO5r8v_GcCksepy58AJFsuLb-xxz3WYOUknvKLwg@mail.gmail.com>
X-Gm-Features: AS18NWCpy9_8RtaLxButea2qoJBXTdgqbhebqmgYPmIE7BU8dSEVQ_qnVy1gyYw
Message-ID: <CANiDSCu2hdaO5r8v_GcCksepy58AJFsuLb-xxz3WYOUknvKLwg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: fsl,imx6q-vdoa: Remove redundant quote
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank

On Mon, 13 Oct 2025 at 17:43, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Oct 13, 2025 at 02:52:20PM +0000, Ricardo Ribalda wrote:
> > Latest dts-ci complains about this:
> > ./Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml:19:12: [error] string value is redundantly quoted with any quotes (quoted-strings)
> >
> > Fix it to make our CI happy.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
>
> Thank you fix it. I have posted at
>
> https://lore.kernel.org/imx/20250925193546.305036-1-Frank.Li@nxp.com/

Sorry, I missed that one :)



>
> Frank
>
> >  Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> > index 511ac0d67a7f2360afe22b81d76644575081089b..988a5b3a62bdebeda6b922a986b9ac93d0933e51 100644
> > --- a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> > @@ -16,7 +16,7 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    const: "fsl,imx6q-vdoa"
> > +    const: fsl,imx6q-vdoa
> >
> >    reg:
> >      maxItems: 1
> >
> > ---
> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > change-id: 20251013-dts-83ce7f7b9e54
> >
> > Best regards,
> > --
> > Ricardo Ribalda <ribalda@chromium.org>
> >



-- 
Ricardo Ribalda

