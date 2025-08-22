Return-Path: <linux-media+bounces-40783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 628CFB31D63
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 17:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41B147BA6F8
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 15:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACED1CD208;
	Fri, 22 Aug 2025 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mS8tqQ7w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CB2188906
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755875183; cv=none; b=Yzo4epW4So3ZllhMiLdv2MyqZRgLMlT6VdD0Hy1ca1zAcxgbBj5WrJxXFYV7M+FIVbVizJTtg1P8N+d4YTR2dVrN7bYhsO95oSh+iJ77QlI0VyCf5m7DrboN7yGDBGdxPfr2c3mRlwvVCNS5gBkI08ILuZWEN43J93Ub5JUkyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755875183; c=relaxed/simple;
	bh=TaGjZVBNjqzB9wouC54FD4GU1xyQRprfFDBycdH1uMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYH4Jn+RUzJrGn5YHj/RRpe6gqCCjBG7RZrOt+9iwJG2pBHgle5YqvERegMber3/WYPkjfQ3dEfx8Fh7G3i5fWaFiYPtZwapzeytc14Ixe9D1tnelbb7SXMphK7h3trDDjFdamjGYHPv+5ot9HP2hKh5feBeBDmGIGQhJc7xFJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mS8tqQ7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UHVs005806
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 15:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BwpqZ61LBFwlqjVSb9xTIEnN
	VKZalQo+jXTMu0ZiAnc=; b=mS8tqQ7wS1ddBiYsTugAgpdhJo5uNPAiqiFAwwHF
	aAayN9gBy82wTn+F1PwaTkQd7RrgRDK1Kd5ZCV3tgK16/AysfoTPfVfHJc0kTsz3
	PpkZ9BigV0t9qWYU1fzHimnyhdwrp8EZo6F3hOU1N79GT/8Mdz5zAbVti3gQylkh
	dt2gpohCDS73Qn1OlocDCyYzIamZQswjvt7cFq+7MUbPElhggF+bwdXDyI2y4H8y
	Kd1hzXAc3z62iPKXYrG/VJEe3Uln0uuL2aSpkErR+7bBnqtAvtJd9jzlxgjOLyQ8
	v86K6VZkDKPMFTHYnlmL8kqGZuF6sIPSYJrjcoyG5Nqo4g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291kmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 15:06:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581ce388so49169825ad.2
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 08:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875179; x=1756479979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwpqZ61LBFwlqjVSb9xTIEnNVKZalQo+jXTMu0ZiAnc=;
        b=XIDdUCRyePyl08bz5G3rO2gpFqjmGFJ1EGYfQLqbt6ll6BYaeIHSfZ10IvmDtoC+Ri
         9HYF66Kl4rCXM6cgvGfHa7GHhfx/JS9uLQ1GfR9vQS7tpjP80PwWKIgkaeRSpA49xu57
         KVnN8XncXANbULbC9Hev9s/DuSxjgUxJX6kRywoRklmL+SSL3la+BRf73wkaDxCreoA0
         SCqNitPzfmgaAXdyD0n+zwux6ZoJjOGkpt19xc84ZbN2ABvyKbjJSfAZMT9F1ULaZpo1
         IE5JOxbwuqzlUVw4W586hIiPaIj1xbz1O59/zRRpukkmuv47KFtDIJ9CirSD8Qu6+Dt9
         HsmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAYk8I2HzV6r2DwI2Xf5H9Xyixyo5hn6drVcgDbNmIgQ3zCTCsgairPCkubqHwRiX6FGQF1NBnz1sGlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUzLnoemeBYRJL3+oRTY3nenxUGlLvs0vQbcoMMQJSk9eQQLQt
	5zBynD29lKaP0gfRGrfzCXygpnEPjXU3rGNnQ3GQy5ZxYLEG7SfddstgnTxeEHabRYZg4/v7EwW
	1CQLpKR4XWqbrgKt+QfUxvhrL8qWvTkqExGIUvMuH8sqRQwO8poQfkFonzNWBRnJOXQ==
X-Gm-Gg: ASbGncsmaAlRwVFdRra5zMpGGNnzB3xKPyNuKZDnZiqBBPgvvOqtdkaZSudYAK8iTIt
	aYYHhFXSjU5weLU8hASEP0fzVTnT4bOKoCR/JjbRS+VdiRLwcb+Xs4PvGx12+SKBXt2FChzjeT/
	XjIDnsevz2LOzFkWpbDc+jO0mpXqmgbNdPQlw+qzJMPmTr/9X/N3oL7nVFJVCaNNkAB+x/ZMNeG
	bIJLsVFYV3pntV1sVd6y8pcCgLz2ssS2tLoeRiEwHoHN4QQ1rUqyN9PtsOsDbCw+h3BTH1WD6vC
	ex5lxWesbOqH7nAJ/D1NUlZZxcV7j1cTzot5+LyFOgNpXz0zfJANZrPjMtKyY9TM/io=
