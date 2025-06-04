Return-Path: <linux-media+bounces-34036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F497ACD84A
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 09:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8ADB87A6F99
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 07:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E001023D2B2;
	Wed,  4 Jun 2025 07:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="x83A3Ox3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82F41804A
	for <linux-media@vger.kernel.org>; Wed,  4 Jun 2025 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749021206; cv=none; b=oN1sDZpqGdN713TMLs2dC974EZxsYiEsSNH5EEa6llhxkB46lhGAwEiZ4b7QW4++4TlMQAbJA36ELEAyYLXLDBuNtKew+MpxAj8HWKINz1zkutGxemwWgfsGTOhSJrDkF3T+qte5EKyhoxwBInKxw2cn4xvYCNUIB+f7SLLSMXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749021206; c=relaxed/simple;
	bh=3AVbLqlURSjEvnMOfjuDeMBo+P0IV4Xq272XRqwuuOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUdrOW7+Hv11kkLJPl69FLb4bPvOr5vtWUObXms39hppjyPImSK+G7GGfN7KY1r8MsjWggxZnKVDMo4yeBB4hmoDuho4OnNPoOSayXoFx4rj0lvfDpNqESEAIHAtL4dUFX50LXEQWvevaBYWp1r8dwi4n9ksvSjfK1LFjRcS8bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=x83A3Ox3; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so5246946276.3
        for <linux-media@vger.kernel.org>; Wed, 04 Jun 2025 00:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749021202; x=1749626002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egAKscK3QoP1kYQu5KkN3aoibVnnNSd6rVfa6InXH/s=;
        b=x83A3Ox3gy3vG6dzlMUWol32yCgOi7ep1cSEAVIg1T3RgOJWY0Tu2phiQ/8rK6I30x
         xk59yLGfacN39TAuOT3hdE29jQ54ouo+QCo2pKewPMGFBZ0EhTKBDPtW0Oxbmma0dQe9
         GmTiYjuMqe1EoKBQH5WYQ/e08Mr8poFIY9wXKOlDlkK5ARgAA5RcdKyhbHsQ2G1ASiA/
         wQ8XPcIk3nWOPJc+CkegYB2F+j0ZEJZ2bdCvc4mtEXW5DS8dkT+5ant+GD4M9GOS7nok
         q9nAwu0Ff824mNg/9hOOlwF12L/pzXYwmnOiqF/3j630et6pmIfJgVZwOFvl3WkgwDbk
         ZR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749021202; x=1749626002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egAKscK3QoP1kYQu5KkN3aoibVnnNSd6rVfa6InXH/s=;
        b=t68SsT/2+PikqVQZ+pNNZNSsLMENxXEsB09SOPSdp+gok0jz8hYkWJU8L+cnjEpk4B
         twYzsxHM5lC3Y2nitUa2fTG6OtXlQa4d/rDv2Q3fMAeSLVZkENI12IDq240Z0WyQNx9t
         bC1Jpe9YQlRqyb55oPGKr6SFFc7zHkHuZMF+UQoKhD7bT+m7GB7ybGTnZx10SNU/JRAq
         Gxbk/TfdZG+k4n9x+2qMTJvqQ1bSVvKdAnAH4peLcHAJEUbeaNnJH89sk38yvrnaP1+Z
         55lKq5flzdMviddNWnGleH0iGX/f8GbM7ZZDtqKX5+gnl0gRASPO/ic9amJHKSukULXr
         iZzw==
X-Forwarded-Encrypted: i=1; AJvYcCVhsgDp5GHEBcnxOmPjKa1X2pMrGErN95Ue98RvOavFV9ZdxQ2OJTsOyqtjrL7jq1fa+IIvTat3jwoU5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzINj/A2wFM+q0CB2OA7/drXD0SaOVSDEG46LD8UL2mWxtwY3UR
	JDk/nnDOjrrSan/HKStPlhkCzmZnMSd5BKoSPcKMbOzRaRqCWQa/H8MitrH40YbLDrU=
X-Gm-Gg: ASbGncv6JNlVg77Nk0qLYnVVvZyEx+p+Fe+pk6CUJRyK8NV/sXKliKWTRC3125CSvFD
	6hLCJxzd1kJoug6i8x6C0BW5XyiuktKbBrUn8Xlkgwlq7QDzonDmzvap/svlwP5pFCL7alB6/M+
	fodqj8q0NyLJE1RqTo+C8pHULxsya4kqQVlrEHqREczwKxbdlXYMeLFpsx8zhXHdrLLhUp/WmrN
	RjP3NLl/TfNPsHayGjhTtY6azeFUUlze00uQZEklN0lO1AcDz6EgtkzucUaD1YMulaHzXqF8ywr
	2rorYGBBVWF7acuOZ4klnJSDN//SYi1zwIZofzjOD9oAetHVQWICbN5zyBKG/x6g8a10gxhBAkD
	9pe/71GpUGTQMjzgwy2121TZQptSYDg==
