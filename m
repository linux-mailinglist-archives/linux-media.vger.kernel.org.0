Return-Path: <linux-media+bounces-31075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E8FA9CF7A
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 19:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A2FA188305D
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 17:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060041F9F47;
	Fri, 25 Apr 2025 17:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxYRUDos"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0441F76A8
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745601986; cv=none; b=bUZXFGW0+tH80DBccdx4qBj4ZssyXnCdeCmWKvjCCtGiD2XqwJXafF3yAZDSnIa4drsx8uc6P6DTmq5sGIiD3FLPO106e/t9ZcEi9LW8i0dY5oiztzxShk7hLgacWlsY5sBCL5gEVmhuVzVIC+DVrhBggv/MM2IJfdScUrVtt7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745601986; c=relaxed/simple;
	bh=8hg558yANT2sc+YTep6wfK5k68FYbDUsk2+ub2VNI3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kk8QN5YfUdISNG74XgXOTH5voUgYXDxwYvNLdmdXGYWeJMM3ZTu8mDDrNGRUiupaK1IwnYWDl0ZHTNg2+B4KDxpIjHz2/xNNkr9VAf8BvBcIyv0ck8w8UNTZPUo9lMkIQ9UUuzB0JcUiMIwuMZKUoEBW07vYoWnoQOcHH/vws3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxYRUDos; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKFmo008962
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 17:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5epQh/flHpVh8dT3+VnITaav
	y9i6eZEZFyRfGUTfpqs=; b=dxYRUDosRFUFA9B/unpg6slaZNQC2s7SJf4A9a7t
	0X6SVESP3MXxLG55zeRX7HuZtNfyE6muo1M5O5hxEiz6SYNLxJ5I15o7OwvqYaqI
	M9bUejR6aFqqWgC9Qq8mv1KVkF2YBl1EepZ4XdcJCnygAwwBMCEB+MI0/3QlFQkb
	udyo6jW1qc6SVjnQzWx65XerwZP9WcTXn/CkRVpxk64JzGz1PhDdFTRBiwaMr+kI
	++0rcGBPym1XxBVIojKC4BJvCWfJ3gDdPDvNsDiRiAzFATOcTiwXjFkfRSMw/5Yk
	Gv3wEw3aBdxTRmPlDdQjqoAe1tM+HEUpjLKUI7UGUnYwfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2hvvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 17:26:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so451708785a.0
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 10:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745601982; x=1746206782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5epQh/flHpVh8dT3+VnITaavy9i6eZEZFyRfGUTfpqs=;
        b=bBnxUwWw1VcxFpJ94BDdxww0VWN+GRc3M3mhdircHM5hmLAGWVqX9wS3M5jH7d1s3z
         NodqmpotwusDrv1E9cd3yhu9N3xl6jZq3X5odnYcvkDaPyELof6+3JFzQIfola1S5qX5
         yi6oDjSIGBVX3IARLHurcOcRqdg55ZhRJl3y+sUBUfth5/jDFM4SOwIEX52aUlg0nwuh
         CwDHTZ8tqQw9uF85xMOpTJFh1dVEBaYFMCs7aDDjNasIKZv0HSbWVrPCEHBYbHSlve6R
         JVuy55ZEZhFo7AdYfjcWAOmixXoNQxI1+7tW3We9rkxpmaXa7Ff/ApgUEDszA/2ZqZuC
         pTUg==
X-Forwarded-Encrypted: i=1; AJvYcCXcm5XqqShexj3DKyGrwBTaasxJ/WHvnexp/VJ77y4vE20/Pi8ifztLcLANRys1Gu8vzs9jqgzi5sxyVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLhRChDAq2RNsl0DqmeCpt8m7bg/pDf85reDhmx42yk0gITcqO
	ym2snZsh9mAfAdKdGA8W6SV0g3Z8j6brjZPDgMrdP6X9c4aHfCzlAhSJT79iqLHrSUF58W2Gc29
	q1565BUl1pSO+Yn3mXftgbAkcbIwsh3M1ZOjFDRYZIQomXavWPKvT2cCFfuVJcg==
X-Gm-Gg: ASbGncvXmVFEJUWOCKuAVwD+KnoAres/jMVwNrB4fEUezYSIOhTgBk2HNa/xV3OFnMI
	CaJk9/2mQx74/4imBLS7Y90MO4eQ412YNfEoc7vLWEFHKQj3UpaR2VGknMCgXTIL7dmlrxixtwz
	LxEqUDWMgrGVkR6bF9rh4HCUt5h4vfXZL5oGutKbGKSftx7eqa8XagabUwVozktdipzKbFFX7u4
	1hibiI2X0otyLvinKlUdejcdXvrOrJpn6wkkS6IOcAUuYa1o78UcoteBRIbI/tfTQ+4Jb1YggCZ
	ZV9UiKAS3suD4nQsl5EssjAwOjcoJWGNCQTgz7am8U+g69ent2qPfO7gfLCaCbGFZVbWjp2PYHA
	=
