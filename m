Return-Path: <linux-media+bounces-45194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0CCBFA825
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC51F3A3D2C
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377672F60A7;
	Wed, 22 Oct 2025 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXPjYZA4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A2C2F60B2
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761117639; cv=none; b=n7gZjE7rub968B3OhzamJfN2hg5QvYAE/XNZuR6e145EMjXYJ6XLnUrUmO/AFPGTAVFXySQB20quB/NpsszhgKm+Hkyskf/3JHqezvR8ZO8HoMHxuD74gulkTDyBgUDngxWYLro/oFBHZRn7TqpUyM7XKKwpezzxpupiXX4DcS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761117639; c=relaxed/simple;
	bh=Qx5ZLt0bA1gGhskqBF/wlqngo5r7KHvDRvvusdOm6+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aU/eaYaL9lDqXKzbjLa09GsMUX+O0zNo1sSym9V+CtjN2EUflnZp5L9lY7pqIRaR0SO+Jh/Ue7Gc7cXXEncbCkJj6sY7MQUYwlGPGOt8LY/GYLnvIZixq2PlddK0GOO8CNfv0ldEG9oWjLSgYivI1WHVxvm6fHTboHd4Bb+0FZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXPjYZA4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3VOUp029822
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/P5qUVg0GWzdhRDecSxvZEOZjOjt3BobF0UUDc36ok=; b=WXPjYZA4Z28Ktasa
	LK09WZTV3aFaBq5LIRLzfNfKw82/YAbXnWBkJkw/zXclpxeLlmSYUxCEHOSFwSn3
	qi8na0idnipYIciPYz6JqfyXavpFQXrsngsZ8JFZx2zxM7OVHAKuyuYTuicl47+R
	n0tB+db7A3EgtqPbWS3HH8SJNz1bJTLeore2HBOp3jsnKJWTdsAQBEAHtWr8JKgx
	VyYEytcC+BXZKNdZxOBTsVqzAGXbkxOw6nDWFy/n9/DiqOLQKohLDhyMslz+hRmf
	eMiSZ5HV7dVDJojn3aCfyZvs+Bp+ieQ6q0lKtyQlH4MOZ1l5NLef6q5vrpuRp5WK
	+NBktQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge3nc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:20:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77e7808cf4bso4258327b3a.0
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 00:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761117636; x=1761722436;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/P5qUVg0GWzdhRDecSxvZEOZjOjt3BobF0UUDc36ok=;
        b=JYOyM1h5ZWmyUMCda10t+aB/OOb5tKCq7g5n0WaeECKDk3kRcs7kEV3fhes22fX9we
         NjEoC1HiQ3oa7wdtOXz+g6q2AW0eAGp+4EnoBNJYRAIVFjXuUzLxabawMTqDDZnZMZmj
         g6T/LwYEuoCoIUjzk/Yem/zFbaGQA5iRnIyNtmwEV45V0Q2JH5ZKIDF0hipYA89KJx97
         vsYoAI5TAY8n41c48PyvfSH/RNzVasdORMZjwfUB8F4Jwedw+IxofAqf+wAOAi+gY+43
         DrxHzyqIVk5yPn8XbntckRSgfyR5vCEbRtxFeiafbQflIzRwluQ/tOP9u41HD05w5Nhm
         0uxA==
X-Forwarded-Encrypted: i=1; AJvYcCXzMhc+4oPQuFYE9f+afsfWKly/OeiMk+tK5pFANtZaZGUoyUTOOR2P7VhvJpDpqm+XUz8du8KuzB6umw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc5kAkpS4aTW17EFelBi6+zk8pTpRvIFlF4Qr9nG60XGnW2II3
	P1QX90Rb1iZ4s7RaEm6ezh1iLY2tnVL7O4XQOWtQrAaJGX7fd7rLYs7hFbCgkUOvl/BYjsHlYWd
	Iy9xvPcg1w7GdsMJRR/0IS35USMqDwzLeoDcCJVSn0PiaJIbOuVsde4UHSR0YhZTFyA==
