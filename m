Return-Path: <linux-media+bounces-44092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1AFBC93AD
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 15:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 442954F4505
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 13:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5DA2E7BDA;
	Thu,  9 Oct 2025 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A59IkNKI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394CF170A11
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015787; cv=none; b=rhlufD1QuIVbOoiR7PSfciaTHU2ESdIuA4+6fx0DbGT3TMT8dXNQFFgUuxTrZE1JAMQl+c1gKMR4FstXni1WiCdoW4p2VOBZenEiKqlnoEIiExeK9j9TlWYQCFEKWxpDh2v3w1WQggvo9NMr7Q9cAzHhkMWENTlH3Lk0Q0YR54E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015787; c=relaxed/simple;
	bh=byZJXp5xQvRjwr1XBbfxUK6KNLEQnDvc2B+Ct19+WYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpSTbGiyB4ktDOYO/K+dHdseXh2A3Wl4o4NIQSjeGC/zPpHaDDdMXw+7Qlbp1ASTu8k1pqKHyTqd9O9V25vV2/Q6fEjuiVZBNOFLePjsP6r4HjYhlgUuGLmZDlT1k7f/gsML9bPnEm3MJD3/V4BzUq9R/EsKiUaXS1bxfneL2TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A59IkNKI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EKUo019192
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 13:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	si01fMkMDos7NmfFNaLD+pXcqJXMLO5PPlBKBHvhE0w=; b=A59IkNKIWXduO++r
	MQRbEiFuKL29TNH8BK6jn4anz94HIscj+yftVjnS5DW0U01T5Q1nUb6WQSut1TdB
	JMBpcq12QRnM7OlvWlq4VCZlhaXzf4bGuxvX4Gp2iPffYjm33fxnlufrs6xEKinp
	85bxeahSfkoUBMwXMNUGTU73q2Ms73D88vWWCbcrDK1LSBN45xw675u+E+2kqzd9
	sD3iZ2RJkQySwkQMaDGQtIOBreTWqhexLpp4HYy1LValFORBhH8Enfmm7NJE6SB7
	0mtvMCqkoEQdNvniK9I8glO92choqIGnJlu2cohFKjM5OPoybIK6u5GvbaX59C8t
	eFB2yQ==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ntvd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 13:16:24 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-42486b1d287so42194175ab.0
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 06:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015784; x=1760620584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=si01fMkMDos7NmfFNaLD+pXcqJXMLO5PPlBKBHvhE0w=;
        b=q1W3ofS95qY3Q+lsX0xBvlJE+V4C/0uHON+uWAJXk6/XRa04cTETfDjtNJXBC6d6NH
         f6dB2+Od4NwrLGdayjhMlbdjzPdADSI0VKJMfvGtNmsVYlQNsMrdnvLBx53xYqKUiZRk
         Gzy10JUjM1JVqDooQvJNmc4RksjPFdyyCRDeCO/uFU/IKw/Bc4O2Qd6bHUKed1WQHwsh
         sXpSOxMZMmgCxNhg1zCx5qFxuz5LePnBbnssH7Ou1g+74Ijf+aqMaGjoVZtfddTDgAj3
         HefJFsJKQo6bA6jdlo0y5H99jHfot1A5M2EhV8VcQlL+CnFwSkppcoKl7r4C0oEi8d1n
         sjOA==
X-Forwarded-Encrypted: i=1; AJvYcCXNTzyN0Qx+tAMQKaam5RsSGSsVGmYaQTo7Lt+tT/4rh157ApKOw9TqC17ptk8riPOPwWDns9k+cX5sxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyagwAlyejVWucuhZTwCPYpXa+3SZ5wOQajjGxKJxXKHH74JcE2
	k8CQZ0ZFzLOOfxDUL2est9uGi/1kRSchifCGT2ZmOWNKnOcyXyJfmBqOaeDsQFHZa2vW3X7SBdn
	pIbOBPjJ8xpmyIW+uwoG32j65pAAVp5DCLntPVtjwVNyaar3f2HhFPZGOccdROCV49A==
