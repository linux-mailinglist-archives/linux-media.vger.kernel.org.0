Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEE82FBB44
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 16:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391314AbhASPdW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 10:33:22 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59864 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390775AbhASPdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 10:33:09 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D23E81F45370
Subject: Re: [PATCH] media: rkisp1: uapi: change hist_bins array type from
 __u16 to __u32
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, heiko@sntech.de
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20210119145341.29686-1-dafna.hirschfeld@collabora.com>
 <a8f8d9e9-30b1-b594-a9bc-f4a11924bf56@xs4all.nl>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <fbe57350-f319-dbc7-f093-d3c1c76feb89@collabora.com>
Date:   Tue, 19 Jan 2021 16:32:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a8f8d9e9-30b1-b594-a9bc-f4a11924bf56@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 19.01.21 um 16:00 schrieb Hans Verkuil:
> On 19/01/2021 15:53, Dafna Hirschfeld wrote:
>> Each entry in the array is a 20 bits value composed of 16
>> bits unsigned integer and 4 bits fractional part. So the
>> type should change to __u32.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>> This patch is applied on top of v6 of the patchset
>> "Fix the rkisp1 userspace API for later IP versions"
>>
>>   include/uapi/linux/rkisp1-config.h | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>> index 57ca3eea985f..47f6b84d7c56 100644
>> --- a/include/uapi/linux/rkisp1-config.h
>> +++ b/include/uapi/linux/rkisp1-config.h
>> @@ -895,7 +895,8 @@ struct rkisp1_cif_isp_af_stat {
>>   /**
>>    * struct rkisp1_cif_isp_hist_stat - statistics histogram data
>>    *
>> - * @hist_bins: measured bin counters
>> + * @hist_bins: measured bin counters. Each bin is a 20 bits value
>> + *	       composed of a 16-bit unsigned integer and 4 bits fractional part.
> 
> So bits 0-3 are the fractional part and bits 4-19 contain the integer part?
> What goes where should be defined!

Actually I don't know, I just copied the docs in the datasheet.
I can try figure it out. I can meanwhile send a patch without the doc until
we are sure. Is that OK?

> 
> Looking at rkisp1_stats_get_hst_meas() I see this:
> 
>          for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
>                  pbuf->params.hist.hist_bins[i] =
>                          (u8)rkisp1_read(rkisp1,
>                                          RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
> 
> Here this is cast to a u8, so how does this work?

This seems to be a bug. I see that this cast is introduced in v12 of the patch
"media: staging: rkisp1: add capture device for statistics".
This cast does not exist in any of the downstream versions.

Thanks,
Dafna

> 
> There is something fishy here...
> 
> Regards,
> 
> 	Hans
> 
>>    *
>>    * The histogram values divided into 16 bins for V10/V11 and 32 bins
>>    * for V12/V13. It is configured within the struct rkisp1_cif_isp_hst_config.
>> @@ -909,7 +910,7 @@ struct rkisp1_cif_isp_af_stat {
>>    * RKISP1_CIF_ISP_HIST_BIN_N_MAX is equal to the maximum of the two.
>>    */
>>   struct rkisp1_cif_isp_hist_stat {
>> -	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>> +	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>>   };
>>   
>>   /**
>>
> 
