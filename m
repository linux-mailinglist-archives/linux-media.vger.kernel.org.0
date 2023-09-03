Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 501BD790B21
	for <lists+linux-media@lfdr.de>; Sun,  3 Sep 2023 09:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbjICHQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Sep 2023 03:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjICHQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Sep 2023 03:16:50 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CBF197
        for <linux-media@vger.kernel.org>; Sun,  3 Sep 2023 00:16:47 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Rdjfd4hB6zQjKw;
        Sun,  3 Sep 2023 15:13:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sun, 3 Sep 2023 15:16:45 +0800
Message-ID: <035206b9-55c2-8575-7cf8-b52284eb32c8@huawei.com>
Date:   Sun, 3 Sep 2023 15:16:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v2 0/2] media: cx231xx: Add two macros and switch to
 use kmemdup() helper
Content-Language: en-US
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        <mchehab@kernel.org>, <linux-media@vger.kernel.org>
References: <20230822111832.822367-1-ruanjinjie@huawei.com>
 <52da36a4-b69a-931d-2937-164fa99e79c0@collabora.com>
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <52da36a4-b69a-931d-2937-164fa99e79c0@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2023/9/1 3:05, Andrzej Pietrasiewicz wrote:
> Hi Jinjie,
> 
> W dniu 22.08.2023 o 13:18, Jinjie Ruan pisze:
>> As Andrzej suggested, add BUF_SIZE and TIMEOUT_MS macros to replace
>> the magic constant 4096 and 2000.
>>
>> On the other hand, use kmemdup() helper instead of open-coding to
>> simplify the code.
>>
> 
> Sorry about the delay.
> 
> I think I'd prefer the kmemdup() patch as the first one so that it does not
> depend on the patch adding the macros. And then the one adding the macros
> becomes optional.
> 
> Speaking about the latter, maybe BUF_SIZE and TIMEOUT_MS are a bit too
> vague?
> No strong opinion, though. Also, BUF_SIZE is suspiciously identical to
> PAGE_SIZE on some/many architectures. Any thoughts about it?

So just use the PAGE_SIZE macro?

> 
> Regards,
> 
> Andrzej
> 
>> Jinjie Ruan (2):
>>    media: cx231xx: Add BUF_SIZE and TIMEOUT_MS macros
>>    media: cx231xx: Switch to use kmemdup() helper
>>
>>   drivers/media/usb/cx231xx/cx231xx-core.c | 7 +++----
>>   drivers/media/usb/cx231xx/cx231xx.h      | 3 +++
>>   2 files changed, 6 insertions(+), 4 deletions(-)
>>
> 
