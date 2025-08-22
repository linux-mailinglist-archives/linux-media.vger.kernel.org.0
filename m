Return-Path: <linux-media+bounces-40793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C49EB320AC
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 18:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA916175133
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27375307ACD;
	Fri, 22 Aug 2025 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlVSsqjN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D119223D7D4
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755880842; cv=none; b=KnMCF6XUw1FlKWprxbQtm8mQMz1VgtO80zE/1ManMG+PYxoL9c6eW4UZA58RqlY3cJ+sb3BExANej45z1yKQHLSsPqXTjyeNObO2XYId3mhFLCI0HJ5REoz0GTDJ0meuLY3ZY4r54gS7a05j67inmo79LKHwMcrQ+Ue0a/uJFTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755880842; c=relaxed/simple;
	bh=xubAxbbDRYNiZbdFeA8Ljpottt4POVcjOrKAqDCgqZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acPQlnl1ad/lzOVo1j/3/bCGqaiukF4duFdsEsPV0P5OBANR3yc7EKdkViS0PXSduiGZ31/1qlkEMsR+UBn7+eGnzyp0hLfoOT6AVkMsveT1id6bBXWOxqtfc2NaR9k5KXJDpWV6nTIiF2hw+mcEAb8m45Nk9rc8rOf0ebfoJ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlVSsqjN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UHbE027197
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 16:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UV18A0jtIPe5KheJnTPIfioZ
	/Uu+K0mhwyAiYELY2E8=; b=WlVSsqjN/iByvs9mxxiUm1dueQh5J3Cw7oS9eXIP
	0W/dJSIj2dsoiTLMZMsQYPBuEun5OYGz3onVMvsjTwu6W+yW/S/O9POArj7gUIq0
	JhM8UcEMkuWYHckel9fruqDOBjtiRDlPSFUB0kWjgUGMq6iGIVkZ07RDAzH2UQps
	oG255dFhH+Fi2E7QFD16z40TOL5AhpR8YDF0bgV1hHGQlkelu0d4yB62fSZFsz0B
	Gl2iPE2dUSUeS5pcfuIVwCdoQ8vC1UVi5DuJ43I/1pysbxHkfVfiBTXPV90ho1h2
	7fsZaqMOSXj5a4WVV7DVaFSkbZEXpGMseXxKOo92WRLTAQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5299wke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 16:40:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b471758845dso2092598a12.3
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 09:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755880839; x=1756485639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UV18A0jtIPe5KheJnTPIfioZ/Uu+K0mhwyAiYELY2E8=;
        b=qpZtD2DJ9YEVfFEc6g3+o0zfqOpDMhB9XOr8WNkqzAwMLv4RzjpBNrNgJZkq/FbEdB
         O8i1I3KG3lGXR6S88PdHRdMqyO/dFmXO33b2fXgU2EABk+HKJ9zjDzlS8zyixHtuSTMo
         rqmISWzuelF9O43YBE/fpnSV6amn4STsryRfkUF0AiFvoQG9WHpCerTQDVAa38apxWnE
         xTzSGmpcpEHkAC73GyrEjxCEbn4z7GYiY7KiH7NgFbHA/bMP8dP9DNOYqEzS1KXsKIfA
         2JEbjbeEY4tjVTjSn3tZP+OcrSnfcNdT28yld96nGTUFBowxFgs4v3BtAdBbU5cCmwTf
         i74A==
X-Forwarded-Encrypted: i=1; AJvYcCUrub3cVMgA05whOWXUe8FkwvmruqQV9Ocv+qBKuKTdkcOqqPI4E+TtROX+DFWTsBWiBKsoalBCuM4R9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlk3lWEwJ+QUbBhpM5mU7e1eZ2IJxpiO5HsM62VksBEiX9n4zL
	ie+N7imFUl/Q2Qm/dc1IgdbO4EwkKioTrQpdFR1/pJHKnELM8EPSfzt/zzdnCCEdMVs2bP46ijj
	xaogKf5HxP1xiCxsFe667crgPd6ta+8TvfdF6tyaRuVAXK/EtO1ow1KEtXpOTnR8b7g==
X-Gm-Gg: ASbGncuX4BPvy5TJ3xe8ttpRzdv8kmpDuAHhpxgKpBtsjL8t56w327DvVzfJgpsolKj
	9BBkdrAsZoL2zjiBWRQvaw8DGYgT8RTYgIR7E9ko2IsalUnl26AyQmP6/XP4Ne/lgsv6t4HHgp+
	5wLmSWP27DEPzpJg43rwHGrtNfVE6+OyXtH3HlLtXwlxLFiH2u9brRG8qsJgxpL0hdSTlpqc5yt
	iN1HHb+YIshZ2c13zeyv0mwnarj0fd3rTIx2gza/ayNFARgKxrCO8P4Ap4rUm2uhTMMIqCObQze
	6W3c2J6EtKuLQStMfoT3OFqGlN0fjn+49KDU2JMwGaop4lGf09DneY3Q4P2qJ43oehw=
X-Received: by 2002:a17:902:dac8:b0:234:f4da:7ecf with SMTP id d9443c01a7336-2462edeec65mr49684165ad.8.1755880838803;
        Fri, 22 Aug 2025 09:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBxORcblFYIMB3vXkJZZK8X/Eo5uICk0ZWAnhXTZSCDRjX9ONjWZvDSODHd560pcHI6HYGmg==
X-Received: by 2002:a17:902:dac8:b0:234:f4da:7ecf with SMTP id d9443c01a7336-2462edeec65mr49683865ad.8.1755880838296;
        Fri, 22 Aug 2025 09:40:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32549fe6654sm350664a91.3.2025.08.22.09.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 09:40:37 -0700 (PDT)
Date: Fri, 22 Aug 2025 22:10:30 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
 <aKiaKwkpdKHSH9YS@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKiaKwkpdKHSH9YS@linaro.org>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a89d87 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=Ut50iLFDtCw7cpum4CUA:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: exkVI3g8mUeR2mUH1zzHYUsx1u1OfQGk
X-Proofpoint-GUID: exkVI3g8mUeR2mUH1zzHYUsx1u1OfQGk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxT9XHTE9T7ls
 CYyd0OyOACsKehAac98ec/4hAdToR2LCyTaCqer5qlBmMzJW77PfI3iXumsJDL0R/r1efcrO225
 KP1vK9w4ewTWMD+Nt8u/sKKZrtIxfkfBJEEs6n6udG32b16Qi5RdXeCmdtxE8KkFcz9VwYWq3II
 N6G9jUaU5Kdck8Pg4Jm8uw9KDmq3Ms9GhnzRKJWGxO6etDREw5t7IY8H5zxDolq/137b685FMXH
 ZPymv2kQf6se6xVXvbATNxk3QqeeJB4IFAFbGcsLX71CIijYKSB7GPaLn1PNE/1TBmfFTFFOgfZ
 3IlYwLkWbN962CKkPW8rRZRa1uTg00+VizRkYVNX2bcFZAxH44eMxWTOceJl73bcrS2TrHXMs5I
 7gm/I3Cx1c4QH0+z8pxTfoGrn4Jc6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 06:26:19PM +0200, Stephan Gerhold wrote:
