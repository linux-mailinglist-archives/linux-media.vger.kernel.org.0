Return-Path: <linux-media+bounces-54652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMP+FsCRqWmoAAEAu9opvQ
	(envelope-from <linux-media+bounces-54652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 15:22:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C95921340A
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 15:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31124305A3DE
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 14:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D279A3A783F;
	Thu,  5 Mar 2026 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgzHtLDM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrTIrDKr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC853A6EEF
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720516; cv=none; b=iMCflhwJRugNte9yiXeSWO+1O/tRNK9fLUJ+DfP1DUhEPnGnE4zNRFmL2hDI8A7nHljKDBGjn0MH0idFfe9LOTcv2gaSXzHN6XadmBzTeggJFvoNedI5hmgcwhYYQ9vZ9qnfhJoIgARbYge5lIWcur/mN3+mIL9NcGNa4zZ6Dg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720516; c=relaxed/simple;
	bh=wd8r5uIc1SRDv6xBEhA7sLo6Np1+P4tvtporssm1mbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnW72I7UqbiOH1ZtypiJws/2mb8fk2jBRzcSCDah7VEDi2XpWkHuk0P2ThtXXtU1bkZuaDalUHNpQ0aJqOHCTtb3croSe5+eJ7i2dgwFcp6DGmb62vVKz1ndnHYpexNwuxWcnH8z57fW8gDvhVuqlRVM2zX39toayT/TIp5bGdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgzHtLDM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrTIrDKr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFp971517930
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 14:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8n5yASa6UKYdxa6WAwgbC8uy
	VQlMLNzzc/irYA5mdHc=; b=jgzHtLDMnx37FaU9EaUiO+btP1AMKHNSzsTEmFgN
	Yhd2S6BPV6kauKyn8ncNubp1uN0RTNK4giNn+aRjuzhIhDzlol+syI9aEXC+GIEJ
	K4AkXY/V4rBnrWLkilyh82nuauhtnygMYDftm4Px+ZJTzDRCw1HL4odZBvjw8DbF
	T43v1c08uKz1LjRayY5N5opOuDPumxjgJY5h0+CaV4sUd1td2N04W4RBsMYVmm2b
	Rf95jQkyHxfB8T1UnyUS4rrHN0r2IgvEOxeWpqWy+3FjDDqpAwGABtzfoXjG08PI
	DKvJOmVgdhuNhTDxj/YTBHIKuZuWWAodKPzFy/jFC0gV0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptk20b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 14:21:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso1009572085a.3
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 06:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772720513; x=1773325313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8n5yASa6UKYdxa6WAwgbC8uyVQlMLNzzc/irYA5mdHc=;
        b=IrTIrDKroI4qSIQKanP6KDmqUwkTkYms4ANSpX+pTlYtUrPoMWSjKEzAFHGwACevwG
         Er7HQYNkCQNk9iluQUeZI8GSTekthir8jF67BSnSBnFtdL9ubpxMplwaHzwxp0+g3Qk1
         mP8eWOhlwH6CmF7N06T3tzuPPY6icfS9O8qNlpBHG6WuN6Oui1KkC6P7ME/LyfkPuFYF
         nPHcV9iY3uo3pCzqj8EqJjjNFRPY2Gv2dKyGnXA0hoLJfAdCvM3Ff+Ryc8XRm23UvU51
         D37Ek51nf0QyJhXiOn8pX623so28ezVSi3VKOIl7fRbvw+rNuF7imCrF+zss0gx/m4QF
         nefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720513; x=1773325313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8n5yASa6UKYdxa6WAwgbC8uyVQlMLNzzc/irYA5mdHc=;
        b=EDzHV8APy0dIQ6W5RQo0/yAO7ln15hEp1QcRlqvysF747yg+GXI9aZGweLLitTEYxi
         q5Ba3oc2UNNsEFcPXQKJ5tGirc+HabhSlo44AIzgWsFGQULsT9Z1NAjsqdHut3ouGnPa
         qz8ikhpnZeD6zT5BQ72GkRj2cgf1k0m5YjWG84bQHZ+YNmW/+a/KL9XO6CS4eL09cujP
         Uz0ydTfOWCmUKMqp4aLM4O1zhxDy6F99rDhwSzfP+W+ie772Ac8M97qeR77eWW2JgbqK
         f3MISHwz13sRcjThpv1KsSXCaBEC2nTIfoXgDX4reJYjUCSDZ94SJi6W+F7989fNEPE6
         BeMg==
X-Forwarded-Encrypted: i=1; AJvYcCVN6Ly2pXAhYPuogwfPnueeOtV8HDcIvGYbN326naYBlUekkXPv22UDJw6KLO0+Ln+X1tWQ50HmrvUt6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOr3ecfV2SfIxcwiOeaFohBuW5iyHAg+TEhszAT4tyIazgYJmB
	tYoPB8QoHiObELm4JP6KxzthDx2iVHOBw3WMxVh1sOSaMiQ418tuovXMnTRizprP7djAdmfMMY8
	KDBeEODdAvKcOgxzGmZp7bh4HUU4BjKoneXGLVFBblmjVlpTaDsup0LWCDYbYH5/E+w==
X-Gm-Gg: ATEYQzzKNtB6thr3M3zuqmFVO1I5ZKVd/5ie/mHO6Vzx5EmUkuMzAc0z76IIeHJ0rmw
	C1bVHQnX6PlgBXVKJnR1V9wrsf25tORzB1uuaTXUBwlMVGzGWJZlKH605TEzpWm5N7BySqvDnM1
	bYbeCHYWWkTRl6mMcxp4elEKPnjhiFcXR3kmmiCHl+rNadVaE9RCQrdCuwd77LMD6/Vkd9O9UFe
	qJujWki06IxQU8x49oM+L61QSpJf+7giUFFqpm+dLyTQwG2HZrRR2txerLMhS8pbGD4uWJrC3ze
	zvYKBZUeuzn9MzfHBUyoMw9K4yGrWlvi0m/hVI3tB7/9o0FW1usxSQOjIihNYICFlIUZdmTkfw9
	41z/cwA79Mg/lhAMm7WKSPQO1+eTPCr+Yu1cQdxjIv1+KzIXTWb3JG2utffiz9gp9DUZw4vb3b2
	N4suDGNGWCxEB4dfzjjjjbB8lw8GDF/zeDYNg=
X-Received: by 2002:a05:620a:4495:b0:8c6:ca30:fbe9 with SMTP id af79cd13be357-8cd5aec376fmr698519385a.15.1772720512504;
        Thu, 05 Mar 2026 06:21:52 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:8c6:ca30:fbe9 with SMTP id af79cd13be357-8cd5aec376fmr698513985a.15.1772720511878;
        Thu, 05 Mar 2026 06:21:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a135678c75sm226867e87.20.2026.03.05.06.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:21:51 -0800 (PST)
Date: Thu, 5 Mar 2026 16:21:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 4/7] media: iris: add context bank devices using
 iommu-map
