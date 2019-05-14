Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEE11D081
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 22:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfENUWZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 16:22:25 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44738 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfENUWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 16:22:25 -0400
Received: by mail-oi1-f194.google.com with SMTP id z65so86412oia.11;
        Tue, 14 May 2019 13:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ymvdHlHfw00uLHLYb3t7giCfY/eJ/lnfaeGdckEMHZM=;
        b=r9MdIc726R+2OIpuM6sPmcDuEEArsLsXvOgzi3aDjdNPcvJXvKhHq0/y6UK4YXe0kj
         IH0H9mL6uATUaMIP94xule+b0f0tlguSYphl/LByXCpQgIw0kvj9qIno9BwNKVb1R8iV
         +F7TDiSzaudT6FsKKJyBMG9aFKpJIcl2hM4NrhHWExPNXo0fPIgDZGGGrLdZetTX978n
         2T67vxPjX0WMqu1b29jE4TOnN+pM25sUwt9zQ4QZUI53MRCuROnOkKle7E8FJBUN9/C1
         1vTMcgwAqfVmBi5UvttLhhq1Hze6MzZ9dixeZGjP7WmL4hnUMjQ6hMwZlpzr0g0QtB/F
         W8Og==
X-Gm-Message-State: APjAAAVgKmKB9wGM1RQMU6OJJiQe4AELbRjgDv5uqZrwNdVmIUrQS1BW
        TcOjoxdfSW3aFM6sNlsEfA==
X-Google-Smtp-Source: APXvYqxRbCfJIqlMfGCxeng6SX1wiH/xr3XTuLXQ9tJMpceSgQdh0TskQpjAuRFQJ03BEqxY6HlrFQ==
X-Received: by 2002:aca:ac43:: with SMTP id v64mr4379156oie.40.1557865344704;
        Tue, 14 May 2019 13:22:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l17sm3825518otp.29.2019.05.14.13.22.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 13:22:23 -0700 (PDT)
Date:   Tue, 14 May 2019 15:22:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Louis Kuo <louis.kuo@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, keiichiw@chromium.org, matthias.bgg@gmail.com,
        mchehab@kernel.org, yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH V2 3/4] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Message-ID: <20190514202223.GA2963@bogus>
References: <20190512060005.5444-1-louis.kuo@mediatek.com>
 <20190512060005.5444-4-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190512060005.5444-4-louis.kuo@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, May 12, 2019 at 02:00:04PM +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../bindings/media/mediatek-seninf.txt        | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.txt b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> new file mode 100644
> index 000000000000..5c84a777acbd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> @@ -0,0 +1,52 @@
> +* Mediatek seninf MIPI-CSI2 host driver

Bindings are for h/w blocks, not drivers...

How does this relate to the other series for Mediatek MIPI CSI2?

> +
> +Seninf MIPI-CSI2 host driver is a HW camera interface controller. It support a widely adopted,
> +simple, high-speed protocol primarily intended for point-to-point image and video
> +transmission between cameras and host devices.
> +
> +Required properties:
> +  - compatible: "mediatek,mt8183-seninf"
> +  - reg: Must contain an entry for each entry in reg-names.
> +  - reg-names: Must include the following entries:
> +    "base_reg": seninf registers base
> +    "rx_reg": Rx analog registers base

'_reg' part is redundant.

> +  - interrupts: interrupt number to the cpu.
> +  - clocks : clock name from clock manager
> +  - clock-names: must be CLK_CAM_SENINF and CLK_TOP_MUX_SENINF.
> +    It is the clocks of seninf
> +  - port : port for camera sensor

port is not a property

> +  - port reg : must be '0' for camera 0, '1' for camera 1
> +  - endpoint : config mipi-csi2 port setting for each camera

endpoint is not a property

> +  - data-lanes : the number of the data lane
> +
> +Example:
> +    seninf: seninf@1a040000 {
> +       compatible = "mediatek,mt8183_seninf";
> +		reg = <0 0x1a040000 0 0x8000>,
> +		      <0 0x11C80000 0 0x6000>;
> +		reg-names = "base_reg", "ana_reg";
> +		interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
> +		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +	    clocks =

The indentation is all wrong.

> +			<&camsys CLK_CAM_SENINF>, <&topckgen CLK_TOP_MUX_SENINF>;
> +		clock-names =
> +			"CLK_CAM_SENINF", "CLK_TOP_MUX_SENINF";
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			port@0 {
> +				reg = <0>;
> +				mipi_in_cam0: endpoint@0 {
> +					reg = <0>;
> +					data-lanes = <1 3>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				mipi_in_cam1: endpoint@0 {
> +					reg = <1>;
> +					data-lanes = <1 3>;
> +				};
> +			};
> +		};
> +	}
> -- 
> 2.18.0
> 
