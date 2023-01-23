Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44A7E678509
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 19:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbjAWSgT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 13:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbjAWSgS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 13:36:18 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE5C1164F
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 10:36:18 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305777603"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="305777603"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:36:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="990569441"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="990569441"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jan 2023 10:36:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK1fx-00DsLb-1Y;
        Mon, 23 Jan 2023 20:36:13 +0200
Date:   Mon, 23 Jan 2023 20:36:13 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 51/57] media: atomisp: ov2722: Call
 atomisp_gmin_remove_subdev() on probe failure
Message-ID: <Y87TnQGbxCvi3sED@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-52-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-52-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:59PM +0100, Hans de Goede wrote:
> Call atomisp_gmin_remove_subdev() on probe failure to properly free
> the GPIOs and other resources acquired by the gmin_camera_platform_data()
> call earlier.

Fixes?

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index d819ab5de28a..d874e12da8cc 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -994,6 +994,7 @@ static int ov2722_probe(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(&dev->ctrl_handler);
>  
>  out_free:
> +	atomisp_gmin_remove_subdev(&dev->sd);
>  	v4l2_device_unregister_subdev(&dev->sd);
>  	kfree(dev);
>  	return ret;
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


