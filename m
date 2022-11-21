Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F111B631CA5
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 10:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbiKUJRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 04:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbiKUJRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 04:17:13 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB8B2EF77
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 01:17:12 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="399800920"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="399800920"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:17:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="746828979"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="746828979"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2022 01:17:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ox2vE-00FCA4-01;
        Mon, 21 Nov 2022 11:17:00 +0200
Date:   Mon, 21 Nov 2022 11:16:59 +0200
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
Message-ID: <Y3tCC/AU0ixWRBa8@smile.fi.intel.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-16-hdegoede@redhat.com>
 <Y3tAWI/K3VgeOBrh@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3tAWI/K3VgeOBrh@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,TVD_SUBJ_WIPE_DEBT autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 21, 2022 at 11:09:44AM +0200, Andy Shevchenko wrote:
> On Sun, Nov 20, 2022 at 11:40:56PM +0100, Hans de Goede wrote:
> > Remove the unnecessary sw_contex.power_state checks:
> > 
> > 1. atomisp_freq_scaling() and atomisp_stop_streaming() only run when the
> >    ISP is powered up through runtime-pm, so the checkes are not necessary
> > 
> > 2. atomisp_mrfld_pre_power_down() and atomisp_runtime_resume() are only
> >    called through the driver-core pm handling code which already
> >    guarantees they are not called when already powered down / up.
> > 
> > 3. atomisp_isr() also checks isp->css_initialized which only gets set
> >    by atomisp_css_init() which runs *after* powering up the ISP and
> >    which gets cleared by atomisp_css_uninit() *before* before powering
> >    down the ISP.
> > 
> > So all the checks are unnecessary, remove them as well as the
> > sw_contex.power_state field itself.
> 
> ...
> 
> > +	/*Turn on ISP d-phy */
> 
> While at it, you may add a whitespace after /*.

Okay, it's going to be removed by one of the following changes.
No need to amend.

> > +	ret = atomisp_ospm_dphy_up(isp);
> > +	if (ret) {
> > +		dev_err(isp->dev, "Failed to power up ISP!.\n");
> > +		return -EINVAL;
> >  	}

-- 
With Best Regards,
Andy Shevchenko


