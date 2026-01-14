Return-Path: <linux-media+bounces-50665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0527ED1D9B6
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BF2C30089AA
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA22D318BBC;
	Wed, 14 Jan 2026 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwW6/XG2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/08vOYW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5CF387575
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383560; cv=none; b=Bzl9/PCwuM4i/oIbmIozYg875R7Y9GxLH0Wc7AHutuzaJyZ7Qhuf0SpnYbj4anf2wzx7g1Fmbu2IEJddTazYwghfMFUaPfQfd+ZQZHJd+Dut6g8yc0b0jxh9dg7reF+NhE3rTV7MDMC/5/DT45KRBj1+kBy8kf/TS1/0P5w5/lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383560; c=relaxed/simple;
	bh=ub0fnL3XSBuIaHEkGG6VVwGUb3N4Aox7ugQnAMfxCfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PS+G+3fE0edWLkupvvXhMBUwMhWIg/HRHlOH3Jard0A30ulMpRz7uTQYOFDW/um+dCWA160WxsTB4zcSt4diddsMTTScIp4ih31hEiQSNnuU6sDpRHZJfzuNQNpxln2ggy9LliXj4s9joqYj8pkfS5qOLp7mSo4vtuJzESrAp5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwW6/XG2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/08vOYW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jG3L147883
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bW7hurFHBkMVJEHuJgTkpaD0kO00VP7nzaajP+IP9SQ=; b=XwW6/XG2vIXEXkjF
	SvKwsdKwUQiSBz0Hfw4Q7KAT0DF+bf0qYMNkgomj9n6KpYDJOWTjxh6Yy3LN530y
	7S7SYuTlJ1AocYPGzYaf9l8U32ZmUn2lN6b/jSzfBOjZMm8zrQ3jmfPE4ky7mFiZ
	T0AlUccn5iEn8+qoY/aP1nJHVGvpVBYmqjNQAk/3otJRdr9e44TPcdYfnF95H41H
	yTb2QR1sueH4Mc5wTH843T8ClCK+fYcbV5PsMsFSvpPL0j4x0MncReJaMvlKyV76
	PuT2JJq0dv7JN1ic4gafb04oh642Q7CxZWk36w0K+g4cTv6SFjbsn+kQgA+SZqdX
	4XXHWA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp6ragfks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:39:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c536c9d2f7so546285a.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 01:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768383557; x=1768988357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bW7hurFHBkMVJEHuJgTkpaD0kO00VP7nzaajP+IP9SQ=;
        b=R/08vOYWQ0gkUCD2LXa1xsiLOedHFOGZKweP+X9WxARO/RoB52Vn0WiH3/Ske79SIe
         kP0z0Re8OKYfUANOcbky24MAzF1dzskZFQbpzneTLu2d/v2acpXL4OofVzscX/3B2k4S
         JQRM13rrYvzqJzSpvmEN9hGXboy8DWNQXhtMKGsi/agIjfnP0eqBQ7Q3U964OZIlW7uh
         H33DuaPcCOX2MR9SF12aRBvmetHEy7ueJx9qNSVGZtL7OtrZ9m5Yr9LMkcg8++GHqhD8
         XXzawPn0kjEL0GjiGqitgcGn15tu+kEAVf09PK8sdnWSjM6p5iUzsGW3xbH5YvhfUa8Z
         3E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383557; x=1768988357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bW7hurFHBkMVJEHuJgTkpaD0kO00VP7nzaajP+IP9SQ=;
        b=WG3lLzq/uBS3XwOmHtmAuRiU6iTBcwCm97lHENtuHttNFgAUrl4+Zvgo2MwVADZNgJ
         2VXRjFWDH8JaG7rP8VI5SyNgz6N8MEFmSMc/wcxQb65PhfYOf7kMOgMx3TmSeG9mHmRT
         veFtMb3mT7wvfWlIAdua4foIZxq8d1biUqdKRPdfEErvkHaomfXWMiYenE8+fGjYjvj3
         yDQVJ/QQmSOnA7RIMsmh3BB2jh3skunQTL/jehdAPIhOvM4FvK6jzEYUwXyJRFaCyX7z
         rt4keGGZx4nl6LGEZQmLhTpzCdKQKw0ahXWSAIOJ14sLkZhPjxednKOBh6PWun8zwl3k
         9BRg==
