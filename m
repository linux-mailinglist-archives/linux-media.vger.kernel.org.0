Return-Path: <linux-media+bounces-56197-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BlhGaSBumldXQIAu9opvQ
	(envelope-from <linux-media+bounces-56197-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:42:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD12BA19D
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 358EA3013B6F
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BB83A6406;
	Wed, 18 Mar 2026 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7c4Pt/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhcSB+Ow"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D103932C0
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830553; cv=none; b=jBfNMPRXI2I7j1faBHbNgEU0rYu8KXqOlGhRmupQKNMoGVFRaDVB1Af2/X2YoqS+lwpYZvgbpsU+TazsYDpBny6WUIaazzJg8fBL2rX1d4oyqIy59RNliUkNLEQN4kfvxobv974Je8AAGAkybj3OhXCtsRdOTf0jrTcqKMqk+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830553; c=relaxed/simple;
	bh=9cGO4fXt60oKFkWED5rr9g21heXgMK7uZOYfnIEEj90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ON9VZIVebKwFHbhZPjyAr55FhBD//Z+xB+dctGuzOtMpm4Oi+8Q13IbvYTDfioY+R0fexI+pRoPEU2uuGppersjKBykP2WvAWsHKt073sAqZka2sotESUiVN8iY00M5yICjVCd61zTiP86+IzWHixSTYJa3Pg+degBpeKwGu8ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7c4Pt/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhcSB+Ow; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8T4Nl1050806
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJ3/Vtb8q8d2NaIeyTrho1vo1Is/pQ9S2DYGRUv0/s8=; b=E7c4Pt/BfN3xCzBN
	d1AqamOIcwS2UUkYNJ93uc7N/t3JDxwfmRdYH2yXsJO3jLxtKaT1enlYuo4f7ipK
	yxOTtHHfGaMtx8CeVqvrh9r64n2Bu4Q0eZeL0YRWuowt8kSkGaBg6stRIYJ7IG+D
	sG06Hg4zs7wtKFE/AFQLiNy8RrtgcYqShoJaVv8C5nEqaOtHK7pxWLogtSV9qUXC
	8FxyluqJvccErUlqOfDvSgU5fvAv4WchMIXxcSnGyzUWCct/fYwGk/YeO9M2MLtR
	VJD6VgxobGsf7LGjaMo/HuKt+rbOF0StTz31u15Fymj/xLXldamx0hvH4qGq4Zy+
	Dja36w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ej49y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:42:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso7800856a91.0
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830551; x=1774435351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJ3/Vtb8q8d2NaIeyTrho1vo1Is/pQ9S2DYGRUv0/s8=;
        b=RhcSB+Ow/LMvdUVV/zBTaXx5MwIeyewy0dhf1l/LlFtHQ/7iS/2ZtV9MEHYWWu3knF
         mqEP+Bkd+p7ltNk0MogXvuJt27g6NqjbRFdTeXNjU8AOS4r9r9AULDy1sUh57frS9iLK
         mQOnV5bfAm0NZuK+0Fhiif3MqBgpvMyukfhOfPW0ChQLrClb5Rlal4iFAqa48pMyJtwR
         UVT8GTtq8J46F4j/LKytc525A3Z3vuJ5rHCDJCtHtDVzk3JKCLigye7usjdjUx0Y2Adn
         CAQKA9ypDCU0MrMEjufFWJmqXp3OXiBF9VNlj9AnEuX2oDl1RF3wVcRnYH6Xm0JPz9cM
         qkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830551; x=1774435351;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJ3/Vtb8q8d2NaIeyTrho1vo1Is/pQ9S2DYGRUv0/s8=;
        b=Y0tKPrRGXz5VlMQ/P4XLjhu5seLPz048NzCbUJtDpEpyp43VWQZEU7FZKtf/e/xFjR
         OlUlIVpybjvmGTMWfuNkNQvcDsEn41UTAXaEqFdnDmqZbrv/1H6vSrTKTGELf0R6/os3
         TXq4YfYcOe+lUlDcrpt819BwX/2sIiCr3/NvXO1OyB9aQnOTfiU/7QNtjv2pWP7M210A
         mFe6fLL6CjjfZlayTKZHMSbAox9VWveEXPejDhZlKj5aP5+Luq2XYCantilgB8Q9OQTK
         hdUnZL7FFOFFyw5ch6JytSz0BD4HDHHzCTUR3qeUB/qzfBfdp5NMv+Ba0cJO1zelRpkf
         Vsfg==
X-Forwarded-Encrypted: i=1; AJvYcCUdyNt5OhtjFKShkk3NzM6h4wQv7+laqZkoJ4MDvvHP1Jh30dk/1cckoHDJMEGw0rRzCfIm60cS2HPwAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMsk+U82MF308I158P4f1QE9eJ1NKuLNw0dw+IAsY3TWllZcpI
	LmavytfGRyy/T7Y3MhtESxG7Zlj0CRTeN4ogsx7s8uJWZl5vx3BnL7uMdV6iOkSl4A7mQpe3dpv
	V8wGS7uy0CebuZgcc02OTwD97iKu1UELQ9itD+0YOPvrglq6MDb258nYwa3OoieAuDg==
X-Gm-Gg: ATEYQzz+mJqMm/le2UgP0+NuVLHHx5v3PUBsVlLuwkJIbpMKgcOcX4de6MnbVFksK9g
	VLZKgVwiIdT31SckyMGDAfFtl9NU65grrgvhCaOV2i1nAj33Mos97tthEGl6itlP5xQVn20wbgZ
	JRIWIurFiYuIv9HfSJCEOEJFU1P5Cy3BJWND7hNgFX81LU7JhhWSm/+QNfl2Gw9aLBuX0p+uCUX
	9ejDZiCH7VC4r1Hlp6boFet8iHfFerieNsvwoYMvjBu3sKoCA4OQF1D7mgz2sorkdZGdlY/MTIR
	TJ2JG09jE/MsPo2wDOKw+M6z2qKM56WCDmL/lXzTWUMxOyMsDWqZOscPmP+27922EgshXaBh6wL
	QE8g41msA0eBirdS/827lGcSHSqjjMXXBbEC+wq9bYncSE1W8PV0Jbg==
X-Received: by 2002:a05:6a20:db92:b0:361:2c56:fca8 with SMTP id adf61e73a8af0-39b99fd1bb6mr2602576637.50.1773830550752;
        Wed, 18 Mar 2026 03:42:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:db92:b0:361:2c56:fca8 with SMTP id adf61e73a8af0-39b99fd1bb6mr2602549637.50.1773830550152;
        Wed, 18 Mar 2026 03:42:30 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e587078sm2079594a12.32.2026.03.18.03.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:42:29 -0700 (PDT)
Message-ID: <2f5553e4-6d6e-2eda-abd7-97284336cd24@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:12:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 7/8] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-7-fc79f003f51c@oss.qualcomm.com>
 <3ee87252-6b90-a389-0621-5b0b8d2f87ff@oss.qualcomm.com>
 <yhkio67g2ka222lq72w5cmftczdsiugws3ykpcxuhdrhu54oh5@gjazz3j5lci4>
 <eff4fb4b-d857-5c0b-2285-946806e8e4cf@oss.qualcomm.com>
 <4jxzqcpgieq56orap3cu3trf5qpvskfuebvrojl3cemis3axdz@kocixkagmhbe>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <4jxzqcpgieq56orap3cu3trf5qpvskfuebvrojl3cemis3axdz@kocixkagmhbe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba8197 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=RgczR8+8wRjDfzPIf2UjDw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uYPbO82NNRVyJLcMrN8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5MCBTYWx0ZWRfXyZ0iJJDUEHGV
 CJXUvB8kmYNplQoF5DI1JOhZh2nMlGV435k0mV0LZJZ9dHp+9WphzOG0p0346RLMMrrS10zKek/
 bT9gWjfX+HHGnP5FjOupOUwreyl2RUvZIgWNPOnFqL5fIdy+hCFmEVbOH0tKoalhUbhVNnjQtdC
 xmk0wahkdKTFejpj6WEo/ZHalYzJAJCQD21ynFHRx+SnGHgT9LJhcKayYNlGjEmJTJ6nZh6vZU9
 jsNMnekn1tNI3Z1a5b03FASiZs6/M84nTEBt2/rZscvpY+Ax68PQBPUcRo10z6LG8brkD/Ag7p4
 WPulml6UfUuxKcJPrw4a/9XJKfVfQoiuOwmuvbOYx5LoTDnD+5sTUaj1efjyhDSCrnCntLBmryN
 QPuFu/EyUzNiCA7zw7rtWs9a5SJr2swtmvqcP7HFqJWLzDOZDK2nXdHFq729TO53JAR014CSgK/
 Vm0vOejIPvjS1Q8h5ig==
