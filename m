Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8DB59CDAC
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 03:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbiHWBLu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 21:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233976AbiHWBLt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 21:11:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EC657E22
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 18:11:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFF5B2B3;
        Tue, 23 Aug 2022 03:11:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661217107;
        bh=PO6drdQTffjFQahAqOr+SlMXWIPGN7WT6FMNfXb5YhA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nPi8HI4o28EdM37u/KYc+heECduFqIBzTnt7bLq/6liR16G1d4AYfNaAclesZHRTy
         N+sqfihuMKmeZZtulY1eq2iSDZ+1NADRiF9gcfwcaNGH813sbDGaqX0JhW7U17pyRS
         D4N4XgNST2fX16W5EI3XZlMySo1tbzIMGp7/0Fio=
Date:   Tue, 23 Aug 2022 04:11:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 00/19] media: i2c: imx290: Miscellaneous improvements
Message-ID: <YwQpT5JpyfXBEIVE@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Could you already pick up patches 01/19, 02/19, 04/19, 05/19 and 06/19
in your tree ? Your opinion on 03/19 woud be appreciated too, I think
it's a candidate for merge as well.

On Thu, Jul 21, 2022 at 11:35:21AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series gathers miscellaneous improvements for the imx290
> driver. The most notable changes on the kernel side is patch 07/19 that
> simplifies register access, and on the userspace API side patches 14/19,
> 15/19 and 18/19 that extend the driver with controls and selection
> rectangles required by libcamera.
> 
> Laurent Pinchart (19):
>   media: i2c: imx290: Use device lock for the control handler
>   media: i2c: imx290: Print error code when I2C transfer fails
>   media: i2c: imx290: Specify HMAX values in decimal
>   media: i2c: imx290: Replace macro with explicit ARRAY_SIZE()
>   media: i2c: imx290: Drop imx290_write_buffered_reg()
>   media: i2c: imx290: Drop regmap cache
>   media: i2c: imx290: Support variable-sized registers
>   media: i2c: imx290: Correct register sizes
>   media: i2c: imx290: Simplify error handling when writing registers
>   media: i2c: imx290: Define more register macros
>   media: i2c: imx290: Add exposure time control
>   media: i2c: imx290: Fix max gain value
>   media: i2c: imx290: Split control initialization to separate function
>   media: i2c: imx290: Implement HBLANK and VBLANK controls
>   media: i2c: imx290: Create controls for fwnode properties
>   media: i2c: imx290: Move registers with fixed value to init array
>   media: i2c: imx290: Factor out format retrieval to separate function
>   media: i2c: imx290: Add crop selection targets support
>   media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN
> 
>  drivers/media/i2c/imx290.c | 781 ++++++++++++++++++++++---------------
>  1 file changed, 458 insertions(+), 323 deletions(-)

-- 
Regards,

Laurent Pinchart
