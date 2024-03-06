Return-Path: <linux-media+bounces-6565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E350F8735B5
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 12:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DECA9B23FDB
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 11:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2079E7FBA1;
	Wed,  6 Mar 2024 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Nk+ahPnP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FBF5EE70
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 11:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725413; cv=none; b=uX31eq67qW3JYe4DL+97gOEDEXXVce3l87Ih9BJvMfxkRP3kiZquYHE1rWtVmpY0XK7tBwWOr5oskyQUJStUxtCuNsY/WZFL4cRocNKUCqdTRul1B8vdcjS4VZR/E2XIrHYHCTbCeE6S0rUdvrjKTrBxdrAQZlCl9QXVHmUEBVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725413; c=relaxed/simple;
	bh=YX5KNi9JoOZfojze0pjQys77KFZBO6i19SqjE/MREoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JeGZ5KsMuO70ZWQjz5bX4TBUgJeKzS2l7wjPJs43z8rqnnXdnGZO+eULzca4JJYdg8PBm9/kcXiHhp9yRt+TN6hnRg+U3tiETQ0GB+biK14wcuzk+xXutKAdorspiOaj24OD4KDr5R0xNE3shsATFFdd/DRDn9SJpPevrUHISR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Nk+ahPnP; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-565b434f90aso9784435a12.3
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 03:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1709725409; x=1710330209; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yZZ4mVEuzjiXR5CF3CJkyChtg0w5lyqbPeRfi90uImI=;
        b=Nk+ahPnPQaRhFhOua0kKqvBimAnQV4qNv6Q19l2QeQ9PaWwubcPQNRC3AW+IBSNJnG
         5iegVHWRR+xymHk7dp/vjsLme03Q1C3z3I8TSxrnIDhNgNY5whMF9nzQKGc3ixBaOrUO
         llv0VPYm/cqBhSlhPgXg5Er9aY3PiIUaak8/RoaXqQx2gS/wsxpJcPeuchw0a3Yu4IGQ
         I8a5gTKqyeq3TMaUXx0Heg0DnC/u+yoK3xcJbmE/dINXgaXa4ajXlOWm78LgH71twM5w
         ng3rzlwy4oHR0pj2dlg/hgbW7znMHifMiblExu9rHh6pYCMhfltPVU6eCopa2a5IbeJl
         nOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709725409; x=1710330209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZZ4mVEuzjiXR5CF3CJkyChtg0w5lyqbPeRfi90uImI=;
        b=NVyfJVTHslO4/a2abQWcT3bKv/JEBCEgpMiFiXzzB+pG87zhSMPDVTqg+RHfvPqfbl
         koIEGN4o2Mf4gUkQTzvyFN8Zxs+KBduMBg1+FVkBxSrinmrDY1EbCMVKHaIozp4DTZRq
         XvsMHqzD3vtS8AIra8nTBmTOe9ADKqbwWibPvC9Cl8HK58Nug7Zitd4ddlMSzX4WQ2Zn
         rOi+Cfmtdio53fALKtDHg9i5ClAxLUDByYpdmY6oCSpDL+Jq3L1QmdMiy7dx3/O66Pld
         /BaK/XEqMZUQwADJrsupu0Ullv6aBAQu2cGe7DfQ1ykasBH3CnkLI7D545P8ffcJxTmH
         UCVA==
X-Forwarded-Encrypted: i=1; AJvYcCWJyVdYANjXsK1g4sz10FzG2qe801ukCWuilKwXVUyz6RFwsfTdPBSBpS6oPC0hfA3CX2OqtidKWbXkvVxF0kzQMxqCg1Dxm48zS6s=
X-Gm-Message-State: AOJu0Yxd0mfsSYh678kF4Tzqf6aFDqwsOHogh/8F9Ztx9ooxlvwiYWmQ
	Po8enio0aqfmvfLDUALxd8rQBoaIfhzp8iJAYooBJDPk099Lje2y3aeYPPPq68LiWnT8muQvr2R
	9Mbck0IPuI/Fn6F63Yit6bQcr6rNtOIpvLnHcWQ==
