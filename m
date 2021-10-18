Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EE64317AB
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 13:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhJRLp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 07:45:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33046 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhJRLp3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 07:45:29 -0400
Received: from [IPv6:2a02:810a:880:f54:88bb:da86:4533:43d6] (unknown [IPv6:2a02:810a:880:f54:88bb:da86:4533:43d6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A08951F42CB8;
        Mon, 18 Oct 2021 12:43:16 +0100 (BST)
Subject: Re: [PATCH 5/5] media: mtk-vcodec: venc: Fail if a msg sent to VPU
 was not signaled
To:     =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>
Cc:     "dafna3@gmail.com" <dafna3@gmail.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= 
        <tiffany.lin@mediatek.com>,
        "eizan@chromium.org" <eizan@chromium.org>,
        =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= 
        <Maoguang.Meng@mediatek.com>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= 
        <Yunfei.Dong@mediatek.com>,
        =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
        "hsinyi@chromium.org" <hsinyi@chromium.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= 
        <Andrew-CT.Chen@mediatek.com>,
        "acourbot@chromium.org" <acourbot@chromium.org>
References: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
 <20210804142729.7231-6-dafna.hirschfeld@collabora.com>
 <6c56de481d7060b759d67417e9fa6383f6e2f418.camel@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8973bfb4-8708-e739-02cb-f9ee670f401a@collabora.com>
Date:   Mon, 18 Oct 2021 13:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6c56de481d7060b759d67417e9fa6383f6e2f418.camel@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 06.08.21 08:50, Irui Wang (王瑞) wrote:
> On Wed, 2021-08-04 at 16:27 +0200, Dafna Hirschfeld wrote:
>> Each message sent to the VPU should raise a signal. The signal
>> handler sets vpu->signaled. Test the field and fail
>> if it is 0.
> 
> I suppose you want to handle the message execution result, if ipi
> message can't send or acked successfully, the returned "status" of
> "mtk_vcodec_fw_ipi_send" will return, so I think you don't need to
> check "signaled" again.

in that case, the field 'signaled' is not needed and can be removed
So I can send a patch to remove it.

Thanks,
Dafna

> 
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>> b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>> index 234705ba7cd6..8331b1bd1971 100644
>> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>> @@ -92,6 +92,7 @@ static int vpu_enc_send_msg(struct venc_vpu_inst
>> *vpu, void *msg,
>>   {
>>   	int status;
>>   
>> +	vpu->signaled = 0;
>>   	mtk_vcodec_debug_enter(vpu);
>>   
>>   	if (!vpu->ctx->dev->fw_handler) {
>> @@ -106,6 +107,8 @@ static int vpu_enc_send_msg(struct venc_vpu_inst
>> *vpu, void *msg,
>>   			       *(uint32_t *)msg, len, status);
>>   		return -EINVAL;
>>   	}
>> +	if (!vpu->signaled)
>> +		return -EINVAL;
>>   	if (vpu->failure)
>>   		return -EINVAL;
>>   
>> @@ -122,7 +125,6 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
>>   	mtk_vcodec_debug_enter(vpu);
>>   
>>   	init_waitqueue_head(&vpu->wq_hd);
>> -	vpu->signaled = 0;
>>   	vpu->failure = 0;
>>   
>>   	status = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
>> vpu->id,
