Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2229561600
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 11:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbiF3JRx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 05:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbiF3JRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 05:17:25 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8FB433BD
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 02:16:17 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id c65so25691379edf.4
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 02:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jxh9+8wGKifer/pkVBwkWFz/cUObqSEK4gTsvDCOLoQ=;
        b=mtiJ96LmLCRmWOanbe4ljk3xT3YdaBPutJSnlnWsxIYdNS9uCVN/HAHRCmp0acxDWV
         rRNbdX9q9ZTX2WKIGY62cj2PCkJ3HDA44PxEcjzLDxS6iafRpTUiVmalPY3vA677ko7n
         61aO/2oFVlXmsx844VQlHLW80YR1GOupEAi4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jxh9+8wGKifer/pkVBwkWFz/cUObqSEK4gTsvDCOLoQ=;
        b=JXftLEdxxaEClkRJ+WdULjRAjUHHpUN0re/CP7udj75l5BGU9AQqSSNK6Zi/YK4V3b
         RjlIafEaB01Ve73mOrGabUwcGwSZ3WUw/BoHjAGD3oHh3+Aa8zWko2BN8A6x+inZHG6L
         eX8hqtT7+ym+2lWB2wfSBPvlNiHLdci0JaKml9N7eRClddF+H+psVgekR7SdR/xAH51P
         lUsY4woDcqbITXHfVyUhCW2aqEHY7eoXC6HwrtTxqHFrzbPDCl9aVbF842/uNsoSlCpb
         9OeQp+dPX0eG+gXnNSPk+Rx0g5n+fWkbtGBxpBXU10qxTK0uFqMCvHyTmlmEkoT9/S+q
         uVcg==
X-Gm-Message-State: AJIora/bxotVHiZL9s0ecZ0Zsk9KnhD69uh/4vSaMXgmMeo6u83PfDy4
        kSOXlqxdKygrTwtou5QMEScKIQ==
X-Google-Smtp-Source: AGRyM1tftLZ2XSVsXGwKY1tVp8BzpGnUHbWht4UDCihn1aRATfSGrqPAHKl0L1tGrObwQOnOD1W32A==
X-Received: by 2002:a05:6402:4306:b0:435:a1c9:4272 with SMTP id m6-20020a056402430600b00435a1c94272mr10263737edc.205.1656580576250;
        Thu, 30 Jun 2022 02:16:16 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id q10-20020a170906940a00b006fe8bf56f53sm8947680ejx.43.2022.06.30.02.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 02:16:15 -0700 (PDT)
Date:   Thu, 30 Jun 2022 11:16:13 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] media: dt-bindings: ov5693: document YAML binding
Message-ID: <20220630091613.GD482517@tom-ThinkPad-T14s-Gen-2i>
References: <20220630074525.481790-1-tommaso.merciai@amarulasolutions.com>
 <20220630074525.481790-6-tommaso.merciai@amarulasolutions.com>
 <167f09c1-795d-1471-20f7-9f4df29355ed@linaro.org>
 <20220630090232.GC482517@tom-ThinkPad-T14s-Gen-2i>
 <Yr1pD2U2ilXXXX+Q@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yr1pD2U2ilXXXX+Q@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Jun 30, 2022 at 12:12:47PM +0300, Sakari Ailus wrote:
> On Thu, Jun 30, 2022 at 11:02:32AM +0200, Tommaso Merciai wrote:
> > On Thu, Jun 30, 2022 at 10:07:19AM +0200, Krzysztof Kozlowski wrote:
> > > On 30/06/2022 09:45, Tommaso Merciai wrote:
> > > > Add documentation of device tree in YAML schema for the OV5693
> > > > CMOS image sensor from Omnivision
> > > > 
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > Reviewed-by: Sakari Ailus <sakari.ailus@iki.fi>
> > > 
> > > How Sakari's tag appeared here? There was no email from him.
> > 
> > Sakari made me some review on v2, but I think he forgot to add the mailing
> > list in cc. ( I suppose :) )
> > 
> > Let me know if I need to remove this.
> 
> You're only supposed to put these tags into patches if you get them in
> written form as part of the review, signalling acceptance of the patch in
> various forms. Just commenting a patch does not imply this.
> 
> Please also see Documentation/process/submitting-patches.rst for more
> information on how to use the tags.

Thanks for sharing this. My bad.
I remove your tags.

Regards,
Tommaso

> 
> -- 
> Sakari Ailus

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
