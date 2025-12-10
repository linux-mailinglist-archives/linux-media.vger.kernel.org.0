Return-Path: <linux-media+bounces-48603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3569CCB4495
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 00:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E662230343FE
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 23:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4514A314B71;
	Wed, 10 Dec 2025 23:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H796zSq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LEduewP8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A682EFDB5
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 23:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765409674; cv=none; b=EQM09qcwlIDR4Ab/kpiqlvl8xWiAKEmOhslz0PxfYJF9UYeZZCgMqNnQSDPWeW8L/1hXJRKOUbpfohSq6KjmTOCl1jBVA9YtzbVUhsL0HOxbvP5X730ko33TSoXGQfauOemvxUH73rHc0l2DmWYOBpu0pH7kUjYITNM5CCkfz/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765409674; c=relaxed/simple;
	bh=zZwAQYBqj+zlRGYglh8fL3qoXACHHzoLKvWvjN1vpS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ob6iGCBgdnPePXpFbPb/qH9/EqIzmQrHn0RwCa7MV6LrCdp4jexvC9ekh9b0XX/opRsoZvtv0pI1kKMwW8Q8S1Y+Q+GWnb4ik/qDrHrFg4U8M1iLZAt/VSRMP1V9ZTRNr5GNPdVH1xdJG36WDgOCP1OgCob8cL8PCPcy+awt1JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H796zSq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LEduewP8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALR5CO212594
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 23:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylVybmMHcV3SiXpHMeWWtPzTPNZsPHuGOhzhZyFt8wc=; b=H796zSq7eeA3ia3i
	ppHdQxs/pWA9r5yaTfFX21fGE0JhMb7bNS0/MPPOJhQ5DpKYioaHBoKE2FDhUZYR
	hOHyf37JCTTVsNXU+g08iF3yLe094IWIoTof0qIdkNppQTV8OqpNSEMzrqqEsmBz
	EFxvpgxTVIpE5ewC9NeKdfigG61jhI+8ZMmFHwFwPRtuu9RnaE3UoVR1STcniAxY
	UH2/DhIxB8RD71dD+4R5yBkzs9LqaTv88GGw+9py7pIITz2Gre9iFWLNb48HitL4
	5t5m7BEG1Jh+I3Zl1bo4b8Md1Jw2rYKoPQA7q0kDPlVtuLra3RGxwepip9gkplTU
	1JduQA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygr889yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 23:34:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f59bf206dso192564241.0
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 15:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765409670; x=1766014470; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ylVybmMHcV3SiXpHMeWWtPzTPNZsPHuGOhzhZyFt8wc=;
        b=LEduewP80OSlHHrWxOo8Xazvn+uxctuj7fotycptIsQPXCX7nwZqtcycK7l8nG2N4p
         l6PA6Hehpx84359lfH4ZLenRMIajubwRmsJVZx6Uk/l85LviMAOVAec53deJ/z6eWtwm
         xGfAwBHPsmSP6vRgW92NCBrbsyPNKl1IKJMuzU2dEHKwM6DpO7uuJZBYQFKaYcJ09EUF
         mzK0OlHGCfaIlXckFpMtggw6yBcaSqY4oQRiGls1jm33JybFU0+Q3gV4LjZE0/9oDu3R
         S5yLd3JkS5yCH7yLCz+vY5HDJ6raDMV2WOHB0doM4LJ7f7xZogU4uerWnGI5DZWZHQv+
         Awrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765409670; x=1766014470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ylVybmMHcV3SiXpHMeWWtPzTPNZsPHuGOhzhZyFt8wc=;
        b=M+OdBufDF2c/3oUyxBRxD9pKHLlgT7G7oc3Xjcx/Jj8cgpaMhfvP0mwYvdNExZGu1l
         gzKYXY4qpnVDWg8xmcNelf+qJfk6hBLVxoy8yWdKpiDjcWTFop9k6NqKbQFmt1y6S7n9
         R71QeelVhHq2eKSybQlETE54q49q6qt/OB8/8CX/34+D7FyTbG5RN6co+xhnH7cvDzcO
         3JIH1/FmUE037dKm/8lQ+uPcM/ShxCXGcJdW6PQozPBae4qhEq6qDDTLnurUGVahVfsh
         ZvPVR4Pw3osuew9mTbNm5Y7eKlVuiAk2cVCLS3CNTNOGxb2kW05D1hZQ/y2+/SqFlGnr
         +Qkg==
X-Forwarded-Encrypted: i=1; AJvYcCXtfgqV/IFPwyavIpXSwu87DukJLLrsDAZM/tCRh9b54rxRY5rEbJuIz/Nol6X15RuGfNXkB/N4l+NNlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytWhm+boM1ssxrIVlfdRdE5RViO/ByfeSp4mb+xn4V2juJTqon
	scAFNxFRmns3pkf0KpMxNPlm9yQtXX7a3nlx/Qn2I69dfsO7Oa5Q6PDuqZx00XKBBCGrZGIv0UF
	Zd2NDCX8CIPWkL74enr3mj1loeNkKxMEE41MZPsrt0/ySNGphb7ojbxaI8d3E6uXH8Q==
