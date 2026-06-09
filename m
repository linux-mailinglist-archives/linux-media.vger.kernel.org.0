Return-Path: <linux-media+bounces-64287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SLcjKt3kJ2r/4AIAu9opvQ
	(envelope-from <linux-media+bounces-64287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 12:03:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC27B65EAE8
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 12:03:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N3wuP7ik;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=clowVXH5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64287-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64287-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7917B305F584
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 09:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234C13E2750;
	Tue,  9 Jun 2026 09:59:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9D7226CFE
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 09:59:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999181; cv=none; b=lIQXhJ49UNRGGD+f8RtpkHX0zCVxQnxz8/v0XppwNweLt8BUBoHzKXDevqivU6BjK5YKKIW9iYRXDB63vee98ug6WsMc1xjobk1dEOckY8Onjuc6qI2LEBgzbOoZwWH3gpz1HZR70Fj2kLq+2ZyeTP6BjJ7J1LroyOoCl14f/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999181; c=relaxed/simple;
	bh=BnrDNf0KyblpDzK8RL0uKrkJf8wwscJiCPoMZoRQgEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ih8QyWfCTxOSw3aGYzW/Warw0N8WMSCm1yM9ozfTFUZNbCbGaEwZsVOCYRpL4/mY42rQLdABmceZLKoK6ytNLnA6GB66zH+Xq3Xq/R/e1fGhWSX+/2p5dGaR9olJkW/OWAXI4gLJLeBKf+M4SYTzQuS6DRUPhC18L+HDx8WQbc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3wuP7ik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clowVXH5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vD8u1868523
	for <linux-media@vger.kernel.org>; Tue, 9 Jun 2026 09:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCRCXBCvtK+g4473pmA8flE8eK+i+w67FZXpAsMZxKU=; b=N3wuP7ikpeNn4yvM
	y0oN9DfEotLoUMt6HJ06o0iGXDd2nxVSW9XV2lyETljaSvQHNfxD1LXoxl8yrPH9
	LxbygrHDj8/PF15RlitMEZ1bUu3Bhgu3g+BvhoQkWPtJ4i4AhvSXa2dsKz/IWs7Q
	mm8L8krl5fb1UfTQAdtgeBlR1wRIiJLJDwcUYWMgCef83GLrn6M8WCR1U9QUrenw
	6YATZ5yWxMq8V2QB6zcZAnGLyIbsorNC4OITD4sy5mVC/pWzx4yb3eJlfhIi6TpZ
	5l2llhF+aa0NshNZeKbRymhbkg7IeLn6EvLAW2k7rkaK/sYy7quGALY/DWjNl/yf
	GPg3Wg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wg4xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 09:59:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf004bf8beso63610165ad.3
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780999179; x=1781603979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mCRCXBCvtK+g4473pmA8flE8eK+i+w67FZXpAsMZxKU=;
        b=clowVXH57ZBdSIp0ThuvUqp5FpAZ3Yl4Ad5X9zGU5UIflU1h8/sxTGWxEI2GQHWaIl
         wD3yYsqU9cSJTSu2ZxwsjZ52lHYwg4Bj9oVnaa36XPJclPetFYsKom1isHljVRHlRFPt
         k8h8d81Ox1aQ/FRN5ftpxByVYFeIDEqxtT1lAAYKJx3GFW1FpHr8XkYhCsfaC4XclxF3
         eYBSLXeqnZCjfZRuWtnZMuzGXsON8aIK1hQF8b9jiaBoldcyZ+H6wLwU10BoVDbFZrGV
         PEnJHuhut8a2aC3vYwb1JVHsd+mIgUc2InVNgKD85ADP4cPe2jug12RXcP+0QPVG4KKQ
         ANcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999179; x=1781603979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCRCXBCvtK+g4473pmA8flE8eK+i+w67FZXpAsMZxKU=;
        b=PX1Kg1p4UawsVIOtJaJT8SSf9VUVYerGitd1EnnYa3k1QMKeb22J46GweCd1lVzQW2
         wHaxm56vYwfVd/aqEr4Z+f5L/LfMMNVMiidywbmjCCu6InpBzLU7bGJUrbnpXxlXKJml
         8yGNyiSQwARl1TvbIatt5JtqhlMe8TG5GMJBFrMLwMuJa/vYYxDOwxgXXpRSsFz0Tibw
         cMfdfid/tWRai/dqn6BbXv3oWRE4juWiAC2MaaKwxpeHq6XsG7qN3oLS2JTKy94WKlhz
         MoZd0M3bifffw7BZNtSMS9Qv7tormXNOXNcBb4vlHNAc0d9ZOZI2wqBu7bPTrkecCwBa
         xCRA==
X-Forwarded-Encrypted: i=1; AFNElJ8ysuorb4u5ZXJpPKVmexHFGeIXW4Q5+iC1E1TJs5NfkG3OWmpPDjHB7Vb0qjYlNeZlDjpA1WUIM+WOqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnX/BAPdGvFR4WmxKDv6P/F/406eG1J6+KUbm5gwOTWh6I+6On
	E8W3vgJSaKL60EaEKcP05T/r5CQLdWfB7swHyZYF0e8FgJZeW/lydmiUNOQiPHn4g1ZMkVHNdWq
	bVA5RoB2NcztFEeZ5hothqnO51eSHY2n1m72GPyeI4UjzAX77tO83E8GI/6T7/W8NxOkul8xDra
	em
X-Gm-Gg: Acq92OGEqOO9MQ2b4LXuKIO3oRbLp3xg9BjIEyCAmQEtEsg6MLl1+S6q1xUlYnA6yft
	Fd97GnSLVTyVpJ3/HIeHVKdMMAid8CRjXSwLuDKHEioep4SHZEf1tnsd68BOQC9fg6DnyFiOfQg
	7d2v811DD2DSpaEBHk+M6dlDiqkVo1wUssNiyNzpgsnt4e/SBBDFteloa/9b2ICoQElbJdHb+OW
	C7O89g6ulAJ9+FB55fAlP+oK/QEtqi5s8oaBtLlg4Z5CtTCVhU+wT48Cz0o1LzAiu1EsoPV/GxH
	hRPO7f5mxuhghpc0GTgJfU01Pi9B5Ta9VtS+ExmjVmK8cz2WkCY4/FWvEodXW110C0HnlgBgw+e
	aTejww7RLd3K2oqGRXs1Tj5IY+Q27Y+QEVen4wB/vXNcKp/nolL0DUZw2xS3Jaw==
X-Received: by 2002:a17:903:19e6:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c1e82324camr197066485ad.28.1780999179138;
        Tue, 09 Jun 2026 02:59:39 -0700 (PDT)
X-Received: by 2002:a17:903:19e6:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c1e82324camr197066175ad.28.1780999178703;
        Tue, 09 Jun 2026 02:59:38 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1663981basm205544425ad.67.2026.06.09.02.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:59:38 -0700 (PDT)
Message-ID: <399bd375-235f-43a2-965e-e86e041a5a7f@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:29:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
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
 <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MiBTYWx0ZWRfX1zquhR1CQWoe
 EqL/0lxIgqKugHWwlEgTyhK2GGKDnlOkHOUDCQlagG9rdI8reU6qCHOi+fhfqVQSy2ROxxz6MI5
 yXi2qZHMqnsdVmmrEtBjwC/TgXM4UivCzwOYBsYNtw7RWZJpOukNxIHaAJfn+Hg9pTszEsUQY6R
 5YFrl+NjR7W6Zv/J/5j/SuCvrbd84fY3ytgzSPx4HMdXnOZ8XTRsLBTIYGoezu3yRbJy2jCtTjH
 xvVdENiVE81D4I3zu6I3SlbProkmpPQNU8EsR7NTk/9BJPBwku3EJpZKh3DEXU6ZH3htcuy064J
 WP5F/CkubYD+MezIe7jb8W3ghTbSRAwYDaTXIjSKRlEsVYC5fE7Cph6UOjc4clXcLtvcVa7XSH2
 iX3V/+E7g22nXzTlgqa2DYiJHwRpA0EJ2htg458JgC9QC1m+TjeDYSBM9N+St7RdDS1A7NPuAlN
 pg64LR4IT6EfaTB2m1w==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a27e40b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Yq6uI0ozdmgzgeLbScEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: aRLVxZq8wCHrg60QWNn_3a6sSH5_ZBzq
X-Proofpoint-ORIG-GUID: aRLVxZq8wCHrg60QWNn_3a6sSH5_ZBzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64287-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
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
X-Rspamd-Queue-Id: EC27B65EAE8



On 05-06-2026 18:44, David Heidelberg wrote:
> +		offset = 1;
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +		break;
> +	default:
> +		break;
> +	}
>  
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +	for (int i = 0; i < lane_cfg->num_data; i++)
> +		lane_mask |= BIT(lane_cfg->data[i].pos + offset);
>  
>  	return lane_mask;
>  }

csiphy_get_lane_mask() uses pos + offset but the 3PH hardware encodes lanes
at pos*2 (D-PHY) or pos*2+1 (C-PHY). Fix it as:

lane_mask |= BIT((lane_cfg->data[i].pos * 2) + offset);

>  static bool csiphy_is_gen2(u32 version)
>  {
>  	bool ret = false;
>  
> @@ -1155,19 +1165,32 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	struct csiphy_device_regs *regs = csiphy->regs;
>  	u8 settle_cnt;
>  	u8 val;
>  	int i;
>  
>  	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>  
> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i = 0; i < c->num_data; i++)
> -		val |= BIT(c->data[i].pos * 2);
> +	val = 0;
> +
> +	switch (c->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT((c->data[i].pos * 2) + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT(c->data[i].pos * 2);
> +		break;
> +	default:
> +		WARN_ONCE(1, "Unsupported bus type %d!\n", c->phy_cfg);
> +	}

Also, with above fix in place, lanes_enable() can reuse csiphy_get_lane_mask()
instead of open-coding the same logic.

---
Regards,
Nihal Kumar Gupta


