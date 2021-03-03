Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063EA32BAFD
	for <lists+linux-media@lfdr.de>; Wed,  3 Mar 2021 22:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358539AbhCCMNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 07:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842738AbhCCILR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 03:11:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A6BC06121D;
        Tue,  2 Mar 2021 23:49:39 -0800 (PST)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8247CED;
        Wed,  3 Mar 2021 08:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614757498;
        bh=pgHJQLX6F904nkIj+cn7Uu3xGcm1E0oEGrQESFkz/DE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kPsp5/nlPDzmHvW04qUyNZLnyDW864u23vU7iZIB42BDutSOT/YRdY2nM77y6MC60
         /qEy5LIvxRazzcgxQUsZXzL8s7ACj9cHeM7dyQOkITDL4A6nE18Pm5NtORpizITZ+r
         RoeoV2CEpK54v9E4+VKDcaPnfWxPE3fbcbC1wY5k=
Subject: Re: [PATCHv2 5/6] dra7.dtsi/omap5.dtsi: add cec clock
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-6-hverkuil-cisco@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <700a6c8b-8448-051e-044c-0390b8a38ae4@ideasonboard.com>
Date:   Wed, 3 Mar 2021 09:44:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302162403.983585-6-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2021 18:24, Hans Verkuil wrote:
> Add cec clock to the dra7 and omap5 device trees.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Acked-by: Tony Lindgren <tony@atomide.com>
> ---
>   arch/arm/boot/dts/dra7.dtsi  | 5 +++--
>   arch/arm/boot/dts/omap5.dtsi | 5 +++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> index ce1194744f84..efe579ddb324 100644
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -879,8 +879,9 @@ hdmi: encoder@0 {
>   						interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>   						status = "disabled";
>   						clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
> -							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
> -						clock-names = "fck", "sys_clk";
> +							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>,
> +							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 11>;
> +						clock-names = "fck", "sys_clk", "cec";
>   						dmas = <&sdma_xbar 76>;
>   						dma-names = "audio_tx";
>   					};
> diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> index e025b7c9a357..6726e1f1b07c 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -586,8 +586,9 @@ hdmi: encoder@0 {
>   						interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
>   						status = "disabled";
>   						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 9>,
> -							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
> -						clock-names = "fck", "sys_clk";
> +							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>,
> +							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 11>;
> +						clock-names = "fck", "sys_clk", "cec";
>   						dmas = <&sdma 76>;
>   						dma-names = "audio_tx";
>   					};
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

