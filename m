Return-Path: <linux-media+bounces-2897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD1E81C296
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 02:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A0061C22C69
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 01:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFAAA31;
	Fri, 22 Dec 2023 01:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20230601.gappssmtp.com header.i=@gateworks-com.20230601.gappssmtp.com header.b="uOmc4jLz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D21320E7
	for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 01:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a234dc0984fso152774466b.0
        for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 17:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20230601.gappssmtp.com; s=20230601; t=1703207548; x=1703812348; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H8dYnJWyWgHXpp2Rj4sCyIDgH6gVgQAUWyeV4JXE6Pc=;
        b=uOmc4jLzDhkuyyLXKjq3qViDsTY5cCC/wpf8ZkjmYG/sGRLjrcORU6e/urVxeuL/1N
         WUWp3b9fR1rT9nPHqxnHIR3qXXiGDcWeAjj6co+bfh7E60FD36HxMB8mgdpq1YyGr8ex
         St3+xbkrBwhxOV8f6zLNmTDLzoYZXO7UphhdrjlcD1SQCnED8R0PUCbV2z/63BvhU7i7
         o+9DUWtYauPhu9jrx8MoS/TQ+UTeE+VJ9l9NNDBiujy+uHqjhfB06DjWNH+iQorymzP9
         itGhzSnlBIcTjBiL0Pga+qgBeMg/Rt2cnGLDiLNCnlOp+nyQD54r5AHvSxc2XVDAVrJX
         9WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703207548; x=1703812348;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8dYnJWyWgHXpp2Rj4sCyIDgH6gVgQAUWyeV4JXE6Pc=;
        b=fq1xaEdLtRANdsOTsLAEiUJAqA4f/00kn0Eug91DL2aFPqF2SdxJggb8shMNyxzBT5
         cIQ1p0XZ/JGy9YMaFWGkrDpM8harLEvlZKte2/O6wMbh06QkS+I02zvGwhS0iXdGOf7X
         2W+LjxmuIxd0fFejTiIQVnDiv4kSNic4Ua6t+APGfiIgaXb1s9mufGNgb3pMac+Fvja6
         9BdoU3hZcrgptL8/UzDmN1aWfUq6+CGsq1hGqKiaI1WpfIT4rBcAyGW6d7KulIEC7ZkZ
         aP2JOapjXlZCWEPs9s26/pRI8XJOzSKFJXWSh+IYcFJ49DuI/TVpz4fM1NgUZ7RL14YE
         HX+A==
X-Gm-Message-State: AOJu0Yzf5cGfpE5e4kf/CCGp7dfGlMpjR8bfKFrKo26KBY88lhX5gGHu
	3PbD3Oab39yVkHQtWju3uaTrl1BBpO8Px6dCsa7aH9ujFD9RRHfJQAHso1Z9tQE=
X-Google-Smtp-Source: AGHT+IFDSWV80KtnjF9ZJLn9ioUat4Cbv4Q3GaOt745fmjDBpAwa9wDvN5cppXenmgafVGptEI833MyBDjRxqqK/qE4=
X-Received: by 2002:a17:907:1587:b0:a23:5762:8cfc with SMTP id
 cf7-20020a170907158700b00a2357628cfcmr288242ejc.81.1703207548248; Thu, 21 Dec
 2023 17:12:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 21 Dec 2023 17:12:16 -0800
Message-ID: <CAJ+vNU2Kj=a-_xDBsNO5zkyP_mgLsVtA2bXqkAkpmCQmVEA_=w@mail.gmail.com>
Subject: imx7_media_csi probe deferred
To: linux-media <linux-media@vger.kernel.org>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"

Greetings,

I'm running into an issue with Linux 6.6 (6.6.8) when compiling with
modules where the imx7_media_csi driver probe is deferred and I'm not
clear how to troubleshoot the cause.

The board is imx8mm-venice-gw73xx-0x [1] with
imx8mm-venice-gw73xx-0x-imx219.dtso [2] and I'm using
arch/arm64/configs/defconfig.

