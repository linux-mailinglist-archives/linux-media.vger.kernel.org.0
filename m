Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3753651E25C
	for <lists+linux-media@lfdr.de>; Sat,  7 May 2022 01:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444809AbiEFWlW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 May 2022 18:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356030AbiEFWlV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 May 2022 18:41:21 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AAD496BF
        for <linux-media@vger.kernel.org>; Fri,  6 May 2022 15:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651876657; x=1683412657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lQNZN4N3b2jxbyeShTGvYm5NjQHUiej3OTe69a2HIpc=;
  b=WTpUVrw3/bJBwj6M0KpLAdc4tJ3TO9GsYy3ilvnWUV58BvefN/+YeiPQ
   exH3Vv7Hkq7EkpaabQPAML32KN2fKAfe1iuM5LtjKL+Zdd/RQ8y8pX2zB
   FjIx3Dt0XsDTLEkq4pVrf/Wdj/FR8mLFZVcmW612MVn+zojx1Ip0/8Wu6
   Mb3uUS0pEzwdBDl6Yyzxj3mpXItX39HcJao++N7CEfsotcKHObhg1g6wu
   zd/2ETGlUgFaabeib37pucrEE15Z9NoVtCchAZ2oPWp4tpwhWVvMDTExL
   LiOuFXRCjsTjYkmvvpeOYn0ubW24JN4WABpbQGWmUZ+uHkH/t8FbnqZOg
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="267432151"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="267432151"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 15:37:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="812586220"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 15:37:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nn6Zo-00Cqmx-Ir;
        Sat, 07 May 2022 01:37:32 +0300
Date:   Sat, 7 May 2022 01:37:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v4 00/15] Support OVTI7251 on Microsoft Surface line
Message-ID: <YnWjLFYECEmhLwjG@smile.fi.intel.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 06, 2022 at 12:03:47AM +0100, Daniel Scally wrote:
> Hello all
> 
> This series extends the OV7251 driver so it's functional on the
> Microsoft Surface line of laptops, where it's used as the IR
> camera for face login. The camera sensor is connected to a CIO2
> device which packs the 10-bit greyscale data into 25 pixels per 32
> bytes similar to the IPU3 formats for Bayer data, so I also added
> a new format to describe that and added it to the ipu3-cio2 driver's
> list of supported formats. 

Good to me
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

AFAIU the __be16 and related stuff you are planning to update later on,
correct?

> Series-level changes:
> 
> 	- None
> 
> Thanks
> Dan
> Daniel Scally (15):
>   media: uapi: Add IPU3 packed Y10 format
>   media: ipu3-cio2: Add support for V4L2_PIX_FMT_IPU3_Y10
>   media: i2c: Add acpi support to ov7251
>   media: i2c: Provide ov7251_check_hwcfg()
>   media: i2c: Remove per-mode frequencies from ov7251
>   media: i2c: Add ov7251_pll_configure()
>   media: i2c: Add support for new frequencies to ov7251
>   media: i2c: Add ov7251_detect_chip()
>   media: i2c: Add pm_runtime support to ov7251
>   media: i2c: Remove .s_power() from ov7251
>   media: ipu3-cio2: Add INT347E to cio2-bridge
>   media: i2c: Extend .get_selection() for ov7251
>   media: i2c: add ov7251_init_ctrls()
>   media: i2c: Add hblank control to ov7251
>   media: i2c: Add vblank control to ov7251 driver
> 
>  .../media/v4l/pixfmt-yuv-luma.rst             |  14 +-
>  drivers/media/i2c/ov7251.c                    | 749 +++++++++++++-----
>  drivers/media/pci/intel/ipu3/cio2-bridge.c    |   2 +
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   5 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/uapi/linux/videodev2.h                |   3 +-
>  6 files changed, 553 insertions(+), 221 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


