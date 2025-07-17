Return-Path: <linux-media+bounces-38003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 442D8B08D06
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D59C1C22510
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0EC2D0C97;
	Thu, 17 Jul 2025 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyNRj3O9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631EE2C3264
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752755677; cv=none; b=puU+JR2FHP1jr3JEUYVips4cf60MIEBEe70DSvNBPyOavbPYwB6KObcvy9qyIhTyt/pZS3x77/LmMLuTD1TQ19GRsyzs62Tn3jt46FT/IFZrj5dp46jaF56+wlHgJE9jPGD6iTLRTnqtkyGqVBNKSIwNG9GqNbFoweXDo4cCR70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752755677; c=relaxed/simple;
	bh=tvj54Ugf9mCR0aycZ49cLKLbPEjNF1NK4UB9hQk7Bts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rV7mYfKEGQ3M0ARaodN+kJVdIdxqR5v1nkwLOL+HKwqCnwQivItLs5bXIubjta5aYn4oM5RMrRNJqI/zwdGZ1IzxQL+MP6Jr5FGj+VvsN3UxS5pvl8I2Wh7YZKeTaLX+b94tdiXJDGZa4dqvBF0P9m9bOdpfpa4KZbx2A1a9kLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyNRj3O9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5Js3U008506
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0EtSnDYQ0MstT4xX/sUazSxxFTRJ/EGgAkOJJTf0zs=; b=FyNRj3O9OFjjwKMo
	Hg+RGVB1j87S4XjL1Zkpx0Te87MmkxQC5PYxhrJLa4gXvpNCzNzOtUZbFQ8slvFa
	RPjj50JoYPl7s9P+hZeUna65UhlpynBzvLUYrL4M0uQRZdOfF15Pg7XB8DRy4p7k
	1iZscRFyCBuMTrNaKhqOK4MfWpMMnIZfJxoAfQu/aXApEbxjTmlYAmAcCy7UdTct
	xJ5iXtOOvK+CKlYb7YbNpWfxEdO8Qzvmf4aAj3H+xON9ayfBRjQdQa0Nf22t2urL
	2Y7vQMuLdm7/U+adTDw1Z6rMtpQRtblWgYANYejWE4+5c8W/kFTYQfA4gaPwZ/so
	2X3FUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb7mjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:34:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab7077ad49so1602221cf.1
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752755674; x=1753360474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0EtSnDYQ0MstT4xX/sUazSxxFTRJ/EGgAkOJJTf0zs=;
        b=IPaUCDX+2FtfZzl8AKVcDARLL6pAvQ8BYUimFHK90VUMerplAvm7I7AHTQ4G+AWSo3
         4+CblsAQEX+xxBjBZgMMockcrxdrQplPHup4X/C5tSYH6FYkIsYN3SumA1roYoJCQEPG
         Q+r+PYkzEhYSwiLWbUjephKpvg3XbyQb9K2BXo/A6EiPX4WAp/zcI4EBREvXi/4WdKvK
         sNaFxo08vEiVNqQidDKl0m5a0n6avL0OCtMnFZdGbmVZNtI8eZt08pmYath0TmstJqFM
         XqDw1YcAO+t6OcvrRkNS5XiaD6pAYoQlc3JAGcEb6Wq4RL6ZS8Ssn27OLrMadNbqZ3Dr
         kVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkM9Td75VgLu1hvBtzxngQOUPw6Ly2BXK1Rli+nH1o710+jVFXlAX71HpWg8OnMunzENC05fUOTHGokA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE13/CuHxrRf/rqchO2bmEn2P02ukdlBqJbA8WXGlNLzKxiYxG
	gzYswAm3/G6f1rTYKHdLuSfLfU+Ecle1fMLE6VYeWP+o8mHN51vPGeixTZZXQIiNwn+98jWBPte
	lRITgNez7vN8JRwGNCfOvonYdAx3sKUQ1z91ntpCVfc1G6ycgg2jXNtV41ShcuZ0buQ==
