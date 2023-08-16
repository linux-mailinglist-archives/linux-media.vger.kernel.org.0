Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4EE77DA71
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 08:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242111AbjHPGZV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 02:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242122AbjHPGZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 02:25:01 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2D31FC1
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 23:24:58 -0700 (PDT)
Received: from dggpeml500003.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RQdLs07GdzNmsZ;
        Wed, 16 Aug 2023 14:21:25 +0800 (CST)
Received: from [10.174.177.173] (10.174.177.173) by
 dggpeml500003.china.huawei.com (7.185.36.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 16 Aug 2023 14:24:56 +0800
Message-ID: <ca3a97d6-79a0-0d0f-d7fb-bd5dc3ca4380@huawei.com>
Date:   Wed, 16 Aug 2023 14:24:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] media: use struct_size() helper
Content-Language: en-US
To:     Tomasz Figa <tfiga@chromium.org>
CC:     <m.szyprowski@samsung.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <liwei391@huawei.com>
References: <20230816014921.2990087-1-liaoyu15@huawei.com>
 <CAAFQd5Cua7mF5o1ewVz-O7GGoJ5gms1L_qXtdsfnqU0wVgQGPQ@mail.gmail.com>
From:   Yu Liao <liaoyu15@huawei.com>
In-Reply-To: <CAAFQd5Cua7mF5o1ewVz-O7GGoJ5gms1L_qXtdsfnqU0wVgQGPQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.173]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500003.china.huawei.com (7.185.36.200)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2023/8/16 13:12, Tomasz Figa wrote:
> Hi Yu,
> 
> 
> On Wed, Aug 16, 2023 at 10:52 AM Yu Liao <liaoyu15@huawei.com> wrote:
>>
>> Prefer struct_size_t() over open-coded versions of idiom:
>>
>> sizeof(struct-with-flex-array) + sizeof(typeof-flex-array-elements) * count
>>
>> where count is the max number of items the flexible array is supposed to
>> contain.
> 
> Thanks for the patch. Please see my comment inline.
> 
>>
>> Signed-off-by: Yu Liao <liaoyu15@huawei.com>
>> ---
>>  drivers/media/common/videobuf2/frame_vector.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
>> index 0f430ddc1f67..c6bb88859e2a 100644
>> --- a/drivers/media/common/videobuf2/frame_vector.c
>> +++ b/drivers/media/common/videobuf2/frame_vector.c
>> @@ -157,7 +157,7 @@ EXPORT_SYMBOL(frame_vector_to_pfns);
>>  struct frame_vector *frame_vector_create(unsigned int nr_frames)
>>  {
>>         struct frame_vector *vec;
>> -       int size = sizeof(struct frame_vector) + sizeof(void *) * nr_frames;
>> +       int size = struct_size_t(struct frame_vector, ptrs, nr_frames);
> 
> Would struct_size() be more appropriate here, since we have vec declared above?
> 
> Best regards,
> Tomasz
Hi Tomasz,

Thank you for the review. I'll make the suggested changes and send you
the V2.

Best regards,
Yu
> 
>>
>>         if (WARN_ON_ONCE(nr_frames == 0))
>>                 return NULL;
>> --
>> 2.25.1
>>

