Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5F926F7D7
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 10:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbgIRISC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 04:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgIRISC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 04:18:02 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67E2C061797;
        Fri, 18 Sep 2020 01:09:40 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k18so4585907wmj.5;
        Fri, 18 Sep 2020 01:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gIrm1k0wpBO+eG/xwOUwVK1CI6UvN3iLydbukNax9ZE=;
        b=jtE79XAVK5733uuedxsF172ExqK61Iq/tIYkEbK22R/GQJ15ULvPNA88TJx4Vg5kxu
         dUOVOh1VWe5yU5c6fdiBHZmu8RcVYTmnMg8IHx4SCoTxkhERu4iiuBilqG/KDHirNoQ8
         aXSI0aqdZmoM28b9brmY/VnOPfT5hpMtG7ensFCr/wHab8o0RxrYFpa38BqagGuO0OD+
         z88WHZ+Xe+uvPLQqr26relcJxObDz4Kvi+54kCUNrZbLCZEhsWJOQV3bP/Ics+Tt5+5H
         r1jy7C6RrgAVW0/4GpibBZ2vwT9nP5Lwtt+8dUpF2rTKEYLOLVWBxvGhDT2a2b0yI4+b
         gwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gIrm1k0wpBO+eG/xwOUwVK1CI6UvN3iLydbukNax9ZE=;
        b=en2CJg8snyCrhoQmjN5xWowpJv8fNv7I/K41o3vydH8HnlqlfKFgneZOdsf1SFehdf
         7ZrnfxM1Ye0cuepKQUAcglNdQsWnZyS5gsxVybaUN7peyr/GtWp8MqOdhQBfd61Eg1x6
         j/82CghuWG6Wqh93/YPKxSi3r/hnHISbscncnLYzYoeEYywXzzX3tTI/fwP8I9iAcmu2
         vx10wsLdkP3kNJRC440D9PMWwLPbrv5lBAgVyQCk4C9ihVXOIjFEPaj3Riss6aTsiEWo
         siA/BIKV/AYe+IB82rIKRtxamyQncz41AdZjZW1BrqknTlsvzW28yMIjZZplR+BWmOPX
         auzA==
X-Gm-Message-State: AOAM530xb295paa83BbncaXmCt3OPsFQig/+xYj2p8L5nwEt9Iv09DsN
        gA9UeDi+lrj/0JTdBWQ1Eaw9xpXZGnpVKQK2
X-Google-Smtp-Source: ABdhPJxJ0IwUFY6Xv/t+mR5ajPysGzi/rS/mCDNnoE1QdqD15G5LwitAj581stJGotZV+zRvcolD5g==
X-Received: by 2002:a1c:bbd7:: with SMTP id l206mr15100540wmf.185.1600416579489;
        Fri, 18 Sep 2020 01:09:39 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id 63sm4053820wrh.71.2020.09.18.01.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 01:09:38 -0700 (PDT)
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
 <20200918080335.GT4282@kadam>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <e9d19d97-7733-04aa-2c61-e7e367a97baa@gmail.com>
Date:   Fri, 18 Sep 2020 09:09:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918080335.GT4282@kadam>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ah, shoot - good spot, thanks

On 18/09/2020 09:03, Dan Carpenter wrote:
> I ran Smatch over the code and it spotted an off by one.
>
> On Wed, Sep 16, 2020 at 10:36:18PM +0100, Daniel Scally wrote:
>> +#define MAX_CONNECTED_DEVICES			4
>> +#define SWNODE_SENSOR_HID			0
>> +#define SWNODE_SENSOR_PORT			1
>> +#define SWNODE_SENSOR_ENDPOINT			2
>> +#define SWNODE_CIO2_PORT			3
>> +#define SWNODE_CIO2_ENDPOINT			4
>> +#define SWNODE_NULL_TERMINATOR			5
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>> +struct sensor {
>> +	struct device *dev;
>> +	struct software_node swnodes[5];
>                              ^^^^^^^^^^
> This needs to be 6 instead of 5 to prevent memory corruption.
>
>> +	struct property_entry sensor_props[6];
>> +	struct property_entry cio2_props[3];
>> +	struct fwnode_handle *fwnode;
>> +};
>
>> +		nodes[SWNODE_NULL_TERMINATOR]   = SOFTWARE_NODE_NULL;
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Here.
>
> regards,
> dan carpenter
>
