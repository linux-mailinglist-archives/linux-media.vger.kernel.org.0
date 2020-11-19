Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667562B9008
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 11:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgKSKV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 05:21:26 -0500
Received: from mga12.intel.com ([192.55.52.136]:37450 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbgKSKV0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 05:21:26 -0500
IronPort-SDR: W+hV/D9HZKGFZLm3VSV/KX5oBk5Y40cXMSCVmc4kSEeYiZbkbmV1aurKb43wIoPWAdpfjTTfcw
 FNDMb1rQfJ8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="150534870"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="150534870"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 02:21:26 -0800
IronPort-SDR: ZLr7b0DOB4+3C2+CgxORNbd7ItYlcPD5VJrHhh1tr+mQCixzalWCwXGujtgdin6hgl4IbXMF9W
 ASV2dfDSjVKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="359916088"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 19 Nov 2020 02:21:23 -0800
Subject: Re: [PATCH] media: i2c: Add ov9734 image sensor driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
References: <1603940341-25224-1-git-send-email-bingbu.cao@intel.com>
 <X7OEysbnAhTXEmUq@jagdpanzerIV.localdomain>
 <X7OLuFejNyAPJEfB@jagdpanzerIV.localdomain>
 <CAAFQd5AyJz1bcMZXQLjCbUGS_wMxC0WViHynDPA4KowTLK_V0A@mail.gmail.com>
 <20201118134636.GI3940@paasikivi.fi.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <007ba180-1dd1-0a7b-3821-96749ca6f229@linux.intel.com>
Date:   Thu, 19 Nov 2020 18:18:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118134636.GI3940@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomasz and Sakari, thanks.

On 11/18/20 9:46 PM, Sakari Ailus wrote:
> Hi Tomasz,
> 
> On Wed, Nov 18, 2020 at 09:41:11PM +0900, Tomasz Figa wrote:
>> On Tue, Nov 17, 2020 at 5:37 PM Sergey Senozhatsky
>> <sergey.senozhatsky@gmail.com> wrote:
>>>
>>> On (20/11/17 17:07), Sergey Senozhatsky wrote:
>>>>> +static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
>>>>> +{
>>>>> +   struct ov9734 *ov9734 = to_ov9734(sd);
>>>>> +   struct i2c_client *client = v4l2_get_subdevdata(sd);
>>>>> +   int ret = 0;
>>>>> +
>>>>> +   if (ov9734->streaming == enable)
>>>>> +           return 0;
>>>>> +
>>>>> +   mutex_lock(&ov9734->mutex);
>>>>> +   if (enable) {
>>>>> +           ret = pm_runtime_get_sync(&client->dev);
>>>>> +           if (ret < 0) {
>>>>> +                   pm_runtime_put_noidle(&client->dev);
>>>>> +                   mutex_unlock(&ov9734->mutex);
>>>>> +                   return ret;
>>>>> +           }
>>>>> +
>>>>> +           ret = ov9734_start_streaming(ov9734);
>>>>> +           if (ret) {
>>>>> +                   enable = 0;
>>>>> +                   ov9734_stop_streaming(ov9734);
>>>>> +                   pm_runtime_put(&client->dev);
>>>>> +           }
>>>>> +   } else {
>>>>> +           ov9734_stop_streaming(ov9734);
>>>>> +           pm_runtime_put(&client->dev);
>>>>> +   }
>>>>
>>>> I assume that we will never see erroneous ->s_stream(0) calls or
>>>>  ->s_stream(0) after unsuccessful ->s_stream(1). Otherwise we will
>>>> do extra pm_runtime_put(), not matched by pm_runtime_get().
>>>
>>> Oh, no. There is (unprotected) if (ov9734->streaming) check
>>> at the very top, so we are probably fine.
>>
>> Hmm, should it be protected?
> 
> In principle, yes.
> 
> The patch is already in a pull request I've sent to Mauro, so any changes
> should be on top.

Will submit a patch based on the top.

> 

-- 
Best regards,
Bingbu Cao
