Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D5A7DB60C
	for <lists+linux-media@lfdr.de>; Mon, 30 Oct 2023 10:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbjJ3JYF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Oct 2023 05:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjJ3JYE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Oct 2023 05:24:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BC9A7
        for <linux-media@vger.kernel.org>; Mon, 30 Oct 2023 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698657842; x=1730193842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+G5DCU4dlvSpicPNV+EuJGUatuSDXQRmLN6i3eIj+Tg=;
  b=jAoecO6eGVSk1F/HygrUfpNcFdutilJy0ZwSOzgztlN4+O4aEvf0Xix/
   8YctUoWQhHl6BDvxuCG5o4zozgzgg8A4+qZPdhr2cNutz8LHgkPIwmMKu
   ufeBjHSDJB4i+2PE18t7zhDv5FibvSW7xSNawB6RqPlpWYSR1xPhMKzqZ
   27OsUZQb2sZ6Aa5R0sFFsYEG+Erm8d/c+vS6wENdPCw5dKOpnzwCEa1ci
   Yv9/meS2HTsxy5h/1/Bd/ZeQBg8v9mUpDWXlIdLWuv9dzSJ0lQZPbcSyO
   cEDaO3Q5G1uShPjtqLwBvD50pLwP2g9cMlxEZf4w/2e5wrw2Nf2nGTslU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="367386164"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="367386164"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 02:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="789409973"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="789409973"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 02:23:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2000711F9E8;
        Mon, 30 Oct 2023 11:23:56 +0200 (EET)
Date:   Mon, 30 Oct 2023 09:23:56 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
Message-ID: <ZT92LDE9z46kxX-h@kekkonen.localdomain>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-12-hdegoede@redhat.com>
 <d1736dfb-e66c-2497-a71b-97f2e28f435f@linux.intel.com>
 <ZT9vfSpEyVk_pO0H@kekkonen.localdomain>
 <8ec5d2b6-8f35-48dd-bb09-4e214415d643@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ec5d2b6-8f35-48dd-bb09-4e214415d643@redhat.com>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Oct 30, 2023 at 09:58:09AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 10/30/23 09:55, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > On Mon, Oct 30, 2023 at 04:30:39PM +0800, Bingbu Cao wrote:
> >>> +static void intel_cio2_bridge_instantiate_vcm_work(struct work_struct *_work)
> >>> +{
> >>> +	struct intel_cio2_bridge_instantiate_vcm_work_data *work =
> >>> +		container_of(_work,
> >>> +			     struct intel_cio2_bridge_instantiate_vcm_work_data,
> >>> +			     work);
> >>> +	struct acpi_device *adev = ACPI_COMPANION(work->sensor);
> >>> +	struct i2c_client *vcm_client;
> >>> +	bool put_fwnode = true;
> >>> +	int ret;
> >>>  
> >>> -	snprintf(name, sizeof(name), "%s-VCM", acpi_dev_name(sensor->adev));
> >>> -	board_info.dev_name = name;
> >>> -	strscpy(board_info.type, sensor->vcm_type, ARRAY_SIZE(board_info.type));
> >>> -	board_info.swnode = &sensor->swnodes[SWNODE_VCM];
> >>> -
> >>> -	sensor->vcm_i2c_client =
> >>> -		i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(sensor->adev),
> >>> -					      1, &board_info);
> >>> -	if (IS_ERR(sensor->vcm_i2c_client)) {
> >>> -		dev_warn(&sensor->adev->dev, "Error instantiation VCM i2c-client: %ld\n",
> >>> -			 PTR_ERR(sensor->vcm_i2c_client));
> >>> -		sensor->vcm_i2c_client = NULL;
> >>> +	/*
> >>> +	 * The client may get probed before the device_link gets added below
> >>> +	 * make sure the sensor is powered-up during probe.
> >>> +	 */
> >>> +	ret = pm_runtime_get_sync(work->sensor);
> >>> +	if (ret < 0) {
> >>> +		dev_err(work->sensor, "Error %d runtime-resuming sensor, cannot instantiate VCM\n",
> >>> +			ret);
> >>> +		goto out;
> >>>  	}
> >>
> >> One question here: how do we make sure that the runtime PM of the sensor
> >> is enabled during the .bound callback? Or is it a mandatory requirement
> >> of driver of such camera sensors?
> > 
> > The sensor driver needs to enable runtime PM in probe, otherwise this won't
> > work. But I don't see why a driver wouldn't? Of course otherwise it
> > wouldn't be a hard requirement.

I meant to write "wasn't earlier a hard requirement". This could also be
documented, I can write a patch for this.

> 
> Right. I believe that having runtime pm support is more or less a hard
> requirement for sensor drivers used on x86. This is also necessary in
> cases where the power on/off sequence is (partially) implemented in
> ACPI AML code in the _PS0 and _PS3 methods of the sensor's ACPI device.
> 
> This happens on [atom]ISP2 based devices and AFAIK also on ChromeOS
> devices.
> 
> So I think it is safe to assume that sensor drivers implement runtime
> pm support and in cases where the driver does not we need to fix the driver.

I agree.

-- 
Regards,

Sakari Ailus
