Return-Path: <linux-media+bounces-64121-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wo4vMvxVJmonVAIAu9opvQ
	(envelope-from <linux-media+bounces-64121-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:41:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0EE652DFB
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:41:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nj8MXlzn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MOGi9RbW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64121-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64121-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B133303A13C
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 05:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD76B378D64;
	Mon,  8 Jun 2026 05:39:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41C11B6D1A
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:38:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897140; cv=none; b=VsZ3j9wyeGYkym4Zk9d2sJFJR51RireNS6bQDKTggU1kSuMN2EqViBrqFfq7HSZR5hG85+kl4ycv5sScjaPx8ym6Hat1gO7ulIcn5h7qikIr3LjdYIWHlE2TO998xn2/WUfdif/dkpkt3pJOglf+oS2/ikJXmo9EhQLlMHPr/MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897140; c=relaxed/simple;
	bh=AAydjUIWlTTNwmK5Mm0q6RFad2xRnZcIP+BIQ7JFdwo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EbPsoUS2+UzHHn4HJc2xZdjsyniaspBzswAjxf/2qk7VVXmwmxpY5vtEXGcS7aAB398Ph8fl+EM1eFRJ3Rb0oZbCPHjr1h+Z3tPDQo03AB1M4WMQ7qIJzwbv65aYFytZRrFaD4xU4ZU8KN2ibnvwzhFx4MZA6uuA+sxQz3KqxRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nj8MXlzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOGi9RbW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EC8u1535042
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 05:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBn6EGEU9bZPva+oRSW1+IX1E71RxLh+Lv7xp4tZnkY=; b=nj8MXlznGLk0jPY0
	88jv19EM9sYbkbNbi3q137LdJ0CXPJDp4nugN9KneZo6Lkjb7OJk1NVP+CtokcOz
	pAyOj9I1WaPC/Ih3CbPWP40MKenDTcZVN15k7wMt/V0FWBRQilBfrqN69A+BLRka
	s/MHPOVfbl3NI9FX1Vk3/2bxyAJ7bNgx6nQs6uoB5L2JjjOCiKeUtnmwHcmfUVWc
	qKG08FCuyLAE2hFfX3WIpgdTy5RqYX67TkzNSwSZsvw6CzRtknURkS7iaXtz9pVj
	q7j8u8XsSBjSN41UNS2ju3jJGA45hFiAMJ1HuPfG0ZKigq7YyiordVLkYnDfYZuJ
	7usm4Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagre975-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:38:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so4095272a12.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 22:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897137; x=1781501937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VBn6EGEU9bZPva+oRSW1+IX1E71RxLh+Lv7xp4tZnkY=;
        b=MOGi9RbWj5GUkXk1x/CUStrI984ISrMjKShI0A9nJfAq6PxhTn2ixJ4Gu9TNG7YWPo
         1YGUXNk1CgEl2OJuk5EGRVWh3Xh3xMMrRN0xrnoTR27Vqg6QwMZiX27Ntz9Fm2ThwS1I
         iXjGVXGBXeYzwNSm5O2OHoTz2VTOadwTCBnExQ0b5x8BQl/qUyvN4dmow7ShcLcJzpB2
         +KuKe12orV13/dNB93F5ARYikj5yL5DFGXBzFQsjVJhZPwQDD0+RAYN4Nq7c5aWIkaE1
         mJayt246USHbpaTwB7b9jx55wT1AczfURktwYXztqWeKp72iBBC1JcMBA3ZgKQsW7lAG
         XPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897137; x=1781501937;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBn6EGEU9bZPva+oRSW1+IX1E71RxLh+Lv7xp4tZnkY=;
        b=qdhTZYjkbTRgr8K8j9VfWGYkd/7E0I2URbch3qT7l3/zcCxnPOTAwbFafTh+donHyk
         Ihe3rocopoGNluxXAWa2+4OsUfYlWci8i618UY7vqYUDjA990V3xQrcHXmHGez+zj44+
         6xbj2RiCAgTsdD0cQglEd478jmfEvcz3yHFHnIHu9pnf9BB7x3hU65QsoZ3EECXE/c7w
         8lSC6NOoug7ispj8fM7XaCq1JZoVhuzS1BLNNkEwzABRnGQ1nDVVTxFFPsrjqXAr1q4r
         pzfOLLg4CFAywRXgNSnyJ6/enLr7APsJISX72DK2XoAx5ZLxaS/tSFbAINfNE6OKEkOE
         Uw1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+rHgx+YRBnaQD6DdMjtddJUP44gD7KXDX9OCgLpoghIU+UVrKV43ZYRGzqp8SXbtvWQuyunP2vxgqJIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBG9rytQeVaNJyldnRhpNuIo17uDAJ0sDCd6fsFBBMHuBw1ir1
	5cbtOpbHLNTaDLGpdm8a6+CVjFFmN6aL4aWaXroEC71SRE5ZsHcDgJxBqFqlVmcf6VC4ClDQRlN
	WNenzhp9o2VAz/jIaSlPAHhInoRce2uj1p8bq19Sso/x4l9+xoCFKGsM7/ZfGaoyj+Q==
X-Gm-Gg: Acq92OFLCcPl6i+WTPw34kYu0AAn9Bv1fF+F8Xx0gKmRRaqyA6n1ZASrAsGexRlhAXJ
	6hJ2FW8PFUwmhta0HaaM7KczBqgJvFTFkzGhO2RyUUkOnDbGKxgWfE3p4NP2TG8WQc6g3GC9Usr
	2I8pXiiMYxv8QX6nIZOOYXConwkHmZR9WBN3zCtpcFlKCA6VLgQN1DxLBd9zwnn3IKsBjZ916RD
	b2K9f+OBu80g/0yKdUaHr+vsX8lj8W6zUiXKH8mCnK+tAgidGZBDWp0MOGG3HZsM71lo5bnrZjS
	u5a8D500x136GzPQN9H2MAbC75R5kX5rlH/dHWHYsrcGRKGYKkQQhWm5SPPfaJxBkio6zEROc6C
	tIxOylETdJTMSqzuhGOdgLM7BQsFBjHS5axUv0xn5hEJ1q1YQcKHhN1pNcnjmGoDA
X-Received: by 2002:a05:6a00:1d8e:b0:842:6099:c55c with SMTP id d2e1a72fcca58-842b0d82a44mr13654957b3a.3.1780897137453;
        Sun, 07 Jun 2026 22:38:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8e:b0:842:6099:c55c with SMTP id d2e1a72fcca58-842b0d82a44mr13654936b3a.3.1780897136914;
        Sun, 07 Jun 2026 22:38:56 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm16718331b3a.48.2026.06.07.22.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:38:56 -0700 (PDT)
Message-ID: <e51033f1-8923-ab8f-d911-ffea73d15b29@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:08:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 06/12] media: iris: Replace enum-indexed clock and
 power domain tables with per-block structures
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, robh@kernel.org
References: <20260603-glymur-v7-6-afaa55d11fe0@oss.qualcomm.com>
 <20260603143718.A65981F00893@smtp.kernel.org>
 <h64x7lp43zd6ktit7t4slxlr4fprqtlaijzslpeqtxpyd6gar4@kadh2diinpmg>
