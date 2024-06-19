Return-Path: <linux-media+bounces-13679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E665C90E851
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 12:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 698FA1F21F50
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 10:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54316F2F8;
	Wed, 19 Jun 2024 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kq8EXNUE"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF34277F0B;
	Wed, 19 Jun 2024 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718792854; cv=none; b=EsywL7MC0wxXRUr5aa9tW8UCA1aZhV+EQ9rvxDHbk7HsCkjyam6NW2hkK8qzoqfSSGfOhi3AYCROESThVvQ87hwOskQ0HnDRTyVwZre7S1WhIo1I0RXCv0ZgbhkGndbTSNmDfTdiktuoDrt+9TmfVtUnc+bbopZajKkwoVM+I2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718792854; c=relaxed/simple;
	bh=Po6rLiiLYmVB2a4i9yoEDHQtVf1CvljI6wljwScnm/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXXKxU8m+oMe26Dqb9UtzOw30xZdvkwBEEG7OuTNNXqhGoBNU4owc4JXHIVD2bNSVuqkDM7mPeabD4lCKNkDltu/7yJKg2PLekN301uMat3JVWtMmGg47bH+QeaELM2Z3lbnO76LDqqYh8I7WJ9HSQE4a41CQnEktNdvSGo2mRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kq8EXNUE; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718792850;
	bh=Po6rLiiLYmVB2a4i9yoEDHQtVf1CvljI6wljwScnm/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kq8EXNUEhE6G5wgiCNTojlxDD0ITutYp3eNUlwYNjNrYROuZrSQn83dvBAwhSa5KF
	 nGsT2K20V+mL9JeixZ2gcpIdxgXGf8va3gsMwv46qFMC43VjzzJuZLP1aBH63+dima
	 u8zyjfnsuUmO5Kfsj8o8DyBayOE1IHEaNHvwTs8dl7nn2UddiLIDPlx/hJpXdygng7
	 Va9lvIFRRLz1RDpWUN3THDw4x5lOvwjM24PSq97K40nXIWbnay1zgnko1L9g9F1scU
	 y+J6boAX5/19xL/Ur5N8i11AJjCsnnjrarBPsmBcKu2FwcKjIkcUQUwkFFzuHQPd2t
	 WXDrIZpiGbJGQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B54A93780F7F;
	Wed, 19 Jun 2024 10:27:29 +0000 (UTC)
Message-ID: <c8ec67c6-a486-4665-b5ce-ea858116a8a2@collabora.com>
Date: Wed, 19 Jun 2024 12:27:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: mediatek: mtk-mutex: Add support for MT8188
 VPPSYS
To: Fei Shao <fshao@chromium.org>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, amergnat@baylibre.com, moudy.ho@mediatek.com,
 hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com,
 u.kleine-koenig@pengutronix.de, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
 <20240322092845.381313-3-angelogioacchino.delregno@collabora.com>
 <CAC=S1niaYZ=NNTwfSrJPdj79uG_hmqGm=cz_Sis3Zrf9octsnw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1niaYZ=NNTwfSrJPdj79uG_hmqGm=cz_Sis3Zrf9octsnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 19/06/24 12:09, Fei Shao ha scritto:
