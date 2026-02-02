Return-Path: <linux-media+bounces-51982-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPW9BAV3gGmo8gIAu9opvQ
	(envelope-from <linux-media+bounces-51982-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:05:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A7619CA775
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 774E1300C0D2
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D7433A9DD;
	Mon,  2 Feb 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgigRAE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUIK10q6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6592DEA8F
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026613; cv=none; b=JOb8SyDPaF8TUdY3bzCq/9+Dg+M3t3qv9mdW7jo2Ah8lSRTFmKkypgsKlPqMkcWIDEcbFqurBpqJeAzPF/oV2r48KRdggExqXD9Q9Gre3FwCGGqa1PAO7ZX5YEzod0yGooE/304AxPmWeWZLmwXGsX6b/wzyAxrRTVExb36WUv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026613; c=relaxed/simple;
	bh=XEMyZqo6MP+uYcG6p5a5ymcj2O0tjv/y5I/kJu+xHrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyNXW5QzFjsAy11f015syuEONd5Mgs2dYQzxhZ1+2CCtafj67XWylVftVL/LxUrjP2cQPH1AKpRZMsjJXIfNbSfda6q6n49B6eFEru48BWkuPDCmxYvVCbDKRuT7ScmurYHhpkGU0wylWEG8AUiiP04N6qxsrESZ2N82ZgfRg2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgigRAE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUIK10q6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61284dDe1128072
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 10:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aL8yDsraPFT4ypmMjaLgpbPx9Def0W/PUrKR7pwI/w=; b=SgigRAE2+5P01ZnK
	evdhd7XV9RCySM/MGoDPhcHqiIEMm+i9hdfIzzre6vonPoncpuObrhWp+MukOiZs
	Stf1jv1507twTynCF2kYLkm9YW0bSFFI+GAT8fkBcJ8zkVl9GKK6rxFcr84Ath8o
	hUbkd1IqXkALwGS4Z8OHlLoWxUeYh7t5m3RXjS1XOjwBhYLFK0on22sW+8gnUL/+
	rX814saOOX212tA/rri3FW/LwVdZRQv8lk3GOfqO35sk/lCeOBI+FisxEKGHHDKB
	fJ/I84YFxkT0RT6L40qRKmoKmesnLEn55AgcKY2XTTtT8jh6LWGvntVWicpEKqHH
	+mzBaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0w0dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 10:03:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7166a4643so1152780385a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026610; x=1770631410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+aL8yDsraPFT4ypmMjaLgpbPx9Def0W/PUrKR7pwI/w=;
        b=JUIK10q6xJwSh9mVP4cVnN6KuWidJ6WCx0c3VQ29oQQuetOU3EJsbtNKFAioH17YFl
         YJQoIbVjrus33YHTmXh63gSO7ZzA8f78hWiMjzWD3Dq+moKQvFAYlnEJFMu6A32NAj4e
         Ztq5x9l5BY4QFoKAmowd3TUZFuFuVEeSbiscvnS8N8aSBPD73dzmTSGGPXixksXdDCMa
         ao1YAuiqA8nAbYOD6zE1dR4/o6gv8MlyTacFBLQ46rQDusesVoBTmwO3leTXn+iLfIbR
         za0IqRtANM6Z4H5G7rp63S7YfUreCuV8fqTUYFvlQgs7zeZ7S3N2+A0VGZSrW0Pxt/dE
         KU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026610; x=1770631410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aL8yDsraPFT4ypmMjaLgpbPx9Def0W/PUrKR7pwI/w=;
        b=gQaxzTr/0q422bYZFZIwdlodSSa+MaCtbEJvgUQF4lcsHW96GMLNYlFUEq6UOWxXWu
         vHT897dO2F72YyFIxYJGyRW2bl79IwIwrNhN49zwWTIgokyOGDDvw+Nnc84oWHVeZRvw
         RmT7+FImUwOUhkB7RfjZIyFE28YcQmJTpQHXTMZbOAmMGxrD3NijfrtB0IKQyYGK/Xxw
         /5DiwZtNnvhsJzcT5zSFb642AG1AbN4ICrZtSXGqRoQo9nzoS411NvUuYJ/uNMWSkSia
         8YnQcI/w2Ohku9QJaUT9KxKrqGRDjYOgUoruc16bbzPhXBw/uSietAS+Eq+/9UR0VcUZ
         rk4w==
X-Forwarded-Encrypted: i=1; AJvYcCUoqTqNW5qLm9MUpTAOE28tyO9YmHhpFp+hkPor6e8Ds/krHa+lfCks5AFXjhZvcExnwPDvO3LSsT1T+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxcNAhssqywdwBwGdhiSNmR27MMM/aREh/tRmwKw1yWq5SqSZ
	CDCdsB79bHTz7LYSdbqS5xJGeovOjmBe6YyWTwlLAuxn+6fHS6PYPo8Mwy2IQetCAzE3GtUvBfx
	ZWhGTj+UW0ll9TgRADg/aQXoDj/36pm+nDKVnhAGPLr3nHBMT365TmG24KKBfFp2eHw==
X-Gm-Gg: AZuq6aJ2qQCmAG7mxaZLYmlDHhcEMYGmwvu9vVFqFqM6+EkmnCHgffvIevlBDzCaXuY
	0tJTxopxExmARv3vgtn2KSqtTxy0imCWTFlIpn9DchicKGhJ4q5zkHxeJzQUgbxQ1CSuvR9U6PC
	15raoA8liXwpHKL9dPi+lFaoay6OtgSWz3bHz98LGSOhG2nl0q4GHa9r5iQfK7n3vOQGuH3Kcq7
	IeyaJ8tMexUV2KxQNyktTJoG8O9dyGSL9z5tDwA5j/X5mWj63HARUpOnabax8SB0rECCs2ZEPPf
	sSJdygEc5YYC+0FLdD1zUFtWhcMi070/hPW56z69NCP/twxLVEWUpoAU70fJGPCr/fiI5P4KxOH
	IrSVttNQTmDng9YZt8yked4RdAU4WdpuoxfDGIlOnojVK0XI4Cie0LbvUDulsQzsJiLXn2uR5dk
	8LUnHnx8JAUjpXLFDnQ9kSHAa5J34zI1VxS+gCs5ZuARMCUBKFnTJpOdCRAxtQ4tE=
X-Received: by 2002:a05:620a:7105:b0:8c7:1b41:d94b with SMTP id af79cd13be357-8c9eb2597fdmr1242230985a.9.1770026609871;
        Mon, 02 Feb 2026 02:03:29 -0800 (PST)
X-Received: by 2002:a05:620a:7105:b0:8c7:1b41:d94b with SMTP id af79cd13be357-8c9eb2597fdmr1242228085a.9.1770026609442;
        Mon, 02 Feb 2026 02:03:29 -0800 (PST)
Received: from ?IPV6:2001:14bb:15b:d5bd:79ce:863:9a22:aae2? (2001-14bb-15b-d5bd-79ce-863-9a22-aae2.rev.dnainternet.fi. [2001:14bb:15b:d5bd:79ce:863:9a22:aae2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e08b8905esm3302294e87.38.2026.02.02.02.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:03:28 -0800 (PST)
Message-ID: <655fcbac-b39f-4207-a1ac-d97bfde3d209@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:03:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: venus: scale MMCX power domain on SM8250
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
 <231ae9c2-bb3b-430c-990c-deab6a8a0d0b@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <231ae9c2-bb3b-430c-990c-deab6a8a0d0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXzAppRnV0TjAi
 f3pzBEjbySiUSgp8enjh+glRa8fda6tNYD5pKemsXugRpHBnK5UgmULpIceZ7G9szZ8KLCbv7IV
 uatUqYEcv0QJuLVA3F6PeVORA2rP4ZEiY4QJ432c035VbZgKsPpp8LnOkMYwQRGVZ0C8SUA350l
 yoZDo6ZtEKI5nz417cyPMr8dIlGcYBKy199NIlCdzx3GYK0OLUSAOQx8rcYg1yRcaeX/6c+nEzK
 gUO8WwxQFeJbtKCR3rK2WRfvvJ5CP3HVSo1UdZ0MRT+p7yG0qcnoDwwzbeRdya4YyZ768bzk8Dv
 OBwMyWnJUuOaTCh4POvRrqTyVfymm34dSjffcpuB6B0nKzYDUswq9aSMB+njUBQh5KoyDri9o7Y
 JdNLpSn4OijGg84MYxo7TPd8KPIBP4hjAjKfVVUsYVlvxbRDavFIyGaUdUv0Qrx+FLrIPYhoV/i
 6EHcHzcCrxps+7E/6ow==
X-Proofpoint-ORIG-GUID: neMeUGqRWVhLFokEbOu4_sVIWC-nF-sB
X-Proofpoint-GUID: neMeUGqRWVhLFokEbOu4_sVIWC-nF-sB
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=69807672 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HXGjUklKsU4Eq_QyynMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51982-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7619CA775
X-Rspamd-Action: no action

On 02/02/2026 12:02, Konrad Dybcio wrote:
> On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>> the PLL it powered on by the MX domain. Extend the driver to support
>> scaling both power domains, while keeping compatibitility with the
>> existing DTs, which define only the MX domain.
>>
>> Fixes: 0aeabfa29a9c ("media: venus: core: add sm8250 DT compatible and resource data")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -904,6 +904,12 @@ static int vcodec_domains_get(struct venus_core *core)
>>   
>>   	/* Attach the power domain for setting performance state */
>>   	ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
>> +	/* backwards compatibility for incomplete ABI SM8250 */
> 
> "eeeh", I'd rather error out since it can't guarantee to have its
> power fully on

That would break backwards compatibility, so... it's not possible.

> 
> Konrad
> 
>> +	if (ret == -ENODEV &&
>> +	    of_device_is_compatible(dev->of_node, "qcom,sm8250-venus")) {
>> +		opp_pd_data.num_pd_names--;
>> +		ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
>> +	}
>>   	if (ret < 0)
>>   		return ret;
>>   
>>


-- 
With best wishes
Dmitry

