Return-Path: <linux-media+bounces-33452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 994AEAC4DF6
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A2A8189E9B2
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 11:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8462A263C68;
	Tue, 27 May 2025 11:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4YuzMjN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6834819D07A
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 11:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347077; cv=none; b=lTiSpqoLAt5FjL8GURNxxFEEIinKZVmAr5zgDBL+YMEa04gamEiBmJoTp7Z696Ispd4Ec9qzYVjc+NhP+IUV8QBZUTSv8KWwsi09sIZOs/J3XfeUAkRyfU++cuWoKYvOvFyHBLKe/7AjVpmaA2YA87ckt9F6S8pX73eRzsknyUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347077; c=relaxed/simple;
	bh=iG7alVLRQPBLu2uFDKDhWTHeOCuXazt6XYy1LINh6nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlCECRkvA6ecW7LXp2v6T3awWEfKzxitm+Eh5tHj7Q8eeHr5HqpLjTMghmEWVrTXHmr2Bir6Ft7a0mmpGfiDhKz/x7fB6OCa/1fCjAkuwPmBQOkCfNWWxjkxiERiKEJJ8gD0UElCtM/NxL1IUjmrmTL5TuF97jvxA2yHXw5P7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4YuzMjN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9q4k0024094
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 11:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00npxAYXcDwJtuc+WcPd16KMqvA6u6AGGT1iIUkKzfU=; b=d4YuzMjNLkLL7Obv
	rM7H+uKqKDuoTIoO1SJatzsEv/fL6jUIPwgSmmy4WBUC57SXQg8kdnjeBbnPYg01
	kRN4x1Pw3Zf31u6Vzu0PG5S6ThQtHm0KCKuRlsbcOYUOIy0gsd0FVoVP+/Iur2Gv
	HK+fERjylqJsuHzUUnAER2/1G0XcBFM29E9qlvfesLfA4Db5TiQzoVCytd9OskmD
	HbIJj8oU4PLYASb6Z93sC9dTugL76flTyUikUTw91PDZcbw+CDMxcn6fEuIqci2F
	3AJHHr631utVLtXGEdKP6bO7i41vOcqbmwOfVjoX4PbaksQB3ljRkhs32TQ0r1Ut
	7KdffA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejxpnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 11:57:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-48f812db91aso11177011cf.0
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 04:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748347073; x=1748951873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00npxAYXcDwJtuc+WcPd16KMqvA6u6AGGT1iIUkKzfU=;
        b=gQBEkcdYyIjGg5AQUeiyGx/6Zvb70G8WUr3uGz2JT1HMkFgY6i4/W5bBdmQyVXlpNx
         lvoRge3LSQSd2L+pMI7mnJKxTBZK97Xg0RZZwlnL4NLh1bvmam+2W4P9yxioFKYI6OJ1
         WEIMBGoYLrbodUA501bV4HmLmv8PtD+uj9NK6+LwP0qQEx3rCFIAkWyTfNTqsC/IQhPZ
         zX7KGsbV8FfaWXHkNZ7Q81Z7wXuz5gnxE8ySY9LJLWgk6dEzPaSX/GJO3ZL65ughw4k4
         TeWywMk3vqzrAdHw9+BEyTBQf2buOGdTSZeRN8rvanpF0EfrBYsh0XuKX4ss5wlkWfG4
         v9mg==
X-Forwarded-Encrypted: i=1; AJvYcCU01WmiSM2a/OOuYwY1O4oczJswvqwLT+CU5/Mxn34iG/SsRFxQR5cSXHiLSK+RJ7QESVt92AHwNB7VPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmRC8fWYt9AeE18TOsfIcI6XLGab3OwWRHl+thI1PqkReZBnZG
	fqLXXm7BOFchG1SlcuIB4/u+o406ZHbb7HpE54QHqiGufGOmwciQLXOg798AcGFRYlo2g6y4hNu
	/9nf87gmTdmMH9tiC41X6cvElqDkEIX5NvBqF3Fpu+VsBaroU128b5N5sUqmoNOGCig==
