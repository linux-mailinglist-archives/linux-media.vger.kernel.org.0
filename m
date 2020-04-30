Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DB31C09DA
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 00:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgD3WFV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 18:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgD3WFV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 18:05:21 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E169C035494;
        Thu, 30 Apr 2020 15:05:19 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c12so4112948wrp.0;
        Thu, 30 Apr 2020 15:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bw4xMsQlAdPbT32r9q7KuZwpeyRP0cX6BzQXI90BCN8=;
        b=ByMRGswMWLGAUKHPhoXAN3w1R8HdhxRP4M/4ODXWHCLj7gYMAP0FIEG2VqZCmshrr6
         ZxcQIkG1T7h6W+jiuTCvDA10h0s8VD84v2h8QRMFeZu/qfrIKB+Uf6h+12/CbKynlICf
         XNk18X5SKhxKXwdNGquQa/hSPFITAtjQ2q9I3W3xtod8hG+zWp/XrtdH1ATUccOE+/PA
         LwfjyOfhhEjlVSrZE6E/E52lAXBWSi0DbyFnfVI5a5ZKdj3P3rrRARsdm3Gj+9uBhenn
         J1wOiuWUe4NZE0eIccydcbVmM32Y86b4ca+CnqPfBoC95swggbnNpNkvRPLbH8pjqXWP
         E/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bw4xMsQlAdPbT32r9q7KuZwpeyRP0cX6BzQXI90BCN8=;
        b=iRfta9dk14BmVn9n1ER30QzInsQ9yRx5lSuANhTtU8MeV1lXItU9/NkFC4IAXXgV33
         7P1gGIDgr0D4EDDJTa5eG7ak2MydilMrnpbeWMQUDLDd6uenKPx5yzDCwTE6MtZ082oB
         lt7facoLnqForOAKdhUgivp8Dx2yz/7zGpUaWM3T4qbCuXFKcmwtfb0A1WabTj6hvhZK
         NTxq3KyLGkGKqiCmyrva+R0gZrsmjDe37FcRM1fa48q6EWHVAU8nhCzWcDtRip3MM7MX
         qUXJvNicxUxY9ADJfWdmrtVFw6NY7a94nFDIGAgKH2ZfqM3MNSDxNQwCqam9wfv/6jO3
         oUlQ==
X-Gm-Message-State: AGi0PuagfDwLMqJwRXg68MkYapxft3DWwfVtvTwWywazjKPBN3aHAdh6
        zfk6TWnlIGi5lxU9ES2jUAc=
X-Google-Smtp-Source: APiQypLYqUO31tqU0YvMTIn8//k5oBDvmrxtqm2vFUpCvHub7k63ls1fdFvzV0p5CULjKqkXhDeoag==
X-Received: by 2002:adf:d0ca:: with SMTP id z10mr818677wrh.172.1588284317856;
        Thu, 30 Apr 2020 15:05:17 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id t67sm1475693wmg.40.2020.04.30.15.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 15:05:17 -0700 (PDT)
To:     paul.kocialkowski@bootlin.com
Cc:     devicetree@vger.kernel.org, ezequiel@collabora.com,
        hansverk@cisco.com, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        thomas.petazzoni@bootlin.com
References: <20200430164245.1630174-3-paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: rockchip: Add RGA support to the PX30
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <c3954924-c220-73ef-06dd-85b6876be819@gmail.com>
Date:   Fri, 1 May 2020 00:05:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430164245.1630174-3-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

> The PX30 features a RGA block: add the necessary node to support it.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index f809dd6d5dc3..3de70aa4f1ce 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -1102,6 +1102,17 @@ vopl_mmu: iommu@ff470f00 {
>  		status = "disabled";
>  	};
>  
> +	rga: rga@ff480000 {
> +		compatible = "rockchip,px30-rga", "rockchip,rk3288-rga";
> +		reg = <0x0 0xff480000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
> +		clock-names = "aclk", "hclk", "sclk";

> +		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
> +		reset-names = "core", "axi", "ahb";
> +		power-domains = <&power PX30_PD_VO>;

sort

		power-domains = <&power PX30_PD_VO>;
		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
		reset-names = "core", "axi", "ahb";



> +	};
> +
>  	qos_gmac: qos@ff518000 {
>  		compatible = "syscon";
>  		reg = <0x0 0xff518000 0x0 0x20>;
> -- 
> 2.26.0

