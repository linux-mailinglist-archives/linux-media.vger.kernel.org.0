Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3C216E5CBF
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 11:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbjDRJC4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 05:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjDRJCz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 05:02:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22CE84ED0;
        Tue, 18 Apr 2023 02:02:54 -0700 (PDT)
Received: from pyrite.rasen.tech (h175-177-042-159.catv02.itscom.jp [175.177.42.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F44A127D;
        Tue, 18 Apr 2023 11:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681808566;
        bh=6XWvzTE5nrggv8nFTe4CodUd+AEIYAkCax2x4Hp1vvM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oh021YSTb8gWXKvflxHqY8C2HAY0f4cyCU2E2DNppxengCjtD0RKM2aOg0GIDyLWw
         AQvgkw9AOdnej1Ka8BzzLHjywJ2oWPRxDhjp+wBAg7GeIhsxhoWVH7/Y2YEtl/l2s3
         N30OItRNB87CQhVP2j10gbhvpQVRh57p3Snhkn4M=
Date:   Tue, 18 Apr 2023 18:02:43 +0900
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH v1 0/2] arm64: dts: imx8mp: Enable CSIS and ISI in DT
Message-ID: <ZD5cs2ZFh6ZRQFNU@pyrite.rasen.tech>
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 17, 2023 at 08:56:25AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series adds the CSIS and ISI devices in the i.MX8MP DT
> to support cameras. The ISI DT bindings have just been merged and will
> appear in v6.4, making this series a candidate for v6.5.
> 
> With these two patches, a board overlay can enable camera support by
> instantiating the camera sensor, connecting it to a CSIS instance, and
> enabling the CSIS and ISI nodes. The camera pipeline is supported by
> V4L2 drivers.
> 
> Laurent Pinchart (2):
>   arm64: dts: imx8mp: Add CSIS DT nodes
>   arm64: dts: imx8mp: Add ISI DT node

For both,

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> 
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 98 +++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> 
> base-commit: 20af6be6bee4c3af80aac9b44b3d32d89824dde7
