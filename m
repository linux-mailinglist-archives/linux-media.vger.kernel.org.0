Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 015636207BF
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 04:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbiKHDs7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 22:48:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbiKHDs5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 22:48:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F112D76F;
        Mon,  7 Nov 2022 19:48:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A39F86140B;
        Tue,  8 Nov 2022 03:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5DEC433D6;
        Tue,  8 Nov 2022 03:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667879335;
        bh=+7fDjDjSwuIces8TlINydr9JTAVpjqCtHsiPm6OS7rM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KSsS7ToymbL46gAbd5H/O3HeZFAOXLCpNSaBvKq9bXWg4vKy1jF/1ReM6vX7955lV
         nVPMW9RfLPpTs/t0f7/Y30VQElbLTUpASoSTTpGWRHJDnoIv4/Cyr5CgXGvqBmSjio
         8Djmbwfh5+fetk5eLjZuoNS/LDSWTPFwTeJ8TRDmeKvwmRvn63CroeGd6KVrCcB9H2
         yeAKpS+pBNYqoDeAVLIcstuRJp9T+RTYQo+BxqBoTmAwZF/Zd2E6s6mNO/XH9AXRl6
         lPLlY6zskxM6yM1JaexNS6rrt+xQym9Yb/GTLW9lTqyICiBImr17w6aHvgQ4OMtdU5
         /WmaGrsFxMxyg==
Date:   Mon, 7 Nov 2022 21:48:52 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Add vision mezzanine
Message-ID: <20221108034852.3tiqs46mpat4pwt7@builder.lan>
References: <20221108021816.213084-1-bryan.odonoghue@linaro.org>
 <20221108021816.213084-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108021816.213084-3-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 08, 2022 at 02:18:15AM +0000, Bryan O'Donoghue wrote:
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 8ef0a9fe67dd..7199a86d2cbe 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3801,6 +3801,39 @@ tlmm: pinctrl@f100000 {
>  			gpio-ranges = <&tlmm 0 0 181>;
>  			wakeup-parent = <&pdc>;
>  
> +			cam2_default: cam2-default {

Please add -state suffix to the pinctrl state nodes.

> +				rst {

And please add -pins suffix to the subnodes thereof.

Regards,
Bjorn
