Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED9CF677E34
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 15:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbjAWOkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 09:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjAWOkI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 09:40:08 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73953126FD
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 06:40:07 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="353316810"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="353316810"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:40:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="639172461"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="639172461"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 23 Jan 2023 06:40:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pJxzO-00Dmbt-0B;
        Mon, 23 Jan 2023 16:40:02 +0200
Date:   Mon, 23 Jan 2023 16:40:01 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 07/57] media: atomisp: Remove useless msleep(10) before
 power-on on BYT
Message-ID: <Y86cQb9pRZ4IR0tp@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-8-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-8-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:15PM +0100, Hans de Goede wrote:
> On BYT on poweron/runtime-resume the code is doing:
> 
> 1. Do nothing
> 2. msleep(10)
> 3. Start actual poweron sequence
> 
> Since the runtime resume can happen at any moment, waiting 10ms
> after it does not really make any sense.
> 
> According to both the comment and to:
> https://github.com/intel/ProductionKernelQuilts/blob/master/uefi/cht-m1stable/patches/cam-0341-atomisp-WA-sleep-10ms-when-power-up-ISP-on-byt.patch
> 
> Which is the patch which originally added this this was added
> as a workaround for a single test failing on a single model
> tablet/laptop. So lets just drop this.

Since it's for BYT platforms and you have plenty to test, I believe it's the
right thing to do.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 9eea8ffbc3d6..aa05c69a5c6b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -665,14 +665,6 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
>  		msleep(20);
>  	}
>  
> -	/*
> -	 * FIXME:WA for ECS28A, with this sleep, CTS
> -	 * android.hardware.camera2.cts.CameraDeviceTest#testCameraDeviceAbort
> -	 * PASS, no impact on other platforms
> -	 */
> -	if (IS_BYT && enable)
> -		msleep(10);
> -
>  	/* Write to ISPSSPM0 bit[1:0] to power on/off the IUNIT */
>  	iosf_mbi_modify(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0,
>  			val, MRFLD_ISPSSPM0_ISPSSC_MASK);
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


