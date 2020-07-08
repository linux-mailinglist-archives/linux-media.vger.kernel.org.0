Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99192183DE
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 11:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgGHJeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 05:34:11 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:29674 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgGHJeK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 05:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=wTdcKNoDsPfl07/DOE2fNR+ke3gfU5xTSF0Q+OGPwDo=;
        b=K+0YlWIhBITmcjO7AFqdXuKkE2Rpnfzpy5bTYcyz4ecv00XYs0WqXkWOUdgnAMvQKi9p
        m7kZ37ZhqQDKaV9sTETxUFMWCISi5a0wAPmlsgANVDLGCsMIKCc1HXX0dT7EfPcv8K+4ve
        ZGXeeebAI30YJYaME1TEpylEZZndc1WUY=
Received: by filterdrecv-p3mdw1-75c584b9c6-f64fx with SMTP id filterdrecv-p3mdw1-75c584b9c6-f64fx-19-5F059311-5A
        2020-07-08 09:34:10.033222676 +0000 UTC m=+1009467.905161444
Received: from [192.168.1.14] (unknown)
        by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP
        id _qOInuZpSNKc1pja7tIRdQ
        Wed, 08 Jul 2020 09:34:09.856 +0000 (UTC)
Subject: Re: [PATCH v2 12/12] media: rkvdec: h264: Support profile and level
 controls
References: <20200701215616.30874-1-jonas@kwiboo.se>
 <20200706215430.22859-1-jonas@kwiboo.se>
 <20200706215430.22859-13-jonas@kwiboo.se>
 <97a4c51aa5cfcdef7f4c96fcf84f85bd7c8b3729.camel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <dc1fcf7a-cc5e-0bee-ae74-d8d1464a1815@kwiboo.se>
Date:   Wed, 08 Jul 2020 09:34:10 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97a4c51aa5cfcdef7f4c96fcf84f85bd7c8b3729.camel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hxvWe0Hf48kbhzjVr?=
 =?us-ascii?Q?Ys96KNQJawVSCYaKiFSD8ZVEvLm8Ve05YbSeQZz?=
 =?us-ascii?Q?fzijREANhnjgYa133r4hrvXKtDCqFTpdWFW+YC1?=
 =?us-ascii?Q?N2=2F2=2FOZF1FnQss4THkaJeykWs7vkiTK6PqqFj2L?=
 =?us-ascii?Q?4QawAXdQdWTohlhbmeAaKPkzThkNl5aS1=2F+wzsc?=
 =?us-ascii?Q?77C6CWKjydDesqt1gaihg=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-07-08 05:19, Ezequiel Garcia wrote:
> On Mon, 2020-07-06 at 21:54 +0000, Jonas Karlman wrote:
>> The Rockchip Video Decoder used in RK3399 supports H.264 profiles from
>> Baseline to High 4:2:2 up to Level 5.1, except for the Extended profile.
>>
>> Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE and the
>> V4L2_CID_MPEG_VIDEO_H264_LEVEL control, so that userspace can query the
>> driver for the list of supported profiles and level.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>> ---
>> Changes in v2:
>> - Moved to end
>> - Collect r-b tag
>> ---
>>  drivers/staging/media/rkvdec/rkvdec.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
>> index 4faee9262392..b21031535330 100644
>> --- a/drivers/staging/media/rkvdec/rkvdec.c
>> +++ b/drivers/staging/media/rkvdec/rkvdec.c
>> @@ -144,6 +144,19 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>>  		.cfg.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>>  		.cfg.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>>  	},
>> +	{
>> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
>> +		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> 
> Nicolas recently pointed out to me that our drivers
> can't support ASO/FMO baseline features, and so
> seems we need to leave baseline out.

I will change min to V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE in v3.

Regards,
Jonas

> 
> (Applies to Hantro as well).
> 
> Thanks,
> Ezequiel
> 
>> +		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422,
>> +		.cfg.menu_skip_mask =
>> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
>> +		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
>> +		.cfg.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
>> +		.cfg.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
>> +	},
>>  };
>>  
>>  static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
> 
> 
