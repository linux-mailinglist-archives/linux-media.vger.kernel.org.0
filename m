Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8081E21593D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 16:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729224AbgGFOQ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 10:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgGFOQ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 10:16:56 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F8DC061755
        for <linux-media@vger.kernel.org>; Mon,  6 Jul 2020 07:16:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 7905C2A2D7F
Subject: Re: [PATCH 1/4] media: staging: rkisp1: remove two unused fields in
 uapi struct
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200625185017.16493-1-dafna.hirschfeld@collabora.com>
 <20200625185017.16493-2-dafna.hirschfeld@collabora.com>
 <164269d27b1d5bd1a70adb0b53acbda0baa903aa.camel@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <96f0b266-fa9d-d78b-ae34-6b660fea2c98@collabora.com>
Date:   Mon, 6 Jul 2020 16:16:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <164269d27b1d5bd1a70adb0b53acbda0baa903aa.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 26.06.20 14:47, Ezequiel Garcia wrote:
> Hi Dafna,
> 
> Thanks for all the rkisp1 patches, I hope we can get
> the driver out of staging soon.

me too.

> 
> On Thu, 2020-06-25 at 20:50 +0200, Dafna Hirschfeld wrote:
>> The fields 'config_width', 'config_height' in struct
>> 'rkisp1_cif_isp_lsc_config' are not used by the driver and
>> therefore are not needed. This patch removes them.
>> In later patch, documentation of the fields in struct
>> 'rkisp1_cif_isp_lsc_config' will be added.
>>
> 
> If I understand correctly, you are affecting the uAPI here.
> 
> The fact that the driver doesn't use it now, doesn't mean
> it won't need it at some later point.
> 
> I'm not saying the change is wrong, but that the "not currently
> in use" reason might be insufficient for a uAPI. If you
> want to remove this field, I suggest you make sure
> the field is inappropriate for this interface.
> 
I looked at the documentation and didn't find
any width/height values related to the LSC interface.
So I it seems to be ok to remove those fields.

> Also, it would be better if you could add a cover letter
> on all the series, there are a bunch of rkisp1 patches now
> and having a cover letter helps by adding some context.
> 

I did add a cover-letter: https://patchwork.kernel.org/cover/11625921/

Thanks,
Dafna

> Thanks,
> Ezequiel
> 
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> index ca0d031b14ac..7331bacf7dfd 100644
>> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> @@ -285,8 +285,6 @@ struct rkisp1_cif_isp_lsc_config {
>>   
>>   	__u32 x_size_tbl[RKISP1_CIF_ISP_LSC_SIZE_TBL_SIZE];
>>   	__u32 y_size_tbl[RKISP1_CIF_ISP_LSC_SIZE_TBL_SIZE];
>> -	__u16 config_width;
>> -	__u16 config_height;
>>   } __packed;
>>   
>>   /**
> 
> 
