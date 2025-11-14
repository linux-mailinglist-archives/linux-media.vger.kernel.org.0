Return-Path: <linux-media+bounces-47154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EA1C5F797
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 23:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E63074E33D5
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 22:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B973054DB;
	Fri, 14 Nov 2025 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GU4vT8DH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYqCZNcG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A367303A3B
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 22:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763158150; cv=none; b=LTgyLdEMY5BQUp2fL+BUDjKctHfbJPpIF+NzpE9eDwAwjp7Gjnb+lwtBPIt7JsdapMb/guoOj1iKRl/kzs0HZZhvgZEbl/Z03YTd4+wic2ZSFQ+a8vAT51rLKU07uLflOwpwxfpDY8QNj70Bg44X99qHEJgPPG5bKfjjk25SxTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763158150; c=relaxed/simple;
	bh=iPSh74YU5xiboqFUfUJ0apAdLhJxZLeLZX1ZnN1flkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jga+iCqBICqqN9UcopB5xP6iIID5WYFp0pdtZfkRqOddSNyo5ZgL/sP2W91dJ0BN3HzPJiZgAyCt8uKY0XS0MwcINb+GDigm/naix7FrAAn+PUS4/K5smXz9SKZug2zjX/9M+4d7JTDFnqO/8YeVPDlUZQDV5+NPe2X8LC7ovlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GU4vT8DH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYqCZNcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEKrwRk295866
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 22:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIKkYwkmyZfinGLwUUslF9zDFyK5LvHr7MjMbKaAM2w=; b=GU4vT8DHyVKRpqp4
	QjZvVFP4a4/k6E0xA/+fKIvziTwyVf/gGIwfLbGUvAIERvWvjKUXqYGEayA2//TN
	M4uVvYEyEUPJUweSBnmy56B7Vd8E5dYWETlhJhEfMX319eLG0rhK7KP3mhBPGfzZ
	l1WVLSXxhJLd14bqGHTX5yEs3CFTsndfMUz8pqwXtSW1+OOMqDudLyqSKx4GejXH
	h268tXjRT/3Dfi7TZRE5SV56KGMnBiRn58kq1BFqwfhw6ghGLGuwdiovbXtXg7Ct
	e5HZNF9N3LRilWhCG8N16cQkAbCfAmEHzZzWcZbLoR/3ctk0dvSqfqjGm/5LyDfM
	iw/u9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aebuyr7mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 22:09:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaa289e0dso9116901cf.3
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 14:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763158147; x=1763762947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIKkYwkmyZfinGLwUUslF9zDFyK5LvHr7MjMbKaAM2w=;
        b=OYqCZNcGw2hKGTkndYW93G+EkrFsc/tJazBtDW903brWn2L37vbSa+ErdtAemYXHNG
         kgeLKVAcak2XKT8Rp7gr8lBLSLUDJNiLiQGDoD7zhzyzz0IivPKJ15Fb1w3nwv1ioWHT
         sKlz9yzInf+Nb3n3rzdNs/4Qut254rsVvf+5pPHNOFVjou2vx9BvDXGXBNTMGVT6pPrj
         ZgoV/osNVC3lmxcIRw5+ZfxKHKPKdVHzUU6SB4O9i+ALB4jf+l4xhICFAnOfuCYvzXTA
         usQ3wq4ia2OzHCaAzUWFFtdxY1QKdZDyz8YENTxnFYwHyyncACSKthtgN0DWLIWtKKIA
         QMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763158147; x=1763762947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIKkYwkmyZfinGLwUUslF9zDFyK5LvHr7MjMbKaAM2w=;
        b=sxcd1BKxgo/cKOo+e3abCFJWUkZMrRyOLTy9gb565D5AOwwX+0V2xO7GrbWmvBHVq3
         xIoo3OVeaYJv9ftJz78GMNUgIJUQ+2wyMnRWwoU1ml1OxY1ObaQKWXydNt+/OhC+Ikjn
         RMWwyihWIHYB3SulWWEgXO3Snzjnf/IFzk6ZcdR1fqFfNdLlTKEyv467xQn1qwgCrRIJ
         9om7lljd3l96wgcz7wlIqJ1xlojEpRKDqsUzO5jX0BLbhR6Z6/z1ep9Tu+rQ9oFExMpg
         oLw3vVV1sAUI5kA7PPWU0AGg2+SST1i4XVW+yTtx1v5IOi5NFVrFFOe3D6676WSqJmXR
         p3zg==
