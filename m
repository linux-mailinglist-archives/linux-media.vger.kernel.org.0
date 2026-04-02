Return-Path: <linux-media+bounces-57912-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEXICeL/zWntkAYAu9opvQ
	(envelope-from <linux-media+bounces-57912-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 07:34:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 818ED384045
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 07:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E040E30459E8
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 05:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB1B36F40D;
	Thu,  2 Apr 2026 05:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCKXPRLA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xuw+2zpL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025A1E47CC
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 05:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108045; cv=none; b=PiTcJAdmQQHLsHDNyK+6SL0TmJLZ1QJ620ZtScEDq6iSeRVYoTodbcXeVm59K3YE+K758QNttATGFJGKy30hTmIQEcHYjh5j+/8zILVc8m5+7VBUk9kXgD3VKORQniWKfzALkOBV12EBFu709s4Hft5x5fFw/irgTCQPbMheNjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108045; c=relaxed/simple;
	bh=tiXUAnme7SzQSVdThg47R2AtVPzUaSAa99xfS/+ignk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnWdSuR4lDOzK34HDduwRya3VlmECtMBHzrdYJlqBOwhlQ6ogFXX6qV20nWLmxpj4XF6VGXT+gKQbgp/T29eQifUlw1hiHzt1Vm9r3OPE4PhskbJmOTfvxm3MUkcecGmYkED/h8ThzAfwDn9tK0hMHKq2HM0csWYZfG5SCgsiRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCKXPRLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xuw+2zpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M44FG2798853
	for <linux-media@vger.kernel.org>; Thu, 2 Apr 2026 05:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjwFcCle5zNF1DA8+Y0njt41Mv2vZK+6iNExHF2eRvI=; b=dCKXPRLApemiQsrc
	CrbrqzT1uTndlJxqlPmRCmX9EcfkTcsPw/ntJ4YEm/BLTt5obqSoOPEJCa158DpC
	trUe46g9XxgJlEnt2bWTl4ASYzcgFtav6T+4spyCCli/qv+uFLHVrjrQ/okC4qRv
	wn1flwjbGmF6QEvFO/khWAKyVbd5NeBCVNaW0KEzajRGdEWkTDWvXuEXCSouQ1wQ
	TSFbXD1CDxhxnInmirfgv/OlMYxokD5ZyKV79c7ZAuZOxoiSxK+EV8yp5zL3SKNW
	+SsqQe0+7V0yUdqIeGwbr6PUzEQtMXodJJEEja2b8y1u2IZFflFfM6jYy4tNvHVn
	l9OMSg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk2dky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 05:34:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c0cbe0f64so1193727a91.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 22:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775108042; x=1775712842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjwFcCle5zNF1DA8+Y0njt41Mv2vZK+6iNExHF2eRvI=;
        b=Xuw+2zpLcJ6ov5QQhDXnOyaB10UoDlhPbHzKdkt/xO9RuvJEENHNNTDtA1ib2Ll7AY
         kbIU+XKgdQs73Vfx4Wa2Suop4KOshEnH78u9PNA2GiNc/aPXA4DSeqspClyNtVZ2hSKR
         PPw6zRPPn0BpZPa6zMfAQF7i8rimSzL6Wy1cGnd3VE1oJwGPfenCXcY3WLqimzS3pwPO
         8b6G6ctsAuRy+aPGsV6kRaOwxxFi555DhCs7iWUAq9s/qGnEFTyLN+LguaL78FVpFBCz
         mgsmLB/+MFKCay2qTmfIYJG5sMFZ6p1POgEA4Fw/hP8bo32LS7ZdLstfGf5LP8440lAB
         Wezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108042; x=1775712842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjwFcCle5zNF1DA8+Y0njt41Mv2vZK+6iNExHF2eRvI=;
        b=hlG0VTrN6xjcVUdUyEnWBxPbzBC773fC6R4+/RrhlTdVIP4Yh799UWMPi8OBSS/2xK
         ROEAwAjJy3gEUY+GbsGFGRWBUfh1Ehru5V3mdbki2VpmkaM7AzXW/We1pMtiMCwSgtG2
         oIo7K1bGK4BDYAy4UjmU5BL16Zh4BUVJQuLJyW0o2jIlfBAxNVvqsdE7N7rjodvbmfHI
         4QrOI704l22Lks62FYI8McWxqScNcD5DOtjKr5/KVHk7EHGLmncvC4w4ReojYrhqaD8+
         YaFxouiIGulkF6jY7yBDsFK9NB65tekvx61yjetgTsGDDh9L+Oa4EEwgil2+sgBEriB3
         0T9g==
X-Forwarded-Encrypted: i=1; AJvYcCWPmHRrxibEF7tGyV4ys2PDnLPtgMKWVrLPNwpM4IlOXxXJ3T3gsaTZpNYYhotrlYo4/J6WT4dECvMS+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCsPZtuEcICzXh27hjSaRyTb2uQUn/nui9kic0cBNPeUJLP0fy
	SfFEjKGNzBUxCVWGbuDr26ReWUt/ouVbXOROLDQ+p5zgLS6ApmL4rjT01/fGJ1W4MCADgTvQs2b
	71+2LNedSkg7W51JmVoAy+SJxgVrZGzY/YUqsTzx6TnkaR5wtpwuGx169sMCivQ7uig==
X-Gm-Gg: AeBDieuEEGJevLjoJsp6KRGQfK5d3f74vPW3PzOe2SI3Sk4II4H73Aws6+WezlM7FCE
	m1wrkZMJ/BraSY7Sb9MitoSkPzm09KM9lvToUiV/MXobITI4pqJe3dqzZGXU8tp+ZbvtWmMmlpd
	jAYdd88tsqi2FJEz5CgryzgLYWsxHX5KQ2Zfsoqtmhlldl/YQ47TqdzDDyjDuIQ5oWLLBGdkJGX
	uNX9vY0sENtt60dwKW1ItDYQ4gXD9sxXSL2EboXzORP7SUxEtGFflxC3QZbk+Bm5CeJqbMp9cW1
	OAnKy9mbrEX+sTIz40NLTXreo/VtS9iCmanAxqIoiAQVUzagDZP6k1r9ah83mrFllK+OYC4KRs4
	wiyrtE2isxz6/dQYqv+dQHoz5uB7CGWma0gvskxGqiSGBCqPDiw==
X-Received: by 2002:a17:90b:1344:b0:35d:9d4f:f595 with SMTP id 98e67ed59e1d1-35dc6f5fde7mr6087089a91.17.1775108042470;
        Wed, 01 Apr 2026 22:34:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1344:b0:35d:9d4f:f595 with SMTP id 98e67ed59e1d1-35dc6f5fde7mr6087050a91.17.1775108041987;
        Wed, 01 Apr 2026 22:34:01 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm6744589a91.8.2026.04.01.22.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 22:34:01 -0700 (PDT)
Message-ID: <7866c1b6-7bd0-4202-93d1-955d60218b43@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:03:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
 <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
 <9ff1645f-b2c9-4c1a-ae2d-96af416b08d9@oss.qualcomm.com>
 <382725b5-1e72-44b2-b9ae-38aea1f7a976@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <382725b5-1e72-44b2-b9ae-38aea1f7a976@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA0NiBTYWx0ZWRfX+NvMcHTg4eak
 hqCGb//h701bPcSt0RCt+KJh0XcoqTw+SrccsJ8DAUxCVYq/7756P5zd2h0THDlAXCBebuoTVKZ
 l+iU2+Iz/u0g9247gg+t4ISC0hi2HZCEq9hU3Y+6gi+NXg8v2oMYijlwwWO6DsZj5Eg98KndkAI
 +dMeyfC0CfSV392xxa+fD4zgOGBQ0Tlz2daMqaDfQHWFTTrO61MD2oT0txcKAfSvek2vPX0m4Ti
 /EZYfvvGXJPCdB0Ei/pz22rjzyRsanUW9WNSJ1zZw9INPazVh4yeJq7hYcfBcR4dcgiFys3HhdS
 vJZmp1iZ0FHjvPnRCbgvyFJw+5xvf49GBtC23jiGlkpgSlTeCQqxqa1pcxJ7Q4u1+s+1KeaG8em
 P3vAzylGijJ7/Mw6r1LU8pHhjSBHygO0FAJsAfWub4FUc4JFLrLtKmyLavfD4dAub9XjZdMwY8A
 zfphb9ZObtKmh0LMzyg==
X-Proofpoint-GUID: jnNB-mfDQr8zEbhKB-RQiftBZdIwHMbR
X-Proofpoint-ORIG-GUID: jnNB-mfDQr8zEbhKB-RQiftBZdIwHMbR
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69cdffcb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=E-vbLytUzHry21UsOq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020046
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57912-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,kernel.org,baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 818ED384045
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/3/2026 3:35 PM, Konrad Dybcio wrote:
>> Konrad, MxA is always ON, and with the current clock configuration, a
>> performance vote isn’t required because the clock controller currently
>> votes only for the minimum level.
> Yes, it's on, however I'm asking whether it needs to be at any specific
> higher OPP as the clocks are scaled to higher rates.
> 
> In particular, PLL2 and the MCLK RCGs/branches have *some* references
> to MXA, yet their FMAX is possible @ LOWSVS_D1, so it may be that we
> *effectively* don't need any.

Sorry for the late response, Konrad. The PLL2 operates at a fixed
frequency. The maximum frequency derived from the MCLK RCGs/branches is
68.57 MHz, which can be achieved at LOWSVS_D1.

Therefore, MxA at LOWSVS_D1 should be sufficient for the MCLKs to
operate, and no explicit voting is required.

-- 
Thanks,
Taniya Das


