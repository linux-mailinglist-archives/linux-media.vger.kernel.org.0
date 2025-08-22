Return-Path: <linux-media+bounces-40723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77EBB310DE
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 09:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C6C93BE087
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 07:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AA32EA72C;
	Fri, 22 Aug 2025 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YK1Pt8v4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43B9289378
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 07:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755849389; cv=none; b=N2bYv+xwO8sTf+DKaQcq5HZ44NGJz0RREQddYIRUSlNtAjVaVUu1yi/XU9hY7njkaHcfFRXgCQJTOHjF/dH356lhJ5fMjwrg1y0e1Kugsvs+YgA+x2CWSgeEdkitble3Vw7Caa1Px4Ys+E5ddxz9PKXK6YQ8gxrqJaXdV5i6YWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755849389; c=relaxed/simple;
	bh=sHOs0GTYF6MYZzkAUKdAEyFSOLHdPyOfDHBdqaWR/vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcIgDhrL2paL7mJg5p0CG9HIC/FigIZysjN7GpxbSVlCMKOvqbIfu3NvBGZ0VnA8hPDrwH2e5sU/DIkNc5Efhly6R4jF6diBn9K9AKxswYGdHglvU/Ewe0Hno6i+j2HE27vh+5wTtbjArKhnNtHvMEBHavGHXHRBulDNYWgmOKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YK1Pt8v4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uXac008587
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 07:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxjEsGRVWBXmL4+Xk2TjpeP1dlOSunr5SAVA0TMBdcQ=; b=YK1Pt8v4CmNEOxY1
	5rkw7T8qYAduyb8S3n5VarGLRc5e1xCiAkiYG++dYinwK29QTp9lRHqh/4mtx0IV
	wFyD52mS5Lq11jNen0R37GSFoy+9rONhBs49Bv/825YKOY3IAhSMFrClwEfhcR81
	8pDQgr3RX/snLfs5TJ1lSEDsAmK7Orr8bDwxDwl0R8sS3HUSxebAmDGTsFtNvna7
	SCe/wIvQVd1JcX5au/diYhJQIFaVH96fK5aA6IdWl/WFFwKUBYv0I5rHLHIrP/bi
	yZ6fOTMbNxFQPlB8NaAluOlkTUGWfVuljXHyjhfB+FWiEHjOKLgCUMRmV1rOpvvF
	IveGUA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290b65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 07:56:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2eb47455so3750556b3a.3
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 00:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755849385; x=1756454185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxjEsGRVWBXmL4+Xk2TjpeP1dlOSunr5SAVA0TMBdcQ=;
        b=IG+51Er8o3e2Lw90dIwDM1R6pPFl1OPE8CvWhY1kzP9EDaVzlR0QOiwco06Zwexl6/
         mvUQPaYSyHlEamY2NvrWNx+2scMM3Z7GxyIy5c5vM0K51H9hKeNRP5kIMJm7szPb5sQT
         In2JnpdMtm/TfGeXHVxeqArolaUkUyw/s0Q7EgNfZsvoVQvY6kCxWzkK53zcrLNnlFs0
         4gKZCxeGNuaBfGQw5plwHm0zjGtbuwExB189rWTaFGkZTq8Gv8nDJX0Z/N8jJLCQg1om
         CZLu3UqwSbXkTcjwWtMBVSMZGpG47mQvu5+Qmk96v1B5+lfdWnZtH8C0113O0SLAEEPg
         D/Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWr1Q302EBHQog9TR37vDZhNj9AqTZaXu7sxJVm64K3KqjbR5AcaqdbPCcLB6YDlPlh9vPSB87KYuuVBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsArovxYl3Y/GYk4JquMwv8tDpJKy8QZrLYTvmot3YPMe1hHQX
	fRAIVpvHHCdh0Pt7JWo0bH9ihQRsPpIBrJiU/1qOe+Di9coN+6OzBVJaYNGHcbYNtRy1Bno4BsT
	ii68mDhAJdc2v/t6qJuIM2Y5HjqRQVSVlQIvjutr2zaZkkSOiOmJ18CL9c+c9j9J9YQ==
X-Gm-Gg: ASbGncvfcVp605mPZwBGhx6mM5fRb89SqnNfX4F2Rn0Ip0QqUjWW5X/Pg3jocykFfSH
	+RqxhrFj+QcwiGvI8BlaSt+GkkwttT22Dl5bu+zOlevpsqTLxbop2fLV02ov16UneWWDt6/y4b+
	5v1VkfSkwNDtEi7HTOUjiOeteP69cJICaxK1ZUUd5zn1KMnaREA8xJwI7uftbaoiqz4O2OU6pts
	piTzieJGRg+Pqr519p+jlnh580mDmqtjXfw5S417AK6+PXMXbDQ1ux0HvxidZ+pGyNnbYtzMeKK
	kI3p0yqa26/VMQ+4tc7emVEkG2z/Yl1fYYus7DFrFMP5JnGLxHwWDrLb69+y5E/fMKI=
X-Received: by 2002:aa7:88c5:0:b0:746:24c9:c92e with SMTP id d2e1a72fcca58-7702fa049a1mr3022772b3a.8.1755849385248;
        Fri, 22 Aug 2025 00:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMF01Mr6+dT2+CUQCN5miP9hd+BEDxJ7nvMcybVotwEZ27yWMtV1Jc5BCjDAR+i/MtiI/QbA==
