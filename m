Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675C27BBD57
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 18:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbjJFQzs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 12:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjJFQzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 12:55:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3CDAD
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 09:55:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F96C433C7;
        Fri,  6 Oct 2023 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696611344;
        bh=rDfmF7AdipwmWvQbtxanfQLHtkHemqVv1va7cCaAG1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nJ4edeIyoIa8vlx8aetIP5GsI2aOX+yqCPkGTBml4VQYdl+IcbLpEZdswaVpmn9Pk
         FrJqyLA+f+klcFfGc2Yfbwg6JrO8y/1/L+FVZKJ49fnYIfq4mIPgQldO92DP0FX9wS
         ZuNwzuTEwjo5mEbyEo8OlOwTxvbtyvOcxHQ+lPf/l26dnLBJbmZ61BpERjHrLdMT1B
         flbIhqgzH2cPLZfvuoDIhRawh14r4CRSCSmbWMkw6j25dWm6NegIiFBP8XZOT0sGxf
         qJ4NiX5GtAE1VjFiWcaf27RMEU/nXSQjBkbDp8Bi7K7n7nHwKGVVtysF2LN+2CErzd
         bXcCiEzSzjiCA==
Received: (nullmailer pid 4065867 invoked by uid 1000);
        Fri, 06 Oct 2023 16:55:41 -0000
Date:   Fri, 6 Oct 2023 11:55:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     robh+dt@kernel.org, rmfrfs@gmail.com, marex@denx.de,
        Fabio Estevam <festevam@denx.de>, martink@posteo.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] media: dt-bindings: imx7-csi: Make power-domains not
 required for imx8mq
Message-ID: <169661133841.4065755.10008060737440302024.robh@kernel.org>
References: <20231004201105.2323758-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004201105.2323758-1-festevam@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Wed, 04 Oct 2023 17:11:05 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On i.MX8MQ the MIPI CSI block does have an associated power-domain, but
> the CSI bridge does not.
> 
> Remove the power-domains requirement from the i.MX8MQ CSI bridge
> to fix the following schema warning:
> 
> imx8mq-librem5-r4.dtb: csi@30a90000: 'power-domains' is a required property
> from schema $id: http://devicetree.org/schemas/media/nxp,imx7-csi.yaml#
> 
> Fixes: de655386845a ("media: dt-bindings: media: imx7-csi: Document i.MX8M power-domains property")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> 
>  Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!

