Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00D92783DBB
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 12:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbjHVKOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 06:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234715AbjHVKOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 06:14:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0470918B;
        Tue, 22 Aug 2023 03:14:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 88EBA6515D;
        Tue, 22 Aug 2023 10:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E93EC433C8;
        Tue, 22 Aug 2023 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692699269;
        bh=supsPTf0NLogHIxDbbWa+tx2nxJBFB1PmfR8p4yK42k=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Sv84kXzb7XIuMu88RbN0vbzLOqLH7/Q164Uu1y5GDLCBayJpQIbRgzLek1DNRUBSt
         05NTfAob2GD8781ixZMFqKqjV6xXaAbK4JGdxT9Mk/Ay8qAVJ7euIAx8SJ0Iw5SQlp
         QkFW2pDKUSg5byFHce5o+kzgHS7jq92LbvM21dOWmFCQYBlIcCgoP7AzcWFY581fAx
         vvI5rFGNExhPwIdyVffFW7NnTGsoxYtxb8Ih0AHI4e2VEh2vLIr7yapIAWcynVLxwJ
         7L98H1C8vEk3zXslBAnMbfzoks2RfONHukam0hLWRtFmnXynKgfDqGPSGYByyN7FZF
         ZVOiwGdz+p1SQ==
Received: (nullmailer pid 3922891 invoked by uid 1000);
        Tue, 22 Aug 2023 10:14:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     =?utf-8?q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Sicelo <absicsz@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Timo Kokkonen <timo.t.kokkonen@iki.fi>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20230822091245.209539-3-sean@mess.org>
References: <20230822091245.209539-1-sean@mess.org>
 <20230822091245.209539-3-sean@mess.org>
Message-Id: <169269926692.3922840.4619930244422690395.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: remove nokia,n900-ir
 as pwm-ir-tx is compatible
Date:   Tue, 22 Aug 2023 05:14:26 -0500
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Tue, 22 Aug 2023 10:12:45 +0100, Sean Young wrote:
> The generic pwm-ir-tx driver works for the Nokia n900, so nokia,n900-ir
> can be removed.
> 
> Cc: Sicelo <absicsz@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: Pali Rohár <pali.rohar@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Timo Kokkonen <timo.t.kokkonen@iki.fi>
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  .../bindings/leds/irled/pwm-ir-tx.yaml        |  4 +++-
>  .../devicetree/bindings/media/nokia,n900-ir   | 20 -------------------
>  2 files changed, 3 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/nokia,n900-ir
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml:19:6: [warning] wrong indentation: expected 6 but found 5 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.example.dtb: irled: compatible: ['pwm-ir-tx'] is too short
	from schema $id: http://devicetree.org/schemas/leds/irled/pwm-ir-tx.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230822091245.209539-3-sean@mess.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

