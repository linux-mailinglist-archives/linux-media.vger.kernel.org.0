Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF4D97BC700
	for <lists+linux-media@lfdr.de>; Sat,  7 Oct 2023 13:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343841AbjJGLKi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Oct 2023 07:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343837AbjJGLKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Oct 2023 07:10:37 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE991A6
        for <linux-media@vger.kernel.org>; Sat,  7 Oct 2023 04:10:35 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S2jCz2R7lzNpBj;
        Sat,  7 Oct 2023 19:06:39 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 7 Oct 2023 19:10:33 +0800
Message-ID: <4c6d5adf-8bb7-f85c-be21-64c5e45dfd07@huawei.com>
Date:   Sat, 7 Oct 2023 19:10:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [DKIM] [PATCH 2/2] media: siano: Fix the missing err path in
 smsdvb_debugfs_create()
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
        <ye.xingchen@zte.com.cn>, <linux-media@vger.kernel.org>
References: <20230914035035.3765754-1-ruanjinjie@huawei.com>
 <20230914035035.3765754-3-ruanjinjie@huawei.com>
 <034593fe-2c28-4847-9e52-1c01680c5743@xs4all.nl>
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <034593fe-2c28-4847-9e52-1c01680c5743@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2023/10/5 16:30, Hans Verkuil wrote:
> On 14/09/2023 05:50, Jinjie Ruan wrote:
>> If kzalloc() fails in smsdvb_debugfs_create(), the dir and file which
>> is created by debugfs_create_dir() and debugfs_create_file() is
>> not freed. So use debugfs_remove_recursive() to free them.
>>
>> Fixes: 503efe5cfc9f ("[media] siano: split debugfs code into a separate file")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/media/common/siano/smsdvb-debugfs.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/common/siano/smsdvb-debugfs.c b/drivers/media/common/siano/smsdvb-debugfs.c
>> index 16d3b9ab31c5..38b25e88ce57 100644
>> --- a/drivers/media/common/siano/smsdvb-debugfs.c
>> +++ b/drivers/media/common/siano/smsdvb-debugfs.c
>> @@ -375,8 +375,10 @@ int smsdvb_debugfs_create(struct smsdvb_client_t *client)
>>  	}
>>  
>>  	debug_data = kzalloc(sizeof(*client->debug_data), GFP_KERNEL);
>> -	if (!debug_data)
>> +	if (!debug_data) {
>> +		debugfs_remove_recursive(client->debugfs);
>>  		return -ENOMEM;
>> +	}
>>  
>>  	client->debug_data        = debug_data;
>>  	client->prt_dvb_stats     = smsdvb_print_dvb_stats;
> 
> It's much better to first allocate debug_data before calling debugfs_create_dir.

Right! After that the code will be more cleaner.

> 
> No need to clean anything up in that case.
> 
> You can also ignore any errors from debugfs_create_file.
> 
> Regards,
> 
> 	Hans
> 
