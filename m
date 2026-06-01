Return-Path: <linux-media+bounces-63252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJATDS6CHWqTbQkAu9opvQ
	(envelope-from <linux-media+bounces-63252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:59:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CA061FB2C
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C7313023531
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 12:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7180C36BCF2;
	Mon,  1 Jun 2026 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="QBuRn8wS"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C90375AAB;
	Mon,  1 Jun 2026 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318342; cv=none; b=Wi1XULBO2KnR4F9apKf+qlM7E+4p0KjTA/OAKhkEmHg5dyj/MshwCqnsPqh9Z2RqEoOo/x1WaYnDgs6IO18pFf+nluxRbFaKvmA03T/F3iIxMx7jOXZn8Z/SlDNnodu+llbGuj9pG0POAYEmK74RcL92D3Y9SImRPETypbDzCSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318342; c=relaxed/simple;
	bh=uASAkkWBuy7TVQlmssSLMlaamHgz3OsmdxP3AluMlPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJv72oLBtrVJsFJrGa77OGPqVvM9TP1POmkEro4FzNKc2WdTPjGc7sYMBIte6QuLGWSxzqpxCWy4VWZiZpzQVL6NlYIq/v+qINUdbefD5Jikdk90Zk+qG+VFMbBmGUff92+mtFjp8s1bmZzNOTp9hhtdmZNqtMTFrEdRmkRW4Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=QBuRn8wS; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [172.20.10.2] (78-80-16-54.customers.tmcz.cz [78.80.16.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 3B4065341082;
	Mon, 01 Jun 2026 14:52:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1780318337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fWt5ujZPTFFktwcOPAvnxBrtudIIrdMy5aPzWyXLRaY=;
	b=QBuRn8wSCeWV7YLbmwKxR3v/GvmGVreARQld4JjtUsIXEc847RXmof+wnvxOsbVQlmUe+W
	f6DvNivtZxJFoV0idGkS77+6J/e40i2cOl/qAZXmDHLLNHMlNur1nlI/6teIBs67Qbo+Wg
	EWHfe92YEQ/WbKravEgTJZk1qxaGg24=
Message-ID: <e101e3a6-643b-4a3a-ac54-ca381db633a3@ixit.cz>
Date: Mon, 1 Jun 2026 14:52:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v5 4/9] media: qcom: camss: Initialize lanes after
 lane configuration is available
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>,
 Cory Keitz <ckeitz@amazon.com>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
 <20260531-qcom-cphy-v5-4-6be0f62b4d65@ixit.cz>
 <ah1KS63aOL4wzhvb@kekkonen.localdomain>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <ah1KS63aOL4wzhvb@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63252-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,joelselvaraj.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,ixit.cz:email,ixit.cz:mid,ixit.cz:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 34CA061FB2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 11:00, Sakari Ailus wrote:
> Hi David,
> 
> On Sun, May 31, 2026 at 03:08:12PM +0200, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> The lanes must not be initialized before the driver has access to
>> the lane configuration, as it depends on whether D-PHY or C-PHY mode
>> is in use. Move the lane initialization to csiphy_lanes_enable which is
>> called when the configuration structures are available.
>>
>> Co-developed-by: Petr Hodina <phodina@protonmail.com>
>> Signed-off-by: Petr Hodina <phodina@protonmail.com>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 133 +++++++++++++++------
>>   1 file changed, 95 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index d4624417a7424..8bcba6107471f 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -1164,16 +1164,110 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>>   {
>>   	struct device *dev = csiphy->camss->dev;
>>   	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>>   	struct csiphy_device_regs *regs = csiphy->regs;
>>   	u8 settle_cnt;
>>   	u8 val;
>>   	int i;
>>   
>> +	switch (csiphy->camss->res->version) {
>> +	case CAMSS_845:
>> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +			regs->lane_regs = NULL;
>> +			regs->lane_array_size = 0;
> 
> Aren't these fields already initialised to 0?

I assume yes, but I wanted to be more explicit here so it's more obvious that 
C-PHY sequences are missing (until these get filled in by users).

> 
> Using the compatible string to assign these using device matching would be
> nice if possible.

Sure, thou if not explicitly requested, I would prefer to do minimal changes 
above the C-PHY itself introduction (it's pretty much breaking with every CAMSS 
version addition). I can do it as follow up, if wanted.

David

> 
>> +		} else {
>> +			regs->lane_regs = &lane_regs_sdm845[0];
>> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>> +		}
>> +		break;
>> +	case CAMSS_2290:
>> +	case CAMSS_6150:
>> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +			regs->lane_regs = NULL;
>> +			regs->lane_array_size = 0;
>> +		} else {
>> +			regs->lane_regs = &lane_regs_qcm2290[0];
>> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
>> +		}
>> +		break;
>> +	case CAMSS_6350:
>> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +			regs->lane_regs = NULL;
>> +			regs->lane_array_size = 0;
>> +		} else {
>> +			regs->lane_regs = &lane_regs_sm6350[0];
>> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
>> +		}
>> +		break;
>> +	case CAMSS_7280:
>> +	case CAMSS_8250:
>> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +			regs->lane_regs = NULL;
>> +			regs->lane_array_size = 0;
>> +		} else {
>> +			regs->lane_regs = &lane_regs_sm8250[0];
>> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
>> +		}
>> +		break;
>> +	case CAMSS_8280XP:
>> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +			regs->lane_regs = NULL;
>> +			regs->lane_array_size = 0;
>> +		} else {
>> +			regs->lane_regs = &lane_regs_sc8280xp[0];
>> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
>> +		}
>> +		break;
>> +	case CAMSS_X1E80100:
>> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +			regs->lane_regs = NULL;
>> +			regs->lane_array_size = 0;
>> +		} else {
>> +			regs->lane_regs = &lane_regs_x1e80100[0];
>> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
>> +		}
>> +		break;
>> +	case CAMSS_8550:
>> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +			regs->lane_regs = NULL;
>> +			regs->lane_array_size = 0;
>> +		} else {
>> +			regs->lane_regs = &lane_regs_sm8550[0];
>> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
>> +		}
>> +		break;
>> +	case CAMSS_8650:
>> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +			regs->lane_regs = NULL;
>> +			regs->lane_array_size = 0;
>> +		} else {
>> +			regs->lane_regs = &lane_regs_sm8650[0];
>> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
>> +		}
>> +		break;
>> +	case CAMSS_8300:
>> +	case CAMSS_8775P:
>> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +			regs->lane_regs = NULL;
>> +			regs->lane_array_size = 0;
>> +		} else {
>> +			regs->lane_regs = &lane_regs_sa8775p[0];
>> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
>> +		}
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (!regs->lane_regs && c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +		dev_err(dev, "Missing lane_regs definition for C-PHY\n");
>> +		return -EINVAL;
>> +	}
>> +
>>   	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>>   
>>   	val = 0;
>>   
>>   	switch (c->phy_cfg) {
>>   	case V4L2_MBUS_CSI2_CPHY:
>>   		for (i = 0; i < c->num_data; i++)
>>   			val |= BIT((c->data[i].pos * 2) + 1);
>> @@ -1235,63 +1329,26 @@ static int csiphy_init(struct csiphy_device *csiphy)
>>   	struct device *dev = csiphy->camss->dev;
>>   	struct csiphy_device_regs *regs;
>>   
>>   	regs = devm_kmalloc(dev, sizeof(*regs), GFP_KERNEL);
>>   	if (!regs)
>>   		return -ENOMEM;
>>   
>>   	csiphy->regs = regs;
>> -	regs->offset = 0x800;
>>   	regs->common_status_offset = 0xb0;
>>   
>>   	switch (csiphy->camss->res->version) {
>> -	case CAMSS_845:
>> -		regs->lane_regs = &lane_regs_sdm845[0];
>> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>> -		break;
>> -	case CAMSS_2290:
>> -	case CAMSS_6150:
>> -		regs->lane_regs = &lane_regs_qcm2290[0];
>> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
>> -		break;
>> -	case CAMSS_6350:
>> -		regs->lane_regs = &lane_regs_sm6350[0];
>> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
>> -		break;
>> -	case CAMSS_7280:
>> -	case CAMSS_8250:
>> -		regs->lane_regs = &lane_regs_sm8250[0];
>> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
>> -		break;
>> -	case CAMSS_8280XP:
>> -		regs->lane_regs = &lane_regs_sc8280xp[0];
>> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
>> -		break;
>>   	case CAMSS_X1E80100:
>> -		regs->lane_regs = &lane_regs_x1e80100[0];
>> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
>> -		regs->offset = 0x1000;
>> -		break;
>>   	case CAMSS_8550:
>> -		regs->lane_regs = &lane_regs_sm8550[0];
>> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
>> -		regs->offset = 0x1000;
>> -		break;
>>   	case CAMSS_8650:
>> -		regs->lane_regs = &lane_regs_sm8650[0];
>> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
>>   		regs->offset = 0x1000;
>>   		break;
>> -	case CAMSS_8300:
>> -	case CAMSS_8775P:
>> -		regs->lane_regs = &lane_regs_sa8775p[0];
>> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
>> -		break;
>>   	default:
>> +		regs->offset = 0x800;
>>   		break;
>>   	}
>>   
>>   	return 0;
>>   }
>>   
>>   const struct csiphy_hw_ops csiphy_ops_3ph_1_0 = {
>>   	.get_lane_mask = csiphy_get_lane_mask,
>>
>> -- 
>> 2.53.0
>>
>>
> 

-- 
David Heidelberg


