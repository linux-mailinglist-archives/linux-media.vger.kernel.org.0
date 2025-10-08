Return-Path: <linux-media+bounces-43935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76143BC3C26
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 10:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC3D3400D2F
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 08:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4C52F3613;
	Wed,  8 Oct 2025 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+2oxcFl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C82F28ED
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759910890; cv=none; b=tfc/9RCiKm03pZhqs3ciO6ZgnRsCjaSbcbMgEaZvmoWp7B8eS5bN3by6OmW1Jd9TZSJZcoZS57q/kvdAK0n7X0l/crY+1GbbckkVoPUy2lQ6ViLXc10C3Ky+0Jbnr09Orxe5BghXovZn5jUA11yJhsq6xPZLhUOQMNNIZgn57LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759910890; c=relaxed/simple;
	bh=VdZzByrGm9DNfUL78lrekrQ7xUzYKB0wMwu8ejZF1Zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AnBEYYfrTnjCeW7VxtUrr0w/cGinMScT/ySSGoXUY1Y0r5Zyeu93UhBkpVyCMNrxNXeT4zurTX+5B1omAA7ATwvHg5ol1DYA9Ijz8fp7gfOGRpqPL/eZK1eJvfU8HxcoTSjTK0zVy01A8HqgO/5CtfCvP9MUBO7Rg6tNPa75If0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+2oxcFl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987aTti003047
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 08:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnMEMnaUqNraMukID0i6yy+MPFFPKz7o4wOoLN4ozFI=; b=Q+2oxcFlWtwnvkJR
	YA9/+F3BkFJW0U0+VSERXQxFok8TL859aIPcz1V2YhogjTt8kCE9lwU2olbtuYOF
	erNZ7Rn/C8LqKH54HzAwDW90congUTHn/nHDTxkey4cfzfdmwXdUrth2VNwUhVfZ
	Pg0aeQId58XwfmDsuk7MXJLVoAMZEwpw/Q0cgo9fTAnDsANfP3GLDJWcEtEqyI6j
	l7pkklMDafRmrG3U+nmekkt0AX+RZQ/JPSQT2cMhEQ88z5I20tT9Zv4yttn/O4Yg
	jL/EY7/FL0vkGY1U7IxQoFGERTL06A1O4t1/S5iF73P9o1/WFo8nrQdd8g9bG45z
	C3aS6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy71r9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 08:08:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-883618130f5so29193085a.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 01:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759910886; x=1760515686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnMEMnaUqNraMukID0i6yy+MPFFPKz7o4wOoLN4ozFI=;
        b=Up/3w7RdsT6EmUO9gC/XVqHjx/AX5ToAxxJb755gBiHmEoDc4apfhYKa4r1ggGM3W7
         AbVtgHBD5KHlrM1IDbDHqHqQ9RtBVjWmezLm4t5cXVsbvA+LJbkM5buaWrfmQNLDE6+c
         mN1EKy/lVt7iV69kAGXplcbYlB1pbMqoP72uZPc0nwoB1fm9Nzbb9lG4+WZ1bN7XI1w6
         rEliD3ddnsa2/Ln2lUdPg6RuqSTKJTKb/qy3LCkmpe56up3Y7VRynCtn0dmSnYRethxM
         D7jkZdFC8SX82at4Bq/P+CBZJyn5yKdd4Oos7Pb/92hm2rQtmRBCDTLaNV3O6ifVPw27
         JT2w==
X-Gm-Message-State: AOJu0YxT+fgq5Zn05qvKa8bwWuMj7VFCqMbY7K+ou8wwGM8ZKLL4yGPX
	k2enIYmGZSFm+GKyriZ8KBofNse7XmCfvJv1rJIH+vzdIyatYosqrcMMpTWeiF/XN0kCSmZABQr
	4A3FIl2Ta72a40J+yoEJOPrKgBSVnfmlI+M1cjHszZmaadLcvKs76QwzyhWE1FvWwQw==
X-Gm-Gg: ASbGncvl0sOhpjSR7rP2KdZzWXr4cd3Xiek20SokpWBVc/4VGt1xnMRYbGXCH9ZFJ2o
	J+ci+ETlqEDWfw49BNXBB1ByVdkqoEg825RVNau6rmANgRXpiEjc9GOZytxBFTZcCaoA+LhdQ8m
	rxoVhJPXug/dvPCXv3QczXN/B8R68TtSC0wadNnJBB78gEoYIg5fWrDHBfzxWQHL8KZ+A4kJgVH
	7XSo3OQdYOJb+ivPq1RZFwCxaCMvpVvPxvTSFuA2U7bgpZJoHUJylXM5K1wNEUjbLkWYjZwGG60
	rjyOSyqkYNpjkXjz/01cQP9u7Wa6LG9/lSn0CYsuZsePRLgqfxSkcpxVaVDVjgjkkJ01R4trTUi
	8L06Q063kHGa2IkNIyDzjOsTBy8g=
X-Received: by 2002:a05:620a:199b:b0:85e:3ab2:960e with SMTP id af79cd13be357-88354ac50bcmr223784885a.11.1759910886378;
        Wed, 08 Oct 2025 01:08:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/zf47wSrjlqtPLG8ILcAawn5rD+RpQ+0R7AZyfqB1Y4zsUZzl2+3Yu9BwkSfmCvg9QGzqlA==
X-Received: by 2002:a05:620a:199b:b0:85e:3ab2:960e with SMTP id af79cd13be357-88354ac50bcmr223782685a.11.1759910885805;
        Wed, 08 Oct 2025 01:08:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a177c62sm1568922766b.91.2025.10.08.01.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:08:05 -0700 (PDT)
Message-ID: <9278d526-4759-41ba-8c06-da909479c3c0@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:08:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] media: iris: rename sm8250 platform file to gen1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-6-def050ba5e1f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-6-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e61be7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=tkggsdbV04ru4vqEU2sA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: vW-VKCb40mw5PbeJytQlRsg5nfbBZC-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX8aP3srpSUWCR
 0/sWibhLMtq2CI+b2vyK+Xwv1tlp5Ca1cHanN0Kup6ZXR8rDJy0KerMWUInDj03XsjoVm7g7oLg
 q5cMVj7zHlFVNCa5j6tAS4UPS9Wq7+jXpGOh9E1aRcNNNdtxqUDt8oTw0YF426sODY2SdoU/oOl
 kdTI1jnIaSWjjIl8+EDuIaxaBCds46sAioRttM6k0LNqRaiku4u+nJ41B8Xo8p6qnkfthV/XIdr
 PdVLVdkeJGLlE0UzIsepdXfoXnYrjRElfVpVDVqORU8QVa5Ch8ea+Yke6f2X35rFFwc2euZ5d4f
 1jNw0fcNUrMv/MmSAKj08kjg/cydxQOTh17X6mqABmgyYQwh2KITPoQOCsttDGEjlGPGS9aXb6W
 qHySio4H6gfzBbCojJ+QHp17Bja7sw==
X-Proofpoint-ORIG-GUID: vW-VKCb40mw5PbeJytQlRsg5nfbBZC-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> In preparation to adding more Gen1 platforms, which will share a
> significant amount of data, rename the SM8250 platform file to
> iris_platform_gen1.c.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