X-Google-Smtp-Source: AGHT+IECH36FIWR3WtlVbi9pIVrUarBTvW9M64iPEf4vW1z/5lI7aXueUFIWtfoUkZsSo9xn+ErQqA==
X-Received: by 2002:a05:6902:448a:b0:e7f:7352:bb30 with SMTP id 3f1490d57ef6-e8179c2e503mr1883481276.18.1749021202551;
        Wed, 04 Jun 2025 00:13:22 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e817b41605esm188431276.0.2025.06.04.00.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 00:13:15 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e733a6ff491so5910113276.2;
        Wed, 04 Jun 2025 00:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+r8Gra7vRQAyzegetNBGr3mYOPT300RRMyy5GnrKsFOzbgaDpbek+mxYL5qWetvi0LJBut6ioRpUw7WM=@vger.kernel.org, AJvYcCU/f+WRphs1kEiZtZ95sZ+z490KMzrN/2F/HxpqnLlu9cqz1rGJLnKopqkeA9mAKaVODenI9dqNtN0amUs3@vger.kernel.org, AJvYcCUwqT0UUCxwjrObguZdH7XL31LEyb5pYyKnnWTE+XeRBr2fxrHb9oEtK9dawR2VMqoVu42ilpesjyuu@vger.kernel.org, AJvYcCVcQZTBL5+Uq5KFTiapfho8yVoStiIi8YJhVXejaQo4MKBm4Tho4Y0dwY/avvFRDY7T304W3aaMCbE8@vger.kernel.org
X-Received: by 2002:a05:6902:1009:b0:e7d:b06c:709d with SMTP id
 3f1490d57ef6-e8179dac9c2mr2086427276.37.1749021193915; Wed, 04 Jun 2025
 00:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net> <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Jun 2025 09:13:03 +0200
X-Gmail-Original-Message-ID: <CAAObsKCUusE68Bzce5fxukpOJ34M_w5vt7+gLSHZuMC8KXqtLA@mail.gmail.com>
X-Gm-Features: AX0GCFujZUaEEoiRSaHh2B6hjHyNEBOF25EbCsvQFur0Wj0AZ2p1QcOal7DajJE
Message-ID: <CAAObsKCUusE68Bzce5fxukpOJ34M_w5vt7+gLSHZuMC8KXqtLA@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 3:41=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, May 20, 2025 at 5:27=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.n=
et> wrote:
> >
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > v3:
> > - Split register block in its constituent subblocks, and only require
> >   the ones that the kernel would ever use (Nicolas Frattaroli)
> > - Group supplies (Rob Herring)
> > - Explain the way in which the top core is special (Rob Herring)
> >
> > v4:
> > - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowsk=
i)
> > - Remove unneeded items: (Krzysztof Kozlowski)
> > - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> > - Add reg-names to list of required properties (Krzysztof Kozlowski)
> > - Fix example (Krzysztof Kozlowski)
> >
> > v5:
> > - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> > - Streamline compatible property (Krzysztof Kozlowski)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 147 +++++++++++++=
++++++++
> >  1 file changed, 147 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9eb426367afcbc03c387d43=
c4b8250cdd1b9ee86
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,147 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks, based on =
NVIDIA's
> > +  open source NVDLA IP.
> > +
> > +  There is to be a node per each core in the NPU. In Rockchip's design=
 there
> > +  will be one core that is special and needs to be powered on before a=
ny of the
> > +  other cores can be used. This special core is called the top core an=
d should
> > +  have the compatible string that corresponds to top cores.
>
> Is this really a distinction in the h/w? If you change which core is
> the top one in the DT, does it still work?

I asked Kever about it, and he confirmed that the core 0/top is
special in that it is able to relay register writes and share data
with the other cores.

Regards,

Tomeu

> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3588-rknn-core-top
> > +      - rockchip,rk3588-rknn-core
> > +
> > +  reg:
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    items:
> > +      - const: pc
> > +      - const: cna
> > +      - const: core
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +    minItems: 2
>
> It is odd that the non-top cores only have bus clocks and no module
> clock. But based on the clock names, I'm guessing the aclk/hclk are
> not shared, but the npu and pclk are shared. Since you make the top
> core probe first, then it will enable the shared clocks and the
> non-top cores don't have to worry about them. If so, that is wrong as
> it is letting the software design define the bindings.
>
> Rob

