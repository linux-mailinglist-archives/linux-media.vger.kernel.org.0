Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25A1E5B5988
	for <lists+linux-media@lfdr.de>; Mon, 12 Sep 2022 13:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbiILLo0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Sep 2022 07:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiILLoY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Sep 2022 07:44:24 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DAD3C17F
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 04:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662983064; x=1694519064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bcDDLNrJq3AInwpSlwNryHgxFDqdpupppcC8i2PSe/w=;
  b=JfQXOLgv6gp4tNPvdl+pNF6uovVbqZ04O0K1VM/WXyoKYFa5/cMn8Quo
   V7kLiOl4QvypAUyYMQuFm96e/p8b4Dvc1qJ1BsDVcEoCU3gVwYLBRSXbZ
   8tqISgfRaUPHdUHFhyfBtjdPMwwVP94FmtbYCyO8CQqsCw+LURuoNmt+n
   d/I0yXTXdSx47zCMvoevPd8KqsOH0ZNOpvGmvGCvW988Y7rAzFZcGPlEs
   9aAD4nTiUO+L8WE4nDoLe6V9JQXn4oy6jA4+Q9XYTgcLX3cVxwHpv5JzA
   ng6+O/ghywb67IGmeAWbprC2xwKHUqwY4iuGWU6hQ/dCbad9T09CLkZAB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="361796103"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="361796103"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:44:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="705122047"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:44:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oXhrO-001KVH-04;
        Mon, 12 Sep 2022 14:44:18 +0300
Date:   Mon, 12 Sep 2022 14:44:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/17] media: atomisp: further cleanups / unwanted code
 removal
Message-ID: <Yx8bkW/ntNefoM18@smile.fi.intel.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 11, 2022 at 07:16:36PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is another atomisp patch-series with further cleanups / unwanted code
> removal. Note this mostly cleaning up things which I hit while I'm still
> working towards converting the driver to videobuf2.
> 
> The main goal of this series was to make the atomisp locking more like
> that of other v4l2 drivers, which is acomplished in the
> "media: atomisp: Use video_dev.lock for ioctl locking" patch.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
for non-commented/non-authored-by-me patches.

> Andy Shevchenko (1):
>   media: atomisp_gmin_platform: Unexport and split camera_sensor_csi()
> 
> Hans de Goede (16):
>   media: atomisp: Use a normal mutex for the main lock
>   media: atomisp: Remove unused lock member from struct
>     atomisp_sub_device
>   media: atomisp: Fix locking around asd->streaming read/write
>   media: atomisp: Remove asd == NULL checks from ioctl handling
>   media: atomisp: Add atomisp_pipe_check() helper
>   media: atomisp: Remove watchdog timer
>   media: atomisp: Move atomisp_streaming_count() check into
>     __atomisp_css_recover()
>   media: atomisp: Rework asd->streaming state update in
>     __atomisp_streamoff()
>   media: atomisp: Drop streamoff_mutex
>   media: atomisp: Use video_dev.lock for ioctl locking
>   media: atomisp: Remove a couple of not useful function wrappers
>   media: atomisp: Drop unnecessary first_streamoff check
>   media: atomisp: Make atomisp_set_raw_buffer_bitmap() static
>   media: atomisp: Remove unused atomisp_css_get_dis_statistics()
>   media: atomisp: Remove const/fixed camera_caps
>   media: atomisp: Remove atomisp_source_pad_to_stream_id()
> 
>  .../include/linux/atomisp_gmin_platform.h     |   2 -
>  .../atomisp/include/linux/atomisp_platform.h  |  18 -
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 581 ++----------------
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   9 +-
>  .../media/atomisp/pci/atomisp_compat.h        |   4 -
>  .../media/atomisp/pci/atomisp_compat_css20.c  |  74 +--
>  .../staging/media/atomisp/pci/atomisp_fops.c  |  87 +--
>  .../media/atomisp/pci/atomisp_gmin_platform.c |  86 ++-
>  .../media/atomisp/pci/atomisp_internal.h      |  39 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 567 ++++-------------
>  .../staging/media/atomisp/pci/atomisp_ioctl.h |  10 +-
>  .../media/atomisp/pci/atomisp_subdev.c        |  34 +-
>  .../media/atomisp/pci/atomisp_subdev.h        |  24 +-
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  65 +-
>  14 files changed, 267 insertions(+), 1333 deletions(-)
> 
> -- 
> 2.37.3
> 

-- 
With Best Regards,
Andy Shevchenko


