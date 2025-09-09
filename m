Return-Path: <linux-media+bounces-42109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5452CB4FA8C
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB7057AE6B4
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 12:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590652F879;
	Tue,  9 Sep 2025 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEvssZ38"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A26322C74
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420408; cv=none; b=IrFHXMGcQ+2O/KpfbdK74tr3gRJZ/zufkEXOmFJNWuplhd7Zs2hx+YX3lPK+b3YoDkb/lH0FlxfjMVNYr2M6AAjYvHWAH5/Y9mQTo2VD1ra7EnclHDTMiUNEBNTv3z7MGH4F0VE0LzMWPmXc58E0py9I+47TBrKxsVkPk8vRBbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420408; c=relaxed/simple;
	bh=KBdu4aE7FCwLwjhgeBIHOejKq8DdFEOTeiqyFznUIXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9nVpXVN38zbQBSRfCFItbE1Kc0HTDRZkQ50hurmk9a4jqB7Ocalxf3Myho7nD+zapXZmzWhuuIknrOYLAqpi6KqFqYLmcYdNdWDDPDnVSbUib1mNhueiYIpZTRLNN9f+pOIrWFP5f4V7+Pifbmag7HSJNdQhJUxss3HEjHIlIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEvssZ38; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRGV029169
	for <linux-media@vger.kernel.org>; Tue, 9 Sep 2025 12:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W2I82qsif+R6mSRK23g85rRg
	suF/7dpihmilL84Dv1Q=; b=HEvssZ38qax3hAhvrTfglX5pj9Vv0mwlvTPQidxN
	6cWZWeLfBYRFbQJwBYZdj2mvfeXHFleEkbhdnUwEJgrDkGunivmQQpuHQ1gu55QS
	FY7d23iteCZeHXAOd8faX3K9gzsAbeNt78L1Ib6YZcPAo9okgIseSeRBuTBQ5cdf
	ZNmY9jBj66Or/eJCQUvixefbtiHtb5N9Mqbv8DMp55TqBQ/cT6JaEPgNdqsFbH/6
	BeSflVGHYSoc3orX2CWycJctGn9xhx0YlidsKNx3qKAG16/5MPp6BfAXrQiPS25I
	dFVa3thBwKwjwnfN2oYnGyLnSHD/oXXDeY5FisgNudj25Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8g62y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 12:20:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24ca417fb41so65464015ad.1
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 05:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420404; x=1758025204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2I82qsif+R6mSRK23g85rRgsuF/7dpihmilL84Dv1Q=;
        b=a/nQXl8x3YyigrUxOflk+C967a0xw/inD2Y6GNxidOLJVBe5eU6NMueYgH5IuvDD6I
         2yqGozvd+cSmczTPHwIE8AU7rdk+HHcE8hL3dbyDFcUfHNfxpYHIxm5Lvuf+VRAhzYGw
         5GToW+pvDmd2FKLwkSIVrQkRUiQU+OEtfIjyL+ev94Ti9L7zft+tcLsFbSrrt5xAbpMf
         D1cV7r8DfKplLOLeollQUB+toymmio6dan003mMh7y+inF+UVLsp+L5UZRXKBNdntJf9
         V+JJBXm1NPU6he3X+80bbBfX9a0uAnDz/HG9FujrQU3Wg3MePrmGufrgDauaU+gK/Zgw
         Sa4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlT3FC4z+X4Qh/mG49LGkzXvgP3kj4QvyBZCkX+qwIU20wonvUV9tBo8uA/vQu6LGQlOOp6U54iB5YFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm7E1oNdU1AGQyBVsiZIeAOn5hFtb3/+7grVkzfqLTMEPvhZUz
	YRNnmEfSA6mchy9g4o7iYVoWibhv+J5uEgbhSifl/FqSrlA33SH9XgyfyGek0MglcpGfAvdQn6j
	qAbRDmuMRX5aCVgtWjqBHi48h8Nkq6oKDj8TY/N8IMh5stusy0vcYcXBZyADBx6d2lA==
