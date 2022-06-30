Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB7356159F
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 11:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbiF3JCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 05:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233142AbiF3JCi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 05:02:38 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B661706C
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 02:02:36 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id g26so37656436ejb.5
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AuX+nwwpodOtG7VZE2TdaEnnhPouf9ZrSdTVqXsU+ig=;
        b=CaihvbeC2HmOqUT6dUv6vr0GzxLYSnFaJDmC2EsTjgumm/ahXQJ/BaRsIrbhZ5LOZY
         Rt18eoHfD4Xlfe6dT4xpG3/CzaZ6S6hPZ3smgCmwPc9Nmq9CuopHZTRWBIfpVMKeqoW5
         bDXVawcsoG97BYCMwn6o5YjXBM/g4i05KBGkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AuX+nwwpodOtG7VZE2TdaEnnhPouf9ZrSdTVqXsU+ig=;
        b=FAlmgZJfz6tHrocSTqJ8a4WmwiNYLzs09yxqGjb/OVqGLryVoGVPiwgWKUNB7ld8vf
         UqJpJj6REXkJwFkypkb2nHpO+8f+xtbqNM2FU85OhLjKHinercvNAUVQhD2Hib9qzYrZ
         R3V9F1INxR9bcmG8jyNDnJmXfmmGJ+KJCXLy9pMrVOcvXto17DSMAYXgDTFTOWNwpce3
         IUhhetSFQ+LR1t8juWU+7kHzLNW655U3mKyvdJHa6IarYvUDuT1osT7aJfCFRf8cqiOk
         1KZLG12zF5EnjdL/Z6Rvc6XWCZbk3S5yUYByVeH99iNTFu7QxUYNCiN0ix6DdO7Y9ZXs
         F4sw==
X-Gm-Message-State: AJIora+Aox0pwOi3hE++4MeB3jtGKGo5XFvVWGovIk9kvgtrfTZr8Vv0
        WQ+NQuDgKdKEEyCIuTokOTPlyg==
X-Google-Smtp-Source: AGRyM1tXWxKnM/M8nLspQhorpZ0PWjNgd4FquIdzACE6n4U6axIeUQxojfcLODarerHspVkGB2CpDw==
X-Received: by 2002:a17:907:a40f:b0:726:a8f5:1031 with SMTP id sg15-20020a170907a40f00b00726a8f51031mr7834385ejc.185.1656579755519;
        Thu, 30 Jun 2022 02:02:35 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id jz27-20020a17090775fb00b007246492658asm8704234ejc.117.2022.06.30.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 02:02:35 -0700 (PDT)
Date:   Thu, 30 Jun 2022 11:02:32 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] media: dt-bindings: ov5693: document YAML binding
Message-ID: <20220630090232.GC482517@tom-ThinkPad-T14s-Gen-2i>
References: <20220630074525.481790-1-tommaso.merciai@amarulasolutions.com>
 <20220630074525.481790-6-tommaso.merciai@amarulasolutions.com>
 <167f09c1-795d-1471-20f7-9f4df29355ed@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167f09c1-795d-1471-20f7-9f4df29355ed@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 30, 2022 at 10:07:19AM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2022 09:45, Tommaso Merciai wrote:
> > Add documentation of device tree in YAML schema for the OV5693
> > CMOS image sensor from Omnivision
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Sakari Ailus <sakari.ailus@iki.fi>
> 
> How Sakari's tag appeared here? There was no email from him.

Sakari made me some review on v2, but I think he forgot to add the mailing
list in cc. ( I suppose :) )

Let me know if I need to remove this.

Regards,
Tommaso


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
