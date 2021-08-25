Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F453F6CC2
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 02:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236596AbhHYAxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 20:53:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45912 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbhHYAxN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 20:53:13 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16DF924F;
        Wed, 25 Aug 2021 02:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629852747;
        bh=JSX+eIc5qupFysL0niEfUn0bVolKk25/tqbDq21qDC8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XJwA3TbwGuTcQ8wpT8x+qefdiCudHy7/ygQFFieciR6uEo5qL6AnlSC7TrxIK5xPr
         Hs/J9c45REr3P9IQMlxM0+8E0o0zQYCC7Up8qAw6w6CoDj0e7zIipoDDsvaMifFa45
         54OtTUUxrlLuwr6yFF6G2od1UBsuR8V7hj9VMLeU=
Date:   Wed, 25 Aug 2021 03:52:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: Request API is no longer experimental
Message-ID: <YSWUQJfbucB5jQga@pendragon.ideasonboard.com>
References: <20210825002337.6561-1-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210825002337.6561-1-ezequiel@vanguardiasur.com.ar>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thank you for the patch.

On Tue, Aug 24, 2021 at 09:23:37PM -0300, Ezequiel Garcia wrote:
> The Request API is currently used and specified as part of the
> Memory-to-memory Stateless Video Decoder Interface [1].
> 
> This can now be considered as non-experimental and stable, given
> the decoder API has been used by products since a couple years,
> supported by several drivers and userspace frameworks,

This effectively aligns the kernel with the de facto situation, so

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> [1] Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/media/mc/Kconfig | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
> index 4815b9dde9af..375b09612981 100644
> --- a/drivers/media/mc/Kconfig
> +++ b/drivers/media/mc/Kconfig
> @@ -16,13 +16,5 @@ config MEDIA_CONTROLLER_REQUEST_API
>  	bool
>  	depends on MEDIA_CONTROLLER
>  	help
> -	  DO NOT ENABLE THIS OPTION UNLESS YOU KNOW WHAT YOU'RE DOING.
> -
>  	  This option enables the Request API for the Media controller and V4L2
>  	  interfaces. It is currently needed by a few stateless codec drivers.
> -
> -	  There is currently no intention to provide API or ABI stability for
> -	  this new API as of yet.
> -
> -comment "Please notice that the enabled Media controller Request API is EXPERIMENTAL"
> -	depends on MEDIA_CONTROLLER_REQUEST_API

-- 
Regards,

Laurent Pinchart
