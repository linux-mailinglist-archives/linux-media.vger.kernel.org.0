Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B96E5613C8
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 09:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbiF3Hzv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 03:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbiF3Hzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 03:55:49 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF863FBE8
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 00:55:47 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id h23so37274208ejj.12
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 00:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aF/vEDhaI5UVVLV88GtQNx4eslB+Jp6D1zXXDLVk0z0=;
        b=SdAzaqx0a2HqVvHti2rhUsh4ejd+qNYnUrNZk75ymkYzwt1/6LoGUcBrepuEpk0tEf
         NY60QN6MuAUGwQNI0pmmgTokJBXmKwOo3/dKRbMaRZAoWxngW0zgvzxzrAJPrAN1voiB
         Nfbc1Q6DNzFRVi7zOCSyfVsTLyCKlnJgF0CQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aF/vEDhaI5UVVLV88GtQNx4eslB+Jp6D1zXXDLVk0z0=;
        b=0qE+Zgi9TDpEBVSgr0w5ek9VgbU4DqF4IzB/5r/wxm1E57skq8k9So4S+XwhFIxRqj
         j+zKR5jMRsIRN2izCSW+VMhAEYTDho1sm2vIb7bKfiZtqlMQLQjPOskzGl5106DhUAZR
         cMQkrlMnrmXvoTlald4eEun5NDwLw8lfTvpQy09BO+Z6CQ+JnVA7Y7ymmiqD92bTkKUa
         1M+4qfi1wNy5E96POoINCPuy8OHyHLcqWu7PDeaAyU8vzBnzBcV5JDEIJFmlfOYQiywy
         bXcNaWib/kUtxgEun5S9XDHaMjtGkdDAEvV0lBxKAjcX7nQUvMvM50S3cT3YrAGN/lHZ
         hBtA==
X-Gm-Message-State: AJIora8YI2jiSIPnB8Hllgqa9/PENWYlOWI+SHVUi0/Cb4LGPVTk5gjH
        mKiJ0YnWu7rVLy4rVg35gc/gSA==
X-Google-Smtp-Source: AGRyM1sFxgnCxjRqgI34Ka4G2ur+BiufICOZE9Ek9zsmUXbnylVTyNwys7genpkhFF1IKXTYPS9oWg==
X-Received: by 2002:a17:906:51cf:b0:722:e994:948e with SMTP id v15-20020a17090651cf00b00722e994948emr7380018ejk.656.1656575746195;
        Thu, 30 Jun 2022 00:55:46 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id le23-20020a170906ae1700b006f3ef214dbesm8660122ejb.36.2022.06.30.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 00:55:45 -0700 (PDT)
Date:   Thu, 30 Jun 2022 09:55:43 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] media: dt-bindings: ov5693: document YAML binding
Message-ID: <20220630075543.GA482517@tom-ThinkPad-T14s-Gen-2i>
References: <20220629152933.422990-1-tommaso.merciai@amarulasolutions.com>
 <20220629152933.422990-6-tommaso.merciai@amarulasolutions.com>
 <673c2e59-d1c5-f6b8-df80-b5a46a7aa92e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <673c2e59-d1c5-f6b8-df80-b5a46a7aa92e@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Wed, Jun 29, 2022 at 08:14:52PM +0200, Krzysztof Kozlowski wrote:
> On 29/06/2022 17:29, Tommaso Merciai wrote:
> > Add documentation of device tree in YAML schema for the OV5693
> > CMOS image sensor from Omnivision
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> > ---
> > Changes since v1:
> >  - Fix allOf position as suggested by Krzysztof
> >  - Remove port description as suggested by Krzysztof
> >  - Fix EOF as suggested by Krzysztof
> > 
> > Changes since v2:
> >  - Fix commit body as suggested by Krzysztof
> 
> You received a tag, so if you decided to send v3, you need to include it.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for suggestion.

Regards,
Tommaso

> 
> 
> Best regards,
> Krzysztof

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
