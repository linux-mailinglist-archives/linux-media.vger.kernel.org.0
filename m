Return-Path: <linux-media+bounces-60720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJldIDgx/GmNMgAAu9opvQ
	(envelope-from <linux-media+bounces-60720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:29:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5F34E37F1
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B0EE3008D63
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B56F33B6C4;
	Thu,  7 May 2026 06:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okPBS4Wg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vgmm6rDr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B0633B6D9
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135349; cv=none; b=NYlMZqxbLCfX/AEhNwk4JI8xx03JmyL2B4DkRmrmmeFRQLfWf6NqwaqCs1joIU18XMy4hwpAATDA3nmxKqEee+pr+Cj8VdKvH+Cwo1qK91mW8iFe+F3JUD0s/MNXdsIAMj7keRyD2WRTnC3IuSYLHtWXqvwz+M4JBgYaFb+9BQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135349; c=relaxed/simple;
	bh=q4n4WscZymGR+jyXhlIk0f5MOolnTwjpVYSPetxxmyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orZyWCAXR4ePp+h/yDcmJdNhrR+vPTBejiV4J8CLZqDzWG1qOSg93bjRxEIs7sV8FXRrr05+KYI574CXQ+7PTdSH4rmy6Df01+K1esilpcXq6XvFmq1RxLwILoJgV6V4CxyM2agSJZm+v6Unh1A0wHetHqVsBPAKywtWAli1rDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okPBS4Wg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vgmm6rDr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745pUw879586
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MfXJtZr1BfbpzWAqkA3avZGzmWbhCTFbYqpnpL7A00=; b=okPBS4WgbSJc119L
	dmcdC9QxnO/7Q0WxFtlWr/TSF+g3Xr/faXdpBDz8RZBZrwvrJmzgm7K6EMdW/fbC
	SkviSo9rn+wm3toholzlcBi3YHsaiNM3EWITvOhKzz8JNxvHsiTjTLskQHp7l/Zb
	HPL2giqopb3EmaZ+906JKl1CSe4NESfq0MyTUN4zCkERnXlfU2FCXmsroxYG0Xaw
	bFCEQJLrLGQ4cB0/Yj+tCtXyri/EcxWs6DVv7ug2SamfJmqtxfOQcJBsn8O2ErOp
	JqxqLk81ugb8Slkb+K9xkTW0iRbGIscjTVDRlXGZPrchVFFS9w400bTY+Mwwh+ee
	nQ/k/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0dqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:29:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365290bc5adso377212a91.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135346; x=1778740146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MfXJtZr1BfbpzWAqkA3avZGzmWbhCTFbYqpnpL7A00=;
        b=Vgmm6rDrJjw1pKcw2HhDPxOS1SAqSAMZwAPBuwaN2zzvLM+eKTxty2cl5Wcmapj2bK
         sihXOzbs6OaecRdfrISJvsB3LEL/gsKXFaH2dc+wU+ZqocjXf14D74YJXleWs3qplKcz
         MApnvq/umOzt6qMuZL5mSCgQo70MXFGVjqHe1lq/UTaXwMZIqtpXTtxlwQaJH0sGLjtn
         qBf8FgvjMnLKCfumYjeytYci0VOTbwXrsQx42ES6orpw3intbFePEk8HQ3CMMNdHxWcj
         2ifrLDVOnuhkaeOCsrgG3/5oDtbVv2uxNAj6yiYAo+KaOblHJT36R0PX1fsHXElMv5fT
         xUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135346; x=1778740146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MfXJtZr1BfbpzWAqkA3avZGzmWbhCTFbYqpnpL7A00=;
        b=T0WCwZJBXJATkp7aZb5/WyeLRzZgTJ3wU/Wf7UDpMSZ80kPBwJWFibMsaT++TjmwhK
         M6NOtni1hU7jHljH2Xk2WYuvjZxlvykF+1JTt4xHvAED7wAykMMiZN4KpQUUjvTN3sIl
         43UpghrTvjD0N+8RFdmXXKKT+0NdmDN+9fJjVjeHRM5xL41FOYtSlR564LZ/pGp5+QU+
         KbTXIvzf7Iis7gyG1YGGV4isQDwAi88RoTIq5VmYIc8Q2qc46ZBKx+w0tLsJ+t5IAvB+
         A/bbi7niX/JICkKPH65FD+HhT//T/yjm++S60RP+vX45ClHGrOhYu65xzjFWhDsYVyqa
         Wwew==
X-Gm-Message-State: AOJu0YwO7Z2FXyO6F32rK7TiSGKrMOOxprACkFwcwlyfhWWZvqJQaR0J
	UBnUzv2bycDh3INNz+RmN0Tsood/QPgoBglGPT85iNO1B7oKiAyhWqxMcP8k/kreIwg3b14QaJj
	V3Qp+57Pb6ppB414NghQ55V8q1Vsi9/1bJcyWTFZQOANmSNLSr2pU4exxbIweaobDvQ==
X-Gm-Gg: AeBDieviX3L+xD1A0ulcSM+vFRiiuqSmOMKxNlRlJQv48pN3Joa8zLoc/7z8j6C2mcn
	LWHYA3DWONc0GQ2nJnjRZ8fYK6ryi67G5SGeQxRooplTQPR2UW+mhlKggDyqftLdTZcZZWvhySU
	pgbGLtORYdah2uMvF5kGT9E2a4C+rAbvLX+8UaVWRKAetbGpqZ1dawFJ8XgdXJYbcRxeybxkDt9
	QjvS8N+xrlv7THRJ6zZt+wnz/pARpCVFfgIGDWs3rX30l7v7nNVYcO/4AdMT2t01W+x7B8ulwib
	j/Eil74DtUg6iP+hBlWQogwpfl2QqqJawix9kGBecN0qqim+gH0j85FvZGzpssgYYYlOij/Gjen
	wW2AI592JrheZpWHrNoVb1NlAM9gxWRKFQkvZqs/2HtwjV6JiGszh9vpOHRpH9gIidxM=
X-Received: by 2002:a17:90b:3911:b0:364:aa5d:7d64 with SMTP id 98e67ed59e1d1-365ac270394mr6667592a91.14.1778135344450;
        Wed, 06 May 2026 23:29:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3911:b0:364:aa5d:7d64 with SMTP id 98e67ed59e1d1-365ac270394mr6667566a91.14.1778135343956;
        Wed, 06 May 2026 23:29:03 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365df289c4bsm1525252a91.3.2026.05.06.23.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 23:29:03 -0700 (PDT)
Message-ID: <2440d481-d7a2-4d52-baa6-6003b49a3f88@oss.qualcomm.com>
Date: Thu, 7 May 2026 11:58:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] media: iris: Add platform data for X1P42100
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
 <20260507-enable_iris_on_purwa-v6-3-48da505e23bf@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-enable_iris_on_purwa-v6-3-48da505e23bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc3133 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BKLBf-2C27FvE5_AC5EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: OI8NNsOom7-UCplXk41E7wazgUKa1J6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MSBTYWx0ZWRfXxmKZ0pfEVgs3
 BCrepu/uyV/PG1z5VulW0ysJ45P3WFXL6H0I1yuJRdSWrvKIWeaYvcY2j8X4aUdKzyI8AC3+hoY
 DgUrZ4o0vjQj+Mn3vkY6a2GWjdxENlDEN+JbWh9RAFIzHsfU4SoUsezDJjANc2J5j8WOEcNR6lF
 Vv4Ze5OAEQJaogYGMCBqtfeDgl8eEmfII/3Wv3xAPYzE4UwMM9FMVdEXa5K3oCOcFrJqjRPMWB5
 MkDtfPfUHFk/g0J8UZFDypBcsXB/hAx2EsDGwqcf2f94ysM/3ZqyqRm9EtC4wCxL1ddV0ZwYnQD
 Vkn+ZW3Es4tJUIkTg0uNs1GW+FLZzDXYV+LEJfFCCSRV6MvXLFO4nmuBzwcUwc0ma9KFIfA8zcP
 R4lm8cM+UFYwWwZbqgOp+oI4oFNEC5nX1zS3Mtnxow+naVDhHQ+21pNNe7KGq7UopHVyp507TBZ
 U2sncSRQgVSYdvlbqyg==
X-Proofpoint-GUID: OI8NNsOom7-UCplXk41E7wazgUKa1J6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070061
X-Rspamd-Queue-Id: 1B5F34E37F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,qualcomm.com:server fail,sto.lore.kernel.org:server fail];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60720-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 11:35 AM, Wangao Wang wrote:
> Introduce platform data for X1P42100, derived from SM8550 but using a
> different clock configuration and a dedicated OPP setup.
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 103 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_x1p42100.h    |  22 +++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   4 files changed, 130 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


