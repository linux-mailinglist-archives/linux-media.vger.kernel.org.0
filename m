Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E09A27B5B1D
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 21:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238200AbjJBTR6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 15:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjJBTR5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 15:17:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 414E7B0
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 12:17:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7752C433C8;
        Mon,  2 Oct 2023 19:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696274274;
        bh=3JgM+v0ZuncMt63lc6R7SDjcc31nAdmBVULeGLpCTfs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GLWTqiax4pcj18ajxGc2ekGV9NbyyQLFkZNj9WZdj42NAK6AKSp4xDs/AezIRPCvo
         Nw/lObeKZd/qMXxP3v1XrMVPjJtcjbPFqdn8wKZESpEDM71FJGcTWi2xmKB+FZ2t1L
         qgo9gVFy+L33TuFHvFvgK9gDdCZdh43UaJ5G3xn7HbzZSnihE9ux9kt2sAkaezCvnJ
         +Zg48bnoaxmO0R0Uwe+P6Pjfek5LcWUHBnINpDstX94jpziiYWiFp5mHvdL95SLnvi
         mVNYIqIDQe3Z0Q8H3oDCny/gnWOJUh4gW/8E0i5jRLOja6aOKjVUI6466lu94pjVTY
         2ZTGqkPSNU5oQ==
Received: (nullmailer pid 2376795 invoked by uid 1000);
        Mon, 02 Oct 2023 19:17:52 -0000
Date:   Mon, 2 Oct 2023 14:17:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        martink@posteo.de, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 3/7] media: dt-bindings: ovti,ov02a10: Fix handling of
 video-interface-device
Message-ID: <169627427147.2376729.523525213804282269.robh@kernel.org>
References: <20230930145951.23433-1-jacopo.mondi@ideasonboard.com>
 <20230930145951.23433-4-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930145951.23433-4-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Sat, 30 Sep 2023 16:59:47 +0200, Jacopo Mondi wrote:
> Fix handling of properties from video-interface-device.yaml for
> Omnivision OV02A10 sensor.
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
>  .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml       | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

