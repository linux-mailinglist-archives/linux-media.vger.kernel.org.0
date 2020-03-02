Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4211D176349
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 19:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgCBSyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 13:54:24 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42314 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgCBSyX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 13:54:23 -0500
Received: by mail-oi1-f195.google.com with SMTP id l12so269415oil.9;
        Mon, 02 Mar 2020 10:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=azLo3QGLGJyP5HRfRWmkTZHyFOBCcHiq0HFCES3HCjQ=;
        b=RO7MaPdMZVds3iVXLaeuknpCHBgfy8nSrynfcikpHKy2LsNtld9ptvjW2e66TfQIDd
         NCDXNRKDABENeAP6O3iuzGSgc5pJZSvxnL500AQdhOW7ObK/TcYT2EJbzkdM+2s+iz10
         EDCAcDOc4+sggPkW9E3f5BHvEfTrb7TN4EHe5N8zvrEkxS5ALkh8LmvPRtvtljEMQqKp
         0nKWnyw/r6VVJcdaJm4aMON4JBQHhO7Vxzcnr4IPhrCQ+Gqq+umugK4d2cpgTbzF2yZ0
         6OEIM7oge2EWbEt+f7PzX6d4vzPDLD56jXTXZAxYk4g8Ny7YGJr5P0SVXr7SUgNVQDoX
         C1Hw==
X-Gm-Message-State: ANhLgQ1HBDHfi2YqUUoXMF8Q0xV3wc0DatpYFxAQc5KId+SCCBAhmp7r
        tBXSCWvbSMCrjKTWBkBbAw==
X-Google-Smtp-Source: ADFU+vvfubqUlzmH5eWYI1D5Jft/lIpMtECPbLNGVBuawGuLFLFxvD3bdyL1NoKnop7MocC44hue/Q==
X-Received: by 2002:a54:4011:: with SMTP id x17mr1020oie.35.1583175263204;
        Mon, 02 Mar 2020 10:54:23 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u3sm6838355ote.50.2020.03.02.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 10:54:22 -0800 (PST)
Received: (nullmailer pid 32444 invoked by uid 1000);
        Mon, 02 Mar 2020 18:54:21 -0000
Date:   Mon, 2 Mar 2020 12:54:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com,
        dongchun.zhu@mediatek.com
Subject: Re: [V3, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS
 entry
Message-ID: <20200302185421.GA31928@bogus>
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
 <20200228155958.20657-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228155958.20657-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 28 Feb 2020 23:59:57 +0800, Dongchun Zhu wrote:
> This patch is to add the Devicetree binding documentation and
> MAINTAINERS entry for dw9768 actuator.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/dongwoon,dw9768.yaml        | 55 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.example.dts:19.13-26: Warning (reg_format): /example-0/camera-lens@0c:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'

See https://patchwork.ozlabs.org/patch/1246607
Please check and re-submit.
