Return-Path: <linux-media+bounces-41669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E22DB41EA0
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D10C17BFD9
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C082D063D;
	Wed,  3 Sep 2025 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jy5pIQk0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20AA26FA4B
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901797; cv=none; b=XhUpKrCLSuNKZeLEdIBqrOyG6w733GKuH7ypXzn7/z90igora95W2xmTiMzw8irWlQ4zLNGIi/qgrl2PUCE1l1i+DLqvVcnxf4F3jgVg8z/0HLJfMabe4nMng86h9LMiMkP6IAfWSs2A2yWJ1k0WQ6aM9OtcLjHRktU88XFL+xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901797; c=relaxed/simple;
	bh=cC0aiuuE0E+2DpdlvkGHD3ARHOLa7nVcin05l3IEh7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twkXGDbnIeU8FkIGz00iw4itmGXdlbSMBElH81THmar+uUrLiRnDwYS0CHqyZAv28lUb6FCV/FuUZWSJr/YoqlaC2JJQDpp3IBR9X5zKiukJsXVqksdHNrrWKqA4fa7pXItIaa8ftUYNn7p7tfOGMAvBGgbdkRVLh8Pv+zalzs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jy5pIQk0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BFIX7023837
	for <linux-media@vger.kernel.org>; Wed, 3 Sep 2025 12:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vn4mwhUMj9kw47ypZhCXah1sPzLur+fBXwYhZMjbZk=; b=jy5pIQk0rhPvXaY+
	cCha0zTkTY+5Qr19y0ccl/29FzoPuVV2vfq0FxWpzPg1KNH2fP728pAB5ctzTq02
	Vd2QqOSZw+OyxcGv9oXyvBuqS5jEBMx7mPQFRT6WfgECu2n/Gr/LQ3l2XJCO8APB
	lPxljbQDVVnLf1c/6VBvlZFk9fEdXJ3qGKGsGXvaKSFeMCPgZguN3UDaWih7EdT7
	ndTQqdUgquq43MAd/dErWh4lxVji4a9Xeu6iazj1z/QLEvBJIyeWms1enFwFmjpl
	bUR8jspl2hiz0wxIyLTfnVjgvmcp1ujUpxAQTORNakBhdZHnChVZ+Ey7379aYUXk
	vxKe+w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fkfqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 12:16:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9f531bb5so11164056d6.2
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 05:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901793; x=1757506593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vn4mwhUMj9kw47ypZhCXah1sPzLur+fBXwYhZMjbZk=;
        b=LayI/lBPbFnYLqJ45Qczr/0UErPLK5EqLhgdqWhznTcM+ZAmNSTgCZGkxQCNeCnwox
         q9MkBlXdpHrlNWv1vsPlSVWKLeT0+Fk/6B6L84juZJRRZMGgaUADZ3U8bFM7m53SXDHp
         Z0GQEr7SNbZ03teybZVa6bISTf3QWjmhl0LiqAwvtbICzO0xQUTM69s6xzUFUc4etw3U
         gsFqLyXNOQz/NlX4nCZSs2zQ6x6SuZpwWONElwXGc8BNABhlJVc5I19bl8p6fGkerZgz
         P03q6FvkvC73XyehNwkTnKg8LJZ5uYtYaYwbC8CCKDOMdbBI9opyGli3BUgXvsNMlD7v
         Yiiw==
X-Forwarded-Encrypted: i=1; AJvYcCXnnM9MkmFYCPxoH5FblSnrPlUER1AVXCPd31ZjfiJzj4Dcb0gII7QYSlVEPp7le4X+HI0Fk9RaW8m/pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVTaO7jnoXjYtHaCy6DDAEjUaqCc0qaG5Dtr3TytyLDRssZzGP
	3p1AINvq1WpgL4i7mKyofqd9Q+zsXl+SCHi1YYjE7vjtPDGI9AwwaAJXhpi2Qup3AblpXTuTxgn
	dXJ1Myo92+/cWJeqMlRH6P3uALHJ4bBoRrmP2iNZIPdaF1oLzMyOa2raaqTUiZuh4qA==