X-Gm-Gg: ASbGnctA4G4CjVFO7PlwGYLzpQ2FUafuat4rp2gLd/3a3nMmAS72Is8C9O1fyuqZJxr
	EPv1VD76at3Ar2ZlFk+ZVPt9rjA1XOf9BSwzmJzCpGPcJAMAmURC8F1+dGvGBd8ZPZkTSHyeA0c
	ULglcIGjKIXj6DfeNXrQO7ZUtdckSVfQ+j3Z6y6rlglsfs7L/Spb1U1Om3+uRNjhF0LSu+BxveB
	yhlvAx6F1YbRePWvLybRBCpjo5JS7SKC1RhvCfXqHKzUNyMDQ/7iWfH0+/EnuwgdB/EgICPRucK
	bBa6601q1c0BZa99d8+oBDdpqM/rTkbpjac1l2lU7ITqlWGbHpQv3eYzJXVhdLbaGlVcakUpalX
	ddusxZ03aiAHINxDjIBATUf+v3x7/RFJZcDY7ImwddS2gjuultOZihfZAOg==
X-Received: by 2002:a05:6e02:4417:10b0:42e:6da4:6045 with SMTP id e9e14a558f8ab-42f873e10f9mr60698715ab.15.1760015783747;
        Thu, 09 Oct 2025 06:16:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENF3cNLWIJD7hri5j4RPfGdqqAcc87Irixm/Y0D5JStnLVv9icXcv3y4uc8zBOI0XgKq8iPg==
X-Received: by 2002:a05:6e02:4417:10b0:42e:6da4:6045 with SMTP id e9e14a558f8ab-42f873e10f9mr60698025ab.15.1760015783071;
        Thu, 09 Oct 2025 06:16:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac24d54sm1046016e87.57.2025.10.09.06.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:16:22 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:16:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, joro@8bytes.org,
        will@kernel.org, saravanak@google.com, conor+dt@kernel.org,
        mchehab@kernel.org, bod@kernel.org, krzk+dt@kernel.org,
        abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
Message-ID: <7tiiofiabm5nqhrv7ilephhq7ydi6yhrzgeffcjy6x25b2f66c@df564ozlndkv>
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <CAL_JsqK9waZK=i+ov0jV-PonWSfddwHvE94Q+pks4zAEtKc+yg@mail.gmail.com>
 <1d36569c-55b9-4390-87d1-fd0c2f837014@kernel.org>
 <496c2d88-2558-42fe-8434-81c000955a84@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <496c2d88-2558-42fe-8434-81c000955a84@arm.com>
X-Proofpoint-ORIG-GUID: pRntKEzfqaivtUk4oUTpYW8N_81gA-Ih
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX1GqKRZa1uYAV
 Hfo7YaXKG3k/hkzSfwhoCsDGyY1BmFVdmdbUoL94z+hnnbOJwkCmKU/9mKMb9TsIST2SXl3Avxx
 BS+Tw64o/pUmj4qJqsTycnb/IavEmMgvmU27Tj6ggoWSdxGxNoWfPz2vP1rWs4uaN8juMTU3jFQ
 y2Uesb55N/5SiKIu+jFHRt1SO+ikrhZCo1nYzjIIX5E6aZTLVfnNdfo5GiUP1DmeG3Bf8cE1DCB
 kqSiPmG6CcKavrrE761eyjFDsaXWP0EHB+CAMfaKZlJZRDbB8Ye8tJOyA2xvFpMchceiBvXl09O
 mHZPymw88MvUR/8pETjCICaghfayGjYqIV7j+tUWkcbmHWJzHVjv2ctwOSRg2ZYMlfxTWV995AZ
 +H71Vzg/pxETm/447ljLfxoOr11KDQ==
