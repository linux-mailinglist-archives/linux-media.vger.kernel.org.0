Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDE5D631C93
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 10:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiKUJOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 04:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiKUJOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 04:14:33 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F6822BC1
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 01:14:32 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="340370092"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="340370092"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:14:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="643246585"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="643246585"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 21 Nov 2022 01:14:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ox2sl-00FC7R-21;
        Mon, 21 Nov 2022 11:14:27 +0200
Date:   Mon, 21 Nov 2022 11:14:27 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 17/20] media: atomisp: Move calling of css_[un]init() to
 power_on()/_off()
Message-ID: <Y3tBc4u/oZ6jacrm@smile.fi.intel.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-18-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120224101.746199-18-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 20, 2022 at 11:40:58PM +0100, Hans de Goede wrote:
> atomisp_css_init() is always called after calling atomisp_power_on()
> either directly or through getting a runtime-pm reference.
> 
> Likewise atomisp_css_uninit() is always called after calling
> atomisp_power_off().
> 
> Move the call site of these 2 functions to inside atomisp_power_on() /
> atomisp_power_off() to make this more explicit.

...

>  	dev_dbg(isp->dev, "%s\n", __func__);
> -	atomisp_css_uninit(isp);
> +
>  	ret = atomisp_power_off(isp->dev);
>  	if (ret < 0)
>  		dev_err(isp->dev, "atomisp_power_off failed, %d\n", ret);
>  
>  	ret = atomisp_power_on(isp->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
>  		dev_err(isp->dev, "atomisp_power_on failed, %d\n", ret);
> -
> -	ret = atomisp_css_init(isp);
> -	if (ret)

>  		isp->isp_fatal_error = true;

This was only set when css_init() failed, now it may be set even when
power_on() fails. Why is it not a problem? Commit message doesn't shed
a light on this change.

> +	}

-- 
With Best Regards,
Andy Shevchenko


