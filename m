Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC991D9D06
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 18:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728778AbgESQlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 12:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728689AbgESQlX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 12:41:23 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB95C08C5C0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 09:41:23 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id A1FEC2A23FD
Subject: Re: [PATCH 1/2] media: staging: rkisp1 stats: set a measure flag with
 '|=' instead of '='
From:   Helen Koike <helen.koike@collabora.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     ezequiel@collabora.com, dafna3@gmail.com, kernel@collabora.com,
        hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200509152904.26348-1-dafna.hirschfeld@collabora.com>
 <ce920d19-c602-3ba9-2078-913bb16e8c95@collabora.com>
Message-ID: <0c22dbf1-1360-5afa-d508-f41164cf37da@collabora.com>
Date:   Tue, 19 May 2020 13:41:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ce920d19-c602-3ba9-2078-913bb16e8c95@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/19/20 1:39 PM, Helen Koike wrote:
> Hi Dafna,
> 
> Thanks for the patch.
> 
> On 5/9/20 12:29 PM, Dafna Hirschfeld wrote:
>> The flag RKISP1_CIF_ISP_STAT_AFM_FIN that indicates a type of
>> statistics is mistakenly set with '=' instead of '|='
>> this might set off previous flags.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>  drivers/staging/media/rkisp1/rkisp1-stats.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
>> index 6dfcbdc3deb8..8351bda0be03 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
>> @@ -253,7 +253,7 @@ static void rkisp1_stats_get_afc_meas(struct rkisp1_stats *stats,
>>  	struct rkisp1_device *rkisp1 = stats->rkisp1;
>>  	struct rkisp1_cif_isp_af_stat *af;
>>  
>> -	pbuf->meas_type = RKISP1_CIF_ISP_STAT_AFM_FIN;
>> +	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AFM_FIN;
> 
> It seems there is a redundancy, the place that calls this function already sets this bit.
> It seems there is a similar issue in all rkisp1_stats_get_* functions.
> 
> Could you please check and do the proper cleanup?

Please ignore my comment, for some reason I didn't see the second patch.

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> 
> Thanks
> Helen
> 
>>  
>>  	af = &pbuf->params.af;
>>  	af->window[0].sum = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AFM_SUM_A);
>>