X-Gm-Gg: ASbGncvTaeblRrfBsFV6+cZjxC4oJXbJYHrqiUdpfyL/Tki73QUx1QkoOYGRaZM7bBH
	Cavb+50rbMc0bhmRYsACiHPKx3rLfmdArxqK/L0T/o9pHHTzktW3qNyjTm1XUK2gGLxInbgaL7h
	SAOYdmfxdxHPePCZBbfM21S+OdLvrJLwD2OFuwWT0KdnB2z8TS0/rmgfPVg+CnwUuAf8aj6W4zh
	gzGZGnLThsqln9SnOa6KK2+WmIIMK5uLaURF4kqyxil2L7vcg1Ni+gOXjDhijcpyH0eVcjBjVBY
	7lbgk1fFi4I3KmwbAnzrFlFYfitI0FaVmHvcGRAqjmQ4Gi4sA1fYx7NYfYy4CnPQpU8bN6BhuIz
	WCM0AsSXO435141JomtIL7iwkZNdE79n7rA==
X-Received: by 2002:a05:6a20:1611:b0:334:a3fc:797e with SMTP id adf61e73a8af0-334a85341b0mr27012255637.24.1761117635711;
        Wed, 22 Oct 2025 00:20:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQecOhK3VUMqmQQsVoBliqObRe9daZgl/gk+BlnDljUjD9z1dJCRLyXJIODKqTr58ixAIBLg==
X-Received: by 2002:a05:6a20:1611:b0:334:a3fc:797e with SMTP id adf61e73a8af0-334a85341b0mr27012222637.24.1761117635277;
        Wed, 22 Oct 2025 00:20:35 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.252.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff157f4sm13707077b3a.6.2025.10.22.00.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 00:20:34 -0700 (PDT)
Message-ID: <95c93e25-a60d-99b5-c31b-9be321eb5073@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 12:50:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] media: iris: sort out common register definitions
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <0251017-knp_video-v2-5-f568ce1a4be3@oss.qualcomm.com>
 <20251019080212.142623-3-dmitry.baryshkov@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251019080212.142623-3-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX0Scquw+78G6N
 Tm9PVWDsDrsxR4Y/Ey+VG6RS0bc6i2vJs4Tc6+VwWx3RqA/Z9fYEJs0/O7KJdYsf9wZHOku7bcn
 q5SLFcd6UV3v+bLNIFY2Ujx/ezT8ttkG4ikqbPT1eL87sqxBsn446nfazFC0UpjLjCk46GMWl87
 awyvuvh721saJmTf1aAStXoxlh+45usvfRaugQeVnU2W5lZKNujwsehvn2brHSNCh1lcsYekKOm
 A/tkORl1SnEHzOnp0Zr5OLv6anwxE400x3RqLhANaoIgcjXOMPmzzYrL4xRXF3ZMaFSpqR/Q74r
 aATHvYIRpoZaEZbI27xcFzCiF/lj20FhanojoKNu68nu6D0m0BMWg/zido0j6hOzaf4udOSqIwl
 qW87Mm5DX9BVrHVKFQR+cAeI6osi2Q==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f885c4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=FoPg1IWog9mqHsjG+aRTFA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=M1YMS4I-2UCZmqrdDCEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: ata2PO-RyIfPDXTrHu-2aC4tuBf3Cpbb
X-Proofpoint-ORIG-GUID: ata2PO-RyIfPDXTrHu-2aC4tuBf3Cpbb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020


On 10/19/2025 1:29 PM, Dmitry Baryshkov wrote:
> In order to make it easier to modify the file, sort the definitions
> by the register base and then by the offset. Also move bits definitions
> next to the registers which they describe (as it was done before).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> 
> Vikash, I have dropped these patches from SC7280 patchseries as they are
> no longer required. If the series gets resent, please feel free to pick
> these two patches in or to squash them into the corresponding patch.

Ok, will squash it in next revision of my series and add your co-developer
contribution tag to those patches.

Regards,
Vikash