X-Gm-Gg: ASbGncu/Y5H2cMlfSE2Co0RlYsVWcTyskohlxJT7GRt9Ch7hpZF1lRvQYZe9kExSDUx
	1jMauTX9mUfWbxlgh+xVU31D60WnWEknCTVC3O11D9mUWvF3ioYKeTf5SOJVMhJGDAwBh+fhC7G
	pNwKDg5fpYD9OtpzUtsxdSyD3doVKIHeu7/BIWSzHXK42kAvDmib734So3v2LMZIot7+hRJ8fmC
	WfdgsLVLfRYKwY/a9GPC0ubGCVQpSmfCxPRZrVoFNp8NqL0sYQ1Zn20T11TwNyZVrqbqk32lrfI
	Yt+S6a6SbYPKHu1um1ceI80jdBZzk9a7MF7wdErRcdW5wVUyS0oVp2GGtxOssM7B8lM=
X-Received: by 2002:a17:902:c94f:b0:24c:bdbe:cc90 with SMTP id d9443c01a7336-2516f04ef6bmr175426335ad.1.1757420404253;
        Tue, 09 Sep 2025 05:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYM1kluKh6L36vgfhf8HwE/ASmDkm9X+H9amBji9OAfd8UZp+wP9q4y/MziC9K/zHrUgWhCQ==
X-Received: by 2002:a17:902:c94f:b0:24c:bdbe:cc90 with SMTP id d9443c01a7336-2516f04ef6bmr175425685ad.1.1757420403490;
        Tue, 09 Sep 2025 05:20:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25125d76218sm93324665ad.119.2025.09.09.05.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:02 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:49:56 +0530
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
Message-ID: <20250909121956.rjbysoylwybgsago@hu-mojha-hyd.qualcomm.com>
References: <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
 <aKiaKwkpdKHSH9YS@linaro.org>
 <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>
 <aKooCFoV3ZYwOMRx@linaro.org>
 <20250825111956.5x4dn3uguo4xmtss@hu-mojha-hyd.qualcomm.com>
 <aL6Sg9dExKfepRKM@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aL6Sg9dExKfepRKM@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX7RrkfXS7vkBS
 5WbY1o5cfMzXAtrCCF0sxt0BSVK/isoYwf9I6T1adaTl1cgBh9kmW9omZwlFmumhael8VOgpeAm
 iOGLY+4oKfp1FyatGfRfIYZcIJFKR05DxkbTUsy8RbMXnhvRYO7e2bMYnBqTx/mNvmJ1kT0FgBU
 XG4ZzmDXoPcPL47ZE4+515rSRX/euo++Ltsd3boS6nq/6/fpzpO7TnyoyXz7VuyWRs0/Fit2vDK
 hf+U+f64YQnB5eWjTqXC1E5V2vOHb5fxhdXUVwZPIJ1KwrzaAQJ2oyNi5Y6x9RqoYxV95VIofOX
 CRiw3af2sYVYVkz8ltGGnO4pCD8Nnec2GQEMNBZn16FTIfmIgDJqOqob5cSvEkfX6S12F4AYYZb
 U/8oxH7K
