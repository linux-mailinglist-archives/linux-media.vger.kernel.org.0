Return-Path: <linux-media+bounces-58211-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IFBIIUc1mluBAgAu9opvQ
	(envelope-from <linux-media+bounces-58211-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:14:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 378A43B9B52
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 589D13015A76
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 09:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A99E19C546;
	Wed,  8 Apr 2026 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b00s5HsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bfkKCDT7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A209D2C08C4
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639671; cv=none; b=Cw5KJ8Oxv7LiMngqXzTycsKgk0rmMWTN5SXLlWI4+9gq9gZcFpcEGnUTBGRdEAC1Ic9ynGUiHTDHN8ZI6qF2D4mFsRqSkrRI07k180kvR7BuZRk0FfXMs/uf1HIORRP4ygwWHnbSqId2Eh8YotQ3YSu7plCDvfOcdkgAkcSvEGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639671; c=relaxed/simple;
	bh=YvtodDdplKMdW3PBeWJkCqYTAkXl02h8pr2K+T1smhY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Kcsc30eX1cMOlJfKacPh910btkSWc49ieML9sJKlddSnB38f2kAiuwkLAmR+PZM0TrVyEyy0lmBjvJ/tbTPaQX+OP9VqKE3mmkKwBzxbifrcpYtcqbEKUdt+iwzFyFzxjoRlI+gGVubhNIE1BQXhB6e0c1l2Tc0x9iROvnVzLCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b00s5HsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bfkKCDT7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387dR1n1259461
	for <linux-media@vger.kernel.org>; Wed, 8 Apr 2026 09:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7cTSR5FSGG/VsgFWndHXllplgpX+lHRL5bp+rlm+lc=; b=b00s5HsLbAeWD9rF
	OgTnWAL2NbNVpiIqljY5NG71G3Bo3Lepj7AmAgwB0vHEs60/jPB864tCHGtWUOiD
	Is8fDK/+9DnL4y4eiEAtfw1Unz9HNpqFkdOhiIcEbgUBwIDR6wYIJsiun832V/Vk
	JXXx2l1P4vc55kT9F/1/E07be5xnIKVe4KfBxrsDHBoKAIEFaMtz0O1gdjCkFHIw
	vrcsXme/qpbjHZrK85P44qlIsqS8LZQdpSH/a/s3urHUDxTvorKF87lmd2iaC5rk
	0D9XnZEzoouqfh+lYHfdWpwYYmu6gIK9OAsC8m15RLzc3ndEMBU53Yw9WFisAVBU
	aW5nxA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttstbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:14:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b23af7d7e8so164477565ad.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639668; x=1776244468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7cTSR5FSGG/VsgFWndHXllplgpX+lHRL5bp+rlm+lc=;
        b=bfkKCDT7yPFTurXmWjkJb4eT2hTxa8fOOvwNhNnkEutO5N4J0MaVb54tHwVoOuTzHY
         98g4naa61MsyjyhWUno16/HMDiMOp3VO1m3zxUuT6vmch4CnLmqwy6MQSlPtUWFfXoYv
         xpQAHyx7AR6zr07NAL+H1UAhShFbQxiq30HM8qUgEMds7dkXh4gYE9tlHcwDHmFAKE3J
         kk33MJKzNIZd1ozwkyQCF1HBbagy0w77D701iaBpZ9ZtKsEPpoqWhxSvJu+ZPjFpFz45
         vMy0Mzy4R3yL80YQQR5mSYuboaPJMT+9LO6nd3OLlUBfotL1ILaWHAekBYNWkzaJL1NP
         y0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639668; x=1776244468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7cTSR5FSGG/VsgFWndHXllplgpX+lHRL5bp+rlm+lc=;
        b=j0wlIh4kC6VGfpBWQ2iouJFfj9fmdxb3foN3d4bgLpAJbnF3yVHFZAVoGP/tfRp/FJ
         b2V7AGQaBcDXQCdfg9JhWxGfP2Yv+axORnbtWqjJNQ8W5CqXKFm1/2JGvBffYbXLK4aQ
         ejJy0MGikKoYBg7Y1dZ6qAr6eWBN6L8f2gym003lqqL/kC3kis4DF9wFqa6gWmGGis7P
         ScKa3gvTZc4CRhJX202qHitGC0g2/2Hg/g9fULsRQqbeMiKutcaGIdOQWjAXRSQ6ftwX
         kLgu+rp4odqPyCQUb9KNIHkW7mNZTj7n/J3WLEDFvbOVrOBwTaGkGTAlKs8x1p+Th0CK
         BTLw==
X-Forwarded-Encrypted: i=1; AJvYcCUp8Ta+1jM+aEVOBE5FXCVf9xDlFW75NgoSkvfrndz1m6CL4JJtDCgXvmeSPj52ySiNC8Cxx9RBDeGPhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzBNuMxnGiz5sk8FJUv8GfjedISHCEUkRz6tsB6TLEXhflS5ji
	D1H6Wkc6Odp5m/ll5pyaxBV3OJDkVT7zsRJbFnqhJMHNxpXVN3Ng66s8a5D02gKyGxCsWwDhGBI
	rjRlPAu0P/c/PsSvVeD/0JJ5sHD0pagXi8rl8a8YMCX6+U4qH4RHepiA7hQ2LjxDV1g==
X-Gm-Gg: AeBDievi7eBNa87lhdZYgjsuC2xJCO51pkQUqAmTzDwDA2GZcPeR2bqNgPxqsS6+87W
	1QiEqyHwwOzAGn/68mN2X5pEG/5Cbrl+1TXIK8KJyzoajqp3MUiUXjTyFavXmjbUFqHckqq3f1b
	UfuLizNc5dOJoRIJEnWBTUGoisfDLg2Am5APrW+5LKe75Jf2MD3zPxI0Ah4DIn4f4Inv9lYAcmE
	fqJyjmUPi+jPAO3I127lJv2e/4zfMRt7PFPqhB8YRpfrJft1IcCCzDLOH/7LReA3o/MGwNRrr30
	SfpFzZd/1U6JKYd7bp3n+Lyhf1pcYom8uI4yd1C+yufJ2G6H+csIIDDvi749szjgfk18FIROPyh
	b9wA6v6JNYeCRv4vuat1KVvg8AE9zj8zoeCscu/U7eCe5zWCp4Mw+m8yKTbcR6WFNz5AmxL1ib0
	vhxFcUW0S7Cx5+9v4p
X-Received: by 2002:a17:903:4b28:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2b281867dc8mr185457315ad.16.1775639668341;
        Wed, 08 Apr 2026 02:14:28 -0700 (PDT)
X-Received: by 2002:a17:903:4b28:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2b281867dc8mr185456875ad.16.1775639667873;
        Wed, 08 Apr 2026 02:14:27 -0700 (PDT)
Received: from [10.249.21.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477a13dsm199169575ad.26.2026.04.08.02.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:14:27 -0700 (PDT)
Message-ID: <ed08f1f8-b820-40d7-956e-b346942e9ad2@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:14:21 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
 <9bfaf15e-99c8-a98e-d0df-9df86872bfe8@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <9bfaf15e-99c8-a98e-d0df-9df86872bfe8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8RgbufiS4uuNx4bP6SC7MqerbkNS-yAN
X-Proofpoint-GUID: 8RgbufiS4uuNx4bP6SC7MqerbkNS-yAN
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d61c75 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=uc885YhAzpYNqufBhGQA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MiBTYWx0ZWRfX6XOkMFLxOxcn
 m6x0i49m6j6EWZSMfRmLofONJqtLoDBC2+6BHYhf1i8SoUQgoJYHDyxoh7YMMxuTQ8N17yL02Xx
 /jRvPyqd90OH3yfRnx5a0MZMeaGQMgvfsED0Rd12u4p3iNedYlJnvUomtfkYwW/XFPJjeGCBj82
 QorFnJB6FQ09ffYi+BfNAT0lcMg03sEXEn+XOklE2719Hb3mJ6o44sBPWwg3oWhwmrMe79deC7n
 U51dvdqjo9MHWduwYqsNvYPIw00X/VfIvJYGj8MV1QguSctwcz9dSFwzjhpxnbzz71PSch06trG
 MjFhCA2g0N9cIj2n7g5cruud47ahJfXAu3AZxbiVwrPqgLSjm7GfRynHfX3RyiU7nRzaWgw9p3g
 hfUvWxmf3Cj4uKXczP309pQ6t9nmrHZC/a/4N3gx1ZMwJ2ZdVIdNFsyVUJHBm9siEA69ThpT+fN
 nVrjZelQk9XTmEaTBag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-58211-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 378A43B9B52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/4/1 20:37, Dikshita Agarwal wrote:
>> +
>> +static void iris_vpu3_purwa_power_off_hardware(struct iris_core *core)
>> +{
>> +	iris_vpu3_power_off_hardware(core);
> 
> this will eventually call iris_vpu_power_off_hw which would try to disable
> IRIS_HW_AHB_CLK which is not applicable to purwa I think, will that not
> create any issue?
> 

All VPU3s will call this hook, but none of them have IRIS_HW_AHB_CLK.

-- 
Best Regards,
Wangao


