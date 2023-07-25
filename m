Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBBAD761A6C
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 15:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjGYNsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 09:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjGYNsL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 09:48:11 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2D4A1
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 06:48:10 -0700 (PDT)
Received: from dggpemm500014.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R9JHQ1mQdzrS0g;
        Tue, 25 Jul 2023 21:47:14 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 21:48:06 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 21:48:06 +0800
Subject: Re: [PATCH -next] media: i2c: ds90ub960: fix return value check in
 ub960_rxport_add_serializer()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <tomi.valkeinen@ideasonboard.com>,
        <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>,
        <yangyingliang@huawei.com>
References: <20230725121507.515435-1-yangyingliang@huawei.com>
 <ZL/OeBj+3ADYdBzz@smile.fi.intel.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <e511d4c3-314a-0151-9f31-bf3caae7f259@huawei.com>
Date:   Tue, 25 Jul 2023 21:48:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ZL/OeBj+3ADYdBzz@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2023/7/25 21:30, Andy Shevchenko wrote:
> On Tue, Jul 25, 2023 at 08:15:07PM +0800, Yang Yingliang wrote:
>> i2c_new_client_device() never returns NULL pointer, it will return
>> ERR_PTR() when it fails, so replace the check with IS_ERR() and
>> use PTR_ERR() as return code.
> Isn't the same fix to one that was in the mailing lists a few days ago?
Yes, it's same. This patch can be dropped.

Thanks,
Yang
> Anyway, FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
