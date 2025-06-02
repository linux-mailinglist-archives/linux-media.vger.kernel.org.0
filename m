Return-Path: <linux-media+bounces-33868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C42ACA95C
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 08:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E9A33BCB0B
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 06:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BA52D7BF;
	Mon,  2 Jun 2025 06:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XraCxOmu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447DB29D0E
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 06:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844967; cv=none; b=C/ouOCNz4cOf0eU0uBLxiOAiUjsmL24ACBz0tZLmAqDx2z1C7VKAFCr/vJO2h6Mp4EL5EgRZAv//fwOvv955IPqzxDDiEbqN0ElqP4Rn+A8JG/c2QwPctEaNKPObEuv4l+4bkGEtwwRD3ICXBaByY6okcmSKKAOw64XKTAULOwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844967; c=relaxed/simple;
	bh=MgYGJjcaOy3g9B8ansHeoP+Sr4Le37ZDce4ZltXmBE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQkrbx0NdUF/x1HsVcF5a2Z0AA4wrUUstE+QuYgttl3Orbd5W0lq/srix2rZqq3ZS/lW3QONWwFouBNyctsc7bAO2/iOFLzO4/oAhozoRmElkeMcs6oQ8YFtlGCFVx6ewSmhAbW7/N9OoY7SAzscv145/OHkQy5AXhiwNx/zqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XraCxOmu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551MAmIH009412
	for <linux-media@vger.kernel.org>; Mon, 2 Jun 2025 06:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L/r1Qv5RI/jsPHsDGhlVxJ4P
	JGcaISPdQThlQ7RaoCA=; b=XraCxOmuQkm3GjU7crMKmoD2Vi5RRyMYOveQjFAm
	06stOP+tXqrduiiGjySgicTqvRcLkOWJVi9zU72Rw+QHC5LD436OXORNgJ467KqX
	t5aocx0CUjoCV1JS2hbB601bL7iWsyZD3GT1PTvMpA5Uxy1sXbqvp7wLAi9YWhfz
	b7oX5sYbRJFyDLrn4c04K+pCdZk7M5fbDDEw7sf8F+spupZPFEOt8d0Gh2g9+Tdi
	CKiFYy7OFXFesIeoIdg7G92LRtxt9Vs85WeWRHz/uf7UHy0t/GcmpxSdY7OLdTsz
	e0V1xPITXFiinZyOxJuVBT9+l6Z91SAEN+P68lsj22B2ew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkw3j04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 06:16:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee988153so701768685a.1
        for <linux-media@vger.kernel.org>; Sun, 01 Jun 2025 23:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844964; x=1749449764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/r1Qv5RI/jsPHsDGhlVxJ4PJGcaISPdQThlQ7RaoCA=;
        b=CEnmJJH6MbLtw7RF5VuT83O5gJdYBDR2RNiFraNMJCpCLeoYMZP8eRPoTOj5Y20wzs
         Jg5MjbivEIGRhdZ3RULYBZWjBqeVi6UeXniz6+evjz1j1ehxZ9FpIAgtOFUOcCKhJ+2U
         Hm+XbPbYnhlC81M5AlGdgjVZSjW8nNcQjInIgwvoea/aPAs0aToGTyYBb8KiQDYGhsrM
         Y0iluolEC0OwGizf4VJyBg4wubCHs7tyKrONHGe70N3wLysXgSGLft5qGr+XcwmpFSdK
         Sce7orz+pOg3HbgL9kL4PAMSAN98mViInr5W5sDS2ZIQk3Ux/k8zsJKfTPxcDdmQ94D8
         uZHw==
X-Forwarded-Encrypted: i=1; AJvYcCXpB6yzpV1lijjBkhTSYfGjGpW9dVfZYyxj9q0lVy/MHzgmwM2ip0kWdh8L+fp4nuWWqLxBLCrbmHIUGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl8rlnk3nHLJgPu5Iu3eMIYNrup0El6qx4NmRldgCGvpQaZBxz
	APCY1EBHd2MPozZjrKyrrW++cT3NPT/OYEvkD9spV/YRVmfgBI1eSr6mqE4rskyRaEFNf5Y7XEU
	v1XfcpSZ+SN2OKqiOTJVFdjwQKvftyVrbpIin1XYgKpLz7FOq3yd7IRvROvNH2ALQRg==
