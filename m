Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73BA964DC6A
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 14:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiLONng (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 08:43:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbiLONne (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 08:43:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8BF101EE;
        Thu, 15 Dec 2022 05:43:33 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67D89327;
        Thu, 15 Dec 2022 14:43:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671111811;
        bh=IkdbOkNfizeZc+JQCY7rk80M3K1s0tFyYkGTX0I5Now=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Log1XbtFBzhd9Xx404T/x3NxSrbXGo4IPnmuhQeZYrw6vncNcTivRQ3LjYVn/wB7Z
         dUWXYZLgGqlgHf4c6JLm3H6JmFNouq6P5iBBimRnykVQJgNr3k+W2YGztFu1Pk+VSH
         IWI3mWXenO0jUyhonoTVOuPZqy6RSAk6zsHNnNPw=
Date:   Thu, 15 Dec 2022 15:43:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Nizan <tnizan@witekio.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/12] dt-bindings: media: i2c: max9286: Add property
 to select I2C speed
Message-ID: <Y5skgJqitZRKHqyY@pendragon.ideasonboard.com>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
 <20221214233825.13050-3-laurent.pinchart+renesas@ideasonboard.com>
 <167111060968.3140791.14917058235505688958.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <167111060968.3140791.14917058235505688958.robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Thu, Dec 15, 2022 at 07:24:38AM -0600, Rob Herring wrote:
> On Thu, 15 Dec 2022 01:38:15 +0200, Laurent Pinchart wrote:
> > The I2C speed on the remote side (the I2C master bus of the connected
> > serializers) is configurable, and doesn't need to match the speed of the
> > local bus (the slave bus of the MAX9286). All remote buses must use the
> > same speed, and the MAX9286 needs to be programmed accordingly. Add a
> > new DT property to select the speed to make it configurable.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > Changes since v2:
> > 
> > - Rename property to maxim,i2c-remote-bus-hz
> > - Specify the property type
> > ---
> >  .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml: properties:maxim,i2c-remote-bus-hz: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

I wonder how I missed that, as I've run dt_binding_check before
submitting. I'll fix it.

I'm a bit surprised though, all unit-suffixed properties use 32-bit
integers in the DT schema, while I can imagine that some may need a
64-bit integer. What's the recommendation in that case ?

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221214233825.13050-3-laurent.pinchart+renesas@ideasonboard.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

-- 
Regards,

Laurent Pinchart
