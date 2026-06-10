Return-Path: <linux-media+bounces-64383-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ewbfL0ghKWqjRAMAu9opvQ
	(envelope-from <linux-media+bounces-64383-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:33:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955B66733E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:33:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VqlLSJzm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cTzE0cub;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64383-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64383-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9901332F0861
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A75140D592;
	Wed, 10 Jun 2026 08:23:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D66038E5C5
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:23:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079832; cv=none; b=owrWobaAPsIA9P2EV25xNYE/CDA/skQQuIgCbj1X83fb8IABCOguada5GrkJry6icmkiGqwQnqhLAyAReAtq91CA/QwHqj2oYlie9VAk1yk6J5cQsggZTT+FckiaoTWHIKJdWXj9DGFrqdaBHkp8jvQHaiOObH4niNV3Pi4/Rgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079832; c=relaxed/simple;
	bh=LkbvRb4Lxa3vbTQK4ekpMqZOPYOFQsKDqFtDgQKLURE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p72KLp/JOAH4NByObIHvsRigM/QIJGRv5rSvNkiolnZZzNyYzFXsXNhsDgNUQLikKtnpO+YJKJxO0vvutMAesJ42c4PRjDyC/UKaIWQSC2XA3rg+uE2mBrfIyVbY1t32Othd93K8vfB7j6jVKa4wPJA6s1lQm3Jpo3BqnYg1UQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqlLSJzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTzE0cub; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hhcX531383
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYDOedvWLAS4SJUQqvQ16zubYkeixi+iRS6jV/d0I28=; b=VqlLSJzmzF154OeE
	/ENKpohDDVjlds1p8RGt1KYNdofHNz0k3ITjDIuHXfoADtRtk/BTFjpX52pi46t5
	4+0pZSXnYvDSmu/B+yBzS09TUaaITZMI5Cn8OUogt8O8b989qoS6hnoK8PXu07Wg
	RQD6Bk2fBnPFFsrWHB5k4MVwLGsonMcAxgirU5iR55JZKYx7EHa4+elIXQhhLTLM
	aCDZkJkUKoZGSrY9eHM9ra0ybCNEQR0p1lCGzANde4kYU9NXVwXjR+wAZBY35OtC
	0MWizSaNVj4c/5AyQc0hIGCujft+j0XvSw8siViBMpuM2/1gENKFTh9X1gp2EMT9
	aRjQgQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1ruyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:23:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9159c4b210aso1236811385a.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 01:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079829; x=1781684629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYDOedvWLAS4SJUQqvQ16zubYkeixi+iRS6jV/d0I28=;
        b=cTzE0cubNkaAwmeTYxMpEkQs8KU9Jd0dxXqiQ1xjnhJGA4d09RGWcKuZ0HsL2pMmEt
         qbCEqJozulR3zVnuBiXPy30J2TO0TqcURuLzqIjzix+geo8+eT6TzWowW+fKlgGZq4xB
         jKHhAQzo8OcaRYQtt6tQM53M7KXvcE9CvG/8nGQzXu9hZRVDpK9GdQxPmtzWTeUS49II
         km3XdUQeq+NON59/EQ2KeOFkkP/zXaMVsJMMzSUIK+JLX/MU2dq3IRmqLwe5he4+gpfM
         HwolHHxsdwH2UYM6SalY1R2iLl35Fr2fA2JyiA9bP26D8Q7XaXTdF5PZNCLKqub53PMm
         uhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079829; x=1781684629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYDOedvWLAS4SJUQqvQ16zubYkeixi+iRS6jV/d0I28=;
        b=qQvSd2PA1nyiRCdw+U7xSfsU2z2PAJhlD2JTnfnBz+jFZ1A3zcmv32Gd7/gJqA65em
         PwYSLD9kdg9v3xAGlJFzojeM23W/cDt7u19WxIB4oKHMXVTHeTgAKkbMbkI5QLMnlVtN
         OExqhTpsh1mAv6Q6b2MZkJUBJrqziA86SclkepI8lVPMtQqaAw0crI736RiwM75CXx/N
         PdfBs4O4gKUiwdFOzPhxZu+UoHyM4VV2KgjiqPu6AmK6llMb2qfE/8z2uIPDu+sfTPFU
         lQKIfxvLyJg7izY4dKGVrLNpYs9nxSVR9OkYkjr2HWlJVatLHp5wf9x1BoYJaoSI+HXW
         bi4w==
X-Forwarded-Encrypted: i=1; AFNElJ8X3L0dK8kZLm38GwcK3Z10UpfY921YoaXBlO22m0dKW0Zs+56Q7tMdvQfmIpKegKrPZNXP+eUSqg7UbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwJP7fcHjKeAkROufcqsUvCU4s4x8QvSShFXSD4lNjG4X+PCtq
	67CEIBTw79GT9AZHIRPo/+9gvbFzsZAo8CUALGm64EAIxxVlPC/kyVvbyPCVcRsZyS0bQnvgLQ9
	tP78FUAk+su8ZA+4OQTzia1MUQqWKItpazQGwToR4gCAkvxLc2r7i/GbcJ1qb6DzfUw==
X-Gm-Gg: Acq92OGtrGBYfQ9eV7ZCHJpC5GuHywtKRGiHOhqAzH7vKPS4NdQ4gqywmKSSVW0ZHSp
	zf6HyTeI5ahXiwqFYvRKfF680zgCHTq8QurQfHQlmckXXzJA++Y1+r0vL7ZY7De55CQ4RMzBv4y
	uxoP4KYlC2DQBA2ZysbnjGYb79QhmDkqvO3xrDRmFKqQpPEtEVhpJebbHOsjTz48dSxPo43dQ87
	TBOfRAdHFb8LwcEX+pKL+X2ENYjzKxQ3chJXAKFafs7OR2oFoka0gWcCm469HyKcJ3DoMsR+IN5
	WLfRGV7FZ5XqPY299o/4pIEMJQq708fR8NKy9ohvntS4QiAhsQ2Tm3yPEEi37rViu7PsoXzqAIA
	vODCddwJNSvQoiJXGhKq0jy8LhwBg/+Vo6o/bBfU/DyCUwDA9TtuUsZY7SpVNzFl5CV8U3VJ2j6
	Fv6awa/VWaDdlawYV5SAY=
X-Received: by 2002:a05:620a:4407:b0:915:4217:bf0b with SMTP id af79cd13be357-915ad11ecdcmr2818561085a.19.1781079828953;
        Wed, 10 Jun 2026 01:23:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4407:b0:915:4217:bf0b with SMTP id af79cd13be357-915ad11ecdcmr2818557985a.19.1781079828545;
        Wed, 10 Jun 2026 01:23:48 -0700 (PDT)
Received: from [10.111.165.13] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a2465e7sm2407977585a.19.2026.06.10.01.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:23:47 -0700 (PDT)
Message-ID: <b4599747-7eaa-4ccb-8144-fabfa4c96593@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:23:40 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
        Cory Keitz <ckeitz@amazon.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
 <20260605-qcom-cphy-v7-7-426c37e9008f@ixit.cz>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260605-qcom-cphy-v7-7-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX77iOJWzK4ehj
 LeqZ6NgG+kCHe5xc8x1AssCGjxQYj+/1ybjPC2PVU837f6WgesRHOAfO9lP5YqUM6w1TnYx7rXt
 oP5zbbCM7yJfBSEEXEyxoTwmJ5296bgRfoYetJQqVSl7/qghW+U0gQRAXYBC8XMvRpx1CAmCJrS
 +IjqQLMXNOvv+kZa8ZGgkleB41GUgtZgGU8MCnI6s15Lx9Ds2zxrLruApLKjnw/EOJrnd770+A9
 e95M2mHL8pnLfkavj0sY53Zo/SNnmaOqgibnWb1FuTzIaG18L7hiITf2/vY2VNASvfCwUujPaJH
 Gy7+KaFyCDXGasn+tfIMp4nNniGzBMs0Yz1DbZgA/QMCM5RLon9CfeLzHKQyYlTrMVUQowejFdR
 8FpzUcUdrj5mKIHPnhls99jUZGjMPksG1ASt7MrmkmZkNPPjqrW1BpHjkJRaOPbr8k4dcsyOrx8
 GXwEvjBvTECUBwSjlGQ==
X-Proofpoint-GUID: 7kie_vCONHh4VhLw6bzoo5QnPo-hJ_iU
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a291f15 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=vggBfdFIAAAA:8 a=KKAkSRfTAAAA:8
 a=pCfSTlZN1A5Xfdvpc7kA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7kie_vCONHh4VhLw6bzoo5QnPo-hJ_iU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64383-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ixit.cz:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1955B66733E



On 6/5/2026 9:14 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Ensure that the link frequency divider correctly accounts for C-PHY
> operation. The divider differs between D-PHY and C-PHY, as described
> in the MIPI CSI-2 specification.
> 
> For more details, see:
> https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Tested-by: Cory Keitz <ckeitz@amazon.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Link: https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c   |  7 +++++--
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++----
>   drivers/media/platform/qcom/camss/camss.c        | 18 +++++++++++++++---
>   drivers/media/platform/qcom/camss/camss.h        |  2 +-
>   4 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index bcc34ac9dd212..7415e811082da 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -534,25 +534,28 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
>   
>   /*
>    * csid_set_clock_rates - Calculate and set clock rates on CSID module
>    * @csiphy: CSID device
>    */
>   static int csid_set_clock_rates(struct csid_device *csid)
>   {
>   	struct device *dev = csid->camss->dev;
> +	struct csiphy_device *csiphy = &csid->camss->csiphy[csid->phy.csiphy_id];

The PHY indices are not necessarily contiguous on some platforms, such 
as Hamoa or Purwa.

For example, on Hamoa, we have csiphy0, csiphy1, csiphy2, and csiphy4. 
Using csiphy->id directly would lead to an array out-of-bounds access.

Thanks,
Wenmeng
> +	struct csiphy_lanes_cfg *lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>   	const struct csid_format_info *fmt;
> +
>   	s64 link_freq;
>   	int i, j;
>   	int ret;
>   


