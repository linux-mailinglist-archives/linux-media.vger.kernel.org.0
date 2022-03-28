Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC5DF4E8F28
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 09:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238877AbiC1Hkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 03:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238875AbiC1Hki (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 03:40:38 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7112552E21;
        Mon, 28 Mar 2022 00:38:56 -0700 (PDT)
Received: from [192.168.0.3] (ip5f5aef5a.dynamic.kabel-deutschland.de [95.90.239.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id BB57661EA1927;
        Mon, 28 Mar 2022 09:38:54 +0200 (CEST)
Message-ID: <2e91b545-bde3-3626-e889-be268d01971c@molgen.mpg.de>
Date:   Mon, 28 Mar 2022 09:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amdgpu: resolve s3 hang for r7340
Content-Language: en-US
From:   Paul Menzel <pmenzel@molgen.mpg.de>
To:     Zhenneng Li <lizhenneng@kylinos.cn>
Cc:     Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Pan Xinhui <Xinhui.Pan@amd.com>,
        Guchun Chen <guchun.chen@amd.com>,
        David Airlie <airlied@linux.ie>,
        Lijo Lazar <lijo.lazar@amd.com>, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Kevin Wang <kevin1.wang@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Evan Quan <evan.quan@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
References: <20220328040536.4121797-1-lizhenneng@kylinos.cn>
 <cd36a994-0c13-201c-522d-5f8af53e1e87@molgen.mpg.de>
In-Reply-To: <cd36a994-0c13-201c-522d-5f8af53e1e87@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[Cc: -Jack Zhang (invalid address)

Am 28.03.22 um 09:36 schrieb Paul Menzel:
> Dear Zhenneng,
> 
> 
> Thank you for your patch.
> 
> Am 28.03.22 um 06:05 schrieb Zhenneng Li:
>> This is a workaround for s3 hang for r7340(amdgpu).
> 
> Is it hanging when resuming from S3? Maybe also use the line below for 
> the commit message summary:
> 
> drm/amdgpu: Add 1 ms delay to init handler to fix s3 resume hang
> 
> Also, please add a space before the ( in “r7340(amdgpu)”.
> 
>> When we test s3 with r7340 on arm64 platform, graphics card will hang up,
>> the error message are as follows:
>> Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.599374][ 7] [  T291] amdgpu 0000:02:00.0: fb0: amdgpudrmfb frame buffer device
>> Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.612869][ 7] [  T291] [drm:amdgpu_device_ip_late_init [amdgpu]] *ERROR* late_init of IP block <si_dpm> failed -22
>> Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.623392][ 7] [  T291] amdgpu 0000:02:00.0: amdgpu_device_ip_late_init failed
>> Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.630696][ 7] [  T291] amdgpu 0000:02:00.0: Fatal error during GPU init
>> Mar  4 01:14:11 greatwall-GW-XXXXXX-XXX kernel: [    1.637477][ 7] [  T291] [drm] amdgpu: finishing device.
> 
> The prefix in the beginning is not really needed. Only the stuff after 
> `kernel: `.
> 
> Maybe also add the output of `lspci -nn -s …` for that r7340 device.
> 
>> Change-Id: I5048b3894c0ca9faf2f4847ddab61f9eb17b4823
> 
> Without the Gerrit instance this belongs to, the Change-Id is of no use 
> in the public.
> 
>> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 3987ecb24ef4..1eced991b5b2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2903,6 +2903,8 @@ static void 
>> amdgpu_device_delayed_init_work_handler(struct work_struct *work)
>>           container_of(work, struct amdgpu_device, delayed_init_work.work);
>>       int r;
>> +    mdelay(1);
>> +
> 
> Wow, I wonder how long it took you to find that workaround.
> 
>>       r = amdgpu_ib_ring_tests(adev);
>>       if (r)
>>           DRM_ERROR("ib ring test failed (%d).\n", r);
> 
> 
> Kind regards,
> 
> Paul
