Return-Path: <linux-media+bounces-44135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A0BCA8FA
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 20:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD89C4EA5C6
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 18:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA3824DCE8;
	Thu,  9 Oct 2025 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxQpPko1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012A423CEF9
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 18:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760034309; cv=none; b=E7uTNtQNXIfcLvt6pD8TTeWrYFvXpRyw/atFn01xGL8AquLgemWYLSBKh5jyYLYT1mdHcJsazIXu44zd5n1HUjclwE1YYHmppHC/9Lox5iJJ63Jj5rIiURJjnmg/GcoDP11R+u1IF0SfYBBWMZxsPVfr7mlt3jbxqveignUZ8rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760034309; c=relaxed/simple;
	bh=jp6n23+Qon0Y2Rd5lGPNFx2F8NwRI69m1if3zfSKUiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqt6QXncTv9/eH0rWQuJFsnXkGDm6Btr03E7Gp6UVskH9jV1QWGrmoRoo85mTWTXHxQ58E911aLUlPFwHqa+n5kpwsG0EoDJqAxJt98kia7W4FGHcb6dTMaJMfJKhjz0Nbw0qfE2XTVWCEoUt7GEO00v71f91xBwQ4lLS6Y6pSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxQpPko1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EPmIZ004912
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 18:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5WmouaigJPMDcXEgyz/YOkL3
	CsweO/cHwliU0xFmscw=; b=cxQpPko1m4R5ETiRSRsON0iOUsd7pvVZsXzuf6/A
	ZukqQ/Td1GO0OSs5x1uio3fRynGzgdqtWe1Crj9MtQW4j/x7ikTSSvAwuQnGGLjY
	dvdLpT1z7iG6E7l5Gi67PAopxeNTbkrOAsuVL0gLFxa9AemQwpe7LPnUbgUiD2KV
	myW3OiSoz8yrN+klOGmBGgBPRVCtu9ImP3a42lJirldq4RWexxzuKGnZ4CxztwBx
	649UrhsprGXTDf/g2a5wnoo29E8i02EQDftZhUmgrkeRQHzw1Uj6iAHdAKgP0Br5
	yTEQ4YniMtc6q49wotfArH3nJAl/Tnca34BTDhom/g3ddw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u3x89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 18:25:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4df80d0d4aaso50078951cf.2
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 11:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760034306; x=1760639106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WmouaigJPMDcXEgyz/YOkL3CsweO/cHwliU0xFmscw=;
        b=fyrqLlfZlt2XbxTQXNA+rHHOHLqMQinzaolpCTieEAZX+YgSSwxstd8qslwEjspVsk
         gkoHl8HTAEApm0oDUF+5YzFLrUMVQEvXSa89Sthn6LuQp8OI7oyhpSykGs36GJrz4o5F
         2hgtNuBYKimaMIvy/31C6/2Sj0b96i02saq34ppAUTV1jAc67T972/+m/9UqGTRY8Yq1
         cR5AntN7rK05qzcarWk+EWOXjeEfrpen5IjIjMA7pB0HVh7yRrAJhr3R+6LkQAcj2iSp
         7QrdOr5A7FLSjb3PV2zj5yZ5bBOgUVpy+XUshnvBvGYkp6FnDY5npY/8bSl9xQN6jLue
         UzcA==
X-Forwarded-Encrypted: i=1; AJvYcCV6sh2Jp9BrXM1Uj69aNYfFnH5utIpB8hMt8JgMZ+sDHtfx8oQnT0VTia00V5kFwkdy0OTHeFgk8+J5Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEgpgkFnuwbOr4AWxmL4wmb6lhu2xqYfG0SlVwW8lmpf/ITRwS
	BYVngsnw7/jUVT18SFFGTMCC8Y/CIrQ8Tg4z2RP8nLgkbCJ4/w0FYJbfMsyZpMuoXNVMhwc4W/W
	B20HE4zeIkHmjxoNcRNmr+vi+19ssepqVDHZyiHpO9jvZ0DM1D+FtLyE9gkpV/R82Zw==
