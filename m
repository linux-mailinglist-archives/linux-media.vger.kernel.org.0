Return-Path: <linux-media+bounces-64247-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1kZgH80ZJ2odrwIAu9opvQ
	(envelope-from <linux-media+bounces-64247-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 21:36:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B5965A19C
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 21:36:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ixit.cz header.s=dkim header.b=TT4U7ECQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64247-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64247-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ixit.cz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B922C304DEAB
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 19:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362B73E6DD5;
	Mon,  8 Jun 2026 19:32:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D7037DEAA;
	Mon,  8 Jun 2026 19:32:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780947174; cv=none; b=ck17O+CYv0E/8AbBpVBQB5Lembj9pPJrMW+sBZxjGAbwNyIn2bed1cCNRT+oz5HGq5GpEb8MTfd5P2JGC5YgrnwDf7dTExys4Wyo6oBwphSwrQiqtx1e9Yh9/zCJVouZvSXlOJzPciOGdLQVSQbOe7Q4nthw/ytbA++OSV/CXiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780947174; c=relaxed/simple;
	bh=MZPCAxHNr6f8ZQ8AfNZ3GIp722iWmuQI+ckc4qIZX8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyqq44mnm1Rv55BXANQ/xLcj2BsfzyFgfERrzMdEd1TyWHm7GeWiUzY8YNVcJToEWIHjoJMeUpWRjY2+DApejiSHqYVF7KsCaN74BBpQS6xiOU8AGX8O41dTsp0JjYpAqTjSy8jaKLwwOCvfWfc8KJ4A1MUoFd40GHC4pNTae2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=TT4U7ECQ; arc=none smtp.client-ip=185.100.197.86
Received: from [10.0.0.200] (unknown [10.88.125.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 32A3B5340E39;
	Mon, 08 Jun 2026 21:32:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1780947158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Tk8KTYVETv+cYFcpczO5q1tg0yHV9+DtGUYkbDQ7bMU=;
	b=TT4U7ECQW/lHR0AyFnlzqDTi2g+i76W6i7tkMvfUmLeo3RAg40EY18ry2jMM9iaLSOYk6E
	TpogioMilwPX71qH5lD6EV6l/7Y0Olqt8bx/fVOHGgihRe2zqWfvoW5ItWrDb1bq1COPck
	3FTYXMPhRNupsA7YHF39neXm9zpnBjg=
Message-ID: <92b08f05-4b1a-4cf8-8616-d16bd4bb26ba@ixit.cz>
Date: Mon, 8 Jun 2026 21:32:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Frank Li <Frank.Li@nxp.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
 <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
 <aicG5nsTy7rIuWTc@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <aicG5nsTy7rIuWTc@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64247-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[david@ixit.cz,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,nxp.com,linux.intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,ixit.cz:dkim,ixit.cz:email,ixit.cz:mid,ixit.cz:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6B5965A19C

On 08/06/2026 20:16, Frank Li wrote:
> On Fri, Jun 05, 2026 at 03:14:40PM +0200, David Heidelberg wrote:
>> So far, only D-PHY mode was supported, which uses even bits when enabling
>> or masking lanes. For C-PHY configuration, the hardware instead requires
>> using the odd bits.
>>
>> Since there can be unrecognized configuration allow returning failure.
>>
>> Acked-by: Cory Keitz <ckeitz@amazon.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 39 +++++++++++++++++-----
>>   1 file changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index dac8d2ecf7995..fa24fc9706748 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -9,16 +9,17 @@
>>    */
>>
>>   #include "camss.h"
>>   #include "camss-csiphy.h"
>>
>>   #include <linux/delay.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/io.h>
>> +#include <linux/media-bus-format.h>
>>
>>   #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
>>   #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
>>   #define CSIPHY_3PH_LNn_CFG2(n)			(0x004 + 0x100 * (n))
>>   #define CSIPHY_3PH_LNn_CFG2_LP_REC_EN_INT	BIT(3)
>>   #define CSIPHY_3PH_LNn_CFG3(n)			(0x008 + 0x100 * (n))
>>   #define CSIPHY_3PH_LNn_CFG4(n)			(0x00c + 0x100 * (n))
>>   #define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS	0xa4
>> @@ -1108,23 +1109,32 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>>   		writel_relaxed(val, csiphy->base + r->reg_addr);
>>   		if (r->delay_us)
>>   			udelay(r->delay_us);
>>   	}
>>   }
>>
>>   static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>>   {
>> -	u8 lane_mask;
>> -	int i;
>> +	u8 lane_mask = 0;
>> +	u8 offset = 0;
>>
>> -	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>> +	switch (lane_cfg->phy_cfg) {
>> +	case V4L2_MBUS_CSI2_CPHY:
>> +		offset = 1;
>> +		break;
>> +	case V4L2_MBUS_CSI2_DPHY:
>> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>>
>> -	for (i = 0; i < lane_cfg->num_data; i++)
>> -		lane_mask |= 1 << lane_cfg->data[i].pos;
>> +	for (int i = 0; i < lane_cfg->num_data; i++)
>> +		lane_mask |= BIT(lane_cfg->data[i].pos + offset);
>>
>>   	return lane_mask;
>>   }
>>
>>   static bool csiphy_is_gen2(u32 version)
>>   {
>>   	bool ret = false;
>>
>> @@ -1155,19 +1165,32 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>   	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>>   	struct csiphy_device_regs *regs = csiphy->regs;
>>   	u8 settle_cnt;
>>   	u8 val;
>>   	int i;
>>
>>   	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>>
>> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>> -	for (i = 0; i < c->num_data; i++)
>> -		val |= BIT(c->data[i].pos * 2);
>> +	val = 0;
>> +
>> +	switch (c->phy_cfg) {
>> +	case V4L2_MBUS_CSI2_CPHY:
>> +		for (i = 0; i < c->num_data; i++)
>> +			val |= BIT((c->data[i].pos * 2) + 1);
>> +		break;
>> +	case V4L2_MBUS_CSI2_DPHY:
>> +		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>> +
>> +		for (i = 0; i < c->num_data; i++)
>> +			val |= BIT(c->data[i].pos * 2);
>> +		break;
>> +	default:
>> +		WARN_ONCE(1, "Unsupported bus type %d!\n", c->phy_cfg);
>> +	}
> 
> can you use similar method as csiphy_get_lane_mask()
> 

Done, look better, but I guess we seriously need the refactor/split done by 
Bryan as I looking at the current code.

David

> Frank
>>
>>   	writel_relaxed(val, csiphy->base +
>>   		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
>>
>>   	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
>>   	writel_relaxed(val, csiphy->base +
>>   		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>>
>>
>> --
>> 2.53.0
>>

-- 
David Heidelberg


