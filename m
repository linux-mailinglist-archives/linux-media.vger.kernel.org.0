Return-Path: <linux-media+bounces-11401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E49D8C3F31
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 12:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07EC2B209D3
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573021527BD;
	Mon, 13 May 2024 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hOxqNYRG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDF6152501
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 10:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715596756; cv=none; b=MCY2QiOJV93IU6Z63fRJUYqrIj+FM0yv8+NdAQieKxePJyq7dysNVhiaLIdAHqFyEX2oyuoA/KFXrQbuAXQO5hrsT1NfupPvdCHqUYXeAh80DKvyXzIH+YHtOeOWdJAVdXTfYOWZdCIIds0fYuLtT6SS0m59+3o/34I15jHf3P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715596756; c=relaxed/simple;
	bh=bO77ZRGvWIEiIfC7TMwMEcW0RLLTSTMSPZNgoIU1nDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZioGVagEZ+HjrGz2HnUl7ktyJn14QghoUxYwsuUdJi+uUtUtZ6Rbg0ZNC6SA5UeA2OSQGCdiDhwfIQWuSmFn12FQiScG7lSe3vILnIfNw0jpJctWgEIRouawg7/GJHrzLVqxYMO8L/wsE6tkTQGSjEEnwIwANHMB/a5RLQvn7jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hOxqNYRG; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7d9e70f388fso202337139f.2
        for <linux-media@vger.kernel.org>; Mon, 13 May 2024 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715596754; x=1716201554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buebxfvhrKsxWwmHpN8HIqeIzqJ1dJvpRSV41poUdTw=;
        b=hOxqNYRGSsHd+8FFhTIku1RhY9FhCGSRa0bPhuX07H2yzx0ybN6AvZqj4xjSskhP4h
         8wdHeOAnb9ryI1saRG5rHj3h+H9ZGfGchb2P0hckXMwFzkDFFifivpgoDOTDUmuuXFR+
         DUfkIflWS2TkjibMovVai8twPJzhm3ooGiBfQOsvccnrc4iPo6Rdqwt85i9x/tLyNKDi
         vDeoltKJTcBqH+/NfvciEyQWxCD2nkEyT6Ip22QRZfgcvRcz4u3yfr01fmiAw8U4INTb
         kFmvdjGA5DiZ5B/skVWYtRQu9ou25Tu0kmZbK1q++YW8IIemQgVOkQwSnwtMM0lJbwVo
         RXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715596754; x=1716201554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buebxfvhrKsxWwmHpN8HIqeIzqJ1dJvpRSV41poUdTw=;
        b=m+Q7dFIPolHSKTe96RWTz9JoDyo/zNASEnYnjExdHDHBs8LBWijeuYk2gR9aa88gSj
         qCWSeGOEm/q6qY3AaaQkuz0zWt8sw5bss5G1RYbjBoMZ8mAhhMakjLwjxpl8zyWRCf+e
         2iXosacF4qNt90uf2NwcyjP/kXSliQxID37ZIgc2e3vSKnFDtlRJbAikxSie1r+MgfhQ
         qYP4TzMUx1J03w1XiSj2nbQRNbrUd1bx+3T86/7Hz60yDe8ZOlbI4+F2y4XawHQHksXO
         NUF2OJSDDxW0eiET1SJVwbIUDQt1pjSmx/k0UYORdWYH6iTQg1rewvFRFj1EVy1O03d/
         cUHA==
X-Forwarded-Encrypted: i=1; AJvYcCW5BEwoBQ2GwRPR42SL0itQVn/kOT2Qpon/7A6ptQ+FNnuIFpR1xtg0GSilFCYxiAq5jOC/4/D2QE+JhJrWtGwRsWMe9e8hrJS5cro=
X-Gm-Message-State: AOJu0YzUW2oJ4pKEkitjd+4Tu1c8dsXIX1MtRLF9G6wVx3hJN88XXOJc
	ph/b+V/VgdiOIKlnRJwfWsKS4tS0YXRMGrRkaudFMHw37q/HU+YH890+YNtmPOEtvpNrO0LoS9y
	52+ql9DmsFGCqGlo2hwN+25KKgcoPYtriF546+WCQXYBeu4St1n3u
