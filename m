Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 125BF637E2
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 16:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfGIOZ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 10:25:58 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46588 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfGIOZ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 10:25:58 -0400
Received: by mail-io1-f67.google.com with SMTP id i10so43476179iol.13;
        Tue, 09 Jul 2019 07:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TBLGLx1opEkdu4WEI7zl5nZCtTgFdfC2oKMXvQ0ZHkQ=;
        b=CNElxBd90ZWHB8b3hZvVOOy2YxKDXOzKmR13ak0nel8azEGNhXnrwjF6rk+0N9Ed7C
         m9ggQtHQAlzGY/avetYWYEsvT2tXdz+S5y8mqAQVeStCIdGhluCyqiFb7mvtv4Hz0opN
         0yCdQ0x4g6pFFBesuQwHHTuGjz09gkE9G6GHQjjPEOMO8dlDLF2n+CHONCS5Jk6v81US
         wf/+AuShL9jojhnWQ/J7IRpqn20rVp4ljVsHtxYtj0GqkWbLt8TRlxDmDGtlBABrZqOH
         LdbLb55aibzSo9x8puSdpndmZNtre6eg4aZjptzQLpfi5dm+eONYhWnGVSZ8PJfq1bR5
         XOBA==
X-Gm-Message-State: APjAAAWk/VoXy367ts9/QNwVjosyZYjCN70lhYjeNWxSJbeakX/rsNz4
        179/T6dXDHCdRRi/glC5lQ==
X-Google-Smtp-Source: APXvYqxeVyS/sSddo+lwEMt88jLnJWt2h6n+OjL2EEpK6rkBHysE70PXtsyrqnGGBx2tfZQi+bpFZA==
X-Received: by 2002:a5e:9747:: with SMTP id h7mr18425725ioq.299.1562682357065;
        Tue, 09 Jul 2019 07:25:57 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id t133sm24420765iof.21.2019.07.09.07.25.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 07:25:56 -0700 (PDT)
Date:   Tue, 9 Jul 2019 08:25:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v5 08/10] media: dt-bindings: Document i.MX8MQ and
 i.MX8MM VPU bindings
Message-ID: <20190709142555.GA14360@bogus>
References: <20190612093915.18973-1-p.zabel@pengutronix.de>
 <20190612093915.18973-9-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612093915.18973-9-p.zabel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 12, 2019 at 11:39:13AM +0200, Philipp Zabel wrote:
> Add devicetree binding documentation for the Hantro G1/G2 VPU on i.MX8MQ
> and for the Hantro G1/G2/H1 VPU on i.MX8MM.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../devicetree/bindings/media/imx8m-vpu.txt   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/imx8m-vpu.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/imx8m-vpu.txt b/Documentation/devicetree/bindings/media/imx8m-vpu.txt
> new file mode 100644
> index 000000000000..659bd28dd002
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/imx8m-vpu.txt
> @@ -0,0 +1,56 @@
> +device-tree bindings for Hantro G1/G2/H1 VPU codecs implemented on i.MX8M SoCs
> +
> +Required properties:
> +- compatible: value should be one of the following
> +		"nxp,imx8mq-vpu",
> +		"nxp,imx8mm-vpu";
> +- regs: VPU core and control block register ranges
> +- reg-names: should be
> +		"g1", "g2", "ctrl" on i.MX8MQ,
> +		"g1", "g2", "h1", "ctrl" on i.MX8MM.

Would be nicer to put h1 at the end, so the indexes don't change.

> +- interrupts: encoding and decoding interrupt specifiers
> +- interrupt-names: should be
> +		"g1", "g2" on i.MX8MQ,
> +		"g1", "g2", "h1" on i.MX8MM.
> +- clocks: phandle to VPU core clocks and bus clock
> +- clock-names: should be
> +		"g1", "g2", "bus" on i.MX8MQ,
> +		"g1", "g2", "h1", "bus" on i.MX8MM.

Here too.

> +- power-domains: phandle to power domain node
> +
> +Examples:
> +
> +	vpu: vpu@38300000 {

video-codec@...

> +		compatible = "nxp,imx8mq-vpu";
> +		reg = <0x38300000 0x10000>,
> +		      <0x38310000 0x10000>,
> +		      <0x38320000 0x10000>;
> +		reg-names = "g1", "g2", "ctrl";
> +		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "g1", "g2";
> +		clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +		clock-names = "g1", "g2", "bus";
> +		power-domains = <&pgc_vpu>;
> +	};
> +
> +	vpu: vpu@38300000 {

Are 2 examples really necessary?

> +		compatible = "nxp,imx8mm-vpu";
> +		reg = <0x38300000 0x10000>,
> +		      <0x38310000 0x10000>,
> +		      <0x38320000 0x10000>;
> +		      <0x38330000 0x10000>;
> +		reg-names = "g1", "g2", "h1", "ctrl";
> +		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "g1", "g2", "h1";
> +		clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_H1_ROOT>,
> +			 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +		clock-names = "g1", "g2", "h1", "bus";
> +		power-domains = <&pgc_vpu>;
> +	};
> -- 
> 2.20.1
> 
