Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A33B986785
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 18:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732775AbfHHQ5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 12:57:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:11275 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728020AbfHHQ5G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 12:57:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Aug 2019 09:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,362,1559545200"; 
   d="scan'208";a="179895442"
Received: from okartau-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.35.161])
  by orsmga006.jf.intel.com with ESMTP; 08 Aug 2019 09:57:00 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 0E0F721F8E; Thu,  8 Aug 2019 19:54:16 +0300 (EEST)
Date:   Thu, 8 Aug 2019 19:54:16 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     dongchun.zhu@mediatek.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com,
        Ben Kao <ben.kao@intel.com>
Subject: Re: [V1, 1/2] media: dt-bindings: media: i2c: Add bindings for ov8856
Message-ID: <20190808165416.GA1845@kekkonen.localdomain>
References: <20190808092215.5608-1-dongchun.zhu@mediatek.com>
 <20190808092215.5608-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808092215.5608-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

(Cc'ing Ben, too.)

On Thu, Aug 08, 2019 at 05:22:14PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> Add device tree binding documentation for the ov8856 camera sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../devicetree/bindings/media/i2c/ov8856.txt       | 41 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.txt b/Documentation/devicetree/bindings/media/i2c/ov8856.txt
> new file mode 100644
> index 0000000..96b10e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.txt
> @@ -0,0 +1,41 @@
> +* Omnivision OV8856 MIPI CSI-2 sensor
> +
> +Required Properties:
> +- compatible: shall be "ovti,ov8856"
> +- clocks: reference to the xvclk input clock
> +- clock-names: shall be "xvclk"

Could you add "clock-frequency" property here, please, and specify the
upper and lower limits?

> +- avdd-supply: Analog voltage supply, 2.8 volts
> +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> +- dvdd-supply: Digital core voltage supply, 1.2 volts
> +- reset-gpios: Low active reset gpio
> +
> +The device node shall contain one 'port' child node with an
> +'endpoint' subnode for its digital output video port,
> +in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +The endpoint optional property 'data-lanes' shall be "<0 1 3 4>".

If you don't support lane reordering, then monotonically incrementing lane
numbers from 1 onwards are recommended.

Please also make the property mandatory.

> +
> +Example:
> +&i2c7 {
> +	ov8856: camera-sensor@10 {
> +		compatible = "ovti,ov8856";
> +		reg = <0x10>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&clk_24m_cam>;
> +
> +		clocks = <&cru SCLK_TESTCLKOUT1>;
> +		clock-names = "xvclk";
> +
> +		avdd-supply = <&mt6358_vcama2_reg>;
> +		dvdd-supply = <&mt6358_vcamd_reg>;
> +		dovdd-supply = <&mt6358_vcamio_reg>;
> +		reset-gpios = <&gpio2 3 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			wcam_out: endpoint {
> +				remote-endpoint = <&mipi_in_wcam>;
> +				data-lanes = <0 1 3 4>;
> +			};
> +		};
> +	};
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 783569e..7746c6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11889,6 +11889,7 @@ L:	linux-media@vger.kernel.org
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Maintained
>  F:	drivers/media/i2c/ov8856.c
> +F:	Documentation/devicetree/bindings/media/i2c/ov8856.txt
>  
>  OMNIVISION OV9650 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