X-Gm-Gg: ASbGncuuexv19KNzj9L4a7i313abYuHySX5Uf0UmLinWNBEB06z8QLTJLn1yv+GEKE+
	JubnQHJx+tjA2ICrlcG3i9ogAzqKqL543mOJ1L0z4FCP8BQfD6akq6XSG9Cdn5yAGw/jwes9sTR
	NDv7S/NVDClQGdhnaWmnR8wyke8zRM1wZGMtBj2CLvJ0Mwu1xYuvT0Zb1gSbneEnD1W05E5Yyf2
	ZzpWTnCw+n83taou8N0/84bPYXjr79hTlEtQehqgS8JsJ6QVpc56dOwoI/h6cMHm4sfzHBq+kOX
	l8k48fY9Z9oexomPVFd7XE1dlncBDpcXmKdqKuNxo1Yeafo0IzjlliogE1qlkiJ3X0W/EPFL6eE
	z2FMEPxLS3/o9nIdP7FJORA==
X-Received: by 2002:a05:6214:509c:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-70fa1dada4emr132004976d6.3.1756901793458;
        Wed, 03 Sep 2025 05:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsHxz+3HO2KA7aO0WYCcwzAJIdCm+RcRd6sRVZbTR8qPcb7vM9trhlNh+9aPhNhIf6qPjJxQ==
X-Received: by 2002:a05:6214:509c:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-70fa1dada4emr132004686d6.3.1756901792919;
        Wed, 03 Sep 2025 05:16:32 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7ed1sm12115926a12.1.2025.09.03.05.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 05:16:32 -0700 (PDT)
Message-ID: <d40c5ab2-2195-462f-9fd4-8c519a43f032@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 14:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: qcom: camss: tpg: Add TPG support for
 SA8775P and QCS8300
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com>
 <20250822-camss_tpg-v3-3-c7833a5f10d0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822-camss_tpg-v3-3-c7833a5f10d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX6kpK8A7s4YP9
 dc7fEzcxwgEIXKJVbQ2KDCzyoQWfVTxwAvFI7wYlh6zQ6+Sa4CULt75LRLdnaHYd/1u4tWuWZh8
 paFWdWD3qEgStzRy5WgXF8chDyug+kOiWm8pt+5nsaMscCQ8qStf09RAH7klrC4lB6NHCCDSNPg
 qklXU8BKP3Ese9lNUlE6jSI9rBula1vIhUzWNEBcAdl5sb2bkln8Hk4L1D0MfB1IX5td52ShbLV
 WHz1G2k7cfCKBQMd01mxd+fVGc5uivKWA2F+SKHj4ZRhBZAk5AN1DItDUa1CgNUSAnRkl2AnJYt
 HM4ZWyM43kSpcLKT9/FS36PBmHVNRwIey0q1fCd0hfEvHL9oJ8dK3wetaLN73669xmJlkeX93UR
 x95UUeO1
X-Proofpoint-ORIG-GUID: nV7IJAGkta3UDx9Zsha5F38M1yugAnFc
X-Proofpoint-GUID: nV7IJAGkta3UDx9Zsha5F38M1yugAnFc
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b831a2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=McB9vphyiCVPsmp0I2cA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 8/22/25 2:09 PM, Wenmeng Liu wrote:
> Add support for TPG found on SA8775P and QCS8300.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +#define TPG_HW_VERSION		0x0
> +#define		HW_VERSION_STEPPING		0
> +#define		HW_VERSION_REVISION		16
> +#define		HW_VERSION_GENERATION		28

Please use GENMASK for defining bitfields, avoid tabs (just a space
is fine, perhaps add one in front of #define to denote bitfields) and
use FIELD_PREP/FIELD_GET accessors

Konrad

