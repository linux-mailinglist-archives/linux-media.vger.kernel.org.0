Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C20D573C41
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 19:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236346AbiGMRyq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 13:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236207AbiGMRyp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 13:54:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CCB20F75
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 10:54:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38737305;
        Wed, 13 Jul 2022 19:54:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657734882;
        bh=zxVrqLUKS24u6sP2eBvltdwMUp/zelWaWY3W8+EuksE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L8hHlSFH2zuqNXh43Grm6nTNu9fNIRsPD38RiCnthDF7GWorNResQiZ3m+RaQ6NIE
         vKrc8WqwPQCmOJTnuMhh3WinOypTRzR60WdHAQDczzb2D5vayoamnpHLGpm7Nrtn2D
         6o+hn9gjTCSOjFLTtbppxK10fqYM0peVHNW+tjGo=
Date:   Wed, 13 Jul 2022 20:54:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] v4l: Kconfig: Drop subdev API option help text
Message-ID: <Ys8GxF91rx32ZRAX@pendragon.ideasonboard.com>
References: <20220713173920.222394-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220713173920.222394-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Jul 13, 2022 at 08:39:20PM +0300, Sakari Ailus wrote:
> The config option text was recently removed, also remove the help text.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/Kconfig | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> index 348559bc24689..60b0c6ee7343a 100644
> --- a/drivers/media/v4l2-core/Kconfig
> +++ b/drivers/media/v4l2-core/Kconfig
> @@ -11,11 +11,6 @@ config VIDEO_V4L2_I2C
>  config VIDEO_V4L2_SUBDEV_API
>  	bool
>  	depends on VIDEO_DEV && MEDIA_CONTROLLER
> -	help
> -	  Enables the V4L2 sub-device pad-level userspace API used to configure
> -	  video format, size and frame rate between hardware blocks.
> -
> -	  This API is mostly used by camera interfaces in embedded platforms.
>  
>  config VIDEO_ADV_DEBUG
>  	bool "Enable advanced debug functionality on V4L2 drivers"

-- 
Regards,

Laurent Pinchart
