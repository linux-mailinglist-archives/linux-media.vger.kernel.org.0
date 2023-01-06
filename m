Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B22666006A
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 13:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233100AbjAFMmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 07:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbjAFMlo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 07:41:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF43871894;
        Fri,  6 Jan 2023 04:41:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F3C04AE;
        Fri,  6 Jan 2023 13:41:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673008898;
        bh=vkXTSPeuXqT9CxUuo6IVj8F4RUjesQne2FGBu2zdnP4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RLtO87OOhQ0RN/vC60fnQsz6oqUUXFU8FhgcSFejZxiEhl7pxlWB8eTHFMwD4xRFa
         zwg/a2qHvM9wZxU18n27QNQSk87LvFlw1Oq9HRAH6kpYEOxznYMqUdo0W+Z/bkzG5z
         AKJWvT6B+pHeZfyFuLaV9rFLxKNc9V5jydv1IYN4=
Date:   Fri, 6 Jan 2023 14:41:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] media: imx-pxp: add support for i.MX7D
Message-ID: <Y7gW/FPqt0CBxu/Q@pendragon.ideasonboard.com>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105134729.59542-1-m.tretter@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Thu, Jan 05, 2023 at 02:47:21PM +0100, Michael Tretter wrote:
> This series adds support for the PXP found on the i.MX7D to the imx-pxp
> driver.
> 
> The PXP on the i.MX7D has a few differences compared to the one on the
> i.MX6ULL. Especially, it has more processing blocks and slightly different
> multiplexers to route the data between the blocks. Therefore, the driver must
> configure a different data path depending on the platform.
> 
> While the PXP has a version register, the reported version is the same on the
> i.MX6ULL and the i.MX7D. Therefore, we cannot use the version register to
> change the driver behavior, but have to use the device tree compatible. The
> driver still prints the found version to the log to help bringing up the PXP
> on further platforms.
> 
> The patches are inspired by some earlier patches [0] by Laurent to add PXP
> support to the i.MX7d. Compared to the earlier patches, these patches add
> different behavior depending on the platform. Furthermore, the patches disable
> only the LUT block, but keep the rotator block enabled, as it may now be
> configured via the V4L2 rotate control.

Sounds good to me.

> Patch 1 converts the dt-binding to yaml.
> 
> Patches 2 to 5 cleanup and refactor the driver in preparation of handling
> different PXP versions.
> 
> Patches 6 and 7 add the handling of different platforms and the i.MX7d
> specific configuration.
> 
> Patch 8 adds the device tree node for the PXP to the i.MX7d device tree.

I've reviewed the whole series and comments are mostly minor. As you're
reminding me of the PXP, I'll take this as an opportunity to post
patches that I've had in my tree for way too long :-) There will be
minor conflicts with yours, so I'll first rebase them on this series,
assuming that v2 will be similar in places where conflicts occur.

> Michael
> 
> [0] https://lore.kernel.org/linux-media/20200510223100.11641-1-laurent.pinchart@ideasonboard.com/
> 
> Michael Tretter (8):
>   media: dt-bindings: media: fsl-pxp: convert to yaml
>   media: imx-pxp: detect PXP version
>   media: imx-pxp: extract helper function to setup data path
>   media: imx-pxp: explicitly disable unused blocks
>   media: imx-pxp: disable LUT block
>   media: imx-pxp: make data_path_ctrl0 platform dependent
>   media: imx-pxp: add support for i.MX7D
>   ARM: dts: imx7d: add node for PXP
> 
>  .../bindings/media/fsl,imx6ull-pxp.yaml       |  62 ++++++++
>  .../devicetree/bindings/media/fsl-pxp.txt     |  26 ---
>  arch/arm/boot/dts/imx7d.dtsi                  |   9 ++
>  drivers/media/platform/nxp/imx-pxp.c          | 148 +++++++++++++++---
>  4 files changed, 197 insertions(+), 48 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/fsl-pxp.txt

-- 
Regards,

Laurent Pinchart
