Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0676169E414
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbjBUP6E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:58:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233537AbjBUP6D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:58:03 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91E4AD2C
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 07:58:02 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334032012"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="334032012"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 07:58:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="702060365"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="702060365"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 21 Feb 2023 07:57:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pUV1g-00A1fq-22;
        Tue, 21 Feb 2023 17:57:56 +0200
Date:   Tue, 21 Feb 2023 17:57:56 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 02/10] media: atomisp: Remove continuous mode support
Message-ID: <Y/TqBBdU7dbYPIsW@smile.fi.intel.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
 <20230221145906.8113-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221145906.8113-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 21, 2023 at 03:58:58PM +0100, Hans de Goede wrote:
> Continues mode is a special mode where 2 /dev/video devices can be active
> at the same time. Either the video-preview + video nodes or the
> viewfinder (for still capture) + capture nodes.
> 
> For the video-preview + video-recording case modern userspace will
> use a single stream multiplexed by pipewire.
> 
> The still-capture case is extra special only starting the preview
> stream and then relying on a custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG
> ioctl to set things up followed by a second stream on to capture
> the amount of configured still pictures. While running the sensor
> at full resolution all the time. This case too is better handled
> with dma-buf + GPU downscaling for the view-finder rather then all this
> custom special code. Besises this the ioctl expects a bunch of special
> non error checked conditions to be met otherwise things will crash/hang.
> 
> The continues mode also involves a special cases all over the code
> getting in the way of further cleanups and simplifying the code to
> using just 1 /dev/video# node. So lets remove it and the
> related custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG ioctl.

...

> +	ret = atomisp_set_fmt_to_snr(vdev, &s_fmt,
> +				     f->fmt.pix.pixelformat, padding_w,

At least one parameter can be moved to the previous line.

> +				     padding_h, dvs_env_w, dvs_env_h);
> +	if (ret) {
> +		dev_warn(isp->dev,
> +			 "Set format to sensor failed with %d\n", ret);
> +		return -EINVAL;

...

>  	case ATOMISP_RUN_MODE_PREVIEW:
> -		if (!asd->continuous_mode->val) {
> -			if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
> -				return true;
> +		if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
> +			return true;
>  
> -			return false;
> -		}
> -		fallthrough;
> +		return false;

		return pipe_id == IA_CSS_PIPE_ID_PREVIEW;

...

>  	case ATOMISP_RUN_MODE_VIDEO:
> -		if (!asd->continuous_mode->val) {
> -			if (pipe_id == IA_CSS_PIPE_ID_VIDEO ||
> -			    pipe_id == IA_CSS_PIPE_ID_YUVPP)
> -				return true;
> -			else
> -				return false;
> -		}
> -		fallthrough;
> +		if (pipe_id == IA_CSS_PIPE_ID_VIDEO || pipe_id == IA_CSS_PIPE_ID_YUVPP)
> +			return true;
> +
> +		return false;

Similar.

-- 
With Best Regards,
Andy Shevchenko


