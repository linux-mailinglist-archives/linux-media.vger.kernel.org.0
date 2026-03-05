Return-Path: <linux-media+bounces-54670-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOqLDL/MqWl+FQEAu9opvQ
	(envelope-from <linux-media+bounces-54670-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 19:34:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C467F21701A
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 19:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6558307B190
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 18:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABE43E3D8E;
	Thu,  5 Mar 2026 18:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEUsnEwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRwKZEg9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB383A1E84
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772735575; cv=none; b=Rnvdh0rGvp69FMEHP00tvjjGLJAazH6OSgKbt0pOuSaBt3ek8CiImwf0gmZQNxjGJJpvuqN7zTD5ilultfrmaRVRWBveXKNy0YVLeQOzCHykvkBYbZVpWJOrkUNUlLccnqe0Ajq6XgLGM6//DkfyT1ynfpHJC9yTEuG3fjUEhc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772735575; c=relaxed/simple;
	bh=aB68XFFYRLmpoGqMlKRzfQZGNFVqrsQlDdc5m1k/3bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDcHcSnJ7ONLnN0k2fHTsyac8dgmVo4Bhkw0jgvbu3dBxlG2GufylO8/jLBY6lNLa7dxaffwbzFxazEjbn+NiRIsTPyG8Fo30l/DK6FwLHYWc5WBz+SN+zrbp8RQ6c8G83/ka54aA0otFn1g0DqPz6gRg/NfqPaVNaLXniGKbGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEUsnEwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRwKZEg9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625H2AaV2986278
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 18:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=07iZIVXXI08IOJ8ob15wib1I
	ig3A0HI31MaQUD8/wgo=; b=nEUsnEwO10p5nKkvA04KFppEgTdvmETK6h2DN6EQ
	YQdgzUi+6E4wNOMzHkUgJAEabU7RD3CKmCifr5fAC0dceijwhCTFcx/J1dojrYMP
	yNvtl98hxJwVsPyj6AcOGxDYYFh3ZztUoxvHCnGAzwtTXyJyZtELwRKJ3t1p8Pr1
	mcz35WTJrnN26xJAmlm2vfKU9eL9vOZIgkwwwYbWZ3L6bmRoLDICVRjxri/sS375
	35GNLjUgZ39AAsEs4kZiQdzWYdrOB8sSCHeu12PKADVnJCIIsnUn0rgxmgKQ59+H
	TZmghTm5bcZKbzkxfn/6EwQsjbtb34iT7kvEFrLbP27Cww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqdvkrc3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 18:32:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c882774f0dso4889872485a.2
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 10:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772735572; x=1773340372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=07iZIVXXI08IOJ8ob15wib1Iig3A0HI31MaQUD8/wgo=;
        b=MRwKZEg9PMBKtxZ/2FVDIOk1N5eGfB+jy1O0ZPEa3C6HvygZb06gjP5qnVYZjR6gsm
         taE9K8Zgg4F+GuSP5wQ8w/4kyCmebYclx3ARBRWB6xtrKkOe2BaBW+7ODrIF0CxRM1Vj
         2+TMA/o7DwjlDy8MhpWSwFdyjNMVoWC6hA7Go+YbUuctvGQ6vG+3TGhPLZGPIFEQDucD
         lXNO89TL9ai1gvhTJm6KsJ8eMgqxosVJtkJtwZhpxeHVbuc6PrRTkkGUJGZw4mxypN+r
         KgaTMrB5HBDgBk2wok+DV32aixoMS9UHGRbA7conli1DTU6zxvaSUSqCWPFXs6ehapo7
         oR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772735572; x=1773340372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07iZIVXXI08IOJ8ob15wib1Iig3A0HI31MaQUD8/wgo=;
        b=QpndYo9icQc99gToC4s085aZaoQWy0FFCc8bquFUXsXLRQGas0N1E5C5FmoMFH3PNP
         J75wO/Lv1jYb+CUlqYUZt/SGIG8PBOfpOyAREcsWJf5Y7J2YjDjXWgxalBuQdqHxtawK
         IPikViEmqbfYk62STO+Y4g0y8AvyjKdW3meHP+WTZ35POYOZcg6SO4vJWyBTuwV80DWZ
         gQPMR+GYfgqLKuVA4RIsypkundkhdR9dl86SlkXN/U4fWj/DI84hcENtj2Zo76JN676q
         JR0s9P82USU5BYWQqv41geXX6Mi6vQJsHxFtKY2NCExQRJjTzZKah+W9aesI5qGOj/GR
         QhQg==
X-Forwarded-Encrypted: i=1; AJvYcCUr+ihwVkRYFg8uPe86Ww89UxONZJaTOpffuc73SQIgXqkVGKpKtgOKvNdgecyw0Lp1RoAVoakxJ0DDHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR03nDulJmN996+8jJw/Yp7vAdjnP9yPrdKZO1AGG+2YuWoEwy
	1bhGVvsN4JfQ5GM+DMVmtCLeV1UFXdvCG8mQcQsB4kO36GzawVJAOD701xuXP5WKtL5N3FyBo02
	YNz4PJn8lJ/BivoEzDkhB3h5jFTvRlfS+X/UjnnD+Fo/ttBBR7dUh3lz8kNaauzUK1A==
X-Gm-Gg: ATEYQzx3hhTFBnuCXDwiMAqKtdz1p4IG9OhZzZeTysxvsMxJSamfEUaZFYdTrquTdq2
	4piyC7Lk2nO/EFZHe6q4YmrQct+y6hzBSYdBuXbmX16weAIX2VoqMKVdE1QzGFYlzJU7FNQgkEO
	Mpu+uxEhEl5iJtW6S4Dk7DbD5H1znqXKCNP9wwGcTV2Xw3ab/CsBHyo1H1rhpp/8Lb2IBW4qjWt
	J5LwntNT9UTqPgI8sbOy8T/arQ+V0siSsaT1bgz5bh5QgNqNYhm7O3QzfhGfVo9IpdLxCxW1n7r
	ne8phXb2Wfn59CPkn5ikx1f8t/aIgy8dr/SwI1e8grcmFvEQ2W2mgM/qX1KyxC0gnZN+p09ndyn
	1qHYiSOC8VSxePxYuzP/Yx7TUjck31xAGveAOGFhMJSzj7GzxQBB+c4XSdgC2qrC/y0gCBipt5F
	zpIJNLrx8EH+ISQEcYAbNJSFEyaB9hV4HC0lA=
X-Received: by 2002:a05:620a:31a4:b0:8cb:4c79:b44f with SMTP id af79cd13be357-8cd5af81919mr927055985a.51.1772735572220;
        Thu, 05 Mar 2026 10:32:52 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8cb:4c79:b44f with SMTP id af79cd13be357-8cd5af81919mr927050185a.51.1772735571621;
        Thu, 05 Mar 2026 10:32:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12a6ddd3bsm1366694e87.0.2026.03.05.10.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:32:50 -0800 (PST)
Date: Thu, 5 Mar 2026 20:32:48 +0200
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
Subject: Re: [PATCH v2 4/7] media: iris: add context bank devices using
 iommu-map
Message-ID: <7wvdcjajf7ro3c4y7jq6tmbxfg7kfvdpmyfzqm4vgjw5wly4zu@jcjqudf7vrgd>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-4-850043ac3933@oss.qualcomm.com>
 <rzi7qmzsofocwcqxhsqz3f3tl4ahqnwn34of6qcc54odpben5d@7okuqabxgdqh>
 <e12da06d-cad5-4967-af07-64c7c6e540f4@oss.qualcomm.com>
 <vi5v5bczg2wx2adfpr6ppqcad76oecitoyc7zd2i4lahla4buw@mqnppboxcyrs>
 <6553cfcb-9399-4d17-a529-b07b421ed7e8@oss.qualcomm.com>
 <mqyg7cebyahkrngvnxcrenkdd3dybpnkecago4lqonfwqzize7@yawbtcsli3vi>
 <1d2b55d9-42e3-4459-971b-e276a87fb843@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d2b55d9-42e3-4459-971b-e276a87fb843@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M7xA6iws c=1 sm=1 tr=0 ts=69a9cc55 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=k2QkBiQWYh7aNo2zAsoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE1MyBTYWx0ZWRfX0wt6UYJrA/hm
 FtKLVG4VynBnpVlnYlFWczkTIEkMpQOQQ+hRZoyUfBUmzq011TzOfcCUnhc9Y5vhR5oPqF7+MFd
 vk4Q6Gn9Ypiaelo0f00A9+tGo9LOaGckWpXfFknFX6j4g4O9vQ/btUlflGeYjADBJLCz9q/w0TZ
 Vc+vfAE8ktF4W9rxZ3nkAF2XNOdmz2BEvQ5o8XOVNkjpSWQQ1o3Ep9KiZMDnFoh1CadudDuRfXN
 E/5vsPuNDgVnNYnCt1fJkfkSomftukeKPomU4AT7LcD9GSWn1AIkV65wNYdAmhCkMqnkzShB/7/
 VJoXMkGzpb3Zkg5s8lYX2VyJJ7Sv//yAc9vzGGdGbmesv9SiYD9UmalN68Fbuc0We18mndfHVHS
 6dbqwEUTK16wqRqI7k7BuxCCf/lSa51ZpPmc8R1mO/vnRWlH1fKes89ZijxpyQ9KTX7H5iy3q24
 SM00JZg3Qeen2qQG6jQ==
X-Proofpoint-GUID: 2YZX7Gpa2NZlDNFYHCokATB8vl0YC1C1
X-Proofpoint-ORIG-GUID: 2YZX7Gpa2NZlDNFYHCokATB8vl0YC1C1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050153
X-Rspamd-Queue-Id: C467F21701A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54670-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 10:56:40PM +0530, Vikash Garodia wrote:
> 
> On 3/5/2026 7:51 PM, Dmitry Baryshkov wrote:
> > On Thu, Mar 05, 2026 at 06:19:52PM +0530, Vikash Garodia wrote:
> > > 
> > > On 3/4/2026 3:55 AM, Dmitry Baryshkov wrote:
> > > > On Wed, Mar 04, 2026 at 12:16:50AM +0530, Vikash Garodia wrote:
> > > > > 
> > > > > On 2/28/2026 1:50 AM, Dmitry Baryshkov wrote:
> > > > > > On Fri, Feb 27, 2026 at 07:41:20PM +0530, Vikash Garodia wrote:
> > > > > > > Introduce different context banks(CB) and the associated buffer region.
> > > > > > > Different stream IDs from VPU would be associated to one of these CB.
> > > > > > > Multiple CBs are needed to increase the IOVA for the video usecases like
> > > > > > > higher concurrent sessions.
> > > > > > > 
> > > > > > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >     .../platform/qcom/iris/iris_platform_common.h      | 18 +++++++
> > > > > > >     drivers/media/platform/qcom/iris/iris_probe.c      | 60 ++++++++++++++++++++--
> > > > > > >     drivers/media/platform/qcom/iris/iris_resources.c  | 36 +++++++++++++
> > > > > > >     drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
> > > > > > >     4 files changed, 111 insertions(+), 4 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > > > index 5a489917580eb10022fdcb52f7321a915e8b239d..03c50d6e54853fca34d7d32f65d09eb80945fcdd 100644
> > > > > > > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > > > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > > > @@ -204,6 +204,22 @@ struct icc_vote_data {
> > > > > > >     	u32 fps;
> > > > > > >     };
> > > > > > > +enum iris_buffer_region {
> > > > > > > +	IRIS_BITSTREAM_REGION		= BIT(0),
> > > > > > > +	IRIS_NON_PIXEL_REGION		= BIT(1),
> > > > > > > +	IRIS_PIXEL_REGION		= BIT(2),
> > > > > > > +	IRIS_SECURE_BITSTREAM_REGION	= BIT(3),
> > > > > > > +	IRIS_SECURE_NON_PIXEL_REGION	= BIT(4),
> > > > > > > +	IRIS_SECURE_PIXEL_REGION	= BIT(5),
> > > > > > 
> > > > > > Can a context bank belong to multiple regions at the same time?
> > > > > 
> > > > > yes, they would.
> > > > 
> > > > How? Each set of CBs is defined by a separate function in the DT. How
> > > > can CB belong to multiple regions? Could you please provide an example?
> > > 
> > > SM8550 would have same stream id for VPU hardwares (tensilica and vcodec)
> > > accessing bitstream and non pixel regions. Thereby non_pixel and bitstream
> > > regions would map to one CB.
> > 
> > In my opinion it means only one thing: you will have two CBs (one for
> > non_pixel and one for bitstream) having the same SIDs. An alternative
> > would be to define fallback rules (if CB foo doesn't exist, use CB bar).
> > 
> > > While kaanapali would have different stream id for tensilica accessing non
> > > pixel region and vcodec accessing bitstream region, thereby having different
> > > CB.
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > > +};
> > > > > > > +
> > > > > > > +struct iris_context_bank {
> > > > > > > +	struct device *dev;
> > > > > > 
> > > > > > Separate data and the actual device. Define a wrapper around struct
> > > > > > device for the actual runtime usage.
> > > > > 
> > > > > we still have to store the list of dynamically created device. Name can be
> > > > > used to fetch the device from the list, i think the existing approach is
> > > > > simpler ?
> > > > 
> > > > You don't need a list. You have an array of the size, which is known and
> > > > fixed. You have at most 9 functions, which means less than 9 devices.
> > > > 
> > > 
> > > as mentioned above, its not the same for all platforms to have one to one
> > > mapping between CBs and buffer region. Thereby indexing based on array would
> > > be an issue here
> > > It would end up something like this, considering [dev region] array,
> > > 
> > > SM8550
> > > non_pixel_device  non_pixel_region
> > > non_pixel_device  bitstream_region
> > > pixel_device      pixel_region
> > > 
> > > kaanapali
> > > non_pixel_device  non_pixel_region
> > > bitstream_device  bitstream_region
> > > pixel_device      pixel_region
> > 
> > I'm sorry, I'm not sure I follow here. Could you please explain? Maybe
> > by explititly mapping DT function values to iris_buffer_region values?
> > 
> 
> Kaanapali
> IRIS_BITSTREAM IRIS_BITSTREAM_REGION
> IRIS_NON_PIXEL IRIS_NON_PIXEL_REGION	
> IRIS_PIXEL     IRIS_PIXEL_REGION
> 
> SM8550
> IRIS_NON_PIXEL IRIS_NON_PIXEL_REGION | IRIS_BITSTREAM_REGION
> IRIS_PIXEL     IRIS_PIXEL_REGION

So, why not:

Kaanapali:

iris_cb_dev_bs = iris_cb_dev_alloc(IRIS_BITSTREAM];
iris_cb_dev_np = iris_cb_dev_alloc(IRIS_NON_PIXEL];
iris_cb_dev_px = iris_cb_dev_alloc(IRIS_PIXEL];

core->cb_devs = {
	[IRIS_BITSTREAM_REGION] = iris_cb_dev_bs,
	[IRIS_NON_PIXEL_REGION] = iris_cb_dev_np,
	[IRIS_PIXEL_REGION] = iris_cb_dev_px;
};

SM8550:

iris_cb_dev_np = iris_cb_dev_alloc(IRIS_NON_PIXEL];
iris_cb_dev_px = iris_cb_dev_alloc(IRIS_PIXEL];

core->cb_devs = {
	[IRIS_BITSTREAM_REGION] = iris_cb_dev_np,
	[IRIS_NON_PIXEL_REGION] = iris_cb_dev_np,
	[IRIS_PIXEL_REGION] = iris_cb_dev_px;
};


Yes, it would require coding of those functions, however afterwards you
can access necessary CB device simply by doing core->cb_devs[region].

I think current code is overcomplicated for the sake of having the
platform flexibility expressed as data.

> 
> > > 
> > > 
> > > > > 
> > > > > > 
> > > > > > > +	const char *name;
> > > > > > > +	const u32 f_id;
> > > > > > > +	const enum iris_buffer_region region;
> > > > > > > +};
> > > > > > > +
> > > > > > >     enum platform_pm_domain_type {
> > > > > > >     	IRIS_CTRL_POWER_DOMAIN,
> > > > > > >     	IRIS_HW_POWER_DOMAIN,
> > > > > > > @@ -246,6 +262,8 @@ struct iris_platform_data {
> > > > > > >     	u32 inst_fw_caps_enc_size;
> > > > > > >     	const struct tz_cp_config *tz_cp_config_data;
> > > > > > >     	u32 tz_cp_config_data_size;
> > > > > > > +	struct iris_context_bank *cb_data;
> > > > > > > +	u32 cb_data_size;
> > > > > > 
> > > > > > Do they differ from platform to platform?
> > > > > Yes
> > > > > 
> > > > > > Mark them as const, it should be data only.
> > > > > 
> > > > > cb_data_size can be marked as const
> > > > 
> > > > Why is cb_data non-const?
> > > 
> > > dev is being updated once created dynamically.
> > 
> > That's a bad idea. Please make the platform description constant.
> > 
> 
> I can give it a try to move CBs in core struct out of platform data and have
> a buffer region based lookup array to fetch the device.

It might be easier to express that as a callback, filling core->cb_devs
with struct device pointers, as I wrote above.

> 
> Regards,
> Vikash

-- 
With best wishes
Dmitry

