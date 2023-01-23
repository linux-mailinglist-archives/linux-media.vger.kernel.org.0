Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFD01677E30
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 15:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbjAWOiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 09:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232363AbjAWOh7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 09:37:59 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26CB46AD
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 06:37:55 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="305710646"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="305710646"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="692180713"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="692180713"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2023 06:37:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pJxxG-00DmYh-1N;
        Mon, 23 Jan 2023 16:37:50 +0200
Date:   Mon, 23 Jan 2023 16:37:50 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 13/57] media: atomisp: Remove deferred firmware loading
 support
Message-ID: <Y86bvkEorZQHg7Y2@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-14-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-14-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:21PM +0100, Hans de Goede wrote:
> Make atomisp behave like any othet drivers and have it load the firmware

other

> at probe time (as it was already doing by default).
> 
> The deferred firmware loading support needlessly complicates the
> v4l2_file_operations.open callback (atomisp_open()), getting in
> the way of allowing multiple opens like a normal v4l2 device would.

So it actually removes that variable and accompanying code w.o.
changing behaviour (as default).

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_fops.c  | 25 -----------
>  .../staging/media/atomisp/pci/atomisp_fops.h  |  2 -
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  | 42 +++++++------------
>  3 files changed, 14 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index 682239ea042f..036ad339b344 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -757,25 +757,6 @@ static int atomisp_open(struct file *file)
>  	mutex_lock(&isp->mutex);
>  
>  	asd->subdev.devnode = vdev;
> -	/* Deferred firmware loading case. */
> -	if (isp->css_env.isp_css_fw.bytes == 0) {
> -		dev_err(isp->dev, "Deferred firmware load.\n");
> -		isp->firmware = atomisp_load_firmware(isp);
> -		if (!isp->firmware) {
> -			dev_err(isp->dev, "Failed to load ISP firmware.\n");
> -			ret = -ENOENT;
> -			goto error;
> -		}
> -		ret = atomisp_css_load_firmware(isp);
> -		if (ret) {
> -			dev_err(isp->dev, "Failed to init css.\n");
> -			goto error;
> -		}
> -		/* No need to keep FW in memory anymore. */
> -		release_firmware(isp->firmware);
> -		isp->firmware = NULL;
> -		isp->css_env.isp_css_fw.data = NULL;
> -	}
>  
>  	if (!isp->input_cnt) {
>  		dev_err(isp->dev, "no camera attached\n");
> @@ -901,12 +882,6 @@ static int atomisp_release(struct file *file)
>  
>  	atomisp_destroy_pipes_stream_force(asd);
>  
> -	if (defer_fw_load) {
> -		ia_css_unload_firmware();
> -		isp->css_env.isp_css_fw.data = NULL;
> -		isp->css_env.isp_css_fw.bytes = 0;
> -	}
> -
>  	ret = v4l2_subdev_call(isp->flash, core, s_power, 0);
>  	if (ret < 0 && ret != -ENODEV && ret != -ENOIOCTLCMD)
>  		dev_warn(isp->dev, "Failed to power-off flash\n");
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.h b/drivers/staging/media/atomisp/pci/atomisp_fops.h
> index 10e43126b693..2efc5245e571 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.h
> @@ -33,6 +33,4 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd);
>  
>  extern const struct v4l2_file_operations atomisp_fops;
>  
> -extern bool defer_fw_load;
> -
>  #endif /* __ATOMISP_FOPS_H__ */
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index aa05c69a5c6b..2a949d3dc5d1 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -58,12 +58,6 @@ static uint skip_fwload;
>  module_param(skip_fwload, uint, 0644);
>  MODULE_PARM_DESC(skip_fwload, "Skip atomisp firmware load");
>  
> -/* memory optimization: deferred firmware loading */
> -bool defer_fw_load;
> -module_param(defer_fw_load, bool, 0644);
> -MODULE_PARM_DESC(defer_fw_load,
> -		 "Defer FW loading until device is opened (default:disable)");
> -
>  /* cross componnet debug message flag */
>  int dbg_level;
>  module_param(dbg_level, int, 0644);
> @@ -1514,21 +1508,17 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  	isp->max_isr_latency = ATOMISP_MAX_ISR_LATENCY;
>  
>  	/* Load isp firmware from user space */
> -	if (!defer_fw_load) {
> -		isp->firmware = atomisp_load_firmware(isp);
> -		if (!isp->firmware) {
> -			err = -ENOENT;
> -			dev_dbg(&pdev->dev, "Firmware load failed\n");
> -			goto load_fw_fail;
> -		}
> +	isp->firmware = atomisp_load_firmware(isp);
> +	if (!isp->firmware) {
> +		err = -ENOENT;
> +		dev_dbg(&pdev->dev, "Firmware load failed\n");
> +		goto load_fw_fail;
> +	}
>  
> -		err = sh_css_check_firmware_version(isp->dev, isp->firmware->data);
> -		if (err) {
> -			dev_dbg(&pdev->dev, "Firmware version check failed\n");
> -			goto fw_validation_fail;
> -		}
> -	} else {
> -		dev_info(&pdev->dev, "Firmware load will be deferred\n");
> +	err = sh_css_check_firmware_version(isp->dev, isp->firmware->data);
> +	if (err) {
> +		dev_dbg(&pdev->dev, "Firmware version check failed\n");
> +		goto fw_validation_fail;
>  	}
>  
>  	pci_set_master(pdev);
> @@ -1628,14 +1618,10 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  	}
>  
>  	/* Load firmware into ISP memory */
> -	if (!defer_fw_load) {
> -		err = atomisp_css_load_firmware(isp);
> -		if (err) {
> -			dev_err(&pdev->dev, "Failed to init css.\n");
> -			goto css_init_fail;
> -		}
> -	} else {
> -		dev_dbg(&pdev->dev, "Skip css init.\n");
> +	err = atomisp_css_load_firmware(isp);
> +	if (err) {
> +		dev_err(&pdev->dev, "Failed to init css.\n");
> +		goto css_init_fail;
>  	}
>  	/* Clear FW image from memory */
>  	release_firmware(isp->firmware);
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


