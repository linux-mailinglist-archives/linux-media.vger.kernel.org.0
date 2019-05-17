Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13C9521926
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2019 15:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbfEQN06 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 09:26:58 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:8487 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728333AbfEQN06 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 09:26:58 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdeb6a60000>; Fri, 17 May 2019 06:27:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 17 May 2019 06:26:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 17 May 2019 06:26:56 -0700
Received: from [10.24.42.162] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 May
 2019 13:26:52 +0000
Subject: Re: [Patch V3] v4l2-core: fix use-after-free error
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <paul.kocialkowski@bootlin.com>,
        <tfiga@chromium.org>, <keiichiw@chromium.org>, <bbasu@nvidia.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1555342574-15940-1-git-send-email-sumitg@nvidia.com>
 <16a25e01-7ebe-f0c9-2915-bd811b28c9c0@xs4all.nl>
X-Nvconfidentiality: public
From:   sumitg <sumitg@nvidia.com>
Message-ID: <fcc04cce-cfc8-dfc1-f953-6b9a268a2294@nvidia.com>
Date:   Fri, 17 May 2019 18:56:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <16a25e01-7ebe-f0c9-2915-bd811b28c9c0@xs4all.nl>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558099622; bh=M/osV76ryvDNBuZiIoBB4rLB9C5kRiGNWsdcND1xvY0=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Transfer-Encoding:Content-Language;
        b=OiMkBdcrBm2aa0ASsHmjalKxAo4/DCzF/uPov9JcK27aT6mLWMc05xwWBwBqu7kQq
         WCQ9myGeVxszlaA3T/kxOyT8z3zttHyNU/7FyiiVumnsnjPhrnzov344c+FpMo2uXQ
         fPQtbQhCmT7LlzVIGG9yOx1vpYOYsRnldMEeRF5gRk4PJ9UtQGRVvS4jw5C3Eq/G0C
         A0QuKTZAgec5moXP0o6IRiuL83iReaHOTPfc/0JjtxQ52qlToqdH/VBqHoq6Lw4YXq
         MaT6bKVqgV6Np67Sh6lp/yhuG+ae0aFkJg7/ZBoTZICTVkCWsqMwS5ChKFnqdTdGV0
         3u8/mCLdU52nw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 24/04/19 4:37 PM, Hans Verkuil wrote:
> On 4/15/19 5:36 PM, Sumit Gupta wrote:
>> From: sumitg <sumitg@nvidia.com>
>>
>> Fixing use-after-free within __v4l2_ctrl_handler_setup().
>> Memory is being freed with kfree(new_ref) for duplicate
>> control reference entry but ctrl->cluster pointer is still
>> referring to freed duplicate entry resulting in error on
>> access. Change done to update cluster pointer only when new
>> control reference is added. Also, added check to add new
>> ctrl to handler only if the cluster points to an entry.
>>
>>   ==================================================================
>>   BUG: KASAN: use-after-free in __v4l2_ctrl_handler_setup+0x388/0x428
>>   Read of size 8 at addr ffffffc324e78618 by task systemd-udevd/312
>>
>>   Allocated by task 312:
>>
>>   Freed by task 312:
>>
>>   The buggy address belongs to the object at ffffffc324e78600
>>    which belongs to the cache kmalloc-64 of size 64
>>   The buggy address is located 24 bytes inside of
>>    64-byte region [ffffffc324e78600, ffffffc324e78640)
>>   The buggy address belongs to the page:
>>   page:ffffffbf0c939e00 count:1 mapcount:0 mapping:
>> 					(null) index:0xffffffc324e78f80
>>   flags: 0x4000000000000100(slab)
>>   raw: 4000000000000100 0000000000000000 ffffffc324e78f80 000000018020001a
>>   raw: 0000000000000000 0000000100000001 ffffffc37040fb80 0000000000000000
>>   page dumped because: kasan: bad access detected
>>
>>   Memory state around the buggy address:
>>    ffffffc324e78500: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>>    ffffffc324e78580: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>>   >ffffffc324e78600: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>>                               ^
>>    ffffffc324e78680: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
>>    ffffffc324e78700: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
>>   ==================================================================
>>
>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
>> ---
>>
>> v3:
>> * update ctrl->cluster only when new control reference is added.
>> * add new ctrl to handler only if the cluster points to an entry.
>>
>> v2:
>> * update ctrl->cluster only when new control reference is added.
>> * check ctrl->ncontrols to avoid illegal access when cluster has zero controls.
>>
>>   drivers/media/v4l2-core/v4l2-ctrls.c | 26 ++++++++++++++------------
>>   1 file changed, 14 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 5e3806f..877c2ab 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -2154,15 +2154,6 @@ static int handler_new_ref(struct v4l2_ctrl_handler *hdl,
>>   	if (size_extra_req)
>>   		new_ref->p_req.p = &new_ref[1];
>>   
>> -	if (ctrl->handler == hdl) {
>> -		/* By default each control starts in a cluster of its own.
>> -		   new_ref->ctrl is basically a cluster array with one
>> -		   element, so that's perfect to use as the cluster pointer.
>> -		   But only do this for the handler that owns the control. */
>> -		ctrl->cluster = &new_ref->ctrl;
>> -		ctrl->ncontrols = 1;
>> -	}
>> -
>>   	INIT_LIST_HEAD(&new_ref->node);
>>   
>>   	mutex_lock(hdl->lock);
>> @@ -2195,6 +2186,15 @@ static int handler_new_ref(struct v4l2_ctrl_handler *hdl,
>>   	hdl->buckets[bucket] = new_ref;
>>   	if (ctrl_ref)
>>   		*ctrl_ref = new_ref;
>> +	if (ctrl->handler == hdl) {
>> +		/* By default each control starts in a cluster of its own.
>> +		 * new_ref->ctrl is basically a cluster array with one
>> +		 * element, so that's perfect to use as the cluster pointer.
>> +		 * But only do this for the handler that owns the control.
>> +		 */
>> +		ctrl->cluster = &new_ref->ctrl;
>> +		ctrl->ncontrols = 1;
>> +	}
> This is good.
>
>>   
>>   unlock:
>>   	mutex_unlock(hdl->lock);
>> @@ -2346,9 +2346,11 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   		kvfree(ctrl);
>>   		return NULL;
>>   	}
>> -	mutex_lock(hdl->lock);
>> -	list_add_tail(&ctrl->node, &hdl->ctrls);
>> -	mutex_unlock(hdl->lock);
>> +	if (ctrl->cluster) {
>> +		mutex_lock(hdl->lock);
>> +		list_add_tail(&ctrl->node, &hdl->ctrls);
>> +		mutex_unlock(hdl->lock);
>> +	}
> But why change this? ctrl->cluster can never be NULL here.
>
> If ctrl->cluster really is NULL for you, then something else
> is wrong.

I checked it again but issue is not visible now in my setup.

So, as suspected by you there might be some other issue which

was causing this problem earlier. But now that looks fixed. Sending

first patch as code improvement to avoid use-after-free problem.

>
> Regards,
>
> 	Hans
>
>>   	return ctrl;
>>   }
>>   
>>
