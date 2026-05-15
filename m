Return-Path: <linux-media+bounces-61715-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEWAOrgPB2qbrAIAu9opvQ
	(envelope-from <linux-media+bounces-61715-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:21:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 929D654F5D9
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29C88302CA7A
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC84F47DF89;
	Fri, 15 May 2026 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9kSmNEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrSkcPny"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8CF46AF19
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847507; cv=none; b=rcRgrRgKvjwfTs7N8Vynz2gKNBTynJwyKbJaipryFTjVXgggQC9oN7LnoaQNmxdOEXmaIWJi4d3frd5piQbSrJr7uzbayNI+CAwLHJZA8TsiO/Pbu7ToKl5EInNFVdds5LyIL92qzB7CZRl8C2cG6d5YPxT27LeqxhbiwmxJcbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847507; c=relaxed/simple;
	bh=Y92+NnwPShhzJLFZjXBc2z1/q5TAn4x/wrrX1Jcu5MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DO/Lp7vCb2+PfFETI9p7UCaNqs0Bdd5LcOjIbfmcVcG9OIoqNnu9TsNTP9M/iQ/l7frSo7SGdxr5Zmlen5Ww1ldqmo1agW5IWE+sC0yH7LBgwrb/tfIyZjjjIRIDxCYdvrPAGvUIdwdje0ykiEYeLzRhnC+F/jOSvTC3rBjZrXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9kSmNEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrSkcPny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FARwQZ3219606
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 12:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=; b=d9kSmNEIqnh+MK2b
	YJSUbbcESvpM/dgfpOAgRFml+eYXTlYwIhudBwiT9zeJU93fAkrHa0qi2m8WKuhS
	e1zFWYXUSRt+87o5FgLxzBK0XvRuMqJzd2mwuX5iW2C4BIh02Ev3hOiL+kjbWcj9
	Bkun37qMYv4nPn72PvkZ7x/8ZJf0AA+au7s5BI8biFZYjX+6VLbMAcYsLBkKy4Pm
	qmjvwpsxHc4QG0f8H7/lkm7F21Evh4z6H233gkBOLmSBO+ViOUuvAa0252OtfNAW
	WiOvUOngnbdgOoP740Pol/oEXTCvQlu1ulh0DPTqhDHXNnhYxcPZVJ3wIcXYWGJH
	UYAWLg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s362x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 12:18:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-631284608a7so537735137.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 05:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847504; x=1779452304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=;
        b=XrSkcPnyQIAVH3K7lYrhjPpbstcXOawOF4Wz06yZMksiUACMKDIPXDZfcJponIQ0Y4
         BHyBzUEsQ0J+sa5hqwJDq4t4SEiVpJc1VbFbyQXDEEHy7nmOYwTukH4MC9jtN2K1HbiN
         1CBlcJn8xFnzNv+G5lKS899YrxoC0ZTIW1LRUFVoT1Rg9V/dASB3EQXUIfkLfd1L52MO
         VEXQP6wbduoKbRYQsF+pogmnQjDNNqQjACEgAh2I2da+pqX2j1egX7ZgPiryrYrTHCN+
         FB0ugOzacM24XGB7RyQtCY2I2LLMUFScRDgAsGlNZyy7w9S+3YViKIji4LGLFmlkgD+Y
         HBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847504; x=1779452304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=;
        b=VCFOnF5OrHd3g7AbFvbjNVlNPDnzyqx41WI1/FQnZPPCoFMHgrXsK58lnSfDS3YeVQ
         6uxh9/PyL6IZ1VUN28N63jv1D1eGFXj+f5RDtRvSjyRWQTkqs5/YB6OgV1Z2QVKcVpu5
         9XJxs00+FQ68wGK/5X4BPR0gmfaXce36eDiN19jQPTYu8xJTskJbxXEI9slY/I22clNE
         IVGu3SIHpcpq9SvgCsCvfgVGUM7vwkzXc3g3CmFunFu5ozXMpGTNlqcqZW5hhFVhQi9X
         r8y90FPfBmSIf3KpfXq5FWnYBkfxLFophdqkv5en3RGdOj4zoxEGRWB53mSwNfLJetsf
         wsuA==
X-Forwarded-Encrypted: i=1; AFNElJ/u3fjcybDyqk5g7ry0u92wE693LWKWTZsFIwCLSRIhHLP0djoE1hW7eCqegHj6pHYXG8yJZpzW4PDZ2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ1D/KIwz6+1JddEamiVTlhHYstmexJFzGtYh8Dq8ZkPo/6gns
	heKH8Zg5XcMQkxZqshSdxMH29BTsCyKHsMgeTmyXrJgy6XU/QqiAIu0SsHHPG/jbzsJ1ueFBjc2
	GG1AYdd0b2NuczqFhdMOfYWqJOmNUqN8l6uMxRbbitya867yKZNkfhsWaYFiDcscJQeHioWWQdA
	==
X-Gm-Gg: Acq92OEX7GOpLV9bk/cumQpiaijJ6oisqkcLRCVWKMlN1qxgaZDEmTOqzWJXoxmTYeA
	sF+KFdyKHNzD8o4B2/D7S6tVfsRHtuxi8o9tParIPjlhG5LniAffGtq1+oTzyCLFICjQMcy5iZ6
	2bCPXFPPNbDg6PliCbxXFH6fsCrgis1vjNXlYmg4FnFAYL48bPIvKx1KZBWH6IVZ/wwfAQaci6W
	mGXInPdMVDrsP9DBuBoDuURs+HZ7r3PtK5RNQXNY4vjp31drlpGEMp7+gtF2XrKHpY2iul5RQpg
	pKRhqNeucDLwP8npmUF/qX5ZXe1nebj035NqKmjdmqUoYNUZkeOVpE50LqqQ0/U7BHSkyYNuODw
	rHlQ5y6iDt2U3uzFmivMej2tiky7wvdvXJ2rMRzc37x/t8vOm50nJ+9155QfxyWDmrBCpBqEIXX
	jb4gE=
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr690377137.2.1778847504320;
        Fri, 15 May 2026 05:18:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr690344137.2.1778847503791;
        Fri, 15 May 2026 05:18:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ec6548sm219253466b.62.2026.05.15.05.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:18:22 -0700 (PDT)
Message-ID: <f7800c43-011d-4133-8717-9134f5ed2c15@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:18:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNCBTYWx0ZWRfX7D3FgFIuXAQK
 9AQR9b2ohgCn/8dwNZ/wxmbbcPYy9pX9SaDjNBm3iZE82qhXZalsDYqaLtADw7/gSwtIXTWMLSX
 pT3IVGhVtVnaYu8ZMHGHx2pKiyxMqeu8DHj8LMFXKcqh4v4mKMjRZmxHlsqPG+1B6CJjwwSgSRL
 SSwHdQESaiv85U56TjBaSeJPsW17O4ygURKlrHlCRlwuigoCMUaCKTLnXTObqzZXMV20XOLIs+h
 6HRQClvNPWW885WiN1lJS5o067OcNvWCC1tyGk2ivuPAMd92spD/qjyPT5C8dXJl5fG1gMrCF82
 j7z6KJeDeQGeiwNhMn9gIyCf8I0es57uK6PTq4dkCO/coPr4spRhsuAnBXVKMdl/KTsyrcGnY3H
 oHhqPTJi3JUEmJ813vSDausZEZW82FH/Bo2y618ouWoWaY1lmNcVipJCEV/cmwlbaBNDKTFtpmx
 7FPd/+aAjcOkSfBitug==
X-Proofpoint-GUID: axJu6_NzApytqaFEWZXIcaTlpaQN5APU
X-Proofpoint-ORIG-GUID: axJu6_NzApytqaFEWZXIcaTlpaQN5APU
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a070f11 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7yNcMj-pRB2AcvHbL8oA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150124
X-Rspamd-Queue-Id: 929D654F5D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-61715-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
> Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
> firmware in the DT for now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

