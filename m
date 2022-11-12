Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 418A3626BD2
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 22:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234977AbiKLVPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 16:15:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiKLVPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 16:15:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F09613CCA;
        Sat, 12 Nov 2022 13:15:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (d5152d7bc.static.telenet.be [81.82.215.188])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFF8D8B;
        Sat, 12 Nov 2022 22:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668287711;
        bh=WwHS4zSY/M8sf1hzL/GE3PIMtQ1RuoaPQFC0oSvebLU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bJManCCiiRoh66Eqjq3dqD69OR2Q4INNr4jfryMOtSBEM0trgMrguWXEFxtIUJ/lH
         oCcT9R053TPdc1ZKiP6EHUPjKqUUnrZm7FYbbY07bePwMKsJ4hdTJLnNwTfrJ5cQnT
         xSqoACPzjvlQ8nMtTMD+ugXHG5SAL6IEDtJLJ5vo=
Date:   Sat, 12 Nov 2022 23:14:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org, sakari.ailus@iki.fi,
        hverkuil@xs4all.nl, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: sdm845-db845c: Use status
 disabled not disable
Message-ID: <Y3AMyVevGZwua9W2@pendragon.ideasonboard.com>
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-4-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221112172650.127280-4-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

Thank you for the patch.

On Sat, Nov 12, 2022 at 05:26:47PM +0000, Bryan O'Donoghue wrote:
> Use preferred status "disabled" instead of "disable".
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index ce95b51f17fff..5da91c646c200 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1262,7 +1262,7 @@ camera@60 {
>  		vdddo-supply = <&vreg_lvs1a_1p8>;
>  		vdda-supply = <&cam3_avdd_2v8>;
>  
> -		status = "disable";
> +		status = "disabled";
>  
>  		port {
>  			ov7251_ep: endpoint {

-- 
Regards,

Laurent Pinchart
