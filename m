Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 174AB6783D7
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 18:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbjAWR7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 12:59:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbjAWR7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 12:59:41 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C852CFC1
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 09:59:40 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309680999"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="309680999"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 09:59:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639285890"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="639285890"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 23 Jan 2023 09:59:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK16O-00DrVw-1G;
        Mon, 23 Jan 2023 19:59:28 +0200
Date:   Mon, 23 Jan 2023 19:59:28 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 25/57] media: atomisp: Stop overriding padding w/h to 12
 on BYT
Message-ID: <Y87LAGnn+uenmkSV@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-26-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-26-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:33PM +0100, Hans de Goede wrote:
> atomisp_set_fmt() first does:
> 
> 	v4l2_fill_mbus_format(&vformat.format, ...);
>         vformat.format.height += padding_h;
>         vformat.format.width += padding_w;
> 
>         ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera, pad,
>                                set_fmt, NULL, &vformat);
>         if (ret)
>                 return ret;
> 
> 	f->fmt.pix.width = vformat.format.width - padding_w;
> 	f->fmt.pix.height = vformat.format.height - padding_h;
> 
> this happens with the original padding w/h = 16 values and then later
> on it calls:
> 
>                 ret = atomisp_set_fmt_to_snr(vdev, &s_fmt,
>                                              f->fmt.pix.pixelformat, padding_w,
>                                              padding_h, dvs_env_w, dvs_env_h);
> 
> Which repeats the above structure. If at that point padding w/h are
> changed to 12 then it will now request a different output-size of
> the sensor driver.
> 
> The sensor drivers so far have actually been ignoring this since they use
> v4l2_find_nearest_size() on a fixed resolution list and the nearest
> resolution will be the one from the earlier calls where padding w/h
> was 16.
> 
> But there really is no reason for sensor drivers to use a fixed
> resolution list. They make lower resolutions using cropping so they
> can make any resolution as long as width/height are even numbers.
> 
> Dropping the fixed-resolution list limit from sensors on BYT results
> in trying to start streaming failing because the resolution set to
> the sensor now no longer matches with the resolution used during
> the initial part of the configuration done by atomisp_set_fmt().
> 
> Drop the BYT specific overriding of the padding_w/h to 12, so that
> the padding in the first and second s_fmt calls made to the sensor
> matches, to fix stream start failing when the fixed resolution list
> is dropped.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index eb05288d8fb1..47f18ac5e40e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -5163,9 +5163,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
>  	if (!atomisp_subdev_format_conversion(asd, source_pad)) {
>  		padding_w = 0;
>  		padding_h = 0;
> -	} else if (IS_BYT) {
> -		padding_w = 12;
> -		padding_h = 12;
>  	}
>  
>  	/* construct resolution supported by isp */
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


