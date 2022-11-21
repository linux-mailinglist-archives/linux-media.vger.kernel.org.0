Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A88FD631C87
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 10:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbiKUJKJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 04:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbiKUJJv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 04:09:51 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7A613DC6
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 01:09:49 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="312213809"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="312213809"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:09:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="618757700"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="618757700"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 21 Nov 2022 01:09:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ox2oC-00FC2F-1b;
        Mon, 21 Nov 2022 11:09:44 +0200
Date:   Mon, 21 Nov 2022 11:09:44 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 15/20] media: atomisp: Remove sw_contex.power_state checks
Message-ID: <Y3tAWI/K3VgeOBrh@smile.fi.intel.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-16-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120224101.746199-16-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,TVD_SUBJ_WIPE_DEBT autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 20, 2022 at 11:40:56PM +0100, Hans de Goede wrote:
> Remove the unnecessary sw_contex.power_state checks:
> 
> 1. atomisp_freq_scaling() and atomisp_stop_streaming() only run when the
>    ISP is powered up through runtime-pm, so the checkes are not necessary
> 
> 2. atomisp_mrfld_pre_power_down() and atomisp_runtime_resume() are only
>    called through the driver-core pm handling code which already
>    guarantees they are not called when already powered down / up.
> 
> 3. atomisp_isr() also checks isp->css_initialized which only gets set
>    by atomisp_css_init() which runs *after* powering up the ISP and
>    which gets cleared by atomisp_css_uninit() *before* before powering
>    down the ISP.
> 
> So all the checks are unnecessary, remove them as well as the
> sw_contex.power_state field itself.

...

> +	/*Turn on ISP d-phy */

While at it, you may add a whitespace after /*.

> +	ret = atomisp_ospm_dphy_up(isp);
> +	if (ret) {
> +		dev_err(isp->dev, "Failed to power up ISP!.\n");
> +		return -EINVAL;
>  	}

-- 
With Best Regards,
Andy Shevchenko


