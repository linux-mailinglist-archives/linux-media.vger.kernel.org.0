Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46AB822B561
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 20:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgGWSGy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 14:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgGWSGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 14:06:53 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CD8C0619E4
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2020 11:06:53 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id j18so5766099wmi.3
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2020 11:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mD0gVXE2wPUJlx9RjmBmtExy8T7ZH1sd1QlDXUC5IPE=;
        b=i9jDZylBCkYI4PX0pdm+Sx5r9rpNQztebTzzJ2kVJ1CwiWFsRTWxuiqKLU82ckP/5O
         wm1GXTuLRUo5xznse+hNcjWLSiqZEEk/EsqBdPgKDXZV7G488oTrZts+KjJ4wp0ynNoK
         xnthrqYDhVtPJnC8VwxeoknxgRu/6ZCDxEteqO17nMpNqxlaB8fTpNaoYk57XxkPkoty
         w/bqAXHYunqu4VIa3KP9J0BnNL5aVqEZvCNIX5BhAsftylOcY3UdBfzlYgoDDWcfQHkb
         R+BEjxirEqdVRBrNJTyNc0sPJX42zuKYkvXtcxh8oQH7/JPU/8pc1R3QD1cmCFc64i1x
         103w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mD0gVXE2wPUJlx9RjmBmtExy8T7ZH1sd1QlDXUC5IPE=;
        b=KXQtX0GOcmfTInWgnRSVx4M17SG/bDdPVtF5ydQh/5UMn33SxzKXdCdJ1JEbOcwWqY
         6sPWQM0uzs7iJ+ORhbk2YzgvmjXC7bEmjkREKHpIp0BVZLuPYcSKso4qCBuKEcrjvdIp
         W66shxJSwH6L9otQY1hI9626PxvVMDkmKQS3ywN/dPcrtobaX+BUDJU03UZVdreFGQgv
         1Qb/X/wjUSn7tIuznZfGzwoBvWwxIe1IMDuga01KhRIbSJ1pMXYreF+afzXmovprnCmm
         Tqs4JxcI8ywOIjaHTUdEOR12IUR+T0W5O39joLBdvpMz2mjD7J+dgFww+6cm98MlNmmv
         ysHg==
X-Gm-Message-State: AOAM530pxkBE7IqVgDOJNfal94l3CAFv8QfbHYkqtwwnFM5SIkzveqS5
        XPAJt+NBurEbOghau8DYitzAPQ==
X-Google-Smtp-Source: ABdhPJwF9PGbliwSW3zKmJVzF1dom2pw4cIfvHUzAVudkZu5XXD9qQ12APwQBRSpaMyPmQ6WomZO/g==
X-Received: by 2002:a05:600c:204d:: with SMTP id p13mr5107823wmg.88.1595527612034;
        Thu, 23 Jul 2020 11:06:52 -0700 (PDT)
Received: from [192.168.1.12] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id g126sm4377697wme.16.2020.07.23.11.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 11:06:51 -0700 (PDT)
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
To:     Rajendra Nayak <rnayak@codeaurora.org>,
        stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
Date:   Thu, 23 Jul 2020 21:06:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rajendra,

After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
below messages on db845:

qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
current OPP for freq 533000097 (-34)

^^^ This one is new.

qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000

^^^ and this message is annoying, can we make it pr_debug in rpmh?

On 7/23/20 2:26 PM, Rajendra Nayak wrote:
> Add the OPP tables in order to be able to vote on the performance state of
> a power-domain.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 40 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index e506793..5ca2265 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3631,8 +3631,10 @@
>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&videocc VENUS_GDSC>,
>  					<&videocc VCODEC0_GDSC>,
> -					<&videocc VCODEC1_GDSC>;
> -			power-domain-names = "venus", "vcodec0", "vcodec1";
> +					<&videocc VCODEC1_GDSC>,
> +					<&rpmhpd SDM845_CX>;
> +			power-domain-names = "venus", "vcodec0", "vcodec1", "cx";
> +			operating-points-v2 = <&venus_opp_table>;
>  			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>  				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
>  				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> @@ -3654,6 +3656,40 @@
>  			video-core1 {
>  				compatible = "venus-encoder";
>  			};
> +
> +			venus_opp_table: venus-opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_min_svs>;
> +				};
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-320000000 {
> +					opp-hz = /bits/ 64 <320000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-380000000 {
> +					opp-hz = /bits/ 64 <380000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533000000 {
> +					opp-hz = /bits/ 64 <533000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +				};
> +			};
>  		};
>  
>  		videocc: clock-controller@ab00000 {
> 

-- 
regards,
Stan