Message-ID: <mqyg7cebyahkrngvnxcrenkdd3dybpnkecago4lqonfwqzize7@yawbtcsli3vi>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-4-850043ac3933@oss.qualcomm.com>
 <rzi7qmzsofocwcqxhsqz3f3tl4ahqnwn34of6qcc54odpben5d@7okuqabxgdqh>
 <e12da06d-cad5-4967-af07-64c7c6e540f4@oss.qualcomm.com>
 <vi5v5bczg2wx2adfpr6ppqcad76oecitoyc7zd2i4lahla4buw@mqnppboxcyrs>
 <6553cfcb-9399-4d17-a529-b07b421ed7e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6553cfcb-9399-4d17-a529-b07b421ed7e8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNCBTYWx0ZWRfXzu3PFQEodv1Z
 vbBE4G5yoYcopaZb1zqz06ITPm8bwDQXg3F0sonJCfFJVSRibC0TAQkf+yXEVFYnYhUWx6+D7Uh
 g4BmnPDqS+SfNZYkLmcBbwB1wOI59wOdO2vCfhGJbjZctQo1yZ5xEcrbYqWx37Sd0KAo4hYc1+k
 jpc0TY46f/qRWs6i3ffCwF05H6e6c12mG9v+TjQ/vgWuAL7+oJV4G1QLNZJNwrdf0kAJGx9bh7u
 K6mdpm80cziXRQQWePnhd+snUUR3r0Ejy1NxcoYil8+guhfslmAgZzYKS4LZObEwGHlZoEo/MGZ
 UypAJjw1msamwGyRCaKQM7Tzqk+9nif1sMWLI51jLscj2dXu95u/4+3+T3S+g+nptE2ZHBZledn
 HTNWyXQziEnXGhjPPw8mYdPjDAL3eyn8bQphYxGBKB4qrQ/Qtst2fNiU9KTSeFuV/+JrkCA0LdJ
 cM+nanYHQHGMza9Ce8A==
