Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD8764DC31
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 14:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiLONYo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 08:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiLONYn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 08:24:43 -0500
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332A5A1B3;
        Thu, 15 Dec 2022 05:24:42 -0800 (PST)
Received: by mail-ot1-f50.google.com with SMTP id x44-20020a05683040ac00b006707c74330eso3551861ott.10;
        Thu, 15 Dec 2022 05:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LW+ve3cUHfE0Z9o9zNuwsUKMr7x49DLEjQJOo5HhbzE=;
        b=a1qixfeXME1+MCSsnuBALsxJFy7Bac1eLROhBrwaUH3TrxIU/7i6/QWsV271ot+mw4
         hIBE5/jeA94b4g0luIIx3eaLLAoN4/61X8aBzFzwIBkv6KvARLz3q7T9JopUJctWPfiJ
         JaKv0QVVSXXn5lSrgbtgv1garwqSCFikQ7kcjmEHnYdenzYJn6ScGllhl6pfl+nCE6V6
         qi5hRCPUtKKyisYo+WxFKWMqqtp+62qO7gdHAPplyan7X8hTRO7yaKuFuID7SX+6MUqH
         FBXUzjAPVz4sqeXYVuNKedz0e5JL44ku2TjqomLlVrvzZlvAXJazi015C7OxIqhWVqjP
         P4/A==
X-Gm-Message-State: ANoB5pnzdbEMxO3cXa96ufiLR+zSIyZiIQJOzIoQz5ICct7vTcaT8yCy
        C196xuq6wfltAndt/k0WFQ==
X-Google-Smtp-Source: AA0mqf5m3bJ7wlhof02tlHFbt6GI7JXxF/ePUsFVTQQiF46zUNrgqysCCNZHFx4GGOviV3IPb7Eemg==
X-Received: by 2002:a9d:6406:0:b0:66e:ab29:341b with SMTP id h6-20020a9d6406000000b0066eab29341bmr11881163otl.18.1671110681381;
        Thu, 15 Dec 2022 05:24:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l23-20020a9d7a97000000b00667ff6b7e9esm3552662otn.40.2022.12.15.05.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 05:24:40 -0800 (PST)
Received: (nullmailer pid 3142468 invoked by uid 1000);
        Thu, 15 Dec 2022 13:24:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Nizan <tnizan@witekio.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20221214233825.13050-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
 <20221214233825.13050-3-laurent.pinchart+renesas@ideasonboard.com>
Message-Id: <167111060968.3140791.14917058235505688958.robh@kernel.org>
Subject: Re: [PATCH v3 02/12] dt-bindings: media: i2c: max9286: Add property
 to select I2C speed
Date:   Thu, 15 Dec 2022 07:24:38 -0600
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Thu, 15 Dec 2022 01:38:15 +0200, Laurent Pinchart wrote:
> The I2C speed on the remote side (the I2C master bus of the connected
> serializers) is configurable, and doesn't need to match the speed of the
> local bus (the slave bus of the MAX9286). All remote buses must use the
> same speed, and the MAX9286 needs to be programmed accordingly. Add a
> new DT property to select the speed to make it configurable.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v2:
> 
> - Rename property to maxim,i2c-remote-bus-hz
> - Specify the property type
> ---
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml: properties:maxim,i2c-remote-bus-hz: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221214233825.13050-3-laurent.pinchart+renesas@ideasonboard.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

