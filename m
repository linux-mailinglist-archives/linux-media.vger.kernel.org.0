Return-Path: <linux-media+bounces-58742-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNezKYtL3mkzqAkAu9opvQ
	(envelope-from <linux-media+bounces-58742-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 16:13:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 673583FAEF0
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 16:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9762B30886C4
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 14:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5503E867D;
	Tue, 14 Apr 2026 14:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZbdmApM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iK344g23"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFD73E8665
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 14:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175803; cv=none; b=k9jow7FezHOIyyB8Ces4Um03RgKgOhXRmyu/+kHzX9druJH3N666hC/7B0gIMld5d+X8DQFXsVWn80wbzEUhgrLcU0Fe9TrOMf77coK5CTW3ahTg/u2/Jw94vSof6H7294PrDKlspdZ6S3/yjGSm7iJq5cJAXPaONVNCD428ih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175803; c=relaxed/simple;
	bh=v7YJMKsGDlh1XdUvKRSZvUwbcwUrfvm0ci5obZxzHuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETUwHzM0dabqYTPh2IvqUc8QIgblUSzbC5/r8vVBboES1ypoZS3rO/Ho8wQv7MIjPS8Xv/+UZB+ghb8Ja8DiVh2ctwki2yJMrh6KWRmD8mfpgEUkqbPNw4r+OUsYMr8qanVbRIt50mqvWS6kSZbYcULXA962+4GOKoBGlL7auO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZbdmApM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iK344g23; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBAfAQ2633299
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 14:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODMoVBUj25CjShpTfa2WXnly8YJTIG/0z1viPh/qBBQ=; b=NZbdmApMwdxzai/u
	WqM7682GFk6zcPLl/7afKamZ6/yMqrHypMQI8yBtEOCEn0k973OxTctZjQ+ygjdG
	drGQzBI52syqQ1KEzr9w3snpgvUWwHzyZwgwiRUpkqoYF9nPfVsUWT8axRZOdmO5
	3v2qRvwqp1mh0zGGcNZRtVcySbbmQNqk/yzV1v0sG7hAJS8jrZuvQajp7tUxrPJm
	6vDjrjlvVrgFb2OyiY+oi1KDPsIXYw1YfuR00SJQWwK7h0QsBTcXpuGeNk2bhGO5
	cgJMqCY2W3Rd243zeUeWsZSjHJJy16DsFYPna3kEGk6Ys09eFnwvA1tDO7QVK+9h
	oadbHA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86cb0ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 14:10:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-895375da74bso14970016d6.0
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776175800; x=1776780600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ODMoVBUj25CjShpTfa2WXnly8YJTIG/0z1viPh/qBBQ=;
        b=iK344g23I5kx95iGdZtCQx/7uVq4QIg8GxqCRxRSK8kLGhrpjgDUQ2K8tj1aA8jqc3
         mVSdsJhkOyQDeMUTThPp6h8CpUfQlG8A1s+Qi6MXWs4Ewmjb+yufZv4nYXi01R3BASRf
         /eCQ3IHGKkBAK8fB15NZnlgSly3/Q6SsInvObjbUgvMSmdO2mF91Tkzitb0OqZ/USCNZ
         D+w2jhyOjGNv/5xm45FfwY37a0KAg8+KzHBlVIAPQImXVrC3Cl5kB11SCxpa95MhEBSO
         AIFP/kRGSMo0RBmicNhXcMm57WUy7AtGWps8x+XvFfKlw45spAQf2VvG9RVVgBgfaLlk
         zV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175800; x=1776780600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODMoVBUj25CjShpTfa2WXnly8YJTIG/0z1viPh/qBBQ=;
        b=YW2z+n//ZEy6cyx6AVS8/3K2KbhMSZUdwx3beVPzxm1cvqibYrF3HQTkiXvPiN6IPh
         ZmgSGt31jFnOI00pCmoUuP3l3tx99tr9frjrZoiPKYQSekEjVVlCjD+sz7oI0rRPzKfT
         Sd+4/V0d7cwUWTL70EdeV/b5sNDL9DWlY3BUu6cu616y0JHGVQ/1JzjClNA2HNsHSRdS
         N/0SojpK6nJDM0NG27Zwom256tlVkIQdY3PclGBlwYJD0hAMAnbkQYAThE/naBnbL9/z
         oX2R6KjVv+ba2gh7oI6qiPhqwPtvZ/ErUjGw2M3MxDroXjtGU1HGec7baMf6uIkngSpq
         29vQ==
X-Gm-Message-State: AOJu0YyVijqD8H7sDOVUoxNb8WfmMszAgrNdBdc3iT5daDmMInv1e/Jw
	xjPcgXcU2jAo6KAgAqw6oqdlh2Nd+uGgugynllWmByaXWvoXdv3hRfEQEPPkVQe/v3Kn1sbhwcB
	JVkgMrDdYky2X1KXpk7U8VgP84dW3ftfTcdV7b0PVMEZwar3Zm2tbKHcJypTFE3UsFQ==
X-Gm-Gg: AeBDieuBczsL1hk1yEoG7nvWE4clKxbRZCi0n47oYnpKXXYQ3VfqZL4TY6RFuTFs8jf
	nwj0JjugdleU+uFisctzcX+QxRyjhMdTByBB/kEDF7K4S0JYCApJPiXbzdTOkvBdGHnxpOrPzfl
	/wVKxWNLRtmgftkCUs/GqTIBeB45uqU9VC74Gig4roZSK8/0RzBPy7X3Qei29ttL698XC9/Qsfo
	RB5WGqdEng411Y2+g4S4GObMk75zFIZTRNN0SKxGXJ5qKLpIxe6HQ0PAKNo8T3YMU0tzcbig7h7
	S2Ab1kz8Pk1GwMdFQkpqIIMFP+8QpqGoJcW2Ogab6Zk6fLGu2r1Z31aDs1SXwfHQm2g44aNEQXW
	rS9MX3CSvRJNd60djeZfjy2EpXUSJlTdv7yBDJ8sYsVEnnxRj28T8QvuJzKEo3lqfu5I6Op0aXB
	/dpNccrJd+VJuZvQ==
X-Received: by 2002:a05:6214:ac6:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8ac8629bcfemr204974696d6.5.1776175800056;
        Tue, 14 Apr 2026 07:10:00 -0700 (PDT)
X-Received: by 2002:a05:6214:ac6:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8ac8629bcfemr204973926d6.5.1776175799410;
        Tue, 14 Apr 2026 07:09:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5824sm403077566b.38.2026.04.14.07.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:09:58 -0700 (PDT)
Message-ID: <809e2ad6-258c-49ac-9f3b-4ced32807203@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:09:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GOgtV_fEUG4w9NfWT2855h_OzY8RjKMd
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de4ab9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BowHXwPdtatiOUMbaTwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzMyBTYWx0ZWRfXwynGHL1PAdzP
 FR1uhnoSqFcGi1Z/EZSD9vTTueIqLmca1xiO9QOiIc6OrfzOznv1zdBC5fDMpTLos2aL8xmh5Sm
 qCJpG5BI9X4c5VsEig0dcJeGW9U/ZjmOmhuWOF35tll/qz8LZorkN+w8t52eqTknh/CSP2Ej2W0
 b6Z6Jzp9BMgzMHPLmFnUDdQ/uHTD2Vv/9RKnOQnn1irapJh6eBo0RICEHwI81PfzroR9X0D613s
 oODkLaXQTcSnvV5OR96KVlxvZrBfluTuzC7tX0Nzuenyn2b78qyJupNwEruUadpQprbbixuo07k
 FBujq6dEP1EhWBB1TVvuricl0OGTIEE5uwhmzxttXQvPOrQtqc0YL+d40QgzKvSQiCvnSMB80Tj
 vsGi+EW7ejC+jZiiSGbDkEAG0VzzRAq6gfbRobPuBvuhapknXHcAML9GSSiU39MTlqC7FEISX3M
 3GjKFzBktpqzhS0y6pw==
X-Proofpoint-GUID: GOgtV_fEUG4w9NfWT2855h_OzY8RjKMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140133
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58742-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 673583FAEF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> or QHEE), which typically handles IOMMU configuration. This includes
> mapping memory regions and device memory resources for remote processors
> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> later removed during teardown. Additionally, SHM bridge setup is required
> to enable memory protection for both remoteproc metadata and its memory
> regions.
> 
> When the hypervisor is absent, the operating system must perform these
> configurations instead.
> 
> Support for handling IOMMU and SHM setup in the absence of a hypervisor
> is now in place. Extend the Iris driver to enable this functionality on
> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> 
> Additionally, the Iris driver must map the firmware and its required
> resources to the firmware SID, which is now specified via iommu-map in
> the device tree.
> 
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

[...]

>  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  {
> +	struct device *dev = core->dev_fw ? core->dev_fw : core->dev;

Maybe:

struct device *fw_dev = core->dev_fw ?: core->dev;

and preserve *dev to be the main Iris device?

Konrad