X-Gm-Gg: AY/fxX7oGfLtluGYibSgPc5wM0O0WZYBx7lkQ5DAb5J0GJuTbDvdEyRc/lt1XF+RuT/
	JihiyiPqHxmWj/S1DaBnF/Ygnh6OamZ1GrVR/uJWGbZ+adCPPpkjYWXtSrYTGsSfYn3Dvf2yHC3
	vgQIMDYlwDO5fIvJ1zomrrAsbVn/cEq61q2zUyLGxUp93xXf/nOozAZwnPOwhIgxoyYfO5zKG9Y
	Bj/ZAKWXUBAfLEXwdi4ku//S6PfzGOq/Nj5gold8PcXmZwL7Mr0NmjfAGRTuzihvxPgvfSUxuf8
	LT89Qtr/i16EKndICYsPSMxJxHFke+am9YuImBPtv8JmE2NB/isz7tAR3KAP+uCXSOAf9XlXXjJ
	TDR+JMdZ37ZoInNH3ghgEhZvs1joDwEcRsEbX+OVo01RJQuUlE+QyHmWd74XQD8EXtRuRSJwQdz
	73qga93m/SjvBAHcyPXvQqhdM=
X-Received: by 2002:a05:6122:789:b0:559:3b8a:70ce with SMTP id 71dfb90a1353d-55fcfb2e6a2mr1397737e0c.7.1765409669529;
        Wed, 10 Dec 2025 15:34:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY13dF1i3N+DKUakRTYpr60TQeYxMuJDhj4Fz+ktnyBthkKlwJQdmOyHWBpvb62etoDTr/6A==
X-Received: by 2002:a05:6122:789:b0:559:3b8a:70ce with SMTP id 71dfb90a1353d-55fcfb2e6a2mr1397724e0c.7.1765409668862;
        Wed, 10 Dec 2025 15:34:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbd41f4c6sm1772381fa.30.2025.12.10.15.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 15:34:28 -0800 (PST)
Date: Thu, 11 Dec 2025 01:34:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
Message-ID: <qywqblp4qssd2pvfvecyzb3v2wdcgkd3ffk5lwvf35pcplh45c@yvg7jwjunvtz>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
 <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
 <scnexmcrpemu6vcms3dmq7qjvx54h5pyumjvgqduospao4x2kt@hoi7zfygjq4f>
 <458a7841-e422-4cad-83de-f5b5c1b683a6@oss.qualcomm.com>
 <puv24qramoiq4qq3i4bibatg5ihnrv6hdloul5ajbblvasvwk3@nbse2m6aftkh>
 <2e38b9f3-8a35-4a27-82d3-c1d4996a1684@oss.qualcomm.com>
 <9ecf4783-e1a2-430b-a889-997689bafe45@oss.qualcomm.com>
 <qfhlyl46i7az56t5ceyo42mw55udzwhxgpygw3jnpw3onr6qc2@5r3i6tb6ac3v>
 <bf54a030-ee01-4b66-97d4-37f50a75d93c@oss.qualcomm.com>
 <1c9db550-677e-4fdc-8929-89c21deecf17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c9db550-677e-4fdc-8929-89c21deecf17@linaro.org>
X-Authority-Analysis: v=2.4 cv=Fr0IPmrq c=1 sm=1 tr=0 ts=693a0386 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=a7DqX4OwdQXnvoRfvVAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE5MyBTYWx0ZWRfXwUNX9PocVxCv
 u8YJKyv6pMnRBUKmrWqjrVzuXoiNrZOwaaNrAHGJeSRp0byKDPgRLNStb1V/NOnU3vbVEaoocHm
 QiFmzHQ+tHhMESyVDEJrM9Ch+QZfS5v0Wojb7BoNF9E+4yxRWEQzwt5xzPquqYBTZwMek2rLg6H
 +LrHj4IuBmn/Q7tIJkAjhRXEXqMRh6uuULSCgFO9O9mxZoVA0L6q7UsdGAEAUuYLj7MXjPsJ/OM
 2bi/AIc6wYHsRfy7nsLE5IfjXYF/l/IyhUeYWed/8Fm8EvCWPd49hD9/ZbGqceTKygyEqaNwKTx
 nQOB9vk6SBwVfK/5V1RlkBxHNeo0EOSDLzOk8fMHZbvEKApXtFH1I54gbCAJxHSbfUJlanBOhMo
 R8OyXPQ5kdlxk+sX9DBK0FqAO1QFmQ==
X-Proofpoint-ORIG-GUID: 6R--EHUUNf4EAqbbUU4Gqat2LqpbPAMe
X-Proofpoint-GUID: 6R--EHUUNf4EAqbbUU4Gqat2LqpbPAMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100193

