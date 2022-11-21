Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6899B631CB8
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 10:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiKUJVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 04:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiKUJVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 04:21:05 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5A12A737
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 01:21:05 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="399801636"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="399801636"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="618760848"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="618760848"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 21 Nov 2022 01:21:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ox2z5-00FCFZ-1I;
        Mon, 21 Nov 2022 11:20:59 +0200
Date:   Mon, 21 Nov 2022 11:20:45 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/20] media: atomisp: Misc. cleanups / fixes
Message-ID: <Y3tC7Vme5dpGrO+A@smile.fi.intel.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 20, 2022 at 11:40:41PM +0100, Hans de Goede wrote:
> Hi All,
> 
> Here is another round of atomisp cleanups / fixes + preparation work
> for getting rid of the ugly PCI power-management errors in dmesg
> when doing (runtime)suspend/resume.

As usual, for non-commented (by me) patches:
Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Regards,
> 
> Hans
> 
> 
> Hans de Goede (20):
>   media: atomisp: Silence: 'atomisp_q_one_s3a_buffer: drop one s3a stat
>     which has exp_id xx' log messages
>   media: atomisp: Remove accelerator pipe creation code
>   media: atomisp: Remove unused QOS defines / structure member
>   media: atomisp: Flush queue on atomisp_css_start() error
>   media: atomisp: Log an error on failing to alloc private-mem
>   media: atomisp: Fix deadlock when the /dev/video# node is closed while
>     still streaming
>   media: atomisp: Remove 2 unused accelerator mode related functions
>   media: atomisp: Remove atomisp_css_yuvpp_configure_viewfinder()
>     function
>   media: atomisp: Remove unused ia_css_frame_*() functions
>   media: atomisp: Drop userptr support from hmm
>   media: atomisp: Remove double atomisp_mrfld_power_down()/_up() calls
>     from atomisp_reset()
>   media: atomisp: Remove atomisp_mrfld_power_down()/_up()
>   media: atomisp: Remove clearing of config from atomisp_css_uninit()
>   media: atomisp: Remove atomisp_css_suspend()/_resume()
>   media: atomisp: Remove sw_contex.power_state checks
>   media: atomisp: Remove duplication between runtime-pm and normal-pm
>     code
>   media: atomisp: Move calling of css_[un]init() to power_on()/_off()
>   media: atomisp: Remove atomisp_ospm_dphy_down() call from probe error
>     path
>   media: atomisp: Remove atomisp_ospm_dphy_up()/_down() functions
>   media: atomisp_ov2680: Fix 1280x720 -> 1296x736 resolution
> 
>  drivers/staging/media/atomisp/i2c/ov2680.h    |  46 +-
>  .../staging/media/atomisp/include/hmm/hmm.h   |   1 -
>  .../media/atomisp/include/hmm/hmm_bo.h        |   2 -
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  76 +--
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   8 +-
>  .../media/atomisp/pci/atomisp_compat.h        |  11 -
>  .../media/atomisp/pci/atomisp_compat_css20.c  |  88 +--
>  .../staging/media/atomisp/pci/atomisp_fops.c  |  34 +-
>  .../media/atomisp/pci/atomisp_internal.h      |   1 -
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  80 ++-
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  | 104 +--
>  .../pipe/interface/ia_css_pipe_stagedesc.h    |   5 -
>  .../pci/camera/pipe/src/pipe_stagedesc.c      |  21 -
>  drivers/staging/media/atomisp/pci/hmm/hmm.c   |  19 +-
>  .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  54 +-
>  .../media/atomisp/pci/ia_css_frame_public.h   |  74 ---
>  .../staging/media/atomisp/pci/ia_css_pipe.h   |   3 +-
>  .../media/atomisp/pci/ia_css_pipe_public.h    |  69 --
>  .../pci/runtime/debug/src/ia_css_debug.c      |   7 -
>  .../atomisp/pci/runtime/frame/src/frame.c     | 121 ----
>  .../pipeline/interface/ia_css_pipeline.h      |   2 -
>  .../pci/runtime/pipeline/src/pipeline.c       |   8 -
>  drivers/staging/media/atomisp/pci/sh_css.c    | 608 +-----------------
>  .../media/atomisp/pci/sh_css_internal.h       |  13 -
>  .../staging/media/atomisp/pci/sh_css_legacy.h |   1 -
>  drivers/staging/media/atomisp/pci/sh_css_sp.c |   2 +-
>  26 files changed, 121 insertions(+), 1337 deletions(-)
> 
> -- 
> 2.38.1
> 

-- 
With Best Regards,
Andy Shevchenko


