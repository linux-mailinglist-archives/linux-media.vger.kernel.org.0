Return-Path: <linux-media+bounces-52981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NLiKfd8lGkfFAIAu9opvQ
	(envelope-from <linux-media+bounces-52981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 15:36:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F92514D38C
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 15:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7E00301C949
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 14:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A50736B04D;
	Tue, 17 Feb 2026 14:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5Z+zH3g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDmJf32Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E459736AB7C
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771338981; cv=none; b=uTimm5bCaN9QoSGFwyKd6OE3dFBp9HRFdxiHSVbsuU8b0BRI+gh8JChLIHLDL3/b2v0HT4gIYQmM6uFUJEnauusg6AjKrfuDSG9LFd03jHEkIsDt7zxj9XDTw4qEJWEtAv/1xBNvtjG4LwgzKk7yWhcs62bokM5wSr6BNdv800g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771338981; c=relaxed/simple;
	bh=vqxcOwwcx7UttqakK8UD/DRJlcVdC0Tnew8a7zoT+gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJEyuYOVO+K7fUX+GS5e2xDMKFCoAienao8gznrt61fmc7dc6LzeOsj1MQY1EvOIQHyNvFmrnKNjii7cWr8Q5v+HAJQtUk+g/D9qIXF6WfJOIOxYCmWEkiuQAZLCZ0HacDd0xbxSyv/zz+wAws8sRrkcPhjUaTniRR5G9ufuuHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5Z+zH3g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDmJf32Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9Q1Ub1544917
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 14:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tMhccVFu61JlJeoDv8T4kyXC
	SoA4xV1WLyaSv7jEbCg=; b=o5Z+zH3ge8DoftYduU03EjXOrNheSDDZss9g/ACU
	BBWyHJmjPLw7gyIqumxxIE+fjkq9EHtAKiKKRwE/OY8R0ulhzu2T2tP1RovG3qDg
	6S55O3Nm4CM/MApyqEDvO7TLmsya+Ka1vs5FurPusxyuvRKTFwoK/nWrRkXIq5xl
	G204Gqo9PI2LC/pXoyeyXeR5xLlCZ9dGWS7OkA+OmmB+aKYlLACsp6UXaW4dlZEu
	uOsxvZf0O1CHEJPlACyFPCVNw9HeMzSSGi9BhZwPcuXGpH88QpQg3WB19FwJShdn
	SI+wj2cLkFABKLu6Cm6Q5qpiKwsv8acMqtIecQaOw4+nlg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajthwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 14:36:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7166a4643so2720795885a.0
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 06:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771338972; x=1771943772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tMhccVFu61JlJeoDv8T4kyXCSoA4xV1WLyaSv7jEbCg=;
        b=DDmJf32QENw0KD5YrpN0FmUpVllzOS2LS7dCWve8SnSuIPl7UI1ep2ZEsKeW57wko4
         Asvv36fvlrFNfG+g5HaSjwFrfs8J6vW+z2lUyKuI4+cLPdyqCgHtUS1dbIGBRs2tO49C
         YeCZoM7rcXmhNnN1BAotWT/W1w75gJXR+E/z6j4v/xTEuOmMIdZVrJ7VrHnrX/Lv9w8b
         Yud+NNtlmbl0Nz+Se6T6revVJLJGc2K2Ea9jAHLVy+iAU0UdfgI/TCfCXV3lZYqjwkIL
         9UERuJ1bw0M5MxA+Uh94i9OcgBsBZpQGvilcsoaM7vAt7b2W8jf4ZRoA1hwzgFkmx/rw
         FD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771338972; x=1771943772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMhccVFu61JlJeoDv8T4kyXCSoA4xV1WLyaSv7jEbCg=;
        b=jyStTWlcd29ejoGSWY8BWwKD3M4jolcVtvONWYIY9nz2UPEnIw09KPpmom3qjI7jJo
         MqNiqja8YjFMJPb7IIwwWep5Vza1sLZrTyf/K7KGv0Dqp+nV3oi7dMWPgoY0HPHredib
         fbg3Dk3vfuyIGXIPzV2qqcTe37zapeGAS0C7Rk0CAT6vHN9TBeNa5E+t2GG0124FR746
         XW7wJkSL/or7O0vP+Bvw2L80zQN5h5rC0rWckmvXpb2YEGmzdnJo4Mpy898mvojJbY/N
         BMC2W61fNiPQIfIrZCzb5xFeWLdXafgFZToX02BnpQWSMMW0uYnew7f5dKy8r/UkduGm
         kgYw==
X-Forwarded-Encrypted: i=1; AJvYcCXfpZUldIT3gzMj5wz8BiULJRIyqFqFH1D+9dYtSvqfImQzWXX+DHkp2quxYMPd5wtn9znycnN3ZbILDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8HDoG55ps/M16DI6o0GY5/DaAkkFXEML4QcsK6WRnHiVl2EY3
	MAEyHE74wBrQGZaOmmZ8UI90sgIGuqTgb2Hw7e06hHBhHCEY85xBCJuwhCRUn8EhLkQX5R7XYcm
	Pf7Deh5Vp9+2grjpuYF/Md+Qimge/3Nlk1O5F+QTxHvPhKSFFCizm7yMjTCXTB6OTDA==
X-Gm-Gg: AZuq6aKoxvvQsZuSWuyulSj2MIAU8U71i8ODsX26uqFlf941Yu5yh5nC/FRwp5G5BkA
	nINVJSqbnUj/As+ZyuTTymSoJLfFxLBXllkfFNiXcQ6SOoUqS+VH+b6TsDBB6jMjYZZV6O1RUPB
	k7jekH53L+ZRVyW6jUQwrlkfCSYFk04qEih3Wq04klpMF/L/d2Sk+kqwt7rwvfvKGc5/zMvVsFi
	YL2ZzvFvnGmQyMF0BRlXcSFGTFM54yHvmaDuxhuF/9p4jR0Ww5SqmQkH6nKjZR7ukZIQWHZxiz/
	5hNstTQmsUCIFkczdJpDmpB3ymu/Q7WnA5Nkl23CZSXteStcn0nGlySiHp1GSVmlJu6HBlAW3Fe
	EPwJTbgfzK5W2Fq38+IpcVrsW/QzHeNAwql1zHE+5R0ZYRBCuvX5f4y+MHylNU1p2S84i56vlaX
	tRY8HMt4AHO7aJY6BheBBkuZZPWfCGuoO26Uk=
X-Received: by 2002:a05:620a:404b:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8cb4224b6f8mr1589788485a.16.1771338971811;
        Tue, 17 Feb 2026 06:36:11 -0800 (PST)
X-Received: by 2002:a05:620a:404b:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8cb4224b6f8mr1589783285a.16.1771338971237;
        Tue, 17 Feb 2026 06:36:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5ac180sm3850704e87.63.2026.02.17.06.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 06:36:10 -0800 (PST)
Date: Tue, 17 Feb 2026 16:36:08 +0200
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
Subject: Re: [PATCH 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <dhcsnc6y2r2bcjlc54ebo2hakc4tufub6f4oluqq6etjzdlas2@ggwzwoz24kjc>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
 <r642meaclfme7thmb6spkna6xiuhbjuqw6x32jndjqhwqjtbbr@qkcziz3cyxb6>
 <b5ac0ab7-2540-4691-99b8-18d67ac63717@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5ac0ab7-2540-4691-99b8-18d67ac63717@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExNiBTYWx0ZWRfXx5G3n2wVUQkr
 YY5GLRJBKqrV6H/rumHRbAdNjSXb3JotoOVXRi0sEEarFLNhVVfMdZRQHNEhCM2g3J6s8SOHqhL
 kH6QyqZsqwalot0/w/JTDDqc+2fxP4xOiUkrpBRcCE5HsVtYir6oMCPIqhLvhGNCUXcq2YB6Z2a
 jpceSm11hOVLOBKLOP/clEJMEWxw7VKh7Rj1zP3EGutV7QXoyYB8wjf+FYEo+D993CjSZHv0iJr
 sO+Cdx0CSTCM/m/kIm0KF2civ+yCjr6fYjuPm344LS7rdM2ROQfOyC+sh8Xl2TFUVqT+wu5gKxH
 KiHvnHAVY+9DTk9K80PTGoDt3YkbYCjJ/MnXL/GESt9TUC9WpaMjslbB/bpnUSKujN6ysrY/goC
 TAmbvxYsp+xZyaEm3GC/E2TcgG6jSWL4Lb+yGpYSiRdIteSRHaFlWNpD/GiX800YxHNEdFRFpLl
 BQgBINx40VH0dWnW1rg==
X-Proofpoint-ORIG-GUID: G70jzp9HVFoS945gpZlkyhZf86PwTHtV
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=69947cdc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=W_8qG7m2_GW5Dq_Wf0QA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: G70jzp9HVFoS945gpZlkyhZf86PwTHtV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52981-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F92514D38C
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 07:13:39PM +0530, Vikash Garodia wrote:
> 
> On 1/27/2026 8:39 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 26, 2026 at 05:55:44PM +0530, Vikash Garodia wrote:
> > > Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> > > compared to previous generation, iris3x, it has,
> > > - separate power domains for stream and pixel processing hardware blocks
> > >    (bse and vpp).
> > > - additional power domain for apv codec.
> > > - power domains for individual pipes (VPPx).
> > > - different clocks and reset lines.
> > > 
> > > iommu-map include all the different stream-ids which can be possibly
> > > generated by vpu4 hardware.
> > 
> > It's not how it can be defined.
> 
> Do you mean to elaborate the different entries within iommu-map or to
> elaborate the different stream ids and how they are grouped into different
> functions ?

The comment was sent three weeks ago.

> 
> > 
> > > 
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
> > >   1 file changed, 234 insertions(+)
> > > 
> > > +
> > > +  iommu-map: true
> > 
> > This is totally underspecifified.
> 
> oneof would be a better approach describing the possible stream-ids.

oneOf of what? It is items with the definition of each item.

> 
> > 
> > > +
> > > +  memory-region:
> > > +    maxItems: 1
> > > +
> > 
> > > +
> > > +        iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
> > > +                    <0x100 &apps_smmu 0x1a20 0x0 0x1>,
> > > +                    <0x100 &apps_smmu 0x1944 0x0 0x1>,
> > > +                    <0x101 &apps_smmu 0x1943 0x0 0x1>,
> > > +                    <0x200 &apps_smmu 0x1941 0x0 0x1>,
> > > +                    <0x200 &apps_smmu 0x1a21 0x0 0x1>,
> > > +                    <0x201 &apps_smmu 0x1945 0x0 0x1>,
> > > +                    <0x202 &apps_smmu 0x1946 0x0 0x1>,
> > > +                    <0x300 &apps_smmu 0x1a22 0x0 0x1>;
> > 
> > #define the functions in the ABI, provide them in the bindings.
> 
> Ack. will introduce a new header at [1] and define these functions
> 
> [1] https://github.com/torvalds/linux/tree/master/include/dt-bindings/media
> 
> Regards,
> Vikash
> 
> > 
> > > +
> > 
> 

-- 
With best wishes
Dmitry

