Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99ECB26415F
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 11:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgIJJS5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 05:18:57 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:11339 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728207AbgIJJS5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 05:18:57 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 2BF81A251A26B7C23C49;
        Thu, 10 Sep 2020 17:18:20 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.108) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 17:18:16 +0800
Subject: Re: [PATCH -next] media: marvell-ccic: Fix -Wunused-function warnings
To:     Lubomir Rintel <lkundrak@v3.sk>
References: <20200910080933.40684-1-yuehaibing@huawei.com>
 <20200910082221.GA1115782@demiurge.local>
CC:     <corbet@lwn.net>, <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <b7206784-15ea-9790-0c70-eea99bbab34a@huawei.com>
Date:   Thu, 10 Sep 2020 17:18:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200910082221.GA1115782@demiurge.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020/9/10 16:22, Lubomir Rintel wrote:
> On Thu, Sep 10, 2020 at 04:09:33PM +0800, YueHaibing wrote:
>> If CONFIG_PM is n, gcc warns:
>>
>> drivers/media/platform/marvell-ccic/mmp-driver.c:347:12: warning: ‘mmpcam_resume’ defined but not used [-Wunused-function]
>>  static int mmpcam_resume(struct device *dev)
>>             ^~~~~~~~~~~~~
>> drivers/media/platform/marvell-ccic/mmp-driver.c:338:12: warning: ‘mmpcam_suspend’ defined but not used [-Wunused-function]
>>  static int mmpcam_suspend(struct device *dev)
>>             ^~~~~~~~~~~~~~
>> drivers/media/platform/marvell-ccic/mmp-driver.c:324:12: warning: ‘mmpcam_runtime_suspend’ defined but not used [-Wunused-function]
>>  static int mmpcam_runtime_suspend(struct device *dev)
>>             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/marvell-ccic/mmp-driver.c:310:12: warning: ‘mmpcam_runtime_resume’ defined but not used [-Wunused-function]
>>  static int mmpcam_runtime_resume(struct device *dev)
>>             ^~~~~~~~~~~~~~~~~~~~~
>>
>> Mark them as __maybe_unused to fix this.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> Your colleague seems to sent out an equivalent patch:
> https://lore.kernel.org/lkml/20200910080933.40684-1-yuehaibing@huawei.com/

This is my patch, paste an wrong link?

> 
> Cheers
> Lubo
> 
>> ---
>>  drivers/media/platform/marvell-ccic/mmp-driver.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
>> index c4b28a00a3a2..032fdddbbecc 100644
>> --- a/drivers/media/platform/marvell-ccic/mmp-driver.c
>> +++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
>> @@ -307,7 +307,7 @@ static int mmpcam_platform_remove(struct platform_device *pdev)
>>   * Suspend/resume support.
>>   */
>>  
>> -static int mmpcam_runtime_resume(struct device *dev)
>> +static int __maybe_unused mmpcam_runtime_resume(struct device *dev)
>>  {
>>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>>  	struct mcam_camera *mcam = &cam->mcam;
>> @@ -321,7 +321,7 @@ static int mmpcam_runtime_resume(struct device *dev)
>>  	return 0;
>>  }
>>  
>> -static int mmpcam_runtime_suspend(struct device *dev)
>> +static int __maybe_unused mmpcam_runtime_suspend(struct device *dev)
>>  {
>>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>>  	struct mcam_camera *mcam = &cam->mcam;
>> @@ -335,7 +335,7 @@ static int mmpcam_runtime_suspend(struct device *dev)
>>  	return 0;
>>  }
>>  
>> -static int mmpcam_suspend(struct device *dev)
>> +static int __maybe_unused mmpcam_suspend(struct device *dev)
>>  {
>>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>>  
>> @@ -344,7 +344,7 @@ static int mmpcam_suspend(struct device *dev)
>>  	return 0;
>>  }
>>  
>> -static int mmpcam_resume(struct device *dev)
>> +static int __maybe_unused mmpcam_resume(struct device *dev)
>>  {
>>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>>  
>> -- 
>> 2.17.1
>>
>>
> 
> .
> 

