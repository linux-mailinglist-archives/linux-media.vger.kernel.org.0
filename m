Return-Path: <linux-media+bounces-12155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 336A78D3748
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 15:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64AFA1C22BDB
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 13:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C951C101DB;
	Wed, 29 May 2024 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cw6Jd7fH"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEE2DDAD;
	Wed, 29 May 2024 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988466; cv=none; b=sKV0wnsNrF4OtCID6mRj+mCzeyRucbRnLrc114s0gtUSDPeuu85vOV4GKGVE9b8uWs/S7ucpwS/0A6eMvaSLhccThMCmuAmVGuDNiYPfQsVuXrjcTXwLu/Emd9t6x4aueksVcFaEAO+onTHcEdCm4hqfvMvP/NSz/E+f7pFvZp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988466; c=relaxed/simple;
	bh=DHUO90PUPhlMJ3B+9LiJkV1K2D77bjBIutGq+bUUtz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAzSIsiACoyFAbgZfbWGYny9kJUQvWBwyuoSLzHNBrPVAS9eQb19b7uXq5Awa6EXRndcvlaZluO6XuqvyMIo9q/xdnM8Jv4bpBKjcBhkYsukPuKS0+7xB73+/W3Z8V6QcODziEQqEaOEDQNpMhLZ59a5hBPaWWC/oBo39XVRR64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cw6Jd7fH; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716988462;
	bh=DHUO90PUPhlMJ3B+9LiJkV1K2D77bjBIutGq+bUUtz4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cw6Jd7fHS8GjpN9WNQ9abAufl1Zgwyndm8aJDcc0mYCCJHPbcDPU78u+hCucvxDSY
	 UuUcvR7Z/XnpiviS9esGpR2ppZhmT1GuURxOm0JxsV6CyfxnN0fTQ295HbpFApHVMn
	 /fFWBIWezuhTpAzL6uR9/j78oaPfGzcUMyX7At1AOi1iHRKf7KOXz51SBxqO7FTt/5
	 Zx7qZ+LqRGbNhmzRXYcpSyOe3VHiyCQaHY6lm8KmpORNlYeD9eN1DRmabvaiZcnGKo
	 9Thv4w6N9xiKisfM1Zu5Ax/HlyWJmGr5VKohI2m+4Gn34obcVbqH9eu7BxcPMxD54e
	 LrjCUgo6LK6HQ==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CE9033782087;
	Wed, 29 May 2024 13:14:21 +0000 (UTC)
Message-ID: <8a007787-c648-4ae3-829f-7a0b17dd9a89@collabora.com>
Date: Wed, 29 May 2024 15:14:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: mediatek: vcodec: fix h264 multi statless
 decoder smatch warning
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "stevecho@chromium.org" <stevecho@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240229095611.6698-1-yunfei.dong@mediatek.com>
 <20240229095611.6698-2-yunfei.dong@mediatek.com>
 <4949bd54-8c32-4490-ab19-d38796d29ac1@collabora.com>
 <9ba79ccf849054974a937d1d605910cf4c8552d6.camel@mediatek.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <9ba79ccf849054974a937d1d605910cf4c8552d6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

W dniu 3.04.2024 o 05:45, Yunfei Dong (董云飞) pisze:
> Hi AngeloGioacchino,
> 
> Thanks for your reviewing.
> On Tue, 2024-04-02 at 11:50 +0200, AngeloGioacchino Del Regno wrote:
>> Il 29/02/24 10:56, Yunfei Dong ha scritto:
>>> Fix smatch static checker warning for vdec_h264_req_multi_if.c.
>>> Leading to kernel crash when fb is NULL.
>>>
>>> Fixes: 397edc703a10 ("media: mediatek: vcodec: add h264 decoder")
>>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>> ---
>>>    .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c         | 9
>>> +++++++--
>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git
>>> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req
>>> _multi_if.c
>>> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req
>>> _multi_if.c
>>> index 0e741e0dc8ba..ab8e708e0df1 100644
>>> ---
>>> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req
>>> _multi_if.c
>>> +++
>>> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req
>>> _multi_if.c
>>> @@ -724,11 +724,16 @@ static int vdec_h264_slice_single_decode(void
>>> *h_vdec, struct mtk_vcodec_mem *bs
>>>    		return vpu_dec_reset(vpu);
>>>    
>>>    	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
>>> +	if (!fb) {
>>> +		mtk_vdec_err(inst->ctx, "fb buffer is NULL");
>>> +		return -EBUSY;
>>> +	}
>>> +
>>>    	src_buf_info = container_of(bs, struct mtk_video_dec_buf,
>>> bs_buffer);
>>>    	dst_buf_info = container_of(fb, struct mtk_video_dec_buf,
>>> frame_buffer);
>>>    
>>> -	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
>>> -	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
>>
>> You're changing the behavior here, can you please explain why this
>> change is valid
>> into the commit description?
>>
> The driver already add the condition to check whether fb is NULL at the
> front, no need these two lines again.
> 

Maybe Angelo refers to the function never returning -EBUSY before?
While at it, if fb is a kind of a buffer, why not -ENOMEM
when get_cap_buffer() fails?

Regards,

Andrzej

>> Thanks,
>> Angelo
>>
> Best Regards,
> Yunfei Dong
>>> +	y_fb_dma = (u64)fb->base_y.dma_addr;
>>> +	c_fb_dma = (u64)fb->base_c.dma_addr;
>>>    	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx
>>> c_dma=%llx",
>>>    		       inst->ctx->decoded_frame_cnt, y_fb_dma,
>>> c_fb_dma);
>>>    
>>
>>
>>


