Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06122270905
	for <lists+linux-media@lfdr.de>; Sat, 19 Sep 2020 00:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgIRWuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 18:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgIRWuz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 18:50:55 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36013C0613CE;
        Fri, 18 Sep 2020 15:50:55 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q9so6693218wmj.2;
        Fri, 18 Sep 2020 15:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=idMbHdqE5RSEL1+PYj6diJYT02GB4Z1nCCZPgrHPta8=;
        b=Vckwe6xI+A2C9eCp+WMph4qWQrfTlLHpa/4Y4LcF58WPWCTf/ZHeH2RfuXQtP7J6C1
         aiaOaBaC7RR8SZnurM9CSGq9Ik5ovliFaK+fr/Ipcyeg/UMsJ4i3a+2OSTHJFOSTswAS
         Ejy+wr8tZXZUYLPwo3viLSmcfe0Zn2hSSH7RWuaZa3wTNr0/0cEJC08FTKPxyVXaWN74
         /XuXaAD/ErGKs1jYCUkO0cYJYR2W/FDvJIAknyNtTo5r0kgD7QVsdeym95tNUccXEMr3
         vmm+XD1GvGDu+anKwVRMu2p+WN/VbAPSAKJuUMvTDjthRGE+wNmGj7aJR5C+DqshkclM
         HZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=idMbHdqE5RSEL1+PYj6diJYT02GB4Z1nCCZPgrHPta8=;
        b=Z0Qghxgp9Q6UZW+7MfTwur4buV51Kb9gU6K67oSfcD0cn+sQ5GvW8PJmX9OepstaNo
         mI76NJw/986R7CINvcWi+/vBl5zhbTElgwb6o1ZJFzydJq8gUVZWwO0x+hA7Kz/0doyk
         lxYNKK88FcbHg/7p/5sz/NX1Ixg6zf4exb25538G47UzSP5BV+UnA6p7vApGdXZl1iWy
         ntg9MCx2LU68yF24DVnOp+42czRsdLNZ1BLI3br3y/xfPLE47ZJZzI2r8CQpgyosUp62
         TQqjGl+niqJmzAsrH2aUhyxAK0L+pumzNvFsc0J+J7HpS8iFyXTbFklWXga5mq4P03Pp
         gn+w==
X-Gm-Message-State: AOAM533/Ql2ftsafZOTlRH7zMewIQgP2z9bRalJPGY8D8o8tu/MTSuB4
        r9HA8Uw/BEnXTlu0toKeyHM=
X-Google-Smtp-Source: ABdhPJwjf4jXNqYTyGVIF3CtQIUJQDErVPkzZsagv3DdXcCRd8jzDPcLVTuvuBWHdOemvSRbNZgvMQ==
X-Received: by 2002:a1c:9cd3:: with SMTP id f202mr17665842wme.148.1600469453514;
        Fri, 18 Sep 2020 15:50:53 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id c14sm7462056wrv.12.2020.09.18.15.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 15:50:52 -0700 (PDT)
From:   Dan Scally <djrscally@gmail.com>
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, davem@davemloft.net, robh@kernel.org,
        devel@driverdev.osuosl.org, jorhand@linux.microsoft.com,
        kieran.bingham@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, kitakar@gmail.com
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917093407.GK4282@kadam>
Message-ID: <8d19e234-2e87-693a-c3e7-a8433ae83d61@gmail.com>
Date:   Fri, 18 Sep 2020 23:50:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917093407.GK4282@kadam>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan -  thanks for all your comments. Sorry it took a while to get to
yours.

