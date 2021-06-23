Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B343B11BD
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 04:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhFWCcE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 22:32:04 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:7503 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhFWCcD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 22:32:03 -0400
Received: from dggeml759-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G8nFv2M7lzZkm6;
        Wed, 23 Jun 2021 10:26:43 +0800 (CST)
Received: from [10.174.178.165] (10.174.178.165) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 23 Jun 2021 10:29:43 +0800
Subject: Re: [PATCH] media: v4l2-subdev: fix some NULL vs IS_ERR() checks
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <YNH0WU7BcQ/60UNG@mwanda>
 <YNH87qd4eJOR296R@pendragon.ideasonboard.com> <20210622155858.GN1861@kadam>
From:   "weiyongjun (A)" <weiyongjun1@huawei.com>
Message-ID: <623db5b4-77e6-9fbf-37b4-6d6e2925ad84@huawei.com>
Date:   Wed, 23 Jun 2021 10:29:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210622155858.GN1861@kadam>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.165]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


在 2021/6/22 23:58, Dan Carpenter 写道:
> On Tue, Jun 22, 2021 at 06:08:30PM +0300, Laurent Pinchart wrote:
>> Hi Dan,
>>
>> Thank you for the patch.
>>
>> On Tue, Jun 22, 2021 at 05:31:53PM +0300, Dan Carpenter wrote:
>>> The v4l2_subdev_alloc_state() function returns error pointers, it
>>> doesn't return NULL.
>> It's funny you send this patch today, I've been thinking about the exact
>> same issue yesterday, albeit more globally, when trying to figure out if
>> a function I called returned NULL or an error pointer on error.
>>
>> Would it make to create an __err_ptr annotation to mark functions that
>> return an error pointer ? This would both give a simple indication to
>> the user and allow tools such as smatch to detect errors.
>>
> If you have the cross function DB enabled then Smatch can figure out if
> it returns error pointers or NULL.  The big problem is that Smatch works
> on the precompiled code and doesn't understand ifdeffed code.
>
> I haven't pushed all the Smatch checks.  I told someone last month, I'd
> give them a month to fix any bugs since it was their idea.  But I'll
> push it soon.
>
> #if IS_ENABLED(CONFIG)
> function returns error pointer or valid
> #else
> struct foo *function() { return NULL; }
> #endif
>
> I believe that there are also people who use a two pass Coccinelle
> system where they make a list of functions that return error pointers
> and then check the callers.
>
> The Huawei devs find a bunch of these bugs through static analysis but
> I don't know which tools they are using.


Hi Dan,


We are using Coccinelle script to found them.


First step we using coccinelle script to found all the functions return

ERR_PTR or NULL, and do filter by checking all the users:  at least we

found at least 5 callers, and all the caller check only NULL or ERR_PTR,

then we add them to function list.


Then using coccinelle script do analysis base on the function list give

in step 1. Just do the same thing like smatch.


Regards,

Wei Yongjun