X-Forwarded-Encrypted: i=1; AJvYcCXMDHdV06wUpMqDG0Lx0SPFa9Jsu/BVsw93QOlHSKSQbAkPwTkR00quc40H9YhLcvDj4iPytuyRTvSCgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS419zQEipBWy56d3tWe2zTHN9d4JRKKvpIhUwkQ5Dq/8DH4YZ
	gNmHkMnr+xICly6ScwWJtNIPdVVsjTig9mdZlEHUkKvvP2NNyGMBm1xtggyzu8p6v4Y21MpqVcT
	BKLCKDo6Ci/PB2pwSVYFCLYpM/w3jxP6oHMH9cHD1fSQNjLmC9bjgmrK3LY7TdwDS5w==
X-Gm-Gg: ASbGnctPp2qglTdK1cbcVYwC2mWaZfI1RNbOFXDbFLqx/eiSRVb+ET/uA1tH8vEIZ6y
	V4Qjaxo6r+FWAc4qikOu2DOQIDSW14aiCsUiNMvh2iufw+y1lMB9AtqseU8Q7moqnKwzOnkx8+T
	f/HKmShsnqQvA4zwTryW6dO4wa0kE+DArz+nHDPif63lQ4BTmhWmcU865uv/LstnDgXR7OPTJJ6
	FE2Z02cnFfj09ZKKJ0+9iW4VHE8OoMHjOi23nW5pjn8sAokWGOAfbzZySBywCfLjSnKJP5XIwp4
	CWo2QZetGWWpwrNEuK938hBhHX+mizsXFW5PJDB6n6630I2zwhUjVKhdVpSmSZhr3kgwZ/5ZHIg
	aZ2Y3Dj8+BNNlWN7glOPlpycM4J5XgGIdyphgALESjKt6o/PLFzYQtGKs
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr43928351cf.8.1763158147118;
        Fri, 14 Nov 2025 14:09:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ3lhrzuy4JyzwvIwqTZ6/6GXL03D2BYdDOgndLmL+2Dwt9jORtRlqVlvPuSyThbnEBKHiqA==
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr43927941cf.8.1763158146676;
        Fri, 14 Nov 2025 14:09:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa811e2sm475740066b.5.2025.11.14.14.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 14:09:06 -0800 (PST)
Message-ID: <bb5ea31e-8748-46a5-8072-8f0484e72536@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 23:09:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: Add SM6350 support
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <20251114-sm6350-camss-v2-2-d1ff67da33b6@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-sm6350-camss-v2-2-d1ff67da33b6@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MKltWcZl c=1 sm=1 tr=0 ts=6917a884 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=Cvb5ON7qhB3BCWpPquEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE4MCBTYWx0ZWRfX5CjOazDVJRf+
 +T9Qd/gR5TjHCB2NXhp/IpE5OS2RRXqq+n2Ds1Gb9KZ4Gj3z0jTgZkwnz9zIcSpQYPffw0g/znZ
 8k4BRycTZAz4tjM+QtsXk3fZuRBOmN9jmiRhn2ucbXxM1wLGDYqZm00VHJsnEuAcIKMLdrSbAAb
 2xQR6xq3fHizvGv6hupEidjtO+JoXGC/zoncCUhlIhL3QtSThzW26QN03FOxceWGrCE1QorMYlx
 dwYBYbACHhPoW5y4u7/5W5nX9BM5IhVLfxiZeY/Q8Sy2TDHBMT8moTOh3JP2B+XuNdSpHmbnZEQ
 wpI0f33+lWTyZ/pp8StEGy8RW7FkFrHdFHEEPJRfwWYsWwkH50g0kelydX4vciR+oUJonhJS9O3
 ObfqM8DL8CYt+1X3UqlHsAouRpygRQ==
X-Proofpoint-ORIG-GUID: -C-nhhczPNJh6kHcOXNoCK_ailJkYsBH
X-Proofpoint-GUID: -C-nhhczPNJh6kHcOXNoCK_ailJkYsBH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140180

On 11/14/25 12:15 PM, Luca Weiss wrote:
> Add the necessary support for CAMSS on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +		.regulators = {},
> +		.clock = { "slow_ahb_src", "cpas_ahb",

Drop the _src clock, we do ratesetting on it through its dear
child who you have described right next to it

Konrad