> Hi Angelo,
> 
> On Fri, Mar 22, 2024 at 5:29 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add MT8188 VPPSYS0 and VPPSYS1 mutex info to driver data
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/soc/mediatek/mtk-mutex.c | 41 ++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
>> index 73c256d3950b..b5af1fb5847e 100644
>> --- a/drivers/soc/mediatek/mtk-mutex.c
>> +++ b/drivers/soc/mediatek/mtk-mutex.c
>> @@ -496,6 +496,39 @@ static const unsigned int mt8188_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>>          [DDP_COMPONENT_MERGE5] = MT8188_MUTEX_MOD_DISP1_VPP_MERGE4,
>>   };
>>
>> +static const unsigned int mt8188_mdp_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
>> +       [MUTEX_MOD_IDX_MDP_RDMA0] = MT8195_MUTEX_MOD_MDP_RDMA0,
>> +       [MUTEX_MOD_IDX_MDP_RDMA2] = MT8195_MUTEX_MOD_MDP_RDMA2,
>> +       [MUTEX_MOD_IDX_MDP_RDMA3] = MT8195_MUTEX_MOD_MDP_RDMA3,
>> +       [MUTEX_MOD_IDX_MDP_FG0] = MT8195_MUTEX_MOD_MDP_FG0,
>> +       [MUTEX_MOD_IDX_MDP_FG2] = MT8195_MUTEX_MOD_MDP_FG2,
>> +       [MUTEX_MOD_IDX_MDP_FG3] = MT8195_MUTEX_MOD_MDP_FG3,
>> +       [MUTEX_MOD_IDX_MDP_HDR0] = MT8195_MUTEX_MOD_MDP_HDR0,
>> +       [MUTEX_MOD_IDX_MDP_HDR2] = MT8195_MUTEX_MOD_MDP_HDR2,
>> +       [MUTEX_MOD_IDX_MDP_HDR3] = MT8195_MUTEX_MOD_MDP_HDR3,
>> +       [MUTEX_MOD_IDX_MDP_AAL0] = MT8195_MUTEX_MOD_MDP_AAL0,
>> +       [MUTEX_MOD_IDX_MDP_AAL2] = MT8195_MUTEX_MOD_MDP_AAL2,
>> +       [MUTEX_MOD_IDX_MDP_AAL3] = MT8195_MUTEX_MOD_MDP_AAL3,
>> +       [MUTEX_MOD_IDX_MDP_RSZ0] = MT8195_MUTEX_MOD_MDP_RSZ0,
>> +       [MUTEX_MOD_IDX_MDP_RSZ2] = MT8195_MUTEX_MOD_MDP_RSZ2,
>> +       [MUTEX_MOD_IDX_MDP_RSZ3] = MT8195_MUTEX_MOD_MDP_RSZ3,
>> +       [MUTEX_MOD_IDX_MDP_MERGE2] = MT8195_MUTEX_MOD_MDP_MERGE2,
>> +       [MUTEX_MOD_IDX_MDP_MERGE3] = MT8195_MUTEX_MOD_MDP_MERGE3,
>> +       [MUTEX_MOD_IDX_MDP_TDSHP0] = MT8195_MUTEX_MOD_MDP_TDSHP0,
>> +       [MUTEX_MOD_IDX_MDP_TDSHP2] = MT8195_MUTEX_MOD_MDP_TDSHP2,
>> +       [MUTEX_MOD_IDX_MDP_TDSHP3] = MT8195_MUTEX_MOD_MDP_TDSHP3,
>> +       [MUTEX_MOD_IDX_MDP_COLOR0] = MT8195_MUTEX_MOD_MDP_COLOR0,
>> +       [MUTEX_MOD_IDX_MDP_COLOR2] = MT8195_MUTEX_MOD_MDP_COLOR2,
>> +       [MUTEX_MOD_IDX_MDP_COLOR3] = MT8195_MUTEX_MOD_MDP_COLOR3,
>> +       [MUTEX_MOD_IDX_MDP_OVL0] = MT8195_MUTEX_MOD_MDP_OVL0,
>> +       [MUTEX_MOD_IDX_MDP_PAD0] = MT8195_MUTEX_MOD_MDP_PAD0,
>> +       [MUTEX_MOD_IDX_MDP_PAD2] = MT8195_MUTEX_MOD_MDP_PAD2,
>> +       [MUTEX_MOD_IDX_MDP_PAD3] = MT8195_MUTEX_MOD_MDP_PAD3,
> 
> I know it's too late since this is in the tree already, but I noticed
> that MDP_COMP_TCC0 is added in the 4th patch but not here.
> Is that expected?
> 

Many, many, many thanks for that. I missed TCC0 for real in the mutex mod
list for MT8188, even though it's present at bit 10.

I'll send a Fixes commit adding that bit in a jiffy.

Cheers,
Angelo

> Everything else looks nice, so just a record in the mailing list:
> Reviewed-by: Fei Shao <fshao@chromium.org>
> 
> Regards,
> Fei
> 
> 
>> +       [MUTEX_MOD_IDX_MDP_WROT0] = MT8195_MUTEX_MOD_MDP_WROT0,
>> +       [MUTEX_MOD_IDX_MDP_WROT2] = MT8195_MUTEX_MOD_MDP_WROT2,
>> +       [MUTEX_MOD_IDX_MDP_WROT3] = MT8195_MUTEX_MOD_MDP_WROT3,
>> +};
>> +
>>   static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>>          [DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
>>          [DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
>> @@ -735,6 +768,13 @@ static const struct mtk_mutex_data mt8188_mutex_driver_data = {
>>          .mutex_sof_reg = MT8183_MUTEX0_SOF0,
>>   };
>>
>> +static const struct mtk_mutex_data mt8188_vpp_mutex_driver_data = {
>> +       .mutex_sof = mt8188_mutex_sof,
>> +       .mutex_mod_reg = MT8183_MUTEX0_MOD0,
>> +       .mutex_sof_reg = MT8183_MUTEX0_SOF0,
>> +       .mutex_table_mod = mt8188_mdp_mutex_table_mod,
>> +};
>> +
>>   static const struct mtk_mutex_data mt8192_mutex_driver_data = {
>>          .mutex_mod = mt8192_mutex_mod,
>>          .mutex_sof = mt8183_mutex_sof,
>> @@ -1089,6 +1129,7 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>>          { .compatible = "mediatek,mt8186-disp-mutex", .data = &mt8186_mutex_driver_data },
>>          { .compatible = "mediatek,mt8186-mdp3-mutex", .data = &mt8186_mdp_mutex_driver_data },
>>          { .compatible = "mediatek,mt8188-disp-mutex", .data = &mt8188_mutex_driver_data },
>> +       { .compatible = "mediatek,mt8188-vpp-mutex",  .data = &mt8188_vpp_mutex_driver_data },
>>          { .compatible = "mediatek,mt8192-disp-mutex", .data = &mt8192_mutex_driver_data },
>>          { .compatible = "mediatek,mt8195-disp-mutex", .data = &mt8195_mutex_driver_data },
>>          { .compatible = "mediatek,mt8195-vpp-mutex",  .data = &mt8195_vpp_mutex_driver_data },
>> --
>> 2.44.0
>>
>>