X-Gm-Gg: ASbGncs/bQ9RDML7z/CXcp7egHO5k5cnFSAdeW6nv8q+7Z3lY8UTKC06F6lsgDYlJGr
	HP7AEXjtdM38YV9e7rojUOCwuGcRPBU9FxHDk4QDMM1qe1iezFCwxQyVEBVzwka7Jgxs5u9vDxk
	C82He54RzY7IkfoicWWjf2OgNC2EvAtqkcmeGfX6sK3YSVMMKqtf3Kam+50dsSon1LJ1qm9J2jN
	YGBS6XztZRo7dSeLVFeF5nVwX8u67i+qjKCZcyiZj9AaJpjpiKhuTGIirtFkqawrO2TzFfNnh/6
	MduIt7S9znIZYP2iELSloyxTIw9u1b4iOTkvGzIik/mJNmkrLIhJ+a4Lwr0Dde8oM/M8eSU6KTD
	jj+1okKVvOVTcE/Y4Nk87
X-Received: by 2002:ac8:7f15:0:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4ab909bb071mr40839161cf.2.1752755674142;
        Thu, 17 Jul 2025 05:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1Ii4oHRT/NNq7i3cIAv6HUe9Cyd9qkoWu/kf/j1oMAf1VxpLFX0jnaIsgTckfm+2dKO8vGw==
X-Received: by 2002:ac8:7f15:0:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4ab909bb071mr40838971cf.2.1752755673678;
        Thu, 17 Jul 2025 05:34:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82645fdsm1368246366b.97.2025.07.17.05.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 05:34:33 -0700 (PDT)
Message-ID: <11eafa2f-ce53-4df2-9193-dd6fcbab9bda@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 14:34:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: qcom: camss: Add sa8775p camss TPG support
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: az0KLzYIatVm06dM9Y9jhuB49wOvVQ1k
X-Proofpoint-ORIG-GUID: az0KLzYIatVm06dM9Y9jhuB49wOvVQ1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMCBTYWx0ZWRfX2jU0qAnyJtHC
 kXQs95nY0AKGFJcwtBgp3c2ddm7izYs/myX8D+PuLIzWvGxIKqMYVfEgH07IuPCdREb0iNaMvnK
 Vox61ZmpIfATgS0VWPT2Bn+4LRV/SqGdy+uZ6hb1AoN/vRoeenOEggLFMj6dc17+52l/ro+5AMk
 po1YFYDpbTX8PYGmPFHPrKQj3rxJQXXWYrriQOd9OJ3pPL4YeJDKZw3KUkxUh3/x32s1fczpWMW
 Y972FoZyGWWik0tHmaPDz8aoxLE6oGvnwcSFj7EA6xwGxFKcDwGxVrtCZPBCcUVuVcULwZ9QYnn
 wvzlwY3b6QRHtny1h9DBUL1b5rwtsLntMmfT+F4ZhAmWUUchBJ1AGxjwhD1UDazbzRHv2Gd2U7E
 v8aWHnSjJO4/WTjY74Fg7PSuwCCbVMiVE/0JQAk3SHKfSiB4ovTurJ2TvMjEAc/sBGLJeEeZ
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6878eddb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=kyHrPkqWk3caiwKyUVsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170110

On 7/17/25 5:20 AM, Wenmeng Liu wrote:
> SA8775P is a Qualcomm SoC. This series adds driver changes to
> bring up the TPG interfaces in SA8775P.
> 
> We have tested this on qcs9100-ride board with 'Test Pattern Generator'.
> Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY and sensor.
> 
> Tested with following commands:
> - media-ctl --reset
> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - v4l2-ctl -d /dev/v4l-subdev4 -c test_pattern=9
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
>   --capture=7
> 
> Dependencies:
> https://lore.kernel.org/all/20250711131134.215382-1-quic_vikramsa@quicinc.com/
> 
> Changes in v2:
> - rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
> - Link to v1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

I got a patch for qcs8300 in my inbox too, that depens on this series..
Can you coalesce them together, in case you send v(n+1)?

Konrad