The kernel reports the following:
# dmesg | egrep csi\|mipi\|imx219
[    1.293264] i2c 2-0010: Fixed dependency cycle(s) with
/soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
[   12.001419] imx219 2-0010: supply VANA not found, using dummy regulator
[   12.044885] imx219 2-0010: supply VDDL not found, using dummy regulator
[   12.164308] imx7-csi 32e20000.csi: Registered csi capture as /dev/video0
[   12.178460] imx7-csi 32e20000.csi: error -ENOTCONN: Failed to get
remote endpoint
[   12.200047] imx7-csi: probe of 32e20000.csi failed with error -107
# cat /sys/kernel/debug/devices_deferred
cpufreq-dt
32e30000.mipi-csi       platform: wait for supplier
/soc@0/bus@32c00000/csi@32e20000/port/endpoint
# zcat /proc/config.gz | egrep VIDEO_IMX219\|VIDEO_IMX_MIPI\|VIDEO_IMX7
CONFIG_VIDEO_IMX7_CSI=m
CONFIG_VIDEO_IMX_MIPI_CSIS=m
CONFIG_VIDEO_IMX219=m
# lsmod | grep imx
fsl_imx8_ddr_perf      16384  0
imx8m_ddrc             12288  0
imx7_media_csi         28672  0
videobuf2_dma_contig    16384  2 hantro_vpu,imx7_media_csi
videobuf2_v4l2         32768  3 hantro_vpu,imx7_media_csi,v4l2_mem2mem
videobuf2_common       57344  6
videobuf2_dma_contig,videobuf2_v4l2,hantro_vpu,imx7_media_csi,v4l2_mem2mem,videobuf2_memops
imx_mipi_csis          24576  0
imx219                 20480  0
v4l2_cci               12288  1 imx219
v4l2_fwnode            20480  2 imx219,imx_mipi_csis
v4l2_async             20480  4 v4l2_fwnode,imx219,imx_mipi_csis,imx7_media_csi
videodev              258048  8
v4l2_async,v4l2_fwnode,imx219,videobuf2_v4l2,hantro_vpu,imx_mipi_csis,imx7_media_csi,v4l2_mem2mem
mc                     61440  9
v4l2_async,videodev,imx219,videobuf2_v4l2,hantro_vpu,videobuf2_common,imx_mipi_csis,imx7_media_csi,v4l
2_mem2mem
spi_imx                24576  0
imx_pcm_dma            12288  1 snd_soc_fsl_sai
imx8mm_thermal         12288  0
imx_sdma               24576  6
imx_cpufreq_dt         12288  0

The relevant dt looks like this:

csi: csi@32e20000 {
     compatible = "fsl,imx8mm-csi", "fsl,imx7-csi";
     reg = <0x32e20000 0x1000>;
     interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
     clocks = <&clk IMX8MM_CLK_CSI1_ROOT>;
     clock-names = "mclk";
     power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_CSI_BRIDGE>;
     status = "disabled";

     port {
          csi_in: endpoint {
               remote-endpoint = <&imx8mm_mipi_csi_out>;
          };
     };
};

mipi_csi: mipi-csi@32e30000 {
     compatible = "fsl,imx8mm-mipi-csi2";
     reg = <0x32e30000 0x1000>;
     interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
     assigned-clocks = <&clk IMX8MM_CLK_CSI1_CORE>;
     assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_1000M>;

     clock-frequency = <333000000>;
     clocks = <&clk IMX8MM_CLK_DISP_APB_ROOT>,
          <&clk IMX8MM_CLK_CSI1_ROOT>,
          <&clk IMX8MM_CLK_CSI1_PHY_REF>,
          <&clk IMX8MM_CLK_DISP_AXI_ROOT>;
     clock-names = "pclk", "wrap", "phy", "axi";
     power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_CSI>;
     status = "disabled";

     ports {
          #address-cells = <1>;
          #size-cells = <0>;

          port@0 {
               reg = <0>;
          };

          port@1 {
               reg = <1>;

               imx8mm_mipi_csi_out: endpoint {
                    remote-endpoint = <&csi_in>;
               };
          };
};

&csi {
     status = "okay";
};

&i2c3 {
     #address-cells = <1>;
     #size-cells = <0>;

     imx219: sensor@10 {
          compatible = "sony,imx219";
          reg = <0x10>;
          clocks = <&cam24m>;
          VDIG-supply = <&reg_cam>;

          port {
               /* MIPI CSI-2 bus endpoint */
               imx219_to_mipi_csi2: endpoint {
                    remote-endpoint = <&imx8mm_mipi_csi_in>;
                    clock-lanes = <0>;
                    data-lanes = <1 2>;
                    link-frequencies = /bits/ 64 <456000000>;
               };
          };
     };
};

&mipi_csi {
     status = "okay";

     ports {
          #address-cells = <1>;
          #size-cells = <0>;

          port@0 {
               reg = <0>;

               imx8mm_mipi_csi_in: endpoint {
                    remote-endpoint = <&imx219_to_mipi_csi2>;
                    data-lanes = <1 2>;
               };
          };

          port@1 {
               reg = <1>;

               imx8mm_mipi_csi_out: endpoint {
                    remote-endpoint = <&csi_in>;
               };
          };
     };
};

Strangely I have a kernel config without modules where I do not run
into this issue so it has something to do with modules but I haven't
been able to determine which configs make a difference.

Any ideas what is wrong here or tips on troubleshooting the cause for
the probe defer?

Best Regards,

Tim
[1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dts
[2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtso

