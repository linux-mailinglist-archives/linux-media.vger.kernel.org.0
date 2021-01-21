Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0FD82FEAA2
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 13:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731522AbhAUMts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 07:49:48 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35880 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731345AbhAUMto (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 07:49:44 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 56A4B1F45CC5
Subject: Re: [PATCH v7 1/5] media: rkisp1: uapi: change hist_bins array type
 from __u16 to __u32
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, heiko.stuebner@theobroma-systems.com,
        heiko@sntech.de, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20210120164446.1220-1-dafna.hirschfeld@collabora.com>
 <20210120164446.1220-2-dafna.hirschfeld@collabora.com>
 <20210120213207.GN11878@paasikivi.fi.intel.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <12823703-5a32-f08a-5b4d-3a5ead231b33@collabora.com>
Date:   Thu, 21 Jan 2021 13:48:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120213207.GN11878@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 20.01.21 um 22:32 schrieb Sakari Ailus:
> Hi Dafna,
> 
> Thanks for the update.
> 
> On Wed, Jan 20, 2021 at 05:44:42PM +0100, Dafna Hirschfeld wrote:
>> Each entry in the array is a 20 bits value composed of 16
>> bits unsigned integer and 4 bits fractional part. So the
>> type should change to __u32.
>> In addition add a documentation of how the measurements
>> are done.
> 
> The commit message lines wrap at 74, under 60 is not much.
> 
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
> Should there be a Fixes: line? The patch is changing UAPI...
> 
> The file has been recently introduced. Should it go to fixes or to a stable
> kernel, too?

The file was in the staging directory and will be first destaged in the coming 5.11,
so I don't think this is necessary.

> 
>> ---
>>   include/uapi/linux/rkisp1-config.h | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>> index 6e449e784260..f75f8d698fb4 100644
>> --- a/include/uapi/linux/rkisp1-config.h
>> +++ b/include/uapi/linux/rkisp1-config.h
>> @@ -844,13 +844,17 @@ struct rkisp1_cif_isp_af_stat {
>>   /**
>>    * struct rkisp1_cif_isp_hist_stat - statistics histogram data
>>    *
>> - * @hist_bins: measured bin counters
>> + * @hist_bins: measured bin counters. Each bin is a 20 bits unsigned fixed point type.
>> + *	       Bits 0-4 are the fractional part and bits 5-19 are the integer part.
>>    *
>> - * Measurement window divided into 25 sub-windows, set
>> - * with ISP_HIST_XXX
>> + * The window of the measurements area is divided to 5x5 sub-windows. The histogram
>> + * is then computed for each sub-window independently and the final result is a weighted
>> + * average of the histogram measurements on all sub-windows.
>> + * The window of the measurements area and the weight of each sub-window are configurable
>> + * using struct @rkisp1_cif_isp_hst_config.
> 
> Please wrap the lines before 80.

ok,

Thanks,
Dafna

> 
>>    */
>>   struct rkisp1_cif_isp_hist_stat {
>> -	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>> +	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>>   };
>>   
>>   /**
>> -- 
>> 2.17.1
>>
> 
