Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6865E6377B5
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 12:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiKXLbc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 06:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbiKXLbS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 06:31:18 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01176D4BB
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 03:31:17 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NHwm4167HzRnsC;
        Thu, 24 Nov 2022 19:30:44 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 19:31:15 +0800
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
To:     Charan Teja Kalla <quic_charante@quicinc.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "T.J. Mercier" <tjmercier@google.com>
CC:     <sumit.semwal@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
 <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
 <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
 <2c9fa595-e788-5474-4f2b-ffbd08a70d13@amd.com>
 <CABdmKX0KJJV0iQwy0aUNXcLc1DGyLjmh6_Y53asHEoh-uyHzAA@mail.gmail.com>
 <83944425-c177-7918-bcde-9cf7296a613f@amd.com>
 <e12784da-b3e3-ddec-0e84-f968d60097c4@quicinc.com>
From:   cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <ef22322b-0134-3d63-f7c5-97f240ae7fd8@huawei.com>
Date:   Thu, 24 Nov 2022 19:31:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e12784da-b3e3-ddec-0e84-f968d60097c4@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks T.J and Christian, thanks everyone for taking time to review this patch.

Charan, actually I don't have a good patch to to fix it, if you can submit
a new patch to solve it, please feel free to do it.

By the way, I'd appreciate it if you could send to me the new patch when you submit it.

Thanks again!

Gaosheng.

On 2022/11/24 13:56, Charan Teja Kalla wrote:
> Thanks T.J and Christian for the inputs.
>
> On 11/19/2022 7:00 PM, Christian König wrote:
>>>      Yes, exactly that's the idea.
>>>
>>>      The only alternatives I can see would be to either move allocating
>>>      the
>>>      file and so completing the dma_buf initialization last again or just
>>>      ignore errors from sysfs.
>>>
>>>      > If we still want to avoid calling dmabuf->ops->release(dmabuf) in
>>>      > dma_buf_release like the comment says I guess we could use
>>>      sysfs_entry
>>>      > and ERR_PTR to flag that, otherwise it looks like we'd need a bit
>>>      > somewhere.
>>>
>>>      No, this should be dropped as far as I can see. The sysfs cleanup
>>>      code
>>>      looks like it can handle not initialized kobj pointers.
>>>
>>>
>>> Yeah there is also the null check in dma_buf_stats_teardown() that
>>> would prevent it from running, but I understood the comment to be
>>> referring to the release() dma_buf_ops call into the exporter which
>>> comes right after the teardown call. That looks like it's preventing
>>> the fput task work calling back into the exporter after the exporter
>>> already got an error from dma_buf_export(). Otherwise the exporter
>>> sees a release() for a buffer that it doesn't know about / thinks
>>> shouldn't exist. So I could imagine an exporter trying to double free:
>>> once for the failed dma_buf_export() call, and again when the
>>> release() op is called later.
>>
>> Oh, very good point as well. Yeah, then creating the file should
>> probably come last.
>>
> @Gaosheng: Could you please make these changes or you let me to do?
>
>> Regards,
>> Christian.
> .
