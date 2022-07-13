Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C2F573750
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 15:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235766AbiGMNY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 09:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbiGMNY5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 09:24:57 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCECD62
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 06:24:55 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v14so15502264wra.5
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 06:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yLLf2RupUAGZKj8nEeG0LSBEp5u3/qfodgo6k8ZYoVQ=;
        b=IbphrEpSNyolpp1NbysNG4wrCuerEaN0u+GrfUaqkpgfE2iwK3cWmYy5Ry5eOZHA/F
         LpuuNbiojQmj2LcHHHU3aN+H/UBSjVSM6jFoPjBfVaRodQkzp6RC86qbAhYJSkclrcgq
         ktdFqKZGBsC0k5DM8MkPias9TS5byU5qDy1TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yLLf2RupUAGZKj8nEeG0LSBEp5u3/qfodgo6k8ZYoVQ=;
        b=Hlg/0Z2RrAgyaXvF2UbeAqVwQbKF53LLFrimRk1poF0ZabM5M3HfnCvzCB7t6+R1kf
         Wc5SoIGh02cfB4dayFPBrI2mzWZ74zWme/6Go22+kZwvAtoSwv+BSFxEqrFLS7xGtEOi
         OU8cOnmpgQIlB2dn6mIzBLP0xTVNKfVNuND6aMQ7eW2ZSr7PUyA4e/4+EmA3dL1EaCOu
         d6VliQyEZPqUUm84WOaZqZQQeoW0iXGJlzqMpQgTEfhXB5MIeU/olyMusmpStTUdSZ/n
         JL7sn1g0LzOJqAYV/o9BvqV+mQjNerkyGhmNBazEtjxNFVml99HjCY2c7I+y1lbPGp/3
         cmHA==
X-Gm-Message-State: AJIora8snZZRKWwiC7b8MqV3peKOF4lRF1skxVSQe46VrxqO/kvGA2Y/
        ZneeVqsjJMNJn6xp732pzVCHtg==
X-Google-Smtp-Source: AGRyM1sJgKfY+g8GvrSMzl/KBZW/B0KYhfoYIllSy9Fh3tv9EC2rCfNnX5e5CdMZTgruAmdrENUrQQ==
X-Received: by 2002:a5d:4145:0:b0:21d:68ab:3bf with SMTP id c5-20020a5d4145000000b0021d68ab03bfmr3241320wrq.641.1657718693965;
        Wed, 13 Jul 2022 06:24:53 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-51-7.cust.vodafonedsl.it. [188.217.51.7])
        by smtp.gmail.com with ESMTPSA id ay15-20020a05600c1e0f00b003a2fb1224d9sm1886641wmb.19.2022.07.13.06.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 06:24:53 -0700 (PDT)
Date:   Wed, 13 Jul 2022 15:24:51 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org,
        quentin.schulz@theobroma-systems.com,
        Daniel Scally <djrscally@gmail.com>,
        linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] media: dt-bindings: ov5693: document YAML binding
Message-ID: <20220713132451.GA1725944@tom-ThinkPad-T14s-Gen-2i>
References: <20220712163349.1308540-1-tommaso.merciai@amarulasolutions.com>
 <20220712163349.1308540-6-tommaso.merciai@amarulasolutions.com>
 <1657664975.862137.2476655.nullmailer@robh.at.kernel.org>
 <20220713064845.GA1386778@tom-ThinkPad-T14s-Gen-2i>
 <87086513-787c-3b0d-80df-b90ebdc3a28c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87086513-787c-3b0d-80df-b90ebdc3a28c@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 13, 2022 at 08:52:34AM +0200, Krzysztof Kozlowski wrote:
> On 13/07/2022 08:48, Tommaso Merciai wrote:
> > Hi Rob,
> > 
> > On Tue, Jul 12, 2022 at 04:29:35PM -0600, Rob Herring wrote:
> >> On Tue, 12 Jul 2022 18:33:48 +0200, Tommaso Merciai wrote:
> >>> Add documentation of device tree in YAML schema for the OV5693
> >>> CMOS image sensor from Omnivision
> >>>
> >>> Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> ---
> >>> Changes since v1:
> >>>  - Fix allOf position as suggested by Krzysztof
> >>>  - Remove port description as suggested by Krzysztof
> >>>  - Fix EOF as suggested by Krzysztof
> >>>
> >>> Changes since v2:
> >>>  - Fix commit body as suggested by Krzysztof
> >>>
> >>> Changes since v3:
> >>>  - Add reviewed-by tags, suggested by Jacopo, Krzysztof
> >>>
> >>> Changes since v4:
> >>>  - Remove wrong Sakari reviewed-by tag, suggested by Krzysztof, Sakari
> >>>
> >>> Changes since v5:
> >>>  - Remove dovdd-supply, avdd-supply, dvdd-supply from required properties
> >>> as suggested by Jacopo
> >>>
> >>>  .../bindings/media/i2c/ovti,ov5693.yaml       | 103 ++++++++++++++++++
> >>>  MAINTAINERS                                   |   1 +
> >>>  2 files changed, 104 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> >>>
> >>
> >> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> >> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >>
> >> yamllint warnings/errors:
> >>
> >> dtschema/dtc warnings/errors:
> >> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.example.dtb: camera@36: Unevaluated properties are not allowed ('port' was unexpected)
> >> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> >>
> >> doc reference errors (make refcheckdocs):
> >>
> >> See https://patchwork.ozlabs.org/patch/
> >>
> >> This check can fail if there are any dependencies. The base for a patch
> >> series is generally the most recent rc1.
> >>
> >> If you already ran 'make dt_binding_check' and didn't see the above
> >> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> >> date:
> >>
> >> pip3 install dtschema --upgrade
> >>
> >> Please check and re-submit.
> >>
> > 
> > I run:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Then I check .yaml using:
> > 
> > make DT_CHECKER_FLAGS=-m dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> > DTEX    Documentation/devicetree/bindings/media/i2c/ovti,ov5693.example.dts
> > LINT    Documentation/devicetree/bindings
> > CHKDT   Documentation/devicetree/bindings/processed-schema.json
> > SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> > DTC     Documentation/devicetree/bindings/media/i2c/ovti,ov5693.example.dtb
> > CHECK   Documentation/devicetree/bindings/media/i2c/ovti,ov5693.example.dtb
> > 
> > No error on my side. I'm missing something?
> 
> Rob's check are running newer dtschema, from master branch. The error he
> reports is about missing port, although I thought it is coming from
> video-interface-devices.

Hi Krzysztof, 
Thanks for the info! :)

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
