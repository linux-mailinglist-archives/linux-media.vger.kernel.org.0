Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4007E62C1D
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 00:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfGHWuY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 18:50:24 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42313 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfGHWuX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 18:50:23 -0400
Received: by mail-io1-f68.google.com with SMTP id u19so38972090ior.9;
        Mon, 08 Jul 2019 15:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H/MyjdanrQ6K/py9dIxz3e56bfKj5atUb0fchKi3Mro=;
        b=n/tyF1mXNSSP9vpo6g0k/fdUbM6rrMbK/gnPA8QeYC/sNBGocrZbtOst2mdRhdk11i
         9st6PNys6pMxvhFQgim/bD1m4SDq/o6/7JVM5wQHC97zjNvhlRmp0fEyq5HhUAMU9eJc
         GRevuFxc0vvR16kRO+UbWudvNxviyrnkIZ7Sccg9v7au6kjtw1/d9JvwarlB1X1TTdEV
         IlidT+vP5OWquLKDFJsNgubuvYDp2MU9MhtTyrT7NawD9txLKh87La5WCAAILU8vWw8K
         FMZX5Z8gpLCnstxDjHKF4YIoaLngm8EfZa/sN5/Dq41Am6skyCxmv5UI1yDodsAXojcO
         z3hg==
X-Gm-Message-State: APjAAAXuC1wBadTuZWnSdWyY8ww6zEfE6YCEe0Yb2f8VwSXpA3u0ksSn
        v3Pocy/70OOGKDV3uZlN2w==
X-Google-Smtp-Source: APXvYqzZFN9dAG5V65nMJvTNBFQoqUzrTk2W0/Fnk2oO/UP/uvEe0rRUTXgyk6ynGmU3h+IdLkXYAQ==
X-Received: by 2002:a5e:9701:: with SMTP id w1mr22230948ioj.294.1562626222486;
        Mon, 08 Jul 2019 15:50:22 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y20sm16723564iol.34.2019.07.08.15.50.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 15:50:21 -0700 (PDT)
Date:   Mon, 8 Jul 2019 16:50:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 UHD-SDI Receiver Subsystem
Message-ID: <20190708225020.GA28126@bogus>
References: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
 <1559656556-79174-2-git-send-email-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559656556-79174-2-git-send-email-vishal.sagar@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 04, 2019 at 07:25:55PM +0530, Vishal Sagar wrote:
> Add bindings documentation for Xilinx UHD-SDI Receiver Subsystem.
> 
> The Xilinx UHD-SDI Receiver Subsystem consists of SMPTE UHD-SDI (RX) IP
> core, an SDI RX to Video Bridge IP core to convert SDI video to native
> video and a Video In to AXI4-Stream IP core to convert native video to
> AXI4-Stream.
> 
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> ---
>  .../bindings/media/xilinx/xlnx,sdirxss.txt         | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt
> new file mode 100644
> index 0000000..8445bee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt
> @@ -0,0 +1,80 @@
> +
> +Xilinx SMPTE UHD-SDI Receiver Subsystem Device Tree Bindings
> +------------------------------------------------------------
> +
> +The SMPTE UHD-SDI Receiver (RX) Subsystem allows you to quickly create systems
> +based on SMPTE SDI protocols. It receives unaligned native SDI streams from
> +the SDI GT PHY and outputs an AXI4-Stream video stream, native video, or
> +native SDI using Xilinx transceivers as the physical layer.
> +
> +The subsystem consists of
> +1 - SMPTE UHD-SDI Rx
> +2 - SDI Rx to Native Video Bridge
> +3 - Video In to AXI4-Stream Bridge
> +
> +The subsystem can capture SDI streams in utpo 12G mode and output a dual pixel
> +per clock YUV 422 or 420 10 bits per component AXI4-Stream.
> +
> +Required properties:
> +--------------------
> +- compatible: Must contain "xlnx,v-smpte-uhdsdi-rx-ss"

Only one version?

> +- reg: Physical base address and length of the registers set for the device.
> +- interrupts: Contains the interrupt line number.
> +- clocks: List of phandles to AXI4-Lite clock, core clock to SMPTE UHD-SDI Rx
> +  and Video clocks.
> +- clock-names: Must contain "s_axi_aclk", "sdi_rx_clk" and "video_out_clk" in
> +  the same order as clocks listed in clocks property.
> +- xlnx,line-rate: The maximum mode supported by the design. Possible values are
> +  are as below -
> +  12G_SDI_8DS	- 12G mode
> +  6G_SDI	-  6G mode
> +  3G_SDI	-  3G mode

I don't think a string is a good fit here. Using 3, 6, 12 with a defined 
unit as defined in property-units.txt is preferred. Register field values are 
okay for vendor specific stuff, too.

> +
> +Optional properties:
> +--------------------
> +- xlnx,include-edh: This is present when the Error Detection and Handling
> +  processor is enabled in design.
> +
> +Ports
> +-----
> +The device node shall contain one 'port' child node as defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Generally the SDI port is connected to a device like SDI Broadcast camera which
> +is independently controlled. Hence port@0 is a source port which can be
> +connected to downstream IP which can work with AXI4 Stream data.
> +
> +Required port properties:
> +-------------------------
> +- reg: 0 - for source port.
> +
> +- xlnx,video-format: This can be XVIP_VF_YUV_422 or XVIP_VF_YUV_420.
> +- xlnx,video-width: This is should be 10.

Don't we have standard properties for these?

I assume width here is really part of the pixel or bus interface format 
rather than physical signals? We typically only have a separate property 
for the latter case.

> +
> +Example:
> +		v_smpte_uhdsdi_rx_ss: v_smpte_uhdsdi_rx_ss@80000000 {

s/_/-/ in the node name. Node names are supposed to be generic when 
possible, but I don't have a suggestion here.

> +			compatible = "xlnx,v-smpte-uhdsdi-rx-ss";
> +			interrupt-parent = <&gic>;
> +			interrupts = <0 89 4>;
> +			reg = <0x0 0x80000000 0x0 0x10000>;
> +			xlnx,include-edh;
> +			xlnx,line-rate = "12G_SDI_8DS";
> +			clocks = <&clk_1>, <&si570_1>, <&clk_2>;
> +			clock-names = "s_axi_aclk", "sdi_rx_clk", "video_out_clk";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					xlnx,video-format = <XVIP_VF_YUV_422>;
> +					xlnx,video-width = <10>;
> +
> +					sdirx_out: endpoint {
> +						remote-endpoint = <&vcap_sdirx_in>;
> +					};
> +				};
> +			};
> +		};
> -- 
> 1.8.3.1
> 
