Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C3B63743D
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 09:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbiKXImk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 03:42:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiKXImi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 03:42:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D86FF3
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 00:42:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9031662035
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 08:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB5FC433D6;
        Thu, 24 Nov 2022 08:42:33 +0000 (UTC)
Message-ID: <0859e9ba-e080-261f-85f7-6ca21bbbde47@xs4all.nl>
Date:   Thu, 24 Nov 2022 09:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
Content-Language: en-US
To:     houlong wei <houlong.wei@mediatek.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "dafna3@gmail.com" <dafna3@gmail.com>,
        =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= 
        <tiffany.lin@mediatek.com>,
        =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= 
        <Andrew-CT.Chen@mediatek.com>,
        =?UTF-8?B?TWluZ2hzaXUgVHNhaSAo6JSh5piO5L+uKQ==?= 
        <Minghsiu.Tsai@mediatek.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        irui.wang@mediatek.com
References: <20211204144732.13472-1-dafna.hirschfeld@collabora.com>
 <aee15e0fae71436c0e75e2b7cea0638da5d8b707.camel@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <aee15e0fae71436c0e75e2b7cea0638da5d8b707.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna, Houlong,

I am marking this patch as 'Obsoleted' in patchwork because there has been
no updates or comments and it is too old. If you believe this is still
needed, then please repost after rebasing it.

Regards,

	Hans

On 06/12/2021 02:21, houlong wei wrote:
> cc mtk-vpu expert irui.wang.
> 
> On Sat, 2021-12-04 at 22:47 +0800, Dafna Hirschfeld wrote:
>> From: Alexandre Courbot <acourbot@chromium.org>
>>
>> When running memcpy_toio:
>> memcpy_toio(send_obj->share_buf, buf, len);
>> it was found that errors appear if len is not a multiple of 8:
>>
>> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
>>
>> This is because in ARM64, memcpy_toio does byte-size access
>> when the length is not a multiple of 8 while access to the
>> vpu iomem must be 4 aligned.
>>
>> This patch ensures the copy of a multiple of 8 size by calling
>> round_up(len, 8) when copying
>>
>> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM
>> buffer.")
>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
>> ---
>> changes since v4:
>> 1. replace data[SHARE_BUF_SIZE]; with data[sizeof(send_obj-
>>> share_buf)]
>> 2. Add the explanation for the failure in commit log and inline doc
>>
>> changes since v3:
>> 1. multile -> multiple
>> 2. add inline doc
>>
>> changes since v2:
>> 1. do the extra copy only if len is not multiple of 8
>>
>> changes since v1:
>> 1. change sign-off-by tags
>> 2. change values to memset
>>
>>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c
>> b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>> index 7f1647da0ade..2ef93db239b9 100644
>> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
>> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>> @@ -349,7 +349,22 @@ int vpu_ipi_send(struct platform_device *pdev,
>>  		}
>>  	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>>  
>> -	memcpy_toio(send_obj->share_buf, buf, len);
>> +	/*
>> +	 * On Arm64, the memcpy_toio does byte-size access as long as
>> address or length are
>> +	 * not 8 aligned. Access to the vpu iomem must be 4 aligned.
>> Byte-size access is
>> +	 * not allowed and cause processing to fail. Therefore make
>> sure the length
>> +	 * sent to memcpy_toio is a multiply of 8.
>> +	 */
>> +	if (len % 8 != 0) {
>> +		unsigned char data[sizeof(send_obj->share_buf)];
>> +
>> +		memset(data + len, 0, sizeof(data) - len);
>> +		memcpy(data, buf, len);
>> +		memcpy_toio(send_obj->share_buf, data, round_up(len,
>> 8));
>> +	} else {
>> +		memcpy_toio(send_obj->share_buf, buf, len);
>> +	}
>> +
>>  	writel(len, &send_obj->len);
>>  	writel(id, &send_obj->id);
>>  
>> -- 
>> 2.17.1
>>