X-Gm-Gg: ASbGncttpl+xPWoTLkgyDaWv7uw+3LYfM1LKhjsLPBI2617ysKyq15kajXCKt37OyFZ
	BuxnLHD6T11NONk9Y8gfQZtJxk84D2zbLp5yT0RRrPoRtd0oAi5rS24nbzmdlFGzNYjqxjUnOxY
	LaU8vM9A2xjI+R+rw3N0BFeIC7vlHZvR/rtHwCWeqHNy03iSYnqievbqhVUpUeX/MWzJrUT9XWm
	1qzJnVNdlvDBn1OdAPkjad1MISen4EO0crlUHW8v06VWyr5Wx/2rX3RlE3ntr9cKOSwc3nO7ZEg
	tYM4PvnfL0ljXz6pl0aXuLkhcsLSXxEWBtzO/JQ0HZ5yUhrLpb5xXV6gQdQTMzBcEySsO2dRcv9
	ZPiApbYwWD+6ArNYfLC+vKRuJiSQfzVb4XZS2TLymkYcoqxiRr2L/8Ys97A==
X-Received: by 2002:a05:622a:5c8c:b0:4da:3218:e8d7 with SMTP id d75a77b69052e-4e6eacc1f4fmr134279421cf.4.1760034305515;
        Thu, 09 Oct 2025 11:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXYd5icY3uU+XNXR6r+B65WuUw2SxQ/2Nhq6GlN0Pnod95XOYX21DP+RvUBPb3V4ep5r8nMQ==
X-Received: by 2002:a05:622a:5c8c:b0:4da:3218:e8d7 with SMTP id d75a77b69052e-4e6eacc1f4fmr134278401cf.4.1760034304710;
        Thu, 09 Oct 2025 11:25:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908857792dsm63841e87.105.2025.10.09.11.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:25:03 -0700 (PDT)
Date: Thu, 9 Oct 2025 21:25:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, joro@8bytes.org,
        will@kernel.org, saravanak@google.com, conor+dt@kernel.org,
        robh@kernel.org, mchehab@kernel.org, bod@kernel.org,
        krzk+dt@kernel.org, abhinav.kumar@linux.dev,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
Message-ID: <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
 <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e7fe02 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=9yEbADBicBGoLvg7PPkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 6Tio0VRwPaHqoC6U31_nkUQViH4evbsZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+gaz+7THHXLW
 kSxdQq+kbn7upXrFYprK/1xm06c1xegS7z6OmXgWckVrNaR0zJUj6o5cyGJVqYQQA+ZB3sHXzMf
 gen6d61BESWvAPJpZcgVwfRW4dicFjsZTrNb5YwowOPgCcfxZ3bCMhd8q98FaRhwdreQbphq7ws
 W+zSqzWs4v+RMnmrRrGesk+RShEl8Mo80c9lIm1DoS1ceFiEMmmZzYkHvUYBWVF2SPrBcCdfJ7h
 Zl8PoHND4rkfDwVeJaWyfkq2h/C+mam3okqbkMC5C91XeFjdvuPfSjOM4Ke5YcZ1Oialhi23LMk
 JG1Xe+GzA/9c8NDVnZNwTly5544oNOPA4ne+aUHdfP0abH+s5yeGBKDqnvzajtfJWLymkeVLkLX
 2b71jlT0B5+36p8LtSAoBTZCleqL8A==
