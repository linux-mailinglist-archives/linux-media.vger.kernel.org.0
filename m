Return-Path: <linux-media+bounces-54294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDU8NA6zpmn9SgAAu9opvQ
	(envelope-from <linux-media+bounces-54294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:08:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 367521EC63D
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A84330FD5D3
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7960B394793;
	Tue,  3 Mar 2026 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="DDboC1Cs"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7018939182E;
	Tue,  3 Mar 2026 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532374; cv=none; b=XiHSVW4kXP28bHMnWJ3sBIBTNH0hTUmg4hviirHjbnT/A2k7QruM3kOzKupldZwOtC7QPvQNGamarKsSBSIN5J+xDjs0ZoQIoFjo3N2+AB/zBZZTTFPdutaLWhhxvPqq7BSI3zNKXZYZ33mON0KbpZ5KhM7OXZo0cu7q6qAD/tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532374; c=relaxed/simple;
	bh=tiavi+o7WBPMjVR9uDgFy8Beo4pqzbDSBeaybOTnde8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9F8vlrFSY33uAK3ejKophm7jTSkbNccbBChEYg9j4tEdz+sSqNyye7XwCuSH2iOhRW8EQGbSZe1LM8QMGdk3joNdaNdHe0tVC06OXkRvdW9rQgQHuVB4EvlKzm25XRztUCYbOL3nsO6USEW3WEbKCiqmRbEu+bCvZ0F1p/OR/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=DDboC1Cs; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [IPV6:2a02:f000:10bd:e301::1d7] (unknown [IPv6:2a02:f000:10bd:e301::1d7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 01CF65340FD9;
	Tue, 03 Mar 2026 11:00:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1772532046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O34r5PhyONR+u/TntIvSUszMsmdAixkhg0u5q1PMUeU=;
	b=DDboC1CsCqKHomhe+6ldtrxYaD/Ybx3K15n1RhCKXK510M0ulkx3+tuGpEQKqfMrHaELT5
	v3tEhA/FeiMlHpGZw1Fa1mfUIcxai19qSVPhETHUedUmYENGLbw95QcZbEFxNuGIn3bonP
	u7Ke5c2xeuvMxh7bRX5/LyZvhCrp6Kg=
Message-ID: <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
Date: Tue, 3 Mar 2026 11:00:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 367521EC63D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54294-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:dkim,ixit.cz:email,ixit.cz:mid]
X-Rspamd-Action: no action

On 03/03/2026 10:55, Bryan O'Donoghue wrote:
> On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> These values should improve C-PHY behaviour. Should match most recent
>> Qualcomm code.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/ 
>> drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index 5482fb5163e17..c612192ee727a 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -225,9 +225,9 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>>   /* 3 entries: 3 lanes (C-PHY) */
>>   static const struct
>>   csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>> -    {0x015c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>> -    {0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>> -    {0x016c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x015c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0168, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x016c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>       {0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>       {0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>       {0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>> @@ -245,9 +245,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>       {0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>       {0x01dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>> -    {0x035c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>> -    {0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>> -    {0x036c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x035c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0368, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x036c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>       {0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>       {0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>       {0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>> @@ -265,9 +265,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>       {0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>       {0x03dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>> -    {0x055c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>> -    {0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>> -    {0x056c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x055c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x0568, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>> +    {0x056c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>       {0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>       {0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>       {0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>>
> 
> Squash down and Co-developed-by
> 

We don't have any documentation how these lanes are set. I think it's good to 
see two working variants, someone may need it to demystify it one day and the 
history may comes handy. Also both variants works for us.

I think it would make sense to squash it, when the magic hex gets documented, 
but even with description it may be useful to see what's being tuned to get 
better working C-PHY.

So I would propose intentionally keep here the "history" so someone in the 
future may use it to describe these registers.

David

> ---
> bod

-- 
David Heidelberg


