Return-Path: <linux-media+bounces-39187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7709AB1F37E
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 11:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D57D8188E397
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 09:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2844027FB18;
	Sat,  9 Aug 2025 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkK+dHIe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D34279DB5
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754730571; cv=none; b=CR7gXBK+9blpgAMzyNTFoIOotVI6jsngxB/UlqNqx/duQEk6EPq0VR1YkjKus8ht4u8IbQEqoZ5lxvp8Ga4vwOoVVzjcevzPhBmsAnmKRw6T+WJcCqUl4NGY9Q6ZLhPZo3pD7xahLA2sr9AYaDJ6h5arqUv+/4Sb7fH98rTqME8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754730571; c=relaxed/simple;
	bh=gj5WdryTYu7PT4dTZngjyxnWpSzUxEs+xqEH1hXzTQc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSWSc6soxtnqYRDSKYxusa2i+As2brEdpt/EVAmhd2/gfee0YeNz1G958pa9JWPdsq8Q7TVxDP4gSOVzEtGDND9Gzrhs4gN/AsNUg+oA6A7uIYWB7nhQa1p6W+ST9gLepMDjzLEaJupHjI40/9khCInfqqnO6LkHmvbUt2ovTKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkK+dHIe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5798i4J9028699
	for <linux-media@vger.kernel.org>; Sat, 9 Aug 2025 09:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i1p4sIou1OtXlVv6o2JJTzg44/zZ5upOzf0/7xYa3us=; b=PkK+dHIeYigCel8M
	i/26lYcOcLcNcmR7YKbLytinfo1eiki44XBl57oQIYOCcN665fhtPBfXhXqW5GaI
	KyeHFUXCp+/c7EmIEd3vx8i5oNVk13qroSB4tT1OulGxe2MHTTpLwS48RTmptrsB
	oj/pm6wn2oh88s3ej7kvbh0X3bM/tBFMJ5LVdsKYI4ikY/EudQqAjXh3h1ZEmpNj
	JiKMbzz2Bo9v7Nq/SJxPyQraRuZdeQTxXO7bIIoVKBAv9YOOrzmdzB+YGLNihZNh
	6yrcK9XQIXJdqgLFgLDuryEBwWF71gdZQ9t+dcGxVvo4vTe60O8CnnKXREEPZ6Zc
	T1JJHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g0b1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 09:09:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af117ffc70so73064491cf.1
        for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 02:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754730567; x=1755335367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1p4sIou1OtXlVv6o2JJTzg44/zZ5upOzf0/7xYa3us=;
        b=D6fj6oCMg8yeVxdWySdTUSv6T2O0+eI8W6kNnp0YNJ4HT2s9YqWcRXZZhTpn8Xi4ow
         5O5ducgo+aK1SRheS4PJb/5Qef7WxNP/pergJLbCUYW8Zj8yb0rGhxuGlysa6e4ZDC1m
         nFhWCX9heVJVJFms3JV9wshkWV79DNM/X6lvhNVXJ4RwtJFlYj/7ZkLOveLICTCAz/vP
         e3++IUhkS2grCgfpnqYUclVmH5sGu5zWgboDDOK5QSNhvQ1Pr/zdAm46OLWjUxPN7wN+
         T5+HO40qeyUqy6mW7JZItcqJwo59/TR3Wb4Tov7cC5o2HOUeC8wBqUm+pK3gLwiHFUvE
         WILQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6bWMD9xnGgvsg38l3dj3r3m3naYoSpcvwBpasKombtZGM1/L74DxR4BsSsw7lWI2JJa23ZN4Y4uf95w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzD2LYJfMsCDDte0EaQOZOFvSYhZClPbD+3VrvyxL0uj3hfThG
	2QWBSwKXRLPEfBzaS8MuZmM/nKF2Or9m5VIfvOOvT8ZEqUEIdFfvZOVWpv+nHayuTKmHTbgoQe1
	VHIDaCcmlEngVXKW9XNDAGkfmWKQoOo2H37VEXwLP8z1EAFLKr4I1Fsxoh0U06vwF0A==
X-Gm-Gg: ASbGncs3SO5ebDGt0i4rajn9h1xLcbzyrs9ETh4Nq01mOvQoBQgvObTzCZNFnZ9Eg8Y
	/qZlRrdBrQx4bl698dVd5+velepRmfgApB7HaM3MSQ34X8fUPJe3Cg4QIN1Y1GpP7WXPov2reOd
	P/4h7ZoM9WLA492B7GuYNz6oFFMI788PD/Z6C++zrUeMu6emSK5UHPjem+VH9w+GjKCwvaLZeVg
	4UYKzMOkJJdt82/yasw65rLn0chQRO3mx77jlGr6mb8sLJbQ4hTYgq7Sl3UXWMuoNQviIN0c233
	Ey2Wxvxc/eHOPSzFwLHQxdcwpF6GJwZt5Q+lwle4zptEBzkrTk8svkWwHSGPdmWVOIgfcA==