X-Proofpoint-ORIG-GUID: zcRrmmGJ8qfuN_k6tnllE7Axvvsw0A5W
X-Proofpoint-GUID: zcRrmmGJ8qfuN_k6tnllE7Axvvsw0A5W
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c01b75 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=KJKTIJMWTiPkF6hFbBcA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On Mon, Sep 08, 2025 at 10:23:31AM +0200, Stephan Gerhold wrote:
> On Mon, Aug 25, 2025 at 04:49:56PM +0530, Mukesh Ojha wrote:
> > On Sat, Aug 23, 2025 at 10:43:52PM +0200, Stephan Gerhold wrote:
> > > On Fri, Aug 22, 2025 at 10:10:30PM +0530, Mukesh Ojha wrote:
> > > > On Fri, Aug 22, 2025 at 06:26:19PM +0200, Stephan Gerhold wrote:
> > > > > On Fri, Aug 22, 2025 at 08:36:11PM +0530, Mukesh Ojha wrote:
> > > > > > On Fri, Aug 22, 2025 at 10:46:20AM +0200, Stephan Gerhold wrote:
> > > > > > > On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> > > > > > > > On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> > > > > > > > >>>> +int iris_fw_init(struct iris_core *core)
> > > > > > > > >>>> +{
> > > > > > > > >>>> +	struct platform_device_info info;
> > > > > > > > >>>> +	struct iommu_domain *iommu_dom;
> > > > > > > > >>>> +	struct platform_device *pdev;
> > > > > > > > >>>> +	struct device_node *np;
> > > > > > > > >>>> +	int ret;
> > > > > > > > >>>> +
> > > > > > > > >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > > > > > > > >>>> +	if (!np)
> > > > > > > > >>>> +		return 0;
> > > > > > > > >>> You need a dt-bindings change for this as well. This is documented only
> > > > > > > > >>> for Venus.
> > > > > > > > >> You are right, wanted to send device tree and binding support separately.
> > > > > > > > >> But if required, will add with the series in the next version.
> > > > > > > > >>
> > > > > > > > > You can send device tree changes separately, but dt-binding changes
> > > > > > > > > always need to come before the driver changes.
> > > > > > > > 
> > > > > > > > Do you mean to update the examples section[1] with the firmware subnode,
> > > > > > > > something similar to venus schema[2] ?
> > > > > > > > 
> > > > > > > 
> > > > > > > Sorry, I missed the fact that the "video-firmware" subnode is already
> > > > > > > documented for iris as well through qcom,venus-common.yaml (which is
> > > > > > > included for qcom,sm8550-iris). I don't think it's strictly required to
> > > > > > > add every possibility to the examples of the schema, since we'll also
> > > > > > > have the actual DTBs later to test this part of the schema.
> > > > > > > 
> > > > > > > I would recommend to extend the description of the "video-firmware" node
> > > > > > > in qcom,venus-common.yaml a bit. You do use the reset functionality of
> > > > > > > TrustZone, so the description there doesn't fit for your use case.
> > > > > > > 
> > > > > > > I think we will also have to figure out how to handle the old
> > > > > > > "ChromeOS"/"non_tz" use case (that resets Iris directly with the
> > > > > > > registers) vs the EL2 PAS use case (that resets Iris in TZ but still
> > > > > > > handles IOMMU from Linux). Simply checking for the presence of the
> > > > > > > "video-firmware" node is not enough, because that doesn't tell us if the
> > > > > > > PAS support is present in TZ.
> > > > > > > 
> > > > > > > I have been experimenting with a similar patch that copies the "non_tz"
> > > > > > > code paths from Venus into Iris. We need this to upstream the Iris DT
> > > > > > > patch for X1E without regressing the community-contributed x1-el2.dtso,
> > > > > > > which doesn't have functional PAS when running in EL2.
> > > > > > > 
> > > > > > > Perhaps we could check for __qcom_scm_is_call_available() with the new
> > > > > > > QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
> > > > > > > or directly with the registers. I don't have a device with the new
> > > > > > > firmware to verify if that works.
> > > > > > 
> > > > > > You can check QCOM_SCM_PIL_PAS_GET_RSCTABLE with __qcom_scm_is_call_available() 
> > > > > > but there is a possibility that QCOM_SCM_PIL_PAS_GET_RSCTABLE SMC call will be
> > > > > > used even for Gunyah. So, I believe, __qcom_scm_is_call_available() and
> > > > > > video-firmware's iommu property is also important.
> > > > > > 
> > > > > 
> > > > > Yeah, this sounds good.
> > > > > 
> > > > > > > 
> > > > > > > I'll try to send out my patch soon, so you can better see the context.
> > > > > > 
> > > > > > Are you saying that you are going to send patch to support IRIS on
> > > > > > x1-el2.dtso in non-secure way i.e., non-PAS way.
> > > > > > 
> > > > > 
> > > > > The background is the following: I have a pending patch to add iris to
> > > > > x1e80100.dtsi, but that currently breaks x1-el2.dtso. My original plan
> > > > > was to disable &iris in x1-el2.dtso (because the PAS way seems to be
> > > > > just broken), but then I saw that e.g. sc7180-el2.dtso does have working
> > > > > Venus with the "video-firmware" node. Copy-pasting the "no_tz"(/non-PAS)
> > > > > code as-is from venus into iris works just fine for x1-el2.dtso, so
> > > > > disabling &iris in x1-el2.dtso just because the "no_tz" code is
> > > > > currently missing in iris doesn't sound right.
> > > > > 
> > > > > As far as I understand the approach you use in this series does not work
> > > > > without the TZ changes for older platforms like X1E(?), so adding that
> > > > > code in iris seems to be the best way to move forward.
> > > > 
> > > > Yes, this series has dependency on firmware and will not work for older
> > > > platforms.
> > > > 
> > > > > 
> > > > > I started working on a patch for this a while ago, it just needs a bit
> > > > > more cleanup. I'll try to finish it up and post it so we can discuss it
> > > > > further. I think the IOMMU management in my patch would even work as-is
> > > > > for you, you would just need to toggle a boolean to use the PAS instead
> > > > > of accessing the registers directly.
> > > > 
> > > > Sounds like a plan.
> > > > Thanks, please cc me when you send the patches; So, I could test along
> > > > with my changes and make dependency on it.
> > > > 
> > > 
> > > Krzysztof raised the concern that we shouldn't model the IOMMU specifier
> > > for the firmware using a "video-firmware" subnode [1], similar to the
> > > discussion for the "non-pixel" subnode recently [2].
> > > 
> > > I mostly finished up the cleanup of my patch, but I don't see any point
> > > in posting it without an alternative proposal for the dt-bindings. For
> > > this case, I think a simple property like
> > > 
> > > 	firmware-iommus = <&apps_smmu ...>;
> > > 
> > > instead of
> > > 
> > > 	video-firmware {
> > > 		iommus = <&apps_smmu ...>;
> > > 	};
> > > 
> > > could perhaps work. (XYZ-iommus isn't standardized at the moment, but I
> > > think something like XYZ-gpios would make sense in this case. There are
> > > many other possible approaches as well though.)
> > > 
> > > Unfortunately, I won't have enough time in the next weeks to fully
> > > implement and propose an alternative. I'm assuming you still have
> > > ongoing work for supporting the "non-pixel" IOMMU, perhaps your new
> > > approach can be adapted for video-firmware as well?
> > 
> > I believe, non-pixel case a bit different and thats not depends on whether
> > it is PAS or non-PAS.
> > 
> > However, I liked the idea about introducing something similar to -gpios
> > for -iommus as could pottentially solves at least this issue. Here, we need
> > to create a platform device and its domain based on firmware-iommu
> > property.
> > 
> > So, its required change in device link to put supplier/consumer dependency
> > and addition of firmware-iommu binding for IRIS and little of changes
> > over your existing changes.
> > 
> > But I have doubt, whether @Krzysztof would be fine with it ?
> > 
> 
> Krzysztof isn't on Cc here so I wouldn't expect him to reply. :-)
> I'm not sure if it's helpful to add him in the middle of the discussion
> either (at least without proper summary of the problem description).
> 
> I think it would be best to prepare a patch series with the motivation
> properly described. If making the actual implementation (to create the
> platform device etc) is too much work it could also be sent as RFC with
> only the dt-bindings.
> 
> Have you continued working on this to unblock adding the IOMMU needed
> for the IRIS firmware?

We are discussing on this internally and if this can be taken along with
non-pixel case or not, will come back on this.

If it takes too much, will drop video support for now in next version.

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

