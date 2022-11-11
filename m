Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B855A6256F4
	for <lists+linux-media@lfdr.de>; Fri, 11 Nov 2022 10:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbiKKJjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Nov 2022 04:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbiKKJjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Nov 2022 04:39:03 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62273627C6
        for <linux-media@vger.kernel.org>; Fri, 11 Nov 2022 01:39:02 -0800 (PST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N7tts0sR3zmVrN;
        Fri, 11 Nov 2022 17:38:45 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 11 Nov 2022 17:39:00 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 11 Nov 2022 17:39:00 +0800
Subject: Re: [PATCH] media: v4l2-dev: fix possible name leak in
 __video_register_device()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
        <yangyingliang@huawei.com>
References: <20221111085809.1676804-1-yangyingliang@huawei.com>
 <Y24TqcR9Hgy+R82/@pendragon.ideasonboard.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <2df74d55-f96f-2caf-cfa7-b6bf7f4f5076@huawei.com>
Date:   Fri, 11 Nov 2022 17:38:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y24TqcR9Hgy+R82/@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2022/11/11 17:19, Laurent Pinchart wrote:
> On Fri, Nov 11, 2022 at 04:58:09PM +0800, Yang Yingliang wrote:
>> Afer commit 1fa5ae857bb1 ("driver core: get rid of struct device's
>> bus_id string array"), the name of device is allocated dynamically,
>> so call kfree_const() to freed it in error case.
>>
>> Fixes: 1fa5ae857bb1 ("driver core: get rid of struct device's bus_id string array")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-dev.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index 397d553177fa..1fce1c29c60f 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -1036,6 +1036,9 @@ int __video_register_device(struct video_device *vdev,
>>   	ret = device_register(&vdev->dev);
>>   	if (ret < 0) {
>>   		pr_err("%s: device_register failed\n", __func__);
>> +		kfree_const(vdev->dev.kobj.name);
>> +		/* set it to null to avoid callers using a bad pointer */
>> +		vdev->dev.kobj.name = NULL;
> This doesn't seem right to me. We shouldn't be poking into the kobj.
> This should be handled in the driver core, or if that can't be done for
> a reason specific to how the device is used in the V4L2 core, we need a
> helper function from the driver core to perform the cleanup.
In technical, we should call put_device() here, but the release() 
function has not been set
in this case.
May be we should  move 'vdev->dev.release = v4l2_device_release' before 
device_register(),
then call put_device() to fix it.

Thanks,
Yang
>
>>   		goto cleanup;
>>   	}
>>   	/* Register the release callback that will be called when the last
