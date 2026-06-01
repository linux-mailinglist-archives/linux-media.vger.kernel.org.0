Return-Path: <linux-media+bounces-63210-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG6GJawqHWo4WAkAu9opvQ
	(envelope-from <linux-media+bounces-63210-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:46:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACE061A54C
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAE073027359
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 06:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666B1377EB8;
	Mon,  1 Jun 2026 06:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TU+FSvQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGldIADa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973A836AB54
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 06:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296295; cv=none; b=doJOL8IQQ/RKFDGknQfgEVbxnkGA9I0gOREk0ZqLe1ZSq3cxqvUFIVba7H52DMFBV096AKSt29C2BEnHC1FpmqsJDS15V6wct1EYEvMFtyusWBjPiWc3F2COEljogQATvLdCQg4tC4KZBN06H7PB03ni05Hfw2Oo+RmY1x1RgmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296295; c=relaxed/simple;
	bh=y0ohOQUQsQjKkW0i8jiRyaPm1625hq/EctBCh4wmkjY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=igzJOM8lJTbqJhncKzb8I5ic9zwapOO/IFGhCBy6tXRmrnG3qbAjWhHTBOO0AUnj2ptn5wQwTykyGBKb19N/S2yHXVp+/k+eXcDOvmilxCtPAiaYRVWgbefuqgY8U/25sz2fcvimxmzSRCzYo5WAJno6ppJaCLdF+KHPt3/hQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TU+FSvQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGldIADa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6516cAYI2434925
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 06:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=; b=TU+FSvQT2edVb55V
	Nry2/mRwkVZb3mVd0wwM8wR76ihIHoEdAZZZN7x2kdQ+f3VcBMXjPd8oYnfluC0a
	1k75n5F1ZRr7SOwbZHq6JmarRR7aklFuF2kSLc/IheXzjgYP88mGh3cNgu8kpTWh
	5Y2vrsnXYghJOpKYstVqahN++SwR6/8WsESZaELCZKdGL0oqp9+rNdfBnIKGzmDt
	ObopznuiINieCCxjglsyKI56RT3hRYPqapeYDL2QKwuOj/6Y2ChquD2/QKeRWOPz
	FsZKQer/yYRTOULRB5xkWUT2dU22XXio/Y2y4ekSrqqzD0a6PBB3Hxzgjg92weoX
	yiVOjQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7p8k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 06:44:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2355935a12.2
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 23:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780296292; x=1780901092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=;
        b=TGldIADa+ckhM+Ta7BIKVHJBunq0m1GK8WKOh2elvXQMZj3PatDVkS96Y25+0BffOo
         zLLAy2MPajAdHLo2BW34o7/vjyjfQIaGKG2ICFIUD0McvCra0feptcqc90cNqXzSO6mp
         nFGptfg4pNruXJs6msMWASfDH3PkauRNJ/G9OnNkT31QLB0qkE1fxzNhKXCpss2IFhq6
         6VQQDfPw1L8UCUB8lP6FKWvZ7TzjXtHOr+ZA1MFg2LpDrxb+2X4cywhFA2rako06IZBM
         faJfEPhg8TsmhvkVyGkYloFFNZ0vM/vSgczJsc0BA4xp/Nk34w2A9ETxEaMbnckTcbWI
         dotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296292; x=1780901092;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=;
        b=dOg0vGDgkLIzSUiQHRQeIvaiPF74ZjAlSeroO8ZjLJf0fP9dSCqokQv3Qkjy75yr7S
         RoQqYNBEGndnq/axPJvpw3jGfBzm+VI5Gcr6jplzJbaG6nfbq3LEBZXmE7UR5quQKY5Z
         RY/Wki6hI0paxtSxKNTJ9g5lqQyKwsRxbnN9VqIWSVXpJPaBJo3U+1tqXcZfsGebhITu
         5PirtN2shqm8NC65FE3lDCiBQmc8g0rkTVKG7NA+5AQlg070I5eaQIgWtsTeiLQ29Sqw
         uMy16FMtUAEi2th/CycHJy6safwtDKp0owET+L72FtDwut7m966CY/ubXxd8AXN0LQ73
         3ERA==
X-Forwarded-Encrypted: i=1; AFNElJ/aq6Ny7ExPHeBO5ktMToqtN/GSfqUqfYvaAepeP63oRsC9FkhH+qTHihVKUEWkGRJy8WTI9JEt8+EZrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZrqICStk+KqJWiZdTL7QkYt0fqd5OTlzXiT+5E5csucAzugX8
	HH3QPzEF2Lx5JQupabpGIOQ/ak6DHjCkOlE0gkjvzjzn14iSMU9uA+j/uH3K/w0vEi4utnqvaWr
	wo+5Yz72CqCDImrkHHE4cFYsgSXYJyiwjWyrE7dm4tOQkDllnUfJaiKo8PTT/LmgMxQ==
X-Gm-Gg: Acq92OH8N/prpZHbHZ0aOkCEho1t9APoQNW0PtBozOsMVs9af8tuM9I5ZW5yZOR/8ww
	XCzecQXO54MFCySHuOToLWB6WG92uPGByuX1EWAVsHXbsEHm72QVKZYsBr1/iw8LCx+n/XBlycH
	hS16j8jfAnHVTSS3kZCU8+tOq0sHtcdc041NYKLnKyAbtPXsyOeQADDv4aLhSVSGtvtk6EMorv2
	2o3eFVpyaeQDqUUzvTqUh+L9qiB0BwDnBUED+EYqGyX65KT7mppAfUVbSy2N/4GZE8aUgUJNqNf
	TQfTFU9Z5bXOelTznQEFwo+lmEl/xr5fTfrMXOIjqzr/fzO6jhNOcer3/uiQ+0zvFbsvAUAsKbr
	JTJ2HAGrokOqulRQ3ckHLdBytV6sXBfZFMK9Bn54qP8JyW2d3KLj6B7kD8AUiww==
X-Received: by 2002:a05:6a20:1c8f:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3b427eb0f6cmr9977791637.17.1780296292502;
        Sun, 31 May 2026 23:44:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:1c8f:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3b427eb0f6cmr9977746637.17.1780296291949;
        Sun, 31 May 2026 23:44:51 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423ea48bccsm4142372b3a.13.2026.05.31.23.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:44:51 -0700 (PDT)
Message-ID: <145b763d-49f1-4412-95de-76c22a81a728@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 12:14:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
 <20260530-lorikeet-of-strongest-honeydew-fd9b16@quoll>
Content-Language: en-US
In-Reply-To: <20260530-lorikeet-of-strongest-honeydew-fd9b16@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AgpJtSGlaD7vLXXBQHzZvw8aSMGs9s8u
X-Proofpoint-ORIG-GUID: AgpJtSGlaD7vLXXBQHzZvw8aSMGs9s8u
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1d2a65 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6icYdhiYefjo0O0wKhgA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NSBTYWx0ZWRfXyvaYmmMOX5eh
 553HUCBbRD7szM437JUb+Guh6SIotXK1IAdcQtse1XTo+bZ0UIJfScxwMM3UE1kSvoe/AmV3FOf
 tslGU/UAbo38sNNkj0mNTg2KpgDWRCKafIvgY/hY9b+LR7pY4RdiD+Ud8MXzzDPEdRPaNWh58AK
 yw3J/cGTi95LOs0eLCLowsmef9bBwi/Kb6zeBWw6b2gazvcNnjRTPXDYSv6imgzPWKYc/1+X2Bj
 zrzcgQ0/cMMp4uK1HKQttE0R69sM8XRJwbrxUlNpj6CPLhR0itgBlc+ky1J/8D83uo45cDu4LDA
 03nZfRpFXOUbdO4dvplI2d3i761GpTLYLhA5NOc/4V+7ptf4j9BRAHPB1od6ehYnwBlZZn6KVvj
 Y5eqEw9TU/k/BZrwvQh+8EKliO2gYsde4dTClRajG2HNuTj53GLcf6w6aqQNVkbaH0zTDX7mshm
 Lp+FBLt+CR2SjnfgjTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010065
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-63210-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0ACE061A54C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 30-05-2026 17:04, Krzysztof Kozlowski wrote:
>>    iommus:
>> +    minItems: 1
> No. Same feedback as before - you need to describe now the items if you
> claim that there is distinction. I already pointed this out to Qualcomm
> at least two or three times.

Thanks for the review. will fix it in v2 by adding per-item
descriptions under iommus.

Regards,
Nihal

