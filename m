Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DDC626BCF
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 22:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234617AbiKLVO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 16:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbiKLVO1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 16:14:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918EC13CCA;
        Sat, 12 Nov 2022 13:14:26 -0800 (PST)
Received: from pendragon.ideasonboard.com (d5152d7bc.static.telenet.be [81.82.215.188])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A41C8B;
        Sat, 12 Nov 2022 22:14:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668287665;
        bh=PT1yv1LX+Y/JfwvL33XzJtwoh6aDcnvxcbAVfqpDP1M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wSDDlgou2KUQZwEeb5I9a6FIcconilXGJ7mZFwJ8E/pwJHEfDj7p+ChsE71S/lmXO
         rrBz5AI6AOwhR9im76XZt2gh3mYAafm9fTFpMWpMuckWMQ9fVw868l3ALIBj50jLNF
         CDf/BtgZqcuCyZCF2lKNnGShoy2ln3xxw2Z46x5w=
Date:   Sat, 12 Nov 2022 23:14:06 +0200
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
Subject: Re: [PATCH v5 2/6] arm64: dts: qcom: sdm845-db845c: Use okay not ok
 for status
Message-ID: <Y3AMnijSo8n+vCb5@pendragon.ideasonboard.com>
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221112172650.127280-3-bryan.odonoghue@linaro.org>
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

On Sat, Nov 12, 2022 at 05:26:46PM +0000, Bryan O'Donoghue wrote:
> Convert camss status from "ok" to "okay".
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 7c88312333c22..ce95b51f17fff 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1182,7 +1182,7 @@ &camss {
>  	vdda-phy-supply = <&vreg_l1a_0p875>;
>  	vdda-pll-supply = <&vreg_l26a_1p2>;
>  
> -	status = "ok";
> +	status = "okay";
>  
>  	ports {
>  		port@0 {
> @@ -1221,7 +1221,7 @@ camera@10 {
>  		avdd-supply = <&cam0_avdd_2v8>;
>  		dvdd-supply = <&cam0_dvdd_1v2>;
>  
> -		status = "ok";
> +		status = "okay";
>  
>  		port {
>  			ov8856_ep: endpoint {

-- 
Regards,

Laurent Pinchart
