Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3892FCE72
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387689AbhATKmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:42:21 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56207 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730486AbhATJ7p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:59:45 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2AGRlJIzlftvz2AGUl8mub; Wed, 20 Jan 2021 10:59:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611136743; bh=DdqUWSmv8YNKQVMaQePmw3VSSDhK0UIyxAcq2+aVNPU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=E9F8SU+AtOnXDWmy3Se6rP9Z5/KsdWK94C6ZkdcwfaomMwsRCEwv9CbOuWt1kCyjV
         AgI6ykV2L1SvJFMiNcF1bLmoBZlb03gyrzqeQvIPfVngssyA6v9O2J47vUR6auilUX
         rKZ7TfXKUMNOM2absHCeRxCdtIyV3ninYzsRO97Kxqbwx468EC2XlvbknM3XyaX+I2
         Qw4rTGgYXRKmEAZvW1M9vGc5lAK60e6Gvs6K4zVeK5dr6ALbB8F7X9BI9mDcLY/Gyv
         Y7h509gpicN+Cil88qYU/NgjH2YStV8afK9fG8O/oU4CN61R9C6oKV5f2n9nBrSe0z
         08b5C6rrA6rgw==
Subject: Re: [PATCH] media: rkisp1: uapi: change hist_bins array type from
 __u16 to __u32
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        heiko@sntech.de
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20210119145341.29686-1-dafna.hirschfeld@collabora.com>
 <a8f8d9e9-30b1-b594-a9bc-f4a11924bf56@xs4all.nl>
 <fbe57350-f319-dbc7-f093-d3c1c76feb89@collabora.com>
 <2e48068e-fcc4-9288-a9a6-59f71d7f20ce@xs4all.nl>
 <65be169f-417f-a1f5-53e7-31f701a04d08@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <41194a0e-e8ef-1acf-82c2-3553e17e5dca@xs4all.nl>
