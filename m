Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A37FC53AE2A
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 22:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiFAUn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 16:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiFAUmw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 16:42:52 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9DF25BC18;
        Wed,  1 Jun 2022 13:24:54 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id m82so4069314oif.13;
        Wed, 01 Jun 2022 13:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+oEvt8sf4TNEOQwuXvkayzQRhlop784huNwQTGf8szM=;
        b=PMBuMe3ajIor114thw4GqKl747NchE07mBktaQRZbtLw8pU+G8lioE1grdAdZeqsYA
         pKyuHf+ZMLFt27dezLxXKnHStDtSHL8XqdH44XZfwtHsuVSwJdIlqZr8nBLolvp6J664
         6Iq1YAc5S8+4GxZG4X8EWnPGnpTJ5rAHaF4Mmub7e/ZFOUJDgpRWmXTyz0Zxi2PaZS2z
         D28rb6p3eaf4tGayD+X7vZk/cCc9pWU5ROzBj9W35el4Ax6q6XbfiZb2iu8Bptf7AFPA
         K/RijwG6ll9T+Ep3/7wcr3vWOPVAKFh36d4AEiCRQxfHssTYY3zRSNGiSxHzZMYDZFiy
         xVEQ==
X-Gm-Message-State: AOAM530CKSkG0Pm/vtYrK2yTMgYYguT+sxmoLyxxD1FZyafWpuJiJg8C
        p2TG7+9UVw7suuGVeOAfxxEbS24loA==
X-Google-Smtp-Source: ABdhPJxJmw2Wr1rxxehnbS1Z0gkP+WPIZRGPR7vHDTR5nLzOcg+2R1n/P5o97mMeAALFB5Vi2lWL1Q==
X-Received: by 2002:a05:6808:e83:b0:32e:28e2:199d with SMTP id k3-20020a0568080e8300b0032e28e2199dmr770181oil.222.1654115093579;
        Wed, 01 Jun 2022 13:24:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e28-20020a544f1c000000b0032c18f04800sm1468136oiy.1.2022.06.01.13.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 13:24:53 -0700 (PDT)
Received: (nullmailer pid 379428 invoked by uid 1000);
        Wed, 01 Jun 2022 20:24:52 -0000
Date:   Wed, 1 Jun 2022 15:24:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] media: dt-bindings: media: sm8250-camss: Add
 power-domain-names property
Message-ID: <20220601202452.GA365963-robh@kernel.org>
References: <20220518121104.951621-1-vladimir.zapolskiy@linaro.org>
 <06baf3b7-6b2d-4cc6-64d7-7bd1b3a18335@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06baf3b7-6b2d-4cc6-64d7-7bd1b3a18335@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 20, 2022 at 12:53:02AM +0300, Vladimir Zapolskiy wrote:
> On 5/18/22 15:11, Vladimir Zapolskiy wrote:
> > QCOM SM8250 camera subsystem depends on three power domains, at the moment
> > all of them are not differentiated one from another, however the power
> > domains compose a hierarchical structure with vfe0 and vfe1 as subdomains
> > of titan_top, also managing vfe0 and vfe1 separately allows to get more
> > fine-grained power control in runtime.
> > 
> > The change relates to my review comment for v2 of CAMSS on SM8250 submission:
> > 
> >     https://lore.kernel.org/all/13ad033e-cd5d-3a8c-b036-50a3ac4245c0@linaro.org/
> > 
> > Apparently it becomes important to manage CAMSS power domains much better for
> > newer platforms, this referes to platforms with Titan GDSC, for instance CAMSS
> > on SM8450 has 6 power domains, and dealing with them in bulk is not an option.
> > 
> > There was a note in commit 2f6f8af67203 ("media: camss: Refactor VFE power
> > domain toggling") about problems with power VFE domains on/off, but perhaps
> > it's related to the fact that Titan GDSC is a special power domain and VFE
> > are subdomains, the latter shall not be enabled earlier than the Titan, but
> > the driver did not construct a proper hierarchy and leaves a room for races.
> > 
> > The change should have no implications on any SM8250 CAMSS users, since
> > none of the supported in upstream boards enables the camss device tree node.
> > The correspondent changes in the driver will follow this dt specific series.
> > 
> > Most likely a similar change is required for SDM845 platform, but it would
> > need additional investigation and testing.
> > 
> > Vladimir Zapolskiy (2):
> >    media: dt-bindings: media: sm8250-camss: Add power-domain-names property
> >    arm64: dts: qcom: sm8250: camss: Add power-domain-names property
> > 
> >   .../devicetree/bindings/media/qcom,sm8250-camss.yaml       | 7 +++++++
> >   arch/arm64/boot/dts/qcom/sm8250.dtsi                       | 1 +
> >   2 files changed, 8 insertions(+)
> > 
> 
> These changes will be unneeded, if it is reliable to state that the order
> of 'power-domains' array values is fixed.
> 
> From Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> 
>   power-domains:
>     items:
>       - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
>       - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
>       - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
> 
> Apparently it's insufficient to ensure the fixed order of the power domains
> by running a check against the schema, and likely it can not be improved,
> but please correct me here, if I'm wrong.

Right, the schemas can't check that the order is correct.

> That's said, what is the preferred way here? Leave everything as is and rely
> on the order of item descriptions, or add a new power-domain-names property?

Well, you can't start requiring power-domain-names without breaking the 
ABI and it has to be required to allow any order. Even then, defined 
order is preferred unless there's too many variations and we're stuck 
with no defined order.

Rob
