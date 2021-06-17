Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8E73AB518
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 15:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhFQNrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 09:47:01 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:7475 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbhFQNrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 09:47:00 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G5NWk21c9zZdR8;
        Thu, 17 Jun 2021 21:41:54 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 21:44:50 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 21:44:49 +0800
Subject: Re: [PATCH -next v5] media: staging: atomisp: use list_splice_init in
 atomisp_compat_css20.c
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <kaixuxia@tencent.com>,
        <gustavoars@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <weiyongjun1@huawei.com>, <yuehaibing@huawei.com>,
        <yangjihong1@huawei.com>, <yukuai3@huawei.com>,
        Hulk Robot <hulkci@huawei.com>
References: <20210617125357.675562-1-libaokun1@huawei.com>
 <YMtNh+yZAthTjFJn@smile.fi.intel.com>
From:   "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <045418a7-181b-d11f-4c6f-5bfcb6d65c22@huawei.com>
Date:   Thu, 17 Jun 2021 21:44:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YMtNh+yZAthTjFJn@smile.fi.intel.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for your advice.

I'm about to send a patch v6 with the changes suggested by you.

Best Regards.


�� 2021/6/17 21:26, Andy Shevchenko д��:
> On Thu, Jun 17, 2021 at 08:53:57PM +0800, Baokun Li wrote:
>> Using list_splice_init() instead of entire while-loops
>> in atomisp_compat_css20.c.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Baokun Li <libaokun1@huawei.com>
>> ---
>> V1->V2:
>> 	CC mailist
>> V2->V3:
>>          Using list_move_tail() -> Using list_splice_init()
>> V3->V4:
>>          Remove redundant 'asd->'
>> V4->V5:
>>          Add the version information for 'V3->V4:'
> What about
>
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2107:31: warning: unused variable 'md_buf' [-Wunused-variable]
> 2107 |  struct atomisp_metadata_buf *md_buf;
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2106:26: warning: unused variable 'dis_buf' [-Wunused-variable]
> 2106 |  struct atomisp_dis_buf *dis_buf;
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2105:26: warning: unused variable 's3a_buf' [-Wunused-variable]
> 2105 |  struct atomisp_s3a_buf *s3a_buf;
>
> ?
>
