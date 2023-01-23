Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4A9D67837D
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 18:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjAWRmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 12:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbjAWRmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 12:42:14 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779602E0FB
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 09:42:08 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="313997889"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="313997889"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 09:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="692308167"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="692308167"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2023 09:42:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK0pX-00Dr8K-0m;
        Mon, 23 Jan 2023 19:42:03 +0200
Date:   Mon, 23 Jan 2023 19:42:02 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 17/57] media: atomisp: Only set default_run_mode on first
 open of a stream/asd
Message-ID: <Y87G6jFRCy2dzrbg@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-18-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-18-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:25PM +0100, Hans de Goede wrote:
> Calling v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode) when
> the stream is already active (through another /dev/video# node) causes
> the stream to stop.
> 
> Move the call to set the default run-mode so that it is only done
> on the first open of one of the 4 /dev/video# nodes of one of
> the 2 streams (atomisp-sub-devices / asd-s).

As mentioned before, perhaps move it closer to the beginning of the series?

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Fixes: 2c45e343c581 ("media: atomisp: set per-device's default mode")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_fops.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index 7f4934ff9cab..78af97a64362 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -764,13 +764,13 @@ static int atomisp_open(struct file *file)
>  		goto done;
>  
>  	atomisp_subdev_init_struct(asd);

+ Blank line?

> +	/* Ensure that a mode is set */
> +	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
>  
>  done:
>  	pipe->users++;
>  	mutex_unlock(&isp->mutex);
>  
> -	/* Ensure that a mode is set */
> -	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
>  
>  	return 0;
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