Content-Language: en-US
In-Reply-To: <h64x7lp43zd6ktit7t4slxlr4fprqtlaijzslpeqtxpyd6gar4@kadh2diinpmg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfXxoyu+rmoHNdw
 u7K/9KcOzcWV9AczKJre3vACND9GEvlkpgWorVu+TfKMkGtPCa/uAr4D4BzcApG3+pN1eeylufL
 oDYdWvgxzBRIJ0CpltP/X/NPAoz0+czZYBTNovTUQp/q4u1ZwQW+sRtXCCGPm/us/4N5hfYLcKo
 RmUaLnpTmObHyr+I2nbd9AQnHIcJzbq2WzzreEoF2x7+0mbrXLGWYzCFFrRN4wf4CqikltyfVem
 Z5cTcwlkqN3vAvHeoo0JB8Y3Ono0ZRQ2tqce8NWKXBKCRzAjdhAxFJy2tA85PxmIHMgynO/HApX
 Kr8Cb1atYMKn2aanIXKKz9CHoFkrWAPK+VVpTBiACjWiGIwFLL8d7O072hA5fJw6JxualqV5hh1
 zPvsCq0vkySVK8/vkjst21lw6cL2dKBZPsAaKXvUAsSYSHv0HmekEEvVzYYDE3QdRlpCvCcBxfz
 VtfOENC/csA8mzRl/0Q==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a265572 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=o_a0ztKt6M1vlsVVC2EA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: esBFVkMgMR_0DCiLkEqZOVCfKVBSt4kr
X-Proofpoint-GUID: esBFVkMgMR_0DCiLkEqZOVCfKVBSt4kr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64121-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:sashiko-reviews@lists.linux.dev,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F0EE652DFB


