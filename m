Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E6D7B5B1B
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 21:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238487AbjJBTSh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 15:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjJBTSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 15:18:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D61AB8
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 12:18:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE968C433C7;
        Mon,  2 Oct 2023 19:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696274313;
        bh=CvRbDUepgRE5yTdhw2mgN1pICg9mbxv0pF0xBTyZITc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h20tfHHFha5js4ci+TasTnAtGeypy4BBebCuXM+P4cZAJEMlfQ42+ZyoDL8muw/CY
         WSioEUerT4t2rE9zcxMA1lyhHbQH5APSsX5kDnxcdP9MukuCUJAE1rrOR0N9C3Bba4
         NbwN+RHL8o1u4pfV3ATis1dOOTCYl0s/B0VGbXLi5dl2rvrh76WM6+8E9/fPItFP2h
         3eDauvfSYadtP9UF5NpPnYY2SWWVTYdoLIS4iXVfgEx6hj/yLpZUepEFShgulTj2aT
         c7j7q3Y8OhD0hI8VcA5gg2vsOvsmfQawU06Z0I24GhVc6rnaXlmEmogcmCFpqJhNlU
         z76vPJO/5+LyQ==
Received: (nullmailer pid 2377709 invoked by uid 1000);
        Mon, 02 Oct 2023 19:18:32 -0000
Date:   Mon, 2 Oct 2023 14:18:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        martink@posteo.de, Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v3 5/7] media: dt-bindings: ovti,ov5640: Fix handling of
 video-interface-device
Message-ID: <169627431148.2377675.4615037566431541097.robh@kernel.org>
References: <20230930145951.23433-1-jacopo.mondi@ideasonboard.com>
 <20230930145951.23433-6-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930145951.23433-6-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Sat, 30 Sep 2023 16:59:49 +0200, Jacopo Mondi wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>

