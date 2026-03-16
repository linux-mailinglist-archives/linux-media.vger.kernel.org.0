Return-Path: <linux-media+bounces-55838-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH8GONJtt2l+RAEAu9opvQ
	(envelope-from <linux-media+bounces-55838-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 03:41:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B2C294334
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 03:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94BC9301FF9B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1899E29BD90;
	Mon, 16 Mar 2026 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMy8wOos";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xb4UkPBh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865A5289358
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628838; cv=none; b=BpESh9tKEMzgMFfg7N0rPIa8ZG3Q6cvqX60g4oV0nf7vLxMvF+T/FcaF8R57MPDJXqD1IDrTVHtE5a4jHJ7Sh250+9NQQ1VJMqzf3HVVYjDUu3g77qCgtl2DJkscxZyTCZafmD/6ws8UWwj6rXtmiSKKWySe4YEHi0P5lOb280Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628838; c=relaxed/simple;
	bh=vPO92Ia/yLV+3oDlLavvw7vih1R9AqXGrqeb7MQfF2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVaysSi5M1LFyyju4UaMig6kxFwLxIN7Yh15RqULTz0xxX18oY6w/6U8Er89mSbpG6Dp/wJRaZlyq/AXblm5D60+mFyUyzFq78gzQameoMOSGbdRwPIrgA4WfBs2PiDX4TV5qUTC+TkV2fzmhc9qvyY+87Z/P6lscDQhw2LTCqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMy8wOos; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xb4UkPBh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62F9tr7u2994269
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cooflrjk5WASfitMN7XwdGXE
	Z+8BtZFRRkGUiUr4HJ8=; b=TMy8wOoskUcY/01XjbFPE7gI3zE4pCn0igJcZlIs
	WtkKVbNYYdJQ4mppdWiNC4hhg8+mqmE0sDqOmQCp8H42t0hZ/WNEQh4amgxbVv5l
	sQ8rT2kbXUavwvEpIdfLYHtIjqfKkFXA89FTHQIjkHaD193azRUR4Wwcb6DLMA96
	qdlfEFbaO8MZ9H2IpG1K8HRSkcGchpvpDxQXJ1/vGvm/pK84RuWIJw5fjYRXdTJ2
	cPvb75KNjz8lWN1b4XZyCqn41sXZ61jKO85AAWnHMGwOeFW+wJYIJ9lufkOvSRck
	+dlb+vL7dVl5DC0nNSwmwEpireoWO0MDiddy+SmZxeFCDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc3rex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:40:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd849cd562so2795550385a.0
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 19:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773628836; x=1774233636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cooflrjk5WASfitMN7XwdGXEZ+8BtZFRRkGUiUr4HJ8=;
        b=Xb4UkPBhGipex8qrhzUb+p/jGa9qTmLblbAXUxoDoaw1JqkE7KBjEM5ntPrlPBZjDZ
         IT+1LvG0rpdR5fvkO4PrUinWWa965BihbgLncK3gdyhIx1Iwt1Qet7WT65/SoalvNbLz
         MHOcktaNH4ysUf2oDPcF+gANb//EqjE/dWeyv5aCwNVA83TWp4XNyD3eZ680xZmE20Mb
         hf6eI+Q1BqVQzal6FKXqCypqd8GpX2SouWTJVx8c346bCyq8ab41u/P/dMlLVgeRBYzD
         ONrZif/Q7E2xJf+CDEJxpscd63vyTDConNdQsDJjmHt+Ls6QlM7Pnv6hmShGtIOa8MsT
         5/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773628836; x=1774233636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cooflrjk5WASfitMN7XwdGXEZ+8BtZFRRkGUiUr4HJ8=;
        b=AguJyu2HL7m4fEpq3hwc9pCVCJcxx2XDSr059VgNe6ldn9tK0ozfp2VUNUVxvE71RQ
         wsGAtR/5F0nv8631n5F2znVGiNuPCi/GBTZaco6TerZAGoJ7NRkuREFU6C+qN3l8Sgmd
         sKulZR/htEh8Dz2kBcV+hQSmC6gaNgG3yssThuG5pCkggxSorQQNtPTSHO5EO5++zADW
         xSYTfsvnawgq5YCg6nN0TJHxZGNEzmu9Z4/xwqx3R6ITSMr8CuVy1DMAObl6m1lxlAnW
         S1jo5ZClJELfVVVxdRikIQVXRmzuHpbsaYApcnr4hx4DVWA2GyVWuRiosQaKwYoNNm+2
         jqWA==
X-Forwarded-Encrypted: i=1; AJvYcCWNFJUTs3FAmEJ4OMniwgQN/wNYpzMMiYX5scRVKbMz4aEeLtMvpYoyIL2jCKOOBRNdpda7MZSbr5+3AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylyKOazSlA/Engq+wT6SnkuvzuB7Pxp4WngPmKJR5HXAMZTvru
	bkyO6oS5LK8UhnUiYgAf8/XuthpAnwdu79zpAKjEZnyT7lrptmkFRW/LX+10O+TQBRo2RNifUlb
	0Pg30WfWaSRfg9Knj1JnIXPy/a2XD+KWNgFNpqFGTW14nDQCmDDQ3/DCUq/AsQbTYfg==
X-Gm-Gg: ATEYQzz/Thiw3D2Qk9/7/1/03j7kIQm14AIyFLcGmCEDIDz8bOr/B5o/+Lo7V5T96bA
	ThLe7G8IxiLGwwOHx//FBJcWhkFJIc4cXH14IX6VtFrP2CHwA8mvCvkVMqbH8WoRxkTxF2PkIkC
	RWE6nL4rT/NXiWpTw1/L0kGeg+e+m18j67xjFBnYHijI4/t5nxCytwL+p3VFv1n6mAjFItPmRqe
	npQIU8sCE/GJ2H80NZvTQTrPX9X5aVt+ku4Wo9Eb6QCN5gbmp7XmpJSm2Ct6M52O4AoJQ0sLdUg
	THJguGnIM0dvZdi/pULRIkmBWpTj9GOhrD7zamsQLh2ohFPzYAH/p1kTHg8Dq462GLsKWPVxpN9
	V1bbbo/9M7epFndUJlwIcTPyk19R7GiritopbUJv8gH9bz5azzEHi7mjAB90nwTnDazvo3Qp9Hx
	x/07GThR0XPpjVVcFLRzviCuMnmvyGEPyF4yc=
X-Received: by 2002:a05:620a:4096:b0:8ca:4288:b158 with SMTP id af79cd13be357-8cdb5b5aef8mr1476166185a.43.1773628835394;
        Sun, 15 Mar 2026 19:40:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4096:b0:8ca:4288:b158 with SMTP id af79cd13be357-8cdb5b5aef8mr1476163585a.43.1773628834787;
        Sun, 15 Mar 2026 19:40:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366676sm3137356e87.71.2026.03.15.19.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:40:32 -0700 (PDT)
Date: Mon, 16 Mar 2026 04:40:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Message-ID: <jfaaykvuueentwpyq6c7rzu7uza7daz5tyf54zobximpflcude@6uhpcdl3emjm>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
 <6a25af47-1593-4d2d-b72a-38a68f76ead6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a25af47-1593-4d2d-b72a-38a68f76ead6@linaro.org>
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b76da4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=fU1sBuitqkfhUO8brV4A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MwvpWq0BB4mF1TlGenTuxwd5azMsbkmN
X-Proofpoint-ORIG-GUID: MwvpWq0BB4mF1TlGenTuxwd5azMsbkmN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMCBTYWx0ZWRfX2NKW5ECsgOiX
 8OO8gFVcRguljYE6Ut0mc4nfoYebt5exeAEmdykndj4X566Ln99PJ8GWPLLN1txFqnGZffq/t8a
 FhJZ8nn/zXKrVrNvEfHAXydBR5Na3gaC+O8Zatq9tf+SvNfWZFYlI4q3QpoI6bGzHx+jZi1OOC+
 /jC+gr33Z5wb74VVrmxzGgFqx2bFkEQGDmg3FMMqJf03+p53CYEOC3zL7WFq7veM/a57WuAxNBP
 zj4dMizRX7vdUdT6yTAY2626IgHCXToboGEyFfAzlDULH3m9L6BxmfI6NjPh6lbGKfQLOwup/4l
 w6ejHllDoIst7d81ksJv6qufwCe1lICzBK6E2qMDayMZjIH79xxrbMCSpuXcwNZz0yS2tV8QcYc
 KpYkyzM9gPKjWL0pQBZPb70UhugNqX99ZvwIufJh9N4uGOFmol4Jye/Oytd6nD/PIIgPhuCV2mX
 8U5gpJdlF2esb7sLBJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160020
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55838-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83B2C294334
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:07:43AM +0200, Vladimir Zapolskiy wrote:
> On 3/16/26 03:02, Bryan O'Donoghue wrote:
> > Add optional PHY handle definitions. This will allow for supporting both
> > legacy PHY definitions as well as supporting the optional new handle based
> > approach.
> > 
> > Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
> > its own individual rails. The old binding is still valid but with
> > individual nodes we define the rails in the CSIPHY sub-nodes.
> 
> The new proposed CSIPHY device tree nodes should be outside of CAMSS
> device tree node.

Why?

> 
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >   .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
> >   1 file changed, 31 insertions(+), 2 deletions(-)
> > 
-- 
With best wishes
Dmitry

