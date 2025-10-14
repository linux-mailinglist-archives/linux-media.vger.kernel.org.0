Return-Path: <linux-media+bounces-44367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C047FBD818C
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57B073A64E2
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39ABE2FD1B2;
	Tue, 14 Oct 2025 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W78OR81F"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D6130DEB0
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760429207; cv=none; b=Q/KvZCW9tyOXJmD691oDl0TCpD+BdQA1AY6A0+nhpdDKHMRYMYs/vlH1Z8cr3p0ahZ/RQYb71OGlGOzZztAuXXdQ6bwHUl1qBqXIvZtdkTD+gG8GnFYGYl5YSt6N7RnfsPr9+kbsmkpJ7n1bWt1BIdtye9DVKEETQfKyjENcUEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760429207; c=relaxed/simple;
	bh=fVlJuu7kx11Q9Cca/sPAmXb5uL2H3gXWKoVGmvXX06I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIPWYUF/ACsjt83h2XjOVYnKTU4Ubk0L2IDfU4WNZe3RYpSS2MrfIku8b8IcUhd88qDpcXhN5JY11q6zEOneM8k4FuQVIViowI5JjeeI6r2KkeRLtY//w2Z0GaO5V0iKKtocwpEdOTVggCSf95OYLAjSWU0UKbb7gzJmYWmrTRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W78OR81F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E6Vi2R021072
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CdCQL72+wx7fzCdR3aCJ9NPHrR0L8HOD5RG5xmpUQc=; b=W78OR81FAQHK44rz
	bU9UuzuI5MFtyAHtAHZDOuBrxqcYjJgkFikU3BEOPAGu1yXMjL0mIfwoYjT15B/9
	yB/2UWZrtYgXl/arAa2i7OmJtXZ4ZdTmvfTv5bs7fpRoFkQtlgd7BhIw4eHg/aVW
	1VHhvbycrxc04AeK79gGUKjWHYQLQbLryuJ2tdjosz4B2/iHtZ+Rx93mDuqIWfBQ
	+I0FSz+utbXw2rkuyTPkf3CyftslPrKzB/1jIK9ane0DmINXNpCjvQbe4vrYczKq
	/MNBCX8mnPNRNrvskdfckj8kpnF+TCJw3xamnh9r3OuZGu2koDsqobp2/Lq0pkQm
	vOHJvg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bymkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:06:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2904e9e0ef9so113916405ad.3
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 01:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760429204; x=1761034004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7CdCQL72+wx7fzCdR3aCJ9NPHrR0L8HOD5RG5xmpUQc=;
        b=flhirS4pKk1GICBeV7t7v6WfJtG1Q/xOD53fMYxuxPzYRdfSNzAnfhAQQ3WfrEKbI1
         BVC1dR790ag0R9yJ9/xlrZDujUZstQL5HJ/6avianxuCyEqRfbZ5iRSz09L5R/3iO0CZ
         qFTc+PG0N/ViyQ+MDlQvrnTIrX72d0ikqt+w698DDFTQ/+hpy77FizOogbxr12vptYJ4
         qZ/N+7fO3yn4CMLx5CdE6SG67dWWy6iDdFal9UGjHMg+0z2xbqcbxkm2jHS3fiiZls96
         DfCuvlH/R4nTlYrg9AP5zxSS4q0TUhwn8ttCH0JAAJzAHfdmhL7xLlolXK5zlxh07XQW
         xqiA==
X-Gm-Message-State: AOJu0Yykf5xJWKLEOK1bJno+X+wiYbILhBTQN06LFTWQvDfHrl0kFqX3
	717S7ABliw7HqZ/Jh8iR2mG3mpk7KLxicPJViRUszHkmSWxmxO5ASDVvQ6w1Q4OR+CfBMff81bw
	ryTi+vb1663CId6D0kMMnEjnSQwmccVBC1aeVivdsfI8AwSPKW9qjCAZiUsBDTUtYUQ==
X-Gm-Gg: ASbGnctziqrYHY3R/b/51hgG8Xkii/CGnzS89vUQlw0wqWE+SwLYSwAW6ERaDispLD2
	bvCVf7vR/ZEGWHCOsyQUaaLDL2hdWU6hHFRcwW6RmVHIyrK0rcGxThUaGbD8Yi5Eb/OasWLrA6X
	gGumwHNniThuHQXVUAgovlR4NpkYOdvFuCb+8t3UEFoxNNnGnBKzAHxF+5ErsGbIlX5x4mqUMg+
	QiUCSDPb5ItzAjH20S4tUqMPJWpvcQ8lIGKcCjS8ECieywvuNJgMW8B32nmXlkiaj1Q+HRYNFEu
	0InXxqPp6msQpCZA4QKWPkffYnd/BKKV4mzS7ICvj98UGOVcrlBo+/lYuPj8kA16aQAM0ykX