X-Gm-Gg: ASbGncsMtJUpKtp+NRRquKnIZ14z99UroK6BsqqeLKWnuU/A5TTb4Fmrx6UhKzme4gI
	tauuTacv5KSv/bnJD+TcNY0txJbj6wqnf2mjmSxLuNnAgmLzAOALuHHu02vP4iJaHnjDai1N7RU
	l8BpN32j+7qRY1ooP63dMKwh+6xHjhuqGtoVITVDSfYFYPAt1OEec6hPmnKPJPgds4vIugAaele
	z9rSEdafFHsGVu2xOk2ORF30Hr307bj+KuCaSyaMQy85DY8wWcFkauwKWLp7raO0cJflWafTX3c
	ripCdPVOHJufZLqM0qga5U2CQe5LSl0VX8LNuZ1163p8GTgm1lvxozAsUy7xGCe6ukBfBTbbF50
	=
X-Received: by 2002:a05:620a:28c8:b0:7c7:a184:7cb1 with SMTP id af79cd13be357-7d0a1fa53e4mr1883017485a.9.1748844964002;
        Sun, 01 Jun 2025 23:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ1bSQahLqe557WjaS0ITXAp9SVSOpdyV0vMovbwK20i8iAjbOrnNSBp++Bxin6ICbH3T2aQ==
X-Received: by 2002:a05:620a:28c8:b0:7c7:a184:7cb1 with SMTP id af79cd13be357-7d0a1fa53e4mr1883014485a.9.1748844963605;
        Sun, 01 Jun 2025 23:16:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b1b549sm14081971fa.10.2025.06.01.23.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:16:02 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:16:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
Message-ID: <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
X-Proofpoint-ORIG-GUID: J4ZfDm42xWkJE797-fCEsrH8sQqV1Ujy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1MiBTYWx0ZWRfX3yRXCmFRCFVD
 DyXwkDJQG6ldGcqkTzgzziTOPiB0Q3gWHmbtdJM7NOvt6e9qe04G7v61hiGoRLw6u5IqQY8nkoF
 5c5d6oN+5HyP5MXv8l4y7YIovxnoUmKvBYCH1DBAzmO7crbAuCjIqwDfZNeNyDP/4kTTqaItQTu
 X66kcXUG1e1X6M/EVrQQOVthpO1h5YtBGRINtY46JHRFaNMmLYMUYVwGtu0xNXy8qv5e+7pdOBD
 a4YEk/HlP3wBIUMnNq9s9fvfg4WvXXC6VPx8fOSyqk49t4Nutk//tf3g6GARsqkBg4SOLcokWHP
 z6NAW9RoXDjqSqktR1BidkbKnz+BebALEZJ9HY7EZBJYG/YabHXRdzjI910eJwCggq8TJcgZ7ff
 lKRcyI3i3F3/lc09S54tie3Zn+NXMFFGQvncrRMzDUsxQeAc0LImoJ57VlsZ7tl9ocOhfy+K
X-Authority-Analysis: v=2.4 cv=WI1/XmsR c=1 sm=1 tr=0 ts=683d41a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=811R0v4fTQpBtjd_nOcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: J4ZfDm42xWkJE797-fCEsrH8sQqV1Ujy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=496 bulkscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020052

On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
> 
> On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
> > On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
> > > QCS615 uses the same video core as SC7180, so reuse the same resource
> > > data of SC7180 for QCS615 to enable video functionality.
> > > 
> > > There are no resources for the video-decoder and video-encoder nodes
> > > in the device tree, so remove these two nodes from the device tree. In
> > > addition, to ensure that the video codec functions properly, use [3]
> > > to add encoder and decoder node entries in the venus driver.
> > > 
> > > Validated this series on QCS615 and SC7180.
> > > 
> > > Note:
> > > This series consist of DT patches and a venus driver patch. The patch
> > > 1/3, which is venus driver patch, can be picked independently without
> > > having any functional dependency. But patch 2/3 & patch 3/3, which are
> > > DT patches, still depend on [1].
> > I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
> > on QCS615 over(?)clocked.
> Agree, so we need to make sure that the driver patch is not picked after the
> DT patch.

Worse: we need to make sure that the driver patch is present in the
branch which picks up DT patches. Otherwise building & testing that
branch (which is not unfrequent when doing git bisect) will fail.

The easiest way to ensure that is to merge driver changes in v6.N and
then DT changes in v6.N+1.

-- 
With best wishes
Dmitry