X-Received: by 2002:aa7:88c5:0:b0:746:24c9:c92e with SMTP id d2e1a72fcca58-7702fa049a1mr3022741b3a.8.1755849384749;
        Fri, 22 Aug 2025 00:56:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d22e9sm10407083b3a.8.2025.08.22.00.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:56:24 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:26:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <20250822075618.hwiwfs6fjdxgaecs@hu-mojha-hyd.qualcomm.com>
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
 <aKXqSU-487b6Je2B@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKXqSU-487b6Je2B@linaro.org>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a822aa cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=mFb6QbOdW2Rl2U-Ib8IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: n2pU6lLSFUx_mAHCAg0oU9rjv1AnmwSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzMC1Y1he2WD3
 a/36vACkze2DO9sZLqZ4VYIiJQb2bb5FfgJNY0OhM/Vw3IMHcnWNMIuQrhUsEGVa9Jrfp9LVg0u
 jjIm3k0BZHLS+nDbjA1nlKOaGO5IwRAVlophV/onkxpEQrMOgy3yh+/X6Rylzblp9IHzJ1mi65+
 K6ldEQCBd12jYV5QLCEHmnsuon5/Yp9kE2poY5vfUlcdQLZ7cC5iBSjOWIhj388UndNhPbucnKA
 4Rf7qR2qz8hkBaNNDRZ0eYctD3m+BaDatEpoNYCKbgiiej3secFXycnd+F7cBDYTBe4YZPPQkQv
 LtnMImWvrFRg3lt2U1LkhZbE+NVcEVWOss8Mu4D+Pk6pdS0hNHg22wbeT0sSW1CsVhwN//erery
 R+BLxDYSr+rHrlaXKn8ViTY1LsiSgQ==
X-Proofpoint-ORIG-GUID: n2pU6lLSFUx_mAHCAg0oU9rjv1AnmwSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:31:21PM +0200, Stephan Gerhold wrote:
> On Wed, Aug 20, 2025 at 08:48:22PM +0530, Mukesh Ojha wrote:
> > On Wed, Aug 20, 2025 at 10:12:15AM +0200, Stephan Gerhold wrote:
> > > On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> > > > The resource table data structure has traditionally been associated with
> > > > the remoteproc framework, where the resource table is included as a
> > > > section within the remote processor firmware binary. However, it is also
> > > > possible to obtain the resource table through other means—such as from a
> > > > reserved memory region populated by the boot firmware, statically
> > > > maintained driver data, or via a secure SMC call—when it is not embedded
> > > > in the firmware.
> > > > 
> > > > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > > > etc.) in the upstream kernel that do not use the remoteproc framework to
> > > > manage their lifecycle for various reasons.
> > > > 
> > > > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > > > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > > > also want to use the resource table SMC call to retrieve and map
> > > > resources before they are used by the remote processor.
> > > > 
> > > 
> > > All the examples you give here (Venus/Iris, GPU) have some sort of EL2
> > > support already for older platforms:
> > 
> > Example was taken from perspective of remote processor life-cycle management.
> > You are right they have worked before in non-secure way for Chrome.
> > 
> > > 
> > >  - For GPU, we just skip loading the ZAP shader and access the protected
> > >    registers directly. I would expect the ZAP shader does effectively
> > >    the same, perhaps with some additional handling for secure mode. Is
> > >    this even a real remote processor that has a separate IOMMU domain?
> > > 
> > 
> > I don't think it is the case and think the same that they can skip
> > loading and Hence, I have not yet added support for it.
> > 
> > Will check internally before doing anything on GPU.
> > 
> > >  - For Venus/Iris, there is code upstream similar to your PATCH 11/11
> > >    that maps the firmware with the IOMMU (but invokes reset directly
> > >    using the registers, without using PAS). There is no resource table
> > >    used for that either, so at least all Venus/Iris versions so far
> > >    apparently had no need for any mappings aside from the firmware
> > >    binary.
> > 
> > You are absolutely right
> > 
> > > 
> > > I understand that you want to continue using PAS for these, but I'm a
> > > bit confused what kind of mappings we would expect to have in the
> > > resource table for video and GPU. Could you give an example?
> > 
> > We have some debug hw tracing available for video for lemans, which is
> > optional However, I believe infra is good to have incase we need some
> > required resources to be map for Video to work for a SoC.
> > 
> 
> Thanks for the clarification.
> 
> Personally, I'm a bit concerned about the code duplication in PATCH
> 08/11, I think parsing the resource table should ideally be code shared
> between the remoteproc subsystem and whereever else you need it. The way
> you parse it and handle the IOMMU mappings is largely the same, you just
> don't support all of the resource table functionality. Have you checked
> if sharing the code would be feasible?
> 
> If there is no upstream requirement for this right now, you might want
> to consider handling this in a follow up series, after you get the
> required functionality in. This would reduce the amount of changes in
> your series quite a bit.

Yes, there is duplication in the parsing and I initially given a thought
to do it but dropped temporarily if we are open for such changes in rproc
framework and I even have a doubt about 6/11 if it is fine or not just
because there is user who does not care about remoteproc framework but
worried about resources.

I agree, it will be good if we do separation of resource table related code
from remoteproc framework so that the code can be shared but doubtful
whether it should be done as part of series or and can be followed
separately.

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