X-Google-Smtp-Source: AGHT+IF3vAORKz02jVRpKImBVSKHtpIn3gxGmIfBMByYrMdcNWR+mujAPqHxYSvjSSOWngMTQqSdDU0aWilEsyj6NG0=
X-Received: by 2002:a05:6402:230f:b0:565:bd4d:8a89 with SMTP id
 l15-20020a056402230f00b00565bd4d8a89mr11282951eda.31.1709725408688; Wed, 06
 Mar 2024 03:43:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223163012.300763-1-jacopo.mondi@ideasonboard.com>
 <20240223163012.300763-8-jacopo.mondi@ideasonboard.com> <20240301215857.GO30889@pendragon.ideasonboard.com>
 <zxx7o4zssgerlfhoczbledpmjvr5q2qfzogoytqxc353bulemq@ceo2gwinda3l>
In-Reply-To: <zxx7o4zssgerlfhoczbledpmjvr5q2qfzogoytqxc353bulemq@ceo2gwinda3l>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Wed, 6 Mar 2024 11:42:51 +0000
Message-ID: <CAEmqJPpopGbDJsRkOsd-ph41_Ac6H50DvcwoE0i6hWyVBr=Kkw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] media: dt-bindings: Add bindings for Raspberry Pi
 PiSP Back End
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent and Jacopo,

On Tue, 5 Mar 2024 at 15:25, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Laurent
>
> On Fri, Mar 01, 2024 at 11:58:57PM +0200, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Fri, Feb 23, 2024 at 05:30:09PM +0100, Jacopo Mondi wrote:
> > > Add bindings for the Raspberry Pi PiSP Back End memory-to-memory image
> > > signal processor.
> > >
> > > Datasheet:
> > > https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  .../bindings/media/raspberrypi,pispbe.yaml    | 63 +++++++++++++++++++
> > >  1 file changed, 63 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> > > new file mode 100644
> > > index 000000000000..d7839f32eabf
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> > > @@ -0,0 +1,63 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/raspberrypi,pispbe.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Raspberry Pi PiSP Image Signal Processor (ISP) Back End
> > > +
> > > +maintainers:
> > > +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > +
> > > +description: |
> > > +  The Raspberry Pi PiSP Image Signal Processor (ISP) Back End is an image
> > > +  processor that fetches images in Bayer or Grayscale format from DRAM memory
> > > +  in tiles and produces images consumable by application.
> >
> > s/application/applications/
> >
> > > +
> > > +  The full ISP documentation is available at:
> >
> > s/:$//
> >
> > > +  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - brcm,bcm2712-pispbe
> > > +      - const: raspberrypi,pispbe
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> >
> > As this is a SoC IP with only memory and register interfaces, I would
> > expect two clocks to be present, one for the register interface (AHB ?
> > AXI4-Lite ?) and one for the memory interfaces (AXI4 ?). While the
> > register interface clock is likely always enabled (in all cases that
> > matter in practice) in the BCM2712, I'm not sure this can be guaranteed
> > for future integration in different SoCs. Should we plan for this, and
> > either define two clocks already (with one of them being optional), or
> > name the single clock ?
> >
> > I know v1 named this clock "isp_be", and the name was dropped upon
> > Krzysztof's request, but I think naming the single clock "axi" or "aclk"
> > (assuming that one of them would be the right name) would be fine for
> > the reason explained above.
> >
>
> The PiSP datasheet does not offer many information on the IP
> integration, only a small graph with the memory interfacing, but no
> clocks.
>
> However your reasoning makes sense, and unless someone from RPi
> suggests the contrary, I'll do so

There is only a single clock that clocks the whole BE block, so does
the clock need to be explicitly named?  If it does, perhaps we can
just use "clk" as this is not explicitly an AXI or APB clock?

Naush

>
> > > +
> > > +  iommus:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +    soc {
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > > +
> > > +        isp@880000  {
> > > +             compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
> > > +             reg = <0x10 0x00880000  0x0 0x4000>;
> >
> > Double space, I don't know if that's on purpose.
> >
>
> Ofc it was not.
>
> Thanks
>    j
>
> > > +             interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> > > +             clocks = <&firmware_clocks 7>;
> > > +             iommus = <&iommu2>;
> > > +        };
> > > +    };
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

