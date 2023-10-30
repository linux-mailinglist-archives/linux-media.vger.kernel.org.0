Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39ADD7DB58E
	for <lists+linux-media@lfdr.de>; Mon, 30 Oct 2023 09:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbjJ3I7M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Oct 2023 04:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbjJ3I7K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Oct 2023 04:59:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B019D
        for <linux-media@vger.kernel.org>; Mon, 30 Oct 2023 01:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698656300;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Oa//zgUXQMfAlhdIIBCl3XUCsOjsBUsQyyqT5VJvAxA=;
        b=RFWEYGE/KLAQOmoOxFYhw451lH5hZetunJhO64gCNVg2+YoBTUJJQ+7Sr9cfSm7xjiCZ44
        MnxbKqQmx1HYJ9vtMEZ4+hqJCJHMXps5sVjSy1/DG4+QkdKs+C06vWIcuL8Zo+rB8Qz2QN
        CdiweRFG9L5X6u8qYC91f0guXHrikaQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-Kl99Z0LZO5u8dQwTqeFd8A-1; Mon, 30 Oct 2023 04:58:19 -0400
X-MC-Unique: Kl99Z0LZO5u8dQwTqeFd8A-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5402e97fdd1so3081265a12.0
        for <linux-media@vger.kernel.org>; Mon, 30 Oct 2023 01:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698656298; x=1699261098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oa//zgUXQMfAlhdIIBCl3XUCsOjsBUsQyyqT5VJvAxA=;
        b=mXd3T5cHdaOl2/xd/jrlucTQX37n5xnsdnxOQGI0t7krDwnmOpaH1QF9HYkBRZRMIi
         wjm1gLwgvgdcF/d3umKs3hnAE1KGVo25Dekcq2J5AFbSYD6e/VP19n7MJxtFU8xjYLEd
         pJQPLKxWasG2LEMZJhf6IY4E6y414dwSkVoGtOsMgBOfzBV3iKV+PtczkwgS19vGXe4I
         /xdgjNjtGLcDdddSE5vsBtmXXRaAOV26YMR9+nv/dQ9IYV2zI9c6lYgiC7Sm9yKodo64
         cELgd0/XrODnY2QNEk5qIwpMMS2T9Tc9j8wWgilJmNcCT8VSu/hniHxKaiu5eimRf1gY
         /lVQ==
X-Gm-Message-State: AOJu0Yw5ZskFA1ZU85sL0Tq2dRSYlyBNC+TYGi6HaKMG7eHf8/vBafkI
        2Npojn5MOE97d/PChwCLt9ngiRCVtptxljF0oGY9lE0NGFWz4I4a3eG33mHpozMNG9gyGgssUWl
        wH7kJ+yv+huwMNo8H5xZtxYk=
X-Received: by 2002:a50:bae1:0:b0:53e:7ef9:a8cc with SMTP id x88-20020a50bae1000000b0053e7ef9a8ccmr8526095ede.0.1698656298278;
        Mon, 30 Oct 2023 01:58:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV/5yaXOo6Gs8rURf+eyZJ066A1+JDl9YxX61LGo70afnSfS0wrw5wgGCMZNWHH2waAUNUCg==
X-Received: by 2002:a50:bae1:0:b0:53e:7ef9:a8cc with SMTP id x88-20020a50bae1000000b0053e7ef9a8ccmr8525724ede.0.1698656290827;
        Mon, 30 Oct 2023 01:58:10 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id k10-20020aa7d8ca000000b0053d9f427a6bsm5758243eds.71.2023.10.30.01.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 01:58:10 -0700 (PDT)
Message-ID: <8ec5d2b6-8f35-48dd-bb09-4e214415d643@redhat.com>
Date:   Mon, 30 Oct 2023 09:58:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-12-hdegoede@redhat.com>
 <d1736dfb-e66c-2497-a71b-97f2e28f435f@linux.intel.com>
 <ZT9vfSpEyVk_pO0H@kekkonen.localdomain>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZT9vfSpEyVk_pO0H@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/30/23 09:55, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Mon, Oct 30, 2023 at 04:30:39PM +0800, Bingbu Cao wrote:
>>> +static void intel_cio2_bridge_instantiate_vcm_work(struct work_struct *_work)
>>> +{
>>> +	struct intel_cio2_bridge_instantiate_vcm_work_data *work =
>>> +		container_of(_work,
>>> +			     struct intel_cio2_bridge_instantiate_vcm_work_data,
>>> +			     work);
>>> +	struct acpi_device *adev = ACPI_COMPANION(work->sensor);
>>> +	struct i2c_client *vcm_client;
>>> +	bool put_fwnode = true;
>>> +	int ret;
>>>  
>>> -	snprintf(name, sizeof(name), "%s-VCM", acpi_dev_name(sensor->adev));
>>> -	board_info.dev_name = name;
>>> -	strscpy(board_info.type, sensor->vcm_type, ARRAY_SIZE(board_info.type));
>>> -	board_info.swnode = &sensor->swnodes[SWNODE_VCM];
>>> -
>>> -	sensor->vcm_i2c_client =
>>> -		i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(sensor->adev),
>>> -					      1, &board_info);
>>> -	if (IS_ERR(sensor->vcm_i2c_client)) {
>>> -		dev_warn(&sensor->adev->dev, "Error instantiation VCM i2c-client: %ld\n",
>>> -			 PTR_ERR(sensor->vcm_i2c_client));
>>> -		sensor->vcm_i2c_client = NULL;
>>> +	/*
>>> +	 * The client may get probed before the device_link gets added below
>>> +	 * make sure the sensor is powered-up during probe.
>>> +	 */
>>> +	ret = pm_runtime_get_sync(work->sensor);
>>> +	if (ret < 0) {
>>> +		dev_err(work->sensor, "Error %d runtime-resuming sensor, cannot instantiate VCM\n",
>>> +			ret);
>>> +		goto out;
>>>  	}
>>
>> One question here: how do we make sure that the runtime PM of the sensor
>> is enabled during the .bound callback? Or is it a mandatory requirement
>> of driver of such camera sensors?
> 
> The sensor driver needs to enable runtime PM in probe, otherwise this won't
> work. But I don't see why a driver wouldn't? Of course otherwise it
> wouldn't be a hard requirement.

Right. I believe that having runtime pm support is more or less a hard
requirement for sensor drivers used on x86. This is also necessary in
cases where the power on/off sequence is (partially) implemented in
ACPI AML code in the _PS0 and _PS3 methods of the sensor's ACPI device.

This happens on [atom]ISP2 based devices and AFAIK also on ChromeOS
devices.

So I think it is safe to assume that sensor drivers implement runtime
pm support and in cases where the driver does not we need to fix the driver.

Regards,

Hans

