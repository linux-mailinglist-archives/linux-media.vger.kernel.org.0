Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964254D62B8
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 15:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349022AbiCKOBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 09:01:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349007AbiCKOB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 09:01:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8DC1C57C9
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 06:00:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC11A482;
        Fri, 11 Mar 2022 15:00:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647007224;
        bh=DNP5WkPzf9ctAkl/S0U65AaluH1KeuTQHnFdaHarx9U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=siV5A828B9QndV6q1SBn+ZyXyHq1LTb0ZOGqPvSKGV0TJ8fMhKS8q7GfnyydgcnYE
         ITsPVaJR9oQIhOGPjdh4cmVy4ram/9IqRUtKXG3vhFpk386jFav/UCosDPEh+BY56V
         R8bCV9PASrbvxXhGAeymShbuqfKLYS46sBRjF3ys=
Date:   Fri, 11 Mar 2022 16:00:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 0/4] media: imx: imx-mipi-csis: Simplify PM support
Message-ID: <YitV5yGJctQdIB64@pendragon.ideasonboard.com>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 11, 2022 at 03:55:31PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series results from work on suspend/resume support in
> the (in progress) ISI driver. It drops unneeded code in the
> imx-mipi-csis related to system suspend/resume, allowing a
> simplification of the runtime PM handlers.

I forgot to include a prerequisite in the series, renaming csi_state to
mipi_csis_device. The series will thus not apply. I'll post that patch
shortly, but as it's just a rename, this series should still be
reviewable separately.

> Laurent Pinchart (4):
>   media: imx: imx-mipi-csis: Don't use .s_power()
>   media: imx: imx-mipi-csis: Drop unneeded system PM implementation
>   media: imx: imx-mipi-csis: Don't stop streaming at runtime suspend
>     time
>   media: imx: imx-mipi-csis: Simplify runtime PM implementation
> 
>  drivers/media/platform/imx/imx-mipi-csis.c | 138 +++++++--------------
>  1 file changed, 44 insertions(+), 94 deletions(-)

-- 
Regards,

Laurent Pinchart
