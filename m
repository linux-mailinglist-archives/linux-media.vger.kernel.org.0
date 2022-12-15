Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1EB164DE8A
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 17:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiLOQYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 11:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbiLOQXf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 11:23:35 -0500
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85FF396D3;
        Thu, 15 Dec 2022 08:22:17 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id m7-20020a9d6447000000b0066da0504b5eso3856000otl.13;
        Thu, 15 Dec 2022 08:22:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lvp+Rra/J+0wVWurvbgG0Bk7qShU+6ZOVAk+JE7aHs=;
        b=xWml9QbxpMOa2ekPwryWxLXpaSuCWrhupKpu4VuYFpMkhSpBY+egWUFKy/s1BpAd9m
         +xKyVJin2Y1QoOUQjiVZWFNG34t9twUEcnluDcVscs2neDJliUs20JhD4GOKTPPXX3Cv
         YUZhonSPUMYk3jD6xvqxHiScsdBJ3n9CMrV7nFUZ1byHSeYEy4Z9DEO+ts056YYkXHB0
         xFkSPkA7uiX7slhS0+oEjVKexllRBRjGVGXi5nTyz4HTJZQHvmF8UZd5Lou3+OhpfAjO
         HGQ4dDu2F9Q7G8VC4gIFsUNYCMAB3Ksobm4F5Oq2KszVRjkJGpb0yCDNNVPFZUtFyk7u
         xALQ==
X-Gm-Message-State: ANoB5pncLq8ts+YT4trDNHS4JEQ2aqlym8TWY6gjfHSZOZsCMx4B5nbk
        wwLSur+3sxN/JiMPWcyoGA==
X-Google-Smtp-Source: AA0mqf7X/PFzmParAODHOyFtTJjq+Nk9hxsJMAGA3If31IqPxkC3c3wsbOlFneYtyPmQ2EVOqVfozw==
X-Received: by 2002:a05:6830:2098:b0:670:6976:a864 with SMTP id y24-20020a056830209800b006706976a864mr14501417otq.29.1671121337113;
        Thu, 15 Dec 2022 08:22:17 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d21-20020a056830139500b0066ec7ace428sm3698309otq.10.2022.12.15.08.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 08:22:16 -0800 (PST)
Received: (nullmailer pid 145631 invoked by uid 1000);
        Thu, 15 Dec 2022 16:22:16 -0000
Date:   Thu, 15 Dec 2022 10:22:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Nizan <tnizan@witekio.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/12] dt-bindings: media: i2c: max9286: Add property
 to select I2C speed
Message-ID: <20221215162216.GA141183-robh@kernel.org>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
 <20221214233825.13050-3-laurent.pinchart+renesas@ideasonboard.com>
 <167111060968.3140791.14917058235505688958.robh@kernel.org>
 <Y5skgJqitZRKHqyY@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5skgJqitZRKHqyY@pendragon.ideasonboard.com>
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

On Thu, Dec 15, 2022 at 03:43:28PM +0200, Laurent Pinchart wrote:
> Hi Rob,
> 
> On Thu, Dec 15, 2022 at 07:24:38AM -0600, Rob Herring wrote:
> > On Thu, 15 Dec 2022 01:38:15 +0200, Laurent Pinchart wrote:
> > > The I2C speed on the remote side (the I2C master bus of the connected
> > > serializers) is configurable, and doesn't need to match the speed of the
> > > local bus (the slave bus of the MAX9286). All remote buses must use the
> > > same speed, and the MAX9286 needs to be programmed accordingly. Add a
> > > new DT property to select the speed to make it configurable.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > > Changes since v2:
> > > 
> > > - Rename property to maxim,i2c-remote-bus-hz
> > > - Specify the property type
> > > ---
> > >  .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml: properties:maxim,i2c-remote-bus-hz: '$ref' should not be valid under {'const': '$ref'}
> > 	hint: Standard unit suffix properties don't need a type $ref
> > 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> 
> I wonder how I missed that, as I've run dt_binding_check before
> submitting. I'll fix it.
> 
> I'm a bit surprised though, all unit-suffixed properties use 32-bit
> integers in the DT schema, while I can imagine that some may need a
> 64-bit integer. What's the recommendation in that case ?

Use -mhz.

Anything outside the norm we have to special case in 
property-units.yaml.

Rob
