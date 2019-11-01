Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDE29EBF46
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2019 09:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfKAIhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Nov 2019 04:37:24 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:35515 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726636AbfKAIhY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 Nov 2019 04:37:24 -0400
Received: from [IPv6:2001:983:e9a7:1:8c66:a727:bbe6:d244]
 ([IPv6:2001:983:e9a7:1:8c66:a727:bbe6:d244])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QSQRik7i3sBskQSQSiTkxp; Fri, 01 Nov 2019 09:37:22 +0100
Subject: Re: [PATCH v2 01/10] media: hantro: Fix H264 max frmsize supported on
 RK3288
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <HE1PR06MB4011858F97A96AD25E75E2E1AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191031095238.683b69d9@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <77df1d5a-5c53-00c0-3d32-063341dde55e@xs4all.nl>
Date:   Fri, 1 Nov 2019 09:36:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031095238.683b69d9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB2uUZXiFXXgr2vo17Eg+w/SoGCEqJ0WHo8JmU547gcfwnCu6lvTLAEdJ7bPHEpH3w2zRrZn1ZDEmyPvnEwwLdaAC/9x+9QlAyc0WCKlEo8uxBdBGie3
 vorMjNj2O03EEVFxPlhJ6BzDckNeIit7s6pzlCUFLQ8/jkTXf4vlZxfA4CwfxmuRVq1OW1xLd5sHNDWTbdEmTnR4zNHwZ4eJhmrMtLs50hNAsclofc5yYNKj
 c+1lpqaCEbraOSa//0pG8mHDtFPtUYwfhZITStU/84u1yR/oVsf/xDpQloz/O4nYwEH3SIDmi4lIGUK4D3qcN/aPeSQ7zBUxDt70hFTY6WOAtuqWBtUNBpNM
 APWbAcK6Js+jsPgjGN6iK9M3LNdGRIaVDOqJy7FYUGzZpMZF1DG6s3majRbi77J5RK6ZeUue/DDG/i9CaS6AaWWzSuTRgXyAWq/6OE3/cEqumWlEMHo9/DVe
 zA/92x/K5aCl7tNDAPJ61nyHces0rD12k03yzcyKbC/8g65zMYk8ajc110Q=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/31/19 9:52 AM, Boris Brezillon wrote:
> On Tue, 29 Oct 2019 01:24:47 +0000
> Jonas Karlman <jonas@kwiboo.se> wrote:
> 
>> TRM specify supported image size 48x48 to 4096x2304 at step size 16 pixels,
>> change frmsize max_width/max_height to match TRM at [1].
>>
>> This patch makes it possible to decode the 4096x2304 sample at [2].
>>
>> [1] http://www.t-firefly.com/download/firefly-rk3288/docs/TRM/rk3288-chapter-25-video-encoder-decoder-unit-(vcodec).pdf
>> [2] https://4ksamples.com/puppies-bath-in-4k/
>>
>> Fixes: 760327930e10 ("media: hantro: Enable H264 decoding on rk3288")
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Let's also add
> 
> Cc: <stable@vger.kernel.org>
> 
> just in case this patch doesn't make it to 5.4.
> 
> 
>> ---
>> Changes in v2:
>>   - updated commit message with reference to TRM and sample video
>> ---
>>  drivers/staging/media/hantro/rk3288_vpu_hw.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
>> index c0bdd6c02520..f8db6fcaad73 100644
>> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
>> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
>> @@ -67,10 +67,10 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
>>  		.max_depth = 2,
>>  		.frmsize = {
>>  			.min_width = 48,
>> -			.max_width = 3840,
>> +			.max_width = 4096,
>>  			.step_width = MB_DIM,
>>  			.min_height = 48,
>> -			.max_height = 2160,
>> +			.max_height = 2304,
>>  			.step_height = MB_DIM,
> 
> Hans, Mauro, we were intending to have this fix merged in 5.4 or at
> the very least be backported to the 5.4 stable branch at some point,
> the problem is, this patch is based on media/master which contains the
> s/MB_DIM_H264/MB_DIM/ change. I can send a new version based on
> media/fixes, but that means Linus will have a conflict when merging the
> media 5.5 PR in his tree. Are you fine dealing with this conflict
> (letting Linus know about the expected resolution or backmerging the -rc
> containing the fix in media/master so that he doesn't even have to deal
> with it), or should we just let this patch go in media/master and
> backport it later?

Backport it later once it is merged in mainline.

This patch doesn't fix a bug, it is really an enhancement, so I think this
can safely be delayed.

Regards,

	Hans

> 
>>  		},
>>  	},
> 

