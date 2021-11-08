Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7B3447A34
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 06:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236961AbhKHFo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 00:44:29 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:54541 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236942AbhKHFo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 00:44:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636350105; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qRv2nHtDcrWu8ahlJnSE1F3twABo8IxBQNapATzVhWM=;
 b=tTD2RH2rGn1fA5mBRNSSa2xPM3vb+2VhUVm5I+vUDN189wDD9LPHBl0pYdDsdo/FkR0agUMk
 jYeYJ3br7YZxVovqSFSBQzn8u460l2slc7s1hPnpHlJGKI0QGSU09zA0/AkIolWXYOzkmF5u
 0UzLgzKXlJoRjPhdoJPG1bUpgyM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6188b8984596a04707f2c968 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 05:41:44
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25B8CC4360D; Mon,  8 Nov 2021 05:41:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CF08C4338F;
        Mon,  8 Nov 2021 05:41:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 08 Nov 2021 11:11:43 +0530
From:   dikshita@codeaurora.org
To:     Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mchehab@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, vgarodia@codeaurora.org,
        stanimir.varbanov@linaro.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: Re: [PATCH v7] arm64: dts: qcom: sc7280: Add venus DT node
In-Reply-To: <1635259922-25378-1-git-send-email-quic_dikshita@quicinc.com>
References: <1635259922-25378-1-git-send-email-quic_dikshita@quicinc.com>
Message-ID: <8584fd56711395d1933ae8448e5af77e@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Gentle Reminder to review/merge this change.

Thanks,
Dikshita

On 2021-10-26 20:22, Dikshita Agarwal wrote:
> From: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> Add DT entries for the sc7280 venus encoder/decoder.
> 
> Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
> changes since v6:
>     fixed checkpatch errors.
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 75 
> ++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 365a2e0..e4988ea 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -129,6 +129,11 @@
>  			no-map;
>  		};
> 
> +		video_mem: memory@8b200000 {
> +			reg = <0x0 0x8b200000 0x0 0x500000>;
> +			no-map;
> +		};
> +
>  		ipa_fw_mem: memory@8b700000 {
>  			reg = <0 0x8b700000 0 0x10000>;
>  			no-map;
> @@ -2675,6 +2680,76 @@
>  			};
>  		};
> 
> +		venus: video-codec@aa00000 {
> +			compatible = "qcom,sc7280-venus";
> +			reg = <0 0x0aa00000 0 0xd0600>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
> +				 <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_AXI_CLK>;
> +			clock-names = "core", "bus", "iface",
> +				      "vcodec_core", "vcodec_bus";
> +
> +			power-domains = <&videocc MVSC_GDSC>,
> +					<&videocc MVS0_GDSC>,
> +					<&rpmhpd SC7280_CX>;
> +			power-domain-names = "venus", "vcodec0", "cx";
> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 
> SLAVE_VENUS_CFG 0>,
> +					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "cpu-cfg", "video-mem";
> +
> +			iommus = <&apps_smmu 0x2180 0x20>,
> +				 <&apps_smmu 0x2184 0x20>;
> +			memory-region = <&video_mem>;
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};
> +
> +			video-firmware {
> +				iommus = <&apps_smmu 0x21a2 0x0>;
> +			};
> +
> +			venus_opp_table: venus-opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-133330000 {
> +					opp-hz = /bits/ 64 <133330000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-335000000 {
> +					opp-hz = /bits/ 64 <335000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-424000000 {
> +					opp-hz = /bits/ 64 <424000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-460000048 {
> +					opp-hz = /bits/ 64 <460000048>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +				};
> +			};
> +
> +		};
> +
>  		videocc: clock-controller@aaf0000 {
>  			compatible = "qcom,sc7280-videocc";
>  			reg = <0 0xaaf0000 0 0x10000>;
