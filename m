Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6CF27ACFF
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 13:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgI1LiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 07:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgI1LiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 07:38:04 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84BA4C061755;
        Mon, 28 Sep 2020 04:38:04 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so940228wrs.5;
        Mon, 28 Sep 2020 04:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/DSfl3PhmxyqK4cCLrMlHEsrYZk0SosXscE+a3oAY9s=;
        b=BKUXY08CAONse8WpQ7sUrmd1q/uBCMq1YsJ7kY2YHySsvfSynLm2E6t5oCMCNvBn2T
         V4kwJbsEvli/SsBH76PZ7yPrZZ+nOkqXa5wFpaDpSt3EVO95vRFKVDEcRupq1zSENVb0
         L6inXyTM8LbbJyYQgch0NOpYZ23Yfo2agilZtogNs3qd4r9kLZqk7pOsAVu9gJtAQOP0
         ec6FQQWIk+srdEQdJH3nEMM6XyGzZaHgBRDDrzcGVoiWMllGCbeEIwrOiMj/ceNymZ1A
         oJpP1+GJ2hKsSURadWl+NIetcMzZMmtoSLAgskc/RKuJlRNzarujyV7A2TAUGtFdZQLg
         aszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/DSfl3PhmxyqK4cCLrMlHEsrYZk0SosXscE+a3oAY9s=;
        b=Prov/8FczqIOF0l5/cVWCwQs9yS+eC/DHRnEkNlqQ01RHQQIW/pIju8EzLiHKcFmW1
         DkoLNE9ahEfiiv5hfivMWIJm4NuLT8akrCUdBXeMqS+qAyNZ7ple+VaGOO64XgK8KbC5
         86kAy7NsTbJJZlMhbBPpltZ6oZ0eA9mSLJ7b85KJbFzDkVfo2oKufUZaSCSLGJg83U0A
         m4FWTVANh4ngyvcVE1Ltnu/Ntb0K6LUc2qPxcLHfYj4CoaXrGyHKkPyFwQp2BCZKWZHt
         zhk5KMe9VPp3IkxAMfaSm1vtq4cTY9OR3eFOS4R9H8IWN7FknvgqHwrc5W7JfL5vDsmP
         IB5g==
X-Gm-Message-State: AOAM532Qdp0laX0TjgGFq96ibAko3YeVipZYAkmvJhT066ThMzMnk4kD
        h7wYdKSoKlf1xk42WZCxxAM=
X-Google-Smtp-Source: ABdhPJzqVbAgm8Mpq/f7Lw5cB88wTQXRr/O+Mg6pfxX0WJsJ3kspBzf3nQPqzm47Ga4SBXFb3SkYLA==
X-Received: by 2002:adf:ec92:: with SMTP id z18mr1317347wrn.53.1601293077673;
        Mon, 28 Sep 2020 04:37:57 -0700 (PDT)
Received: from [192.168.1.211] ([95.144.134.217])
        by smtp.gmail.com with ESMTPSA id r14sm1028721wrn.56.2020.09.28.04.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 04:37:56 -0700 (PDT)
From:   Dan Scally <djrscally@gmail.com>
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        davem@davemloft.net, robh@kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        kieran.bingham@ideasonboard.com, andriy.shevchenko@linux.intel.com
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917103343.GW26842@paasikivi.fi.intel.com>
Message-ID: <060b458e-66ee-ab22-5c4c-c8e04affff7b@gmail.com>
Date:   Mon, 28 Sep 2020 12:37:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917103343.GW26842@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/09/2020 11:33, Sakari Ailus wrote:
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
> I suppose the CSI-2 link frequency is generally encoded in drivers in this
> case. A lot of drivers already check for those, could you add the
> frequencies here as well (as they are known)?

This one caused me some consternation; I mentioned in a previous email
that I was overwriting the v4l2_subdev's fwnode directly because I
couldn't reprobe() the devices after changing their fwnode. Turns out
that's probably not ok, because as you point out there are some drivers
that check for properties in firmware as part of their .probe() call, so
they _have_ to be there for those to work (including ov5670, which is
the canonical ipu3 driver in the kernel docs). imx258 and ov13858 are
also affected, and I'm aware of at least one other driver in development
that would be affected.


The problem preventing the reprobe working is that i2c_device_match()
relies on a device's fwnode having acpi_device_fwnode_ops to perform
ACPI matching, so after giving the device our software nodes the
matching just fails. I thrashed out a way to make the reprobe work, but
I don't really like the solution so I wanted to talk about it. The long
story short is; clone the driver but add an i2c_device_id matching the
existing i2c_client's name, then use i2c_add_driver() to install it to
the bus before calling device_reprobe(). This does work; it makes the
devices reprobe cleanly at the end of cio2-bridge's init, but it feels a
little bit hacky. Any thoughts? Or if it makes it easier to discuss, I
can just post the v2 containing all the changes that people suggested
after the v1, and showing how this reprobe would work.

