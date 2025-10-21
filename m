Return-Path: <linux-media+bounces-45153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 624A6BF82AF
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 20:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A1DD4047A3
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 18:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8596034E74E;
	Tue, 21 Oct 2025 18:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POIpx/kH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7734D904
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 18:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761072965; cv=none; b=MjuF4rZv3gczQQNVkrf89AqvD7kuNDfrPZac/Q1Yb2bEsoJ2F6oMiVaa3AJTIJgEuS2NY92FcU1+vRs6DpA8J8dSRpBAetBnLj3GjzCT7p0abTyKx6fpBM4S7Yi7WQdaCUAlg3ci+ubJhY5eZmKtkKuuzxE1E/bfAs/eqpNRlzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761072965; c=relaxed/simple;
	bh=eWr+h+p2rCg/f9WNSmdg2UdER2LHBNHRJNAYZOXa1Ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmOHA5jmSHRRppiotrj4TssdMhr2TpRjO1yPYAoMFnHAjkjKcyeNh+owrt7KNLFY8gySC0toI+T5PAKDqcBprzhatGg6ueMCr4zcmpShzb8CDFOlUIsiip7Jpq51zoepSF1Wjk+dFlLk0QbODH+vX6x/kAcZde5DIgSKSRFkA24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POIpx/kH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEusVq029823
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 18:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQjRoXTRcS0OPuTJGmQ0KlJhjtTIYf+L9dhy3S8Y6LA=; b=POIpx/kHMge6zSSM
	RvH2TEWWnmpr/GYQzMYnJGaGhgOEwPMDXjWiwlVH1KA6lGzrHC8TDbC7bhNdmkch
	/O8wFiiKRGAxBCy2v7wwg9HcPdYBsISZAM5XoAkGvaYXJnHZq0ToBizBytw1JA01
	CrtTCRTv9PwWC30XPIiuKgLYeD+DAbU+UtMdak6KD7oXJGAZIapRkb7fQi6etUGr
	Gm2SXZFl89r0oQy8hEcjak/AtSfv/MWTRejBwAolHwO0Lzg0LQA3NOWfcfB30Gyz
	p+yxLDgzyhvfu8dRBy9BG+gcItSYRQ8ANNYUU9mzULxbd2dbpWSUtGKr3XnfouR0
	lesorw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge1x6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 18:56:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781269a9049so10281703b3a.2
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 11:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761072962; x=1761677762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQjRoXTRcS0OPuTJGmQ0KlJhjtTIYf+L9dhy3S8Y6LA=;
        b=stlcykEBxH7baVT9tSX/eoFNVibKrZu0S+5roBN3+bSFVa7WAqja4WWe+SGq5Ukvlf
         JSXK3YY73YRwkSOi/cTMPeh5x96vndyFIG0/lia5Q1gHh+KC1bbaa9UJqyYVS0DypDCf
         TWkkhiPZtdnKT1XVw7PQ6YUsm5ZawxHktqNxbCnMhH2ae/05jqfBN0VfmIyroYS9/bIw
         Abl6FglrXnecu9fTKdAjuOxErO/1Nan99tY790mqScBLUph7e0LpDFEjNOCE9SAw8AhL
         UIpmut7q0tmbXnq+3KiWOifZxBG1IJjFcGTKhfKb0dXJTD+T7ff9LC9kpF36lSZ+6Xl7
         0TRw==
X-Forwarded-Encrypted: i=1; AJvYcCUV6EKTZLs1sa1iASk+etg5rgritugJtipCsPcRiXvvDC16qSJz69gFGOymdGdhQLL6X/+ildssa4VQPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyaEAu5cbldi0Rn6hknvewLmOoKrsjCj8IEF0EthipOKwRimDd
	Kj9dPueWjQvrCCQ3P/mdmCel/RePrJU2hmENHAERMsLtweYzc3wAAn5Dl1dw2Lp9GTBLEjS28nu
	AFJHG9bCn7YxjsQU2zPWHlkXch3smj7DdKx7uQ5yK4WsyRn3DaWmDjWVuUvSgp8uDlw==
X-Gm-Gg: ASbGnctMABlcTFfz5vpU0N95avAg7CJmFi/TuPx5ijVeDkdsL/7bhn7vme49jkmq5cV
	7RrnJoNctKw30tk/0K3VEje299mEfD0RgT36Y5gtw1gXREqrptmXHnPmyPRY0RXVqRv5NpKSdqp
	kZF2pwHl3FNUEwtyN4aFtFkmUb3u1ojTvHuSQysNPubn+NXoKVY90f+5DJHH+yxwQhBbV0wRk3g
	Tr7joM+sVkJJPlAvjrvWFbIcns9VMwitCdqS53FozUgEqQ+XjTuMD0Q9N3XBmMIgHULB4057TJq
	eWp4yBMlLpMKbeeoGJH23XIU45xBJ50vAcw4rm7ijswEtws2u1uTKst0BYxP7vc8mMR+gNHoN1Z
	3uj93XUwU++Ax/0BPPyBC18Q2ZV6yicqdhw==
