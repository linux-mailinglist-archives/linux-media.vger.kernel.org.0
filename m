Return-Path: <linux-media+bounces-61561-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI/bGzU7BWowTgIAu9opvQ
	(envelope-from <linux-media+bounces-61561-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 05:02:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39453D3BF
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 05:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E15D3035AAC
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 03:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BD82EB859;
	Thu, 14 May 2026 03:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEVmWS7v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvTfUuL6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108251E832A
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778727723; cv=none; b=aGy9uZI803FBR5hVrv9Zob1k53KSOa5S4iVYEDK/BocuCkARJEKaL7NOSQmo7YvMzAqOViHEOl6cW/jX901SpnVE5pkay0YR/iRlzMBvuO2YiMqWDAzgAl322yi3awDBl5YEZu2D1t3G0pMrM7KJGtX4yeBuM2MqI4KvnEd5Izc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778727723; c=relaxed/simple;
	bh=JlGxCNFP5AqscuOf2R/v0doOmVWZhMUieAQXTabK+Fw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rKWhXwBrbQtJBiruqxETAdCz6NXQZjB5FCMbo677vI1Cvvhz6Ns6q92BRglsa7OHKZPR9FlNo+G13GLRQ5zuQxz3Y3bFocva6AiYZZOI5NMftwZwGfTRtYq71Rn9DSh5AHkrd+S30LXQcs8QN2WFno4CCCUh75zy2u9NT1T5710=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEVmWS7v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvTfUuL6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0w3SD2887823
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nuVaQCgOifhWXgFFXpvwYHL8FLwD6PE1wpppWoTe/so=; b=JEVmWS7vUSZVT0KI
	K/fr3Ry8MUhdCO6Z77tSjCd6mZGGA2kkkFU6fM/oAOZOvzMiW5OvFiVsL9pDuZq2
	OUJFE7pYjIcTLSr8ho6EAfN4g19KJS9gyfcX/LS8U299inTEx1yT0bG+OFFhPBm5
	oGFDdzj8z6i65QG1yIpBrco+/S+Wnpv9NDI1T7IYDbWzPeBHUTyuyzkpick/Fi0U
	SelUx51yNyoza6Ug/mDZvTMmObiel8IQnNpGw1R/VET8JuVQ/xzSKnkb3UTlafMR
	n8F+KG/Mf8O7xHh0m/qiXfPTaNQuZ9vxiAIcU7xrOQJafl3ax2vuLCicjHncZO6E
	Fvvgnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gktr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:02:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a6d84522so141351325ad.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778727720; x=1779332520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nuVaQCgOifhWXgFFXpvwYHL8FLwD6PE1wpppWoTe/so=;
        b=WvTfUuL6SBGb4kkgdhWzkpyLPI/8GWNd6kqC9d1ooAvIpvTe0OcIwId3IAzV7zXotD
         Ct7+MEUbZjgX8XoEyA/A3AbvGbzN5TNyxl7ZjArLwzcYAXd4rrez8ew+pJ3yiTfsqG4I
         SvFKKSsewnDABqfXzhREt7CthZ94eN2ajFwwlyd8sQ/sj3/TyZ5Xmk1puFtj8nIRMi+d
         Yl++vehePDJ6gXdaXGmgYwSkWRZY4HTlLVso7phE8FES4pwDZVfRuoOWQ4Y4NHHaYpHa
         i5e6lSigzE3eHS1FNzjoDcvsO8fJ9kCiGmG4s4NbcseK6PpZOCsOASOoXTDWTykdqD8R
         gGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778727720; x=1779332520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuVaQCgOifhWXgFFXpvwYHL8FLwD6PE1wpppWoTe/so=;
        b=r/sPNY2KdV2hGcd4W5Ipg0QK+zeNG0c8izDFVbTVjxRwveYlFA/tREJlsjOHwocxST
         GRQAN9g/UpyULOWbQM96KBWOucnFQJj4z+Ht2DCGTDSgWCITxCE3O7LKnl01ZscOsGPB
         o5ZwjUY4Q5x0yySH3xjIzqwHEvL9C7EnBEBaAPNlaJwBiB0pmyYF5qQX/2FgprUnImpw
         4AORu/pB0YZbU6nF2w3XHRhUclsm8pj/+LZoRUH9wul7/yDFhC00Z3JpKKf9Gk4WO0lD
         rJIgXqhzXAR9rZScUdusvhJRK2rpWCojbemyJaZDsJnyCV0j34XeXPEX1WzFt4+74kF5
         x+YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uwxB6/VZFzAZMekvL8e3yOTgQMIwGNWpJ0rPLkcK4fdJfEvvrJ1v8ii6CsiyG+BqmgiK8GKcB1y2ScQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhfXfEevCNwqVPopcwVF3h9A8JWurVO8eJ0W3EWjn0tnPNU6Wg
	QsoDEJsaY+OJl9QpndAhBUvLqKy6NxpCbHzYRRzjPJvCbF9JEnMWUAFBmmf8n5hQakJnFsrIUX5
	lDZPNUfQ48qDhm9R98jox9SkYiOafaIr4uDkxs5AblyqjfcJpVFwZ7mA1OUlFnRUx2A==
X-Gm-Gg: Acq92OGMMxKR9sJc7ihdT8tD//wedZteHAOBpDY+YTU6siIGY690nTlx0JO70mTbYFU
	H1vProRcoU/Wpx5x/oyUMHLBwso9j5Say+jtPDTaFU7QdQRiuKpAv99yDIJA3K/fHEG6UhDL9hD
	bSGRg70S9FkAwywVA4tB5Qp9OJzNBgITpk+iQ2KM/xjsCrcN2zXW1nhZJfUYT30m5GESPmCldwW
	a7DBKcmvgBb9uFMtuwH2IZQF26UhXXLGCaBlsiK5FrV4miMRbcu5Qz8pVPAZgsCPBdgxFXYMiTM
	e0QGUsLzLUKmC5ti7D5Qvo7krvIfEdmsCkY/p+QG2zloPUlGLhfY6OLUlwKBpfIpaauTan5riiN
	qHt6gWfLXRyMbUV+bcus8G4P0Dk0OnkhNc4tmUgt5urQXGPKnubbfbxN0aQAoLsGjrgzOUuyHE4
	ISIl1FyNEPn2tApt1vfHmliPippdA=
X-Received: by 2002:a17:903:31d5:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2bd2718bf40mr48530805ad.4.1778727720340;
        Wed, 13 May 2026 20:02:00 -0700 (PDT)
X-Received: by 2002:a17:903:31d5:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2bd2718bf40mr48530515ad.4.1778727719721;
        Wed, 13 May 2026 20:01:59 -0700 (PDT)
Received: from [10.249.28.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11d6easm7082155ad.72.2026.05.13.20.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 20:01:59 -0700 (PDT)
Message-ID: <1160f00c-2d48-4470-aecd-2420b9c79058@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:01:55 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 3/6] media: qcom: iris: Add B frames support for
 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-3-4954e3b4df84@oss.qualcomm.com>
 <vayghe665w66b2whefdstroyrleozjzfye4t5ckvjmju2rnftk@mxquiebncit5>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <vayghe665w66b2whefdstroyrleozjzfye4t5ckvjmju2rnftk@mxquiebncit5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sLdiNnAIHtroQasMWiH9iMzXoOGRvd-9
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a053b29 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=kLwFXv0XdFo9VwVnQ6MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: sLdiNnAIHtroQasMWiH9iMzXoOGRvd-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAyNyBTYWx0ZWRfXyepBsb+rOP90
 Igk5Kqrn0Asc5T382Sxw5xEebt3V2Sz4AXVxq5syE7mo8BSHR7HIbIgZ+K6YBzyCboMwabwDKrj
 lqTs62NZBOzSS7axuKZOP5GBJfpx1z0UnqSaiywkDXmrkk2wlDS0dj1pWTWUbsJu7iVpf1kBBAW
 EIrR5G4wzceeWN8ehBQakyuKyxiwY8HVy9HU+8B09kLvNNZ5hkd096bWZuHi2T9AGfxsKsjyPj+
 +ahpeuvmqDHaIKZfWPPVPxsfADeDabNr77kBcHAinJAos5iwGNzYMMIwceX7da3bF9w1zAH+LZc
 qZ33j1iwGDCl1FE3M6znyFaurGOAh88/4AxJ4GD6moRQcvhKwZkst5Qr9mx+LFTYgAcHA4UflyJ
 C+ybYzfXw3DTdfcILmMnvTkyxJzrRq8gO2OsDKA5Mn1EodUbHB+2z4SzB2vwRSEmjYLtH17vu7o
 rk13NgKds+QvKnC6T5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140027
X-Rspamd-Queue-Id: CD39453D3BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61561-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026/5/13 19:00, Dmitry Baryshkov wrote:
>> +int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +{
>> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
>> +	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
>> +	u32 b_frame = inst->fw_caps[B_FRAME].value;
>> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>> +	struct hfi_intra_period intra_period;
>> +
>> +	if (!gop_size || b_frame >= gop_size)
>> +		return -EINVAL;
> 
> The same comment. Maybe I misunderstand something, please correct me if
> I'm wrong. The definition of the GOP_SIZE capability allows 0 as a valid
> value. Here you are declining it. Why?
> 
>> +

GOP_SIZE
- Value 0: Behavior depends on the firmware implementation.In most 
cases, the firmware will treat it as an invalid value or fall back to a 
default value.
- Value 1: Explicitly means all I-frames.

The gen1 firmware does not support passing GOP size directly — it is 
determined by the number of P-frames and B-frames between I-frames. If 
the client passes a value of 0, it will cause the subsequent gop_size - 
1 calculation to produce a negative value.

-- 
Best Regards,
Wangao


