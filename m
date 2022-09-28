Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872805EE982
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 00:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbiI1Why (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 18:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234620AbiI1WhY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 18:37:24 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90FFFF3CA;
        Wed, 28 Sep 2022 15:37:23 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id v130so17028513oie.2;
        Wed, 28 Sep 2022 15:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=P++xTzZTIc2lmfX8WxZXDSskvgSwQSbgUUQ1hjUxsDE=;
        b=lQN+K+qXXArQmIECwqUhZTgZfGVaEolGQI4EIS5gZTLcAR5nA0CkabnghOr2rFAz1X
         f6eS3wyJxuLPT0ytRr99nauMhL3LbwwZTJF18TCTXP9Ib4LAbpxWe+W6nFkHus4Gka1q
         8Fvm8KB5P9dlQ8Tjs7cB401+9hsU8Ah8rL0N4Hz61OpDAF+vY2eRc+q77NdcunL81wmN
         qkezu5I+0DnhD0ztiNTezQFEeLqBypzS8LzvmL4Q9d+NGIw6/0ZC36EK/HNRiwzePuJz
         GbdTovM2XYvHXPsEZtBz566tSJaaxcanJmGFPLXKorTjg88TREvTRkh0yf4uKudzOwTo
         /P+A==
X-Gm-Message-State: ACrzQf2ag0u9/DR3ssYL4p6enwWUI5rQ3VJhcukviCZSsYdyEW/zkaRb
        rtMkbg63eFc3nxCwKTVOjFhdJ2YdJQ==
X-Google-Smtp-Source: AMsMyM7Yb+UES5pgqkzihDa67ToREa3zQpjLF+O3UGIQskhh28AQph/ir7XzhzRmrneAV+2SppQ0Lw==
X-Received: by 2002:a05:6808:d53:b0:351:1cab:9c29 with SMTP id w19-20020a0568080d5300b003511cab9c29mr141867oik.64.1664404643080;
        Wed, 28 Sep 2022 15:37:23 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r5-20020acac105000000b0034ffacec0basm2373165oif.15.2022.09.28.15.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 15:37:22 -0700 (PDT)
Received: (nullmailer pid 87023 invoked by uid 1000);
        Wed, 28 Sep 2022 22:37:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     Erling Ljunggren <hljunggr@cisco.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20220928112147.358745-4-hljunggr@cisco.com>
References: <20220928112147.358745-1-hljunggr@cisco.com> <20220928112147.358745-4-hljunggr@cisco.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: media: add cat24c208 bindings
Date:   Wed, 28 Sep 2022 17:37:22 -0500
Message-Id: <1664404642.089109.87022.nullmailer@macbook.herring.priv>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 28 Sep 2022 13:21:45 +0200, Erling Ljunggren wrote:
> Add devicetree bindings for new cat24c208 EDID EEPROM driver.
> 
> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> ---
>  .../bindings/media/i2c/onnn,cat24c208.yaml    | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.example.dts:25.39-40 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:384: Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1420: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

