Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50F85584048
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 15:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiG1NrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 09:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbiG1NrR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 09:47:17 -0400
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109CB61DBD;
        Thu, 28 Jul 2022 06:47:17 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id p81so1415724iod.2;
        Thu, 28 Jul 2022 06:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=b5obbi131v2qqX/LqYePEq3jyKNtySpUzi1WsqQzUV4=;
        b=plftTR/8K7e4OW0ANJHv31wFJO3qgIs3dE7hsKD6LshW6Loq/iOXsZMzcK7jxwF310
         44/RZ8gUqckPPQrknlJPh9Fi3vtbqNNZDxxsuf++VtYiCnsBIL1IcxzR/w96O3U7dMIL
         oT0tnDkde3hZ9StpwTTS4AdP5Ki5u/4QOcNvDw4d1cHayPbZu6aCyRX7JDzhq2B7D9pu
         JneiUzPeumvXVxAsoLCqE43TjlWkbONWAUjSIYEU0Tdg9yE3YDF/odSrB/u8Dtx4eDqL
         bq1+SzMjWF0ixDPsBcFkOEzZ8YQ1E7+QREJwmFKysVkHhMrGEoCrU+NNQCH73Lf1xX/v
         56Ww==
X-Gm-Message-State: AJIora+RGJX4BFE1l5B13KaqHv8Bot33/tOap/CHrvS/OmiB5kBCCyPK
        r01T/yZzLGncfxjauzwxecaud3gUhA==
X-Google-Smtp-Source: AGRyM1ss/s2b1yL1tNWQfg+dNHwAUj7+uNfrOXnsIUB1vphl49mkgyrY+KEXwsp3g5jZgJVMwxdJlg==
X-Received: by 2002:a05:6602:2f0c:b0:67c:19b2:bb0d with SMTP id q12-20020a0566022f0c00b0067c19b2bb0dmr9731828iow.34.1659016036225;
        Thu, 28 Jul 2022 06:47:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id ca27-20020a0566381c1b00b0033cc22c261fsm393693jab.111.2022.07.28.06.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 06:47:15 -0700 (PDT)
Received: (nullmailer pid 779715 invoked by uid 1000);
        Thu, 28 Jul 2022 13:47:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     Erling Ljunggren <hljunggr@cisco.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20220728114050.2400475-4-hljunggr@cisco.com>
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-4-hljunggr@cisco.com>
Subject: Re: [PATCH 3/5] dt-bindings: media: add cat24c208 bindings
Date:   Thu, 28 Jul 2022 07:47:12 -0600
Message-Id: <1659016032.650178.779714.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 28 Jul 2022 13:40:48 +0200, Erling Ljunggren wrote:
> Add devicetree bindings for new cat24c208 EDID EEPROM driver.
> 
> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> ---
>  .../bindings/media/i2c/onnn,cat24c208.yaml    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.example.dts:22.20-25.15: Warning (i2c_bus_reg): /example-0/i2c/lens@e: I2C bus unit address format error, expected "31"

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

