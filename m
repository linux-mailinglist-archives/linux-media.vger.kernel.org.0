Return-Path: <linux-media+bounces-55735-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEwNAj42tGnTiwAAu9opvQ
	(envelope-from <linux-media+bounces-55735-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:07:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0352286AC4
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D301300FEDE
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C643C3459;
	Fri, 13 Mar 2026 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZZGgaUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7+xhGDE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FF437999C
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417885; cv=none; b=qRyase472+Nb0yOSQ52UhhUMEkFq966XbrgcTp1QsDkNyV/24acV5Vvn3Egk6l2D/hDzs9pP3EsnQEvHUeG5OEZn5XDgkF9XROdCnRbpXnkPksNyGQVor2ySHdjyDIwurNUU7z2tWEZwXzEEEcNvD9VuGGR5FOmD8yYqNKOfy7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417885; c=relaxed/simple;
	bh=7P/LGnrzlcf+ncZgnJDmoHmIzeRUpfbec/4IBxdG00A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmVLBeM6iWnEhGUo1/JmTesGtF+7azdkxLkoXU3N0+PeRKNAeTMaK9BLSjRcRCka/4vxvhQ5jRfw/ibu+fYt+Y9l1NxgcHxlmDKlH01kh7DNRjR1ekyF8CfMMpzBQs+QAG4dhtb5w1wjBJJ72XGQl61uWcb5YRZsFe1PKT5838M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZZGgaUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7+xhGDE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXTsg437990
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 16:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S1uRwswWPnLjkN9TXw+Pkw6e
	zGkkk5Xu+OFx3pwXDZQ=; b=VZZGgaULrP9hRAoWXL8/528xfMR0U49j+3U1bZQo
	Tfd6Vz0tGka9I8Srf/VMcRxLCoTHIN/wcicEJyKCit99t88UY5io7Wr+MFuH4m8P
	JSiRlSPuufvKKBKmMtxUSGNo4biV+bg5PE7wxT3VemLY6gIXGB9YsGCWKtA/Okjh
	WI8ExUQ7u9oELXA6ezBLiNSJKpAr1yUGbJeYlqe2ijZRfQTN5x8TKgm3nFfC5XS6
	lyToKS8GwmLmwUDu5g5+eBaYqThu8u2dnkjlXTrmbeuQBwrp0UIY6X0hbEMbDJTY
	HcSYKWmFa9VfiB6I7EGCVRsu8780cRohzYk/WN98kpMmiQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax83je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 16:04:43 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56b178796b1so3233706e0c.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773417883; x=1774022683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S1uRwswWPnLjkN9TXw+Pkw6ezGkkk5Xu+OFx3pwXDZQ=;
        b=c7+xhGDE7EeSOOM8yZg60IVz4aPNrDAe24TVzPU5RO9SneePiZu1xOYBv498F4DD1T
         bEr8bPG2RhckAetti8XSpnAQUmhbBqo9P+DrxGVT+LknTD6M7JoI4ErIWHXsGKlX3lLK
         GCqijxZOFfYFRA97UciPz9qtKs5O6hUdUjqs7diLx/usp5morZTrvd343ZV4/q9Dy+zb
         gFnC8jUMOPkj/dAyjGlWOese5oob2Z+D4E303Hn952HyNHY9T4kj1s1fACufMJdErWfy
         zrYcqE6VCA4Ta5kO1d3lfqp6TZewBo4NrgmDskQG47osCBJhE/oH5+/2mmzb6tG17mFC
         b1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417883; x=1774022683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1uRwswWPnLjkN9TXw+Pkw6ezGkkk5Xu+OFx3pwXDZQ=;
        b=dpGLU74GR+2JEpwle9szD4pGnDMPzK3aFPXlRyluXsjHRvWJz1id5IZrSZBWoAl4XE
         WWdlrdfdV1DQF5H1AUtT70EQsL+xW7l6kZ42suq+C4zdhSSNvsReVMyVksUdfeiG02aU
         /DKO8/HoBw2FzbrGpc60cHkugQvldTIYEZ4W+g98j33yCy8sau4xOLsm/9EIPro2HSgp
         d8lA3Ax2WR/7Y+MmaS7Mu4H2M8uCJQf198wRcdumgkX1Eq+RkwdVqIaWOWhK3wKHVelo
         jo3o366k6csf6Mh7VC8cksbz8i554dowW8VJhAgdFS/TDRzdqxZFwLOqh1E1LkiReC7u
         BHOA==
X-Forwarded-Encrypted: i=1; AJvYcCWU3MyQ1tvp1JA/Gq8W9oM3ssVOfWysO5vWAdvfQUHJDyDsv8f5GLd9iko0dcHR4mveCi8RJHfHLSxwDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLwvc4/swpvnouUbXvAMsQHJskVg2UohBe3Gx1PHN0pbz2bOp1
	VTNXZsMDnsEugA/BWr3aHDKcbiv2h8/5N8R5AbT2Db/d0YJdi0ywKg40PyOy4gVtKjQWEh04Jb7
	KsXzYp0fJtzJfO1G1mkl9nBKginUjFmXWm8shKnc7SvEJnG5/rJUjd0koBvDd6XtlYA==
X-Gm-Gg: ATEYQzyyyj6QOiBMG4WwQc/DwtOp1qOqpr+OcYggM+b1nBADx7KxUiTZ8ZOGud9hSTI
	gpPvSDlLBvF052zC3tAb9pDTcLedEcA2kWvXAe/4r/BGp85rcGbBMlDwSEnip2AEPvsat/8D/eS
	+rOFVg30ReoI0EqW8YJhfXwI3dKRMg8qsJldjzB48GAqQUG7kehH2zM+9AuwmJv668tVgD8Flgt
	nFLS5KbDeW2Q85kTK8iBY7e0UBW+BDRAOoTWtVRaYEZ9YO5m7ADz9sieICHrpldpYGEmQQnSd8r
	gYdpQ4Q8eblG6t6FYXn7uTe9HlgUC1L67jWYO2GcRPHKie0394JwM3QF/yrS+A0f5D2cfk9TaBA
	PysfP+B0WA8aDJGme/LMzjoRDMSxljTnLY+rgpvaobdxUGW2LeFyxnuYCbGTW+Du8C8bUnm2pIk
	nAKBY5FyjIfcIGVvqV7qXHKiS8M5PKI9sdqaI=
X-Received: by 2002:a05:6122:2a4e:b0:563:72d8:ea6 with SMTP id 71dfb90a1353d-56b6291dc05mr1457169e0c.10.1773417883029;
        Fri, 13 Mar 2026 09:04:43 -0700 (PDT)
X-Received: by 2002:a05:6122:2a4e:b0:563:72d8:ea6 with SMTP id 71dfb90a1353d-56b6291dc05mr1457109e0c.10.1773417882418;
        Fri, 13 Mar 2026 09:04:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67da99a8sm15093941fa.16.2026.03.13.09.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:04:41 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:04:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Message-ID: <o42v2o3y7e4o3y32br2jriw5m6w627oftc3jf4jbvmqdq4dat2@qzl3tvl655hc>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <20260312-iris-sc8280xp-v4-1-a047ef1e3c7d@oss.qualcomm.com>
 <20260313-resourceful-saluki-from-sirius-f4e1be@quoll>
 <ksk3hjyauhbzvytvch2xip7kusuicnatbw4xlmg7wtfiyatzpv@y5q7xjvl7esf>
 <341cc7b5-0566-4fa1-b710-c486f318a7e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <341cc7b5-0566-4fa1-b710-c486f318a7e8@kernel.org>
X-Proofpoint-GUID: f46Kdfp3GooPn_G5Pub2dIGusFuW7nUq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOCBTYWx0ZWRfX1ZkAkdAXZQNi
 p1emtqHAbyxDGHwnezS8e3pJiPvEbdIUfuPMq18Yvm06SHJ0hoAIBchaIPyX/UNfhVPn0Qg9IKD
 w6NEYyVw0dTa22/YcLsr9XVjnrqx2uuDcYKukuIcEDJF9a20MciK9w08IaarpdnndcyScSNVfa8
 TSoeJo1mPnYHM09Hm5FGZuz+0CKvQyw73uEREoyHY0xA00tVa18prAeAPY4JjGCLO19vcsdxFhl
 NZ7Av5dJbFD2d6IKKjlm5A8LRAxuG/kxbCVD1n/zuXYCQyo/OfT1ZwNgvQs7VwA/Y3IK0wyAe0z
 gXkQ40Zcpzyx7Ik1pCy3PLeTh7wKkuYLdkLa5LqDbguNFBw9eNXGG2DE9dYJcT17ZIx279d4mB7
 IpZKNezkPEprRaRcs1rFwq96rUHWF2MkwnBKP6ZYBVwio32n5yfrRLKtH3KIrHZXz14hrOPkK/n
 7hcS8A2FwN2IL5LYR2A==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b4359b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=i44zYNsDSadjnJfJDeEA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: f46Kdfp3GooPn_G5Pub2dIGusFuW7nUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130128
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55735-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0352286AC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 09:25:14AM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2026 09:14, Dmitry Baryshkov wrote:
> > On Fri, Mar 13, 2026 at 08:55:00AM +0100, Krzysztof Kozlowski wrote:
> >> On Thu, Mar 12, 2026 at 05:14:22PM +0200, Dmitry Baryshkov wrote:
> >>> The Iris block on SM8350 and SC8280XP is compatible with the Iris
> >>> (Venus) on SM8250. Document those two IP cores, using qcom,sm8250-venus
> >>> as a fallback compatible.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 10 ++++++++--
> >>>  1 file changed, 8 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> >>> index 43a10d9f664e..3700f8fe91cc 100644
> >>> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> >>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> >>> @@ -10,7 +10,7 @@ maintainers:
> >>>    - Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >>>  
> >>>  description: |
> >>> -  The Venus IP is a video encode and decode accelerator present
> >>> +  The Iris2 IP is a video encode and decode accelerator present
> >>
> >> Why Venus name disappears? And why now this is Iris2, not Iris? It's the
> >> first time such name is used. Just call it Venus/Iris if the new devices
> >> renamed the block.
> > 
> > SM8150, SC8180X had Iris 1.xx. SM8250 and SC7280 have Iris 2.xx. But
> > when the bindings were written, it seems, it wasn't obvious (or
> > important enough). I will change this to Venus / Iris 2.xx
> 
> Then "Iris v2.xx", how we call versions of blocks in all other cases.
> The block is simply Iris, not Iris2, right?

Ack.

-- 
With best wishes
Dmitry

