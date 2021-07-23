Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B204E3D377E
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 11:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbhGWIfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 04:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbhGWIfM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 04:35:12 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72690C061575;
        Fri, 23 Jul 2021 02:15:46 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id n11so391761wmd.2;
        Fri, 23 Jul 2021 02:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8ThJFqgWeiycqwtvT1dHyZJPJ8zhyvXzfD1Nh6rIvhU=;
        b=HkKIXrfmKrFWlNJjf7S2zDPtiy5WkTvrXLWuQCWh3EIu0m6su78OA2Y54NRO+u99cy
         B2TLRou7EyOS4khWauU5saYb1BL/0A4uuqVDm048pnUdgC02OTCoS/4VA5ybqOB8iWMG
         zlhStNabyIl2y2GmWOkBqX9KOkf6LCQKL7isJNFe2wf+QWi5vnRXMP7cHz2jvUGuLX8t
         4nllECMMruJ5Yd5LrumFShcRjdyfnTmlgZ9GunBcEI7RyyU8HocwQGLREQheIRBuWiSR
         rMyi5CrmT5V+0nM4TVGq0DRgtKrR2f7MmuGmR+yC7xo4kjcWpCpmkYHOe6aYW7Vw95Or
         nukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8ThJFqgWeiycqwtvT1dHyZJPJ8zhyvXzfD1Nh6rIvhU=;
        b=IY71GjG/He72A6ossUrHSHhp48galwtq4cNdgvjEwAvO8voR3CAJ0i3d/zcMUaAGEA
         B2DHyWgMWuS5pfW1oEcKgAkL2vlOxNvzHVKMoktiDHvRE5xie/tp0gzQL4rs1TqUHB24
         Nsx0SjUY3XNXx4Srn9pSuneF5R9v/xoblxn6Iu9V+wCK7nI3tEt3FtyRJjqqHLdc57bp
         n/BBQCQImxQ8T2ubnlrf/MOpWwW8cf6+JiXtf48gAUYkLPIWxdOoNZI+SR10p7RpSjtZ
         jYg9Np+yrhSqZpaU/Cm2Xxk6u55lZQ4DIkgIuVjVNsg+uhGP62ee0quySchfDfT34ZGz
         tW9Q==
X-Gm-Message-State: AOAM533zu9CLrbOI1q5Vz5G9kLggDUasWQg+w2a3vpgpkPJzelRwH/kF
        lXC9/InQl08biImK16TlOtY=
X-Google-Smtp-Source: ABdhPJxP86wb3d5go0KNo2uzZnlcKxHHleJ+obugtCaaCmI2C4X/n+y/8KysaSzK9nVbLT5Kabd2hg==
X-Received: by 2002:a05:600c:154a:: with SMTP id f10mr3405114wmg.183.1627031745054;
        Fri, 23 Jul 2021 02:15:45 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id d15sm32782043wri.39.2021.07.23.02.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 02:15:44 -0700 (PDT)
Subject: Re: [PATCH 03/13] media: i2c: Defer probe if not endpoint found
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210722203407.3588046-1-djrscally@gmail.com>
 <20210722203407.3588046-4-djrscally@gmail.com> <YPp0eCIawk2TGQ6Z@aptenodytes>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <32df477e-754d-4432-dddc-668596990dcf@gmail.com>
Date:   Fri, 23 Jul 2021 10:15:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPp0eCIawk2TGQ6Z@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul

On 23/07/2021 08:49, Paul Kocialkowski wrote:
> Hi Daniel,
>
> On Thu 22 Jul 21, 21:33, Daniel Scally wrote:
>> The ov8865 driver is one of those that can be connected to a CIO2
>> device by the cio2-bridge code. This means that the absence of an
>> endpoint for this device is not necessarily fatal, as one might be
>> built by the cio2-bridge when it probes. Return -EPROBE_DEFER if no
>> endpoint is found rather than a fatal error.
> Is this an error that you have actually seen in practice?


Yes

> My understanding is that this function should return the handle to the *local*
> fwnode graph endpoint, which relates to the static device-tree description
> and should be unrelated to another driver probing.
>
> So as far as I can see, this should not be needed (but correct me if I'm wrong).


It's a newly possible scenario - some laptops with Intel IPU3s have ACPI
that is _creative_,. and rather than define the endpoints in an ACPI
device's _DSD they're encoded within a buffer that's against the sensor
devices instead. We're parsing those out and building the fwnode graph
using software nodes in the ipu3-cio2 driver:


https://elixir.bootlin.com/linux/v5.14-rc2/source/drivers/media/pci/intel/ipu3/cio2-bridge.c#L166


But that means there's no endpoint for the sensor until ipu3-cio2 has
probed.


Thanks

Dan

>
> Cheers,
>
> Paul
>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  drivers/media/i2c/ov8865.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>> index 2ef146e7e7ef..66182142c28b 100644
>> --- a/drivers/media/i2c/ov8865.c
>> +++ b/drivers/media/i2c/ov8865.c
>> @@ -2796,10 +2796,8 @@ static int ov8865_probe(struct i2c_client *client)
>>  	/* Graph Endpoint */
>>  
>>  	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>> -	if (!handle) {
>> -		dev_err(dev, "unable to find endpoint node\n");
>> -		return -EINVAL;
>> -	}
>> +	if (!handle)
>> +		return -EPROBE_DEFER;
>>  
>>  	sensor->endpoint.bus_type = V4L2_MBUS_CSI2_DPHY;
>>  
>> -- 
>> 2.25.1
>>
