Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3BDFE8951
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 14:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388449AbfJ2NWA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 09:22:00 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40030 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732534AbfJ2NWA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 09:22:00 -0400
Received: by mail-ot1-f65.google.com with SMTP id d8so9701800otc.7;
        Tue, 29 Oct 2019 06:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qm6YKg+tpScIEXrceozPkWxGdk+JQIAQFB6SK8BhUfo=;
        b=ckxDPvWBqqgAkpZ4i+mMDypA9t065qiYQhjNb02MnEWuzyQiZfa4SK8gFti2XTwIqJ
         HbIlI0NCwtUGCenwN4Xr/vtr4zPMqtSRJLtbl+7zN6Du+5JKyDqJUUjxG08ql06zd/v9
         CIpjqNQ+wsRBnwwoOyhPnqTSqrxJylHE6wvRLSM+xe0Ae6QLmJIMj8TMt0EQ9hxJFTZw
         NJ96MGCJoADw7aF/j68NioKnTATvh1jTtAaDAQatALYhuTo9ybK5owxX3xeZF8ZjTMkT
         NSF88R3fNeiPLOCTEI3bCI0QK5y0kZJpt3hiPtkb62OQAtwenMPzdRl8u+jXzN5tHdz0
         dpjg==
X-Gm-Message-State: APjAAAXxt3hpoKcMr6zrgf6m0cGlF0oSR0MR2wJaxiRU53REeW0Ni0On
        zutEhgaOTZ7r8qSGST0T1w==
X-Google-Smtp-Source: APXvYqwERtm1vBKo153rKw19EJkDo3JTPsearfO7CzEj+WTKjFxIcVlacg9tF6oYAAIvPjtZLNbbkQ==
X-Received: by 2002:a9d:7f8d:: with SMTP id t13mr17183455otp.27.1572355318795;
        Tue, 29 Oct 2019 06:21:58 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l7sm1668737otf.39.2019.10.29.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 06:21:58 -0700 (PDT)
Date:   Tue, 29 Oct 2019 08:21:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch 02/19] dt-bindings: media: cal: update binding example
Message-ID: <20191029132157.GA27757@bogus>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-3-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018153437.20614-3-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 18, 2019 at 10:34:20AM -0500, Benoit Parrot wrote:
> Update binding example to show proper endpoint properties and linkage.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  .../devicetree/bindings/media/ti-cal.txt      | 32 ++++++++++---------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
> index 782f801b12a9..6b56fddcfc4a 100644
> --- a/Documentation/devicetree/bindings/media/ti-cal.txt
> +++ b/Documentation/devicetree/bindings/media/ti-cal.txt
> @@ -27,7 +27,6 @@ Documentation/devicetree/bindings/media/video-interfaces.txt.
>  Example:
>  	cal: cal@4845b000 {
>  		compatible = "ti,dra72-cal";
> -		ti,hwmods = "cal";
>  		reg = <0x4845B000 0x400>,
>  		      <0x4845B800 0x40>,
>  		      <0x4845B900 0x40>;
> @@ -45,9 +44,10 @@ Example:
>  
>  			csi2_0: port@0 {
>  				reg = <0>;
> -				endpoint {
> -					slave-mode;
> -					remote-endpoint = <&ar0330_1>;
> +				csi2_phy0: endpoint@0 {

Unit address without 'reg' is not correct.

> +					remote-endpoint = <&csi2_cam0>;
> +					clock-lanes = <0>;
> +					data-lanes = <1 2>;
>  				};
>  			};
>  			csi2_1: port@1 {
> @@ -57,19 +57,21 @@ Example:
>  	};
>  
>  	i2c5: i2c@4807c000 {
> -		ar0330@10 {
> -			compatible = "ti,ar0330";
> -			reg = <0x10>;
> +		status = "okay";

Don't show status in examples.

> +		clock-frequency = <400000>;
>  
> -			port {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> +		ov5640@3c {

camera-sensor@3c

> +			compatible = "ovti,ov5640";
> +			reg = <0x3c>;
> +
> +			clocks = <&clk_ov5640_fixed>;
> +			clock-names = "xclk";
>  
> -				ar0330_1: endpoint {
> -					reg = <0>;
> -					clock-lanes = <1>;
> -					data-lanes = <0 2 3 4>;
> -					remote-endpoint = <&csi2_0>;
> +			port {
> +				csi2_cam0: endpoint {
> +					remote-endpoint = <&csi2_phy0>;
> +					clock-lanes = <0>;
> +					data-lanes = <1 2>;
>  				};
>  			};
>  		};
> -- 
> 2.17.1
> 
