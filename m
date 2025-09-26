Return-Path: <linux-media+bounces-43243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECCDBA3737
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 13:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39E0A5612B2
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 11:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634462F549A;
	Fri, 26 Sep 2025 11:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uf1yVbey"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BD62F532D
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885081; cv=none; b=uqQwJvWHezdg80Zmiu95ZTwTygJIl4bLmKB7PZ29gSnwCnKDhdSVazfitpK7SnU8pwykXSFtVPp7uiU64qjcihm7mrbofwcvQ8+GLUAYlmKsSCZIE1s8NrJRjJxazkS0SEek3/SMC0eW8bCeBSQJZB9X+QFL43qg0XD2llSJsWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885081; c=relaxed/simple;
	bh=bd7ZArgSTg5qfKlLUuJm/pUJecTIN0Du5HvpI/TfbkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XC9NX9Fvshb2xQT/AquNa/TCfBQiJb6nL/xfBW1lSYIE/GfGb03JaErMnqTj5FUIgACgABVbX0pBfd7dlDRmItgIvUds2ULp71P9H8sHavsDd2lABcOL99Vq71g6yqs5errvKxRh6NocMq7N4ptoFQpfBVjcxdVnlQasDLDoh70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uf1yVbey; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vjD8028717
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 11:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcr2rWNKBvfZrpU/iwc0DmhTjy2JSdUVyzxuRzY6YNs=; b=Uf1yVbey8ngRiuVK
	aLs92R3ZGo8hOoMuxaAJSwEobWqi1Bc3XXX/EYAdXYWA3jsGuNfIMruBpJwkgWg0
	34GAQV9esXF+e1lqrohQXUQ14/J7vtwyQgzOWjMo0C8gUYTaEaq7oEKgexC6kjgM
	Lt1+tDaNH8ZGF/AZXNgDTsFTSDkygAsygk2KL1XG75r5p46T3flp4ziQ/HSXv+YJ
	uKGWWMwyKnjT2WHU50t2FZ0fqatKwQMPZqZzUthB+jxeD0HT4rNJe+1a1YeGab29
	bqjFHRdmaKS0J6BB+2PxNMbN0pAhGxgw1CccAjKyIf7alt2u7imEpRFYgYX0NMoU
	R2/vlQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q2kq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 11:11:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85e23ce41bdso54515285a.3
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 04:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758885077; x=1759489877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcr2rWNKBvfZrpU/iwc0DmhTjy2JSdUVyzxuRzY6YNs=;
        b=Lf0GQRPaeLNkI50HWL6iwYaP9sWtIXg/LA2c32v/uqA5GNWr9KDaXjs4RHhZYgskW1
         BKK7QLkuLNpFn0+LWH4Mlm461xHSZy3ZfbrxewgHBJzf8MW/X6ZGZu7m48NteITae3Md
         j0Cf+UQ2GCkcbe0Awu3IBbRKDC6PwGHZLgZFYwFC+gqnjje13HIuZeEf7l55ZYicKt5h
         8bRPmX4GqpIgTbe5Pk5HhH4MQbf24TM9/eQN33DASyzsSjUyG//dUe8PvcSx8o9izfW6
         D54wekD4YfPxliT26lk1lbNzUYBm/sD8BJjkdQDxMw7eglpE6ICeVhAUz8MbANgf7qJb
         QRxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD6WA6cxceHHP8FxTvsQMAwpGnHzGMWQn9YX86kMRnQD+9BLIJeWJyh/X1/PGAEhHQe+R35M+8zCkB/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ2bwtk3+0LXvqLvQdRcxGea4Hy+Q6mZDT5pOiLfNz8dNr5BCw
	WB9GaPwpzz9ik0bbMjbvjgTh345tisC264Z9N/MKpDzrwjgYSBFFeGLwDt8wUoFDHmZNSYn9TpH
	JhRLQIkbwAcF6pCtyNtkNahOPLtgmrphRKqAJVBbubrseWyW0mByWUWywEUsFwqRrgw==
X-Gm-Gg: ASbGncuXAJ5H5t6MEJ/1Aqf8VrHxsBsLVWnLBLjubnXBHtNsy9yf0eawdWNyam8tQ+c
	Rm4nZRa4wRnTmdZG+FM2vIMENw4lOea3RJQDPMnTIQxJiCEcWyw+g6vQE1w8viM9fnGARwf8TWD
	b0rBmwGizfy8C1GCgcmBPBOIAcXGxjUKuNJZNF5umPplgKOHJDQzLm3R7cnIYOJCu7rtMUTZWW4
	gl/gd4Cg8LyN9ZNCRYyQ4wvJoOf6CPAUHmrH7y8dtjr7ETNpLfNC7+jB3fxAJhn1djPm9ZRvLMD
	soEXCe8sSJ94wugkjNCt/8rIUL4ZzwGS89wihazaKUQoMEmtuSSeNGi/ebrkHykTM45+S53m6wF
	nwbJEY7dpDrCb0Gg5RfCJdw==
X-Received: by 2002:a05:6214:2aaa:b0:78d:d2a3:e170 with SMTP id 6a1803df08f44-7fc417aeb77mr75977686d6.5.1758885076788;
        Fri, 26 Sep 2025 04:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUncsz0oUwgZKiYxfzRIDd0uKhIPnoKttRfCdalmtC0fYaRM319M9md1ZwC5GW5vK/9VMu9w==
X-Received: by 2002:a05:6214:2aaa:b0:78d:d2a3:e170 with SMTP id 6a1803df08f44-7fc417aeb77mr75977466d6.5.1758885076416;
        Fri, 26 Sep 2025 04:11:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae3080sm2768826a12.34.2025.09.26.04.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:11:15 -0700 (PDT)
Message-ID: <4fa73f32-c3b4-4dd2-941e-ec68eef0bfbf@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:11:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb2210-rb1: Add overlay for
 vision mezzanine
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <20250926073421.17408-4-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926073421.17408-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7JTFZNrf0cCe
 oLxl8t3Ii+wfBOY52afGFNRlLwyfZ2gKkDTRtc3ssiTiOMFiDGmF8SZZmaxjjA9ZxpnPp7pq5Ob
 hP4z1mC+IQnSmHiRbxizUIW5fXOkCuY+mq6BZ7QLRdE338yRb3NdDuLD3FEKvMytcT5bgsczC00
 VIvsOM0v09Ry5K3h74r13U6Sum4ihPsOfxDuFGzRzLimiyZLm9dA4L6XNeKhV4zOgfnn2v5claS
 vZ2Kioe06CldvPfsurso2GCPwRkUprv8brBh0FpkE0lOuM+cgszdOqyq0BhkKLE2pAh9SlBKeSR
 8smUTaV1D8sO3MFgWx8lSS319+3zH3VDt0dXpFYkYfshSyaAF5GWwE54dNqx8txa606UKMSHGv0
 fa3eXVJ+54mxmTX49GkD+Tf1LXKRsA==
X-Proofpoint-GUID: 50-RGfy2edIAaQtNc3dUgcQZf5YAAvo8
X-Proofpoint-ORIG-GUID: 50-RGfy2edIAaQtNc3dUgcQZf5YAAvo8
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d674d6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=O5mpf8q3-rr5ASy-kiYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/26/25 9:34 AM, Loic Poulain wrote:
> This initial version includes support for OV9282 camera sensor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */
> +	camera@60 {
> +		compatible = "ovti,ov9282";
> +		reg = <0x60>;
> +
> +		/* Note: Reset is active-low but ov9282 driver logic is inverted... */

The comment no longer applies

with it gone:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

