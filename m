Return-Path: <linux-media+bounces-47997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF58DC9907B
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 21:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 983693A4ADB
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 20:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18634275112;
	Mon,  1 Dec 2025 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="UcKyxYsz"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB87274671;
	Mon,  1 Dec 2025 20:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621027; cv=none; b=dDt2kUi5XSs1wPkoid7Hqt5ufDkHeL/2zwJyHMaR+Tw5DchUA4ddsbkYJqFM3OpJDJuV4fXJUSylT2kX8hGg+95YsfihForSFuFwFw1WSu8yqr1EN09XA8G3obYzaPAFHFell6ylWSWm4WMru+OSZaCbReiwXg4q/pes/+MWHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621027; c=relaxed/simple;
	bh=X6hdQsH+ZZiPiysrk4XAZsfeIyf2idoUO4G0nds0+Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uN2PY55HS+SEJmoyV9WUbIJGRpkpLyWjst4S1lQ70GGBn+Ueg5qwa4vAGCbz4lrMaSxuPUQYR18aXkNqFtfPkTdJ4u2HWkBNvU+W2h5UfJDdyxqjcCDB3aSbjsGyyaUif0yeGgtEM5Fogsa42vjsfae6wdSN3OG2rc+dTiBh7NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=UcKyxYsz; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id E7BC15340F59;
	Mon, 01 Dec 2025 21:30:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1764621015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Gvg1J67Y3jga9kWsJVUe+1pGfVC9eWJUE4oA+qnLBYg=;
	b=UcKyxYszjKVous0knnFpjJpJohVpVMgoXaQh8hxkzZ/4teJqhuZrsKdaz13qJaSXxL/yIo
	auHrvpZndgJhVzzSoQHOAG/PJg4eM3SzrseCmDKvzQ23eu/9HhMAhF0ZkfLP9D+E9Q9pH0
	EUtvHiyJqPznMhjYrqoGSikoIT78Dxs=
Message-ID: <c36134aa-a41d-47be-8eee-36cbe5435c7c@ixit.cz>
Date: Mon, 1 Dec 2025 21:30:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/8] media: qcom: camss: Prepare CSID for C-PHY
 support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-4-165f7e79b0e1@ixit.cz>
 <c65411c8-fe15-4cc4-9236-2232c55e4b86@linaro.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <c65411c8-fe15-4cc4-9236-2232c55e4b86@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/2025 12:37, Bryan O'Donoghue wrote:
> On 09/11/2025 09:39, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Inherit C-PHY information from CSIPHY, so we can configure CSID
>> properly.
>>
>> CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
>>   drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
>>   drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
>>   3 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> index 2a1746dcc1c5b..033036ae28a4f 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> @@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device 
>> *csid,
>>       val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>>       val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>>       val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +    val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
>>       writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
>>       val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/ 
>> media/platform/qcom/camss/camss-csid.c
>> index 5284b5857368c..68adea33cc719 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -1287,6 +1287,7 @@ static int csid_link_setup(struct media_entity 
>> *entity,
>>           csid->phy.csiphy_id = csiphy->id;
>>           lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>> +        csid->phy.cphy = lane_cfg->cphy;
>>           csid->phy.lane_cnt = lane_cfg->num_data;
>>           csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
>>       }
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/ 
>> media/platform/qcom/camss/camss-csid.h
>> index aedc96ed84b2f..a82db31bd2335 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -70,6 +70,7 @@ struct csid_phy_config {
>>       u32 lane_assign;
>>       u32 en_vc;
>>       u8 need_vc_update;
>> +    bool cphy;
>>   };
>>   struct csid_device;
>>
> 
> I'm not convinced you need another flag for this. It should be possible 
> for the CSID to get a pointer to the PHY and interrogate the encoded mode.

I'm not seeing elegant way to do this, if you look below my change 
above, others attributes are taken into csid_phy_config in similar way.

Or maybe I'm not seeing some easy/clean way here?

David

> 
> ---
> bod

-- 
David Heidelberg