X-Received: by 2002:a05:6a00:130e:b0:77c:6621:6168 with SMTP id d2e1a72fcca58-7a220d573cdmr19758665b3a.30.1761072961831;
        Tue, 21 Oct 2025 11:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzsxj6C+gt4pi5RK02A8fX5w9MLOUBphDfxZMgPHSW4KqbqzjV7uii4eQu4FEcJbjtpu6vig==
X-Received: by 2002:a05:6a00:130e:b0:77c:6621:6168 with SMTP id d2e1a72fcca58-7a220d573cdmr19758622b3a.30.1761072961147;
        Tue, 21 Oct 2025 11:56:01 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2326ac189sm11395710b3a.29.2025.10.21.11.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 11:56:00 -0700 (PDT)
Message-ID: <034bf6f4-0a49-4973-8536-28526b3409d1@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 00:25:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <20251017-knp_video-v2-1-f568ce1a4be3@oss.qualcomm.com>
 <c9d8f76a-513f-4a09-bba4-cb8f0df1d2fe@kernel.org>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <c9d8f76a-513f-4a09-bba4-cb8f0df1d2fe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX0MMXPxCVSxkU
 MtjGeLgldPh46OMxGfc2hJ49mZDPrjojbQwBQiDTtaL0FZP+fTyuLM34XLhOHQX+Z8M2HwcPofu
 iPRHUqVnB+m/fd48oj04/ZNKMnrRkTVsyuYfGBH8IopA80JMe4G+rbVXOtLM4weOX2MwmgM5fbU
 Qti2vP2Kl5lxWsOI8R/UrlwUm64Xz6CsTIF7RA5gnfSx15l3aSPgIUZ6ntFsz2FVsaM9YKAOwfE
 huXxRW7fR0uHoNJpFkeC0VQX/1aWGFTxfH9XFQgOGLID+k6Moi4BInPdX4ChzhRFgtemYlj7GeC
 fdB/uFmPN/1/ux26qvpkQZxuQp2B6hw2677CKzZLM8ZmKzB/9N8y6pUvrlu8++GhDgXGhpWf8jV
 /HkGxgW3ahaFV7r6VJFgTb10PJJq1A==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f7d743 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ysf2FyB+yl5xZy2y99iGVQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=xOFkI6Ot18FV97ylQRsA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: n1wP9IWXPL_-Qv0epCY8hdlbz2tY7fYn
X-Proofpoint-ORIG-GUID: n1wP9IWXPL_-Qv0epCY8hdlbz2tY7fYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020


On 10/18/2025 9:28 PM, Krzysztof Kozlowski wrote:
> On 17/10/2025 16:16, Vikash Garodia wrote:
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: core
>> +      - const: vcodec0_core
>> +      - const: iface1
>> +      - const: core_freerun
>> +      - const: vcodec0_core_freerun
>> +      - const: vcodec_bse
>> +      - const: vcodec_vpp0
>> +      - const: vcodec_vpp1
>> +      - const: vcodec_apv
>> +
>> +  dma-coherent: true
>> +
>> +  firmware-name:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: video-mem
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    minItems: 3
>> +    maxItems: 8
> 
> I don't understand why this is flexible. Make it fixed size and anyway -
> list the items.

kaanapali vpu generates 8 different stream-ids. Now, boards running kernel in
EL2 mode can list all of them, while boards running in EL1 can have only non
secure stream IDs. Min have the list of stream ids which can be enabled for all
type of boards, while max is for boards which can list all in HLOS given kernel
is in EL2 mode.

Below crash would be seen if boards running kernel in EL1 mode lists the secure
ones.

[    1.361157] pc : qcom_smmu_write_s2cr+0x64/0xa4
[    1.361165] lr : arm_smmu_write_s2cr+0x2c/0xbc
[    1.361168] sp : ffff80008005b8f0
[    1.361169] x29: ffff80008005b8f0 x28: 0000000000000000 x27: ffffc7f252f45320
....
[    1.361195] x2 : ffff800081200c48 x1 : 0000000000000048 x0 : ffff800081200000
[    1.361198] Call trace:
[    1.361199]  qcom_smmu_write_s2cr+0x64/0xa4 (P)
[    1.361203]  arm_smmu_master_install_s2crs+0x7c/0xac
[    1.361207]  arm_smmu_attach_dev+0xb0/0x1d4

Could you please suggest on listing the iommu items ? I did not find the
relevant references in other bindings where flexible iommus is being listed.

> 
> I already asked this.
> 
>> +
>> +  memory-region:
>> +    minItems: 1
>> +    maxItems: 2
> 
> Same comment. I already asked this about iommus.

Same here, there aren't any bindings which lists for flexible memory-region.
Please suggest if there are any such references.

Regards,
Vikash
> 
> NAK, we should not repeat the same comment.
> 
> Best regards,
> Krzysztof

