Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6036784539
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 17:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236703AbjHVPPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 11:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234758AbjHVPPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 11:15:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0D7198;
        Tue, 22 Aug 2023 08:15:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C8B06239C;
        Tue, 22 Aug 2023 15:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630A5C433CA;
        Tue, 22 Aug 2023 15:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692717347;
        bh=1iRzAJpSnnBKBiSbWj57N8fqiKzuFhsp4EDmCi7qFaY=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=XQ8+sP37Eu74UtMJkVgHgwXXhdEUvWavtMn1bBRtnLEXKu77DUi7napIVTPAYvcDe
         PfuDfX0pt4ULVGaCYxQCWBCjhgDw7Yb355X0tM5yA7y0ElSEydBmL8S6+RkdnhMXzV
         vVs8yIPirSl6Gy8MiuYzibZJUHOQWvrYxWQTe/VgLW7hu1QdGFKE9M+3VBIejDo3Hh
         t2xhfZXUuJOmYNUB0RF3nCC/DV5VQZHUlyJ8EjSL8L9Xzp/Daej3kUtEfOQ1E4xQBa
         aF1c7zUshwH00jacI6YYTmegXSitDq34EEoq88rqPu2yVBa+8WV3N5kJvVgJDukKuu
         TK1vyqOApchMw==
Received: (nullmailer pid 205350 invoked by uid 1000);
        Tue, 22 Aug 2023 15:15:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sicelo <absicsz@gmail.com>, Tony Lindgren <tony@atomide.com>,
        linux-media@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Timo Kokkonen <timo.t.kokkonen@iki.fi>,
        =?utf-8?q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20230822145644.213589-3-sean@mess.org>
References: <20230822145644.213589-1-sean@mess.org>
 <20230822145644.213589-3-sean@mess.org>
Message-Id: <169271734434.205322.10925215324069905304.robh@kernel.org>
Subject: Re: [PATCH v3 2/2] media: dt-bindings: media: remove nokia,n900-ir
 as pwm-ir-tx is compatible
Date:   Tue, 22 Aug 2023 10:15:44 -0500
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Tue, 22 Aug 2023 15:56:44 +0100, Sean Young wrote:
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

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 64, in <module>
    ret |= check_doc(f)
           ^^^^^^^^^^^^
  File "/usr/local/bin/dt-doc-validate", line 32, in check_doc
    for error in sorted(dtsch.iter_errors(), key=lambda e: e.linecol):
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/schema.py", line 135, in iter_errors
    self.annotate_error(scherr, meta_schema, scherr.schema_path)
  File "/usr/local/lib/python3.11/dist-packages/dtschema/schema.py", line 114, in annotate_error
    schema = schema[p]
             ~~~~~~^^^
KeyError: 'type'
Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.example.dtb: /example-0/irled: failed to match any schema with compatible: ['pwm-ir-tx']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230822145644.213589-3-sean@mess.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

