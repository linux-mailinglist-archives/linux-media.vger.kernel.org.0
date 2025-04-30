Return-Path: <linux-media+bounces-31425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5BBAA486F
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E31D9807FB
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B511B25A630;
	Wed, 30 Apr 2025 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iM4E/UQS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA525A623
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009015; cv=none; b=tzgKkKu8aSiHdTmbPbpQWjsu88YXR5yuEpMxDadxbcT8jZgLt5waYrvsPv6SEw0hEv4fXTDYx+9Uir5KYN404LHRI+VhLXeCE/zGf3Nra7ZNTuR7mlpbGZ5M/UU42ys7iDjLUMvOU4zkKC6ZlgTsyDfnXgopghnMAuwfFJ2+MMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009015; c=relaxed/simple;
	bh=1Q2QXKXdAqsuyBrrruUAb/meNWYdaQZckDHeqG5YaDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPZn8Em2k9RUUDd5rCrbY3Kp9Q/4TRduelm70SaGNUgzHvMx5PauVhFnL1MULAqrtkNyES6izQOFLwCMOhOXeXdTK8LCTmviKtyA/qItRQPOZarHXMUgJFhf2h+//ZWPKky5e0RO04M9FM58ySQIpzEGndrffYRFXz59XLZraKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iM4E/UQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U970Vv004155
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 10:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dMEDitlwliRXG+C7lDQReeUjMvhJGh+ywOSS2cE1yI=; b=iM4E/UQS/KtzSS/x
	SNEBJUQZCYLdSbL+r6w4OmeuO/tsWg85XMKWTJ1Cu9C7v9mMRp2Llw+UpfEtgI1M
	laid5A33cbbFEmqupnRbfVAywzml/Xichfm18kL6J7E5brVhvZtS5/G6G6QsAChG
	Ki7Lnxm4d7CDIXGGc8Fp5SCOCHFThyzJtFpCU7BP9m752hN7ayMB5lXZZtbGRe2K
	CMu2azS1sj9o2y2/9uPI21IxsZeXqZ6vaFVw7ExrtY1W9sbLsh05uYXxlCfI/X+V
	Sk0/C2cysih+EkpqlHpeGmbwYPlVM7+daW120GqDqm6rlfcqCsmIlhOqSe7S3h3Y
	h7kfpg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u49ry3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 10:30:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476783cbdb8so15388461cf.1
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 03:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009011; x=1746613811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dMEDitlwliRXG+C7lDQReeUjMvhJGh+ywOSS2cE1yI=;
        b=WT5/j4kp0YCjY7N7+YLBhTJGlVmS3prN+4SLAxccS1tHfckQMFgbTjhTQDct59BVCV
         dpsdDMCCbdvfGO5Zh2nHmpLqG7wUPuvtnJ9HgnjQnEyqZnGgq8DzlWIWYRds/by0hGAp
         0AHy+yql9qeAzDaAa/4z56ZaV2wgOzPMWORmOgx9VTkzcqzBwH/+AC6f2mOW6GOF6Q0g
         vKKDoPxT6JOODuQYAAc18I3ZQkthSSzS4kCnrQp9sLFUEQVNrGp0LySpwn2UteyNx0DK
         sBB1IuNJfUqALkBWq13Ve1Jaotadsm+uGSb43jyiyfJJORx+3JVxyYP8m7wkqb62cVY7
         mU1w==
X-Forwarded-Encrypted: i=1; AJvYcCVuLwi8hh0syLm7RtFoaDsE2D31ptZ8rlInR4jT51SSVG3xSmX4xR9WEDsNDN/hVFzqdIbJGiflN6Ac0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy16kCXZp1ylb5v4qouvLQWRNo+ZN06goUXp9+GU/+YIkwrPc/N
	TShcHcpE2hI1pIA2QLX4TPFFzGxYCC0HQziHKfMXzGbf1IJr7L5cBYbX71RdwDTgzL6rR8gMiUa
	MMUP2NbMKawQCZ0G+iwWev+6AfuO4SP1EtgMzthqM3rQHSvmbq6eREZGj7iw5QA==
X-Gm-Gg: ASbGncsKrwioMbRQRFLDz4s9Vc/K0+afgNz2IdZRsAmcnG/PPwKkHl7uAGg5WB4nHNe
	XiGCHzAg2JfASel3b3292T9rarEtnS6q8Z/1pOYBfffMl1+SfJPKWesWio0vAjdyYoHxt3XhsnD
	ZU3n64IrDBBZR1HAOM5q5cfVaDqmQLhZiiX4MB8Y9XlS6Jf2MNsuFIo1AXmwEogHIPl29yVT3Tz
	9Y0pmWMkz86doTMpaQZdyQtLvbkTnVBgs2K8BTDh9ZupQGCnX3lfKokOopUbZGF7us+ma3qS1ea
	tOPhoeZjk1kwujUThwgx5xUO9ljzIKzBzu9rmVmE6zFGBXfmwwc/bcOBpaeBDppsneA=
X-Received: by 2002:ac8:7f8f:0:b0:472:165e:91db with SMTP id d75a77b69052e-489e498d781mr11827871cf.4.1746009011543;
        Wed, 30 Apr 2025 03:30:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7lXha6b1LXm4abb6t1fB1qndIV4/7aB6CwAhaxwGXUOPktd72Ez4ObW6QEnJdW84G7irwCg==
X-Received: by 2002:ac8:7f8f:0:b0:472:165e:91db with SMTP id d75a77b69052e-489e498d781mr11827621cf.4.1746009011151;
        Wed, 30 Apr 2025 03:30:11 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acecf27a79esm205373466b.24.2025.04.30.03.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:30:10 -0700 (PDT)
Message-ID: <8ec19cb6-bf74-452a-8a82-285b2acd90ed@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 12:30:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP v2 4/9] arm64: dts: qcom: sa8775p: Add support for
 camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
 <20250427070135.884623-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250427070135.884623-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L0fIhQkbgiLduvO3Og-YlkD6iHCKH5e2
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=6811fbb4 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=J3B29TH01z4cvqQAex8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3MyBTYWx0ZWRfX87b4kigld1z7 w0G5NJRZQdOyKC2gi0MD9zr39fFFj+Ij1lLzz0I0YHuE4FXBy18eMjnjCwFmEl5ySq3zCEbKuCO vijwr23A6B2oS42XCaP6bO4PbfyfCzPDJOc0d0PTPQdkbEsMIXx9SMxMDN7CMdEcCkbcw+Hgwzs
 KrgaGf79+L+cQ3/G8DALseXrA7gfCEz3sJcOu7sOuiQP7hHNTPBLNCNxa+vyuBeGb/9+UbjMeGu 8foKqwUyAVyptAoO4h4jw5Sdjtcv9S/yTxj9ktxO/oxqqDk2RI4o6++hDHvUBNN8hfMtv9Xz+Qe TpKT/Dwc35w+id5SoGWZMZGxJr0eKh36mKLLusAv5FmVY7Nmw5xyLMOrZZr5h1dJVmL+aMFyRHZ
 HZk/PjYWx+1gLQDM+X/OHShVl6aLFuL3awaew8nWrVxwSAfcguQyrQXd0wmlx/P3TSiRZeZ1
X-Proofpoint-GUID: L0fIhQkbgiLduvO3Og-YlkD6iHCKH5e2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=993 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300073

On 4/27/25 9:01 AM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {

a newline between properties and subnodes would be good to have

otherwise, modulo the ongoing discussions that the folks closer to
camss are having in parallel:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

