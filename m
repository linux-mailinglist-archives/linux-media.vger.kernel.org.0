Return-Path: <linux-media+bounces-54069-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LEPJ7RYpWnj9wUAu9opvQ
	(envelope-from <linux-media+bounces-54069-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:30:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF21D5911
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EB57303B4D9
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 09:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E09438F237;
	Mon,  2 Mar 2026 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXMHCLuU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcMIpUD/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9696C389DE3
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443586; cv=none; b=YljaSl9THWrmaDmrsaJ0KAdqe5yJa+auF10cpwIiMSnDvzBQ+SHd04z49+xLkHc3KywYpkiLNbarFhwWXglvHKTmnrNDdytIU4BlSDCwqqAoKfTfH6EdutGHFGwy0iJsYauKkcFsA7mMqR+the0d+2T6pvEyD4Y4N1Z4pemwanI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443586; c=relaxed/simple;
	bh=TQHXd68lN5Y8GNwjUDFLhEyoWMJbTPiLBw2FzrC64Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qzhQywowdM0H0fHscbMJQXRZ8xv/ipynGSVFVyJZIvYSKTyGWi/OMPysOcH94zXjVFbZKLNC8fWTHAzhSHJN/CRqmSVtDRQQH8uM6NLn0Kps8DXHmBlwHLDBOdosWvFvo26rL55ipFlRQ4aIc4jlIGCD0YNINZ4Hs3xDV8Q2Pb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXMHCLuU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcMIpUD/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294r2X3753576
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 09:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m63XK2iVZk4UvoVq2mXd/LFRNHOlrlceciFzjjpCg3E=; b=JXMHCLuUgpin7sll
	89lBzwQUs1zNyIw90nykTNOS9rfzCmtczqtOsMskjHhRRCdvTM3qlsLpWOXzty+P
	FUPc+zCuu4jqDECaF73QRcrqrG37gDsMdZLe7ZjocUvZaczAIVHVQo4VM7VGHadW
	Dp/YMEFuDpFzXEG0uFi6fNrL/RPFxJpECXKR8BU4Xtn4m5DwurKi5GpOLuHc1x/u
	x+xes24FdP54nj2uKen8ct7OM3y9lCCnyvD98bwTB11GddLWXCMYVZB+bAEKNs+j
	Gkm3vVEnRC8Kls2hcmgnGNz51aYp0tN86eRxJqcQiDP+JwXPDhs9PKu3QwrCQ7PQ
	Y4p/+g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8302-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 09:26:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6097ca315bso21671624a12.3
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 01:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772443582; x=1773048382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m63XK2iVZk4UvoVq2mXd/LFRNHOlrlceciFzjjpCg3E=;
        b=fcMIpUD/FItdxM69KAxyeeSRoPHmwBeWQLmRyjxxVPsHB+fdrxl1AIhiwdaNr+EZZo
         YMqXtcdbY6tTHL/VxPvbYJnd1rVL9MP2w2zzfjRRHj4g/To7XsoZPxvsuGo9c7duSIeV
         yO1Et10jVZJqT9acbejGkbPOoUQvchmGau13494+arWLofU2TTvmxmMJiKGW3UK9M9FY
         5hsUtTqw/JhIjQZwiFrg1bZHs0F0hNQXgqXOXlCPvwkGvEmoLvzQgLMDW2/ITRa8Dvuv
         AXJMIi/V8g99UEbsyZMm2D8XxO+Bt5UyFi3lsvG07Fyp45EpBOhumEEfod8zjF8Y2hno
         Rjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443582; x=1773048382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m63XK2iVZk4UvoVq2mXd/LFRNHOlrlceciFzjjpCg3E=;
        b=mh5vy1Rvivii02Zm+30Rg60LOa1yB+F4JpPAvk2wCO1IQ20isdm8NLL/n3NjmzBm8D
         /R8t7zYCGBTagxBMU7dIGc2/7EmF5s19ByLPfnibxPJkJEVVIGyztVjjg85SC67VZiPY
         s2pdUoj2bVSGlmTTRqtxmlAlgz4hIsjqOT2HsGUBZIK0swWxgrK5RF/kWQ4oc3A3nD2d
         4pd2znOVRn7TVUXV2o8Pagn1Cg6SWX8nAgyM+OZs58e7P0VxcGXaCFnsQ5umdBw9sO0J
         Awtx/jlKNZwWkpc6HDDu7Jkz4GRtAyFxa2u6pEmfDgJM5ob5tRPl5rZraA9hXqMT7TtL
         91Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXGvaLM8iVJxC/4aahMA9GEQj8xu9dedtx2+P282CMiElmUwes4iKVcglG4BlYb7iRTvN9IpktUI58tMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjKjGTJWiuropD7CF3vBkJ/uyxEt9RXCdahUyPadNfo0EJ7K8P
	ZjUCasLrP2J959TDKx+EU0t5QLQ38a0Esj5qvRwKV6ITPPvvY88q0TR1fxT7rReA+OdS0pMikPO
	LYUxbD0eMnL1BoRqCXYJRhwcy5jPljx5k4WlhVfPPEqR/yXy28b0bH2bix/sEYU/ZkA==
X-Gm-Gg: ATEYQzwdS5nTgeuj4IVoFVkZnaAryU5CZB+vtmIgtbIZRPNq0Q6DelUs08ssCeEMtre
	qg1Aj+fSZ1R9QPW7Ve7IHd37XgLcXLB4MPJiwTLXHDkT7LZ4Jrowx6g/ZzX6V6P+VjygMGB+I10
	Z3tDofAk2nxX/O9z4BE5KvdMo01OYpQqsDFfaZqLFWMSZ83VBwBWZiXf/50hGMWQZCtrlS/Kr/X
	ryLnfqTBsoK8jzBE1BXr652x/ZpVQwlnRwG4YITFZl9J9ieEPZkPkxicJB9laviDDUQf440ZYCT
	8lmyiTJFYgpJapklREzLBZiJbn1S0L5JDpDqMqL25TFqO+5a2ZYTFGdVNTy4Z6kmw/JCXsrjHel
	pYKiIUhcpdj3VExkZQk14cBHnO1Fm7pFFYLtdlabwxNRP0AN7oyK5Yg==
X-Received: by 2002:a05:6a00:14d3:b0:827:2792:e413 with SMTP id d2e1a72fcca58-8274d9b4cabmr12436821b3a.17.1772443582375;
        Mon, 02 Mar 2026 01:26:22 -0800 (PST)
X-Received: by 2002:a05:6a00:14d3:b0:827:2792:e413 with SMTP id d2e1a72fcca58-8274d9b4cabmr12436787b3a.17.1772443581755;
        Mon, 02 Mar 2026 01:26:21 -0800 (PST)
Received: from [10.0.0.3] ([106.222.233.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4c910sm12351878b3a.8.2026.03.02.01.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:26:21 -0800 (PST)
Message-ID: <b6caaf35-2e41-9b76-aab8-0b8b6a8a8e67@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:56:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/3] media: iris: Add support for Gen2 firmware
 detection and loading on SC7280
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
 <20260227-iris_sc7280_gen2_support-v2-3-7e5b13d26542@oss.qualcomm.com>
 <yjtzeyjovbi3coyw4rblczokuki6t7oj5ni3exrzksdg4dwwd5@seuaf2tmrvub>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <yjtzeyjovbi3coyw4rblczokuki6t7oj5ni3exrzksdg4dwwd5@seuaf2tmrvub>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nZJYLYVY_LW6oLjB3gJlqB9Hf_o5PsbO
X-Proofpoint-GUID: nZJYLYVY_LW6oLjB3gJlqB9Hf_o5PsbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OSBTYWx0ZWRfX8XiX0fjaxyJV
 7WciijRQ4TXxBt6Di6FbkA6oEhcTbwDQV6g2DmHi7FbvSZAp8biMz84CvXxEhBFBMz/WlT69vZl
 YWdi1fkHFRHgZPLGtrMKNiOu7sBcJQay578fDZrPKq1qtUM6ECWW9y0jMWnaQ3QiCjqIMuNqgqj
 yCPeg22lVHM5CAvLFRDE31W7HA9bjoRcES5za+p4FS5okVnJt0qiG41SJeKrHX6VXXuB5tth0mL
 sOzjsOyw3yvZSOCssYIwvHXVTDuQ4X8PvDIbQKMydeNA+WmwptOHAvzrIkC0+gCYA+wzL+PAqXe
 AygRIADUPDTIwc4UZEb2KQz07dZaDtNRVX1or7oEnIitn7TNnklDZaOaUz9B5Dlvwn/2k7ZejvX
 hkvZXJaXhQmEuufyh6LnKQbh8bbbYUbbMSZbg66qla9H/WCkvdA5oTRO95M3HrZtqjzgQx9ZQIR
 u3XIgl1FPjBMa9lGAQQ==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a557bf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Rcr8AszoUWCL+GUTnXSVkw==:17
 a=vAhLNi6rj8_hoSnI:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0SyxZaFqcU5EExQ19UIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,60fps:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54069-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F3CF21D5911
X-Rspamd-Action: no action



On 2/27/2026 5:48 PM, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 12:21:03PM +0530, Dikshita Agarwal wrote:
>> SC7280 supports both Gen1 and Gen2 HFI firmware. To support both
>> dynamically, update the firmware loading mechanism to prioritize
>> Gen2 availability and detect the loaded firmware version at runtime.
>>
>> The firmware loading logic is updated with the following priority:
>> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
>> 2. Gen2 Autodetect (SC7280 only): If no DT property exists, attempt to
>>    load the specific Gen2 firmware image (`vpu20_p1_gen2_s6.mbn`).
>> 3. Default Fallback: If Gen2 loading fails or is not applicable, use
>>    the default firmware name defined in the default platform data.
>>
>> Additionally, introduce `iris_update_platform_data` to inspect the
>> loaded firmware memory before authentication. This function scans for
>> `QC_IMAGE_VERSION_STRING`. If the version string starts with "vfw" or
>> matches "video-firmware.N.M" (where N >= 2), it identifies the
>> firmware as Gen2.
>>
>> If Gen2 firmware is detected on SC7280, the driver switches the
>> internal platform data pointer to the Gen2 configuration.
>>
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_firmware.c   | 70 +++++++++++++++++-
>>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  4 +-
>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ++++++++++++++++++++++
>>  .../platform/qcom/iris/iris_platform_sc7280.h      | 15 ++++
>>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 -
>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
>>  7 files changed, 171 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>> index 5f408024e967fd21ade66cc3fa377d8507f9002e..f6ee7f58d4ce215ad9f7fb5fdcadec17f99c8848 100644
>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
>> @@ -14,6 +14,53 @@
>>  
>>  #define MAX_FIRMWARE_NAME_SIZE	128
>>  
>> +static void iris_update_platform_data(struct iris_core *core)
>> +{
>> +	const char *marker = "QC_IMAGE_VERSION_STRING=";
>> +	struct device_node *node = core->dev->of_node;
>> +	const char *found = NULL;
>> +	int major = 0, minor = 0;
>> +	char version_buf[64];
>> +	struct resource res;
>> +	void *mem_virt;
>> +	size_t i;
>> +
>> +	if (!of_device_is_compatible(node, "qcom,sc7280-venus"))
>> +		return;
>> +
>> +	if (of_reserved_mem_region_to_resource(node, 0, &res)) {
>> +		dev_err(core->dev, "Failed to get reserved memory for version check\n");
>> +		return;
>> +	}
>> +
>> +	mem_virt = memremap(res.start, resource_size(&res), MEMREMAP_WC);
>> +	if (!mem_virt) {
>> +		dev_err(core->dev, "Failed to remap memory for version check\n");
>> +		return;
>> +	}
>> +
>> +	for (i = 0; i < resource_size(&res) - strlen(marker); i++) {
>> +		if (memcmp(mem_virt + i, marker, strlen(marker)) == 0) {
>> +			found = (const char *)(mem_virt + i + strlen(marker));
>> +			break;
>> +		}
>> +	}
> 
> This should be done in iris_load_fw_to_memory(). Saves you from extra
> memremap() / memunmap() and also from scanning extra data beyond the
> loaded image area.
> 

Agree, I will move the version detection logic inside iris_load_fw_to_memory.

>> +
>> +	if (found) {
>> +		strscpy(version_buf, found, sizeof(version_buf));
>> +
>> +		/* Check for gen2 version string: "vfw..." OR "video-firmware.N..." (N>=2) */
>> +		if (strncmp(version_buf, "vfw", 3) == 0 ||
>> +		    (sscanf(version_buf, "video-firmware.%d.%d", &major, &minor) == 2 &&
>> +			    major >= 2)) {
>> +			dev_info(core->dev, "Gen2 FW Detected: %s\n", version_buf);
>> +			core->iris_platform_data = &sc7280_gen2_data;
>> +		}
>> +	}
>> +
>> +	memunmap(mem_virt);
>> +}
>> +
>>  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  {
>>  	u32 pas_id = core->iris_platform_data->pas_id;
>> @@ -64,21 +111,38 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  
>>  int iris_fw_load(struct iris_core *core)
>>  {
>> +	struct device_node *node = core->dev->of_node;
>>  	const struct tz_cp_config *cp_config;
>>  	const char *fwpath = NULL;
>>  	int i, ret;
>>  
>>  	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
>>  					    &fwpath);
>> -	if (ret)
>> -		fwpath = core->iris_platform_data->fwname;
>> +	if (!ret) {
>> +		ret = iris_load_fw_to_memory(core, fwpath);
>> +	} else {
>> +		bool fw_loaded = false;
>> +
>> +		if (of_device_is_compatible(node, "qcom,sc7280-venus")) {
>> +			ret = iris_load_fw_to_memory(core, "qcom/vpu/vpu20_p1_gen2_s6.mbn");
>> +			if (!ret)
>> +				fw_loaded = true;
>> +		}
>> +
>> +		if (!fw_loaded) {
>> +			fwpath = core->iris_platform_data->fwname;
>> +			dev_dbg(core->dev, "loading default fw: %s\n", fwpath);
>> +			ret = iris_load_fw_to_memory(core, fwpath);
>> +		}
> 
> Make SC7280 default to Gen2 firmware. Then:
> 
> 	ret = iris_load_fw_to_memory(core, fwpath);
> 	if (ret == -ENOENT &&
> 	    fwpath == core->iris_platform_data->fwname &&
> 	    of_device_is_compatible(node, "qcom,sc7280-venus"))
> 		ret = iris_load_fw_to_memory(core, sc7280_data.fwname);
> 

Ack. I would rework iris_fw_load() so that SC7280 defaults to the Gen2
firmware when no DT firmware-name is provided, and falls back to the Gen1
name only when the Gen2 image is missing.

>> +	}
>>  
>> -	ret = iris_load_fw_to_memory(core, fwpath);
>>  	if (ret) {
>>  		dev_err(core->dev, "firmware download failed\n");
>>  		return -ENOMEM;
>>  	}
>>  
>> +	iris_update_platform_data(core);
>> +
>>  	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
>>  	if (ret)  {
>>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 5a489917580eb10022fdcb52f7321a915e8b239d..f1bbbe043e3a3ccc5eebf67091162678eb83bf45 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -43,6 +43,7 @@ enum pipe_type {
>>  
>>  extern const struct iris_platform_data qcs8300_data;
>>  extern const struct iris_platform_data sc7280_data;
>> +extern const struct iris_platform_data sc7280_gen2_data;
>>  extern const struct iris_platform_data sm8250_data;
>>  extern const struct iris_platform_data sm8550_data;
>>  extern const struct iris_platform_data sm8650_data;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> index df8e6bf9430ed2a070e092edae9ef998d092cb5e..6dbdd0833dcdc7dfac6d7b35f99837c883e188e7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> @@ -414,8 +414,8 @@ const struct iris_platform_data sc7280_data = {
>>  	.dma_mask = 0xe0000000 - 1,
>>  	.fwname = "qcom/vpu/vpu20_p1.mbn",
>>  	.pas_id = IRIS_PAS_ID,
>> -	.inst_iris_fmts = platform_fmts_sm8250_dec,
>> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
>> +	.inst_iris_fmts = platform_fmts_sc7280_dec,
>> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),
> 
> Why?
> 

SC7280 Gen2 platform data relies heavily on SM8550 data structures.
However, unlike SM8550, SC7280 does not support AV1. To address this, I am
defining a dedicated platform_fmts_sc7280_dec array that correctly lists
the supported codecs (H264, HEVC, VP9) excluding AV1 and using for both
gen1 and gen2 platform data for SC7280.

>>  	.inst_caps = &platform_inst_cap_sm8250,
>>  	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
>>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..5f3be22a003fe5d80b683b43a1b2386497785fb1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -15,6 +15,7 @@
>>  #include "iris_platform_qcs8300.h"
>>  #include "iris_platform_sm8650.h"
>>  #include "iris_platform_sm8750.h"
>> +#include "iris_platform_sc7280.h"
> 
> Don't you end up with two copies of 7280 data in the object files?
> 

You are right, there is a duplication.
The header is needed majorly for above reason to exclude AV1, I can have
only platform_fmts_sc7280_dec defined in gen1 file and extern and use in
gen2 file, that will deviate from the design we are currently following for
platform specific caps though.

>>  
>>  #define VIDEO_ARCH_LX 1
>>  #define BITRATE_MAX				245000000
>> @@ -1317,3 +1318,85 @@ const struct iris_platform_data qcs8300_data = {
>>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>>  };
>> +
>> +const struct iris_platform_data sc7280_gen2_data = {
>> +	.get_instance = iris_hfi_gen2_get_instance,
>> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	/* Gen2 FW for SC7280 requires bigger size for line buffer for encoder */
>> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
>> +	.vpu_ops = &iris_vpu2_ops,
>> +	.set_preset_registers = iris_set_sm8550_preset_registers,
>> +	.icc_tbl = sm8550_icc_table,
>> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>> +	.bw_tbl_dec = sc7280_bw_table_dec,
>> +	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
>> +	.pmdomain_tbl = sm8550_pmdomain_table,
>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>> +	.opp_pd_tbl = sc7280_opp_pd_table,
>> +	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
>> +	.clk_tbl = sc7280_clk_table,
>> +	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
>> +	.opp_clk_tbl = sc7280_opp_clk_table,
>> +	/* Upper bound of DMA address range */
>> +	.dma_mask = 0xe0000000 - 1,
>> +	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
>> +	.pas_id = IRIS_PAS_ID,
>> +	.inst_iris_fmts = platform_fmts_sc7280_dec,
>> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),
>> +	.inst_caps = &platform_inst_cap_sm8550,
>> +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
>> +	.tz_cp_config_data = tz_cp_config_sm8550,
>> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>> +	.ubwc_config = &ubwc_config_sm8550,
>> +	.core_arch = VIDEO_ARCH_LX,
>> +	.num_vpp_pipe = 1,
>> +	.no_aon = true,
>> +	.max_session_count = 16,
>> +	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
>> +	/* max spec for SC7280 is 4096x2176@60fps */
>> +	.max_core_mbps = 4096 * 2176 / 256 * 60,
>> +	.dec_input_config_params_default =
>> +		sm8550_vdec_input_config_params_default,
>> +	.dec_input_config_params_default_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
>> +	.dec_input_config_params_hevc =
>> +		sm8550_vdec_input_config_param_hevc,
>> +	.dec_input_config_params_hevc_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
>> +	.dec_input_config_params_vp9 =
>> +		sm8550_vdec_input_config_param_vp9,
>> +	.dec_input_config_params_vp9_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +	.enc_input_config_params = sm8550_venc_input_config_params,
>> +	.enc_input_config_params_size =
>> +		ARRAY_SIZE(sm8550_venc_input_config_params),
>> +	.dec_output_config_params = sm8550_vdec_output_config_params,
>> +	.dec_output_config_params_size = ARRAY_SIZE(sm8550_vdec_output_config_params),
>> +	.enc_output_config_params = sm8550_venc_output_config_params,
>> +	.enc_output_config_params_size = ARRAY_SIZE(sm8550_venc_output_config_params),
>> +
>> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>> +
>> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>> +
>> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
>> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
>> +	.dec_output_prop_avc_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
>> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
>> +	.dec_output_prop_hevc_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
>> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>> +	.dec_output_prop_vp9_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +};
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
>> index 0ec8f334df670c3c1548a5ee3b8907b333e34db3..6e05f2542a5457bd0b3b6acced3bd54d166b2023 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
>> @@ -6,6 +6,21 @@
>>  #ifndef __IRIS_PLATFORM_SC7280_H__
>>  #define __IRIS_PLATFORM_SC7280_H__
>>  
>> +static struct iris_fmt platform_fmts_sc7280_dec[] = {
>> +	[IRIS_FMT_H264] = {
>> +		.pixfmt = V4L2_PIX_FMT_H264,
>> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +	},
>> +	[IRIS_FMT_HEVC] = {
>> +		.pixfmt = V4L2_PIX_FMT_HEVC,
>> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +	},
>> +	[IRIS_FMT_VP9] = {
>> +		.pixfmt = V4L2_PIX_FMT_VP9,
>> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +	},
>> +};
>> +
>>  static const struct bw_info sc7280_bw_table_dec[] = {
>>  	{ ((3840 * 2160) / 256) * 60, 1896000, },
>>  	{ ((3840 * 2160) / 256) * 30,  968000, },
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 22c7b3410710328b900fc49459cd399aa0e89b02..1f44d3ea337df63fbf5317b9b99139a0867267c3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -12,7 +12,6 @@
>>  #include <linux/reset.h>
>>  
>>  #include "iris_core.h"
>> -#include "iris_ctrls.h"
>>  #include "iris_vidc.h"
>>  
>>  static int iris_init_icc(struct iris_core *core)
>> @@ -257,8 +256,6 @@ static int iris_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> -	iris_session_init_caps(core);
>> -
> 
> Why?

Movin iris_session_init_caps to iris_open because platform data this
capabilities may change after firmware loading, which happens after probe.
Initializing caps in probe would result in stale Gen1 capabilities if the
driver later switches to Gen2.

Thanks,
Dikshita
> 
>>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>>  	if (ret)
>>  		return ret;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index bd38d84c9cc79d15585ed5dd5f905a37521cb6dc..0727d5d19cb9b7ed1f72ab840ae5dfda0162e23d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -9,6 +9,7 @@
>>  #include <media/v4l2-mem2mem.h>
>>  #include <media/videobuf2-dma-contig.h>
>>  
>> +#include "iris_ctrls.h"
>>  #include "iris_vidc.h"
>>  #include "iris_instance.h"
>>  #include "iris_vdec.h"
>> @@ -196,6 +197,8 @@ int iris_open(struct file *filp)
>>  		goto fail_m2m_release;
>>  	}
>>  
>> +	iris_session_init_caps(core);
>> +
>>  	if (inst->domain == DECODER)
>>  		ret = iris_vdec_inst_init(inst);
>>  	else if (inst->domain == ENCODER)
>>
>> -- 
>> 2.34.1
>>
> 