> On Fri, Aug 22, 2025 at 08:36:11PM +0530, Mukesh Ojha wrote:
> > On Fri, Aug 22, 2025 at 10:46:20AM +0200, Stephan Gerhold wrote:
> > > On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> > > > On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> > > > >>>> +int iris_fw_init(struct iris_core *core)
> > > > >>>> +{
> > > > >>>> +	struct platform_device_info info;
> > > > >>>> +	struct iommu_domain *iommu_dom;
> > > > >>>> +	struct platform_device *pdev;
> > > > >>>> +	struct device_node *np;
> > > > >>>> +	int ret;
> > > > >>>> +
> > > > >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > > > >>>> +	if (!np)
> > > > >>>> +		return 0;
> > > > >>> You need a dt-bindings change for this as well. This is documented only
> > > > >>> for Venus.
> > > > >> You are right, wanted to send device tree and binding support separately.
> > > > >> But if required, will add with the series in the next version.
> > > > >>
> > > > > You can send device tree changes separately, but dt-binding changes
> > > > > always need to come before the driver changes.
> > > > 
> > > > Do you mean to update the examples section[1] with the firmware subnode,
> > > > something similar to venus schema[2] ?
> > > > 
> > > 
> > > Sorry, I missed the fact that the "video-firmware" subnode is already
> > > documented for iris as well through qcom,venus-common.yaml (which is
> > > included for qcom,sm8550-iris). I don't think it's strictly required to
> > > add every possibility to the examples of the schema, since we'll also
> > > have the actual DTBs later to test this part of the schema.
> > > 
> > > I would recommend to extend the description of the "video-firmware" node
> > > in qcom,venus-common.yaml a bit. You do use the reset functionality of
> > > TrustZone, so the description there doesn't fit for your use case.
> > > 
> > > I think we will also have to figure out how to handle the old
> > > "ChromeOS"/"non_tz" use case (that resets Iris directly with the
> > > registers) vs the EL2 PAS use case (that resets Iris in TZ but still
> > > handles IOMMU from Linux). Simply checking for the presence of the
> > > "video-firmware" node is not enough, because that doesn't tell us if the
> > > PAS support is present in TZ.
> > > 
> > > I have been experimenting with a similar patch that copies the "non_tz"
> > > code paths from Venus into Iris. We need this to upstream the Iris DT
> > > patch for X1E without regressing the community-contributed x1-el2.dtso,
> > > which doesn't have functional PAS when running in EL2.
> > > 
> > > Perhaps we could check for __qcom_scm_is_call_available() with the new
> > > QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
> > > or directly with the registers. I don't have a device with the new
> > > firmware to verify if that works.
> > 
> > You can check QCOM_SCM_PIL_PAS_GET_RSCTABLE with __qcom_scm_is_call_available() 
> > but there is a possibility that QCOM_SCM_PIL_PAS_GET_RSCTABLE SMC call will be
> > used even for Gunyah. So, I believe, __qcom_scm_is_call_available() and
> > video-firmware's iommu property is also important.
> > 
> 
> Yeah, this sounds good.
> 
> > > 
> > > I'll try to send out my patch soon, so you can better see the context.
> > 
> > Are you saying that you are going to send patch to support IRIS on
> > x1-el2.dtso in non-secure way i.e., non-PAS way.
> > 
> 
> The background is the following: I have a pending patch to add iris to
> x1e80100.dtsi, but that currently breaks x1-el2.dtso. My original plan
> was to disable &iris in x1-el2.dtso (because the PAS way seems to be
> just broken), but then I saw that e.g. sc7180-el2.dtso does have working
> Venus with the "video-firmware" node. Copy-pasting the "no_tz"(/non-PAS)
> code as-is from venus into iris works just fine for x1-el2.dtso, so
> disabling &iris in x1-el2.dtso just because the "no_tz" code is
> currently missing in iris doesn't sound right.
> 
> As far as I understand the approach you use in this series does not work
> without the TZ changes for older platforms like X1E(?), so adding that
> code in iris seems to be the best way to move forward.

Yes, this series has dependency on firmware and will not work for older
platforms.

> 
> I started working on a patch for this a while ago, it just needs a bit
> more cleanup. I'll try to finish it up and post it so we can discuss it
> further. I think the IOMMU management in my patch would even work as-is
> for you, you would just need to toggle a boolean to use the PAS instead
> of accessing the registers directly.

Sounds like a plan.
Thanks, please cc me when you send the patches; So, I could test along
with my changes and make dependency on it.

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

