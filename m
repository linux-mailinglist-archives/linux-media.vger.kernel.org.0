Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B096814DF93
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 18:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgA3RCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 12:02:24 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13959 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgA3RCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 12:02:24 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e330c0b0000>; Thu, 30 Jan 2020 09:02:03 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Jan 2020 09:02:23 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 09:02:23 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 17:02:23 +0000
Subject: Re: Re: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input
 driver for Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <20200129111340.GF2479935@ulmo>
 <070f9a4c-1919-f3f6-fef3-ed0a84cf5776@nvidia.com>
 <20200130122055.GA2584455@ulmo>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <5a45782a-d88f-099a-f3b6-3c0255131f6b@nvidia.com>
Date:   Thu, 30 Jan 2020 09:02:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200130122055.GA2584455@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580403723; bh=A9RuPB5fbixK5sm9wKeq5QfAS+EZrvYRY7JYNhFDIxM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=f+KBjjefTnGF+7UwoAa9RNl2MGpafpuIMkycNlYO3mvZKyGb+pnAb7SfZtnWE9Qiq
         pXfRB7v8J2Kbfb0ONZ+7H0yt/iEibISeh9AWrAjNpBFg4c3Mb5V0Nf3NWa7tp75GT7
         OAAXITy2uqWyrz5UtCH6UcbZ+jMRie1i9EzYlhMhlKYGxfS6ld28TpFFU+5reXQOmy
         +Chrfc/+ecGwiCVNveR2ge83D+ZY+2k4lQdT3bSgwpc4UNb/t+k5Q20OJexu3t+TlB
         ShQsGCdA2nuVSXex8Xj/09EMUrnPjuIUiSWCntiL2nhyDA+N5fpR4jF8AB850rRdBq
         6O16IKT8ainJA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/30/20 4:20 AM, Thierry Reding wrote:
> On Wed, Jan 29, 2020 at 09:23:38AM -0800, Sowjanya Komatineni wrote:
>> On 1/29/20 3:13 AM, Thierry Reding wrote:
>>> On Tue, Jan 28, 2020 at 10:23:20AM -0800, Sowjanya Komatineni wrote:
> [...]
>>>> diff --git a/drivers/staging/media/tegra/host1x-video.c b/drivers/staging/media/tegra/host1x-video.c
> [...]
>>>> +	media_device_init(&cam->media_dev);
>>>> +	ret = media_device_register(&cam->media_dev);
>>>> +	if (ret < 0) {
>>>> +		dev_err(cam->dev, "failed to register media device: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	cam->v4l2_dev.mdev = &cam->media_dev;
>>>> +	ret = v4l2_device_register(cam->dev, &cam->v4l2_dev);
>>>> +	if (ret < 0) {
>>>> +		dev_err(cam->dev, "V4L2 device registration failed: %d\n", ret);
>>>> +		goto register_error;
>>>> +	}
>>>> +
>>>> +	dev_set_drvdata(&dev->dev, cam);
>>>> +
>>>> +	ret = host1x_device_init(dev);
>>>> +	if (ret < 0)
>>>> +		goto dev_exit;
>>>> +
>>>> +	return 0;
>>>> +
>>>> +dev_exit:
>>>> +	host1x_device_exit(dev);
>>> There should be no need to call host1x_device_exit() when
>>> host1x_device_init() failed because the latter already takes care of
>>> undoing whatever it did already.
>>>
>> host1x_device_init can fail if any of its client ops init fails.
>>
>> So, calling host1x_device_exit here to undo the things done in other
>> successful client init ops.
> host1x_device_init() already takes care of undoing what it did on
> failure. Also, it makes sure to only undo what had already been done,
> rather than tear down every client, even if it hadn't been initialized
> yet when the failure happened. The latter is what would happen if you
> called host1x_device_exit() to cleanup at this point.
>
> Thierry

Sorry, yes I see host1x_device_init calls exit ops on failures .

Will remove it. Thanks Thierry.

