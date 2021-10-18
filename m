Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0D384316DF
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 13:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhJRLKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 07:10:42 -0400
Received: from mga17.intel.com ([192.55.52.151]:57548 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229473AbhJRLKm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 07:10:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="209018329"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="209018329"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 04:08:24 -0700
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="444014675"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 04:08:18 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mcQUp-00027p-P4;
        Mon, 18 Oct 2021 14:07:59 +0300
Date:   Mon, 18 Oct 2021 14:07:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/17] media: atomisp: pci: fix punit_ddr_dvfs_enable()
 argument for mrfld_power up case
Message-ID: <YW1Vj5jGybs8gXWr@smile.fi.intel.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-3-kitakar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017161958.44351-3-kitakar@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 18, 2021 at 01:19:42AM +0900, Tsuchiya Yuto wrote:
> When comparing with intel-aero atomisp [1], it looks like
> punit_ddr_dvfs_enable() should take `false` as an argument on mrfld_power
> up case.
> 
> Code from the intel-aero kernel [1]:
> 
>         int atomisp_mrfld_power_down(struct atomisp_device *isp)
>         {
>         [...]
>         	/*WA:Enable DVFS*/
>         	if (IS_CHT)
>         		punit_ddr_dvfs_enable(true);
> 
>         int atomisp_mrfld_power_up(struct atomisp_device *isp)
>         {
>         [...]
>         	/*WA for PUNIT, if DVFS enabled, ISP timeout observed*/
>         	if (IS_CHT)
>         		punit_ddr_dvfs_enable(false);
> 
> This patch fixes the inverted argument as per the intel-aero code, as
> well as its comment. While here, fix space issues for comments in
> atomisp_mrfld_power().
> 
> Note that it does not seem to be possible to unify the up/down cases for
> punit_ddr_dvfs_enable(), i.e., we can't do something like the following:
> 
>         if (IS_CHT)
>         	punit_ddr_dvfs_enable(!enable);
> 
> because according to the intel-aero code [1], the DVFS is disabled
> before "writing 0x0 to ISPSSPM0 bit[1:0]" and the DVFS is enabled after
> "writing 0x3 to ISPSSPM0 bit[1:0]".
> 
> [1] https://github.com/intel-aero/linux-kernel/blob/a1b673258feb915268377275130c5c5df0eafc82/drivers/media/pci/atomisp/atomisp_driver/atomisp_v4l2.c#L431-L514
> 
> Fixes: 0f441fd70b1e ("media: atomisp: simplify the power down/up code")
> Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 0511c454e769..f5362554638e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -711,15 +711,15 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
>  
>  	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
>  
> -	/*WA:Enable DVFS*/
> +	/* WA for PUNIT, if DVFS enabled, ISP timeout observed */

P-Unit

>  	if (IS_CHT && enable)
> -		punit_ddr_dvfs_enable(true);
> +		punit_ddr_dvfs_enable(false);
>  
>  	/*
>  	 * FIXME:WA for ECS28A, with this sleep, CTS
>  	 * android.hardware.camera2.cts.CameraDeviceTest#testCameraDeviceAbort
>  	 * PASS, no impact on other platforms
> -	*/
> +	 */
>  	if (IS_BYT && enable)
>  		msleep(10);
>  
> @@ -727,7 +727,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
>  	iosf_mbi_modify(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0,
>  			val, MRFLD_ISPSSPM0_ISPSSC_MASK);
>  
> -	/*WA:Enable DVFS*/
> +	/* WA:Enable DVFS */
>  	if (IS_CHT && !enable)
>  		punit_ddr_dvfs_enable(true);
>  
> -- 
> 2.33.1
> 
> 

-- 
With Best Regards,
Andy Shevchenko


