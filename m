Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB524BCD90
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 11:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243803AbiBTKHH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 05:07:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236388AbiBTKHG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 05:07:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB0936B4D
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 02:06:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE42625B;
        Sun, 20 Feb 2022 11:06:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645351600;
        bh=cuaCCpZ+uDlWEVaoZ8rU9otl6y4kQqf9jzr/WjIeg1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cio6GrxKUBDvSR/pqrzGS5HjlViHNMbcbPywvrV79QZn2NqQo1ZaWzmbwLZ1urbiW
         fBD/9VAE7AWkVfL2KNmhCZSrjqVyjLCOO8WxCwnQtIZm04AxPZzpAhM+DlxMIHTxT5
         qksF9lk0Q4SIuAoD6RDDqykUg2iyuWCAjj2SEkkU=
Date:   Sun, 20 Feb 2022 12:06:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/7] media: imx: Destage imx7-mipi-csis
Message-ID: <YhISpwrs8tdTeqGA@pendragon.ideasonboard.com>
References: <20220218183421.583874-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220218183421.583874-1-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Feb 18, 2022 at 07:34:14PM +0100, Jacopo Mondi wrote:
> Hello
>   this series includes patches from two series previously sent:
> https://lore.kernel.org/linux-media/20220119112024.11339-1-jacopo@jmondi.org/
> https://lore.kernel.org/linux-media/20220211180216.290133-1-jacopo@jmondi.org/
> v1:
> https://lore.kernel.org/linux-media/20220214184318.409208-1-jacopo@jmondi.org/T/#t
> 
> Which can now be marked as superseded.
> 
> The first 2 patches performs the de-staging of the imx7-mipi-csis driver and
> are now reviewed.
> 
> The rest of the series builds on top of the comment received on:
> https://lore.kernel.org/linux-media/20220119112024.11339-3-jacopo@jmondi.org/
> 
> If DUAL pixel mode is used in the CSIS driver, then the CSI block of the IMX8MM
> SoC needs to be operated in dual mode as well. To do so, use the image format
> sample size to determine in the CSI bridge if dual or single mode should be
> used.
> 
> Laurent could you test on MM to see if it works now ?

Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> # On i.MX8MM

with and without the changes I've proposed in the reviews.

Have you tested 3/7 on an i.MX8MQ ?

> On top two small patches I was carrying in my tree to add more formats to the
> CSIS driver, the last one with the caveat that RGB24 is transmitted on the wire
> with one format and stored in memory with a different one.
> 
> Series based on top of the most recent media master branch.
> 
> Thanks
>   j
> 
> v1->v2:
> - Remove per-SoC handling in CSI bridge and only use image formats
> - Add TODO note to the staging driver
> - Fix PIXEL_DUAL mode comments for imx-mipi-csis
> - Add output format translation to imx-mipi-csis to handle RGB24
> 
> Jacopo Mondi (7):
>   media: imx: De-stage imx7-mipi-csis
>   media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
>   media: imx: imx7-media-csi: Use dual sampling for YUV 1X16
>   media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
>   media: imx: imx-mipi-csis: Add RGB565_1X16
>   media: imx: imx-mipi-csis: Add BGR888
>   media: imx: imx-mipi-csis: Add output format
> 
>  Documentation/admin-guide/media/imx7.rst      |  2 +-
>  ...-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} |  2 +-
>  MAINTAINERS                                   |  4 +-
>  drivers/media/platform/Kconfig                |  1 +
>  drivers/media/platform/Makefile               |  1 +
>  drivers/media/platform/imx/Kconfig            | 24 ++++++++
>  drivers/media/platform/imx/Makefile           |  1 +
>  .../platform/imx/imx-mipi-csis.c}             | 59 +++++++++++++++++--
>  drivers/staging/media/imx/Makefile            |  1 -
>  drivers/staging/media/imx/TODO                | 26 ++++++++
>  drivers/staging/media/imx/imx7-media-csi.c    |  8 ++-
>  11 files changed, 117 insertions(+), 12 deletions(-)
>  rename Documentation/devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} (98%)
>  create mode 100644 drivers/media/platform/imx/Kconfig
>  create mode 100644 drivers/media/platform/imx/Makefile
>  rename drivers/{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c} (95%)

-- 
Regards,

Laurent Pinchart
