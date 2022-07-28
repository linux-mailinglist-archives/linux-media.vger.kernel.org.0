Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFEF4583FB2
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 15:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239134AbiG1NNR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 09:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236686AbiG1NNQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 09:13:16 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86481BEBA
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 06:13:14 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id e11so1926873ljl.4
        for <linux-media@vger.kernel.org>; Thu, 28 Jul 2022 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=enxGsIYunokJEXPMGCaE1Z7pYtuICaBoKBXgeSWmWds=;
        b=KnPMKWFuiKPiA/P4vExFpb/yxNCbd6RN4z9b8adLpTi0enYQdO1DCGVCgRRXSZC5Aq
         lTQJRiT2rver/3W0QAvIbJasWNyvKj5jOGvuGSZ9L7ugDmmtuWPgZiRkF87i839pGiHN
         FkI57ALLpz6VRvaVAVKLZI/FYYj/Upg4C8T+7DTj6WVkB+S3QGqYG8PplFXF2huPBcPn
         K9SlgYUChDKy2D7mZm0hVnLB1AA+a84x2krOEb0Tr9YFTHd3ANjZxyWjAg+NisUbkwxR
         dO4ju2jllwgx2GQNjQBZ8LCO+mRH00lr4tzjMTd3F3ByUX8UNDmfwCm6por0skChclOp
         5RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=enxGsIYunokJEXPMGCaE1Z7pYtuICaBoKBXgeSWmWds=;
        b=wDgzNa3QDtFUnmqL/7iDA9UeJceNi6VPf6B6NZzIHl8HVyJ5YKY44apPF51n/koBiS
         Vni2RlzRkfeP0yG/v07wTnDnkVlg2o7yp++1TO60LdzuVIT9mm70R1rH/WCYbfo9K4yC
         jGaqjx6s0E+nI3/f6mmwyiqIEg0d+RwH1+vZ/Vp2l0xZPBsqfMCvMdMyf6qJK7OPp8pa
         Yc0pSvD1W4VXaCAbjTbNPp8xHnPe6QptNu9lCHehSCO2NhkJa9xzI/FvdoZ+Lp0hcdhN
         AIAlcLkmDhGp/tDRzjKb0bjEw2pQR1vAvgCFhHLat1xXRu7gJkG3GkGXwsI3QtJT91ky
         WJSQ==
X-Gm-Message-State: AJIora98r7Fc8Rmg8pjjSqqQvMyGZpBAl1nkGTodH7n+1Lg5jHPkLWWY
        zboVw9X0gIqCZ9bOSqs0SJoLRg==
X-Google-Smtp-Source: AGRyM1ueWV1tfxf9FVvPLoM/8R4w9qdGdgVWOxGzoYQXpfgmjsGBeWL+qbYnT+dzT+zmLYVcaF3k7Q==
X-Received: by 2002:a2e:5741:0:b0:25d:fcb1:d449 with SMTP id r1-20020a2e5741000000b0025dfcb1d449mr7752871ljd.333.1659013992945;
        Thu, 28 Jul 2022 06:13:12 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id d20-20020a193854000000b0048a757d314esm188383lfj.304.2022.07.28.06.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 06:13:12 -0700 (PDT)
Message-ID: <4e89e55b-9312-5525-974b-0a1dbe0b3dd1@linaro.org>
Date:   Thu, 28 Jul 2022 15:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/7] media: i2c: ov9282: Add ov9281 compatible
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
 <20220728130237.3396663-4-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220728130237.3396663-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/07/2022 15:02, Alexander Stein wrote:
> According to product brief they are identical from software point of view.
> Differences are a different chief ray angle (CRA) and the package.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> ---
>  drivers/media/i2c/ov9282.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 8a252bf3b59f..c8d83a29f9bb 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1113,6 +1113,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
>  };
>  
>  static const struct of_device_id ov9282_of_match[] = {
> +	{ .compatible = "ovti,ov9281" },

The devices seem entirely compatible, so why you add a new compatible
and not re-use existing?

The difference in lens does not explain this.


Best regards,
Krzysztof
