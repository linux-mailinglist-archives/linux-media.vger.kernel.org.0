Return-Path: <linux-media+bounces-43831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF1BC10AD
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 12:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA6DD3E0412
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 10:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4992D2D877C;
	Tue,  7 Oct 2025 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7bOiguQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C18C2D838C
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759833858; cv=none; b=W/5dwl0kF0aubyBUzwl0CtL2Zr1I4bfW8v5NMcbu+nlper+dQJsTyyCu7P2bxI5mf+jB8floHaz5yaJlkTLxspCUf0Fz0WSYADqW9eO6T2gPu+uezrISQSb+fUpx6I8V7cdEM5t2gYjvcWRgnDwAl7RWhawL/5u/TXZ9UIHh7fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759833858; c=relaxed/simple;
	bh=tEzTFYsfmTotpGOcroEfG2QRzOXRVRs9LS7dQ7SLeaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3uOOay3Rhc+2bSA6reo4RAD/Xi8rt13Cdnof5/Eb2tJg5wKR1BbyJUS4fx6utUFrNJy2pWzgcElQo89sGuemDgL2tqXq7Xyco6fvTZp6GlJ/u69bc6tA/DipX61uf/ARmT4Wv3/Z9zQ7fJU1P9wYyvysjs/jyikmU/addcQ14g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7bOiguQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5974JDPJ026646
	for <linux-media@vger.kernel.org>; Tue, 7 Oct 2025 10:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEzTFYsfmTotpGOcroEfG2QRzOXRVRs9LS7dQ7SLeaA=; b=O7bOiguQpSnuPcwT
	avAAPUKB/lvfpUOQ2TLKv8IPlELrvfmQwS1DhcamUu317pX13KA8bujbt0GgU3o3
	ue5Tw7uQxpuxZIyTVYHziWkkl212aN5X900YwTEGDPKjZy+ydMtm/duHyRb5yluk
	KR4WWFLrhBa4yZeUzAh2117seG4+I2tY6c/2b/njJ7u7X+8iCuBiRbbdem3uiwoL
	QPImyEimeTAcLGSY0e2Rfpx04A8Tu4HSo1QpGZhg81LE7WnS5hZHyJLW8wRPWnnR
	CehReSTJ2S6dvU89aDUCze9zMMpxBzYCV+qrtd7l4BDN6kIGksWHyHYeCpy7t/Mx
	y6E6Qw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0jnt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 10:44:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e6d173e2a2so5678811cf.2
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 03:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759833853; x=1760438653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tEzTFYsfmTotpGOcroEfG2QRzOXRVRs9LS7dQ7SLeaA=;
        b=CCgnY6CGUCPg5sCKSZuMrqX4J8Ea9csKBe5Jr7lOvwOhiOG/p0JV0Z76zrxqCpVnaa
         IQmnngyeKKv+KuMVKhWzAUSM814ZuxpaBx6+L8oGzfWjvXbdw+9jOh/9iE9gaD2Z15wk
         SsNDWHu+qnOhrmKAjp1z54XAU1YCkvL622THTzA2KkXqtm7em+My7ws1eCyrZTO656dN
         ZDlfiofR8R8d+2pJ6vN7j0npjaO0nwtKsTNdJMjNVZlX0zkUFOGeNAqOxbG5g2SpuseH
         8Jm2QmfMRDiRehGFTqNAVB2WFqRfkUkUSzavFs9q872oOasSL6lsn2ByZro6hLXqFD38
         lqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCHvgODUv2Ews84HlG5/o4UBuCF50dsdHAAfxtinMMKk/NvfUdkLfcS3YPtrjza1HU0lVhCWsqktutkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9n0SoWexIqAKXhknb4D8tgk4dT33PSPB2av9uhCyuypmVT7XD
	BNc2+CL2bTk5vnfzv2QfeqWMZZLYQY8x9XL5aaySdHegIGogStniDBl+7RPDMFES0cGzaGlvS9W
	+X6O9Jv5DcWpX0gIBH80Mn9lU214ArN+9icwnT/g1xCxpA0KcMLa3GWSrx9tKgo5Ixw==
X-Gm-Gg: ASbGncu/sT0CMPHNu/+mQeqnDUjzqdSrSDAAID58sl9Zk9pH29FztEUc4EobSJqJSfR
	OgyxtdN2Qh6P58jUynzepqD0m0pk0kHTkCQA4+D/JYxjXpFShL5hS+v4w/4W4iSfKQtjdgrimEW
	5y5fHtJva1cP4+bMjwhUt7uIjkjmIVP7d7sC29Z9A0l/+3JX0PtS8XrBsU0CRZgCm/CbrJIVqdK
	aLJdUot+dhOqXemAl5kvt5a4kUFjMEK42Icy9vHKB4vukDHXKIh9M6KVt7amTMo2JcCwVHcDmZl
	klJ8OOcn7PZQ1q0eENkNIDrMqpoXb/3F21K2G1yeilH96TV4Ee/FcsdN2C/Rb0j6bkLpPXSOFfq
	hQgTY1RFOUM9BZP5bQlloBXyHEOs=
X-Received: by 2002:a05:622a:10b:b0:4e0:3af:4e0e with SMTP id d75a77b69052e-4e576a82652mr142747771cf.5.1759833852828;
        Tue, 07 Oct 2025 03:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI56qcfMK4RSe4I5X9MhtuGJ6Iji7nF6p10dptreUulKjL5MYxLr5itidFjejQHJIj6jD+WA==
X-Received: by 2002:a05:622a:10b:b0:4e0:3af:4e0e with SMTP id d75a77b69052e-4e576a82652mr142747461cf.5.1759833852225;
        Tue, 07 Oct 2025 03:44:12 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378811236csm12103474a12.42.2025.10.07.03.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:44:11 -0700 (PDT)
Message-ID: <0b7e71eb-1143-412e-a76e-b6f146cb60ed@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:44:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: qcom: camss: Add support for TPG common
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com>
 <20250925-camss_tpg-v4-1-d2eb099902c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-camss_tpg-v4-1-d2eb099902c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OVLC0QNY3-9fvrs_FG3Ac65BzH5ZGZrd
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e4eefd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=IOTsWFhAVgjdDaEP6ccA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: OVLC0QNY3-9fvrs_FG3Ac65BzH5ZGZrd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfXx2kCDTPS0Vk3
 crP+5PEkVfzLHC069AU68sroU6OXW1AVeTuyRxsb4QZItIq8Sm+lgpsyubixGz1d8JKG0O/HiGR
 ovI45yiM2oegw3eeGzG10+RJ5LcF66u+ksXjyM+eBCAY8rBmqFT1o4vfoBrPzopkY007p9+CHQ9
 mVaymzszzUfiqxenOxU2/FoEXkCJx1qmU6r+zGcFOlpdsaKbZCq3UEHfTIvjjTfRVMe3JKQbhl2
 wOk5AwRnIKAtkF8asGfJQW+ecUVtHSHMhsU5/rJ3c9bsPVPloOSkiJAPvA+Ch6YikrMX2AASwqR
 CPgW6w1do0I57IbJU8hzj6YIQ6JGJHhy+GZeev26M1JXhJb0Z4ujqZm5uWANkN4D10wCqOnA55k
 sUA2kHb4ZEx/iM2xi9n9UALfvWtDTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 9/25/25 2:31 AM, Wenmeng Liu wrote:
> Add support for TPG common, unlike CSID TPG, this TPG can

Is "TPG common" the actual name of the IP?

Konrad

