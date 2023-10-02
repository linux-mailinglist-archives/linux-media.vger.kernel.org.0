Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE797B5B22
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 21:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjJBTRl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 15:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjJBTRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 15:17:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02538B8
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 12:17:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B07FC433C7;
        Mon,  2 Oct 2023 19:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696274258;
        bh=+63Rw5ZdMVmK8XMxGckqGTRn8bLDHXHHREH3j4Dzd0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jhSNUo+IPnkNUfZgFKvsvrY0v5rpyigik4nkLGCIEs1v7RKgV6V0uQzFEBF4iGGbo
         YOfukb/YjbLz8zYCIgs2USoohPjsPagdw7t/bRb/kkWkgmdfOzZ3VvnEPTeU2i+epE
         2kfixYDlObfs+Pcd1KpTihe7MPVK3sBwl6uU26+cRdT5Q/3cfXQxuRnAu6iwdzJyHG
         nKW8Yqm17jf0HLCN2BaZIbp7+wYylJ1eglKdWoFBoCdq9WNW9JCogXAEU3fvgNvuOK
         sYjBuzXLyYl471KK/scx8wETL8wH9w2VItZwsAK4s8yFqavQTh2dTDw3d61edFjh7l
         0TqC7kkvgN8bQ==
Received: (nullmailer pid 2376314 invoked by uid 1000);
        Mon, 02 Oct 2023 19:17:35 -0000
Date:   Mon, 2 Oct 2023 14:17:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, martink@posteo.de,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 1/7] media: dt-bindings: hynix,hi846: Add
 video-interface-device properties
Message-ID: <169627425412.2376248.16081570796890214410.robh@kernel.org>
References: <20230930145951.23433-1-jacopo.mondi@ideasonboard.com>
 <20230930145951.23433-2-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930145951.23433-2-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Sat, 30 Sep 2023 16:59:45 +0200, Jacopo Mondi wrote:
> Allow properties from video-interface-device.yaml for the SK Hynix Hi-846
> sensor.
> 
> All properties specified in video-interface-device.yaml schema are
> valid, so make them accepted by changing "additionalProperties: false"
> to "unevaluatedProperties: false" at the schema top-level.
> 
> Add two properties from video-interface-device.yaml to the example
> to validate the new schema.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/i2c/hynix,hi846.yaml         | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

