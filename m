Return-Path: <linux-media+bounces-52396-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJt6BFHYiWn6CQAAu9opvQ
	(envelope-from <linux-media+bounces-52396-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 13:51:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9264A10F10B
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 13:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71E8330474DD
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 11:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BEC371055;
	Mon,  9 Feb 2026 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AX5x8KF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QatWDuSI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A9536F431
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 11:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636896; cv=none; b=iyC6ZK8jgnSJQAcfFp81M+1DA+rQIZKMf9l6yfK8TSrQ2Rb/nz3Cywd7Eo1F/mHw+cGwgV6jw1vCAHkuZp5fX3+BPJJgPU5P4OilPWQuv0VH9+XIqz3J+rnpUqGslpI8Ljim4YcYs4sekwxjuIUSgPDX35TJ8hcHIwzHIzgIfWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636896; c=relaxed/simple;
	bh=zXnm7jdzas/Vz0xpNjjHseVr6CkVlHCxbdTWauQAf5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQbHs7WB6ibSblA32uI85iLp1uC4amVfiDE05JfWoMm174d1+NW5hh1xWJX/0pFRWGjboGijfU7AuewxipkKmORTPaFn6RWpcNGmnxqVVPtCthxLcGiIjOsWgsCHrUwP3W7VmaRRq+Tq5k5wEKGhYTgdFRQfQ2ZDxke6UM3Vgw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AX5x8KF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QatWDuSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195NEtq3347087
	for <linux-media@vger.kernel.org>; Mon, 9 Feb 2026 11:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6wQHpzaw1kvRqf/OGFpYXqfnuHEkcJcWKMi2NgFcN08=; b=AX5x8KF+mG3YdHAy
	yip3gUqriFa8MvhQi+MDQfJCSoHFRgej9qCD2jZsTSrxEVTzsMX6hpzN9TvmfR5E
	sJObi8oYSiFCWIF6beAkGGf2qYNar2xbkxlfTQtjl2fIWRjS25r5GEZouvJgy52s
	AzygY96IGyaD58rqyM4HoyZ1XfByG+dq8bwIUyZjFpE/qjQBEdwoJ/oucZ8p9qI4
	BmVf1bJBZ12TOKFDXlkeHvs8qsbv/hCwp9uMVR5SYkFWu42ooju80w1aNtmWuJlt
	KShZ7ysGoBx3kCMTAY58teQLZjSsZGyzgwUu1BObG71E/TB1mO1zcTkgfcj8Mh/H
	dee/2w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79cy17fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 11:34:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81f42368322so3070676b3a.3
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 03:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770636894; x=1771241694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wQHpzaw1kvRqf/OGFpYXqfnuHEkcJcWKMi2NgFcN08=;
        b=QatWDuSITpf9Y0cLXS0reISHczrNEAL+v4PYZ5SLubEpSai7mEje1qXhguOFRrGRiH
         qwRpbgBQM1bffd4yC8GbfxTuWf9InuclMThlPrDqkWiRKT4/FIw//FqLCm6ObuiEGx6U
         iAoD7h41jzN4V6ndD9gBZGFyw8HgLnxp0LUqRHOK9jFzQ4HhkI94mFmuFx3D3c9kCAvp
         6tTqOq3rW/J/vo5vlXkZnwMjp7kyM4HDPN5/uXWSpNXItKJPdhquWxVhVNPzOU1ZW0oq
         Bnjk7bPumTNFUtycsEYnI48325tStp9LVUkFzETMU213CMd45h3Of3TvRo05ZHJNZERe
         gOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636894; x=1771241694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wQHpzaw1kvRqf/OGFpYXqfnuHEkcJcWKMi2NgFcN08=;
        b=n9vs/MAFoJ+d2YBquW+96Azk1v7CBQzhRdGNL/iyfilGnfAFWJuZjVguPPS2iGLGzR
         wN5xK4yG3o/xx2KiUeXmJ4lQsxcwzmmA9/nn6AuCtAVCNJcAwMQEye9K+fjxqnpE+ATu
         aEvb7kotqaZGrsjXl2BWr7+sdbQkQAnLhDuI9Qfnfg4CV4h8Vnk3OZ8/nYFtqmi5kb0y
         I7MLCjCoBMFzbUpVc3Kpas4m0iYemkTP+rryb2h13ERTj6DGny+zvlVHHaBux4IruRfk
         bRpDvzc3gvuwIhpZRU9G4Ct8RyO6l6ei797/Unuia/mcQ96u2lCGbQUpF54ylQIQaPLd
         JjMQ==
X-Gm-Message-State: AOJu0Yzi9BcEpsVX/eePTppD6pgKDjSH48CeI2FfTVKULkGYDAFOLzeB
	GqWigrDRG+1vzoUM8EPcZGb0Z3ZeR2Z1c6XgRf9mOraceyqUgQSS9jGZyAAjNpl7jQEWFHOQHh9
	SUc5zbjsScP9Z02DJAbjjFQX4JEtw5JF84rIf2Uvr6EN9PMZwnZfvOMsrEMGhVoSFAA==
X-Gm-Gg: AZuq6aIMt21v05/McsF9B29dIuzZmxsz4uMBwn6zxyEy9zGhxgJH8IYjXOnuKVB9byQ
	PSB8mT+47dqGXe3LzOnznidxC8cfsHBn9Tacfh3lfhbLPC/mwNAHUmKNt9Au2BT2AfjGTdhb+vP
	3eY74M5Uz6olD0YUJGZAGmj5XWHgczukpPcuTxueNpGdJ0DfFdwM//eW2FEW+4bIqQ/7++86kIa
	QSqtwM138jqYJXkR5P6Uacr8SxVq78Jm3pVjgbj8XEEEsuGhVc6K1OMKKTaus+yncmfzOOUaq0g
	LfdyiTR5OOOJkhvy87Aq1cRyrndndlFzqto3ozkLOoz9i5yT8vUeUoLyq60MBE2X0l0OU3QMM5q
	c8gl2TlQBnjSTTW+Dd3OV+IT/PFzRNim0uLOM9+wqCQ==
X-Received: by 2002:a05:6a00:4c8b:b0:81e:f623:ba04 with SMTP id d2e1a72fcca58-824415ffc05mr9975592b3a.13.1770636894544;
        Mon, 09 Feb 2026 03:34:54 -0800 (PST)
X-Received: by 2002:a05:6a00:4c8b:b0:81e:f623:ba04 with SMTP id d2e1a72fcca58-824415ffc05mr9975578b3a.13.1770636894064;
        Mon, 09 Feb 2026 03:34:54 -0800 (PST)
Received: from [10.0.0.3] ([106.222.232.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244166f3e2sm10356514b3a.10.2026.02.09.03.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 03:34:53 -0800 (PST)
Message-ID: <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 17:04:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oo9noLy3mhHpPP4Ca6Wi_4Ob7KKPspp_
X-Proofpoint-GUID: oo9noLy3mhHpPP4Ca6Wi_4Ob7KKPspp_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA5NyBTYWx0ZWRfX1XJ05jxLVaqH
 2D5C9ZFLXwo8p4DRTYENtzlyLg8FZqN3qbgxc4BtnlSZl7KgDA5TZyXHTfHVqSpQPnHeUetlIDH
 nF8O0eQMXYhsQncnw6k3JL6iX7dVdIXodv+cE2JH5UjVkzDB5h3UOD+Vr+NRcN/0Ob0bABHfM6j
 +oDbkSbQJlD4O4JGwdY07CzQlbe8eydf+6JCpUyikKUBVZ9EtiASTBnuq5X11iHlGoWlNqBnzd7
 0sx39RXEA8fnWABLRr5jtJpF8lw5yBR3uyshKhs1GlhInNFoG/VMs4pWHrbGdJ+uxKYd2bPTstz
 Jnvp9I4r81HePrFR13Jt/9/6nXdlqbHA3qK9x+E3JJZlx6T8bFg+nhZNQje/FN3yB+/Rzj4sl8J
 N/WPfSJa0gfyzIuQpVdF32rwzzxVVg1FtSoa8TIFHtam8pXT9QaN6syaBzcVLZQUUhs6vQUQFA7
 RVpY6eXlO1tAp0Bs8TQ==
X-Authority-Analysis: v=2.4 cv=EtvfbCcA c=1 sm=1 tr=0 ts=6989c65f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Q1L4dSpLiPPsWIQ2aSSWHQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Z23RTWgoM7wVZOyl_gUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-52396-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9264A10F10B
X-Rspamd-Action: no action



On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>> opt‑in by specifying a Gen2 image through the Device Tree
>> 'firmware-name' property.
>>
>> Based on this property and the availability of the referenced
>> firmware binary, the driver selects the appropriate HFI generation and
>> updates its platform data accordingly. Boards that do not
>> specify a Gen2 firmware, or where the firmware is not present,
>> automatically fall back to Gen1.
>>
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int iris_update_platform_data(struct iris_core *core)
>> +{
>> +	const char *fwname = NULL;
>> +	const struct firmware *fw;
>> +	int ret;
>> +
>> +	if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
>> +		ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
>> +					    &fwname);
>> +		if (ret)
>> +			return 0;
>> +
>> +		if (strstr(fwname, "gen2")) {
>> +			ret = request_firmware(&fw, fwname, core->dev);
>> +			if (ret) {
>> +				dev_err(core->dev, "Specified firmware is not present\n");
>> +				return ret;
> 
> This is fragile - if someone names names their gen1 firmware something like
> "myproduct_gen2_vidfw.mbn", it's going to match..
> 
> Could we instead do something like the explicit format checks in
> venus/hfi_msgs.c : sys_get_prop_image_version(), based on the **contents**
> of the binary?
> 

I agree that checking for "gen2" as a substring in the firmware name is not
reliable. Unfortunately, we cannot
usevenus/hfi_msgs.c:sys_get_prop_image_version() (or any Gen1 HFI query) to
probe the contents of the binary here, because Gen1 vs Gen2 have
incompatible HFI protocols—probing a Gen2 image with Gen1 HFI (or
vice‑versa) isn’t viable in this path.

To avoid accidental matches, I can switch to an exact filename match
instead. That way, only the specific Gen2 image (for example
"qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
want to use Gen2 can opt in by naming the firmware accordingly.

Thanks,
Dikshita

> Konrad

