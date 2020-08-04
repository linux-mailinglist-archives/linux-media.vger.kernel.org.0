Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554EE23B699
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 10:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgHDIPJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 04:15:09 -0400
Received: from mga03.intel.com ([134.134.136.65]:42260 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726580AbgHDIPI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Aug 2020 04:15:08 -0400
IronPort-SDR: LynoaAj2tJ0Qaaa4eQddhXwvgntnMdcz2CVPrdae9XW35400pULLYDgm176byLR5YE/TLVN3Bg
 Rts+DDRgOpYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="152236361"
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="152236361"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 01:15:07 -0700
IronPort-SDR: YF9oO/DawN+7bgLS7A4hJFZSDGF0+0HcjlrlB5v2RNEi9n5p6xZqiRiBl31h4V/Ye3UdYO6ff6
 /webKnV6QCTw==
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="275730091"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 01:15:01 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1BF3420686; Tue,  4 Aug 2020 11:14:59 +0300 (EEST)
Date:   Tue, 4 Aug 2020 11:14:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: i2c: ov5640: Document
 bus-type property
Message-ID: <20200804081458.GC13316@paasikivi.fi.intel.com>
References: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596465107-14251-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596465107-14251-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thanks for the update.

On Mon, Aug 03, 2020 at 03:31:44PM +0100, Lad Prabhakar wrote:
> Document the possible bus-type's supported by the OV5640 sensor driver.
> 
> Also add the bus-type in example node.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.txt | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.txt b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
> index c97c2f2da12d..00131dbb147e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
> @@ -36,9 +36,15 @@ Endpoint node required properties for parallel connection are:
>  - data-shift: shall be set to <2> for 8 bits parallel bus
>  	      (lines 9:2 are used) or <0> for 10 bits parallel bus
>  - hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> +		(Required for bus-type 5)
>  - vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
> +		(Required for bus-type 5)
>  - pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
> -	       signal.
> +	       signal. (Required for bus-type 5)
> +- bus-type: data bus type. Possible values are:
> +	    4 - MIPI CSI-2 D-PHY
> +	    5 - Parallel
> +	    6 - Bt.656

This is under required parallel properties. You could document value 4
under CSI-2 related properties.

>  
>  Examples:
>  
> @@ -86,6 +92,7 @@ Examples:
>  				hsync-active = <0>;
>  				vsync-active = <0>;
>  				pclk-sample = <1>;
> +				bus-type = <5>;
>  			};
>  		};
>  	};

-- 
Regards,

Sakari Ailus
