Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455593F096C
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 18:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhHRQoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 12:44:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53164 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhHRQox (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 12:44:53 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17IGiFwm094931;
        Wed, 18 Aug 2021 11:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1629305055;
        bh=s1fQOrd2AGCGmTDAq1P48wzKCCxRSu9avGN2pWSwF9k=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=S9Atjj2m+KY6N9xDp+HDV9bw/Vrz/lKDCeCcQudJAALKOr91gT4UzWLMU/JroPm9g
         092kQp9vr1tV9V+AmUBrnM0ISycxjY+xYRR+kbg407PEoKrwUfLRzFhHh+4NXyHUeY
         8XrRhhLKuxy9+uyUXGAKSCWD6/fWc3W0D4KHoBDE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17IGiFdE075940
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Aug 2021 11:44:15 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 18
 Aug 2021 11:44:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 18 Aug 2021 11:44:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17IGiFGv055811;
        Wed, 18 Aug 2021 11:44:15 -0500
Date:   Wed, 18 Aug 2021 11:44:15 -0500
From:   Nishanth Menon <nm@ti.com>
To:     <sidraya.bj@pathpartnertech.com>
CC:     <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <prashanth.ka@pathpartnertech.com>,
        <praneeth@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <praveen.ap@pathpartnertech.com>
Subject: Re: [PATCH 29/30] arm64: dts: dra82: Add v4l2 vxd_dec device node
Message-ID: <20210818164415.2wizi43eidtngqca@siberian>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
 <20210818141037.19990-30-sidraya.bj@pathpartnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210818141037.19990-30-sidraya.bj@pathpartnertech.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

^^ $subject
you might want to run:
git log --oneline arch/arm64/boot/dts/ti/k3-j721e-main.dtsi

to see precedence of usage.

On 19:40-20210818, sidraya.bj@pathpartnertech.com wrote:
> From: Sidraya <sidraya.bj@pathpartnertech.com>
> 
> Enable v4l2 vxd_dec on dra82

s/dra82/j721e

> 
> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index cf3482376c1e..a10eb7bcce74 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -1242,6 +1242,15 @@
>  		power-domains = <&k3_pds 193 TI_SCI_PD_EXCLUSIVE>;
>  	};
>  
> +	d5520: video-decoder@4300000 {
> +	       /* IMG D5520 driver configuration */
> +	       compatible = "img,d5500-vxd";
> +	       reg = <0x00 0x04300000>,
> +		     <0x00 0x100000>;
> +	       power-domains = <&k3_pds 144 TI_SCI_PD_EXCLUSIVE>;
> +	       interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
>  	ufs_wrapper: ufs-wrapper@4e80000 {
>  		compatible = "ti,j721e-ufs";
>  		reg = <0x0 0x4e80000 0x0 0x100>;
> -- 
> 2.17.1
> 
> 
> -- 
> 
> 
> 
> 
> 
> 
> This
> message contains confidential information and is intended only 
> for the
> individual(s) named. If you are not the intended
> recipient, you are 

You might want to look up the MAINTAINER file to see who this patch
and what list this should have been addressed to.

Further I DONOT want to see a single bit of confidential information
based patch in my tree. Please discuss with your legal department
and since TI is mentioned in the patches, please discuss with TI's
legal team as well.

This patch, IMHO, series mis-represents TI's legal position and
respect for upstream community and in no way represents the quality
of patches we(TI) would like to contribute to upstream and DOES NOT
represent the quality of contributions or collaboration expected of TI
or representatives of TI.

So, sorry NAK for the complete series.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