X-Proofpoint-GUID: pRntKEzfqaivtUk4oUTpYW8N_81gA-Ih
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7b5a8 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=cBvgwCyFEIGKxSJreoUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 01:16:10PM +0100, Robin Murphy wrote:
> On 2025-10-09 1:26 am, Krzysztof Kozlowski wrote:
> > On 29/09/2025 05:23, Rob Herring wrote:
> > > On Sun, Sep 28, 2025 at 12:17 PM Charan Teja Kalla
> > > <charan.kalla@oss.qualcomm.com> wrote:
> > > > 
> > > > This series introduces a new iommu property called iommu-map-masked(may
> > > > be there is a better name), which is used to represent the IOMMU
> > > > specifier pairs for each function of a __multi-functional platform
> > > > device__, where each function can emit unique master id(s) that can be
> > > > associated with individual translation context.
> > > > 
> > > > Currently, the iommu configuration - at least for arm architecture-
> > > > requires all the functions of a platform device will be represented
> > > > under single dt node thus endup in using only a single translation
> > > > context.
> > > > 
> > > > A simple solution to associate individual translation context for each
> > > > function of a device can be through creating per function child nodes in
> > > > the device tree, but dt is only to just represent the soc layout to
> > > > linux kernel.
> > > > 
> > > > Supporting such cases requires a new iommu property called,
> > > > iommu-map-masked(taking cue from iommu-map for pci devices) and syntax
> > > > is:
> > > >     iommu-map-masked = <FUNCTION_ID1 &iommu ID1 MASK1>,
> > > >                        <FUNCTION_ID2 &iommu ID2 MASK2>;
> > > > NOTE: As an RFC, it is considered that this property always expects 4
> > > > cells.
> > > > 
> > > > During the probe phase of the driver for a multi-functional device
> > > > behind an IOMMU, a child device is instantiated for each FUNCTION_ID.
> > > > The call to of_dma_configure_id() on each child sets up the IOMMU
> > > > configuration, ensuring that each function of the device is associated
> > > > with a distinct translation context.
> > > > 
> > > > This property can also be used in association with 'iommus=' when dt
> > > > bindings requires the presence of 'iommus=', example[2]. For these
> > > > cases, representation will be(on arm64):
> > > >     iommus = <&iommu sid mask>; //for default function.
> > > >     iommu-map-masked = <FUNCTION_ID &iommu sid mask>;//additional
> > > > function.
> > > 
> > > Where does the FUNCTION_ID value come from?
> > > 
> > > Why can't you just have multiple "iommus" entries where the index
> > > defines the default and any FUNCTION_ID entries? What's in each index
> > > is specific to the device.
> > 
> > 
> > We discussed the problem earlier and that is what I asked them to do.
> > Apparently I was just ignored so now two maintainers say the same. We
> > can get ignored still and the third maintainer will have to tell this.
> 
> The reason why that isn't really viable is that the "iommus" property needs
> to be consumed directly by the relevant IOMMU driver(s) without a dependency
> on any driver for the client device represented by the node itself. For
> security/isolation purposes the IOMMU has to know about all potential DMA
> sources and be able to be configured for them *before* anyone else gets a
> chance to start initiating DMA from them. If the DT consumer is, say, a
> bare-metal hypervisor, it may have no understanding whatsoever of what most
> of the client devices are nor how they work.
> 
> This is part of the reason why we went for a separate "iommu-map" property
> for buses, so that an IOMMU consumer *can* easily tell when multiple
> specifiers do not represent an indivisible set tied to the given device, and
> thus it can expect help from a bus driver to subdivide them later (but in
> the meantime can still safely isolate the entire bus based on the output of
> the map without having to understand the inputs.)
> 
> Now, I suppose in some cases it might be technically possible for a client
> device driver to collude with an IOMMU driver to divide a monolithic DT
> device into logical functions after the fact, but for Linux I don't see an
> acceptable way of doing that without some major changes to the driver model
> abstraction and IOMMU API...

Tegra host1x handled this via iommu-map, but that's only because they
don't need to specify SMR masks. That was the reason why we modelled
iommu-map-masked in this way - to follow the approach established by the
Tegra display drivers but in a way useable on a platforms where we need
to specify the mask rather than the number of SIDs.

-- 
With best wishes
Dmitry