X-Proofpoint-ORIG-GUID: 6Tio0VRwPaHqoC6U31_nkUQViH4evbsZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 06:03:29PM +0100, Robin Murphy wrote:
> On 2025-10-09 2:19 pm, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 11:46:55AM +0100, Robin Murphy wrote:
> > > On 2025-10-08 8:10 pm, Charan Teja Kalla wrote:
> > > > 
> > > > On 9/29/2025 3:50 PM, Robin Murphy wrote:
> > > > > > USECASE [1]:
> > > > > > -----------
> > > > > > Video IP, 32bit, have 2 hardware sub blocks(or can be called as
> > > > > > functions) called as pixel and nonpixel blocks, that does decode and
> > > > > > encode of the video stream. These sub blocks are __configured__ to
> > > > > > generate different stream IDs.
> > > > > 
> > > > > So please clarify why you can't:
> > > > > 
> > > > > a) Describe the sub-blocks as individual child nodes each with their own
> > > > > distinct "iommus" property
> > > > > 
> > > > 
> > > > Thanks Robin for your time. Sorry for late reply as I really didn't have
> > > > concrete answer for this question.
> > > > 
> > > > First let me clarify the word "sub blocks" -- This is just the logical
> > > > separation with no separate address space to really able to define them
> > > > as sub devices. Think of it like a single video IP with 2 dma
> > > > engines(used for pixel and non-pixel purpose).
> > > > 
> > > > I should agree that the child-nodes in the device tree is the easy one
> > > > and infact, it is how being used in downstream.
> > > > 
> > > > For upstream -- Since there is no real address space to interact with
> > > > these sub-blocks(or logical blocks), does it really qualify to define as
> > > > child nodes in the device tree? I see there is some push back[1].
> > > 
> > > Who says you need an address space? Child nodes without "reg" properties,
> > > referenced by name, compatible or phandle, exist all over the place for all
> > > manner of reasons. If there are distinct logical functions with their own
> > > distinct hardware properties, then I would say having child nodes to
> > > describe and associate those properties with their respective functions is
> > > entirely natural and appropriate. The first example that comes to mind of
> > > where this is a well-established practice is PMICs - to pick one at random:
> > > Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> > 
> > Logical function, that's correct. And also note, for PMICs that practice
> > has bitten us back. For PM8008 we switched back to a non-subdevice
> > representation.
> > 
> > > For bonus irony, you can't take the other approaches without inherently
> > > *introducing* a notional address space in the form of your logical function
> > > IDs anyway.
> > > 
> > > >     > or:
> > > > > 
> > > > > b) Use standard "iommu-map" which already supports mapping a masked
> > > > > input ID to an arbitrary IOMMU specifier
> > > > > 
> > > > 
> > > > I think clients is also required to program non-zero smr mask, where as
> > > > iommu-map just maps the id to an IOMMU specifier(sid). Please LMK if I
> > > > am unable to catch your thought here.
> > > An IOMMU specifier is whatever the target IOMMU node's #iommu-cells says it
> > > is. The fact that Linux's parsing code only works properly for #iommu-cells
> > > = 1 is not really a DT binding problem (other than it stemming from a loose
> > > assumption stated in the PCI binding's use of the property).
> > 
> > I really don't like the idea of extending the #iommu-cells. The ARM SMMU
> > has only one cell, which is correct even for our platforms. The fact
> > that we need to identify different IOMMU SIDs (and handle them in a
> > differnt ways) is internal to the video device (and several other
> > devices). There is nothing to be handled on the ARM SMMU side.
> 
> Huh? So if you prefer not to change anything, are you suggesting this series
> doesn't need to exist at all? Now I'm thoroughly confused...

Hmm. We need changes, but I don't feel like adding the FUNCTION_ID to
#iommu-cells is the best idea.

> If you want to use SMR masks, then you absolutely need #iommu-cells = 2,
> because that is the SMMU binding for using SMR masks. It would definitely

I'm sorry. Yes, we have #iommu-cells = <2>.

> not be OK to have some magic property trying to smuggle
> IOMMU-driver-specific data contrary to what the IOMMU node itself says. As
> for iommu-map, I don't see what would be objectionable about improving the
> parsing to respect a real #iommu-cells value rather than hard-coding an
> assumption. Yes, we'd probably need to forbid entries with length > 1
> targeting IOMMUs with #iommu-cells > 1, since the notion of a linear

This will break e.g. PCIe on Qualcomm platforms:

                        iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
                                    <0x100 &apps_smmu 0x1401 0x1>;


But this seems unlogical anyway wrt. apps_smmu having #iommu-cells =
<2>. It depends on ARM SMMU ignoring the second cell when it's not
present.

> relationship between the input ID and the output specifier falls apart when
> the specifier is complex, but that seems simple enough to implement and
> document (even if it's too fiddly to describe in the schema itself), and
> still certainly no worse than having another property that *is* just
> iommu-map with implicit length = 1.
> 
> And if you want individual StreamIDs for logical functions to be attachable
> to distinct contexts then those functions absolutely must be visible to the
> IOMMU layer and the SMMU driver as independent devices with their own unique
> properties, which means either they come that way from the DT as of_platform
> devices in the first place, or you implement a full bus_type abstraction

Not necessarily. Tegra display driver creates a device for each context
on its own. In fact, using OF to create context devices is _less_
robust, because now the driver needs to sync, checking that there is a
subdevice, that it has probed, etc. Using manually created devices seems
better from my POV.

> which will have to be hooked up to the IOMMU layer. You cannot make IOMMU
> configuration "internal" to the actual client driver which is only allowed
> to bind *after* said IOMMU configuration has already been made.

I'm not sure I follow this, I'm sorry.


-- 
With best wishes
Dmitry

