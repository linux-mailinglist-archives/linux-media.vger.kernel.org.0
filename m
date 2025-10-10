Return-Path: <linux-media+bounces-44184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C66BCE644
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 21:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5BB619A808B
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 19:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CAE2737F2;
	Fri, 10 Oct 2025 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkNCtU8Q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA25D213236
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760124638; cv=none; b=agR0xdxzWVDXOfzPC+oI+evqhl6PCxhIN0orGF3HPy+v2Ozf13wuJewoWjq6lcuGSOONJBuAXbbW0yDVLaAASB6MsbNdmgIqM+FIScRGwI7xAKloRTz8zLnUlJxK00yHEAV/0pLDdHPJNdJaGcPRngiBLSQ6fj6qObpuwb5VQGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760124638; c=relaxed/simple;
	bh=UO7tWaC1D06ILgslhIE6Vp+GGNOSccu5h6NsvDEB6bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXLxM6PEwee44JPOmPjv2bGknBxL4J2OVbdFL1GOGnRT94+Hp1sdqT+t4rUVfEBSMBPn1H0w9jU52gxQYJw90TZCOZTeUBLvvn39YTl0R01mh1OZVtz/U/IdcKDe7rOoeXSOMQ1GgUqmna0Bc094uM5MW7VyPRK6TTkPjln99k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkNCtU8Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC98C4AF09
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 19:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760124637;
	bh=UO7tWaC1D06ILgslhIE6Vp+GGNOSccu5h6NsvDEB6bI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RkNCtU8QTeCBdWpLHhNr8JvrU3SuLc+1RKV/B5DWkkchSXpVbewLPEGu9PteSIC59
	 3QdUV0p1QZHp+XhVjKliK0wvXSdB1RU5a+CyZxjimdAkkEp5C2xHmsIcspGs72E0Lk
	 cyObdDJQL2lwFThzP/75aTtYq1Rg+WwTXzxuf5I/WZflCtsZ6JwrjI1V1vO6mFvs05
	 WXMcevad9JypeFhT7/uwXWjFcL+u+BZQ80FRHRXSyCarsMyxQ97kXJWkBlv02hVeDW
	 nUw04T6EMyGqqoQYGxSvUHP+TG9k6oSLAKGh4+rIvWYp5GUXc/FJOhGX6qNXxLvulc
	 NRaGMKALZ1/8g==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso392772566b.0
        for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 12:30:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWprCWA9PKQb5t8+nv0hc2ReacGIEznXUWZsMbHjE20yTOouDSse8h3embk2CUVy9jVPHHCoYGKUhl65A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyONl43dmuFRC70wYYqzzblruCQ761a8qyFzFz86LcOk0SmvQEj
	um5XnWGWmeqSjtkG8U8EwfT2D/ta8SbIK+Qa+gZ8eYQBXnOcg+w0PRMKGKgMVbAZq0ogP/uZzut
	c+5uKE5ywcTsKZd+Y3GK5p0qdjoJHZA==
X-Google-Smtp-Source: AGHT+IFrGZS8VdfbsjL7y3HXA+QaopPkTmxI0XGy8rPLFJbEh/CBDAxBRtvMMLAceU+RXRafaXg83rsGiK6CrH/c2zI=
X-Received: by 2002:a17:907:3e8c:b0:b48:4966:91a5 with SMTP id
 a640c23a62f3a-b50aba9e585mr1400916466b.30.1760124635939; Fri, 10 Oct 2025
 12:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-ethos-v3-0-6bd24373e4f5@kernel.org> <20250926-ethos-v3-1-6bd24373e4f5@kernel.org>
 <aNrVwn1ibQmB/rKJ@lizhi-Precision-Tower-5810>
In-Reply-To: <aNrVwn1ibQmB/rKJ@lizhi-Precision-Tower-5810>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Oct 2025 14:30:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJkOVOVNvnePGE5G0HmbxxXPK1a=1qjOEk-G4ZZ3wf6Ew@mail.gmail.com>
X-Gm-Features: AS18NWBBQSTOplEO26OgX73Pts2y8G-I5Seb0FzonJgu4d7oZEgcPiz1tLe4anM
Message-ID: <CAL_JsqJkOVOVNvnePGE5G0HmbxxXPK1a=1qjOEk-G4ZZ3wf6Ew@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: npu: Add Arm Ethos-U65/U85
To: Frank Li <Frank.li@nxp.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
	Daniel Stone <daniel@fooishbar.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 1:54=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Sep 26, 2025 at 03:00:48PM -0500, Rob Herring (Arm) wrote:
> > Add a binding schema for Arm Ethos-U65/U85 NPU. The Arm Ethos-U NPUs ar=
e
> > designed for edge AI inference applications.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/npu/arm,ethos.yaml         | 79 ++++++++++++++=
++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/arm,ethos.yaml b/Doc=
umentation/devicetree/bindings/npu/arm,ethos.yaml
> > new file mode 100644
> > index 000000000000..716c4997f976
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/arm,ethos.yaml
> > @@ -0,0 +1,79 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/arm,ethos.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Arm Ethos U65/U85
> > +
> > +maintainers:
> > +  - Rob Herring <robh@kernel.org>
> > +
> > +description: >
> > +  The Arm Ethos-U NPUs are designed for IoT inference applications. Th=
e NPUs
> > +  can accelerate 8-bit and 16-bit integer quantized networks:
> > +
> > +    Transformer networks (U85 only)
> > +    Convolutional Neural Networks (CNN)
> > +    Recurrent Neural Networks (RNN)
> > +
> > +  Further documentation is available here:
> > +
> > +    U65 TRM: https://developer.arm.com/documentation/102023/
> > +    U85 TRM: https://developer.arm.com/documentation/102685/
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,imx93-npu
> > +          - const: arm,ethos-u65
> > +      - items:
> > +          - {}
>
> what's means {} here ?, just not allow arm,ethos-u85 alone?

Yes, u85 support is currently on a FVP model. The naming for it isn't
really clear yet nor is it clear if it ever will be. So really just a
placeholder until there is a chip using it. It keeps folks from using
just the fallback.

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thanks,
Rob