X-Forwarded-Encrypted: i=1; AJvYcCWdzA8pk4iq46ZNuEZEK6ZT72dkosgxn4ORIpVKZCZXKxQapP6fk8jKOiuqjJ/lxOVwMhjGSEFHeg11RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx88uGRMiVagRdwUDWyutX1XzR7aSuWgyG39P74mgf4jMfRgbhh
	WDDJg8Sbj9es1EfdMU1hKytlpiRdq/+tt5r+hZntjJQS8l8sMPL3gvCuKcERGLTnThlybQ6xRXc
	HvJ0N09+i/T2x+yquT+P2p/JddC3GFQRy3YSn+NKlJz22y7ABsViD/QcLlwPZXhMong==
X-Gm-Gg: AY/fxX6BGLy8x6Hhjyr+hLQ5HUCSEQkUp56jcX+MT24xPnEvzih/Q6OiuwZSSR+aAAI
	jZwyR/rV/kq3lyJFfn0rAJMPy58tx2n+z3h8+TNBh13eOznLt06TxIxWyzQr4jn9A4/ftksQRQo
	0kfB1r/fRzF++jBuF+i3BZtbJFfykx0xdcvonxKnN08tkPSW2k0KWCHH3eddPrEl9nbIDOLXzRv
	Sa7qmZL3DC+dQoYnD+xPy+6gn+uWtt8Ms0g2UyrN3zKHDX71TwnVRqJxKmC8tZvyfy5dkNtLRRy
	11OtlgrPir04wFi3SGV//a2Hp3aiJUkV4X/FutrPo5OogPPzmtjeTNclorbNP3WfEB11mxNpkqT
	K4f2qckLFh1PgNsIaZQhMfdiRPZnX4LRsC7RaxefmxW6tsTc1S4tbLcRUAWxUsSPXizQ=
X-Received: by 2002:a05:620a:7010:b0:8b2:9aba:e86e with SMTP id af79cd13be357-8c52fbeb24bmr205578885a.10.1768383557380;
        Wed, 14 Jan 2026 01:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:7010:b0:8b2:9aba:e86e with SMTP id af79cd13be357-8c52fbeb24bmr205577085a.10.1768383556843;
        Wed, 14 Jan 2026 01:39:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ebfd08b2sm1288984566b.25.2026.01.14.01.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:39:16 -0800 (PST)
Message-ID: <c64cd28b-58f6-4d91-a3c2-eb54effbe898@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:39:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] media: iris: don't specify min_acc_length in the
 source code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX9gNzbZ12aWrl
 gEzaOf58Yz1lRR35/QjApLSA31S11FcXTpFrg0KEteXvV3DTdrBoGu0psEV51DuWHO33jG8J9ab
 Qs8KaOfoHHtQSADxdxFgWs3lk7xpVWV+bEGub8H8nLi94zd0WXfUDK0EDsiunr4nHtvTYJoV4qL
 oqMDh+B6511JSdempo4WZzY4JmEOjDC2tzm63iA5tzmRgaL5Bf/jUXbq96s3MdXGyqxwSKek6oK
 8aeT0OjvB/Flp8S97j4eNbo82+0nXGTmNgN2AP9ftlei5G5dkdfVfX87hPnTQohq02DH0r0IJrH
 F+Ol9Q37J1PS/ppvLOi343PCW32qjuZ9EgAJyBli9t3T5wouRKgzv73euFhD2h1QBVS9RdyD7w6
 yc74DLGHwt2LYsOlDmMk8LfwmWNya3VakacV4SfxosLLVRgrYGmyBC89XaN5HL7j29TlTTO4FEW
 JkDoXOVTpRkVzQUmg2w==
X-Proofpoint-GUID: YB1HugVLlqmUA6Rd9PI77JlhJGBjrKg_
X-Proofpoint-ORIG-GUID: YB1HugVLlqmUA6Rd9PI77JlhJGBjrKg_
X-Authority-Analysis: v=2.4 cv=L/EQguT8 c=1 sm=1 tr=0 ts=69676446 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BAgg1nNj1X2pGIFylwwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140078

On 1/13/26 5:57 PM, Dmitry Baryshkov wrote:
> The min_acc length can be calculated from the platform UBWC
> configuration. Use the freshly introduced helper and calculate min_acc
> length based on the platform UBWC configuration instead of specifying it
> directly in the source.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


