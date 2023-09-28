Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71FF87B1052
	for <lists+linux-media@lfdr.de>; Thu, 28 Sep 2023 03:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjI1BZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 21:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjI1BZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 21:25:00 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D177A99
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 18:24:58 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RwwhJ5tFKz15NRK;
        Thu, 28 Sep 2023 09:22:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 28 Sep 2023 09:24:56 +0800
Message-ID: <1acd30d0-3663-2d41-8e5b-691042d054a7@huawei.com>
Date:   Thu, 28 Sep 2023 09:24:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 0/2] media: siano: Fix two bugs in smsdvb_debugfs_create()
Content-Language: en-US
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <ye.xingchen@zte.com.cn>, <linux-media@vger.kernel.org>
References: <20230914035035.3765754-1-ruanjinjie@huawei.com>
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230914035035.3765754-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ping.

On 2023/9/14 11:50, Jinjie Ruan wrote:
> As debugfs_create_file() returns ERR_PTR and never NULL, check NULL is not
> correct to catch the error.
> 
> And if kzalloc() fails in smsdvb_debugfs_create(), the dir and file which
> is created by debugfs_create_dir() and debugfs_create_file() is
> not freed.
> 
> This patch set fix the above 2 bugs.
> 
> Jinjie Ruan (2):
>   media: siano: Fix the NULL vs IS_ERR() bug for debugfs_create_file()
>   media: siano: Fix the missing err path in smsdvb_debugfs_create()
> 
>  drivers/media/common/siano/smsdvb-debugfs.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
