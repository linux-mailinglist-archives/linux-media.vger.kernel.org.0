Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151193AB413
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 14:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbhFQMz6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 08:55:58 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:8259 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbhFQMz5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 08:55:57 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G5MLP0rLQz1BNL2;
        Thu, 17 Jun 2021 20:48:45 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 20:53:47 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 20:53:47 +0800
Subject: Re: [PATCH -next v3] media: staging: atomisp: use list_splice_init in
 atomisp_compat_css20.c
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     kernel test robot <lkp@intel.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <kaixuxia@tencent.com>, <gustavoars@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <kbuild-all@lists.01.org>,
        <weiyongjun1@huawei.com>
References: <20210611081004.1348026-1-libaokun1@huawei.com>
 <202106171617.BN97N8mw-lkp@intel.com>
 <d39a3cb0-4024-4abe-ad28-937fee53bc98@huawei.com>
 <YMtC/CmZeni2dD1W@smile.fi.intel.com>
From:   "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <9595aed0-99b1-ed5c-3f89-fa69dba41cf0@huawei.com>
Date:   Thu, 17 Jun 2021 20:53:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YMtC/CmZeni2dD1W@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for your advice.

I'll follow your advice strictly.

Best Regards.


在 2021/6/17 20:41, Andy Shevchenko 写道:
> On Thu, Jun 17, 2021 at 08:14:28PM +0800, libaokun (A) wrote:
>> Sorry, I only tested it with 'x86_64.config'.
>>
>> I'm about to send a patch v4 with the changes to fix the error under your
>> config.
> Please, do not top-post!
>
>
> Problem here that you tested without additional warnings enabled.
>
> Next time try to start with `make W=1 ...`
>
> If you have installed Sparse tool, the better option would be
> `make W=1 C=1 CF=-D__CHECK_ENDIAN__ ...`
>
>> 在 2021/6/17 16:52, kernel test robot 写道:
>>> Hi Baokun,
>>>
>>> Thank you for the patch! Yet something to improve:
>>>
>>> [auto build test ERROR on next-20210616]
>>>
>>> url:    https://github.com/0day-ci/linux/commits/Baokun-Li/media-staging-atomisp-use-list_splice_init-in-atomisp_compat_css20-c/20210617-043443
>>> base:    c7d4c1fd91ab4a6d2620497921a9c6bf54650ab8
>>> config: i386-allyesconfig (attached as .config)
>>> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>>> reproduce (this is a W=1 build):
>>>           # https://github.com/0day-ci/linux/commit/05c714d7b4e1722a75f949e40c5305f3ba28d048
>>>           git remote add linux-review https://github.com/0day-ci/linux
>>>           git fetch --no-tags linux-review Baokun-Li/media-staging-atomisp-use-list_splice_init-in-atomisp_compat_css20-c/20210617-043443
>>>           git checkout 05c714d7b4e1722a75f949e40c5305f3ba28d048
>>>           # save the attached .config to linux build tree
>>>           make W=1 ARCH=i386
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>      drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: In function 'atomisp_css_stop':
>>>>> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2156:50: error: 'struct atomisp_sub_device' has no member named 'asd'
>>>       2156 |   list_splice_init(&asd->metadata_in_css[i], &asd->asd->metadata[i]);
>>>            |                                                  ^~
>>>      drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2157:49: error: 'struct atomisp_sub_device' has no member named 'asd'
>>>       2157 |   list_splice_init(&asd->metadata_ready[i], &asd->asd->metadata[i]);
>>>            |                                                 ^~
>>>      drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2107:31: warning: unused variable 'md_buf' [-Wunused-variable]
>>>       2107 |  struct atomisp_metadata_buf *md_buf;
>>>            |                               ^~~~~~
>>>      drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2106:26: warning: unused variable 'dis_buf' [-Wunused-variable]
>>>       2106 |  struct atomisp_dis_buf *dis_buf;
>>>            |                          ^~~~~~~