On 6/8/2026 3:14 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 02:37:18PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
>>
>> New issues:
>> - [High] Uninitialized stack pointer dereference when a hardware block has 0 power domains.
>> - [High] Secondary hardware cores are left unpowered due to missing iteration over `num_cores`.
>> - [High] NULL pointer dereference when optional hardware blocks are enabled in hardware but missing from platform data.
>> - [High] Premature OPP voltage drop causes DVFS sequence violation.
>> - [High] Uninitialized fields in `struct dev_pm_domain_attach_data` result in arbitrary behavior.
>> - [Medium] API mismatch silently discards additional power domains if `pd_cnt > 1`.
>>
>> Pre-existing issues:
>> - [High] Resource leak of Runtime PM usage counter and OPP rate on error path.
>> --
>>
>> commit 569dbace99d0eb806398e44f1f3dd0f46e77e155
>> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>
>> media: iris: Replace enum-indexed clock and power domain tables with per-block structures
>>
>> This patch replaces flat, enum-indexed tables for clocks and power domains with 
>> per-hardware block structures in the iris driver. It groups devices, power 
>> domains, and clocks together logically in the iris_power_domain struct, and 
>> removes index lookups at runtime.
>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>> index c2dcb50a27824..681db1da9559a 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -39,15 +39,32 @@ static int iris_init_icc(struct iris_core *core)
>>>  	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
>>>  }
>>>  
>>> -static int iris_init_power_domains(struct iris_core *core)
>>> +static int iris_init_power_domains_per_block(struct iris_core *core,
>>> +					     struct iris_power_domain *pd,
>>> +					     const struct iris_power_domain_data *pd_data)
>>>  {
>>> +	struct dev_pm_domain_attach_data iris_pd_data;
>> [Severity: High]
>> Does this leave fields in iris_pd_data uninitialized? Since it's allocated on the
>> stack without zero-initialization, any fields added to struct
>> dev_pm_domain_attach_data (like link_flags) could contain stack garbage when
>> passed to devm_pm_domain_attach_list().
> A simple '= {};' would have saved you.

Thanks, will use this.

>>> +	struct dev_pm_domain_list *pmdomain_tbl;
>>>  	int ret;
>>>  
>>> +	iris_pd_data.pd_names = pd_data->pd_names;
>>> +	iris_pd_data.num_pd_names = pd_data->pd_cnt;
>>> +	iris_pd_data.pd_flags = PD_FLAG_NO_DEV_LINK;
>>> +
>>> +	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &pmdomain_tbl);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	pd->dev = pmdomain_tbl->pd_devs[0];
>> [Severity: High]
>> If pd_data->pd_cnt is 0, devm_pm_domain_attach_list() returns 0 but does not
>> modify pmdomain_tbl. Does this result in an uninitialized pointer dereference
>> when accessing pmdomain_tbl->pd_devs[0]?
>>
>> [Severity: Medium]
>> Also, if the platform data specifies multiple power domains (pd_cnt > 1), does
>> this logic silently discard all but the first power domain? Since
>> PD_FLAG_NO_DEV_LINK is used, the driver has to power them on manually, which
>> means secondary domains might never be powered on.
> Indeed, both seem to be correct.

For pd_cnt = 0: Will add a guard to return early before accessing pmdomain_tbl.

For pd_cnt > 1: All current platforms will 1 pd_cnt only. Support for multiple
managed domains will be added when needed.

>>> +
>>> +	return 0;
>>> +}
>> [ ... ]
>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>>> index 773f6548370a2..fdc6eb68e5c78 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>> [ ... ]
>>> @@ -70,7 +69,7 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
>>>  	return dev_pm_opp_set_opp(dev, opp);
>>>  }
>>>  
>>> -int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>>> +int iris_enable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
>>>  {
>>>  	int ret;
>>>  
>>> @@ -78,66 +77,20 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> -	ret = pm_runtime_get_sync(pd_dev);
>>> +	ret = pm_runtime_get_sync(pd->dev);
>>>  	if (ret < 0)
>>>  		return ret;
>>>  
>> [Severity: High]
>> This is a pre-existing issue, but does this error path permanently leak the
>> runtime PM usage counter and leave the global core device forced to its highest
>> performance state? If pm_runtime_get_sync() fails, there is no
>> pm_runtime_put_noidle() or iris_opp_set_rate(core->dev, 0) called before
>> returning.
> I think I saw patches fixing this.

Yes, You are correct.

>>> -	return ret;
>>> -}
>>> -
>>> -int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
>>> -{
>>> -	int ret;
>>> -
>>> -	ret = iris_opp_set_rate(core->dev, 0);
>>> +	ret = clk_bulk_prepare_enable(pd->clk_cnt, pd->clocks);
>>>  	if (ret)
>>> -		return ret;
>>> -
>>> -	pm_runtime_put_sync(pd_dev);
>>> -
>>> -	return 0;
>>> -}
>>> +		pm_runtime_put_sync(pd->dev);
>>>  
>>> -static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
>>> -{
>> [ ... ]
>>> +	return ret;
>>>  }
>>>  
>>> -int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type)
>>> +void iris_disable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
>>>  {
>>> -	struct clk *clock;
>>> -
>>> -	clock = iris_get_clk_by_type(core, clk_type);
>>> -	if (!clock)
>>> -		return -EINVAL;
>>> -
>>> -	clk_disable_unprepare(clock);
>>> -
>>> -	return 0;
>>> +	clk_bulk_disable_unprepare(pd->clk_cnt, pd->clocks);
>>> +	iris_opp_set_rate(core->dev, 0);
>>> +	pm_runtime_put_sync(pd->dev);
>>>  }
>> [Severity: High]
>> Could dropping the OPP rate to 0 inside a block-specific helper cause issues?
>> If multiple blocks are being torn down (for example, in
>> iris_vpu4x_power_off_hardware() which shuts down VPP1, VPP0, then VCODEC), this
>> would instantly drop the global controller OPP to 0 when the first block is
>> disabled, while other blocks' clocks are still running. Does this violate DVFS
>> constraints?
> Yes. iris_opp_set_rate() should not be called from a per-domain
> functions.
>

iris_opp_set_rate(0) sets all associated clocks to their lowest rate and drops
the RPMHPD level to low simultaneously. By the time the first block's helper
calls it, no clocks remain at a higher rate.


