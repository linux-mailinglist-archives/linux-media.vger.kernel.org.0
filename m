Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6523C5BE1AF
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 11:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbiITJPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 05:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbiITJPR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 05:15:17 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84226BD43
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 02:13:58 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MWwhf3VYNzlW9h;
        Tue, 20 Sep 2022 17:09:06 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 17:13:12 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 17:13:11 +0800
Subject: Re: [PATCH -next v2] media: Switch to use dev_err_probe() helper
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <pavel@ucw.cz>,
        <sakari.ailus@linux.intel.com>, <sean@mess.org>,
        <laurent.pinchart@ideasonboard.com>
References: <20220919155843.1097473-1-yangyingliang@huawei.com>
 <Yyl67oamQ/i8PZpZ@valkosipuli.retiisi.eu>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <6d8f1bde-f56b-3373-6a77-a69a08b23503@huawei.com>
Date:   Tue, 20 Sep 2022 17:13:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Yyl67oamQ/i8PZpZ@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2022/9/20 16:33, Sakari Ailus wrote:
> Hi Yang,
>
> On Mon, Sep 19, 2022 at 11:58:43PM +0800, Yang Yingliang wrote:
>> In the probe path, dev_err() can be replaced with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER.
> I don't really disagree with changing to dev_err_probe(). But I would like
> to ask how have you selected the drivers and calls calls in them that you
> do change.
The drivers that check if error code is EPROBE_DEFER when handling error 
case in probe
path.
>
> E.g. the imx274 driver has a number of such calls and the patch appears to
> change one of them. Other drivers similar to imx274 (e.g. other sensor
> drivers) do use dev_err() as well.
dev_err_probe() will check if error code is EPROBE_DEFER, the rest of 
such calls
in imx274 driver don't check EPROBE_DEFER, so I don't replace them.
>
> I wonder how difficult it would be to do this more systematically with
> Coccinelle.
>
