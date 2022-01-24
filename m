Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F29B499CAE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 23:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354125AbiAXWG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 17:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1454634AbiAXVdT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 16:33:19 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21882C075D13
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 12:21:21 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id a203-20020a1c98d4000000b0034d2956eb04so193976wme.5
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 12:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=L7Z367An0XQXA3IfS2t7lE/P4WVIsL4Rvo0sJu7Bhew=;
        b=YrSUTbiCwqvog8COCITrB6k/QYeDJXuqk+SVZOh8RbNO+GyZIT/ywoyyBt6fsiBbD3
         KLJeIZRuXVeczNbCXanWH1GsuM8dOUTpNrEcvfYg3tb8eN5gd2REjJ5jNY3dGunqbDxn
         BmfSVoEw/Fn80x1B/TnvPohOqAMZrKk9IFn3bKt5sDoyniiQ0/8lzAQGBQABJ5kky95/
         EQcfWUdv09295PwsRgPpLC2O/Lth1h7nkDINx9EZX3Cfbv9QKBKVdVVEQG/skbIoQn3x
         KtWj7RMvuniJBx5ZuUWfiB+KJsV1nzBt3SXwKqCaPrjbL8m7wB7ClDlt3nFYBi3y7OP0
         B+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=L7Z367An0XQXA3IfS2t7lE/P4WVIsL4Rvo0sJu7Bhew=;
        b=U/xibGCE/oAEPV73aHwCscSPj3KYE2nf3I2LvzFxljvIWAvpqwGwhu8fmsY+yZ/eUw
         VxfKzYndcqDyknWB5G+fNqvgtFGyxXQjHq+mmli6EreXE9ceDzLEJ3dY+pmwPxEdmdXK
         ink/dzMefq/qpnH/iSO3k7JE6PVuxIErVVDp9kP3IriheEVyTwPEoxwmk6W383Nq1J30
         TMjPtOHropgsmS369Bzmoz2rRNDrue84SPWhVByZpfujcgDSzohtYLHcCXHTVDGfGvxH
         oNBZhvTZAGNjI+7DHROCOt0OjtaiHFIGehA0pJoL4/Jy7M46feiQuRytNF/MM4Vh2ytb
         kegA==
X-Gm-Message-State: AOAM532g7zYrILpBTuzh2XBSzaQ1ITJywATLgJ9YDEs9Y2rMvMaFKP4o
        uSe1FVI+QzNuCSIzxgy08AQ=
X-Google-Smtp-Source: ABdhPJxMGwE8fCxmF8kobgHSMo2QP5IbtpBQv55xLXDJrSWmJKgFjF06ZYZ1tpyQo7cdwBcn7FSKlg==
X-Received: by 2002:a7b:c20a:: with SMTP id x10mr16078wmi.141.1643055679673;
        Mon, 24 Jan 2022 12:21:19 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:139c:f8a8:1313:ffa0? ([2a02:908:1252:fb60:139c:f8a8:1313:ffa0])
        by smtp.gmail.com with ESMTPSA id m8sm5983411wrn.106.2022.01.24.12.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 12:21:19 -0800 (PST)
Subject: Re: [PATCH 01/11] drm/radeon: use ttm_resource_manager_debug
To:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
References: <20220124130328.2376-1-christian.koenig@amd.com>
 <20220124130328.2376-2-christian.koenig@amd.com>
 <e0138a97e91678c0bd8d06071b6398c09d9c4142.camel@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f10e56a4-4ade-a7c4-8ce7-caff821a4a02@gmail.com>
Date:   Mon, 24 Jan 2022 21:21:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e0138a97e91678c0bd8d06071b6398c09d9c4142.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 24.01.22 um 17:33 schrieb Thomas Hellström:
> On Mon, 2022-01-24 at 14:03 +0100, Christian König wrote:
>> Instead of calling the debug operation directly.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Huang Rui <ray.huang@amd.com>
> The first two patches seem unrelated to the series.

No idea what happened here, those two are already upstream.

I probably just forgot to pull drm-misc-next changes from a different 
system.

> Also is there a chance of a series cover-letter?

Going to add one the next time, but I though it would be pretty clear 
what this is now about.

Thanks,
Christian.

>
> Thanks,
> Thomas
>
>
>
>> ---
>>   drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
>> b/drivers/gpu/drm/radeon/radeon_ttm.c
>> index 11b21d605584..0d1283cdc8fb 100644
>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>> @@ -802,7 +802,7 @@ static int radeon_mm_vram_dump_table_show(struct
>> seq_file *m, void *unused)
>>                                                             
>> TTM_PL_VRAM);
>>          struct drm_printer p = drm_seq_file_printer(m);
>>   
>> -       man->func->debug(man, &p);
>> +       ttm_resource_manager_debug(man, &p);
>>          return 0;
>>   }
>>   
>> @@ -820,7 +820,7 @@ static int radeon_mm_gtt_dump_table_show(struct
>> seq_file *m, void *unused)
>>                                                             
>> TTM_PL_TT);
>>          struct drm_printer p = drm_seq_file_printer(m);
>>   
>> -       man->func->debug(man, &p);
>> +       ttm_resource_manager_debug(man, &p);
>>          return 0;
>>   }
>>   
>

