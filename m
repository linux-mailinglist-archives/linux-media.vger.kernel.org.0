Return-Path: <linux-media+bounces-40461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C153B2E261
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 18:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 000005A10C9
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDB332BF37;
	Wed, 20 Aug 2025 16:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQVZFyf6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173532D3ED1
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707581; cv=none; b=kz0fnmpd/zYIEPl/ozaQYIyYuz1YD3L1Fj3LaNQNyrzrTt97VSogDa5aQXqxfiFcNcVTCCbqOdXmCWXGTlaICZfw5hmhasasqQhCmHKDcNgkK0jDLhgvxrbp9hJ4TXc5bfNde0x4T9VBCIuk0P7hT87wBY2tLaw8MBjvpsf/zp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707581; c=relaxed/simple;
	bh=ek1uZRR3yVQREq8MktmJCRi7FBsB8kVi1MTlISfhc9c=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgqWBmmOK2ho0LgH8HTlnpAne93ESvkLDXm45ItVj+dndr70LXf/h6fnNUJsnGTRW+h7lMLRHgpSMi/d2gn5O/Hd52ley3AiL6nTinKvnC8fsvW4wVNzIslk0Bpo1AYUI1piiwqR85OfrduWzfLHNCi02fDPHqMQkwYITaIB2OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQVZFyf6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KAaV8b011766
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 16:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJpU55n6EWwcBk2mRT86w2Qmc2jh1ppOl8Thz+35/TA=; b=pQVZFyf6njDKvkqR
	/HiMQzmPurRbgDPF0+Ah6V3My3vEkp7N9E0mzyi8bPQV9UcMh6a9Vrud/x9aBZif
	Vo08YEkLpV21rHja6n9fdegiigULS85prsT7gW2TDlKvNvtLTMTkBYaxX1+OhTta
	1DnwDbgTA3tPIyYl0rwjOG3ZF3AjStx9O0munHvh7w3lQwT5vnazmfG3/IW2JOpZ
	RffjO23BomWdJ7/3S8VQZro5FxHIo5cImcbp6UU5L/Iy5N6I1lN/8SB9FjRdLZJB
	i8E1VquO1MsyXteTaEzF1zVanT5CRAzf0fVva8dZTfF049ha1BoDaImVJlQJeqHg
	2pEeWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528tcup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 16:32:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-323267c0292so104071a91.1
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 09:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755707577; x=1756312377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJpU55n6EWwcBk2mRT86w2Qmc2jh1ppOl8Thz+35/TA=;
        b=F6n02imm3bll/J0Pzwt9gbWdJD6GFuEkEFgKUQHjIn8WP7SccR5blnu1IqPJKmLVnQ
         8zpEWzp26Xl1pb3pIx5UdUt9DCjhFgnRFCrD4gXCJXrVhtXNcCiGRp1hoVEl2xVxSAT+
         qT+N7FEQ6uEbgHfkZozO5bIKgMysnm1pCZI2b7w0+msfoFhDM8ZHf8vhhjjkI9XCXxIL
         W6d7V641DE9SVS9hBbZaCQ4l0+IV1KSweZ1zBPuDuHvBcBDEthwBVfFMC93rv9DklcuK
         KFgGs8KljbZ9YakbzJPUIqcbv1z/vsp+3Jz9w3s6JJ8pAqoJdMTqnvTaY+b6jmEACUY/
         +4Cg==
X-Forwarded-Encrypted: i=1; AJvYcCX8bZnSbW1jWYbDmHsxpdc0qH31J5ayufenkX/AuGZeSFWNy3gyc2KW3pk/lISIOV59IR/Aem7zn1AAQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPyo/IUnLGOgz8hzIp9XSjNFOGy6Ww+5JzImYUCxcQltdXe8Ci
	bh4TvMyWmfyayaBoLDyZWfFRFCoSBBW4MwlvwEV5pIMjylFdBuY5Pnz9EjV6D9usWzSCP9Sdbu3
	IBXO4O66kEzK7Z+HQtdh+JlFEEErmzTduitci+vqf3ckaZhH3U682erzubOLUtqmdMA==
X-Gm-Gg: ASbGnctQVnbsdYOxAvB/g/Q2QZ7h9Wqjzz3D/9YrcomTSoKE2Z1FGUxf7tbqUQcoSa3
	8PreVwkcj+b9vp/GmE+8rqr5Pqey0JHcRP0pUsPjb35XRLxGfV+l5IOskfJ3yIgoKAmrFUAc41J
	IOUgwb/9Fw2o8gaKufYdMkgYfPiGL4FskXrBwQzrRXWFDfnbZuEfWiolhbf3RncqmrLVCc3f3Z7
	N/W8NSfAsTMBvOaxshpWfyHkj7u3HXmC300VZbMFHx56M5n8tbBfT29WtATyySpHTD0Sru+1t7+
	mXCqZ5fFZJctrxwB5BFDPxyg78/cNs3zQuu96VND4X1vncKUZSFZSFBwQL6nkzLAIHI=