X-Received: by 2002:a17:902:e54f:b0:28d:18d3:46bd with SMTP id d9443c01a7336-2902740089cmr343944405ad.43.1760429204387;
        Tue, 14 Oct 2025 01:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhbY/rsBKCb8k0lEMtnnpbymoDmTuTFFchpcgnd6Bdy9Cz0O1GUjdLwC9fI+/RpmaJj9lk+Q==
X-Received: by 2002:a17:902:e54f:b0:28d:18d3:46bd with SMTP id d9443c01a7336-2902740089cmr343944095ad.43.1760429203912;
        Tue, 14 Oct 2025 01:06:43 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cbadsm156112245ad.33.2025.10.14.01.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:06:43 -0700 (PDT)
Message-ID: <415b48a9-73ca-3385-4c00-cef091627844@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:36:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/8] media: iris: port support for Qualcomm SC7280
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RauZhw9Fidwcs4b0EqVelK6Shh5WJ3Si
X-Proofpoint-ORIG-GUID: RauZhw9Fidwcs4b0EqVelK6Shh5WJ3Si
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ee0495 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iCAh8AotBxNhkk2J9E4A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX5doN5AO86YTR
 ZXJ4igpTy9EnKo/mCdCDBpg8hiBgvGgCaxyMqrPxQyI1d9bcWv+0gtT1MQL6cxJ3FPjIpSl+BmP
 6qudT1ZAffSR4gl/7cAsbM3Ya0CdClu1Oyh+d1vKVUmV75klzznsrDmFGyyfuGPvMR4tql+05on
 mv1NSZQGp+Qkn1730Ad0qNufkozLFCjxYG00pa8LUD5qqMX+FTFGHzQyOgSPF8Kd3qB/h15VLgi
 euugjaGK+NadsQQzGHuePJLU4iu7OSHpr0kGYjPlaSH00xdqNf50NJZvuSPHvxrYcQ/Ho2BxQjP
 KrzG2hErtgWpfTjKs2O6ALKkSWA6fFfZUo+UuLp7uk6jbUo6SHbZZPGNh6RYclGLa2I2VzEGpfV
 V0C6cSos9WpqJlEYTg76S+/WKen/PQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022


On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> Port Support for the Qualcomm SC7280 aka QCM6490 aka QCS6490 platform
> from the existing venus driver to the newer Iris driver. The firmware on
> this platform uses the older, gen1 HFI, which puts it close to SM8250
> from both the hardware and interface point of view.
> 
> Test results:
> 
> $ ./fluster.py r -d GStreamer-H.264-V4L2-Gst1.0 -ts JVT-AVC_V1
> ...
> Ran 77/135 tests successfully               in 17.010 secs
> 
> $ ./fluster.py r -d GStreamer-H.265-V4L2-Gst1.0 -ts JCT-VC-HEVC_V1 -j 1
> 
> Only WPP_E_ericsson_MAIN_2 succeeds, this needs to be investigated later
> 
> After removing several test vectors and running single-threaded:
> $ ./fluster.py r -d GStreamer-VP9-V4L2-Gst1.0 -ts VP9-TEST-VECTORS -j 1
> Ran 219/292 tests successfully               in 134.749 secs
> 
> Disabled tests:
> 
>             "name": "vp90-2-18-resize.ivf",
>             "name": "vp90-2-21-resize_inter_1920x1080_5_1-2.webm",
>             "name": "vp90-2-21-resize_inter_1920x1080_5_3-4.webm",
>             "name": "vp90-2-21-resize_inter_1920x1080_7_1-2.webm",
>             "name": "vp90-2-21-resize_inter_1920x1080_7_3-4.webm",
>             "name": "vp90-2-21-resize_inter_320x180_5_1-2.webm",
>             "name": "vp90-2-21-resize_inter_320x180_5_3-4.webm",
>             "name": "vp90-2-21-resize_inter_320x180_7_1-2.webm",
>             "name": "vp90-2-21-resize_inter_320x180_7_3-4.webm",
>             "name": "vp90-2-21-resize_inter_640x360_5_1-2.webm",
>             "name": "vp90-2-21-resize_inter_640x360_5_3-4.webm",
>             "name": "vp90-2-21-resize_inter_640x360_7_1-2.webm",
>             "name": "vp90-2-21-resize_inter_640x360_7_3-4.webm",
> 

Encoder is failing with the changes, most probably due to #3 patchset. Look for
the comments in #3/8

Regards,
Vikash

