Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99AC747CCE4
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 07:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239281AbhLVGMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 01:12:24 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:7882 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239241AbhLVGMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 01:12:24 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1BM66WDs065028;
        Wed, 22 Dec 2021 14:06:32 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Dec
 2021 14:11:58 +0800
Message-ID: <d4eef96a-f714-6bb5-dd7f-3057d59e3a19@aspeedtech.com>
Date:   Wed, 22 Dec 2021 14:11:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/4] media: aspeed: Correct values for detected timing
Content-Language: en-US
To:     Joel Stanley <joel@jms.id.au>
CC:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211217095403.2618-1-jammy_huang@aspeedtech.com>
 <20211217095403.2618-4-jammy_huang@aspeedtech.com>
 <CACPK8Xf_5wZXzfDSrdLLxs_B_jX7BVHc5o2Thw1DJvYix1AA8Q@mail.gmail.com>
From:   Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <CACPK8Xf_5wZXzfDSrdLLxs_B_jX7BVHc5o2Thw1DJvYix1AA8Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BM66WDs065028
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joel,

OK, I will update in next patch as you advised.
Thanks for your review.

On 2021/12/22 上午 09:31, Joel Stanley wrote:
> On Fri, 17 Dec 2021 at 09:54, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>> Correct timing's fp/sync/bp value based on the information below.
>> It should be noticed that the calculation formula should be changed
>> per sync polarity.
>>
>> The sequence of signal: sync - backporch - video data - frontporch
>>
>> The following registers start counting from sync's rising edge:
>> 1. VR090: frame edge's left and right
>> 2. VR094: frame edge's top and bottom
>> 3. VR09C: counting from sync's rising edge to falling edge
>>
>>              +--+     +-------------------+     +--+
>>              |  |     |    v i d e o      |     |  |
>>           +--+  +-----+                   +-----+  +---+
>>
>>          sync+--+
>>      left/top+--------+
>> right/bottom+----------------------------+
>>
>>                    +-------------------+
>>                    |    v i d e o      |
>>        +--+  +-----+                   +-----+  +---+
>>           |  |                               |  |
>>           +--+                               +--+
>>          sync+-------------------------------+
>>      left/top+-----+
>> right/bottom+-------------------------+
> This is a good explanation. Can you add detail that relates the names
> you use here to to the variable names in your patch (or change them to
> match)?
>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>   drivers/media/platform/aspeed-video.c | 27 ++++++++++++++++++++++-----
>>   1 file changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 581a4261f9b7..5ad3a20c5bac 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -988,10 +988,20 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>                                                  src_tb_edge);
>>                  video->frame_top = FIELD_GET(VE_SRC_TB_EDGE_DET_TOP,
>>                                               src_tb_edge);
>> -               det->vfrontporch = video->frame_top;
>> -               det->vbackporch = FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
>> -                       video->frame_bottom;
>>                  det->vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);
>
> Would it be clearer if you structured the code like this?
>
>   vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);
>   vlines = FIELD_GET(VE_MODE_DETECT_V_LINES, mds);
>
>   if (det->polarities & V4L2_DV_VSYNC_POS_POL)) {
>      det->vbackporch = video->frame_top - vsync;
>      det->vfrontporch = vlines - video->frame_bottom;
>      det->vsync = vsync;
>   } else {
>      det->vbackporch = video->frame_top;
>      det->vfrontporch = vlines - video->frame_bottom - vsync;
>      det->vsync = vlines - vsync;
>
> }
>
>
>> +               if (det->polarities & V4L2_DV_VSYNC_POS_POL) {
>> +                       det->vbackporch = video->frame_top - det->vsync;
>> +                       det->vfrontporch =
>> +                               FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
>> +                               video->frame_bottom;
>> +               } else {
>> +                       det->vsync = FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
>> +                                              det->vsync;
>> +                       det->vbackporch = video->frame_top;
>> +                       det->vfrontporch =
>> +                               FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
>> +                               video->frame_bottom - det->vsync;
>> +               }
>>                  if (video->frame_top > video->frame_bottom)
>>                          continue;
>>
>> @@ -999,9 +1009,16 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>                                                 src_lr_edge);
>>                  video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT,
>>                                                src_lr_edge);
>> -               det->hfrontporch = video->frame_left;
>> -               det->hbackporch = htotal - video->frame_right;
>>                  det->hsync = FIELD_GET(VE_SYNC_STATUS_HSYNC, sync);
>> +               if (det->polarities & V4L2_DV_HSYNC_POS_POL) {
>> +                       det->hbackporch = video->frame_left - det->hsync;
>> +                       det->hfrontporch = htotal - video->frame_right;
>> +               } else {
>> +                       det->hsync = htotal - det->hsync;
>> +                       det->hbackporch = video->frame_left;
>> +                       det->hfrontporch = htotal - video->frame_right -
>> +                                          det->hsync;
>> +               }
>>                  if (video->frame_left > video->frame_right)
>>                          continue;
>>
>> --
>> 2.25.1
>>
-- 
Best Regards
Jammy

