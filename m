Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF44678398
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 18:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbjAWRt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 12:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbjAWRt2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 12:49:28 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695D212078
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 09:49:27 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309678859"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="309678859"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 09:49:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="661802412"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="661802412"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 23 Jan 2023 09:49:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK0wU-00DrIN-2w;
        Mon, 23 Jan 2023 19:49:14 +0200
Date:   Mon, 23 Jan 2023 19:49:14 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 19/57] media: atomisp: Allow sensor drivers without a
 s_power callback
Message-ID: <Y87Ims274C/rk6kI@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-20-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-20-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:27PM +0100, Hans de Goede wrote:
> The s_power callback for v4l2-subdevs has been deprecated, allow sensor
> drivers without a s_power callback to work by ignoring the -ENOIOCTLCMD
> return value.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_fops.c  | 2 +-
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index 833c7aac8f0a..ce01479bdd68 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -832,7 +832,7 @@ static int atomisp_release(struct file *file)
>  	if (isp->inputs[asd->input_curr].asd == asd) {
>  		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
>  				       core, s_power, 0);
> -		if (ret)
> +		if (ret && ret != -ENOIOCTLCMD)
>  			dev_warn(isp->dev, "Failed to power-off sensor\n");
>  
>  		/* clear the asd field to show this camera is not used */
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index d0dd3dbd6f6a..77856cbc5ba7 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -700,7 +700,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
>  	    asd->input_curr != input) {
>  		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
>  				       core, s_power, 0);
> -		if (ret)
> +		if (ret && ret != -ENOIOCTLCMD)
>  			dev_warn(isp->dev,
>  				 "Failed to power-off sensor\n");
>  		/* clear the asd field to show this camera is not used */
> @@ -709,7 +709,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
>  
>  	/* powe on the new sensor */
>  	ret = v4l2_subdev_call(isp->inputs[input].camera, core, s_power, 1);
> -	if (ret) {
> +	if (ret && ret != -ENOIOCTLCMD) {
>  		dev_err(isp->dev, "Failed to power-on sensor\n");
>  		return ret;
>  	}
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


