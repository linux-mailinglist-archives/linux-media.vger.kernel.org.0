Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837CF3A6CC1
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 19:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbhFNRKX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 13:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbhFNRKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 13:10:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA08C061574;
        Mon, 14 Jun 2021 10:08:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCA0A436;
        Mon, 14 Jun 2021 19:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623690499;
        bh=Y62fPdVrSYoDiDWZVQlRpOQy23UZWZkKTNtRurbrjNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ip2dd0BFn4k0uceKwk6AsRoJ7m6ppXHgN6HDXUl+580Z532sCO4imhCFiJjv8Vzhb
         H2EBMFMZAb2y8lk3rtgT4uySV6sfr/1FAwNQh7lv2OaRGQ6p2YzWA9cFg+jN6AgIc4
         kAie756Ck4NyPzkIHyT6Q6weFlqzrSrL7o36Pj+Q=
Date:   Mon, 14 Jun 2021 20:07:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 6/8] media: atomisp: remove compat_ioctl32 code
Message-ID: <YMeM73cHgomYQNcs@pendragon.ideasonboard.com>
References: <20210614103409.3154127-1-arnd@kernel.org>
 <20210614103409.3154127-7-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614103409.3154127-7-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thank you for the patch.

On Mon, Jun 14, 2021 at 12:34:07PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is one of the last remaining users of compat_alloc_user_space()
> and copy_in_user(), which are in the process of getting removed.
> 
> As of commit 57e6b6f2303e ("media: atomisp_fops.c: disable
> atomisp_compat_ioctl32"), nothing in this file is actually getting used
> as the only reference has been stubbed out.
> 
> Remove the entire file -- anyone willing to restore the functionality
> can equally well just look up the contents in the git history if needed.
> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/atomisp/Makefile        |    1 -
>  drivers/staging/media/atomisp/TODO            |    5 +
>  .../atomisp/pci/atomisp_compat_ioctl32.c      | 1202 -----------------
>  .../staging/media/atomisp/pci/atomisp_fops.c  |    8 +-
>  4 files changed, 8 insertions(+), 1208 deletions(-)
>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
> 
> diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
> index 51498b2e85b8..606b7754fdfd 100644
> --- a/drivers/staging/media/atomisp/Makefile
> +++ b/drivers/staging/media/atomisp/Makefile
> @@ -16,7 +16,6 @@ atomisp-objs += \
>  	pci/atomisp_acc.o \
>  	pci/atomisp_cmd.o \
>  	pci/atomisp_compat_css20.o \
> -	pci/atomisp_compat_ioctl32.o \
>  	pci/atomisp_csi2.o \
>  	pci/atomisp_drvfs.o \
>  	pci/atomisp_file.o \
> diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
> index 6987bb2d32cf..2d1ef9eb262a 100644
> --- a/drivers/staging/media/atomisp/TODO
> +++ b/drivers/staging/media/atomisp/TODO
> @@ -120,6 +120,11 @@ TODO
>      for this driver until the other work is done, as there will be a lot
>      of code churn until this driver becomes functional again.
>  
> +16. Fix private ioctls to not need a compat_ioctl handler for running
> +    32-bit tasks. The compat code has been removed because of bugs,
> +    and should not be needed for modern drivers. Fixing this properly
> +    unfortunately means an incompatible ABI change.
> +
>  Limitations
>  ===========
>  

[snip]

> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index 26d05474a035..be58f21ab208 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -1283,7 +1283,8 @@ const struct v4l2_file_operations atomisp_fops = {
>  	.unlocked_ioctl = video_ioctl2,
>  #ifdef CONFIG_COMPAT
>  	/*
> -	 * There are problems with this code. Disable this for now.
> +	 * this was removed because of bugs, the interface
> +	 * needs to be made safe for compat tasks instead.
>  	.compat_ioctl32 = atomisp_compat_ioctl32,
>  	 */
>  #endif
> @@ -1297,10 +1298,7 @@ const struct v4l2_file_operations atomisp_file_fops = {
>  	.mmap = atomisp_file_mmap,
>  	.unlocked_ioctl = video_ioctl2,
>  #ifdef CONFIG_COMPAT
> -	/*
> -	 * There are problems with this code. Disable this for now.
> -	.compat_ioctl32 = atomisp_compat_ioctl32,
> -	 */
> +	/* .compat_ioctl32 = atomisp_compat_ioctl32, */
>  #endif
>  	.poll = atomisp_poll,
>  };

-- 
Regards,

Laurent Pinchart