Date:   Wed, 20 Jan 2021 10:58:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <65be169f-417f-a1f5-53e7-31f701a04d08@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH+t+iGgGGp5SMOEcV9BYU9Zs4V6rKDSm3PBHEBUj/XpmZW+n11741B9Gc6jK3EbrYrRqY/q6GCZckDH5ni3NdWIQqTsZekZyawNDGS20dwtX/AIEfk9
 rJT8Cx7Xl3S1pJlUBTUIT4s8s5ggPOBVWlk4GH/S8voiLsR5iYCLH9pihEdQqIcewfSm4Sd1bVpZlysvY72aXjrcPslwfGNBZMrRS7m9BZX9vaVaBJal6dEH
 JBsgMKWCZj1tWuznV7gQ/sbjHpsTyP1xXt+bxYHXAkEuNJZ6ms7TKVqHNFazWyvV0nMDHDWhu+f7w/Rxzkzw4GtFJTxX4VHaJh0WHG6DUdnwt1JbZnh4YN2R
 zg4GvPEmNr2pzE0vAW90E1Bf2yeC7398qDANe4nlvI6EEhCxElcS71oPefgU3BBfCRxGWZJeG9jVdw5u3OhauqG8v0KWT+UkI8wlSIvegUBC6A5b3f7DKLzw
 ZhUSv9UVPoZEnmHrSLl+/QWCf7MNFXW/VXAWPJsMcUUS88nfY4nH26mP/o0jzkujwNL+QeWOXxUXppUVnV3Vf7X+MLfhprXlpb+k+z7vT1pucFEypKYiQASP
 4JoIrCbROpVdfQmg6a3AqW/K
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/01/2021 18:47, Dafna Hirschfeld wrote:
> 
> 
> Am 19.01.21 um 17:32 schrieb Hans Verkuil:
>> On 19/01/2021 16:32, Dafna Hirschfeld wrote:
>>>
>>>
>>> Am 19.01.21 um 16:00 schrieb Hans Verkuil:
>>>> On 19/01/2021 15:53, Dafna Hirschfeld wrote:
>>>>> Each entry in the array is a 20 bits value composed of 16
>>>>> bits unsigned integer and 4 bits fractional part. So the
>>>>> type should change to __u32.
>>>>>
>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>> ---
>>>>> This patch is applied on top of v6 of the patchset
>>>>> "Fix the rkisp1 userspace API for later IP versions"
>>>>>
>>>>>    include/uapi/linux/rkisp1-config.h | 5 +++--
>>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>>>>> index 57ca3eea985f..47f6b84d7c56 100644
>>>>> --- a/include/uapi/linux/rkisp1-config.h
>>>>> +++ b/include/uapi/linux/rkisp1-config.h
>>>>> @@ -895,7 +895,8 @@ struct rkisp1_cif_isp_af_stat {
>>>>>    /**
>>>>>     * struct rkisp1_cif_isp_hist_stat - statistics histogram data
>>>>>     *
>>>>> - * @hist_bins: measured bin counters
>>>>> + * @hist_bins: measured bin counters. Each bin is a 20 bits value
>>>>> + *	       composed of a 16-bit unsigned integer and 4 bits fractional part.
>>>>
>>>> So bits 0-3 are the fractional part and bits 4-19 contain the integer part?
>>>> What goes where should be defined!
>>>
>>> Actually I don't know, I just copied the docs in the datasheet.
>>> I can try figure it out. I can meanwhile send a patch without the doc until
>>> we are sure. Is that OK?
>>
>> No, this should be documented properly.
> 
> I see that indeed bits 0-3 are the fractional part.
> The measurements are taken over 25 sub-windows and it is possible to
> give a weight to each window. If I set all weights to 1 then I expect to get
> an integer value and indeed in that case I see that the last 4 bits are always 0.
> If I set the weights to other than 1 I get the last 4 bits not only 0.
> 
> The UAPI is generally not very good documented mainly because there is currently
> no open source userspace that uses it.
> 
>>
>> Is this the only fractional type that is used in the rkisp1 uapi or are there
>> others? (Just checking).
> 
> There are other places as well.
> I see that there are some values in rkisp1_cif_isp_lsc_config that are fractional
> and not documented.
> The two other fractional types in the uapi are already documented.
> 
> I can add a patch that extends the documentation of all the fields in the uapi using the datasheet.
> But I think such a patch can be added after de-staging.

You need to make changes anyway in the uAPI for 5.11 (including fixing the
bad u8 cast), so let's do this right.

Regards,

	Hans

> 
> Thanks,
> Dafna
> 
> 
>>
>>>
>>>>
>>>> Looking at rkisp1_stats_get_hst_meas() I see this:
>>>>
>>>>           for (i = 0; i < RKISP1_CIF_ISP_HIST_BIN_N_MAX; i++)
>>>>                   pbuf->params.hist.hist_bins[i] =
>>>>                           (u8)rkisp1_read(rkisp1,
>>>>                                           RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
>>>>
>>>> Here this is cast to a u8, so how does this work?
>>>
>>> This seems to be a bug. I see that this cast is introduced in v12 of the patch
>>> "media: staging: rkisp1: add capture device for statistics".
>>> This cast does not exist in any of the downstream versions.
>>
>> Clearly something that needs to be fixed as well.
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Thanks,
>>> Dafna
>>>
>>>>
>>>> There is something fishy here...
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>>>     *
>>>>>     * The histogram values divided into 16 bins for V10/V11 and 32 bins
>>>>>     * for V12/V13. It is configured within the struct rkisp1_cif_isp_hst_config.
>>>>> @@ -909,7 +910,7 @@ struct rkisp1_cif_isp_af_stat {
>>>>>     * RKISP1_CIF_ISP_HIST_BIN_N_MAX is equal to the maximum of the two.
>>>>>     */
>>>>>    struct rkisp1_cif_isp_hist_stat {
>>>>> -	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>>>>> +	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>>>>>    };
>>>>>    
>>>>>    /**
>>>>>
>>>>
>>

