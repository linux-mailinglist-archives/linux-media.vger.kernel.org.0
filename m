Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0D018BEDD
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 19:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgCSSBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 14:01:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50338 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgCSSBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 14:01:33 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8FDFA53;
        Thu, 19 Mar 2020 19:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584640891;
        bh=J0G9o/JIk2L9YAMrgEYnSflrJ+3mDjoCeRH1I4lPqik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l0WeQLfY4oPvGyf+T8Bwr1JXg9rF3wSCsAL/YwHYR/F4V+bPvcMIBVex2/JmFRkPq
         wH0uwGnyJ0/qvbpO0VFVj+sYnrBU90JDCIx7sBKD7tzafPZrokKyt3pDfmx4om2Nkv
         yNo/D2bEwfHVQcIjR59Xc9qhUHFpFJvvzC1CHe/o=
Date:   Thu, 19 Mar 2020 20:01:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alex Riesen <alexander.riesen@cetitec.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 07/10] dt-bindings: adv748x: add information about
 serial audio interface (I2S/TDM)
Message-ID: <20200319180125.GJ14585@pendragon.ideasonboard.com>
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <c9ff553f804f178a247dca356306948e971432fb.1584639664.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9ff553f804f178a247dca356306948e971432fb.1584639664.git.alexander.riesen@cetitec.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

Thank you for the patch.

On Thu, Mar 19, 2020 at 06:42:36PM +0100, Alex Riesen wrote:
> As the driver has some support for the audio interface of the device,
> the bindings file should mention it.

While at it, how about converting the bindings to YAML ? :-) It can of
course be done on top.

> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> ---
>  .../devicetree/bindings/media/i2c/adv748x.txt    | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> index 4f91686e54a6..7d6db052c294 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> @@ -2,7 +2,9 @@
>  
>  The ADV7481 and ADV7482 are multi format video decoders with an integrated
>  HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
> -from three input sources HDMI, analog and TTL.
> +from three input sources HDMI, analog and TTL. There is also support for an
> +I2S compatible interface connected to the audio processor of the HDMI decoder.

s/I2S compatible/I2S-compatible/ ?

> +The interface has TDM capability (8 slots, 32 bits, left or right justified).
>  
>  Required Properties:
>  
> @@ -16,6 +18,8 @@ Required Properties:
>      slave device on the I2C bus. The main address is mandatory, others are
>      optional and remain at default values if not specified.
>  
> +  - #clock-cells: must be <0> if the I2S port is used

Wouldn't it be simpler to set it to 0 unconditionally ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  Optional Properties:
>  
>    - interrupt-names: Should specify the interrupts as "intrq1", "intrq2" and/or
> @@ -47,6 +51,7 @@ are numbered as follows.
>  	  TTL		sink		9
>  	  TXA		source		10
>  	  TXB		source		11
> +	  I2S		source		12
>  
>  The digital output port nodes, when present, shall contain at least one
>  endpoint. Each of those endpoints shall contain the data-lanes property as
> @@ -72,6 +77,7 @@ Example:
>  
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		#clock-cells = <0>;
>  
>  		interrupt-parent = <&gpio6>;
>  		interrupt-names = "intrq1", "intrq2";
> @@ -113,4 +119,12 @@ Example:
>  				remote-endpoint = <&csi20_in>;
>  			};
>  		};
> +
> +		port@c {
> +			reg = <12>;
> +
> +			adv7482_i2s: endpoint {
> +				remote-endpoint = <&i2s_in>;
> +			};
> +		};
>  	};

-- 
Regards,

Laurent Pinchart
