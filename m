Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478CA7B382B
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 18:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbjI2Qzz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 12:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbjI2Qzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 12:55:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE561AE
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 09:55:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C6BC433C9;
        Fri, 29 Sep 2023 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696006552;
        bh=uf3unOmquHNeo7Ua/HDausdM3DppGA02+6/jUxVaBPU=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=jcv5ZVlkiH0PDq8XbPRd0TeLlyedF1el5RuKNHTtcFvvEv2AxevxgeCp6CqWrYHHI
         9R21E0jn2gtFAq7xxMp+ldIceBIij/8NRzCii41Px2RRBVtYvW55MJlhpUEPyN0/OR
         e/Z+QMiwnkR5dQqsckubwYTmBD3TPYBlW1rlY7rmFrq8Z0R+Jt5jvyWguRD/IXtlGQ
         /6xIQtdZsn9s+wJ/vt22NrALe9PD3CxqLAfS4wxNJQeEn39gnZWUFuuYw7oZ6jilb6
         kAOa4ndgt33bjayHekPc9PNCXpFOb62xQG8Er2Umy4q3Pu7K08y5ZG7frnuUEcyvwR
         lkl9/EuYCyH5w==
Received: (nullmailer pid 4105451 invoked by uid 1000);
        Fri, 29 Sep 2023 16:55:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>, martink@posteo.de,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20230929151825.6535-6-jacopo.mondi@ideasonboard.com>
References: <20230929151825.6535-1-jacopo.mondi@ideasonboard.com>
 <20230929151825.6535-6-jacopo.mondi@ideasonboard.com>
Message-Id: <169600654899.4105435.9416613828918752316.robh@kernel.org>
Subject: Re: [PATCH 5/7] media: bindings: ovti,ov5640: Fix handling of
 video-interface-device
Date:   Fri, 29 Sep 2023 11:55:49 -0500
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Fri, 29 Sep 2023 17:18:23 +0200, Jacopo Mondi wrote:
> Fix handling of properties from video-interface-device.yaml for
> Omnivision OV5640 sensor.
> 
> There is no reason to restrict the allowed rotation degrees to 0 and 180,
> as the sensor can be mounted with any rotation.
> 
> Also, as all the properties described by video-interface-device.yaml are
> allowed for the image sensor, make them accepted by changing
> "additionalProperties: false" to "unevaluatedProperties: false" at the
> schema top-level.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/i2c/ovti,ov5640.yaml         | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml: 'unevaluatatedProperties' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230929151825.6535-6-jacopo.mondi@ideasonboard.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

