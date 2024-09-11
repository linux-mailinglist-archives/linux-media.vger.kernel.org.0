Return-Path: <linux-media+bounces-18150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9DA974CC4
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 10:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D14AE286730
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 08:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC32155398;
	Wed, 11 Sep 2024 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="ThBWrKYL"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1381531E8;
	Wed, 11 Sep 2024 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726043805; cv=pass; b=PUJac3EKzmmVLwx8mrNP4FAMkTTy8CA5MJ+Dv+Tx501qOp4Zxv1Noj8cacsDymlGMI1sSmy8eUN2ImBdAUltQEIbKSRtibuoFrvHa2+W/YkCajQGyVmN7S26zx6H3sHpELObXp8ZP92lN7K0P7fxnaOj5dnjcEriOi7lo5ivGCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726043805; c=relaxed/simple;
	bh=CisOF+GzloX2ELLDfmetlehnk05LJsWU/x4Br/cJY5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qwj0gxVIBVlajLZdj41QAt2st2g2BuGpgHWArzRaMNEdoVsxhxaimCeV7l8RIf5XTjdQhXYaWb4XPM8fEhwzaZbg3DzmgtpjMy+rk2+7PS4Y+kIsfNqa69MgD2R9dSSVMc/xdxObFku7qrg7BpESfb/4pmsYxYuDa+fvzrwgNQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=ThBWrKYL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726043782; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TIDGdcdMMfBpc3GHbU4HsJZjhc84rJnvMihZNDhRlLz0ZnDlnRBbV3jBBVzHA8tSwthmFj6xJquZAd0Fr0OhsPPMh5cPIry7w9oZMNuzcT0gg8Cj88I2qpQCYBdLsJiz8tKi5HSMKdIfG86DRhLil1ptb6wV+BDX2CdbNFqIsIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726043782; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mT3ADEMXwV/Ibk5Ee+fwaO68r9xxRfMHx8SLf6Y/bbY=; 
	b=bG7/b18qTJfrInI0H64mfKIG3XrP9/+zBZ9NwrjVWWbRM/yvFCt8W37AjVlYe2Lmi16/3iLFKBjLOzTJy8boBYjpcdHNBsAtYcY/kqnphah7P/twS/uYxu9gnbtBG01gVaXsH8XucatAq4Ho3jboGcA1zklsmWrfxdYa0NKjWTg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726043782;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mT3ADEMXwV/Ibk5Ee+fwaO68r9xxRfMHx8SLf6Y/bbY=;
	b=ThBWrKYLX5PZ30+1eyNiC+HqemAmvx0PJ6nvsfCKx71okggGmjGioItyiudqEuXJ
	1bV39Fm/MsFwdlI7SBqIl15mqZD2hqUTnA5gmpwZ19j3x+QeAeMMUqVXnqCL3ld1xom
	UdHqI7gjZZm2w8ia/INBZ9g9LDRrFHhShXeFEr7Y=
Received: by mx.zohomail.com with SMTPS id 1726043780360437.0100803082877;
	Wed, 11 Sep 2024 01:36:20 -0700 (PDT)
Message-ID: <6c6e00fd-334c-41ae-963c-eeffb368b727@collabora.com>
Date: Wed, 11 Sep 2024 10:36:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: av1: Fix reference video buffer
 pointer assignment
To: Nicolas Dufresne <nicolas@ndufresne.ca>, ezequiel@vanguardiasur.com.ar,
 p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <01020191dc45365b-26b103cd-153a-4b74-a663-ed7beecc1713-000000@eu-west-1.amazonses.com>
 <10f107089cf679bcabd03e49fc469bb89518deeb.camel@ndufresne.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <10f107089cf679bcabd03e49fc469bb89518deeb.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 10/09/2024 à 21:44, Nicolas Dufresne a écrit :
> Hi,
>
> Le mardi 10 septembre 2024 à 14:10 +0000, Benjamin Gaignard a écrit :
>> Always get new destination buffer for reference frame because nothing
>> garanty the one set previously is still valid or unused.
> Mind documenting here which tests got fixed with this change ?

Only one from chromium test suite:
https://chromium.googlesource.com/chromium/src/media/+/refs/heads/main/test/data/test-25fps.av1.ivf

Fluster AV1 score remains unchanged.

>
>> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   .../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c    | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> index 372dfcd0fcd9..2b9a1047479c 100644
>> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> @@ -161,8 +161,7 @@ static int rockchip_vpu981_av1_dec_frame_ref(struct hantro_ctx *ctx,
>>   		av1_dec->frame_refs[i].timestamp = timestamp;
>>   		av1_dec->frame_refs[i].frame_type = frame->frame_type;
>>   		av1_dec->frame_refs[i].order_hint = frame->order_hint;
>> -		if (!av1_dec->frame_refs[i].vb2_ref)
>> -			av1_dec->frame_refs[i].vb2_ref = hantro_get_dst_buf(ctx);
>> +		av1_dec->frame_refs[i].vb2_ref = hantro_get_dst_buf(ctx);
> Good catch, would still be nice to improve the commit message.
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
>>   
>>   		for (j = 0; j < V4L2_AV1_TOTAL_REFS_PER_FRAME; j++)
>>   			av1_dec->frame_refs[i].order_hints[j] = frame->order_hints[j];
>

