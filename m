Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8BC3A3CE2
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 09:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbhFKHVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 03:21:48 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3960 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbhFKHVq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 03:21:46 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G1XG16kQKz6ty6;
        Fri, 11 Jun 2021 15:16:41 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 15:19:47 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 15:19:46 +0800
Subject: Re: [PATCH -next v2] media: staging: atomisp: use list_move_tail
 instead of list_del/list_add_tail in atomisp_compat_css20.c
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kaixu Xia <kaixuxia@tencent.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        YueHaibing <yuehaibing@huawei.com>, <yangjihong1@huawei.com>,
        <yukuai3@huawei.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        <linux-staging@lists.linux.dev>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
References: <20210609072409.1357327-1-libaokun1@huawei.com>
 <CAHp75VesvRMGY25WP-ZQaqWE-kyyp25GsvM8h=yMfO5U6r1gDA@mail.gmail.com>
From:   "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <bce97c2b-9bf1-ee78-6c7a-93285d02d0d7@huawei.com>
Date:   Fri, 11 Jun 2021 15:19:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VesvRMGY25WP-ZQaqWE-kyyp25GsvM8h=yMfO5U6r1gDA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for your advice. That's a great idea.

I'm about to send a patch v3 with the changes suggested by you.

Best Regards


在 2021/6/10 2:17, Andy Shevchenko 写道:
> On Wed, Jun 9, 2021 at 4:32 PM Baokun Li <libaokun1@huawei.com> wrote:
>> Using list_move_tail() instead of list_del() + list_add_tail() in atomisp_compat_css20.c.
> Have you considered using list_splice() instead of entire while-loops?
> Or something similar from list.h...
>
>>          while (!list_empty(&asd->s3a_stats_in_css)) {
>>                  s3a_buf = list_entry(asd->s3a_stats_in_css.next,
>>                                       struct atomisp_s3a_buf, list);
>> -               list_del(&s3a_buf->list);
>> -               list_add_tail(&s3a_buf->list, &asd->s3a_stats);
>> +               list_move_tail(&s3a_buf->list, &asd->s3a_stats);
>>          }
>>          while (!list_empty(&asd->s3a_stats_ready)) {
>>                  s3a_buf = list_entry(asd->s3a_stats_ready.next,
>>                                       struct atomisp_s3a_buf, list);
>> -               list_del(&s3a_buf->list);
>> -               list_add_tail(&s3a_buf->list, &asd->s3a_stats);
>> +               list_move_tail(&s3a_buf->list, &asd->s3a_stats);
>>          }
>>          while (!list_empty(&asd->dis_stats_in_css)) {
>>                  dis_buf = list_entry(asd->dis_stats_in_css.next,
>>                                       struct atomisp_dis_buf, list);
>> -               list_del(&dis_buf->list);
>> -               list_add_tail(&dis_buf->list, &asd->dis_stats);
>> +               list_move_tail(&dis_buf->list, &asd->dis_stats);
>>          }
>>                  while (!list_empty(&asd->metadata_in_css[i])) {
>>                          md_buf = list_entry(asd->metadata_in_css[i].next,
>>                                              struct atomisp_metadata_buf, list);
>> -                       list_del(&md_buf->list);
>> -                       list_add_tail(&md_buf->list, &asd->metadata[i]);
>> +                       list_move_tail(&md_buf->list, &asd->metadata[i]);
>>                  }
>>                  while (!list_empty(&asd->metadata_ready[i])) {
>>                          md_buf = list_entry(asd->metadata_ready[i].next,
>>                                              struct atomisp_metadata_buf, list);
>> -                       list_del(&md_buf->list);
>> -                       list_add_tail(&md_buf->list, &asd->metadata[i]);
>> +                       list_move_tail(&md_buf->list, &asd->metadata[i]);
>>                  }
