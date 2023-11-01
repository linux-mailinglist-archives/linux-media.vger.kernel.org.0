Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2DF07DDD1C
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 08:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbjKAHWv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 03:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjKAHWt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 03:22:49 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A8AC2
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 00:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698823363; x=1730359363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xfOHkTkSq4Np0OeJA0VIfGjpVZTFP3muwLmck8frIRk=;
  b=HU+Y5ZU0BLJuXiyIoIb4M6L4VTy58+77wzSmS+eyYpGJvRmgTQftzxS6
   xwkg/A6F8hj3GrDyGcf14ms9xFHo6m2iAe4ifYkzbsn+jGhwTGrpz22RC
   1rZj7yDNG8tIC6gnZK6hpoogwQ4XCOxuFLuRWUh8bYYCVWDmsMNpZ7Wf/
   MMIi66LIyVT/mPjLMr6L7so2Jer6ij3Z2/2WPKOZnthiW8E8c6BCmeJBj
   fSbeE21LAYoqzDE+XNF6g1mN1L9z8EXs+VizP+PwCUTQ/TrMCbLXUBQP9
   Azq67Tj08oxqIjqd/SNFkzAagCEj240c6ninCdZLCwGh3nBOV9XaVPVZg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="392306563"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="392306563"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 00:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="826680913"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="826680913"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 00:22:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 6F31E11F929;
        Wed,  1 Nov 2023 09:12:05 +0200 (EET)
Date:   Wed, 1 Nov 2023 07:12:05 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
Message-ID: <ZUH6RYayRSb-hykQ@kekkonen.localdomain>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-12-hdegoede@redhat.com>
 <d1736dfb-e66c-2497-a71b-97f2e28f435f@linux.intel.com>
 <ZT9vfSpEyVk_pO0H@kekkonen.localdomain>
 <8ec5d2b6-8f35-48dd-bb09-4e214415d643@redhat.com>
 <ZT92LDE9z46kxX-h@kekkonen.localdomain>
 <DM8PR11MB565366E1CEB9BB5F8F1074CE99A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB565366E1CEB9BB5F8F1074CE99A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Wed, Nov 01, 2023 at 06:26:39AM +0000, Cao, Bingbu wrote:
> Sakari and Hans,
> 
> ------------------------------------------------------------------------
> BRs,  
> Bingbu Cao 
> 
> >-----Original Message-----
> >From: Sakari Ailus <sakari.ailus@linux.intel.com>
> >Sent: Monday, October 30, 2023 5:24 PM
> >To: Hans de Goede <hdegoede@redhat.com>
> >Cc: Bingbu Cao <bingbu.cao@linux.intel.com>; Laurent Pinchart
> ><laurent.pinchart@ideasonboard.com>; Daniel Scally
> ><dan.scally@ideasonboard.com>; Mauro Carvalho Chehab <mchehab@kernel.org>;
> >Andy Shevchenko <andy@kernel.org>; Kate Hsuan <hpa@redhat.com>; Cao, Bingbu
> ><bingbu.cao@intel.com>; linux-media@vger.kernel.org
> >Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
> >device-link between VCM and sensor
> >
> >Hi Hans,
> >
> >On Mon, Oct 30, 2023 at 09:58:09AM +0100, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 10/30/23 09:55, Sakari Ailus wrote:
> >> > Hi Bingbu,
> >> >
> >> > On Mon, Oct 30, 2023 at 04:30:39PM +0800, Bingbu Cao wrote:
> >> >>> +static void intel_cio2_bridge_instantiate_vcm_work(struct
> >> >>> +work_struct *_work) {
> >> >>> +	struct intel_cio2_bridge_instantiate_vcm_work_data *work =
> >> >>> +		container_of(_work,
> >> >>> +			     struct
> >intel_cio2_bridge_instantiate_vcm_work_data,
> >> >>> +			     work);
> >> >>> +	struct acpi_device *adev = ACPI_COMPANION(work->sensor);
> >> >>> +	struct i2c_client *vcm_client;
> >> >>> +	bool put_fwnode = true;
> >> >>> +	int ret;
> >> >>>
> >> >>> -	snprintf(name, sizeof(name), "%s-VCM", acpi_dev_name(sensor->adev));
> >> >>> -	board_info.dev_name = name;
> >> >>> -	strscpy(board_info.type, sensor->vcm_type,
> >ARRAY_SIZE(board_info.type));
> >> >>> -	board_info.swnode = &sensor->swnodes[SWNODE_VCM];
> >> >>> -
> >> >>> -	sensor->vcm_i2c_client =
> >> >>> -		i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(sensor-
> >>adev),
> >> >>> -					      1, &board_info);
> >> >>> -	if (IS_ERR(sensor->vcm_i2c_client)) {
> >> >>> -		dev_warn(&sensor->adev->dev, "Error instantiation VCM i2c-
> >client: %ld\n",
> >> >>> -			 PTR_ERR(sensor->vcm_i2c_client));
> >> >>> -		sensor->vcm_i2c_client = NULL;
> >> >>> +	/*
> >> >>> +	 * The client may get probed before the device_link gets added below
> >> >>> +	 * make sure the sensor is powered-up during probe.
> >> >>> +	 */
> >> >>> +	ret = pm_runtime_get_sync(work->sensor);
> >> >>> +	if (ret < 0) {
> >> >>> +		dev_err(work->sensor, "Error %d runtime-resuming sensor,
> >cannot instantiate VCM\n",
> >> >>> +			ret);
> >> >>> +		goto out;
> >> >>>  	}
> >> >>
> >> >> One question here: how do we make sure that the runtime PM of the
> >> >> sensor is enabled during the .bound callback? Or is it a mandatory
> >> >> requirement of driver of such camera sensors?
> >> >
> >> > The sensor driver needs to enable runtime PM in probe, otherwise
> >> > this won't work. But I don't see why a driver wouldn't? Of course
> >> > otherwise it wouldn't be a hard requirement.
> >
> >I meant to write "wasn't earlier a hard requirement". This could also be
> >documented, I can write a patch for this.
> 
> The problem here is that some driver doesn't enable the runtime PM before
> v4l2_async_register_subdev_sensor(), that may cause race condition and
> VCM instantiation failure as the runtime PM is not enabled yet. Then there
> is no chance for VCM instantiation to succeed. 

These drivers need to be fixed.

All initialisation needs to complete by the time the async sub-device is
registered as this is when the sensor may be bound to a notifier and also
accessible via the UAPI.

In most of the cases the rest of the probe completes even if runtime PM is
enabled after registering the sub-device (without IPU bridge) but it's
still not correct.

> 
> Does this 'requirement' or limit really make sense?

-- 
Regards,

Sakari Ailus
