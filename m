Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48A1473CF48
	for <lists+linux-media@lfdr.de>; Sun, 25 Jun 2023 10:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbjFYIWP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 04:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjFYIWN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 04:22:13 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA10D119
        for <linux-media@vger.kernel.org>; Sun, 25 Jun 2023 01:22:11 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-987accb4349so341614366b.0
        for <linux-media@vger.kernel.org>; Sun, 25 Jun 2023 01:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687681330; x=1690273330;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0aIh+KnPOd4G/9NbCS8m43sxgZmqz8gnbgrmTe4WUw8=;
        b=H9N8+JR/xyIdMIOAes3uKmZKTptdVZ6hytdHVZplmEjcsVyQqGVcY8ubU1WKrY9ysf
         FRVisRTzgztLzXf0Lir1jwAOxNXwswxOn5a9rbOk1v5C2qZKb7tQNsP8EO6X5rzwVZQV
         m04RMpW6BxQMchkysZk3AnwB4hTGgxKcCv10KE6bovZbYoMjAqXlAW744GgeSeS+q0NR
         fwvnIZfzvM7QaUVRAy8ROQihawKxGKMV0phPoV4itKagCDkS3OYVi5cGugcSg7v6MnKG
         SZeu0PiK4zNekB/9oMe46dqQCijGLs0BJw3MdROIlIwVLqwVoTSeKnNFqOC+lxUO6BHm
         h5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687681330; x=1690273330;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0aIh+KnPOd4G/9NbCS8m43sxgZmqz8gnbgrmTe4WUw8=;
        b=Oks51ZIGlMUOdaXe4W3cyO2Cs7/BoSxDIXH2b4b+Q6PaMym08T1h/tgFTFDWmBvpRF
         xeq+bQPWUnR4KciopE/0jLjq8gePBGaCLaQgCaOh7TnD9YVrVfxhXUVLDP3+hHTFG+5t
         30t8QhIW8bqoFvhKRbK50cl8+hS653wQmZN55yFX2E+VCFg2NFQ8SSkkptEh1M9RfKR7
         eW9SOfACZ6gZ1jJikQDStGAlm6xu3zmipk2k+01+n6PTsO30Q0gvNUIrV7cHKCt2TyD5
         QODQogarGkfCgqqHWs3c+XMl6OjdXLNjfWmKt2COvW8NFFV27cf22RdABfXKWCXfXeXx
         PpQw==
X-Gm-Message-State: AC+VfDyBXJNafxqO1GgOfM3fDPzYvsC7FbT8ZkfulJxBNl8OAr1nd8eu
        09CZmWX0WorffdIP9Cws2/ah7g==
X-Google-Smtp-Source: ACHHUZ4EI1K2HWo+RnnpWUfxG9Wv5rflQX2iiOUX0fy/sx5+mbY88JeQ8LS5zjnYEBpSyfxB2O9mPw==
X-Received: by 2002:a17:907:62a7:b0:978:a555:9bde with SMTP id nd39-20020a17090762a700b00978a5559bdemr24977445ejc.59.1687681330278;
        Sun, 25 Jun 2023 01:22:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id k13-20020a17090646cd00b009889c4bd8absm1794353ejs.216.2023.06.25.01.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 01:22:09 -0700 (PDT)
Message-ID: <63eb8605-fa23-fe13-e635-1cfdbcafb5c7@linaro.org>
Date:   Sun, 25 Jun 2023 10:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] media: dt-bindings: media: nxp,imx-isi: i.MX93
 support
Content-Language: en-US
To:     guoniu.zhou@oss.nxp.com, linux-media@vger.kernel.org,
        linux-imx@nxp.com, devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
 <20230625080916.3553621-4-guoniu.zhou@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230625080916.3553621-4-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/06/2023 10:09, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Add i.MX93 support since it reuse ISI which used in i.MX8M family.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Subject: Drop duplicated "media:"

> ---
>  Documentation/devicetree/bindings/media/nxp,imx-isi.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
> index 1ce9440bde32..ddad1d8778f3 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
> @@ -21,6 +21,7 @@ properties:
>      enum:
>        - fsl,imx8mn-isi
>        - fsl,imx8mp-isi
> +      - fsl,imx93-isi

Imx93 is a family of devices, not specific device, so I hope you
understand that it is a bit against the recommendation of specific
compatibles and you guarantee that all devices within family will be
identical.



Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you do not know the process, here is a short
explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for acks received on the version
they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

Best regards,
Krzysztof

