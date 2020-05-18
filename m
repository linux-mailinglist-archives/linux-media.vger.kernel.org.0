Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78DA21D7B46
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 16:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgEROcE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 10:32:04 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42089 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgEROcE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 10:32:04 -0400
Received: by mail-io1-f65.google.com with SMTP id e18so10757739iog.9;
        Mon, 18 May 2020 07:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MpT+nu7nNOLKspYEkQrWYjY1RVTqlNGjWcECXgpB5yE=;
        b=GZ3i6CI9ed60lGAQFs0OVx5yGlTdb9DojYPEEG2V3PCs7aZaUfcCzTeySERozIRctv
         Q9epOsM1pa7z79UhB/2KUamv4oLQwR5R6SweK4DKNaQRXKENZKDSKmpnueyUzHhyn2S3
         CTs3M87xdUNlbbsZVdqAnXlVSdI/ndHkFDlXKnouFzDJMQmteFPc7iaMQk/OavGk/mu6
         Ef1CZrKr358w/JgvQB/zeN8frECVhz1XAs6yOEOr0S1Sr6NweiaVGgtSC9SCcun5njoJ
         pG4vq65BRWa+M7AW/eHLhXr/Lh3N/GRr8HoT/9BvHZ8Ek3SYH7qvKZW2MqYZKPjJBJN2
         PhRg==
X-Gm-Message-State: AOAM530uDJ/U71TMYSk/0MMD13EIvd1p7/RGVXi9JQw2gtborZsenvo5
        lx/7XkAVs8GR2uCsCAnWMw==
X-Google-Smtp-Source: ABdhPJwvbWX1i1YobTWJ2sW5L/vNBdw/cQ7LkbFo2JKkW8/BcRUhpnwK4wzuSXXypB3KuWClTxgjbA==
X-Received: by 2002:a6b:500e:: with SMTP id e14mr13295274iob.47.1589812322692;
        Mon, 18 May 2020 07:32:02 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a17sm1572365ild.31.2020.05.18.07.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:31:49 -0700 (PDT)
Received: (nullmailer pid 24775 invoked by uid 1000);
        Mon, 18 May 2020 14:31:48 -0000
Date:   Mon, 18 May 2020 08:31:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= 
        <shengnan.wang@mediatek.com>
Subject: Re: [V6, 1/2] media: dt-bindings: media: i2c: Document DW9768
 bindings
Message-ID: <20200518143148.GA18032@bogus>
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
 <20200518132731.20855-2-dongchun.zhu@mediatek.com>
 <CAAFQd5Byvc8Fb0f3_81xSKsuyvsQJm-8g8y1Kx2aUcC=PwpS7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5Byvc8Fb0f3_81xSKsuyvsQJm-8g8y1Kx2aUcC=PwpS7w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 18, 2020 at 04:12:28PM +0200, Tomasz Figa wrote:
> Hi Dongchun,
> 
> On Mon, May 18, 2020 at 3:29 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > Add DeviceTree binding documentation for Dongwoon Anatech DW9768 voice
> > coil actuator.
> 
> Thanks for the patch. Please see my comments below.
> 
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> This version includes significant changes, so the reviewed-by tag
> shouldn't have been carried out.
> 
> > ---
> >  .../bindings/media/i2c/dongwoon,dw9768.yaml        | 105 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 ++
> >  2 files changed, 112 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > new file mode 100644
> > index 0000000..b909e83
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9768.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Dongwoon Anatech DW9768 Voice Coil Motor (VCM) Lens Device Tree Bindings
> > +
> > +maintainers:
> > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > +
> > +description: |-
> > +  The Dongwoon DW9768 is a single 10-bit digital-to-analog (DAC) converter
> > +  with 100 mA output current sink capability. VCM current is controlled with
> > +  a linear mode driver. The DAC is controlled via a 2-wire (I2C-compatible)
> > +  serial interface that operates at clock rates up to 1MHz. This chip
> > +  integrates Advanced Actuator Control (AAC) technology and is intended for
> > +  driving voice coil lenses in camera modules.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      # for DW9768 VCM
> > +      - dongwoon,dw9768
> > +      # for GT9769 VCM
> > +      - giantec,gt9769
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vin-supply:
> > +    description:
> > +      Definition of the regulator used as I2C I/O interface power supply.
> > +
> > +  vdd-supply:
> > +    description:
> > +      Definition of the regulator used as VCM chip power supply.
> > +
> > +  dongwoon,aac-mode:
> > +    description:
> > +      Indication of AAC mode select.
> > +    allOf:
> > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > +      - enum:
> > +          - 0    #  Direct (default)

Default can be expressed as 'default: 0'.

> > +          - 1    #  AAC2 (operation time# 0.48 x Tvib)
> > +          - 2    #  AAC3 (operation time# 0.70 x Tvib)
> > +          - 3    #  AAC4 (operation time# 0.75 x Tvib)
> > +          - 4    #  Reserved
> > +          - 5    #  AAC8 (operation time# 1.13 x Tvib)
> > +          - 6    #  Reserved
> > +          - 7    #  Reserved
> 
> I'll ultimately leave it to DT maintainers, but is there any reason to
> define the reserved values?

No.

> 
> > +
> > +  dongwoon,aac-timing:
> > +    description:
> > +      Indication of AAC Timing count, unit of 0.1 milliseconds.

Why not just use standard units (-us)?

> > +      Valid values vary from 0 to 63 (default 32).

Looks like constraints.

> > +    allOf:
> > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > +
> > +  dongwoon,clock-dividing-rate:
> > +    description:
> > +      Indication of VCM internal clock dividing rate select, as one multiple
> > +      factor to calculate VCM ring periodic time Tvib.
> > +    allOf:
> > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > +      - enum:
> > +          - 0    #  Dividing Rate -  2
> > +          - 1    #  Dividing Rate -  1 (default)
> > +          - 2    #  Dividing Rate -  1/2
> > +          - 3    #  Dividing Rate -  1/4
> > +          - 4    #  Dividing Rate -  8
> > +          - 5    #  Dividing Rate -  4
> > +          - 6    #  Dividing Rate -  Reserved
> > +          - 7    #  Dividing Rate -  Reserved
> 
> Ditto.
> 
> Best regards,
> Tomasz
