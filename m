Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44AA934C2E
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 17:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfFDPZq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 11:25:46 -0400
Received: from mga12.intel.com ([192.55.52.136]:45782 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727901AbfFDPZq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 11:25:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2019 08:25:45 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jun 2019 08:25:41 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C5D4D20BEB; Tue,  4 Jun 2019 18:25:40 +0300 (EEST)
Date:   Tue, 4 Jun 2019 18:25:40 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hans.verkuil@cisco.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 MIPI CSI-2 Rx Subsystem
Message-ID: <20190604152540.wd7c3scez2futh6z@paasikivi.fi.intel.com>
References: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
 <1559555971-193235-2-git-send-email-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559555971-193235-2-git-send-email-vishal.sagar@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

Thanks for the update. A few small issues below...

On Mon, Jun 03, 2019 at 03:29:30PM +0530, Vishal Sagar wrote:
> Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.
> 
> The Xilinx MIPI CSI-2 Rx Subsystem consists of a CSI-2 Rx controller, a
> DPHY in Rx mode, an optional I2C controller and a Video Format Bridge.
> 
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> v8
> - Added reset-gpios optional property to assert video_aresetn
> 
> v7
> - Removed the control name from dt bindings
> - Updated the example dt node name to csi2rx
> 
> v6
> - Added "control" after V4L2_CID_XILINX_MIPICSISS_ACT_LANES as suggested by Luca
> - Added reviewed by Rob Herring
> 
> v5
> - Incorporated comments by Luca Cersoli
> - Removed DPHY clock from description and example
> - Removed bayer pattern from device tree MIPI CSI IP
>   doesn't deal with bayer pattern.
> 
> v4
> - Added reviewed by Hyun Kwon
> 
> v3
> - removed interrupt parent as suggested by Rob
> - removed dphy clock
> - moved vfb to optional properties
> - Added required and optional port properties section
> - Added endpoint property section
> 
> v2
> - updated the compatible string to latest version supported
> - removed DPHY related parameters
> - added CSI v2.0 related property (including VCX for supporting upto 16
>   virtual channels).
> - modified csi-pxl-format from string to unsigned int type where the value
>   is as per the CSI specification
> - Defined port 0 and port 1 as sink and source ports.
> - Removed max-lanes property as suggested by Rob and Sakari
> 
>  .../bindings/media/xilinx/xlnx,csi2rxss.txt        | 119 +++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> new file mode 100644
> index 0000000..fef8179
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> @@ -0,0 +1,119 @@
> +Xilinx MIPI CSI2 Receiver Subsystem Device Tree Bindings
> +--------------------------------------------------------
> +
> +The Xilinx MIPI CSI2 Receiver Subsystem is used to capture MIPI CSI2 traffic
> +from compliant camera sensors and send the output as AXI4 Stream video data
> +for image processing.
> +
> +The subsystem consists of a MIPI DPHY in slave mode which captures the
> +data packets. This is passed along the MIPI CSI2 Rx IP which extracts the
> +packet data. The optional Video Format Bridge (VFB) converts this data to
> +AXI4 Stream video data.
> +
> +For more details, please refer to PG232 Xilinx MIPI CSI-2 Receiver Subsystem.
> +
> +Required properties:
> +--------------------
> +- compatible: Must contain "xlnx,mipi-csi2-rx-subsystem-4.0".
> +- reg: Physical base address and length of the registers set for the device.
> +- interrupts: Property with a value describing the interrupt number.
> +- clocks: List of phandles to AXI Lite and Video clocks.
> +- clock-names: Must contain "lite_aclk" and "video_aclk" in the same order
> +  as clocks listed in clocks property.
> +- xlnx,csi-pxl-format: This denotes the CSI Data type selected in hw design.
> +  Packets other than this data type (except for RAW8 and User defined data
> +  types) will be filtered out. Possible values are as below -
> +  0x1E - YUV4228B
> +  0x1F - YUV42210B
> +  0x20 - RGB444
> +  0x21 - RGB555
> +  0x22 - RGB565
> +  0x23 - RGB666
> +  0x24 - RGB888
> +  0x28 - RAW6
> +  0x29 - RAW7
> +  0x2A - RAW8
> +  0x2B - RAW10
> +  0x2C - RAW12
> +  0x2D - RAW14
> +  0x2E - RAW16
> +  0x2F - RAW20
> +
> +
> +Optional properties:
> +--------------------
> +- xlnx,vfb: This is present when Video Format Bridge is enabled.
> +  Without this property the driver won't be loaded as IP won't be able to generate
> +  media bus format compliant stream output.
> +- xlnx,en-csi-v2-0: Present if CSI v2 is enabled in IP configuration.
> +- xlnx,en-vcx: When present, there are maximum 16 virtual channels, else
> +  only 4. This is present only if xlnx,en-csi-v2-0 is present.
> +- xlnx,en-active-lanes: present if the number of active lanes can be
> +  re-configured at runtime in the Protocol Configuration Register.
> +  Otherwise all lanes, as set in IP configuration, are always active.
> +- reset-gpios: Optional specifier for a GPIO that asserts video_aresetn.
> +
> +Ports
> +-----
> +The device node shall contain two 'port' child nodes as defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +The port@0 is a sink port and shall connect to CSI2 source like camera.
> +It must have the data-lanes property.

Technically this is wrong as data-lanes is an endpoint property. I'd just
leave it out here.

> +
> +The port@1 is a source port and can be connected to any video processing IP
> +which can work with AXI4 Stream data.
> +
> +Required port properties:
> +--------------------
> +- reg: 0 - for sink port.
> +       1 - for source port.
> +
> +Optional endpoint property:

s/Optional/Required/

> +---------------------------
> +- data-lanes: specifies MIPI CSI-2 data lanes as covered in video-interfaces.txt.
> +  This should be in the sink port endpoint which connects to MIPI CSI2 source
> +  like sensor. The possible values are:

And add here that it's only needed for port 0. Or put it to the heading.

I think this is good with these changes.

> +  1       - For 1 lane enabled in IP.
> +  1 2     - For 2 lanes enabled in IP.
> +  1 2 3   - For 3 lanes enabled in IP.
> +  1 2 3 4 - For 4 lanes enabled in IP.
> +
> +Example:
> +
> +	xcsi2rxss_1: csi2rx@a0020000 {
> +		compatible = "xlnx,mipi-csi2-rx-subsystem-4.0";
> +		reg = <0x0 0xa0020000 0x0 0x10000>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 95 4>;
> +		xlnx,csi-pxl-format = <0x2a>;
> +		xlnx,vfb;
> +		xlnx,en-active-lanes;
> +		xlnx,en-csi-v2-0;
> +		xlnx,en-vcx;
> +		clock-names = "lite_aclk", "video_aclk";
> +		clocks = <&misc_clk_0>, <&misc_clk_1>;
> +		reset-gpios = <&gpio 86 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				/* Sink port */
> +				reg = <0>;
> +				csiss_in: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					/* MIPI CSI2 Camera handle */
> +					remote-endpoint = <&camera_out>;
> +				};
> +			};
> +			port@1 {
> +				/* Source port */
> +				reg = <1>;
> +				csiss_out: endpoint {
> +					remote-endpoint = <&vproc_in>;
> +				};
> +			};
> +		};
> +	};
> -- 
> 1.8.3.1

How old is that? :-)

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
