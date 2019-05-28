Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF9A92C19E
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 10:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfE1Isg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 04:48:36 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:52705 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725943AbfE1Isg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 04:48:36 -0400
Received: from [IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13] ([IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VXmbhgvNusDWyVXmchcHic; Tue, 28 May 2019 10:48:34 +0200
Subject: Re: [PATCH v4 1/2] media: v4l2: Make sure all drivers set _MPLANE
 caps in vdev->device_caps
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <CGME20190416120324epcas1p255f6a52103f335e58d612ad6831a6556@epcas1p2.samsung.com>
 <20190416120313.6005-1-boris.brezillon@collabora.com>
 <371f8176-7d9d-45b2-89c4-9bca35fa1d1b@samsung.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <263e8a8e-70d6-bf37-a4ab-96f605540590@xs4all.nl>
Date:   Tue, 28 May 2019 10:48:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <371f8176-7d9d-45b2-89c4-9bca35fa1d1b@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC4ZlfzBbGu+a3Wvz8xlR1iosb1BozJOIUKNlgW97EazSpOagFhRmuqUskWRWzfT5byxB8YR512Gplc8eY91NBPilmu+GW+AOWd0aNAW7zA/UW1Jm/zX
 rL7YsludPjSQG72tC3hlVJYBznu+6/TfRorv5IWUN0fkdNypOlUt6lvjDEwSbun5RH4VlSfh+TgZGDfg/b3gXu/HQQWau2WwnxCRXNylnKEoNBsTCU1X8X68
 y+UmuChFoy0KLqmcdPPf2QKhT0ow5tRwwhSqbIopmy60GqeSYLDK6wXpce9BeAeQWzDZ2x8QgDxhcxBo82+ERbZMwzBSGAookrBZnAL/imQ8235oSgfPY7VN
 uQoBrUIIZaeUU37wF0mbzoM9yibf1ogNS1hPYO3Z8UKkZwFvQ5H1hVL7UKzMuVRMVS6Lvm76R2pUGVQD9rCrHTORTBY7U/nkilx9bIKXrRuvqEeAk7wQZQl7
 pzTxXs58J7cD5R1+Zmw3RERb8jOgKtrQ1ptfdb/iO06TP7CW6J3JeGEDSGT+9CQXVy91UxtjFn8vnWfTUUsZsG2zXeg8agIkT+vBqDIsDSBlC1kpivcnH4L4
 EK69fipWelyKUaU53V/vtG0vR06oT7/HRUSD8Nz42rFd4g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

On 4/24/19 12:10 PM, Sylwester Nawrocki wrote:
> On 4/16/19 14:03, Boris Brezillon wrote:
>> This is needed if we want the core to be able to check _MPLANE support
>> without having to call the ->vdioc_querycap() hook.
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>> Changes in v4:
>> - Add a hack in fimc-lite and fimc-isp-video ->querycap()
>>   implementation to avoid reporting _MPLANE caps as userspace is not
>>   ready for that
>  
> 
>> diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
>> index bb35a2017f21..0fb474b608ba 100644
>> --- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
>> +++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
>> @@ -349,7 +349,15 @@ static int isp_video_querycap(struct file *file, void *priv,
>>  {
>>  	struct fimc_isp *isp = video_drvdata(file);
>>  
>> -	__fimc_vidioc_querycap(&isp->pdev->dev, cap, V4L2_CAP_STREAMING);
>> +	__fimc_vidioc_querycap(&isp->pdev->dev, cap);
>> +
>> +	/*
>> +	 * FIXME: Userspace does not expect V4L2_CAP_VIDEO_CAPTURE_MPLANE to
>> +	 * be set when calling ioctl(QUERYCAP) but we need to set this bit
>> +	 * in vdev->device_caps to let the v4l2 core do some consistency check.
>> +	 * Let's clear it here until we find a better solution.
>> +	 */
>> +	cap->device_caps &= ~V4L2_CAP_VIDEO_CAPTURE_MPLANE;
> 
> If the common convention is that we set these caps then I don't see a reason
> why we couldn't drop this hack, and in fimc-lite as well.
> The chances that leaving these caps raised are not greater than zero on systems
> where this driver could be used I'd say.
> Otherwise the patches look good to me.

Based on Sylwester's comment can you make a v5?

I'd like to get this in soonish since it is a nice improvement.

Regards,

	Hans