X-Received: by 2002:a05:620a:294d:b0:7b6:d7be:2e4 with SMTP id af79cd13be357-7c958659f26mr1134337085a.26.1745601982668;
        Fri, 25 Apr 2025 10:26:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpT2LmKJlaY/z7qsyXSWdk47538nPobMnHSAFaz8q08N8ny0p0lgp7K4A5R/f9gHoDn7zjyQ==
X-Received: by 2002:a05:620a:294d:b0:7b6:d7be:2e4 with SMTP id af79cd13be357-7c958659f26mr1134332885a.26.1745601982311;
        Fri, 25 Apr 2025 10:26:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb481ecsm8114181fa.31.2025.04.25.10.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:26:21 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:26:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, krzk@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,x1e80100-camss: Fixup
 csiphy supply names
Message-ID: <z7rklnxuuqnimmc64vcc2b77n6ohdqznek2yxxlmfljvnkqk4c@4dfzdeb2x2ha>
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
 <20250425-b4-media-committers-25-04-25-camss-supplies-v2-1-8c12450b2934@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-1-8c12450b2934@linaro.org>
X-Proofpoint-GUID: MxJXydlC2a0GqeFvw-YmXMcKItkg-bSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfXxs1qDOhT/OFZ /LJpVpN2W6NWBhhPouKf+CHq1xbic9JXL+p2IWlwta+rVuBTWvoKXIWwFyXpVjnOEWWMT0wyPyS 320cjDGpDINHeJIYdBdON5rOPiJD6Xd+1M4jpHBEntczmAeNk81RjpwueIx1Pv+X0o0RsAeJ4oP
 iK7nFxt/7/KtwjEZ1FuWxJIORQzu9XvKej3U6nHBlLIqBZsQisw4AnkgPppAxDMKSDsrXHZ3+mz u+kNAuEk9sQrwpMGJ3qKNqSn/nRyI8RD5CUuswqDsq95pKGOWenCYs0g1hyBDzw3uh+7i9Q68mQ benxUpwNY/SbJZxUEE6FfQL5d31CV4IoPzQo1E6c9Q+2fuJGEo/C+ihxvTqykWGvGbILnnnlf3r
 CEZwxLRHs4y1ygMTYaZTIBC6OQ4NduKw7+h/z0NkBfWJC7bJGJwg+JtvP0wZZ3eAR5gRO0FW
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680bc5c0 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VqMsr5fPH0kPJOHiwU8A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MxJXydlC2a0GqeFvw-YmXMcKItkg-bSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 04:17:33PM +0100, Bryan O'Donoghue wrote:
> Declare a CSIPHY regulator pair 0p8 and 1p2 for each CSIPHY.
> 
> Name the inputs based on the voltage so as to have a consistent naming of
> these rails across SoCs and PCBs.
> 
> There are no upstream users of this yaml definition yet so this change is
> safe to make.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 52 +++++++++++++++++-----
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 113565cf2a991a8dcbc20889090e177e8bcadaac..dc7c1a9394c3b547f5e0885bf501ed42dfbeba88 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -118,14 +118,6 @@ properties:
>        - const: ife1
>        - const: top
>  
> -  vdd-csiphy-0p8-supply:
> -    description:
> -      Phandle to a 0.8V regulator supply to a PHY.
> -
> -  vdd-csiphy-1p2-supply:
> -    description:
> -      Phandle to 1.8V regulator supply to a PHY.
> -
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -157,6 +149,30 @@ properties:
>                - clock-lanes
>                - data-lanes
>  
> +  vdd-csiphy0-0p8-supply:
> +    description: Phandle to a 0.8V regulator supply to csiphy0.
> +
> +  vdd-csiphy0-1p2-supply:
> +    description: Phandle to a 1.2V regulator supply to csiphy0.
> +
> +  vdd-csiphy1-0p8-supply:
> +    description: Phandle to a 0.8V regulator supply to csiphy1.
> +
> +  vdd-csiphy1-1p2-supply:
> +    description: Phandle to a 1.2V regulator supply to csiphy1.
> +
> +  vdd-csiphy2-0p8-supply:
> +    description: Phandle to a 0.8V regulator supply to csiphy2.
> +
> +  vdd-csiphy2-1p2-supply:
> +    description: Phandle to a 1.2V regulator supply to csiphy2.
> +
> +  vdd-csiphy4-0p8-supply:
> +    description: Phandle to a 0.8V regulator supply to csiphy4.
> +
> +  vdd-csiphy4-1p2-supply:
> +    description: Phandle to a 1.2V regulator supply to csiphy4.

My preference is still for the platform-specific supply names which can
be correlated to the actual SoC pins.

> +
>  required:
>    - compatible
>    - reg

-- 
With best wishes
Dmitry

