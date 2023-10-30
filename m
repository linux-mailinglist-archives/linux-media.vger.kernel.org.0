Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B874C7DB586
	for <lists+linux-media@lfdr.de>; Mon, 30 Oct 2023 09:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbjJ3Izf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Oct 2023 04:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232303AbjJ3Izd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Oct 2023 04:55:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6D1C1
        for <linux-media@vger.kernel.org>; Mon, 30 Oct 2023 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698656131; x=1730192131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1YmQ5X2HtVVl4UHjehsq2Qt8cfkCE0NKv/qxnfjiCMU=;
  b=U4dvrfZPG8jXsbDZKprwbV5TwWiab9ejekcEyhVZyIKhq8pqfXlsy5Nx
   06sfAmB6X/U5mrvKeFtRCybfSgKJNzkk5RDBvBkH7ONy748xUbn6zs0wY
   3pwBEa/Qef/vOY32YXe1xtQMzdAi1HBoe4Rj8rTfRmoweGkX3Dk7wYRDy
   jtJ8ymv4dus8+/ptcHnUGDU4QnUoPcCwB1mg8GGYHNvjW8D2uA+mBWjI7
   3QSkBLt3cJEYhUC4JGX8IG+yBkhWQ1Qtg/UUqCNIEEPdCLEI2tAOoGYJc
   /cBNYzpG/42O0aKzRgvxDpROSPtIv9yzqLiQUMRBzhGVj+UL8i3xLhsRk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="368251816"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="368251816"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 01:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="933720591"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="933720591"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 01:55:28 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id D9F8011F9E8;
        Mon, 30 Oct 2023 10:55:25 +0200 (EET)
Date:   Mon, 30 Oct 2023 08:55:25 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
Message-ID: <ZT9vfSpEyVk_pO0H@kekkonen.localdomain>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-12-hdegoede@redhat.com>
 <d1736dfb-e66c-2497-a71b-97f2e28f435f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1736dfb-e66c-2497-a71b-97f2e28f435f@linux.intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Mon, Oct 30, 2023 at 04:30:39PM +0800, Bingbu Cao wrote:
> > +static void intel_cio2_bridge_instantiate_vcm_work(struct work_struct *_work)
> > +{
> > +	struct intel_cio2_bridge_instantiate_vcm_work_data *work =
> > +		container_of(_work,
> > +			     struct intel_cio2_bridge_instantiate_vcm_work_data,
> > +			     work);
> > +	struct acpi_device *adev = ACPI_COMPANION(work->sensor);
> > +	struct i2c_client *vcm_client;
> > +	bool put_fwnode = true;
> > +	int ret;
> >  
> > -	snprintf(name, sizeof(name), "%s-VCM", acpi_dev_name(sensor->adev));
> > -	board_info.dev_name = name;
> > -	strscpy(board_info.type, sensor->vcm_type, ARRAY_SIZE(board_info.type));
> > -	board_info.swnode = &sensor->swnodes[SWNODE_VCM];
> > -
> > -	sensor->vcm_i2c_client =
> > -		i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(sensor->adev),
> > -					      1, &board_info);
> > -	if (IS_ERR(sensor->vcm_i2c_client)) {
> > -		dev_warn(&sensor->adev->dev, "Error instantiation VCM i2c-client: %ld\n",
> > -			 PTR_ERR(sensor->vcm_i2c_client));
> > -		sensor->vcm_i2c_client = NULL;
> > +	/*
> > +	 * The client may get probed before the device_link gets added below
> > +	 * make sure the sensor is powered-up during probe.
> > +	 */
> > +	ret = pm_runtime_get_sync(work->sensor);
> > +	if (ret < 0) {
> > +		dev_err(work->sensor, "Error %d runtime-resuming sensor, cannot instantiate VCM\n",
> > +			ret);
> > +		goto out;
> >  	}
> 
> One question here: how do we make sure that the runtime PM of the sensor
> is enabled during the .bound callback? Or is it a mandatory requirement
> of driver of such camera sensors?

The sensor driver needs to enable runtime PM in probe, otherwise this won't
work. But I don't see why a driver wouldn't? Of course otherwise it
wouldn't be a hard requirement.

This function gets called after the upstream notifier (CIO2 in this case)
driver's bound is called, the sensor's probe function has been run by this
time so this part should be fine.

-- 
Regards,

Sakari Ailus