X-Received: by 2002:a17:90b:1d05:b0:321:87fa:e1f1 with SMTP id 98e67ed59e1d1-324e1420bffmr4083051a91.22.1755707577532;
        Wed, 20 Aug 2025 09:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH94fcQIM0EQQ4FOX9IB+jNU3oqMNrDLBrQ3XekIZjMt3ZLm2pAz1R8JGDpb1Pkzk/QqmZJFg==
X-Received: by 2002:a17:90b:1d05:b0:321:87fa:e1f1 with SMTP id 98e67ed59e1d1-324e1420bffmr4083013a91.22.1755707577028;
        Wed, 20 Aug 2025 09:32:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e254c74fsm2765675a91.13.2025.08.20.09.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:32:56 -0700 (PDT)
Date: Wed, 20 Aug 2025 22:02:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
 <aKWDXySSt57tXHVP@linaro.org>
 <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a5f8ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=9xhQPkZVqO5vzfdQ-C0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: geNszbybhCXH1P06WgrwTw1heni8JsmM
X-Proofpoint-ORIG-GUID: geNszbybhCXH1P06WgrwTw1heni8JsmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX68eEzv0whAQb
 mFrW474oyeHKHOVyDsVJcLSNbmmIk8pW7FsZ+zEoaDMkOZv0SrU5S47ABNvrGLKN1SqqBZp7xn9
 LStdh2OMvnYiPqlreiFezron+jWueRNokSaCNuePnZ5yGvQ/Xp3A+muuArqbg8HufkR7H3MfJiD
 3ZAllqIMs2sIjxFih8kR1VCrbI4jx7AW26EU58TrpeC26WimCrCOLWReH+/FvUC7at476PCwcIz
 +VX4KIedfOwFjnJWqEc8hbd611zFztZmpCA4XrFFye5NJX4z8VljRzA6jZj7ILN13BZE3IQ1EDk
 92B6wKwi8tHpmCiqM/MqVFB3DGGA3P4gYTqXUcPsLO9qJcmz6Glwoxo98X5kodeZLEIXFIa/D4T
 Yd99lQ0mdsM4C3IZijnBgu2vmeGiKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 08:48:22PM +0530, Mukesh Ojha wrote:
> On Wed, Aug 20, 2025 at 10:12:15AM +0200, Stephan Gerhold wrote:
> > On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> > > The resource table data structure has traditionally been associated with
> > > the remoteproc framework, where the resource table is included as a
> > > section within the remote processor firmware binary. However, it is also
> > > possible to obtain the resource table through other means—such as from a
> > > reserved memory region populated by the boot firmware, statically
> > > maintained driver data, or via a secure SMC call—when it is not embedded
> > > in the firmware.
> > > 
> > > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > > etc.) in the upstream kernel that do not use the remoteproc framework to
> > > manage their lifecycle for various reasons.
> > > 
> > > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > > also want to use the resource table SMC call to retrieve and map
> > > resources before they are used by the remote processor.
> > > 
> > 
> > All the examples you give here (Venus/Iris, GPU) have some sort of EL2
> > support already for older platforms:
> 
> Example was taken from perspective of remote processor life-cycle management.
> You are right they have worked before in non-secure way for Chrome.
> 
> > 
> >  - For GPU, we just skip loading the ZAP shader and access the protected
> >    registers directly. I would expect the ZAP shader does effectively
> >    the same, perhaps with some additional handling for secure mode. Is
> >    this even a real remote processor that has a separate IOMMU domain?
> > 
> 
> I don't think it is the case and think the same that they can skip
> loading and Hence, I have not yet added support for it.
> 
> Will check internally before doing anything on GPU.
> 
> >  - For Venus/Iris, there is code upstream similar to your PATCH 11/11
> >    that maps the firmware with the IOMMU (but invokes reset directly
> >    using the registers, without using PAS). There is no resource table
> >    used for that either, so at least all Venus/Iris versions so far
> >    apparently had no need for any mappings aside from the firmware
> >    binary.
> 
> You are absolutely right
> 
> > 
> > I understand that you want to continue using PAS for these, but I'm a
> > bit confused what kind of mappings we would expect to have in the
> > resource table for video and GPU. Could you give an example?
> 
> We have some debug hw tracing available for video for lemans, which is
> optional However, I believe infra is good to have incase we need some
> required resources to be map for Video to work for a SoC.
> 
> > 
> > Thanks,
> > Stephan
> 
> -- 
> -Mukesh Ojha

Since I am not subscribed to any of the mailing lists to which this
series was sent, I am not receiving emails from the list. As a result,
your recent messages did not reach my inbox. Additionally, it seems your
reply inadvertently removed me from the To-list.


https://lore.kernel.org/lkml/aKXqSU-487b6Je2B@linaro.org/

https://lore.kernel.org/lkml/aKXQAoXZyR6SRPAA@linaro.org/



-- 
-Mukesh Ojha