X-Google-Smtp-Source: AGHT+IGpxlYX8+VKGkmtPuAIMGxA5UAZbcx0MnAYFeFpA91msfpdz6rwOjVALAC61BpdL+rxCAb37kOiJezzIguf1p0=
X-Received: by 2002:a5e:8e0b:0:b0:7de:e432:fd27 with SMTP id
 ca18e2360f4ac-7e1b5207a33mr1205090239f.13.1715596754196; Mon, 13 May 2024
 03:39:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com> <20240507155413.266057-10-panikiel@google.com>
 <20240510212442.GA758313-robh@kernel.org>
In-Reply-To: <20240510212442.GA758313-robh@kernel.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Mon, 13 May 2024 12:39:02 +0200
Message-ID: <CAM5zL5qx06f7v-fEXRT1=dZ2s=Vo5eske2GrcMubf2ZuPFJ7mA@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] media: dt-bindings: Add Intel Displayport RX IP
To: Rob Herring <robh@kernel.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, tzimmermann@suse.de, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 11:24=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, May 07, 2024 at 03:54:12PM +0000, Pawe=C5=82 Anikiel wrote:
> > Add dt binding for the Intel Displayport receiver FPGA IP.
> > It is a part of the DisplayPort Intel FPGA IP Core, and supports
> > DisplayPort 1.4, HBR3 video capture and Multi-Stream Transport.
> >
> > The user guide can be found here:
> > https://www.intel.com/programmable/technical-pdfs/683273.pdf
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > ---
> >  .../devicetree/bindings/media/intel,dprx.yaml | 172 ++++++++++++++++++
> >  1 file changed, 172 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/=
Documentation/devicetree/bindings/media/intel,dprx.yaml
> > new file mode 100644
> > index 000000000000..01bed858f746
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > @@ -0,0 +1,172 @@
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
> > +  The following parameters have to be set in the devicetree:
> > +    - RX maximum link rate (using link-frequencies)
> > +    - Maximum lane count (using data-lanes)
> > +    - Support MST (using multi-stream-support)
> > +    - Max stream count (inferred from the number of ports)
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
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        description: MST virtual channel 0 or SST main link
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +
> > +            properties:
> > +              link-frequencies: true
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +              multi-stream-support: true
> > +
> > +            required:
> > +              - data-lanes
> > +              - link-frequencies
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 0 or SST main link
>
> How can port@0 also be "MST virtual channel 0 or SST main link"?

Sorry, I made a mistake. port@0 should be something like "Input port".

>
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 1
> > +
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 2
> > +
> > +      port@4:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 3
> > +
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    dp-receiver@c0062000 {
> > +        compatible =3D "intel,dprx-20.0.1";
> > +        reg =3D <0xc0062000 0x800>;
> > +        interrupt-parent =3D <&dprx_mst_irq>;
> > +        interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                dprx_mst_in: endpoint {
> > +                    remote-endpoint =3D <&dp_input_mst_0>;
> > +                    data-lanes =3D <0 1 2 3>;
> > +                    link-frequencies =3D /bits/ 64 <1620000000 2700000=
000
> > +                                                  5400000000 810000000=
0>;
> > +                    multi-stream-support;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                dprx_mst_0: endpoint {
> > +                    remote-endpoint =3D <&video_mst0_0>;
> > +                };
> > +            };
> > +
> > +            port@2 {
> > +                reg =3D <2>;
> > +                dprx_mst_1: endpoint {
> > +                    remote-endpoint =3D <&video_mst1_0>;
> > +                };
> > +            };
> > +
> > +            port@3 {
> > +                reg =3D <3>;
> > +                dprx_mst_2: endpoint {
> > +                    remote-endpoint =3D <&video_mst2_0>;
> > +                };
> > +            };
> > +
> > +            port@4 {
> > +                reg =3D <4>;
> > +                dprx_mst_3: endpoint {
> > +                    remote-endpoint =3D <&video_mst3_0>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +  - |
> > +    dp-receiver@c0064000 {
> > +        compatible =3D "intel,dprx-20.0.1";
> > +        reg =3D <0xc0064000 0x800>;
> > +        interrupt-parent =3D <&dprx_sst_irq>;
> > +        interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                dprx_sst_in: endpoint {
> > +                    remote-endpoint =3D <&dp_input_sst_0>;
> > +                    data-lanes =3D <0 1 2 3>;
> > +                    link-frequencies =3D /bits/ 64 <1620000000 2700000=
000
> > +                                                  5400000000 810000000=
0>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                dprx_sst_0: endpoint {
> > +                    remote-endpoint =3D <&video_sst_0>;
> > +                };
> > +            };
> > +        };
> > +    };
> > --
> > 2.45.0.rc1.225.g2a3ae87e7f-goog
> >

