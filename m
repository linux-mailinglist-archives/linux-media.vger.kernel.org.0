Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADE9F5B64B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 10:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfGAIFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 04:05:00 -0400
Received: from mga01.intel.com ([192.55.52.88]:23367 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727080AbfGAIFA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Jul 2019 04:05:00 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Jul 2019 01:04:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,438,1557212400"; 
   d="scan'208";a="163612156"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008.fm.intel.com with ESMTP; 01 Jul 2019 01:04:58 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id AF9C52080B; Mon,  1 Jul 2019 11:04:57 +0300 (EEST)
Date:   Mon, 1 Jul 2019 11:04:57 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
Message-ID: <20190701080457.acucsi6p3mlmbg75@paasikivi.fi.intel.com>
References: <20190520201812.7937-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520201812.7937-1-marex@denx.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On Mon, May 20, 2019 at 10:18:11PM +0200, Marek Vasut wrote:
> Add bindings for the Intersil ISL7998x BT656-to-MIPI-CSI2 decoder.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-media@vger.kernel.org
> ---
>  .../bindings/media/i2c/isl7998x.txt           | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/isl7998x.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/isl7998x.txt b/Documentation/devicetree/bindings/media/i2c/isl7998x.txt
> new file mode 100644
> index 000000000000..c21703983360
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/isl7998x.txt
> @@ -0,0 +1,37 @@
> +Intersil ISL7998x BT656-to-MIPI-CSI2 decoder
> +
> +The Intersil ISL7998x is a BT656-to-MIPI-CSI decoder which, capable of
> +receiving up to four analog stream and multiplexing them into up to four
> +MIPI CSI2 virtual channels, using one MIPI clock lane and 1/2 data lanes.
> +
> +Required Properties:
> +- compatible: value should be "isil,isl79987"
> +- pd-gpios: a GPIO spec for the Power Down pin (active high)
> +
> +Option Properties:
> +- isil,num-inputs: Number of connected inputs (1, 2 or 4)

The presence of ports describing connected Bt.656 inputs tells this.

> +
> +For further reading on port node refer to
> +Documentation/devicetree/bindings/media/video-interfaces.txt.

Which endpoint properties are relevant for the endpoint(s) in the CSI-2 port?
How about the ports describing the Bt.656 interfaces? You should have
those, too...

> +
> +Example:
> +
> +	i2c_master {
> +		isl7998x_mipi@44 {
> +			compatible = "isil,isl79987";
> +			reg = <0x44>;
> +			isil,num-inputs = <4>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_videoadc>;
> +			pd-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
> +			status = "okay";
> +
> +			port {
> +				isl79987_to_mipi_csi2: endpoint {
> +					remote-endpoint = <&mipi_csi2_in>;
> +					clock-lanes = <0>;
> +					data-lanes = <1 2>;
> +				};
> +			};
> +		};
> +	};
> 

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
