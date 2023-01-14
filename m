Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45DCD66AE31
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 22:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbjANV3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 16:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjANV3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 16:29:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A767ABE;
        Sat, 14 Jan 2023 13:29:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C17FE4D4;
        Sat, 14 Jan 2023 22:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673731774;
        bh=8YockS1a/nL6zZeUd8QgQofn11d6xLguAesidUhrRqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SzNC+0QFERQZ9Al7qreW7CaemBjFs9+oJHRu3MSujJgQvSKXZYFpiAjo8N0aIbSR0
         avxQCSWkV80c7Lce6csMUu8jUqT3elDZTMWnvTBTbKKUCCgYD9qYX02eRZmtEBQAl+
         z1QyonD7r01gveaNak9sTnC3ytWll9N8iqYeKwiU=
Date:   Sat, 14 Jan 2023 23:29:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 00/16] media: imx-pxp: add support for i.MX7D
Message-ID: <Y8Mevsi92DreZIBB@pendragon.ideasonboard.com>
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

The whole series has been reviewed, and only the DT bindings need a
small change. If you post a v2.1 of just that patch (--in-reply-to v2
and CC me, or I may not notice quickly), I can take the whole series and
get it merged in v6.3.

On Fri, Jan 13, 2023 at 10:54:07AM +0100, Michael Tretter wrote:
> This is v2 of the series to add support for the PXP found on the i.MX7D to the
> imx-pxp driver.
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
> 
> In v2, I included Laurent's patch series [1], which was based on this series
> anyway and added regmap support.
> 
> Patch 1 converts the dt-binding to yaml.
> 
> Patches 2 to 5 cleanup and refactor the driver in preparation of handling
> different PXP versions.
> 
> Patches 6 and 7 add the handling of different platforms and the i.MX7d
> specific configuration.
> 
> Patch 8 adds the device tree node for the PXP to the i.MX7d device tree.
> 
> Patches 9 to 15 are the cleanup and enhancement patches to add media
> controller support, implement enum_framesizes, and add pxp_read/pxp_write
> helpers.
> 
> Patch 16 adds regmap support to the driver.
> 
> Michael
> 
> [0] https://lore.kernel.org/linux-media/20200510223100.11641-1-laurent.pinchart@ideasonboard.com/
> [1] https://lore.kernel.org/linux-media/20230112172507.30579-1-laurent.pinchart@ideasonboard.com
> 
> ---
> 
> Changelog
> 
> v2:
> 
> - fix device tree binding
> - reduce log level of PXP version to debug
> - drop fallback for missing pdata
> - add cleanup and enhancement patches to series
> - convert driver to regmap
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> To: linux-media@vger.kernel.org
> To: devicetree@vger.kernel.org
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: kernel@pengutronix.de
> Cc: linux-imx@nxp.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Michael Tretter <m.tretter@pengutronix.de>
> 
> ---
> Laurent Pinchart (7):
>       media: imx-pxp: Sort headers alphabetically
>       media: imx-pxp: Don't set bus_info manually in .querycap()
>       media: imx-pxp: Add media controller support
>       media: imx-pxp: Pass pixel format value to find_format()
>       media: imx-pxp: Implement frame size enumeration
>       media: imx-pxp: Introduce pxp_read() and pxp_write() wrappers
>       media: imx-pxp: Use non-threaded IRQ
> 
> Michael Tretter (9):
>       dt-bindings: media: fsl-pxp: convert to yaml
>       media: imx-pxp: detect PXP version
>       media: imx-pxp: extract helper function to setup data path
>       media: imx-pxp: explicitly disable unused blocks
>       media: imx-pxp: disable LUT block
>       media: imx-pxp: make data_path_ctrl0 platform dependent
>       media: imx-pxp: add support for i.MX7D
>       ARM: dts: imx7d: add node for PXP
>       media: imx-pxp: convert to regmap
> 
>  .../devicetree/bindings/media/fsl,imx6ull-pxp.yaml |  82 +++++
>  .../devicetree/bindings/media/fsl-pxp.txt          |  26 --
>  arch/arm/boot/dts/imx7d.dtsi                       |   9 +
>  drivers/media/platform/nxp/imx-pxp.c               | 359 +++++++++++++++------
>  4 files changed, 355 insertions(+), 121 deletions(-)
> ---
> base-commit: b7bfaa761d760e72a969d116517eaa12e404c262
> change-id: 20230112-imx-pxp-073008b3c857

-- 
Regards,

Laurent Pinchart
