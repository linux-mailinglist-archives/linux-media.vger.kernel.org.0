Return-Path: <linux-media+bounces-27433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A44A4D691
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 09:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20A017A54F7
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 08:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B291FBCBC;
	Tue,  4 Mar 2025 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvUG1PgG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C11DFD8B
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077366; cv=none; b=WFvy9+Tk2dxOcR2RnH6W1Jra2I6V3zSH8sU0q6lbZZinfTP6BtO6bxX2HLGAzmg9dl3OYvdwCFFeVMJj4PsC7dDeBqYumoL4RuXCHVVq+mEAQbMWrIQ9610FPcPb3HKeJArZIzRBrvJeKIb9Jced7wIM78tWv6bvsg9tWNwI44Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077366; c=relaxed/simple;
	bh=XgA9qqbw3UkE7vJt7EJN9UvDMWDyIUQzyLjlUvqTt0M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRPLe9P5Tf+6oyoY9Wj3j93LHJv7Nrq8FE8Sydh94fc+Q53cF6NA0to+l3k9OGWoRaYcHwUepKxP9d7GEXivab2zrMp1+S1sphzfprssQPuvjWLllZGJZeIk8ZN5e039lKLl968bndJ8z/YfypQ92Cj+PHa6A8fpLHr32FpKgnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvUG1PgG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NX3ik006113
	for <linux-media@vger.kernel.org>; Tue, 4 Mar 2025 08:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XAMOM7rvhCYgMuIw3HT4H/aO
	fsEkoZQ5Aqu4Fze2AEU=; b=jvUG1PgGOVC5kQ7DsFZlnFb43l5Lntg0lg8RuOxb
	xcqIawn1FrIoBG2AnX09O/3fL80pZ7MzN2EBN15To8lm2KF9O6jjFMDcQUkgd42i
	Qik8A8DLDoHf/jnBB/22laPT7G7F5l7ewrhymH/V2AW/e5UbL36g2yo/aU/kAZsZ
	uF5bKgXUxjfjUHsD21qMr/s6gr/D5xDAlg7aaVsUvbiO398Nn3WVCBC8W6iU+J8l
	gnpMM7NpuJYhfj3Ko+GiYNzQWxk3d9O+gmDP2xztPaQ1fnJvUot74YZXyF4VzDjd
	te7Dq0Mtfn7c1ZOOSx5z+k1jiAdwXAuFrUVroUqgP2o2Pw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6th6vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 08:36:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8b876f694so58000336d6.1
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 00:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077362; x=1741682162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAMOM7rvhCYgMuIw3HT4H/aOfsEkoZQ5Aqu4Fze2AEU=;
        b=OencAzeVJerEnAKPUbAVsLmoHbOU8VSkLp5t0jjn+PEqIakQRiadu7Jo+rezYoLG2h
         dySDNdS2urGgXRzwWZMUSmu0sOUjSkULexJ5ZZp+WjTxBaZ/ocUVo0AgqwuFT8PvZsj7
         G8W1gL81IWAl9OJjp0jQq43ZkoeCZjrNa50SK0Kh15nkK1K4TVtspiLEbsvZIo6UA3ky
         34+iaNlCguu6n1P3Z5fJXMaa93GQBVhkcnudai2tsj4SdZfZhxc9svwa/LEMj9XUkZsm
         6MhhXF5A+l8aa+CFbMdWSKVXgpk2lLkPjwNvza5wBldqM/38F0pgXbCJh5lsrrXaw2h6
         A80Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtVyncIbXu6fpsiunm+VbpH61WCZpZ1LFIRdwFjnTGhfhvx/Ir4FWQiRVY/0arlrppMgtNR60m/RPBEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIykNqvDbfGG+bGl48lAnbTl0JmI+psqGJnnesVk4zL2qAWGr9
	O5g+9r607vBph7DMtLFULub9pAvEZ/lmMSnLNgkjLxLFpZD36RpdhiT/2DIGOOCkyw94kO9etDn
	TGn5SFF1cZ6G8hBcazFfho/65w7nO+XkiSuG7JGx68fzI/A40l6zOePqZ1X5QWw==
X-Gm-Gg: ASbGncvj+ELFKjJ50MVH7xR2OntoPLLxlj/6XEmsgNlSKy1p6l4pbvSiT1EkclU08S6
	2newG5xmjlEq4ZiuX5o3FNCntgU4B66zc+tCjhhPhrwYBbkePBrcCn+WxfNgayI76//OtJL+nNu
	Azi8rGg1oq75dUxFlUer8Q1qQfmEWPGdWoKq6yXyjdk8bScxOkVLwJZsUJhob2Cd2h93SPFndKJ
	yFKFAOU4dJXj2hdrXBbtYOQZfndgLuuWw/AbP8OFDQPXLhBeY332gQdXYRLkCJEOPudLuxkEXw+
	1fqC5sdvlvOuOrk0lvg5xJ8RY5vjRVIWpWmwLNaMK8YhKG6s
X-Received: by 2002:ad4:5ba3:0:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6e8a0c87592mr237230306d6.3.1741077362673;
        Tue, 04 Mar 2025 00:36:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYTjjYAGqBjSa8LYcj6moKGc25A1v1rHHnj0+thRYs3Enml4DGKp4CuJXYuuPTy+m3iTBSkg==
X-Received: by 2002:ad4:5ba3:0:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6e8a0c87592mr237230006d6.3.1741077362372;
        Tue, 04 Mar 2025 00:36:02 -0800 (PST)
Received: from trex (54.red-79-144-194.dynamicip.rima-tde.net. [79.144.194.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796051sm17265067f8f.12.2025.03.04.00.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:36:01 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 4 Mar 2025 09:36:00 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v14 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Message-ID: <Z8a7cMmxJuHIhgjo@trex>
References: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
 <20250208225143.2868279-3-quic_vikramsa@quicinc.com>
 <ca8e6569-b466-4f83-83af-38c51891d395@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca8e6569-b466-4f83-83af-38c51891d395@kernel.org>
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c6bb73 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=cl0az7d0LwC7qAhl51RXhA==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=-c0S-HA5VnWDXXpzp3AA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: XomPwM4kfTKzVLU2SV8-Y7MIAeXBRjbB
X-Proofpoint-ORIG-GUID: XomPwM4kfTKzVLU2SV8-Y7MIAeXBRjbB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1011 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=775 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040072

On 03/03/25 18:13:20, Krzysztof Kozlowski wrote:
> On 08/02/2025 23:51, Vikram Sharma wrote:
> > The Vision Mezzanine for the Qualcomm RB3 Gen 2 ships with an imx577
> > camera sensor. Enable IMX577 on the vision mezzanine.
> > 
> > An example media-ctl pipeline for the imx577 is:
> > 
> > media-ctl --reset
> > media-ctl -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> 
> AFAIU, camss does not support SRGGB10, but only SRGGB10P.
> 
> Based on tests reported on IRC I think this might not have been tested
> correctly.

I acquired SRGGB10P (10 bit packed) frames from the camera despite the
pipeline being set to SRGGB10 (16 bit) samples.

so something does not add up.

> 
> Best regards,
> Krzysztof

