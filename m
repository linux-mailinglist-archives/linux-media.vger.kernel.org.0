Return-Path: <linux-media+bounces-5913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B332D8673B6
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 12:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EFE7B394F1
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 11:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E857F1D54C;
	Mon, 26 Feb 2024 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Zl/3znj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B761CFB6
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 10:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708945196; cv=none; b=W1kxw8cD1YcZBi7/F3h1dEnIl4e9XAFhoWrirkwZAO7chwT1Rc7IJ1RtdRB8QxyVeEjOOycnPscU6qCbR9qPAYxw4sW9A2VtGaU1tjnZkVlT/f5agST8fnY1V3fFOTGd2HbUWsSbowNpnRyvOD2eWNZWENhKwuMFWVgeDazvfuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708945196; c=relaxed/simple;
	bh=Gr4SEf1HRZuWiHK525jc8aBUZa59KPy1tNkRmXagChc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eiFgTZV53LE4iwb/CYnhDol8oxjX2efPpr9UgXWs/Ll0nKTYG8c1Kwz6BBZh8i9M1NYcan8I2hQKebSxwLC9ZVmeEqfCm1Tt7ht0/2wuXQMZb2Ik0pdOoqyy5CJgrXX/uKMJ0OWAQHMviTfeSMENjtaIFQB/fA97zSjeDVuJeMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Zl/3znj; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7c7db34d162so2008139f.2
        for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 02:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708945193; x=1709549993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HBNX3ZrqYqah+wR2ZXlErwOwwFl2gjzLKDMAIKzAXQ=;
        b=1Zl/3znj1NiuInaDNmsNiSi8tg/90EYPECXbL9Y1xGrO2QVBptLOwVfjLuA8AM0/xr
         eK3LNtRs15Th37cUzECuItOgaCjdg/CU5duq0PR77dvF/xeLI5oWG8Snqh+aAw3weY4o
         NARwRoMz8FvNwR3Luzf7f2/9kpmOkIW4TLQgqjB+5U49Zo2xLdyiraAChsPbjTT1eowD
         Rj8/zRgpi9zDl6hDo+3OajYdp+bJ7Wd0OVqEwMFIuBtz4lOkjbXyfVNDerRHOgo91Hu1
         0HanJryWyu3cJv/uftLN6vgvlgiVnam4Jp/qNQJs5p1CfCceksAL1uxZV7KjqRdI8/9J
         /htA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708945193; x=1709549993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HBNX3ZrqYqah+wR2ZXlErwOwwFl2gjzLKDMAIKzAXQ=;
        b=OOEzxlcU2Rki/bV64+cR6njIGHiCdf8mYAHI/oB+BSSR4L8t/ngfP6RGeuy/54q7cX
         kG0WaDFFsfba0ZjvXBo3kqTlDR6XK+QGbctUQzaM9WkFMgOE13JvQo3pvWp/Ly73Y6LI
         2nOF35QaSWwf7y4SKWYcCd/00MPR42tuZXECL3Y/pYuVnTl4Fq9C7iRyvXrc3rusFQjK
         NMFAeacO8Q6uD/R1jZMfbYCO5QnNjzanPijCl2LQl7FlZzFsnrHTbDtkvvxShbd4Rke/
         NzUCNKsIofPxaCAnmGpbVULjsM+4HcUSAdg2yJVOkA2Fx6FlSnwuFiXgni46gcGHKd9p
         iP1w==
X-Forwarded-Encrypted: i=1; AJvYcCXYFOFIYajvqvZyCPenVQBgVuFGG+Bo/BMHIUiN5ZQCL2kb3TlGvYO1X+Czkj/ALZIp5Z/79Tps4sogzd+ZfVrqugX3Nc2A7WbGOj0=
X-Gm-Message-State: AOJu0YyFE7bu46evWiRCqVvK87aTOGcej79XWBq91aEPX35+8OiLBgpm
	oTbijkKnRGKZ9g/3vofikh1kmRPn6A62NsiRbS39NyHeHmxPomz/qLNIzy/3FFiGM7Cg+grvy8V
	DgtFB2kX3pzpv8dNUmulPrr95KlcC+H1nwRmd
X-Google-Smtp-Source: AGHT+IGPWqkD9tP0s2DR5YozsFzpUTq3DqbX3426VLgw1SJtB5jrdYmWVGilTio3nCJ+QrJqqp33UcQOcDrbUDfAfdM=
X-Received: by 2002:a05:6e02:348e:b0:363:c1ce:1a6 with SMTP id
 bp14-20020a056e02348e00b00363c1ce01a6mr8258336ilb.13.1708945193051; Mon, 26
 Feb 2024 02:59:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com> <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
In-Reply-To: <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Mon, 26 Feb 2024 11:59:42 +0100
Message-ID: <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] media: dt-bindings: Add Intel Displayport RX IP
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 10:13=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> > The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
> > Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> > capture and Multi-Stream Transport. The user guide can be found here:
> >
> > https://www.intel.com/programmable/technical-pdfs/683273.pdf
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > ---
> >  .../devicetree/bindings/media/intel,dprx.yaml | 160 ++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/=
Documentation/devicetree/bindings/media/intel,dprx.yaml
> > new file mode 100644
> > index 000000000000..31025f2d5dcd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > @@ -0,0 +1,160 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Intel DisplayPort RX IP
> > +
> > +maintainers:
> > +  - Pawe=C5=82 Anikiel <panikiel@google.com>
> > +
> > +description: |
> > +  The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA =
IP
> > +  Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> > +  capture and Multi-Stream Transport.
> > +
> > +  The IP features a large number of configuration parameters, found at=
:
> > +  https://www.intel.com/content/www/us/en/docs/programmable/683273/23-=
3-20-0-1/sink-parameters.html
> > +
> > +  The following parameters have to be enabled:
> > +    - Support DisplayPort sink
> > +    - Enable GPU control
> > +  The following parameters' values have to be set in the devicetree:
> > +    - RX maximum link rate
> > +    - Maximum lane count
> > +    - Support MST
> > +    - Max stream count (only if Support MST is enabled)
> > +
> > +properties:
> > +  compatible:
> > +    const: intel,dprx-20.0.1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  intel,max-link-rate:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Max link rate configuration parameter
>
> Please do not duplicate property name in description. It's useless.
> Instead explain what is this responsible for.
>
> Why max-link-rate would differ for the same dprx-20.0.1? And why
> standard properties cannot be used?
>
> Same for all questions below.

These four properties are the IP configuration parameters mentioned in
the device description. When generating the IP core you can set these
parameters, which could make them differ for the same dprx-20.0.1.
They are documented in the user guide, for which I also put a link in
the description. Is that enough? Or should I also document these
parameters here?

>
> > +
> > +  intel,max-lane-count:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Max lane count configuration parameter
> > +
> > +  intel,multi-stream-support:
> > +    type: boolean
> > +    description: Multi-Stream Transport support configuration paramete=
r
> > +
> > +  intel,max-stream-count:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Max stream count configuration parameter
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: SST main link
>
> I don't understand why you have both port and ports. Shouldn't this be
> under ports?

I put both so that you can use the shorter port property when the
device only has one port (i.e. no MST support). It would work fine
without it. If you think that's unnecessary, I can remove it (and use
the ports property even if there is only one).

