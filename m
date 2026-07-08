Return-Path: <linux-media+bounces-66953-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bfKwBBsDTmqHBgIAu9opvQ
	(envelope-from <linux-media+bounces-66953-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 09:58:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C2722DE2
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 09:58:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="PU8/vcfK";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="AC/ZSxOo";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66953-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66953-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14B3A30087C5
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 07:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F6C3F9278;
	Wed,  8 Jul 2026 07:58:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796513ADBA3
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 07:57:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497480; cv=none; b=Zo+2U0Rc20+QqSWr+c5AE3pEZqOaajs6BXD55oH91jnT4FMA0zcodxOOyBlyzhi8g37LvnXkGLbLo+Km04JZtVcHzcF5taiCP7WPE1KvhG+UWzlMs7f4LC2gn/oWF7B66rCJo5losq2ZCYjvwuSzadYYL+DfNOgCEJPy3cvifH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497480; c=relaxed/simple;
	bh=ZRGHs0a+qfDgylSMx55EXpetTauglfrAaSbb8C+lrZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgywiYd1TBgSxrmqWh75wwNdBwbwn3y4Xyj/kRznCnG6iX8dkHWQH/F11YinoIK7v4VZHpdddVwd+zBK6YONmrQ5VJrKaHKTX+hTHnXDezxB1HaNe3SiB/UVToqIE0qPGh9P2kWCbr/mtmkU0xth/PxpCvyM0U0Zp6d19wcJS5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PU8/vcfK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AC/ZSxOo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842GOo1508989
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 07:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7/2rDe+YZrShkh7k9aN4OtrvlntieYHsD2DsjmlTmQ=; b=PU8/vcfKX1fo/ZQN
	aSsgqS1xBjpwT50Ehq9MywKxYew7GuuVud2x+EJFdcWbhVt5gIgUK1FveHNMcJfA
	NZcgkHBdijXOthlq1zcWte0N1foQBZuYSZ2I70m+soHuyONBf43MpFPK+FhJea+f
	T5KhO3cwB0gbyyRiQ4wuG9uMO79Sb5KlhP7S3PCTwu5k8hPMwfiJN50+P4etLpJP
	RRReNGbtq38FlL//rHV90H4bgUka3wg5IJJufNGOpSVFGjUphOCbz6uMLPYSuwS/
	xonu3Z2oz+la24pdA+ftfVujCRexTKGd7P+AqdWHETwsA6vDZttUOPRwKGV52SCI
	ynk1pA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be59k44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:57:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6a2f5995so63965785a.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 00:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783497466; x=1784102266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7/2rDe+YZrShkh7k9aN4OtrvlntieYHsD2DsjmlTmQ=;
        b=AC/ZSxOoOnRNn6MtIcItUbHyaNzblx8uU3MNIhZPhx/I/XXL6e/BG3L1kEVn6Nv4HB
         lUEqYm4W1KGIqgE8ykpOkAMqHlkaSZG7XWWdBj0OBJWEHkerNUDIhLbcAWl8M6TEpEUw
         itjLe/MDlm8EHnIjNib0DpObF2jpvsbdg65Yc6F+dbXT02MUG0+HDSoDhEofhZzw5uvg
         p/vEhKOFHk6rOXptYJMU7BtDZ76TVVExrQlTMRormDpCC+QpA78ZPJXfGLkqUsXq40H+
         pqn3IWP7PJsiTAPr9rmrH8DTiv/Bg4pl8JNE1vLNrtsZJHZjYFnrhLn9OSSts2XMiOxf
         JF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783497466; x=1784102266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7/2rDe+YZrShkh7k9aN4OtrvlntieYHsD2DsjmlTmQ=;
        b=FivlsbGzH9xO+dH+LWMH235WBR73gc607jfj0Q/1KCPOwwgzNh+o9idQ5f0HGHOW16
         3xPSFkzDE3NS62cmjTopcktIY1zjGHIYiagcgOoYMK1f9294TrUSVMz62WdyNuifX8YA
         VVs41/rTMeZlDFR28+JmL+MSkPaBsZRPSpChMTWkG4wSZG6RKiyQWtskz7jAs8eDsipg
         Iv78ceg2cBV6JR3sNzeY+StSje6NbIBMa49uv8Zk2pLxUnrtBwb3TT8uhaIfwShBNmri
         kRt2GSjx3b59q+PEDWJhCPgRtq/TbzJuKNl8b3b3CsS5PWHHSNO6zNAP47DMBodfw0BB
         53cg==
X-Forwarded-Encrypted: i=1; AHgh+Rrq3FkV0scMLDtdyP2+WPpXcgPD8gDvphvcneidNGN8PCyX21J5VSPeV49YSXk0aKQcKhQFsvEbg8uIXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB58odtcJeFWUuDZUN0Pl49kUpTinkNEQl1zncbeWRzK/39Rna
	Dkvdw2cckTdpyKe9pBKRgVHXMv4ConD1qV2sw9EulOmXpWIEUUkir5UhEf5ioUJGBOxhVcKOyl/
	GTXI7rVWd6Uyt3FZJB+bfyKLCTraklIYgOZAVP3sXuAfJOrO7JU0OisiPr1JXPVIHbg==
X-Gm-Gg: AfdE7ckbP/QBjxJ7ctl/A7zqw8Ul8pfGzN/zfGgRUf1HIlUajKPNrc/3yqPP/LIwnQS
	B1tfFi7CNf5trv8EHTw8aC44mxQ7xe4hE53/efyASXTAFElZFYPi+XI1IIlYEKcNF9qUpU5aWEK
	z0MRJm/V0wq5lIW/dIy7aqcs+wIoo1EPbhvAZxqQL448XaAH1GD9WRbET6T5DQ93jqkhigFtBC2
	PlGBpR9LDPd9dFgFiYTJINw+r8zeEy410+PwPQj1tzzFC3dD3qCpfck7D3K6ry807MqvfDzPJqS
	mcAyDsBFjveAMjgha3RnX8p+hgt2kvu4ZTeDOtF23Z/8ZyKIOUl+34zDlyN2lBRW7ecaxqFgadG
	lo2TIbp840E3f2aLXvjpXKrHMW52kQpi9LNJ+6gmJ/DdkmI2uY7YKvpgLADQHrxL1KeNzJeeQmg
	==
X-Received: by 2002:a05:620a:19a1:b0:92b:6805:9188 with SMTP id af79cd13be357-92ecf8cbc90mr111817585a.64.1783497466430;
        Wed, 08 Jul 2026 00:57:46 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:92b:6805:9188 with SMTP id af79cd13be357-92ecf8cbc90mr111816385a.64.1783497466038;
        Wed, 08 Jul 2026 00:57:46 -0700 (PDT)
Received: from [10.111.167.36] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b80785sm1347514585a.3.2026.07.08.00.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:57:45 -0700 (PDT)
Message-ID: <402821f9-f566-4f8f-a839-95e419fb92f6@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:57:38 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-2-0210b90c04cf@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260708-x1e-csi2-phy-v9-2-0210b90c04cf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e02fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QhmKzT3_Izh8C-SyOaEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3NSBTYWx0ZWRfX8dQZXrMi41pw
 NwIc+ESATP0cRbHj8besVscG6+CUNqKeOkvTgTk/GyyOd36n3Tu89djQTEmI0AHt+z747OzRDog
 5TvAjGUJU68lABkQMOoSBzql//mSfM4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3NSBTYWx0ZWRfXyqkaKMgMBucF
 h301kyYi7s8jAB0B5d3KmMLPd+EZyZCyn4s6MRPxZdxWE2U6TQXYe5lRNubgw86nCDuaLdg9UaV
 AhLJPTy5hsr4lOeQBM609ymg9mV+i1N/kvnjcsqJyFrA0hlcpI8L/eXCXnxr5az98WNzqinCLSo
 DPeLQ35b8aii6DeXGy8cEb+7/K1KHPZwd1ALVVW7oy9RLX3LUU5sQA3XfkK/iDAD7+Y7OG4JuoW
 3NgBblBoTzM4/ZQJNXIxoAO1x9YXBlTjMLpfGYWNQTHfwM17QXcGnQo9cmeQAO9RmbXEqW+faIr
 Jvzugm+eZQ2FpjMTfX45/zPojQZKNwmvB2vyYv929TeTA1jkMl9wC9hRPGX2JFxHBp9e7Ziu9uZ
 r4FMwXLrtwDg8q38t6K3nlvlLRkPAFdm4y/xhqa6zepLOz/fWspK+soqza7TaEh7GCvlS7Bseqh
 1EEZpZVr7cWFfc2HkLA==
X-Proofpoint-ORIG-GUID: LyTblHYi0LLFYUGohZFFKXKSkhADb_fg
X-Proofpoint-GUID: LyTblHYi0LLFYUGohZFFKXKSkhADb_fg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66953-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B6C2722DE2

Hi Bryan,

On 7/8/2026 7:39 AM, Bryan O'Donoghue wrote:
> +
> +static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2phy)
> +{
> +	struct dev_pm_domain_attach_data pd_data;
> +	const char **pd_names;
> +	int i;
> +
> +	pd_names = devm_kzalloc(csi2phy->dev,
> +				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
> +				GFP_KERNEL);
> +	if (!pd_names)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < csi2phy->soc_cfg->num_genpds; i++)
> +		pd_names[i] = csi2phy->soc_cfg->genpds[i].name;
> +
> +	pd_data.pd_names = pd_names;
> +	pd_data.num_pd_names = csi2phy->soc_cfg->num_genpds;

Please also initialize pd_data.pd_flags.

pd_data is not fully initialized before use. Since pd_flags is never 
assigned, it may contain stale stack data and affect 
devm_pm_domain_attach_list() behavior.

> +
> +	return devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
> +					  &csi2phy->pd_list);
> +}
> +


Thanks,
Wenmeng

