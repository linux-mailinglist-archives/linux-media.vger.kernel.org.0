Return-Path: <linux-media+bounces-59686-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC0dJNlt72kcBQEAu9opvQ
	(envelope-from <linux-media+bounces-59686-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 16:08:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3096D4740B6
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 16:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37495301A8CE
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8584A3CF671;
	Mon, 27 Apr 2026 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNo9xzCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDEBECdK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928773D090B
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298700; cv=none; b=VcyVqwe2tdam6IARBDDUYh8c6vdeCqLooICwC5w+UOwUmVTEvkWCefCakLRiC14VmxiVNZyekbbRNLTOYof3rG2Lu28IdIcvnk7+RrpBt7XQuen16m4zJMhHWhaGaMXo1WlN22yjU0tnAdRU3ZmhxMjwhb7TjxixAe/eLxaekQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298700; c=relaxed/simple;
	bh=rnKDWblutbaVRN4OQavnvyRCkTcs5zBrEO+FDHjzCm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qELHzbz8DIv37mg7wQqyEqLpa4KWmslzOS4e/KXITHp3Smnj70YXKFDcpgQC4E8D+owLe9mcMlX1Rt3T0/uguN5d9rfumyqVWWVMErktl6fFW2z0iAaXWM3Th072A6P/wLf8OsqeHo7ObNt9FuPnnSNu5vnfgmBTBjQnjjmXXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNo9xzCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDEBECdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDxnfg2913820
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 14:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYPywVIvWOIbB3aINxx79NXY4+7xYBKmkbz1uIIb2OY=; b=nNo9xzCHqOdmO6+E
	9k18vL8QVbVC7uMwRJ1zadVdJisrlU51Bq7lDBs5BNKi79grrpoYv2u3kMzlAePD
	pGSJ/Rhhz7U28HdYMmJDu3EkqZTpmDhkkpFGDTVi4I9vrIxmWZyT7OVhFI78ZC1r
	Sulv5KAoVNw+VwYLTSIC8e8ANVG9clEiWp8Ss2Mpb0gb7plySfi+/EpINXk5P8eZ
	0Alkd5fQXExM61QxvvwIjKQuiCIIQhyo+68K0TsgmNIQpK00+A7WIQbJrCMpMor9
	6gFJG9OO2vaQLDQlJi0KL4jK5DcHU56yxTRq7s9sEIsHxMdH42lwMNWi4e+lN2wT
	QeTTUw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xhsc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 14:04:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-610672f7120so548733137.0
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777298697; x=1777903497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYPywVIvWOIbB3aINxx79NXY4+7xYBKmkbz1uIIb2OY=;
        b=UDEBECdKLakFV+9ZjOa2WAvzJP6v+ni4/maCnONT6ygNpck3cDn0QH9M6m5chA3mxj
         koDAn1O3YPVJTIobWkHY8yws5xmK0rqYhYMuF1YFjJ2YZzIz2qhN9WUlRcSrdIAXjKT2
         BPJtJyZDd6RSdbR0oRxPDDwdDZ3X1t7YlcNVa4KGOUbAolNoNMeMokdcyQDQb/iJd0N0
         /B8UcDr2mNyWebMdb1hQonF4bOKwHT/egxPk/2cI2ate8aakCAsDrlXePRDfjVSgxwm1
         Ug+RYv0VBvLeQwMMaCExcDbU0B01cPStvY0KeJ2iRBxq8S/8aR7XHg4s6l/3X6tcmVu5
         bV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298697; x=1777903497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYPywVIvWOIbB3aINxx79NXY4+7xYBKmkbz1uIIb2OY=;
        b=ho6FUH3HWWKQzZDo8Fc/xAfg2Wxi5FjQBrt5L0xNY4Ya4s74ybgX0Vsi9EvP7OyT3F
         AU7ZHDBD7lxHUH0d8YXtAwrlVAvp3PWu3ITMYIrmAhMKOl/NF65vLX93Kawu6l+K6prl
         WITOt/98n4aDVip2GbLJQhf1Y6nTJLw/9zl61GHRy/0QPKgMLhy92YpVASg3umj/Luc+
         Q+SmsDfK1YCsd8X8tNOhfoVYtNe6+ltqgWFfZhdfTA4mQmPI1SNhMKXkLZ0XGai5BUdk
         jYPrOumgQvTFNKKzxE5vhx1lcOKls2mRIgSuy4AizA0a+1b/LhFcggmB4r++DkxzymN8
         iuig==
X-Gm-Message-State: AOJu0YzrqSUW4c1gl5uNQ0rGMD/EiKBAznjL0l6kMzp0i4Q+18j+JjAa
	FI+27gboSYbBuhQsVLRJl8dnchk+qJ8mxxZgr1DG07Tm2f+XsWG4Ca33lS0JqpwkN8p9r4ECDY7
	eajj48TIFmD83SRRNxd0k5IsEWprfay12L3tqt2svLs8uqMDaobXMkvYLYmX4CaErMQ==
X-Gm-Gg: AeBDietlxqAZAIVEkUH8A424PxkXp/heG0tFTCcFkqD7vgUl2/s99Vgcrzb2/XIXOZN
	WFi/UQf2g8xDg3AEWP+hxmdCsh1z1gd5KQLgcN5X3UhNaGj+CxchTLzDUNmt0Tp/FTSfzPJZjYi
	uZCsqFO1afn/DTg+O0jm8BB/oXK/W3iggjU+eo9ZpEF01bu++ZP+HRo5dNy/SjfM3Yrjp8xBMbH
	x0JOLHTrFivn2fu43wjmBCVfKh49PEQIuH2oB3cgMHJdJx6EiKf4fcbI1k+oGS4h7eBopf35Vd7
	ZbOeCKl9sWgylwgLnD083QcfB+RFIIVwx002xcPTGg0rZcoshIko/TatJwoz9YxqmnNXP7L4S+p
	R2YAHf6ZOJndRyPEHx5UfjRH0x12gWCvlrykHMPliKEvg1nodF0IxKRFORSm2+wdR4YDzvX1OWl
	uxwtSRjzxcQmOLvA==
X-Received: by 2002:a05:6102:8501:20b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-62352cd5657mr1167786137.1.1777298695376;
        Mon, 27 Apr 2026 07:04:55 -0700 (PDT)
X-Received: by 2002:a05:6102:8501:20b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-62352cd5657mr1167625137.1.1777298693398;
        Mon, 27 Apr 2026 07:04:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455926c61sm1100136866b.63.2026.04.27.07.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:04:52 -0700 (PDT)
Message-ID: <c145efc2-9285-4e2f-a9e9-73c4faadf15e@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:04:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-2-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-2-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4lPhPm0o_jalgGPzlGXTBzYQstZARh59
X-Proofpoint-ORIG-GUID: 4lPhPm0o_jalgGPzlGXTBzYQstZARh59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0OSBTYWx0ZWRfX+wk6gMOXY0Io
 22tep3c3nCUxlaDgJtxZEzs/4k/jKPbUHw895NQJE18snxkW8H+eQsTpweZcVq7zrt/vj8kq4LU
 FcKtwgFQ6ogzuneR7aiky/gffCns8y1O+VNKxAtV4moxwVREjqIcj23+/md/RUhFszSd+ZAbnuZ
 IWjSdaymajzvB81cNMMyCbbhu5WZAomrjZe80aNO+NqxWIgHyiLLQiuVV3VAx7XbVCdzkKPLA2M
 PRjcAJlsqKEGRcVOmlXHZotKnEsTNJGqFEoc7CVQmLq2PUhFrcQhBQOlUNjMUu4zVVa87XJX+hB
 YKq8G5jxvLCsUB5gFW8j3fhCmvnne3lVp68t2QGp+UflSHeFVR/R5EXJ9gn0ONQytkez1XNNN11
 KzqdgUIN+3uXGNFsYWoQNLU6lmyZBH5vrAF8Q1grqeznvgzRXMNPNzJ5ikL7VYwcFdwElo7LRmk
 a/Ol/rsbCe3R5Gm1R9Q==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef6d09 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=s_dpPsJcIKQ2JMW1VggA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270149
X-Rspamd-Queue-Id: 3096D4740B6
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59686-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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

On 4/27/26 2:43 PM, Loic Poulain wrote:
> Add optional PM clock support to the CAMSS driver using the PM clock
> framework. This allows CAMSS clocks to be registered once and
> automatically managed during runtime suspend and resume.
> 
> This is especially useful for global CAMSS clocks that are shared across
> multiple CAMSS subnodes. Now that CAMSS is modeled as a simple-bus,
> these clocks are automatically enabled whenever a child node becomes
> active.
> 
> This avoids the need for each subdevice to reference and manage the
> shared clocks individually. A typical example is the set of clocks in
> the top_group, which may be used by CSID, PHY, CCI, OPE, and other
> CAMSS blocks.
> 
> Introduce a small PM clock descriptor table in the CAMSS resources
> structure to describe clocks and their optional rates. Initialize
> these clocks at probe time and delegate clock ownership to the PM
> core.
> 
> Hook PM clock handling into the runtime PM callbacks to ensure clocks
> are properly suspended and resumed alongside power domains and ICC
> paths.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i].name; i++) {
> +		const struct camss_pm_clk *entry = &camss->res->pm_clks[i];
> +		struct clk *clk;
> +
> +		clk = clk_get(dev, entry->name);
> +		if (IS_ERR(clk)) {
> +			dev_warn(dev, "failed to get pm_clk %s: %pe\n",
> +				 entry->name, clk);
> +			continue;
> +		}
> +
> +		if (entry->rate) {
> +			ret = clk_set_rate(clk, entry->rate);
> +			if (ret)
> +				dev_warn(dev, "failed to set rate for pm_clk %s: %d\n",
> +					 entry->name, ret);
> +		}

So this makes a couple fragile assumptions:

* there's only one "on/operational" rate
* no OPP votes

I would imagine that in the camss-is-the-bus model, the top-level
device would house an OPP table.. but we have two somewhat independent
clocks that may possibly have separate RPMH requirements for their M/N
number of rates, which could result in M*N-long opp table

Konrad

