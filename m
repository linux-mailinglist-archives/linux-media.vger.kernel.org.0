Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25CF92754A1
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 11:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgIWJjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 05:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgIWJjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 05:39:20 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A51C0613CE;
        Wed, 23 Sep 2020 02:39:19 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z4so20251574wrr.4;
        Wed, 23 Sep 2020 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=D1hykoJlnCEeW9Ghu+9NT8UmdNa8KDWJIzw0nB++G+o=;
        b=aNZZ3zh3dXHZq+DEvmi7EBk7MW0F6CK2wfzsWMJi/8ksphUU3JgVFvXpnudNyt3YSG
         mVFenqW5r0JRO70qWqa9wmqnlwxBHrH+NqiadFbxeE/lGAhjtpBAAXmzUBs+sCJq+qn1
         DZbT59o/7j6ma2DJmPzo1nwjUeEWimkKNrYifnXRU03vECyGHTW4b/Ox0VaqAXSj0HGW
         wmiVetpwyPlDi7l/KCJxBHL6YFLEKUSPikWDm2BBLQ/wa+LE09UxwChRaIyGq5TZqxFm
         bosvRPYRrRPojzUcd6XrPsDwxGeOayfFDwAy1XF7p4b2iVwLkxQl3m3aTvlHu4l7QGS8
         IYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=D1hykoJlnCEeW9Ghu+9NT8UmdNa8KDWJIzw0nB++G+o=;
        b=W3uAn563S9JHHf9decIHERQdKF/K0XS1OJ7jiNiiuPYSdd9BNpbt2iuHC4Ec1ihtTp
         qaT+i4rP67uP7tYNN9dsTMWZW2RqZBV3cd1Y8MYrAEAPJL3qFyWFluX+2fRWim5TPLqa
         iWbBrflmU6HKf7/bAEr4Y6tvZdpTYACS6aFDRUacyIa3CwXKJOqo1eC19nXNU+IU04jd
         aSWY47xvyDqTi0dHF8ivoJYG/OsOBNysPfsaZYbJnHAQsKgxTLewT0Ua6tIcehN/VewI
         Bi/5zewMw4wtyIu3duCM4FhO+1FHHhjvTQpc38/myyKqQN1viPTFxAsY2k/sAWJd163j
         x56g==
X-Gm-Message-State: AOAM5323h8ofNCApCTIg/X3UAQgb97yFaK6SXTSOjiB+Jqn3dWJpdm0W
        H09v5jXqwUtXGxgqlQ6G+DI=
X-Google-Smtp-Source: ABdhPJza60wC4/rfImEEWz0r/cdUr/7aJlKJeSHoy/5KQ0fM/QJ0m+D6tCiwl/7pIL0vXx6Sonergw==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr9981993wrt.196.1600853957992;
        Wed, 23 Sep 2020 02:39:17 -0700 (PDT)
Received: from [192.168.1.211] ([95.144.134.217])
        by smtp.gmail.com with ESMTPSA id c205sm7680655wmd.33.2020.09.23.02.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 02:39:17 -0700 (PDT)
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
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <c2bb9d22-6914-ed59-6c77-a0020e2faed5@gmail.com>
Date:   Wed, 23 Sep 2020 10:39:16 +0100
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

Hi Sakari

On 17/09/2020 11:33, Sakari Ailus wrote:
>> +		ret = software_node_register_nodes(nodes);
>> +		if (ret) {
>> +			dev_err(dev,
>> +				"Failed to register software nodes for %s\n",
>> +				supported_devices[i]);
>> +			return ret;
>> +		}
>> +
>> +		fwnode = software_node_fwnode(&nodes[SWNODE_SENSOR_HID]);
>> +		if (!fwnode) {
>> +			dev_err(dev,
>> +				"Failed to get software node for %s\n",
>> +				supported_devices[i]);
>> +			return ret;
>> +		}
>> +
>> +		fwnode->secondary = ERR_PTR(-ENODEV);
>> +		dev->fwnode = fwnode;
>> +
>> +		/*
>> +		 * The device should by this point has driver_data set to an
>> +		 * instance of struct v4l2_subdev; set the fwnode for that too.
>> +		 */
>> +
>> +		sd = dev_get_drvdata(dev);
>> +		sd->fwnode = fwnode;
> I'm a bit lost here. Isn't it enough to have the sensor device's fwnode,
> and to use that for V4L2 async fwnode matching (as usual)?

Just working through the changes everyone's suggested for the v2. For
this one the reason it had to be this way is that
v4l2_async_register_subdev() just picks up the fwnode from the device.
If we wanted to just rely on that call as part of the sensor driver's
probe() then we need to reprobe() the sensor in case it already probed
before this code has managed to run, and reprobing after assigning the
software_nodes as fwnode to the sensor no longer works - the long and
short of that is that the ACPI matching portion of i2c_device_match()
calls ACPI_COMPANION(dev), and that macro relies on dev->fwnode->ops
being acpi_device_fwnode_ops which they no longer are. This is also the
reason I was storing the original fwnode's of the sensor device and cio2
device in the cio2-bridge; so that they could be restored if the module
was removed.



