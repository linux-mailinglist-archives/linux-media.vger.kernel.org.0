Return-Path: <linux-media+bounces-64382-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4UAINJAfKWoxRAMAu9opvQ
	(envelope-from <linux-media+bounces-64382-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:25:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 276D2667217
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:25:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CoVh1E+y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CgvSNM45;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64382-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64382-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3449329C699
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D183A5E70;
	Wed, 10 Jun 2026 08:19:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B26288530
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:19:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079544; cv=none; b=qm6rjx8cgPjXrm7Xne8O8BOF5KRHAew1qAXmhRVHUQUQn1qP0hHRb7hhRvm+A88wQFthIS3jPtHbBYLEUz0dlm3oFJxtLvxcbf6SJB5bsqpe6xDfeARJQSbwc1K390mZDRoo8ZR9gGrLDsEdQ6097etsU6k1I9taqBWB6FHo5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079544; c=relaxed/simple;
	bh=jcgQSk0c1BkwN8IYKPV80uEI4CWqTwQjByoyKnPKPhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7fNRjuEFRXRHdFd7n1xd9tyYiv4x4lo3MhB16va1YXvWjP6xx2jK398evjtEByn6+rnkyLPR0J7Tqr1u8Z3TOOOVAcSXct8EanGUVYPdSxpUAQJ0k+EMqGBODJ+5zy5ogETrqNx5xkp5ii16JAEOsD5o4Rc5yA6wiT/Q0ktt7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoVh1E+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgvSNM45; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hhMn531379
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1N8UA7WOGRwcku7bf60izdArVt4JWeIT8+sy0FsUlAE=; b=CoVh1E+yVLCZS8B0
	AIMWFld+J0lPVhHHBFdT3L6jBHiwoe8QpKNz2wY53wD13NTu0S/H3JQr81WL04Kc
	4+/vJFhyet3VhSDmLoNZ5IDU6puP3WVDOq1t4+DHrSiuKasX1TJf/Lab8SF6NZnQ
	/x/+lOPmGfnfk6/jdcy6+AiPxaQiSD26nEDeXiyXUW7sMTdihU4uG0c5teTnuhTC
	HWWYhsuDwUn5o0UgSXH33XJLW8FNBtRE+mF5zmp+n7D/TZXDmDTlbKEA1vDxFX6I
	CJcNFd5ldWPc3i7xOCZ0BiS4iWKiP9lj7EmGb0KbDuhypSKN0HUpOJsWwxkzFHCi
	Flfc0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1rudj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:19:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517e054fe07so12428071cf.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 01:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079541; x=1781684341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1N8UA7WOGRwcku7bf60izdArVt4JWeIT8+sy0FsUlAE=;
        b=CgvSNM456H0wmNeaVFf4CO5D9WL4pHYD5SuU2Lz33SHJnQdpkhVKOfESCQf1MdoOct
         ANakM9xmypBw/qYLyir+YfqvKx7NcJLnDFhJ0fHPpLlWlwJa4iD9F8D8mcR6p1Wbpohw
         fIDk4iswMx9i7BqWJWbIupe88DQ1pSOMdjK9JVuorBEu5HNuNER6CYCL3d8gz3/knKzI
         OW+aZhhVRKJL2ICJktszb7S3nEsZZzmwjdkca5Otd3OCE9a+TBoVvYGoyl1rlmDbUqUs
         AGWuabMmryEcMY3I/w0RxxLhHuDzaMk31U0f58+Zx69NpiE/50DXL7Q1tLzLJJrrgx42
         L2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079541; x=1781684341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1N8UA7WOGRwcku7bf60izdArVt4JWeIT8+sy0FsUlAE=;
        b=eqTZ6tIIUJqDTD9enyBTwVzLC9iPXNIzeOCmFBjJ21DkdEpv2yEmceCr/lQofE7c0n
         fuYa3gdMTejco70TApZdxiCKroORriuRcWYjSb80HfmZgbzvfIWjuumG37umwD3RS4PK
         rX0czDlm0qXNlLZONoOBD1JN+TYERZkOYEYlyilQaZ3KNg5LXAsdSalLMTDBGWQsK1pY
         8q3PuxmU1rn1wLTb/9bdueueMSICU3/A8ZNDLgCmFy5m3tAazqoVxOLQNjuZAD8iLhGx
         /VDuIrnMexirxTQUvQQ5sRj/dsO3lPkiprpNnyAi4uMpfa4K7D3jIHM0UFGsYIyORFYu
         hy8w==
X-Forwarded-Encrypted: i=1; AFNElJ8OL+dweDemdqx8KDypzwEor3bR5nixv6PN4hkdJgD1PZ6wcINtEIvL2WeodB6+m6FvnDw8bPPhA59P7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLtbRom/R2x5udBljBWnb051tOvda1b57bYIoRiWDbV2VxEXmX
	G1iEjHBmydP9h8HC5+XMNAUChdvvVYXyDiqkussv7xVeE132+prxxvM9H8uA0bNH+es+VO4VZ01
	95/Oibdgn71aQQr8MD551muIcDN0K0u/Bu87VNa0cpf18KErYvR5RKoarnSnJlBnTIQ==
X-Gm-Gg: Acq92OFpEyQfEnfQCs7oS9EPomwLU6Daaoe3kEMeoVmpJ/84NIfbaGduliRz0lYKDI6
	fSvh6p0ofUff5CtHxeKK8MVzNnu8Jve22rLtpTQOgCn1EVGHLkZLXNdVJCagunBw9d6aaPYqehZ
	6INeKQVI+zCzYvHRxpbAhXm5ukJ+n/shLL8vo1SX+JxQp2VntlCh0qdNiJXspgEAH5yP0+4kdtI
	F3RHTdTj6nIK0u5uBTEe4UGKeh2bFLe0OUp5Sk2wkHVAFTXM8MZOM0v3TnjQp9BQb6vT6dKnF+k
	5NSIh08YYf+rUAb78dX3NfkFEcIW4L82kXC2xVC526KCcvVeKyo08V9naacUVoOPQGFy4DdYyei
	Y0+IP5Xw7n4jLlSxk3ORclWyGwgS2gXFP/UqlyYZtzIEcPjgopQ5p+likqnkBgNHooB/GWuuowF
	jHdOWXFq6hQIIDNNe88zY=
X-Received: by 2002:a05:622a:2484:b0:516:e1d4:553f with SMTP id d75a77b69052e-51795c4fcf7mr369785361cf.36.1781079541318;
        Wed, 10 Jun 2026 01:19:01 -0700 (PDT)
X-Received: by 2002:a05:622a:2484:b0:516:e1d4:553f with SMTP id d75a77b69052e-51795c4fcf7mr369785131cf.36.1781079540949;
        Wed, 10 Jun 2026 01:19:00 -0700 (PDT)
Received: from [10.111.165.13] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd051facsm223943196d6.32.2026.06.10.01.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:19:00 -0700 (PDT)
Message-ID: <296e084c-184e-411d-9456-375933a9c16a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:18:49 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
        Cory Keitz <ckeitz@amazon.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
 <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NyBTYWx0ZWRfX+5AYR/iD4ml4
 999XoKv6Y5GjQexG6IGHt9jRe6LoTLeKizt33oUxP8Vgg7/K9Uj3EtvpjTq9EaHVqRUGmJnQ0e4
 GyM+6QoAp1aAmC2MYXp7xLdcTE/igI1bVYRieSGWiKZIPGS6M5zaVAlDmwlaQDTf2ssmadYYu5z
 tkH6uqJzlVfjeQGx/8UaoAA7jyERJ9SEQ9Fp9TAw+wChSVoS40lW+pcW4HM/NfcVov1X5aL1H/v
 +HKHHh8gI1QYd1ict5U5ZmDApfuRbDuJBoq3cG/PkhOI+sRJUBsPW2X4UuJgw2zsCv1VZMqIwBQ
 PQgkxRwKlTxAhjsA72KxDQULmx/+Lc7a7hmTqnMbnvGkIY05XQORQbm9gADKc2en3ylGo6Der1o
 66yOjTg+mdiETFQjDyKO2kqGkjE1herZzL2z6rCR8RMyddSF0s3g6PSxxptVzZP26icIPYClLLD
 FBcFrQdqRAKb2Goh6iQ==
X-Proofpoint-GUID: 0SdGMMGEN2o_vuzJA1bS6VCf9WacdV2Y
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a291df6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=vggBfdFIAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=3LiCsYdCH7c6jQhj-zEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0SdGMMGEN2o_vuzJA1bS6VCf9WacdV2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64382-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 276D2667217



On 6/5/2026 9:14 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> So far, only D-PHY mode was supported, which uses even bits when enabling
> or masking lanes. For C-PHY configuration, the hardware instead requires
> using the odd bits.
> 
> Since there can be unrecognized configuration allow returning failure.
> 
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

There are two Reviewed-by tags from Bryan here.

Thanks,
Wenmeng