X-Received: by 2002:a17:902:c402:b0:246:570:2d9a with SMTP id d9443c01a7336-2462efca0femr41628115ad.59.1755875179140;
        Fri, 22 Aug 2025 08:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBa7+NR/UqARzf3gLr4vrEuhT70rpF/eoP4nZO8thtakTCqhfzCPBBCTNxi6EQ2bmua/KKwg==
X-Received: by 2002:a17:902:c402:b0:246:570:2d9a with SMTP id d9443c01a7336-2462efca0femr41627505ad.59.1755875178605;
        Fri, 22 Aug 2025 08:06:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245fd335ea1sm55029105ad.110.2025.08.22.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:06:18 -0700 (PDT)
Date: Fri, 22 Aug 2025 20:36:11 +0530
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
Message-ID: <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKguXNGneBWqSMUe@linaro.org>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a8876c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=QS3pIwUUYRx7lZdHfBUA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 0FBfOCfgBW-yNMSQp6Qtj88SCMNhhXt3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7e/cqkF990gX
 dbTOcJuvZPPsEaIa7zo8C/vrHTXYzLQR659kTqdaV5X8xXie4028E3N5T4dNTJ89Y/xtr1/RVvW
 qlEzBmfDnQJeXkBu+SKTXZdhxh+o6jP/DSb3c+BRav+9jq/L4cJMfznWh/0njoQeM/6eieHYb0c
 k/pMwj8Vt50svSTRaioYAri/KUwU3q/691YtJZl7wkEMSylGr9tXAkPN0o0EIAV3O7kytxhknT1
 BBZJGQ5uxt1wmpQ5J6e/iWPhHwt39ScYL57pPdZzip3D1vNQTiU01lPzBDPIZ/qe8Ja+wjbGvx8
 3pWlYTyRuQl4YBkw+yjoig3f7DoaKDo0ZQjClnyMUoB155Ze+ahuVy4DPtVukTZVpVpXXcDc4O4
 +mpsSQMo1Pj/y74UwqWPKCb3KQRMXQ==
X-Proofpoint-ORIG-GUID: 0FBfOCfgBW-yNMSQp6Qtj88SCMNhhXt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 10:46:20AM +0200, Stephan Gerhold wrote:
> On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> > On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> > >>>> +int iris_fw_init(struct iris_core *core)
> > >>>> +{
> > >>>> +	struct platform_device_info info;
> > >>>> +	struct iommu_domain *iommu_dom;
> > >>>> +	struct platform_device *pdev;
> > >>>> +	struct device_node *np;
> > >>>> +	int ret;
> > >>>> +
> > >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > >>>> +	if (!np)
> > >>>> +		return 0;
> > >>> You need a dt-bindings change for this as well. This is documented only
> > >>> for Venus.
> > >> You are right, wanted to send device tree and binding support separately.
> > >> But if required, will add with the series in the next version.
> > >>
> > > You can send device tree changes separately, but dt-binding changes
> > > always need to come before the driver changes.
> > 
> > Do you mean to update the examples section[1] with the firmware subnode,
> > something similar to venus schema[2] ?
> > 
> 
> Sorry, I missed the fact that the "video-firmware" subnode is already
> documented for iris as well through qcom,venus-common.yaml (which is
> included for qcom,sm8550-iris). I don't think it's strictly required to
> add every possibility to the examples of the schema, since we'll also
> have the actual DTBs later to test this part of the schema.
> 
> I would recommend to extend the description of the "video-firmware" node
> in qcom,venus-common.yaml a bit. You do use the reset functionality of
> TrustZone, so the description there doesn't fit for your use case.
> 
> I think we will also have to figure out how to handle the old
> "ChromeOS"/"non_tz" use case (that resets Iris directly with the
> registers) vs the EL2 PAS use case (that resets Iris in TZ but still
> handles IOMMU from Linux). Simply checking for the presence of the
> "video-firmware" node is not enough, because that doesn't tell us if the
> PAS support is present in TZ.
> 
> I have been experimenting with a similar patch that copies the "non_tz"
> code paths from Venus into Iris. We need this to upstream the Iris DT
> patch for X1E without regressing the community-contributed x1-el2.dtso,
> which doesn't have functional PAS when running in EL2.
> 
> Perhaps we could check for __qcom_scm_is_call_available() with the new
> QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
> or directly with the registers. I don't have a device with the new
> firmware to verify if that works.

You can check QCOM_SCM_PIL_PAS_GET_RSCTABLE with __qcom_scm_is_call_available() 
but there is a possibility that QCOM_SCM_PIL_PAS_GET_RSCTABLE SMC call will be
used even for Gunyah. So, I believe, __qcom_scm_is_call_available() and
video-firmware's iommu property is also important.

> 
> I'll try to send out my patch soon, so you can better see the context.

Are you saying that you are going to send patch to support IRIS on
x1-el2.dtso in non-secure way i.e., non-PAS way.

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

