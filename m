Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4013E2468
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 09:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239260AbhHFHtA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 03:49:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42820 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhHFHtA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 03:49:00 -0400
Received: from [IPv6:2a02:810a:880:f54:ec56:4a95:44cf:a8a] (unknown [IPv6:2a02:810a:880:f54:ec56:4a95:44cf:a8a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1183D1F443F8;
        Fri,  6 Aug 2021 08:48:42 +0100 (BST)
Subject: Re: [PATCH 4/5] media: mtk-vcodec: Add two error cases upon vpu irq
 handling
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
 <20210804142729.7231-5-dafna.hirschfeld@collabora.com>
 <81524c608e9ef640e71d969aa83d1a383e687b0a.camel@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <f343f406-111b-326f-3671-094e699a3aa6@collabora.com>
Date:   Fri, 6 Aug 2021 09:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <81524c608e9ef640e71d969aa83d1a383e687b0a.camel@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 06.08.21 08:58, Irui Wang (王瑞) wrote:
> On Wed, 2021-08-04 at 16:27 +0200, Dafna Hirschfeld wrote:
>> 1. Fail if the function mtk_vcodec_fw_map_dm_addr
>> returns ERR pointer.
>> 2. Fail if the state from the vpu msg is either
>> VEN_IPI_MSG_ENC_STATE_ERROR or VEN_IPI_MSG_ENC_STATE_PART
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>> b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>> index 32dc844d16f9..234705ba7cd6 100644
>> --- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>> +++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
>> @@ -17,6 +17,8 @@ static int handle_enc_init_msg(struct venc_vpu_inst
>> *vpu, const void *data)
>>   	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
>>   					     msg->vpu_inst_addr);
>>   
>> +	if (IS_ERR(vpu->vsi))
>> +		return PTR_ERR(vpu->vsi);
>>   	/* Firmware version field value is unspecified on MT8173. */
>>   	if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
>>   		return 0;
>> @@ -42,6 +44,12 @@ static int handle_enc_encode_msg(struct
>> venc_vpu_inst *vpu, const void *data)
>>   	vpu->state = msg->state;
>>   	vpu->bs_size = msg->bs_size;
>>   	vpu->is_key_frm = msg->is_key_frm;
>> +	if (vpu->state == VEN_IPI_MSG_ENC_STATE_ERROR ||
>> +	    vpu->state == VEN_IPI_MSG_ENC_STATE_PART) {
>> +		mtk_vcodec_err(vpu, "bad ipi-enc-state: %s",
>> +			       vpu->state ==
>> VEN_IPI_MSG_ENC_STATE_ERROR ? "ERR" : "PART");
>> +		return -EINVAL;
>> +	}
> 
> Hi Dafna,
> 
> This state check is useless, the enc result will check in
> "vpu_enc_ipi_handler".
> 

Hi, thanks for reviewing. I see that the vpu_enc_ipi_handler only test the msg->status
and I see that the states are not tested anywhere except of "skip" state in the h264 enc.

Can't there be a scenario where msg->status is ok but the state is error?
I am testing the vp8 encoder on chromeos and at some point the encoder interrupts stop arriving
so I try to figure out why and report any possible error.

Thanks,
Dafna

> Thanks
> 
>>   	return 0;
>>   }
>>   
