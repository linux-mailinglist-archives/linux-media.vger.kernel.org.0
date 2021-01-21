Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8DD2FE933
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 12:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729696AbhAULr7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 06:47:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730274AbhAULrx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 06:47:53 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CAA4C061575
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 03:47:13 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D14281F45C82
Subject: Re: [PATCH v7 2/5] media: rkisp1: stats: remove a wrong cast to u8
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Collabora Kernel ML <kernel@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210120164446.1220-1-dafna.hirschfeld@collabora.com>
 <20210120164446.1220-3-dafna.hirschfeld@collabora.com>
 <CAAFQd5AyE87V7u6heJp24VUXVBMzqrQ6nUVa-mVr0JUADSVq=g@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <45ade6c9-b163-0db9-57e7-599e900054f5@collabora.com>
Date:   Thu, 21 Jan 2021 12:47:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5AyE87V7u6heJp24VUXVBMzqrQ6nUVa-mVr0JUADSVq=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 21.01.21 um 11:07 schrieb Tomasz Figa:
> Hi Dafna,
> 
> On Thu, Jan 21, 2021 at 1:45 AM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> hist_bins is an array of type __u32. Each entry represent
>> a 20 bit fixed point value as documented inline.
>> The cast to u8 when setting the values is wrong. Remove it.
> 
> Thanks for the patch. See my comment inline.
> 
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>> index 3ddab8fa8f2d..4cdb180fa64d 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>> @@ -235,8 +235,7 @@ static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
>>          pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
>>          for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
>>                  pbuf->params.hist.hist_bins[i] =
>> -                       (u8)rkisp1_read(rkisp1,
>> -                                       RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
>> +                       rkisp1_read(rkisp1, RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
> 
> Is the register guaranteed to return 0 for the upper unused 12 bits?
> Should we mask them instead?

I printed the values and I always see 0 for the last 12 bits. But the datasheet
does not say that explicitly.
I can add a mask to be on the safe side.

Thanks,
Dafna

> 
> Best regards,
> Tomasz
> 
