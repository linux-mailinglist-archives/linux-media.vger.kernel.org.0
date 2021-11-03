Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE922443C63
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 06:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhKCFGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 01:06:47 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:46533 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbhKCFGq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 01:06:46 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1A34dkWW071525;
        Wed, 3 Nov 2021 12:39:46 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Nov
 2021 13:02:37 +0800
Message-ID: <3a40bb81-2c6e-47e3-fb85-e615aecd129a@aspeedtech.com>
Date:   Wed, 3 Nov 2021 13:02:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2] media: aspeed: fix mode-detect always time out at 2nd
 run
Content-Language: en-US
To:     Joel Stanley <joel@jms.id.au>
CC:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>
References: <20211103011357.22067-1-jammy_huang@aspeedtech.com>
 <CACPK8XcuhVVvbs4m5k=1d6oFiewEo2RqqOqf5R72KJ4yjiEiUw@mail.gmail.com>
 <CACPK8XezrCtCbKVgNOPNt+N_7ki6Rctf9M8oLBHyixa+Wph2Sw@mail.gmail.com>
From:   Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <CACPK8XezrCtCbKVgNOPNt+N_7ki6Rctf9M8oLBHyixa+Wph2Sw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1A34dkWW071525
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Joel,

Sure. Thanks for your reminder.

On 2021/11/3 上午 09:53, Joel Stanley wrote:
> On Wed, 3 Nov 2021 at 01:47, Joel Stanley <joel@jms.id.au> wrote:
>> On Wed, 3 Nov 2021 at 01:13, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>>> aspeed_video_get_resolution() will try to do res-detect again if the
>>> timing got in last try is invalid. But it will always time out because
>>> VE_SEQ_CTRL_TRIG_MODE_DET is only cleared after 1st mode-detect.
>>>
>>> To fix the problem, just clear VE_SEQ_CTRL_TRIG_MODE_DET before setting
>>> it in aspeed_video_enable_mode_detect().
>>>
>>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>>> Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
> When applying, can we please have this tag added:
>
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
>
> Cheers,
>
> Joel
>
>
>>> ---
>>> v2:
>>>    - update commit message
>>> ---
>>>   drivers/media/platform/aspeed-video.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>>> index 5ffbabf884eb..fea5e4d0927e 100644
>>> --- a/drivers/media/platform/aspeed-video.c
>>> +++ b/drivers/media/platform/aspeed-video.c
>>> @@ -518,6 +518,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
>>>          aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
>>>                              VE_INTERRUPT_MODE_DETECT);
>>>
>>> +       /* Disable mode detect in order to re-trigger */
>>> +       aspeed_video_update(video, VE_SEQ_CTRL,
>>> +                           VE_SEQ_CTRL_TRIG_MODE_DET, 0);
>>> +
>>>          /* Trigger mode detect */
>>>          aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
>>>   }
>>> @@ -809,10 +813,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>>                          return;
>>>                  }
>>>
>>> -               /* Disable mode detect in order to re-trigger */
>>> -               aspeed_video_update(video, VE_SEQ_CTRL,
>>> -                                   VE_SEQ_CTRL_TRIG_MODE_DET, 0);
>>> -
>>>                  aspeed_video_check_and_set_polarity(video);
>>>
>>>                  aspeed_video_enable_mode_detect(video);
>>> --
>>> 2.25.1
>>>
-- 
Best Regards
Jammy

