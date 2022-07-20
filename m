Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7233557C016
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 00:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbiGTWbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 18:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiGTWbn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 18:31:43 -0400
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17FBD13DF5;
        Wed, 20 Jul 2022 15:31:43 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id h14so2873596ilq.12;
        Wed, 20 Jul 2022 15:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t5TlJ94FD1MVyczPdskF3rjx/bkliuSIhUHKZii9ixQ=;
        b=MsNBUKGleCz5pBFMUBTgLcFMs4FahJIbEyOIrRKzLt/7/psFx7rtJ+ydhySgXdudAc
         ZKSnniL/SeG8ut3lB5P6Flat9TIOo4kI/N3n2V52RE6dW9R6hI4ICzwIihq2xm63azoH
         PCffgdT/8aAiXJ6SZ9FXzgmxunjYff0+q47B9Eum0xdlx5h/x5WYP1LE2Lbpa+gpJy/l
         knSkBcc4dxop6nouQ+nMfJ/rLTr/2O/WboEE8tJctLlMLQKvlK0Xzdr+c3IaH/62fjC5
         LJ0WH+eSmp94zurIggcYMaSuzUREdDs1/p++DvC7U+jMqUAWU9zf53b182IJi544BR8Z
         FZBw==
X-Gm-Message-State: AJIora8qJzMmhI+oKluXZGrsZaETPevKgAvwr54f+ZBpNZFjsxNohIRu
        VPvAg2yEBVwmfr16wG0GjrKkP9CkUA==
X-Google-Smtp-Source: AGRyM1t1TJ6DIzu8lyJvtIiXyv5C51ElON3pDHVOL6+LSuhwewg67Q9wDEz8JbrJmTojrloxiIO0jQ==
X-Received: by 2002:a05:6e02:784:b0:2dd:49c:18b5 with SMTP id q4-20020a056e02078400b002dd049c18b5mr4487802ils.224.1658356302336;
        Wed, 20 Jul 2022 15:31:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c44-20020a023b2c000000b0033ec34174a4sm63555jaa.39.2022.07.20.15.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 15:31:42 -0700 (PDT)
Received: (nullmailer pid 4099699 invoked by uid 1000);
        Wed, 20 Jul 2022 22:31:40 -0000
Date:   Wed, 20 Jul 2022 16:31:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     andrey.konovalov@linaro.org, konrad.dybcio@somainline.org,
        devicetree@vger.kernel.org, daniele.alessandrelli@intel.com,
        jacopo@jmondi.org, linux-media@vger.kernel.org,
        dmitry.baryshkov@linaro.org, mchehab@kernel.org,
        sakari.ailus@iki.fi, paul.j.murphy@intel.com
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: Rename imx412 to imx577
Message-ID: <20220720223140.GA4099645-robh@kernel.org>
References: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
 <20220718014215.1240114-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718014215.1240114-2-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 18 Jul 2022 02:42:13 +0100, Bryan O'Donoghue wrote:
> The yaml and driver we have right now misidentifies the imx577 as the
> imx412.
> 
> Looking at similar IMX chips which give their chip identifier via register
> 0x0016 we can see:
> 
> drivers/media/i2c/imx258.c:#define IMX258_REG_CHIP_ID    0x0016
> drivers/media/i2c/imx258.c:#define IMX258_CHIP_ID        0x0258
> 
> drivers/media/i2c/imx319.c:#define IMX319_REG_CHIP_ID    0x0016
> drivers/media/i2c/imx319.c:#define IMX319_CHIP_ID        0x0319
> 
> drivers/media/i2c/imx355.c:#define IMX355_REG_CHIP_ID    0x0016
> drivers/media/i2c/imx355.c:#define IMX355_CHIP_ID        0x0355
> 
> Right now imx412.c does:
> 
> drivers/media/i2c/imx412.c:#define IMX412_REG_ID         0x0016
> drivers/media/i2c/imx412.c:#define IMX412_ID             0x577
> 
> As a first step to fixing this problem rename the supporting yaml file and
> containing text from imx412 to imx577.
> 
> Fixes: 333b3125d130 ("media: dt-bindings: media: Add bindings for imx412")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../i2c/{sony,imx412.yaml => sony,imx577.yaml} | 18 +++++++++---------
>  MAINTAINERS                                    |  6 +++---
>  2 files changed, 12 insertions(+), 12 deletions(-)
>  rename Documentation/devicetree/bindings/media/i2c/{sony,imx412.yaml => sony,imx577.yaml} (83%)
> 

Acked-by: Rob Herring <robh@kernel.org>
