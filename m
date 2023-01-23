Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2828F677DB3
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 15:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbjAWOMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 09:12:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbjAWOMc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 09:12:32 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9814B15CBD
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 06:12:29 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="305705699"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="305705699"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:12:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="725054091"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="725054091"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jan 2023 06:12:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pJxYd-00DlvG-2e;
        Mon, 23 Jan 2023 16:12:23 +0200
Date:   Mon, 23 Jan 2023 16:12:23 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 01/57] media: atomisp: fix videobuf2 Kconfig depenendency
Message-ID: <Y86Vx4TcdPEYeU9k@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:09PM +0100, Hans de Goede wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The recent conversion missed the Kconfig bit, so it can now
> end up in a link error on randconfig builds:
> 
> ld.lld: error: undefined symbol: vb2_vmalloc_memops
> >>> referenced by atomisp_fops.c
> >>>               drivers/staging/media/atomisp/pci/atomisp_fops.o:(atomisp_open) in archive vmlinux.a

IIRC I have given my Tb tag [1]...

For your convenience (but please, gather them next time)
Tested-by: Andy Shevchenko <andy@kernel.org>

[1]: https://lore.kernel.org/linux-media/Y7Vf6nejMFXs%2FqAk@smile.fi.intel.com/

> Fixes: cb48ae89be3b ("media: atomisp: Convert to videobuf2")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/r/20230104082212.3770415-1-arnd@kernel.org
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
> index 2c8d7fdcc5f7..c9bff98e5309 100644
> --- a/drivers/staging/media/atomisp/Kconfig
> +++ b/drivers/staging/media/atomisp/Kconfig
> @@ -14,7 +14,7 @@ config VIDEO_ATOMISP
>  	depends on VIDEO_DEV && INTEL_ATOMISP
>  	depends on PMIC_OPREGION
>  	select IOSF_MBI
> -	select VIDEOBUF_VMALLOC
> +	select VIDEOBUF2_VMALLOC
>  	select VIDEO_V4L2_SUBDEV_API
>  	help
>  	  Say Y here if your platform supports Intel Atom SoC
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


