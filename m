Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389DD7B5B1A
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 21:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238733AbjJBTSp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 15:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjJBTSo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 15:18:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C00AC
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 12:18:41 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CB4C433C8;
        Mon,  2 Oct 2023 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696274321;
        bh=j6ftsCnR5Nn5juRFFdpP16VBXV3veFIXFnvTTKBoMuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uQIqByqIFEex+U8gKkFEwu7i0cTZoT8e4ngmXfSh3kEyUn4myjbaJo2mz2l4USlez
         gJPc9UBKW/oeP8E4wmxD6mmhYujmiPTnaiCKyFcN5f/kXempc6Guz3fuLGEcoAs97/
         nJmRuCjz78qNqid9yU1LpXLOf11yYhs76Tjw57oU5kLy2but+IFbFNReyCwH/bh62X
         MUQc+9UTusIrsNQ3SA7pewW1XcG8GCmdYlb9KwivADd0dZ0tr95tXqawalRwcy44qA
         +7/ijy4T4cWpMS1a+t0KWq2y8sfPWRP92Mv4W0r1/PZEWrVW1ZJkWh2T1sV6evBs6Z
         6rjUZHZezKjoA==
Received: (nullmailer pid 2377967 invoked by uid 1000);
        Mon, 02 Oct 2023 19:18:39 -0000
Date:   Mon, 2 Oct 2023 14:18:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>, martink@posteo.de,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 6/7] media: dt-bindings: sony,imx214: Fix handling of
 video-interface-device
Message-ID: <169627431850.2377918.14018705676565812353.robh@kernel.org>
References: <20230930145951.23433-1-jacopo.mondi@ideasonboard.com>
 <20230930145951.23433-7-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930145951.23433-7-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Sat, 30 Sep 2023 16:59:50 +0200, Jacopo Mondi wrote:
> Fix handling of properties from video-interface-device.yaml for
> Sony IMX214.
> 
> All the properties described by video-interface-device.yaml are
> allowed for the image sensor, make them accepted by changing
> "additionalProperties: false" to "unevaluatedProperties: false" at the
> schema top-level.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

