Return-Path: <linux-media+bounces-64774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BsR+IOV/LWrygwQAu9opvQ
	(envelope-from <linux-media+bounces-64774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 18:05:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A95867F070
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 18:05:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W6od5oQw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eQpoqaQT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64774-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64774-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5406730041E8
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 16:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CA939DBD4;
	Sat, 13 Jun 2026 16:05:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEFE2DF15C
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 16:05:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781366750; cv=none; b=nR5B7cRKeGyIRb+wRC+SIIQEdsE7R7b5I3LD2S7zUuw5wBU3D+shPAvMKcvbTBRKxLMaGeDjfpuadTf9M6S6Ff/1y3a0FHUio6SNgMPka/c2G7rKxrAkUW1jX5VcT+tzdllbOsPw8Sq4wZ6n7IzlyYkrwvxy3U0LrAbnSO+prbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781366750; c=relaxed/simple;
	bh=72D22HdfA2Mfr0S3539bTipfEwN1sdj39kEryra1F4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkIEeC2rUnLd0w14LoEKTGiH1vxif1CWMd0bqwFEad+G372eTHtedWKqSQSVQnlLx4m5F25c9RUeJkASZiAqw8F9WHwGkxmy7QKTGAbLPlIMde1/f9roYZygQE8xWtZABLMELie7fAxL8Qtg9SblJJsINkLHGNwm1JxqM0iJtFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6od5oQw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQpoqaQT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DF8nC82758296
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 16:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVzOrnJKRjzMeifTNqRhK3qhiUza8HAzmOtwxvlJb78=; b=W6od5oQwMU02OF/v
	I8QL+apXnkNTikLqgvVsEo4kNLL+Sh4NSbGuixPUhVvlXQjwjiWeZrDOmdSB1wey
	4oTJ+CF2p3NxzuAonOeENsIQIyLUF1sU/Q/lYHf1E9kkBSv+jJIdHLoNHE8+6oZ7
	yimJZgtZjxbyWgyPc2BN6GEcc+FpuoNXAF8BO5t+UoYeM7b3deJJwBQzdki78JDK
	sBbSCmZpWMxoWhGe2tDxhIpacE9MsIk+ZDgg/rouVQn8pcKGw+tv2MwlflUJfHAQ
	c9x1Nz7eAmBpN7RsQBP5lfExthpx/IdZxtE+R/rZfU63GeepSWL/wrX/n5CPgMJX
	TwrtOQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9f9h9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 16:05:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cc5ae9b959so1857359137.3
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 09:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781366748; x=1781971548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVzOrnJKRjzMeifTNqRhK3qhiUza8HAzmOtwxvlJb78=;
        b=eQpoqaQTnjOHp5m+aPa+DGgZqtaEB1CD/eyzUP/lZV+kI81FdhaT0+Yy8q+VlJghbV
         n2D9WG4yCPLTZXHPw5D9fZMVOK+Xv1OW4GIhJqObsjvgkU9+BlOGAlTqGpQkGDeoZsVz
         Syo52wWiKPu/zUA+0aIlzGPFtR3fQ6Z3dDFMizIfF5Nuuy/ujWbSWFbXyBQzee7qddLc
         ijT2A0oGKxoU/9VCZpM5IlxPRgXUyRU/FnH6+2/RU6KW5O2F6nFf/RwB77MnZgWbp3jl
         bP7TtSmMWtNF5TX902d5M9VhPb296vsHdL056apv1+NyvKzICE5NYcTxQSJ5IruG/rOi
         +Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781366748; x=1781971548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVzOrnJKRjzMeifTNqRhK3qhiUza8HAzmOtwxvlJb78=;
        b=M+9yv/6OZzEtKC/uGbV9/zv0qyrRmFN0lxfiZpwQ9xt1DJAsk/TZcH7L6JbayHeo/M
         jYix3PY9k9p0O+F/Lmu4lsWEKdg+09B61H86p1Y3Aad+puQBasqa7KjB66hJTh2c1DNZ
         p87faPwqWBvRw9EwusVd39ICIdIFuppOPIBVSUiYutZsCEU6Ubgz++X8Qrbe04JK6IKL
         f4M9Tg3Tw5Iv+mgqmOYOCxdWEcuKTXRZAJ4KbX4958DVTzGjAcJEVkSmNqOdrxJMM+8H
         h5z3cYF5kAKGm3jx1A4qM7RCzFdosVLeIaXlUVXfdx5XCgs5+tznfZT0tW6pkoGUXcsP
         I2Og==
X-Forwarded-Encrypted: i=1; AFNElJ8qKW4RBFmJ6s48Z4nSJBhLrqSpCno9KO6aG4BEj/qs1tpBq7Wrq2MYUZ3ZBhB+QNt9fQOvtk2N36xEtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwTMFLUC+mJz60OlKkO+5nQlfPdb9sI5rfW+5jRjRKIOh3/RQ
	itQGjfjzhX+aTlQjf/qAyJdLz1lzWxiOCwJonqdwS9zpE0/tjM4T4wTo8kNqtGGh59eJSVXa4Ir
	8lFC9D4RePtuwAtrw6MwAAmv0MgApnE3DURAr0tvT5nrC5LLyr6MAIqRlWq4z6rLGfA==
X-Gm-Gg: Acq92OEaPMZC8jGgBC+KSDcJzlpWxgXQ78b4LQGVoi25pG6IURICwBysoeGIAL+Xrev
	/eoNeX45XkvFHWYvGi4ffloENF4rFqjcSyBhi/tyxzRYsi+RLr+5y8SveKo9xQPxzrQaYbu1vrS
	zSV0PQmEdH46Ggv+RdZN2n9Qy5ZTQcEWVYNL1uTW32BU6vc/suzJnv1nwzbPaiv0Y955AJi2w/N
	lTSjcUXW0ZsWhhvKgX+LDwU+7pVuEh9yUZZxxkdGvwqBcc7HvbBXSdgz6o/FrafsXeEczpny/0Q
	KGdUskDI15yDobb+wbgABHauCkoAsYkS892A/EvcR4uNo/BtcyubH7LPUAo9en3H11BgITy8nxg
	yKsV7cvFUYS+yjYWoSfgpafDvXy+CsjaXlCiBll+gDAVxvsNTLfqTYA==
X-Received: by 2002:a05:6102:26c2:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-71f6020ef9amr2450167137.17.1781366747889;
        Sat, 13 Jun 2026 09:05:47 -0700 (PDT)
X-Received: by 2002:a05:6102:26c2:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-71f6020ef9amr2450118137.17.1781366747482;
        Sat, 13 Jun 2026 09:05:47 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d9b7sm225827766b.41.2026.06.13.09.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 09:05:45 -0700 (PDT)
Message-ID: <2a0fc1ce-2f19-4268-8117-cd90b512312a@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 19:05:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
To: Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <eY8-IbmZdQzKJEghATTeVJerci7KPVBImWk85jbXw_LZ14uTj2j55zx7DEhdyu6218wQrolFoVbRWTaL3QQjNw==@protonmail.internalid>
 <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
 <2ad008a6-bf67-4854-906a-bd2ba395cfba@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <2ad008a6-bf67-4854-906a-bd2ba395cfba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE2NyBTYWx0ZWRfX0pKy3/nnxMLx
 SO0zm+apVIxFfN8i4mYw1P8OgiKOxD4a8aHZfwIq4kvQ2VnwZUK1/7sKpxrEvQdXVDdl2W3/UzV
 JuO1gLyzCNz/twfAT6Mi8AtiyiVHuL0XhCXqUQi8UZFLlJYQyeOLISxwb0P1AhlLcusJw63e7+1
 aMSJ7K0Kpxa/NA13aabXmcT+LR1L59rXK2cVqDopMGOIYlq3DDcz8mUrfNMCxgY94Fm2HM1RCMu
 1ml71xPGMqgpTNE1LcU6khR2s7SSu9Dxsf+YBT1E17FCdT76AryAinVwxLifYec4XHw5fXWH3vv
 Rp4qqa+ci9Jwgh7/Mf8/6x0El4JxjZRmy28JzqwuFqVK36kyOOaqFlxekknSzkyLr2lMQTerl4M
 Rn+6Vy0D6c0C4RelmjEzOJNiEc2GhMmp0p8ZqNuis2keOk5lYTUioqHNqGgfWhZ6C+DFJqJph9d
 1ip1L6eEu5kABBXdCGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE2NyBTYWx0ZWRfX5tZYHjhNhRkI
 H+as6UHJWIBu1kQwE0CSPTPXJamrCISDvSKzQg8Gz/hoOgtP9bdBDRU8+w4EG6VpNMiSr9JJFF8
 MxGgTKpV71ceLlPjCkYU71tKbf9a6V4=
X-Proofpoint-GUID: HoaiVhtczikgLk9WgGkChBJ3g09Aowrb
X-Proofpoint-ORIG-GUID: HoaiVhtczikgLk9WgGkChBJ3g09Aowrb
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2d7fdc cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=tmeW4gvYBjuJ3Vz3oecA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64774-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A95867F070

Checked.  The MMCX/MXC dependency is covered transitively — camcc
itself declares:

   power-domains = <&rpmhpd RPMHPD_MMCX>, <&rpmhpd RPMHPD_MXC>;

CAM_CC_TITAN_TOP_GDSC is a subdomain of camcc, so the RPMh votes are
enforced before any consumer is powered on.

This matches the pattern used by every other single-GDSC camera node
in the upstream tree (cci0/1/2 on sm8250, sm8550, sm8650) — none of
them list MMCX/MXC directly.  No change needed.

afilipov

On 6/13/2026 2:52 AM, Bryan O'Donoghue wrote:
> On 12/06/2026 20:44, Atanas Filipov wrote:
>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> 
> This almost certainly should contain MMCX and MXC too.
> 
> Please check.
> 
> ---
> bod


