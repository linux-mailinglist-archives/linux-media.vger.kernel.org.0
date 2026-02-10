Return-Path: <linux-media+bounces-52486-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFfWKabDimm+NgAAu9opvQ
	(envelope-from <linux-media+bounces-52486-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 06:35:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFDB1171FC
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 06:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9D0D301F306
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 05:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A9626A088;
	Tue, 10 Feb 2026 05:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMjA/6LL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GwEjjKLf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9304C30BBB7
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 05:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770701720; cv=none; b=crRshtCTMd63td2OlOKDP+m7ZKIJn/gQgdVOTD4GD9PRgNV+Qz2uPxBNmARor276UAH/fuWTxtJEQeu5/JbFdULXlfo/1hlBJmyJIlHymO6dTrNhQd1Ksj/HBRRScvME0NM2Pw7wUsB1diechZNn7QdrstscA1CKdW7qLzlR2Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770701720; c=relaxed/simple;
	bh=Rq1Ocek2lZZBo5E6c+kKcL2B7KgGYVFXnWgK2OPs2ZQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=H+zo6thfBvnv8Faxy0X3qCEAYuqBE6amNSxSwRrK/AvCoMkyVs8DM/SbyMfN4QjRH2B069A2r+UIoxEt69UqAyQlJu3hdbZttBrfI4aZTJUAGlWdF3ODLURL09yPlJzlxIzkRjajTo2IpIWi4DtDO9MUnaDbyHOJlLcBCKcyX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMjA/6LL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GwEjjKLf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A53l49801157
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 05:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3ldEW/nEVzh5CZp/5lBKtJ/9ynaM4YNM9Rzd9I+khw=; b=dMjA/6LLvGw80rHE
	1yCaF0O+iJ0cOGHq1l5e/OEdWhkxf5y/EgJtPXOtulZW3z+zFr89R13naLRWaWS1
	2yTEhK/Di3EkVDcbIYxth6WLIFiFMudbC3nhoohH2tml4OSvyLG2QCelalRFSFHu
	bD3eAxaqRQXrk2Yr/JVPNv5a77nVKhS6MHkthbL9F8YIlCvHKhPU/OWu3yzdVSNN
	yFkSxmrfA5T1XpvZmmx+EgUGUHT4hYVTI/YraAwC945gd5bKSmJ+0s2wHeoOZd0K
	O9aWAjl8usoLQ9UOklmst2QLg/aYucelzmJOrXYC2WQOvgXCmUc34nF5oMN2Q/E7
	6GEVCg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7x6u02ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 05:35:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82438027416so295896b3a.1
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 21:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770701715; x=1771306515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u3ldEW/nEVzh5CZp/5lBKtJ/9ynaM4YNM9Rzd9I+khw=;
        b=GwEjjKLfUdGkN7pY0AXHKALKiVa2Lhg3MRHNpaIVGleZUnorl/qJwz0rvqvmyJ9M77
         CEipULd16ph8+NIrwgOFzfGeG4WliY7szw2rOi0q7/Ync40dWYHfFpqn8voiOcUAOivx
         QCrlp0+RQZn8CO+2WCxKKgoapf582yDlzCtu30GivKOtpGUFJJeKrxOL14jMaADmgFr+
         39ovfw0l1KTgI8F9RXA2EGZGcG2byVSMBaPy0mOLcAKfjYq4HyMX6prrAhHDeH18IdOo
         ooIxeYjEt95TSBtajn+MQpzE+YRDv7QWOoYCgoaZEevuTBD/sBqX5fNxH+he0ditrQFI
         I6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770701715; x=1771306515;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3ldEW/nEVzh5CZp/5lBKtJ/9ynaM4YNM9Rzd9I+khw=;
        b=OJEjQugNKSSSy07aj9NGHBwCzsw0NCRCBamStOh0HocpExSbAtzZ1osp8TJ9HzQBUs
         eDfgYlsNvlgdNI/ELHUUg+Xuu9CNXQu4wQsv65zUJ50birDwvibqRPW+qE0ircJyUuye
         RbdhjAXy2Au4v3Yc7eLuEh+Eo4iqHUtcID+AfbuedMuDYHYb6IR2fLVvnlhISKMiGTxw
         mFypGran883zkdRyTgJwSwftX+/3syKI0plG+OVu59OhzaHKLlPXlY5/hW12Ntlqn7T+
         DG0zns/F6U6ltl97csEFLT2PtjT3VSQHje3/m1VcJ3pHTM4CwGqkFREwDSG+S5orfvTn
         7ZhA==
X-Forwarded-Encrypted: i=1; AJvYcCVrsanoLPlh8Rg5GPwbyIQ72fujcwP1EaRdV4OZnSRcZ4LuM5K5nUiS1AY6jSriIKZjod5LQt4wDHb5ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7OWOKYeTAXRAskA0NCRnlyIXpMt3psJ7AcNj3UnHWjiwce034
	5cihWURWThkzbBpSDZcToHp4Ym5WPTJBPSptLQZw4fK4LKPzZG4PlSTs9/bGZU7A3A/G1k66jRo
	vKqq2GpC0McTZIqzhyu6SHCLtW4RWylfMt9LIGKPMEIW6ktUG/ZZ1PZA6gbPoa7PlHg==
X-Gm-Gg: AZuq6aKBXWb8K2SjnGwUBBHx2+hERj6L5S7v3ocnICzmYW1bdAzlvUKGXrGW79shahl
	I6bTmGZL9QIO1arFZFSyXKsfyxCAl25bSgnZVbsdxGAnap0yGR4PC6Cbj1qU9bm7/5tuVHLRGqf
	OaXI2MmLlZLINyhHVHxSXCJv/9QK8yq+bkij2JQAgvPMFOVBnokE95aODfWk7Loshe7iM9/z+v0
	4VtLv3qHse7LVehVLzk4akdY00d01QttA4VU9zKKdAWVN+O0vv6cB3f6IL3vTsghEefCzq8GrEW
	pnz7CIF66NqhdCZiYlJv6A1QdsnJJqNbgohV4mRRJLhV0kATYpky7NJ17Dv2VLvkbIt8ALAsbux
	zgOB4loujncZAMiStgRK5vcmXw6ADh4S/XwBUUJMixM8/fRW8aqfitg==
X-Received: by 2002:a05:6a00:6ca1:b0:81f:40e5:34c2 with SMTP id d2e1a72fcca58-824416f8811mr13006992b3a.32.1770701715488;
        Mon, 09 Feb 2026 21:35:15 -0800 (PST)
X-Received: by 2002:a05:6a00:6ca1:b0:81f:40e5:34c2 with SMTP id d2e1a72fcca58-824416f8811mr13006965b3a.32.1770701714976;
        Mon, 09 Feb 2026 21:35:14 -0800 (PST)
Received: from [10.0.0.3] ([106.222.232.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884b80sm12411804b3a.44.2026.02.09.21.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 21:35:14 -0800 (PST)
Message-ID: <a71e3bc2-23dc-fa02-0dbf-0a9d779dca76@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 11:05:08 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
 <8c5cd9ff-e549-00ab-60c6-814b52f50949@oss.qualcomm.com>
 <rhsmmvbxjzb4ylxryo3n6j6wf52tjpxxon6fww6tsfhxttc2g7@xfsnyfkqh3ke>
 <ec4348fc-b27c-9b56-2967-222e4e280c8a@oss.qualcomm.com>
 <d67faniik7jrlnq2a2wsyku3agpezh5qj4g4rip3j6pbeagmkj@xax6nuginypu>
Content-Language: en-US
In-Reply-To: <d67faniik7jrlnq2a2wsyku3agpezh5qj4g4rip3j6pbeagmkj@xax6nuginypu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NOQqNAIB9OAK7DOSQVndVmzpdpwwBb7R
X-Proofpoint-ORIG-GUID: NOQqNAIB9OAK7DOSQVndVmzpdpwwBb7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA0NCBTYWx0ZWRfXxR1UY7iZgH42
 nkCTERNLkRAOlgKAiYR2LUvHwHUohA7bCXYuFI467ZmnzDDUgjjMft4u7VDgergBtWyoqroOdkp
 L7itj9ipWmI8tB2hbof/AaJdM2rtdJRZNfZl2omck8WQNYYcL8Wr/5W0KAPvgytwSB88ud18jLn
 P5+5ZUfri+C4mneMU64etelQGVHb5EtfmhB/gy69M6Pey98Afwq98U76g22u16HqaU4dGoxR7G8
 pILUH0FVQa940zeGwyFhd7ea6/a99leQcwg77EmjcGCsP5LRp7ZPSZBFO7sy3L9VS35fmKz3Lqt
 E9cVDAHyebY/PpsB26p8YTMpkzuncZVhjyKhgyK33u9qqO60Mth0wOojtK8A9yQosoj9Bll8bix
 9/tTaPVTmjYuHcSKKcX23rDFtviz7Vwoj0reqnHqzbJhH/RSN3Axx9gjcyelQtgzo7lOGisQPjW
 dVB+Rr2pc4oG/gzrGWg==
X-Authority-Analysis: v=2.4 cv=YfmwJgRf c=1 sm=1 tr=0 ts=698ac394 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Q1L4dSpLiPPsWIQ2aSSWHQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=eRPdXeDVQe4KOXe1A8MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52486-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DFDB1171FC
X-Rspamd-Action: no action



On 2/5/2026 4:24 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 05, 2026 at 02:40:39PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 1/31/2026 12:58 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 30, 2026 at 06:46:04PM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
>>>>> SM8350 and SC8280XP have an updated version of the Iris2 core also
>>>>> present on the SM8250 and SC7280 platforms. Add necessary platform data
>>>>> to utilize the core on those two platforms.
>>>>>
>>>>> The iris_platform_gen1.c is now compiled unconditionally, even if Venus
>>>>> driver is enabled, but SM8250 and SC7280 are still disabled in
>>>>> iris_dt_match.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/media/platform/qcom/iris/Makefile          |   5 +-
>>>>>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>>>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 111 +++++++++++++++++++++
>>>>>  .../platform/qcom/iris/iris_platform_sm8350.h      |  20 ++++
>>>>>  drivers/media/platform/qcom/iris/iris_probe.c      |  10 ++
>>>>>  5 files changed, 144 insertions(+), 4 deletions(-)
>>>>>
>>>>> @@ -392,6 +393,61 @@ const struct iris_platform_data sm8250_data = {
>>>>>  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>>>>>  };
>>>>>  
>>>>> +const struct iris_platform_data sm8350_data = {
>>>>> +	.get_instance = iris_hfi_gen1_get_instance,
>>>>> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>>>>> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
>>>>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>>>>> +	.vpu_ops = &iris_vpu2_ops,
>>>>> +	.set_preset_registers = iris_set_sm8350_preset_registers,
>>>>> +	.icc_tbl = sm8250_icc_table,
>>>>> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>>>>> +	.clk_rst_tbl = sm8350_clk_reset_table,
>>>>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
>>>>> +	.bw_tbl_dec = sm8250_bw_table_dec,
>>>>> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
>>>>> +	.pmdomain_tbl = sm8250_pmdomain_table,
>>>>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
>>>>> +	.opp_pd_tbl = sm8250_opp_pd_table,
>>>>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
>>>>> +	.clk_tbl = sm8250_clk_table,
>>>>> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
>>>>> +	.opp_clk_tbl = sm8250_opp_clk_table,
>>>>> +	/* Upper bound of DMA address range */
>>>>> +	.dma_mask = 0xe0000000 - 1,
>>>>> +	.fwname = "qcom/vpu/vpu20_p4.mbn",
>>>>
>>>> This firmware is not compatible with SM8350.
>>>> SM8350 firmware is not released to linux-firmware yet.
>>>
>>> What would be the name for the firmware? The downstream uses vpu20_4v
>>> here, so, I guess, in upstream we should be using vpu20_p4, but a newer
>>> version?
>>>
>>
>> Using a newer version won't work as the firmware for SM8250 and SM8350 are
>> different binaries generated from different firmware source branch.
>> You can give it a try, but AFAIK it won't work.
> 
> Ugh...
> 
>>>>> +	.fwname = "qcom/vpu/vpu20_p2.mbn",
>>>>
>>>> this firmware doesn't exist on linux-firmware.
>>>
>>> It was based on the assumption of having 2 pipes. If Iris here has 2
>>> pipes, then probably we should still point to vpu20_p4.mbn?
>>>
>>
>> SC8280XP also uses the Iris2 4‑pipe configuration, though its firmware
>> comes from a different source branch compared to SM8250 and SM8350. This
>> means we have multiple firmwares with identical VPU and pipe configurations
>> but different origins. Could you propose a suitable naming scheme that can
>> differentiate such firmware?
> 
> Can we have a single binary that works on all Iris2 4-pipe cores?

That is not possible as it is older VPU.
For newer ones, the plan is have single source branch for same VPU to avoid
such issues in future.

> Or are there any differences between Iris2 on SM8250 / SM8350 /
> SC8280XP? Are they stil vpu20_something or should we use different VPU
> versions in the firmware name?

I think we can keep vpu20_4p_* with some way to different among SM8250,
SM8350, SC8280XP.

> 
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8350.h b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
>>>>> new file mode 100644
>>>>> index 000000000000..74cf5ea2359a
>>>>> --- /dev/null
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
>>>>> @@ -0,0 +1,20 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +/*
>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>> + */
>>>>> +
>>>>> +#ifndef __IRIS_PLATFORM_SM8350_H__
>>>>> +#define __IRIS_PLATFORM_SM8350_H__
>>>>> +
>>>>> +static void iris_set_sm8350_preset_registers(struct iris_core *core)
>>>>> +{
>>>>> +	u32 val;
>>>>> +
>>>>> +	val = readl(core->reg_base + 0xb0088);
>>>>> +	val &= ~0x11;
>>>>> +	writel(val, core->reg_base + 0xb0088);
>>>>> +}
>>>>
>>>> you can reuse this from SM8250. That would work.
>>>
>>> Hmm, downstream driver was explicit about clearing only these two bits.
>>> Is it really fine to clear all the bits?
>>>
>>
>> Yes it is. We are doing the same for other SOCs as well.
> 
> Wouldn't this also ungate / start the second core?
> 