X-Gm-Gg: ASbGnctmxb9Cu8BkctgnCxqWyCyc86R2qoKqqcnIUMmvC4ECq07gtQZOFJFjJdV9qFm
	iQSdcLYuG9rhzOUajZLV7vMJtOh2eB4J9wWzzX5OIznZePBgGIru/24wyrlN7cXKoLyLyrH+Q/K
	jnaMJeF30B2k3j9cfml90R9fagmvROxU7GDF1/MWpQCvFs4jLELRbnmeSErpVm9Xb5anmmaaHoI
	pqNMTrQgqimh8BrcmGoSls3hrJP5A7DrCRgH2vI/aS6YnW+zdceXZu1tTX/Mw4aks7Vv2+Ki30r
	3sIi0haCZxeM3aXYEHZJCSTLYICajn7wKuqX2iLPv4XHCBVc30zHQAidU3AzeJCeuw==
X-Received: by 2002:ac8:5f4c:0:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-49f47631130mr73699051cf.12.1748347073195;
        Tue, 27 May 2025 04:57:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER2zMsxig6MWdo0BnCzVG0WnNdmIBLmV4Ag489VTpniSStMzoJwJoKznpWShclgNRbJnN9eQ==
X-Received: by 2002:ac8:5f4c:0:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-49f47631130mr73698861cf.12.1748347072756;
        Tue, 27 May 2025 04:57:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5b192cb0asm1057955366b.170.2025.05.27.04.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:57:52 -0700 (PDT)
Message-ID: <c2ede70b-41e3-4009-baf7-afc6c2c65949@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:57:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] CAMSS support for MSM8939
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6835a8c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=G1DFoxIfSOwnDC_JHQgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-ORIG-GUID: wIbxboKVjaS2Qh-7bpM7mUwcMNkFv7lj
X-Proofpoint-GUID: wIbxboKVjaS2Qh-7bpM7mUwcMNkFv7lj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5NyBTYWx0ZWRfX1CenHbq3Ll63
 hfr2jsm4Tniw3Slez3AxLD0Hka1VgI2IPb3XCeeZ/p53wC1CTlBp+1dDx3lRWelBGHKfjMNkl5x
 YliJ0EuskNv6Wg1Q0vh3SZro+gq4ZUsjLPpc1hYsPrCfjBt0UTq3DPBat4I/XsTOLRvO4tTpU4z
 2gMfpIPGAnBgLchHjI8BR1HrW2hzVLmFwWrafqXsqpg9r5LORro3hodeeDriA2dnpSerxaUbWqI
 Hvl9dmGX6j8ryEZN+g7tWRn7mkNASbssZD/fkBTOMsPw/6eS6opLw21UpI2vaR6jPUGnJOoRY8a
 usIAuz9BoXivMW99B7gCA8nyNsmCSU3L19P0gPZnbPomMhp9AMITKYS0qiJFCbJZmCTlpMo95k1
 qMZk6wL7U0gPr7DchfydgVNrbqpWH6qKw+ckG0tAa9y9LFuFN3JCjqQ2Z0Y3sn/feY8rNFTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270097

On 5/25/25 9:25 PM, Vincent Knecht via B4 Relay wrote:
> This series adds CAMSS support for MSM8939.
> It's mostly identical to MSM8916, except for some clocks
> and an additional CSI.
> 
> To fix black stripes across sensor output, and garbage in
> CSID TPG output, 2 VFE VBIF register settings are needed.
> So the 1st patch adds helper functions to do just that.
> 
> Patch 1: adds helper for VFE VBIF settings
> Patch 2: adds CAMSS_8x39 version in CAMSS driver
> Patch 3: documents qcom,msm8939-camss DT bindings
> Patch 4: adds camss and cci in msm8939.dtsi
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Changes in v2:
> - Patch 1:
>   - Fix devm_platform_ioremap_resource_byname line to not end with
>     opening parenthesis (media-ci/1-checkpatch)
>   - Move camss-vfe-4-1.c handling of VBIF previously in patch 2 here
>     (Dmitry)
> - Patch 2:
>   - Declare regulators in PHY entries, not CSID ones (Bryan)
> - Patch 3: (bindings)
>   - Fix bindings checks for new errors (Rob)
>   - Fix properties ordering, code-style and example (Krzysztof)
>   - Sort reg-names, clock-names and interrupt-names alphanumerically (Bryan)
> - Patch 4: (dtsi)
>   - Move #address/#size cells before status (Konrad)
>   - Aligned CCI with msm8916, thus removing ispif_ahb mention (Konrad)
>     If "camss_ahb should be unnecessary", it's still required by qcom,i2c-cci.yaml

Give it a shot (with camss disabled so that the clock isn't on) - make
sure it's off and see if you can still access i2c.

If it turns out it's fine, we'll fix up the bindings instead

Konrad

