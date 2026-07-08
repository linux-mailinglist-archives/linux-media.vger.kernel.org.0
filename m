Return-Path: <linux-media+bounces-67031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xiaJOPJwTmo7MwIAu9opvQ
	(envelope-from <linux-media+bounces-67031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:46:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E42D7283C5
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:46:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b1QuN8NG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kJweCrYb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67031-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67031-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B927302800F
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4153B813A;
	Wed,  8 Jul 2026 15:16:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC15E3F12F2
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:16:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523763; cv=none; b=nL/A0eBU5h7BE1/bZWCcGI0U3J027Zsgv5vrllUEDHTZKvYFvYa68+BKFdPLo6FO8yV/oFv+yxmtv4bw2gcPX+MYrloYMSCHw1F73vU7S4vIB5KsXI+VeK2tcWq1AM2L88UlTikGF6sXaqfzXIdyxt3iImIdjDcdscvYpxJVTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523763; c=relaxed/simple;
	bh=7HZ/p2qWs0/610chpsEBI7thFDTZBQAfrf5UF3//urI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdFBBYWg2iH6a4Qng7JohOpWZ5SGsLcEEOBJr2XVqLaUTZVqAONATvE/FWZenj2Jx+gDNr6x0dF1E9bWfslx5wWctXESmB+KTi8MUFJ6qnDgYpVgYo5QqIixkHDA9dGLPxtnKIZV6Y6VF0YCainAf6DG7OwcXzPxOHoR/heRDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1QuN8NG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJweCrYb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3YvP2667599
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 15:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=; b=b1QuN8NGglJsWzFI
	/5/OWMr0iy45ykbTib6rymqZnggykGKI7MPCQvcCYyMuo6CU7W2dM7tvgAIUyjBV
	6c5mtGi9uby5CqhI49cGSA4KOTAsFVN/WNeepR8mDPxX5Mr5IJPqZ4UYCMHw4eO5
	mCCFRELf1Zuz75R2+02jvLYLCEHJtu+3Tj45B9ED1TpZ7oWFTQ7XkD7Xf7B1UUY7
	of9RAUSqWZxfOhN+x5Lf2Iry7rsZqeARGcYhOwywGz4uA+G0ciLdJ5oiyQzTkXES
	+pTguuAU+a5IgiT+Gr5hrsY8vl444DDJQ1Ng4v75jC+yf19YzzgNe5Wf+6NLvPmr
	taRn3A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hguud6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 15:16:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3881937456bso1388357a91.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523760; x=1784128560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=;
        b=kJweCrYbaNT/4vfy90dbbBVDmrcA7rLH3rL737zCOFqlo/XEzmCpmZINie5SXP+EWH
         OHGiNbHJC6WNXTcTDU4/EQ3sjONhxLHdO29sKcsj1fKQY3zBu2pqIin6pR3w2XPA1wpp
         vXsfcqJPG8vixZvak81aiMVAeYpqYtg0wbHc+HriVQ5gRGqDBVmLTFwWhYiSIXERzMHs
         AoxEMexI09AEXhkq5/NbvjTslqPyHH00B0w62wburP/tUgOysrWle5ButPjkcpvmyzJu
         kDo4NDwMzm1IbLMAnU23CfxSfLMFmaYFTtd+Q01FhV0FW6afHBq9wgJ49ceuCs9jUfmt
         3Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523760; x=1784128560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=;
        b=O5+r5wSMQ/pJsdcuCugWl41yHMj0WE1jIiMB8wjZUlMydU6XocXwFJUAzJJLT/y1f8
         /UE5eLfHm8ZThpEXQCTrbL+/FC2CoRQ4iZ6wBIn6oP4zAc9XEKUPad9xUm4UnZFa0d6m
         X1ngEeW9M+7cTBCZ92DuYn5wrLnDjCbyfIbSTlvr4HwIMxoV1hRwym9rBQBeVHmCjIuW
         FMMBts9Zrat6O600ZbvLWU6gYqhx5GXSMz9UWtHtY8lTGCNKPMtsXpaBkNPZFVZEnWoR
         ObDDIlJd7N6tQG4tqNeni48eqE56sgtMqnApE+Hah9EXwr+hB3UbJyD73/zKdIC0oB4B
         uEVg==
X-Forwarded-Encrypted: i=1; AHgh+RosBvPBm0q6lzffBclWUta5FFJl3uPQ10eN1xM4YUyDXKHQbe2Lx76oz/u6EOFBtjjq0qk7AJ/gJDt/9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCVD6LJ1L8D8bQuTUrm2pKgMVPVc8EFN5Bdq5DjF69eSvVS7c2
	z93Xmh64UoyWdBnSpf0nSgcioTJfetqoRAsscXAn+AaOhpBl3Uu4t1GtSGp+PIe7uwu2wOwYipk
	2LyOBcytYqyvtTAApI8jxKZrSAnHDJFxWPcmyvK3c5w5Pj5GVYou2KwwM4JSibThaJw==
X-Gm-Gg: AfdE7cnTynUPk1IlPnAF//hKtJ+JpDPdhFeFcyIm0mMzU8t1gDKF2HmMGLg5ldWk9OG
	UzWO84LX2RFPn3ANHf50yq5BH3w7fP9Vh09AD7w+kRvHD2WFWonDLuTdqnW8IK1amp3H61qSeU2
	p5nJgTHO3qP6XlyzU9TywkxhO4YzYEcQpmiQHOnyFKfBO4LKRjGIwbipqNvVAy0XtSd7TZ9+rqg
	tZaF8brEYEIU+C2pm/qONq3fwX6q3dl5Y2e2MreM0LUJiMIzFqGv/kiA7VmZzCsvWajk3KTmrda
	r3znSlGnS405oy0vDjwZ49ZRHDDigiHRvZ5XUWIr+uQhg2FMHEqnOmar5icb7SHMd+gBQsE/sDy
	vJJNks6sVGq+3MV1W2Qj/B5/URuQF3N0vxVMP/mrc
X-Received: by 2002:a17:90a:ec88:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-387d7270f6cmr8475156a91.6.1783523759635;
        Wed, 08 Jul 2026 08:15:59 -0700 (PDT)
X-Received: by 2002:a17:90a:ec88:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-387d7270f6cmr8475100a91.6.1783523759171;
        Wed, 08 Jul 2026 08:15:59 -0700 (PDT)
Received: from [10.204.66.13] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm18273012eec.18.2026.07.08.08.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:15:58 -0700 (PDT)
Message-ID: <cbc1b1eb-0064-4999-b829-2bec451c682a@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:45:50 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bd_wa1TmEoeHlqhYk9xM_HSYPyaiuhqh
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e69b0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=hdgLcCZjOrcdczLgVvYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: bd_wa1TmEoeHlqhYk9xM_HSYPyaiuhqh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfXwsK0c0WRd0tq
 Qix2GadOKm80K/QkZgSieLMzvDFtKDKWdS1S/LnytCWSTko1ZjBH2bQWlethv9WRHHdoG7p/Rwz
 ZyKEW7ILXr8KzladRLqosJxqDeLX2qo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfXxBis6xJZD2ts
 azFVvY/3uqIIucBB5YbiCLJtxYm0IvOmG6tysrrAoTWGqoPYf9a97en9cep5JShNJXjyrhINP4j
 Qm5s17noMAgyq3PzlkiI3vXJosDSd9dqpbdyPh5tanaN5Cdq5FaVKwb6XRTXsLwGqK2KZgx0vRZ
 6Skx2Tm5Ohr0OgaAO1CY+naUuwZ9dowNRjN9WkFFKMmr8Dmt+vKuhuTI/P1Rup8WMih9PYekLRt
 TIXNkHefSQR/XdFxXkA3thhI6UdhKqHcYlqeDb5jfi1SlHKMUqUudH47a4e23sbPlmXtMRmcOyJ
 d8uxH6foqVgvCox86rI7FnN9JjpMv137BG+6fGfXnOHY0w81tbJqe2z1upBJ1H6YfOl+13D5y8G
 t/pKxqtGqy/xK2b5r00HEUe2A1E0yGhgPjIsiwz2WIMV1fLVy1djLEbUNrGje3wuAx8dQajPKGm
 rc9ZAypOa61zGASZw4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67031-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E42D7283C5


On 7/8/2026 5:36 AM, Bryan O'Donoghue wrote:
>              iommus = <&apps_smmu 0x800 0x60>,
> +                     <&apps_smmu 0x820 0x60>,
> +                     <&apps_smmu 0x840 0x60>,
>                       <&apps_smmu 0x860 0x60>,

I think only "iommus = <&apps_smmu 0x800 0x60>" should be enough as mask which 0x60 is implicitly covering sids like 0x820, 0x840 and 0x860.

Regards,
Vikram 


