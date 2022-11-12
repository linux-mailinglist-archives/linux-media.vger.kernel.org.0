Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 337A2626BCC
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 22:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235020AbiKLVNc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 16:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbiKLVNa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 16:13:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E852D96;
        Sat, 12 Nov 2022 13:13:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (d5152d7bc.static.telenet.be [81.82.215.188])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B2558B;
        Sat, 12 Nov 2022 22:13:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668287607;
        bh=vgdoi85MDyYq/GYcm32Rnsur8qw6yV1VS+yCW0HEfnI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hhbmwr+/bcqhVkIk5794ApDssV3tbPc7PIk9VCKbDacZ01fMRpVQIbO8FRzNW5DpV
         k7PSRPxbrXzPfGfkJsp0oLgSRzaAZ9TJra7JvOJOzSrVKoQgwgvzUMOKUWQBNdeotm
         EMHszxNtWIYeLIiyopPHGptNT2AzaI2zsTWaBes8=
Date:   Sat, 12 Nov 2022 23:12:52 +0200
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
Subject: Re: [PATCH v5 1/6] arm64: dts: qcom: sdm845-db845c: Drop redundant
 address-cells, size-cells declaration
Message-ID: <Y3AMVCfJlxyMpXrJ@pendragon.ideasonboard.com>
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221112172650.127280-2-bryan.odonoghue@linaro.org>
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

On Sat, Nov 12, 2022 at 05:26:45PM +0000, Bryan O'Donoghue wrote:
> sdm845.dtsi camss already defines the address-cells and size-cells for
> camss, no need to replicate in sdm845-db845c.dts.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 3e7ceb0861eb0..7c88312333c22 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1185,8 +1185,6 @@ &camss {
>  	status = "ok";
>  
>  	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
>  		port@0 {
>  			reg = <0>;
>  			csiphy0_ep: endpoint {

-- 
Regards,

Laurent Pinchart
