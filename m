Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745C3411806
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 17:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241381AbhITPVN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 11:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241409AbhITPU5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 11:20:57 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC53AC061768;
        Mon, 20 Sep 2021 08:19:24 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:34ca:272f:b5af:bab9] (unknown [IPv6:2a02:810a:880:f54:34ca:272f:b5af:bab9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D30571F42F71;
        Mon, 20 Sep 2021 16:19:21 +0100 (BST)
Subject: Re: [PATCH v3] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Alexandre Courbot <acourbot@chromium.org>, kernel@collabora.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        dafna3@gmail.com, mchehab@kernel.org, tfiga@chromium.org,
        minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com,
        andrew-ct.chen@mediatek.com, tiffany.lin@mediatek.com,
        matthias.bgg@gmail.com, courbot@chromium.org, hsinyi@chromium.org,
        eizan@chromium.org
References: <20210825101717.18075-1-dafna.hirschfeld@collabora.com>
 <c1712278-8d18-2958-853b-09e5097ddce7@xs4all.nl>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8c8336ff-57aa-dac8-d4ef-5d1dd120b2db@collabora.com>
Date:   Mon, 20 Sep 2021 17:19:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c1712278-8d18-2958-853b-09e5097ddce7@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 01.09.21 10:50, Hans Verkuil wrote:
> On 25/08/2021 12:17, Dafna Hirschfeld wrote:
>> From: Alexandre Courbot <acourbot@chromium.org>
>>
>> When running memcpy_toio:
>> memcpy_toio(send_obj->share_buf, buf, len);
>> it was found that errors appear if len is not a multiple of 8:
>>
>> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
>>
>> This patch ensures the copy of a multile of 8 size by calling
> 
> multile -> multiple
> 
>> round_up(len, 8) when copying
>>
>> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>> changes since v2:
>> 1. do the extra copy only if len is not multiple of 8
>>
>> changes since v1:
>> 1. change sign-off-by tags
>> 2. change values to memset
>>
>>   drivers/media/platform/mtk-vpu/mtk_vpu.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>> index ec290dde59cf..658161ee3e4e 100644
>> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
>> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>> @@ -349,7 +349,16 @@ int vpu_ipi_send(struct platform_device *pdev,
>>   		}
>>   	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>>   
>> -	memcpy_toio(send_obj->share_buf, buf, len);
>> +	if (len % 8 != 0) {
> 
> You need to add a comment here explaining why this is done (basically what
> you also say in the commit log).
> 
> Otherwise people would have to dig into the git log to figure out why this
> code is the way it is.
> 
> Is len often not a multiple of 8? If that's the case, then it might be easier
> to just always do the memset/memcpy.

I wrote a program that prints the sizes of all possible messages: http://ix.io/3zsr
compiling it to arm64 gives:

sizeof(mdp_ipi_comm) is 24
sizeof(mdp_ipi_init) is 16

sizeof(venc_ap_ipi_msg_deinit) is 8
sizeof(venc_ap_ipi_msg_enc_ext) is 164
sizeof(venc_ap_ipi_msg_enc) is 32
sizeof(venc_ap_ipi_msg_set_param_ext) is 144
sizeof(venc_ap_ipi_msg_set_param) is 48
sizeof(venc_ap_ipi_msg_init) is 16

sizeof(vdec_ap_ipi_cmd) is 8
sizeof(vdec_ap_ipi_init) is 16
sizeof(vdec_ap_ipi_dec_start) is 24

BUT, when printing the size in the kernel I got "sizeof(mdp_ipi_comm) = 20" and found out
that this is due to the macro #pragma pack(push, 4) in mtk_mdp_ipi.h

so for mdp it makes sens to always do the memset/memcpy but for mtk-vcodec it is not necessary.
In addition, if the message is one of 'venc_ap_ipi_msg_enc_ext' or 'venc_ap_ipi_msg_set_param_ext' then vpu_ipi_send
will fail in the beginning of the function since in those cases we have 'len > sizeof(send_obj->share_buf)'.
so I should send a patch that set SHARE_BUF_SIZE to e.g. 200

I also found out that adding #pragma pack(push, 4) to the definitions of the mtk-vcodec messages has no influence but
maybe this should be added since we copy those messages to hw , so might avoid future bugs.

thanks,
Dafna

> 
> Regards,
> 
> 	Hans
> 
>> +		unsigned char data[SHARE_BUF_SIZE];
>> +
>> +		memset(data + len, 0, sizeof(data) - len);
>> +		memcpy(data, buf, len);
>> +		memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
>> +	} else {
>> +		memcpy_toio(send_obj->share_buf, buf, len);
>> +	}
>> +
>>   	writel(len, &send_obj->len);
>>   	writel(id, &send_obj->id);
>>   
>>
> 