X-Proofpoint-ORIG-GUID: -tv73alxBzejU3gRaIp9Y9jenGlbJDa5
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a99181 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FVVa7Cb_h39M_4ok-hYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: -tv73alxBzejU3gRaIp9Y9jenGlbJDa5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050114
X-Rspamd-Queue-Id: 1C95921340A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54652-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 06:19:52PM +0530, Vikash Garodia wrote:
> 
> On 3/4/2026 3:55 AM, Dmitry Baryshkov wrote:
> > On Wed, Mar 04, 2026 at 12:16:50AM +0530, Vikash Garodia wrote:
> > > 
> > > On 2/28/2026 1:50 AM, Dmitry Baryshkov wrote:
> > > > On Fri, Feb 27, 2026 at 07:41:20PM +0530, Vikash Garodia wrote:
> > > > > Introduce different context banks(CB) and the associated buffer region.
> > > > > Different stream IDs from VPU would be associated to one of these CB.
> > > > > Multiple CBs are needed to increase the IOVA for the video usecases like
> > > > > higher concurrent sessions.
> > > > > 
> > > > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > ---
> > > > >    .../platform/qcom/iris/iris_platform_common.h      | 18 +++++++
> > > > >    drivers/media/platform/qcom/iris/iris_probe.c      | 60 ++++++++++++++++++++--
> > > > >    drivers/media/platform/qcom/iris/iris_resources.c  | 36 +++++++++++++
> > > > >    drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
> > > > >    4 files changed, 111 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > index 5a489917580eb10022fdcb52f7321a915e8b239d..03c50d6e54853fca34d7d32f65d09eb80945fcdd 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > @@ -204,6 +204,22 @@ struct icc_vote_data {
> > > > >    	u32 fps;
> > > > >    };
> > > > > +enum iris_buffer_region {
> > > > > +	IRIS_BITSTREAM_REGION		= BIT(0),
> > > > > +	IRIS_NON_PIXEL_REGION		= BIT(1),
> > > > > +	IRIS_PIXEL_REGION		= BIT(2),
> > > > > +	IRIS_SECURE_BITSTREAM_REGION	= BIT(3),
> > > > > +	IRIS_SECURE_NON_PIXEL_REGION	= BIT(4),
> > > > > +	IRIS_SECURE_PIXEL_REGION	= BIT(5),
> > > > 
> > > > Can a context bank belong to multiple regions at the same time?
> > > 
> > > yes, they would.
> > 
> > How? Each set of CBs is defined by a separate function in the DT. How
> > can CB belong to multiple regions? Could you please provide an example?
> 
> SM8550 would have same stream id for VPU hardwares (tensilica and vcodec)
> accessing bitstream and non pixel regions. Thereby non_pixel and bitstream
> regions would map to one CB.

In my opinion it means only one thing: you will have two CBs (one for
non_pixel and one for bitstream) having the same SIDs. An alternative
would be to define fallback rules (if CB foo doesn't exist, use CB bar).

> While kaanapali would have different stream id for tensilica accessing non
> pixel region and vcodec accessing bitstream region, thereby having different
> CB.
> 
> > 
> > > 
> > > > 
> > > > > +};
> > > > > +
> > > > > +struct iris_context_bank {
> > > > > +	struct device *dev;
> > > > 
> > > > Separate data and the actual device. Define a wrapper around struct
> > > > device for the actual runtime usage.
> > > 
> > > we still have to store the list of dynamically created device. Name can be
> > > used to fetch the device from the list, i think the existing approach is
> > > simpler ?
> > 
> > You don't need a list. You have an array of the size, which is known and
> > fixed. You have at most 9 functions, which means less than 9 devices.
> > 
> 
> as mentioned above, its not the same for all platforms to have one to one
> mapping between CBs and buffer region. Thereby indexing based on array would
> be an issue here
> It would end up something like this, considering [dev region] array,
> 
> SM8550
> non_pixel_device  non_pixel_region
> non_pixel_device  bitstream_region
> pixel_device      pixel_region
> 
> kaanapali
> non_pixel_device  non_pixel_region
> bitstream_device  bitstream_region
> pixel_device      pixel_region

I'm sorry, I'm not sure I follow here. Could you please explain? Maybe
by explititly mapping DT function values to iris_buffer_region values?

> 
> 
> > > 
> > > > 
> > > > > +	const char *name;
> > > > > +	const u32 f_id;
> > > > > +	const enum iris_buffer_region region;
> > > > > +};
> > > > > +
> > > > >    enum platform_pm_domain_type {
> > > > >    	IRIS_CTRL_POWER_DOMAIN,
> > > > >    	IRIS_HW_POWER_DOMAIN,
> > > > > @@ -246,6 +262,8 @@ struct iris_platform_data {
> > > > >    	u32 inst_fw_caps_enc_size;
> > > > >    	const struct tz_cp_config *tz_cp_config_data;
> > > > >    	u32 tz_cp_config_data_size;
> > > > > +	struct iris_context_bank *cb_data;
> > > > > +	u32 cb_data_size;
> > > > 
> > > > Do they differ from platform to platform?
> > > Yes
> > > 
> > > > Mark them as const, it should be data only.
> > > 
> > > cb_data_size can be marked as const
> > 
> > Why is cb_data non-const?
> 
> dev is being updated once created dynamically.

That's a bad idea. Please make the platform description constant.

-- 
With best wishes
Dmitry

