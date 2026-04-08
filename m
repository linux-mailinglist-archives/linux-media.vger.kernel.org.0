Return-Path: <linux-media+bounces-58212-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMWSGA0d1mluBAgAu9opvQ
	(envelope-from <linux-media+bounces-58212-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:17:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF983B9BB9
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18B48301B061
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 09:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843903AEF24;
	Wed,  8 Apr 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eABAAoUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffS3aUSE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49BC396B8B
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639807; cv=none; b=kzlen4Y6bQa5pHJwsByzaBE8L3lcVDdXiP8ret6JJcaGhf2sjkRtH1BVtwaXgJIWjgiD3FASXP0uUknUwS9A2VpUEyjTOuX2fT06x53Ybl9VuU+vOViLgYMSKQZmqrGJdD4mB33hvMU/cEg8rb44cpSR2gUTioCKd5almsM9fQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639807; c=relaxed/simple;
	bh=v9tPwsDptEipHOEuADTthgdBRAyA/k6FpoUYTH+e6zw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ilThNc3JIYqS+507Y2ZB0kAPAHf7RYV3E+DRKOzcfRZMYrI5UTXWYHOqxgZ34BBl7eEdAORRWfSdg71IYCTOF5Q7VZpAftNmMGdaebHDgl5yoRb0oOYcMCmsljPyUHACkQrePA0tKxGIWb7h5IYG56ddyJ/0LZmK2L+w3kY1KXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eABAAoUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffS3aUSE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385ekV71005869
	for <linux-media@vger.kernel.org>; Wed, 8 Apr 2026 09:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCq3s32lHUaj6k+qmJdVJ5PtOJ3QtlGnO71HELrPaUs=; b=eABAAoUxVYDV2zqc
	5PS3dTNUbdFgy23F9cDC2gUxKerdM+0RD+6zF3TaXxd+D2uwmfGkT4IlM584gdmo
	ypmxUkQKz0TH6R48AFMK6lNDq3EOA3NmIlkg8jHcTCzlcxw9Dlnadd56zDdpxqCP
	jdnqTBPQv8XuHXd7hDzR1DP4U74b4J0yLC7HTkatUCVZi3I3ufyNT9sOCVqCiWtQ
	z+SMTvkS1fetjUGOdvyk2I0LqyiKsqxK5liuxhzhGHHul4FGPtVEcgagiNsaYImD
	ukJ+AjiB4hyciI82LC3UU3pVrSdzxDY0ifWvhuKj8tYDYnSiwgnu6qt4aoxTV182
	x99DZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tpah7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:16:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0f4e632caso89557645ad.3
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639804; x=1776244604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCq3s32lHUaj6k+qmJdVJ5PtOJ3QtlGnO71HELrPaUs=;
        b=ffS3aUSE3/QpSCX+DXUwzNoXIWzmVkNNdOY9JkT6WKx9CrZRZTf/w4oZf64ZwXix9r
         x3z6FLiXzWrqscZW/z8m/uSY8ZOYRTPvortTdxCpw65ZHd/ZJoSOxLsOVIWg8mCshZg6
         E8Jeq87QZvbz1Zquo2L5v5zBGvCSTs4C0OuN+vMPFNTkR5H9Kv0U+Ls3oM/TMoKi0KpX
         aaviCAv97sI2VMi9AG46cFBF2KOcpQRRNjTI3tz+QnCqNvFeyOueEli0XTTcLBUKbx79
         K7dg4FdwcH5xKA6MJrz0Np5ji8MkRLeXbAU6LEh4ayEcPMY0A2vfXYRIl3aYNpwPydUk
         cBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639804; x=1776244604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCq3s32lHUaj6k+qmJdVJ5PtOJ3QtlGnO71HELrPaUs=;
        b=cTBcjWFT+5RjEnaObefrT8aA1YYCCkXkHRJs6m4rOWC70qXDHnDB0UxH24vpJTJcUN
         k3BASEKSHmjjmouKLwnLpT+T94SOhq+DadKbf6LV4hBek6rKGZMdHFGE6Zw+HiIOtG9u
         oFaH4Jjxo7+gGeIwPCcXekht3QboAt2be1fgNtydLKQp8rhwsolP5vGO96PQviWvSc30
         qChTOReT/rZ5yOLxgnKNsJKtBbRQQyqlG/HcrvAd1gNDF5PXvku/5oRUWi0DIWzJuSD9
         d4PbF8EsAL9tts0r4i3MPEtq1Az5Fqtuv0Y5VG2f71zELbHnkrLw5T1tdd6brnJzaZZg
         VHvA==
X-Forwarded-Encrypted: i=1; AJvYcCWcUQEaVVg2Uejt4hS3j/F4QrtiDz7LX/D2zEv9aZ9nOoIMunOW1ah+N0b+F4yN3yW3G3rjcCziTBUeJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8s6iOrW+/s9WjvC0BgO07bGVivMSuL53rtxkxBKKg4IBPIVW
	932R/Et6B1R3mm9llwmkTjFSNjBbac4jhM4j+z/hLBO2or0cQ6Q+QF6fXxW7x5/xpBKuqMTY9Jd
	v79alg7GxxCPbMN7AK7tZSSkyObUwfxYEKjJ5j7A0TT1R+4bEP7NTMc8I5+WIJyiFtpz+gVKSx1
	FX
X-Gm-Gg: AeBDieuFd1lFkk24E0U3TjgkoP8G5i/G0ObDfvWMl2CpLp8YVTj+RJ4OjJHSRrv2zHk
	17Q/Cm0x1+oimNifvUnvsNyC9YUdtcVIik3WLgBDHsnuq4XZmxzQioGkgquXjpvoZ9w8Yin4+Wv
	zFNO9zwt9BBwF+N+izsD4hTMZ42yNQjIyc4hROelZ0wWcybjf/gBtwl9Yr0dbMQQZlfvJFFufdL
	Ms2Cy/cuqwuoZxD+ruLCHtXH4DAC7fO0DQv+FL9TesHCpDQPtNJFfNFMEpAbY6zYMVl5tmhxSdS
	OroCCb6xIXxrk+Td0C9FqtfcemCJlMpiD0t6aGHiqPhg4o/wnMSopoWXSctqw+aTpNbUncNDI+o
	2TtIl/27/sCcd23XUpK9Bz0ta+CMVWMbPCmMsm0+RmUfJd6UKRaSYluHVtc1QX/3Sj4to1cJI47
	MNW3l5HdVojHjGXRNK
X-Received: by 2002:a05:6a20:4313:b0:39c:c07:144a with SMTP id adf61e73a8af0-39f2f19e2acmr20823862637.36.1775639803866;
        Wed, 08 Apr 2026 02:16:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:4313:b0:39c:c07:144a with SMTP id adf61e73a8af0-39f2f19e2acmr20823831637.36.1775639803378;
        Wed, 08 Apr 2026 02:16:43 -0700 (PDT)
Received: from [10.249.21.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm18248338a12.31.2026.04.08.02.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:16:42 -0700 (PDT)
Message-ID: <9bd4e289-9cf1-4502-baa5-d85cf6e07df1@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:16:37 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
 <20260402-lurking-tested-marmoset-f315b4@quoll>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260402-lurking-tested-marmoset-f315b4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gV228A2F5kPbrobEuA2GOlLE-FpLi-eW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NCBTYWx0ZWRfX3RxjrvMa4F2n
 X+IpahO+cVa3D7NSkroR8HaWR4UyvhITU5kQpNfVKrPjgpxUFWKzpQeeYJmGgdFzvLG+A1qs55l
 m9z/khWN9DNo9urBd9u8Xiu4NyvwvQlpbxKLqEqA0r2FwYzoI4ieZ2AU17RyN/M0Is62U0mjkVE
 wtp4zLPTACpdOzrxhL0JmWsm2pa3F3Yj6iGlKYm9juU/88tipelvr4WjsnXWReX2Hs5BHAAWngQ
 BZDgMRY/863jlQWL1/ZwhSWK+NN8jEfE5TzuLeF/v4+hjnyJWRCIRmSxMao8WM9slDOdlW9GswR
 7EL9qFIXhadXhe5L1dagihOk294iFnuRbLmrDZ+5nxfUUaiwkb5OvXQ3j2iyPkRHI8EcDv+qPK5
 cbEKs6dqoZlR1bXr2oRagUBgS2rxdtLD25LppBnAH6S0gm3oxMCbbH8SOq78+3pnch1+VJoyFVJ
 s8HlBZ7oYYaGMKbNnqQ==
X-Proofpoint-ORIG-GUID: gV228A2F5kPbrobEuA2GOlLE-FpLi-eW
X-Authority-Analysis: v=2.4 cv=DNS/JSNb c=1 sm=1 tr=0 ts=69d61cfc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=J0sBhcH8U7IMieNuPjwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-58212-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DF983B9BB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/4/2 15:08, Krzysztof Kozlowski wrote:
> 
> Why no IRIS_HW_AHB_CLK in power on sequence?
> 
> So if you rewrite the code that you have list of clocks for hw power on
> (IRIS_HW_CLK + IRIS_HW_AHB_CLK for all variants, +IRIS_BSE_HW_CLK on
> this variant) you could have just one function for all of them and
> devices will be fully compatible.
> 
> No?
> 
The original patch was to add the IRIS_BSE_HW_CLK operation into the 
common API, but Dmitry requested to separate Purwa's implementation out 
independently.

-- 
Best Regards,
Wangao


