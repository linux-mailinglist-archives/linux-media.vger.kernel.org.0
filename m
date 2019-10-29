Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA16E8949
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 14:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388406AbfJ2NUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 09:20:12 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36794 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388281AbfJ2NUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 09:20:12 -0400
Received: by mail-oi1-f194.google.com with SMTP id j7so8868697oib.3;
        Tue, 29 Oct 2019 06:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gm3nwvKN/0SeIySyt2d2lQknnEH18/vi8nr/1HQlN/A=;
        b=Yh/1G0rLKBLR4T2UzKY3I+Pw3XuP8IdCCdh9+oUVAu/MFOY9/70+iNnR+5RFiPVJtk
         lqqOAzXE2UOhX+KuGl8sg68xMVEOFG7fbFkmlzERDRSnIWgSNVS1OWTcp5PUR/izhmvK
         nT/GRQx1OZvMV9R2drH/1zJ2eLKuDDPKTS4OUYVZUyjgPiKAOBMA+dluYislhf+h8+IB
         LEp3dOL7FVDEHq3ACz17uQZyHJ34FyHxDIb94L8TR0MPk6yZvLvPSXTmLnBiydLoJpHv
         Eoz4wRSo3lxiUWmQZTzEkoYBbiV5tPVw1Y4lZU26jSYtpOC9QzCxxXbuZatp3bbK9wA8
         jUGw==
X-Gm-Message-State: APjAAAW6YTL1WmV79dOC6J5nt0NzJYsuF0skCpLhNiJMrm9zATeBAoh3
        L1Dl0OV5PaFVlzO/lX3omGnQxmw=
X-Google-Smtp-Source: APXvYqxBr9BcsgjN2O+ugt0h9hjx0FmQ8d4BcxJKl7dN/vF8RSg6YeaukCQFRxv8quIMLIUJZ21dqQ==
X-Received: by 2002:aca:fd15:: with SMTP id b21mr4046413oii.11.1572355210940;
        Tue, 29 Oct 2019 06:20:10 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k10sm3805854oig.25.2019.10.29.06.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 06:20:09 -0700 (PDT)
Date:   Tue, 29 Oct 2019 08:20:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch 01/19] dt-bindings: media: cal: update binding to use
 syscon
Message-ID: <20191029132009.GB27597@bogus>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-2-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018153437.20614-2-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 18, 2019 at 10:34:19AM -0500, Benoit Parrot wrote:
> Update Device Tree bindings for the CAL driver to use syscon to access
> the phy config register instead of trying to map it directly.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  Documentation/devicetree/bindings/media/ti-cal.txt | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
> index ae9b52f37576..782f801b12a9 100644
> --- a/Documentation/devicetree/bindings/media/ti-cal.txt
> +++ b/Documentation/devicetree/bindings/media/ti-cal.txt
> @@ -10,9 +10,14 @@ Required properties:
>  - compatible: must be "ti,dra72-cal"
>  - reg:	CAL Top level, Receiver Core #0, Receiver Core #1 and Camera RX
>  	control address space
> -- reg-names: cal_top, cal_rx_core0, cal_rx_core1, and camerrx_control
> +- reg-names: cal_top, cal_rx_core0, cal_rx_core1 and camerrx_control
>  	     registers
>  - interrupts: should contain IRQ line for the CAL;
> +- syscon-camerrx: phandle to the device control module and offset to the
> +		  control_camerarx_core register
> +		  This node is meant to replace the "camerrx_control" reg
> +		  entry above but "camerrx_control" is still handled
> +		  for backward compatibility.

Needs a vendor prefix and drop 'syscon'.

>  
>  CAL supports 2 camera port nodes on MIPI bus. Each CSI2 camera port nodes
>  should contain a 'port' child node with child 'endpoint' node. Please
> @@ -25,13 +30,12 @@ Example:
>  		ti,hwmods = "cal";
>  		reg = <0x4845B000 0x400>,
>  		      <0x4845B800 0x40>,
> -		      <0x4845B900 0x40>,
> -		      <0x4A002e94 0x4>;
> +		      <0x4845B900 0x40>;
>  		reg-names = "cal_top",
>  			    "cal_rx_core0",
> -			    "cal_rx_core1",
> -			    "camerrx_control";
> +			    "cal_rx_core1";
>  		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +		syscon-camerrx = <&scm_conf 0xE94>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -- 
> 2.17.1
> 
