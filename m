Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8BB37B5B1C
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 21:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbjJBTS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 15:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjJBTS2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 15:18:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29ACDAC
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 12:18:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EACC433C9;
        Mon,  2 Oct 2023 19:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696274305;
        bh=QJNNsE5w6lrikruWK8pGPErgOG373fXozuMyrEQpHZE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mblJCGX64AehNcf19Q+qjxW2CdCIieG3By/12G5IKzrBKDYVWUw0D/pFoSjAN79zE
         QNNrEoL/iyu3tWnYqboRxF0S8t0oPRWCTrgqS1zCaTyoOWjTNrWwuxbBNpcqcpwUWN
         7BIqNtn42FSvNEBmc9uEtfo9hXptGSAHDgFW32Y19MWoEwKSbZvhz8Iy2awW9poi+x
         SMUVuZ2Pf8bT9xvpegP7RbbvX2r4Zbm4k5VE4Tiq5KLNazQt4bRfMdzpYIVghVHaG7
         luyCns466SpK5sTTjQrKR6SV6H+xcNPJlsh9lrUqU8QhyKJeopEJ4eqZ9KB/Tbes3I
         BjB0INJQabgkw==
Received: (nullmailer pid 2377443 invoked by uid 1000);
        Mon, 02 Oct 2023 19:18:23 -0000
Date:   Mon, 2 Oct 2023 14:18:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>, martink@posteo.de,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 4/7] media: dt-bindings: ovti,ov4689: Fix handling of
 video-interface-device
Message-ID: <169627430335.2377387.10312964861522055044.robh@kernel.org>
References: <20230930145951.23433-1-jacopo.mondi@ideasonboard.com>
 <20230930145951.23433-5-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930145951.23433-5-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Sat, 30 Sep 2023 16:59:48 +0200, Jacopo Mondi wrote:
> Fix handling of properties from video-interface-device.yaml for
> Omnivision OV4689.
> 
> All the properties described by video-interface-device.yaml are
> allowed for the image sensor, make them accepted by changing
> "additionalProperties: false" to "unevaluatedProperties: false" at the
> schema top-level.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/i2c/ovti,ov4689.yaml          | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

