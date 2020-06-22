Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B4B2034B6
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 12:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgFVKWB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 06:22:01 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:33529 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726841AbgFVKV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 06:21:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id nJaFj10Rvn3JWnJaJjZhof; Mon, 22 Jun 2020 12:21:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592821313; bh=L8WW833T8W2P1xOE2BDz+8QVVAqC2sMxUCnZhk49lAY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RE1Xhlmw/69K4sdCOhopK6M7uMg043puIeJvVyvz/zfWZ8AKsjtkaKWhsaEvcUSLw
         Rd9LnmPp/kNYPjxBNBGAR0UoXfycBfu0RRvSkVZv8hHJSxb4dbje8LZuK4G9coaQbi
         xzBNobZsXWxSCNd5hxr2fMGoj5aw2OJg5lo/LJvfRQKbJqIdnsFLmK/aNiohBIKhA6
         WW/cKeEExueTGx8c+CTRpJd63i/8B3khh52QyJe+8Hve5Li0PEJctxL8Fwz+nLvdQ1
         dnEiDC+6CNXkuR8W2fzuaa8Lmlj/0ilHkM1AJlMJHQGEWRxVHea8phMbFphh17Luve
         J5f7uUvP0PxDw==
Subject: Re: [PATCH] media: vsp1: Fix a reference count leak.
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        wu000273@umn.edu
Cc:     kjlu@umn.edu,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Aditya Pakki <pakki001@umn.edu>
References: <20200613232357.18155-1-wu000273@umn.edu>
 <20200616020732.GK1629@pendragon.ideasonboard.com>
 <20200616020956.GL1629@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <812c778d-2bdc-574c-eb72-fb2570ac2c11@xs4all.nl>
Date:   Mon, 22 Jun 2020 12:21:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616020956.GL1629@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA+D8HR7+7RpJYj/+jTPeJo/BoeYGufrTWr4WgMf436hetOblzYq+W++Fi5KnZH0DPyhCPkrWZ9EQTA0giCxanUHOC1L2jUfwK4acs2xnMfpe0mclqyh
 RrbxK91lFVarg61urjG1pMgo5jnNyO6RimmbO7EyvhECHWzcI6G/Ymb2k7hP9G/CyeljqVu5idrgw6g5SEbssrvVdSLuWyxV+ymwAweBKyPDnWhvOG6kX7Xp
 55F8XWZo8KcSUBUry3ZepkZ+nQS2SKLe4kPMtQmFmw7I8DWSfeg+R7w9CTbrA8D4ZFJzQO1+/7MR+LGOOipmBypDrNcf1N10QmNBE7JdPKu0HFapkrH3tgdg
 N8U02pdN63PCLTZzcX5uvl7O6h47bFj0iNdyNOeoO694di2orXpvK5ACc4ACjv3fAbORjFawI/bGfQ69IqxsKiPVJ5Gac8o0b3fj65xPDtlWw+4iDxEmJ37T
 CfHP5p/7EYyhUy+rWdafmdpTHhPEbAf7OQ3s6z3grCXAmSnpTvCngvOYnMM0G+0BRSTiXLyWL5Q8spBBoV9zTl53s2KsvMx95vevBQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/06/2020 04:09, Laurent Pinchart wrote:
> On Tue, Jun 16, 2020 at 05:07:34AM +0300, Laurent Pinchart wrote:
>> Hi Qiushi,
>>
>> (CC'ing Rafael and Geert)
>>
>> Thank you for the patch.
>>
>> On Sat, Jun 13, 2020 at 06:23:57PM -0500, wu000273@umn.edu wrote:
>>> From: Qiushi Wu <wu000273@umn.edu>
>>>
>>> pm_runtime_get_sync() increments the runtime PM usage counter even
>>> when it returns an error code, causing incorrect ref count if
>>> pm_runtime_put_noidle() is not called in error handling paths.
>>> Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.
>>>
>>> Fixes: 1e6af546ee66 ("[media] v4l: vsp1: Implement runtime PM support")
>>> Signed-off-by: Qiushi Wu <wu000273@umn.edu>
>>
>> https://lore.kernel.org/dri-devel/20200614134655.GA5960@pendragon.ideasonboard.com/
>>
>> I really wonder if mass-patching all drivers is the best way forward.
> 
> Also,
> 
> https://lore.kernel.org/linux-media/20200608052919.4984-1-dinghao.liu@zju.edu.cn/

I also stop applying these patches. In part because of what Laurent says (I'd
like to have some consensus on this as well), and in part because there are
at least three different devs working on this (Qiushi Wu <wu000273@umn.edu>,
Aditya Pakki <pakki001@umn.edu> and Dinghao Liu <dinghao.liu@zju.edu.cn>) and
I am getting duplicate patches.

So I stop applying these pm_runtime_get_sync() patches until it is clear that
this is the way forward. Other ref count issues I will still apply, but it
would be great if Qiushi Wu, Aditya Pakki and Dinghao Liu can work together
to avoid duplicate patches.

Regards,

	Hans

> 
>>> ---
>>>  drivers/media/platform/vsp1/vsp1_drv.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
>>> index c650e45bb0ad..222c9e1261a0 100644
>>> --- a/drivers/media/platform/vsp1/vsp1_drv.c
>>> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
>>> @@ -846,8 +846,10 @@ static int vsp1_probe(struct platform_device *pdev)
>>>  	pm_runtime_enable(&pdev->dev);
>>>  
>>>  	ret = pm_runtime_get_sync(&pdev->dev);
>>> -	if (ret < 0)
>>> +	if (ret < 0) {
>>> +		pm_runtime_put_noidle(&pdev->dev);
>>>  		goto done;
>>> +	}
>>>  
>>>  	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
>>>  	pm_runtime_put_sync(&pdev->dev);
> 