On 17/09/2020 10:34, Dan Carpenter wrote:
> On Wed, Sep 16, 2020 at 10:36:18PM +0100, Daniel Scally wrote:
>> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
>> index 92f5eadf2c99..fd941d2c7581 100644
>> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
>> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
>> @@ -1719,6 +1719,59 @@ static void cio2_queues_exit(struct cio2_device *cio2)
>>  		cio2_queue_exit(cio2, &cio2->queue[i]);
>>  }
>>  
>> +static int cio2_probe_can_progress(struct pci_dev *pci_dev)
>> +{
>> +	void *sensor;
>> +
>> +	/*
>> +	 * On ACPI platforms, we need to probe _after_ sensors wishing to connect
>> +	 * to cio2 have added a device link. If there are no consumers yet, then
>> +	 * we need to defer. The .sync_state() callback will then be called after
>> +	 * all linked sensors have probed
>> +	 */
>> +
>> +	if (IS_ENABLED(CONFIG_ACPI)) {
> Reverse this condition.
>
> 	if (!IS_ENABLED(CONFIG_ACPI))
> 		return 0;
>
>
Yeah, much better.
>> +		sensor = (struct device *)list_first_entry_or_null(
>> +								&pci_dev->dev.links.consumers,
>> +								struct dev_links_info,
>> +								consumers);
>> +
>> +		if (!sensor)
>> +			return -EPROBE_DEFER;
> Get rid of the cast.
>
> 	if (list_empty(&pci_dev->dev.links.consumers))
> 		return -EPROBE_DEFER;
>
> 	return 0;
>
Also much better, though I think possibly this whole section will be
going away now after some of the other pointers...
>> +		cio2 = dev_get_drvdata(dev);
>> +
>> +		if (!cio2) {
> Delete the blank line between the call and the test.  They're part of
> the same step.  "cio2" can't be NULL anyway, so delete the test.
Thanks - I'll skip blank lines in that situation in future
>> +
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to fetch SSDB data\n");
>> +		return ret;
>> +	}
>> +
>> +	sensor->link = sensor_data.link;
>> +	sensor->lanes = sensor_data.lanes;
>> +	sensor->mclkspeed = sensor_data.mclkspeed;
>> +
>> +	return 0;
>> +}
>> +
>> +static int create_endpoint_properties(struct device *dev,
>> +				      struct sensor_bios_data *ssdb,
>> +				      struct property_entry *sensor_props,
>> +				      struct property_entry *cio2_props)
>> +{
>> +		u32 *data_lanes;
>> +		int i;
> Indented too far.
>
>> +
>> +		data_lanes = devm_kmalloc(dev, sizeof(u32) * (int)ssdb->lanes,
> No need for the cast.  Use devm_kmalloc_array().
Ah - TIL that that exists, thanks.
>> +					  GFP_KERNEL);
>> +
>> +		if (!data_lanes) {
>> +			dev_err(dev,
>> +				"Couldn't allocate memory for data lanes array\n");
> Delete the error message (checkpatch.pl --strict).
And that too - I wasn't using the --strict flag, I'll do that next time
>> +
>> +		sensor_props[0] = PROPERTY_ENTRY_U32("clock-frequency",
>> +						     ssdb->mclkspeed);
>> +		sensor_props[1] = PROPERTY_ENTRY_U32("bus-type", 5);
>> +		sensor_props[2] = PROPERTY_ENTRY_U32("clock-lanes", 0);
>> +		sensor_props[3] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
>> +							       data_lanes,
>> +							       (int)ssdb->lanes);
>> +		sensor_props[4] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_SENSOR];
>> +		sensor_props[5] = PROPERTY_ENTRY_NULL;
>> +
>> +		cio2_props[0] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
>> +							     data_lanes,
>> +							     (int)ssdb->lanes);
>> +		cio2_props[1] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_CIO2];
>> +		cio2_props[2] = PROPERTY_ENTRY_NULL;
>> +
>> +		return 0;
>> +}
>> +
>> +static int connect_supported_devices(void)
>> +{
>> +	struct acpi_device *adev;
>> +	struct device *dev;
>> +	struct sensor_bios_data ssdb;
>> +	struct sensor *sensor;
>> +	struct property_entry *sensor_props;
>> +	struct property_entry *cio2_props;
>> +	struct fwnode_handle *fwnode;
>> +	struct software_node *nodes;
>> +	struct v4l2_subdev *sd;
>> +	int i, ret;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {
>> +		adev = acpi_dev_get_first_match_dev(supported_devices[i],
>> +						    NULL, -1);
>> +
>> +		if (!adev)
>> +			continue;
>> +
>> +		dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
>> +
>> +		if (!dev) {
>> +			pr_info("ACPI match for %s, but it has no i2c device\n",
>> +				supported_devices[i]);
>> +			continue;
>> +		}
>> +
>> +		if (!dev->driver_data) {
>> +			pr_info("ACPI match for %s, but it has no driver\n",
>> +				supported_devices[i]);
> put_device(dev);
Good catch, thank you.
>> +	}
>> +
>> +	ret = connect_supported_devices();
>> +
>> +	if ((ret < 0) || (bridge.n_sensors <= 0)) {
>> +		pr_err("cio2_bridge: Failed to connect any devices\n");
>> +		goto out;
> If (bridge.n_sensors <= 0) is true then we need to set ret = -EINVAL
> or something.  Really .n_sensors can't be negative.
>
> The name "out" is a crappy label name because it doesn't say what the
> goto does.  When I scroll down then it turns out that "goto out;" calls
> a free_everything() function.  That kind of error handling is always
> buggy.
>
> There are several typical bugs.  1) Something leaks because the error
> handling style is too complicated to be audited.  2)  Dereferencing
> uninitialized pointers.  3)  Undoing something which hasn't been done.
>
> I believe that in this case one bug is with the handling of the
> bridge.cio2_fwnode.  We "restore" it back to the original state
> as soon as we have a non-NULL bridge.cio2 instead of waiting until we
> have stored the original state.
>
> The best way to do error handling is this.
>
> Every function cleans up after itself.  The connect_supported_devices()
> function is a bit special because it's a loop.  I would would write it
> so that if it fails then it cleans up the partial loop iteration and
> then at the end it cleans up all the failed loop iterations.
>
> 	for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {
> 		a = frob();
> 		if (!a)
> 			goto unwind;
> 		b = frob();
> 		if (!b) {
> 			free(a);
> 			goto unwind;
> 		}
> 		...
> 	}
>
> 	return 0;
>
> unwind:
> 	for (i = 0; i < bridge.n_sensors; i++) {
> 		free(b);
> 		free(a);
> 	}
> 	bridge.n_sensors = 0;
>
> 	return ret;
>
> The problem with cio2_bridge_unregister_sensors() is that it doesn't
> clean up partial iterations through the loop.  (Missing calls to
> put_device(dev)).
>
> Loops are complicated but the rest is simple.  1) Every allocation
> function needs a matching cleanup function.  2) Use good label names
> which say what the goto does.  3)  The goto should free the most recent
> successful allocation.
>
> 	a = frob();
> 	if (!a)
> 		return -ENOMEM;
>
> 	b = frob();
> 	if (!b) {
> 		ret = -ENOMEM;
> 		goto free_a;
> 	}
>
> 	c = frob();
> 	if (!c) {
> 		ret = -ENOMEM;
> 		goto free_b;
> 	}
>
> 	return 0;
>
> free_b:
> 	free(b);
> free_a:
> 	free(a);
>
> 	return ret;
>
> The free function doesn't have any if statements.
>
> void free_function()
> {
> 	free(c);
> 	free(b);
> 	free(a);
> }
>
> The reviewer only needs to keep track of the most recent allocation
> and verify that the goto free_foo matches what should be freed.  This
> system means the code is auditable (no leaks), you never free anything
> which wasn't allocated.
>
This  section and the other comments on error handling was really
helpful - I appreciate you taking the time to explain so thoroughly.

