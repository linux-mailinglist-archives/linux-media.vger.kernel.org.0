Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B676C56296C
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 05:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbiGADLI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 23:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233849AbiGADK7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 23:10:59 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0906D64D65
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 20:10:35 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id s188so1656911oib.6
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 20:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ifsT2wWYpR3GIDej6kj9iuP5yZJl2zk/c+ZcBDquvTw=;
        b=DDdHHzPUj6tFM3Ado8BDbAXR1U26zWTe596bqmQ+wliUkAycKWe8nh/xaLuyN5+n2m
         MkSS20r3t6l2QBmxiYnXdE2ojj1h+c7tM8TEtkrV3Bc0uw5crJ1aXaRgn4J7a2CWZn75
         EXABTWG1upx+Itdm4FfqWQJhB/m89c6kUsy9ZTAr61gpt6szAZIvRcI6DB3COTImR/+6
         0DbSS+izNcy4A4GZr0uivE7PsU4AZY9Q8jhSsnxt9c8njk+6YhntErSsIvF3DotMNY9+
         had/UYOLX6kH+xLBpJtHKQztJC8AMv54fU9BLmBqd54Kv350XV1oTPke/zIaa0VXybCn
         TSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ifsT2wWYpR3GIDej6kj9iuP5yZJl2zk/c+ZcBDquvTw=;
        b=N6uf0qjzlsnHFMt5IkS1btpT9+/NSJyWi8a270imBWxHCZnm+CZzjCIrcRytyfmBAT
         X4Ay73AsC+ijWlV15u3auM2oWMtBsGxDrVcuvWpE7nb4qMl1BIpPcqCB0w2sVr3BRfGc
         3h1ZgESIX6PEiaz7VwO2m2eUY47LOeGmik4jDe5gz+3OyvF4UtNBR6+dJ9krbzqWCJwd
         o4Uebc5PfrIC+ban+zXOUoZga6TGYzOcysNL+L9hl4L9PHupXK3hmpgZON9xvdeD+uES
         DRnZpmkpoaBbTZ8LSWVHYA7FBPpVdcziA3EbleQb0w2wQRAlJfTiiPh+0RCAXHGxBQV6
         DJJg==
X-Gm-Message-State: AJIora9U8w3n1W9pHmwgAMnIlp2uiMdGFeVeKRg8S1sWgjbQVIWMa7a6
        QdsHWF6c4D0XTdCIkyFHZLbbQw==
X-Google-Smtp-Source: AGRyM1tPh3ymkg591521d/uHcA5BmIIn6/MhffzQolzJ3zLSYJ/eM4iUBUrmz60HDpTZg0p3+dct2g==
X-Received: by 2002:aca:3b06:0:b0:32e:8bb7:bef7 with SMTP id i6-20020aca3b06000000b0032e8bb7bef7mr7365838oia.246.1656645034261;
        Thu, 30 Jun 2022 20:10:34 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i16-20020a05683033f000b00616b835f5e7sm10387117otu.43.2022.06.30.20.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 20:10:30 -0700 (PDT)
Date:   Thu, 30 Jun 2022 22:10:27 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org,
        jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, jgrahsl@snap.com,
        hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sm8250: camss: Define ports
 address/size cells
Message-ID: <Yr5lo799md1XcAkU@builder.lan>
References: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
 <20220606132029.2221257-4-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606132029.2221257-4-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon 06 Jun 08:20 CDT 2022, Bryan O'Donoghue wrote:

> The ports {} address and size cells definition is the same for every
> derived 8250 board so, we should define it in the core sm8250.dtsi.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 2bc11cad3a44..aa9a13364865 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3395,6 +3395,11 @@ camss: camss@ac6a000 {
>  					     "cam_hf_0_mnoc",
>  					     "cam_sf_0_mnoc",
>  					     "cam_sf_icp_mnoc";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;

Adding these without subnodes that make use of them will cause
dtbs_check to complain.

So although it would save a little bit of duplication, let's add them
when/where it's needed.

Regards,
Bjorn

> +			};
>  		};
>  
>  		camcc: clock-controller@ad00000 {
> -- 
> 2.36.1
> 