On Wed, Dec 10, 2025 at 09:45:56PM +0000, Bryan O'Donoghue wrote:
> On 10/12/2025 19:36, Vijay Kumar Tumati wrote:
> > 
> > On 12/10/2025 11:25 AM, Dmitry Baryshkov wrote:
> > > On Wed, Dec 10, 2025 at 09:50:51AM -0800, Vijay Kumar Tumati wrote:
> > > > On 12/8/2025 3:21 PM, Vijay Kumar Tumati wrote:
> > > > > On 12/8/2025 2:48 PM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Dec 08, 2025 at 01:03:06PM -0800, Vijay Kumar Tumati wrote:
> > > > > > > On 12/8/2025 11:53 AM, Dmitry Baryshkov wrote:
> > > > > > > > > +  interconnects:
> > > > > > > > > +    maxItems: 4
> > > > > > > > > +
> > > > > > > > > +  interconnect-names:
> > > > > > > > > +    items:
> > > > > > > > > +      - const: ahb
> > > > > > > > > +      - const: hf_mnoc
> > > > > > > > > +      - const: sf_icp_mnoc
> > > > > > > > > +      - const: sf_mnoc
> > > > > > > > You know... Failure to look around is a sin. What are the names of
> > > > > > > > interconnects used by other devices? What do they actually describe?
> > > > > > > > 
> > > > > > > > This is an absolute NAK.
> > > > > > > Please feel free to correct me here but, a couple things.
> > > > > > > 
> > > > > > > 1. This is consistent with
> > > > > > > Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml. no?
> > > > > > I see that nobody noticed an issue with Agatti, Lemans and Monaco
> > > > > > bindings (Krzysztof?)
> > > > > > 
> > > > > > Usually interconnect names describe the blocks that are
> > > > > > connected. Here
> > > > > > are the top results of a quick git grep of interconnect names through
> > > > > > arch/arm64/dts/qcom:
> > > > > > 
> > > > > >       729 "qup-core",
> > > > > >       717 "qup-config",
> > > > > >       457 "qup-memory",
> > > > > >        41 "usb-ddr",
> > > > > >        41 "apps-usb",
> > > > > >        39 "pcie-mem",
> > > > > >        39 "cpu-pcie",
> > > > > >        28 "sdhc-ddr",
> > > > > >        28 "cpu-sdhc",
> > > > > >        28 "cpu-cfg",
> > > > > >        24 "mdp0-mem",
> > > > > >        17 "memory",
> > > > > >        14 "ufs-ddr",
> > > > > >        14 "mdp1-mem",
> > > > > >        14 "cpu-ufs",
> > > > > >        13 "video-mem",
> > > > > >        13 "gfx-mem",
> > > > > > 
> > > > > > I hope this gives you a pointer on how to name the interconnects.
> > > > > > 
> > > > > > > 2. If you are referring to some other targets that use, "cam_"
> > > > > > > prefix, we
> > > > > > > may not need that , isn't it? If we look at these interconnects
> > > > > > > from camera
> > > > > > > side, as you advised for other things like this?
> > > > > > See above.
> > > > > I see, so the names cam-cfg, cam-hf-mem, cam-sf-mem, cam-sf-icp-mem
> > > > > should be ok?
> > > > > 
> > > > > Or the other option, go exactly like
> > > > > Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml.
> > > > > 
> > > > > What would you advise?
> > > > > 
> > > > To keep it consistent with the previous generations and still
> > > > represent the
> > > > block name, we will go ahead with the style in qcom,sc8280xp-
> > > > camss.yaml. If
> > > > anyone has any concerns, please do let us know.
> > > Krzysztof, Bryan, your opinion? My preference would be to start using
> > > sensible names, but I wouldn't enforce that.
> > > 
> > > > > > > > > +
> > > > > > > > > +  iommus:
> > > > > > > > > +    items:
> > > > > > > > > +      - description: VFE non-protected stream
> > > > > > > > > +      - description: ICP0 shared stream
> > > > > > > > > +      - description: ICP1 shared stream
> > > > > > > > > +      - description: IPE CDM non-protected stream
> > > > > > > > > +      - description: IPE non-protected stream
> > > > > > > > > +      - description: JPEG non-protected stream
> > > > > > > > > +      - description: OFE CDM non-protected stream
> > > > > > > > > +      - description: OFE non-protected stream
> > > > > > > > > +      - description: VFE / VFE Lite CDM non-protected stream
> > > > > > > > This will map all IOMMUs to the same domain. Are
> > > > > > > > you sure that this is
> > > > > > > > what we want? Or do we wait for iommu-maps to be fixed?
> > > > Yes, when it is available, we can start using iommu-maps to
> > > > create separate
> > > > context banks.
> > > It would be necessary to justify removing items from the list. Wouldn't
> > > it be better to map only necessary SIDs now and add other later once we
> > > have iommu-maps?
> > I will let Bryan take the call on this. He was the one who wanted all
> > the SIDs in the bindings. Hi @Bryan, if you can kindly share your
> > thoughts on this and the interconnect naming, we will go ahead and push
> > rev 10 for this. I believe we have taken care of other things. Thank
> > you.
> > > 
> 
> Since when are we delaying patches for future patches that may land never ?
> 
> I'm fine with whatever clock name changes you can agree with Krzysztof but
> it seems a bit ironic to me to be given feedback to "align with previous
> dts" to then have the result be further change.
> 
> I'd like a bit of stability and consistency TBH.

:-)

-- 
With best wishes
Dmitry