X-Received: by 2002:ac8:59cc:0:b0:4ab:65c3:37d0 with SMTP id d75a77b69052e-4b0aedd7d06mr83220671cf.31.1754730567414;
        Sat, 09 Aug 2025 02:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtfrK4MBV+QXIawmd4r+w5lF0c2fMvBfjSp7sAbrpzm1gjiPZN0ejajPq8vKUzIPcSwLTQWQ==
X-Received: by 2002:ac8:59cc:0:b0:4ab:65c3:37d0 with SMTP id d75a77b69052e-4b0aedd7d06mr83220271cf.31.1754730566864;
        Sat, 09 Aug 2025 02:09:26 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm33241324f8f.18.2025.08.09.02.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 02:09:26 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Sat, 9 Aug 2025 11:09:24 +0200
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJcQRLDplbNetNKN@trex>
References: <aJHgh8mon9auOHzi@trex>
 <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
 <aJNTigOMy1JFOxot@trex>
 <fcdd9534-d494-3fdb-dfa7-1d15da6f697a@quicinc.com>
 <aJSvjqfQw3kNrVVH@trex>
 <447caa6d-13d2-2e75-5f33-6df9b2fd6d69@quicinc.com>
 <2yj3er5j72yoa2ltboopx5gvquur7jl3viqnq5qsci2fxjf4ix@7t63vgizfknb>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2yj3er5j72yoa2ltboopx5gvquur7jl3viqnq5qsci2fxjf4ix@7t63vgizfknb>
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=68971049 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=24S9wm6B5SMZhME8xikA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX9kFon00/3Rwv
 u3/cje3V4STDg8tZd/9VI8nibC5c2tybnk2VB0qWwKxaUg3OgU1E9KLzVD28XWyKpsWr6n3yrw1
 dob8cHB4yEMyCymF7pO+Y6Eh3Kln5fvF/yA75RZWlTu61gKAdYDFPCPR81CYumbaFOAtN2q3q1L
 fjNtrzfEu9VogU2VG8ieMF0abNAsCk99UKI/Md4M1gVA23W3N6KOkHHXVY/0FjAR8L3upSFvqAY
 HjZ2YnjPSIg59jvQ2VcU7/aCSBJIZkqCAFlcKpBssvFAKMSzImcAW9evF8LsXVcIiMy37tR+EoW
 ev0I7Z7K/VIMNq/hB8IK0hLKizNFeAHMcYs+7W9l+S9nLB4PMWBOJ+V14T2FIAYNrTHI+UqDWx/
 0a89/0HL
X-Proofpoint-GUID: fOQqxWoIbNo7h9yM2TbRSo2FYIru_iIg
X-Proofpoint-ORIG-GUID: fOQqxWoIbNo7h9yM2TbRSo2FYIru_iIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

On 09/08/25 11:18:21, Dmitry Baryshkov wrote:
> On Thu, Aug 07, 2025 at 10:05:10PM +0530, Vikash Garodia wrote:
> > 
> > 
> > On 8/7/2025 7:22 PM, Jorge Ramirez wrote:
> > > On 07/08/25 16:36:41, Vikash Garodia wrote:
> > >>
> > >>> It was agreed that this complexity was not necessary and that we should
> > >>> just drop <6.0.55 firmware support (which would in any case only include
> > >>> video decode).
> > >>>
> > >>> And so on v8, I removed the above.
> > >>>
> > >>> Now I have v9 ready to post it, but Dmitry is asking why cant we have
> > >>> the v7 functionality so I am waiting for direction.
> > >>
> > >> the issue is in firmware for both encoder and decoder. Didn't like the idea of
> > >> driver carrying the hack for a firmware issue. Just because, for encoder, we are
> > >> unable to hack it in driver, we are ok to have it enabled in a newer version of
> > >> the firmware, we can follow the same for decoders as well.
> > > 
> > > if that is the only reason please do explain what do you mean by hack.
> > 
> > I meant that the EOS handling was not needed in driver after fixing it in
> > firmware, isn't it ? Was trying to avoid carrying this in driver.
> > 
> > I tend to agree with the comment made by Dmitry in another thread to have decode
> > enabled with existing firmware, no option but to support the *already* published
> > bins.
> > 
> > Having said that, these limitation of having a separate EOS dummy buffer is well
> > sorted out in gen2 HFI which have an explicit DRAIN cmd for it. Hope this
> > motivates you to migrate to iris soon for AR50LITE variants :)
> 
> Migrating to Iris won't bring gen2 HFI. Think about users which have
> OEM-fused hardware. For them it's not possible to switch firmware from
> gen1 to gen2. Thus, if the SoC has been released using gen1 HFI, we
> should think twice before upgrading it to gen2.
>

As I understand it now after the thread, any driver developer working on
new features should not be constrained by users with OEM-fused hardware.

Since only the OEM can provide signed firmware updates, it is their
responsibility—not ours—to figure out how to deliver those updates if
they want their users to benefit from new features (or new fixes).

The EU Cyber Resilience Act supports this view by placing the update
obligation on manufacturers (at least that is what I understand it, let
me know if you understand it differently)

Breaking backward compatibility is something we must avoid of
course. However, guaranteeing compatibility between old firmwares
(whether signed or not) and _new_ features is a separate matter...