X-Proofpoint-GUID: o9_AxEyOo4m5m-qTNyBnguFR7B7uIGGt
X-Proofpoint-ORIG-GUID: o9_AxEyOo4m5m-qTNyBnguFR7B7uIGGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56197-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5DD12BA19D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/18/2026 4:10 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 18, 2026 at 04:03:07PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 3/18/2026 3:59 PM, Dmitry Baryshkov wrote:
>>> On Wed, Mar 18, 2026 at 02:35:30PM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
>>>>> Having firmware-related fields in platform data results in the tying
>>>>> platform data to the HFI firmware data rather than the actual hardware.
>>>>> For example, SM8450 uses Gen2 firmware, so currently its platform data
>>>>> should be placed next to the other gen2 platforms, although it has the
>>>>> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
>>>>> hardware-specific platform data is also close to those devices.
>>>>>
>>>>> Split firmware data to a separate struct, separating hardware-related
>>>>> data from the firmware interfaces.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  82 +++----
>>>>>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
>>>>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
>>>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |   8 +-
>>>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 +++---
>>>>>  .../platform/qcom/iris/iris_platform_common.h      |  82 ++++---
>>>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  67 +++---
>>>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 246 ++++-----------------
>>>>>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
>>>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
>>>>>  10 files changed, 205 insertions(+), 369 deletions(-)
>>>>>
>>>>
>>>> <snip>
>>>>
>>>>> -struct iris_platform_data {
>>>>> +struct iris_firmware_data {
>>>>>  	void (*init_hfi_ops)(struct iris_core *core);
>>>>> -	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>>>> -	const struct vpu_ops *vpu_ops;
>>>>> -	const struct icc_info *icc_tbl;
>>>>> -	unsigned int icc_tbl_size;
>>>>> -	const struct bw_info *bw_tbl_dec;
>>>>> -	unsigned int bw_tbl_dec_size;
>>>>> -	const char * const *pmdomain_tbl;
>>>>> -	unsigned int pmdomain_tbl_size;
>>>>> -	const char * const *opp_pd_tbl;
>>>>> -	unsigned int opp_pd_tbl_size;
>>>>> -	const struct platform_clk_data *clk_tbl;
>>>>> -	const char * const *opp_clk_tbl;
>>>>> -	unsigned int clk_tbl_size;
>>>>> -	const char * const *clk_rst_tbl;
>>>>> -	unsigned int clk_rst_tbl_size;
>>>>> -	const char * const *controller_rst_tbl;
>>>>> -	unsigned int controller_rst_tbl_size;
>>>>> -	u64 dma_mask;
>>>>> -	const char *fwname;
>>>>> -	struct iris_fmt *inst_iris_fmts;
>>>>> -	u32 inst_iris_fmts_size;
>>>>> -	struct platform_inst_caps *inst_caps;
>>>>> +
>>>>>  	const struct platform_inst_fw_cap *inst_fw_caps_dec;
>>>>>  	u32 inst_fw_caps_dec_size;
>>>>>  	const struct platform_inst_fw_cap *inst_fw_caps_enc;
>>>>>  	u32 inst_fw_caps_enc_size;
>>>>> -	const struct tz_cp_config *tz_cp_config_data;
>>>>> -	u32 tz_cp_config_data_size;
>>>>> -	u32 core_arch;
>>>>
>>>> This can also be tied to firmware data as this is required to be set for
>>>> Gen2 only and is 0 for Gen1.
>>>
>>> Will it differ between platforms?
>>
>> Nope, same for all platforms with HFI Gen2.
> 
> Then it should be removed from the data at all.

Yes, I was also thinking the same but this should be set for HFI Gen2 and
not for Gen1, how do we handle this then?

That's why asking to keep in firmware data.

Thanks,
Dikshita
> 

