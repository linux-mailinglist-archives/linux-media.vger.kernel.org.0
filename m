Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1055D6B1BBA
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 07:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbjCIGpf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 01:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjCIGpd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 01:45:33 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8468362857
        for <linux-media@vger.kernel.org>; Wed,  8 Mar 2023 22:45:27 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id a25so3159913edb.0
        for <linux-media@vger.kernel.org>; Wed, 08 Mar 2023 22:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678344326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VrAxCqO0uv24h0ZyB1Ik7eA7Hcze8cmWOkDY6T7bQkE=;
        b=PD8A+McklAjSk/Em1P0s9EsrgRCIrTvlrMNwsyaKaeUKcB5VCg77YitM38n3iSnBNw
         WVE7jRvl8oITEWBW3zubjaYooO3nJJGRDW93NcswpyfsgJQLa4vNTGRc0FBiiEzNYgu+
         ZBKag4HGc1NogmgPrNpoG47jTMz4JSHeixnDQbBxFXI50P15Sar/X1hmc0n+qcnDrCjF
         kut9n6aTdjizU+8tyIiFUMPV0mHHxaITEw/7NCp/dTWsCFTBS7Ic+dcHpvoRIa0UKOE3
         pkTv6QmE40yerUahNyQCueB0ORTNdhYxmi0SuYT8+SeIltWYPnmWYtF6IuyjG0j8m9Vr
         xjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678344326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrAxCqO0uv24h0ZyB1Ik7eA7Hcze8cmWOkDY6T7bQkE=;
        b=C5VygT53un71brliWdk4wE3boxLLzVCa6EzXhXD40jW4RE115HceWqhAPssbMg3wR4
         AR1DdShzzLmA4iByms0kAWs4PLYTGO4kRKQMc9mjP9qC5xH7+hWDNum7/T2uFHFNRaHD
         kweO7+EjM2xoNHEUtOYqZO5yH8komI0e9DB5tm8lNaR4JgJ3TqtHBTPpNgYM21GXX3Aa
         efSVHDPF/xGZ2EogZ7G7Rf7GyHJdmVTyPro8PrnVLBP2xFu97GCQuaVPqg5AkcwPmsIm
         UxlcKDAwmfAkpHcNnuIGVHpddIroDkvnBJuJx7iz2j3M/p1WWKIsghPO7vL1y59UHKT/
         DaCA==
X-Gm-Message-State: AO0yUKWGfUfPTBp2oV1oEc5lYUWVF0HJCCa1dFPV5pYBpodqjahJ3Wd9
        aMcRd/Zh2kz28am+pWgGibWZSA==
X-Google-Smtp-Source: AK7set9d+R03e+gnXpiwuG02e0liY3UBmtfcL5qUnkSURkUjCoBP5YvZQA0UrjfgO/RZ3LoD+Icrlg==
X-Received: by 2002:aa7:d6c6:0:b0:4af:59c0:d303 with SMTP id x6-20020aa7d6c6000000b004af59c0d303mr18327898edr.26.1678344326057;
        Wed, 08 Mar 2023 22:45:26 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id k26-20020a508ada000000b004af6b93f00asm9063997edk.23.2023.03.08.22.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 22:45:25 -0800 (PST)
Message-ID: <9b93849d-d4a4-67ba-e8a0-ee6c7209bd65@linaro.org>
Date:   Thu, 9 Mar 2023 07:45:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Patch v6] dt-bindings: media: s5p-mfc: convert bindings to
 json-schema
Content-Language: en-US
To:     Aakarsh Jain <aakarsh.jain@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     m.szyprowski@samsung.com, andrzej.hajda@intel.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, jernej.skrabec@gmail.com,
        benjamin.gaignard@collabora.com, krzysztof.kozlowski+dt@linaro.org,
        stanimir.varbanov@linaro.org, dillon.minfei@gmail.com,
        david.plowman@raspberrypi.com, mark.rutland@arm.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, andi@etezian.org,
        alim.akhtar@samsung.com, aswani.reddy@samsung.com,
        pankaj.dubey@samsung.com
References: <CGME20230301035153epcas5p40f576188a9a69835c1050135219a3720@epcas5p4.samsung.com>
 <20230301035144.8645-1-aakarsh.jain@samsung.com>
 <8b5bea40-6f7b-1d00-ac23-83a28c7dacbc@linaro.org>
 <046b01d94d1a$418146a0$c483d3e0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <046b01d94d1a$418146a0$c483d3e0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,T_SPF_TEMPERROR autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2023 16:18, Aakarsh Jain wrote:
>>
>> iommus:
>>   maxItems: 1
>> iommu-names: false
>>
> I am getting compilation errors with above property set and its breaking the bindings.
> If we see these two nodes in dtsi files.
>                mfc: codec@13400000 {
>                         compatible = "samsung,mfc-v5";
> ..
>                         iommus = <&sysmmu_mfc_l>, <&sysmmu_mfc_r>;
>                         iommu-names = "left", "right";
> }
> And 
>               mfc: codec@13400000 {
>                         compatible = "samsung,exynos3250-mfc", "samsung,mfc-v7";
>                         reg = <0x13400000 0x10000>;
> ...
>                         iommus = <&sysmmu_mfc>;
>                 };
> There is no iommu-names property for compatible "samsung,exynos3250-mfc, samsung,mfc-v7", that’s why I kept
>         iommus:
>           minItems: 1
>           maxItems: 2
> I would even go with below if you agree?
>         iommus:
>           minItems: 1
>           maxItems: 2
>         iommus-names: false

No, I don't agree. Why do you need two IOMMUs for Exynos3250?
> 

Best regards,
Krzysztof

