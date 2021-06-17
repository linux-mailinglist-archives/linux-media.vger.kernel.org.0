Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304823AB452
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 15:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhFQNMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 09:12:01 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:8260 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbhFQNMA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 09:12:00 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G5Mhw3F5nz1BNCr;
        Thu, 17 Jun 2021 21:04:48 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 21:09:51 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 21:09:50 +0800
Subject: Re: [PATCH -next v4] media: staging: atomisp: use list_splice_init in
 atomisp_compat_css20.c
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <kaixuxia@tencent.com>,
        <gustavoars@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <weiyongjun1@huawei.com>, <yuehaibing@huawei.com>,
        <yangjihong1@huawei.com>, <yukuai3@huawei.com>
References: <20210617124709.670936-1-libaokun1@huawei.com>
 <YMtGPPgM+zv0iL5u@smile.fi.intel.com>
From:   "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <1f6e8096-3072-0535-f91d-e3c7e6046ca7@huawei.com>
Date:   Thu, 17 Jun 2021 21:09:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YMtGPPgM+zv0iL5u@smile.fi.intel.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry, I'm in bad shape today.

I replied to this v4 patch to remind people to ignore it.

And I send a v5 patch to fix it.

You can refresh your mail list.

Best Regards.


ÔÚ 2021/6/17 20:55, Andy Shevchenko Ð´µÀ:
> On Thu, Jun 17, 2021 at 08:47:09PM +0800, Baokun Li wrote:
>> Using list_splice_init() instead of entire while-loops
>> in atomisp_compat_css20.c.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Baokun Li <libaokun1@huawei.com>
>> ---
> You missed changelog.
> And I believe you missed the changes.
> So, what's the point?
>
