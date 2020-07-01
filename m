Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC30521114C
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 18:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732817AbgGAQyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 12:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732808AbgGAQyQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 12:54:16 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD815C08C5DC
        for <linux-media@vger.kernel.org>; Wed,  1 Jul 2020 09:54:16 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id m22so1626114pgv.9
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2020 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EsXUdM5LAqzZIkn5/W0cNdIO5H2Xp89nIazo0CQdhNk=;
        b=GwqLCcMAMUHg3piKQ0M1OpiifrcnYUmWU6pkjcqeA7IPO+nvcLIkmswfoCyb5lnB7G
         nIILTLdTaOKsOt632Yaq+LLwyb08YkoB2dkZlyrzPSWuf/0FLqmNB1O0CP3iq/S6BbRu
         ih7Mgx0A4CC6tjz80rhNSqnEtE4ojrney1TIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EsXUdM5LAqzZIkn5/W0cNdIO5H2Xp89nIazo0CQdhNk=;
        b=rgsw/H/Nsyjhve/B24n6rmYWXh6ffu9JDR8bFyk9atlJc7D55ZkbhWupxRBniGk5BL
         1sr9OuWhwAYqtssS9sIX4BYvzKPUHrL4kzil5d0fUBUMSBBEP77TK16GRFJ3rkwz7ARn
         UhqfDhNiQYGpdxUF3/iclIpZq57y2lzydQhuwBVWEs6fBxAXSx4Q9p63XzrLWtFVEzxU
         SZ27YTgEOIpARdjBAYG2j36EyllTau8eO9Y2QDFbjrlnOC9C/4T650944ZV86w8EXQ75
         p2iBglcfSLxCQyTOLsDt4ySJ6xIOzyAIbOkUpKb/abl+6TCt2xWGWg7hPYoZ2HE71Zop
         hNBg==
X-Gm-Message-State: AOAM531pmpg+WKXVt7o5CMDryezZZQHeX56QnSXlYSrB9ajpsR1S3W73
        Wm/I+HE68x/hE5we+Q860oa1Yg==
X-Google-Smtp-Source: ABdhPJyRYU3xYExtmeUyfOXkpw7VsQvHdKoQQRhKbkqyHFECmUwIhbLYFz+24TYxhxLjY5slmp/3Ww==
X-Received: by 2002:a63:e214:: with SMTP id q20mr13297210pgh.402.1593622456365;
        Wed, 01 Jul 2020 09:54:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id q1sm6907508pfk.132.2020.07.01.09.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 09:54:15 -0700 (PDT)
Date:   Wed, 1 Jul 2020 09:54:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: sc7180: Add OPP tables and power-domains
 for venus
Message-ID: <20200701165414.GB3191083@google.com>
References: <1593603638-19296-1-git-send-email-rnayak@codeaurora.org>
 <1593603638-19296-4-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593603638-19296-4-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 01, 2020 at 05:10:38PM +0530, Rajendra Nayak wrote:
> Add the OPP tables in order to be able to vote on the performance state
> of a power-domain
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 35 +++++++++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index ad57df2..738a741 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2392,8 +2392,10 @@
>  			reg = <0 0x0aa00000 0 0xff000>;
>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&videocc VENUS_GDSC>,
> -					<&videocc VCODEC0_GDSC>;
> -			power-domain-names = "venus", "vcodec0";
> +					<&videocc VCODEC0_GDSC>,
> +					<&rpmhpd SC7180_CX>;
> +			power-domain-names = "venus", "vcodec0", "opp-pd";
> +			operating-points-v2 = <&venus_opp_table>;
>  			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>  				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
>  				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> @@ -2414,6 +2416,35 @@
>  			video-encoder {
>  				compatible = "venus-encoder";
>  			};
> +
> +			venus_opp_table: venus-opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <150000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-320000000 {
> +					opp-hz = /bits/ 64 <270000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-380000000 {
> +					opp-hz = /bits/ 64 <340000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <434000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533000000 {
> +					opp-hz = /bits/ 64 <500000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +				};

the labels of the OPP nodes don't match the specified frequencies
