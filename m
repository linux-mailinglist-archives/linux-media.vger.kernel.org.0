Return-Path: <linux-media+bounces-36138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B078AEBF9B
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 21:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00ACB565993
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 19:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71ED71E48A;
	Fri, 27 Jun 2025 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4M1HOc9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B691F419B
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751051802; cv=none; b=Q2FfSzLcUh7LMOQPiF82v25TxwbsNvKTcPT/O15f9w4LRhAWXi0SO+dE4V0hwzyl3X231BZEQGx6KmKAkius/PSCqrV/Jm/NmFzMCx2xaLb64GjXKl+Fd+FQV9mUJSRXVs44TodUZJoQrB0pEO34CODtKbqY9qflikVpiDJCxDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751051802; c=relaxed/simple;
	bh=RlRJcwm9a8JTqN3y1j1t/IjOBE0hIdzvwB5bYp7QhCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KL5OSruzSQcAuggZFZIAhM9v3Zh6kp88IQqxBNGMLOje0I1hlt86RFVMIPrkxU3XJMFZQayWvRpAObzORGLvdXAnYqhubraOpCFdIofjhoKn0Lyv8V48HXMErASKxaDXRpctXks59Ijk6Rl3gRy/K6LR6r6NuOYeBvi+YA5AGcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4M1HOc9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBVZ1h007340
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 19:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXDux9ZnYbHSwb/EPmf9T5s+8Qzuw9drVvr9rBihY4A=; b=L4M1HOc9b/2x2L4a
	+Kfmi8fcqJuqKOysuPdlyWxBmGHnO5xdsPuEgI+5ngGlA6amu0F/hr3BMoLXsPPa
	MaQBjjh1LgoBZVuc+RGvFLuKdELgEKJ9nMFmqYPaVH5jiteICxBGOBLsSOtoZght
	aPccjghvyoE19gx4OCZ+veFSJR14i6/gygqNezlux9w2exNnCasvpR47eUOHEPcU
	OsY3L2fH48E4mSnFHSi300cfAZllZNxEI1X0xSxJQfbVgbSVPRm1+WXYAgXzzo0z
	eC4SgiN6/850RsvhRglkcf6XjCbdD6vmI0qVtRTpao9EWL1qwWc9V/z4THAnEbkh
	olaI3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc610ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 19:16:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d41d65f21eso6089185a.3
        for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 12:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751051799; x=1751656599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXDux9ZnYbHSwb/EPmf9T5s+8Qzuw9drVvr9rBihY4A=;
        b=LKaLgN9Mtx5Bx406ZVAfGTv1//Wuof53FWnaxUcvOEv0Hi6vO60uNd18hrWSbvKLFF
         iK1dsSrziwMOnMtmxCP+xnP1ZsXokAadvxTnO+vVIMxz09MVdCUtk2Wr6vtj/UZPoZy7
         DrWZlJUWCBhQ6icqJCXsEVacp3gxDsQ4eIZZKco67TRG+l95pS/C7fphdxwaV5BeDso1
         qt1rRgqHRRkIscXKmI+tydFCNBFEIHZoxUxDdnqufhdOx8vHRvdlcUocKDWCfkhnWPWJ
         kgJNiqzgmN422Vm+6OgeYS7bO1Ux2SXtn1W3O9lwkIkwLw0Z+kxchBkkrPeb4LHSunyR
         vbIw==
X-Forwarded-Encrypted: i=1; AJvYcCXQov/bknvOP9YoEtnupCljAwsg2obzoKdGJ2eKpIWc8D5h+lwah5dZKN6+jYCdv/WiBfhdmbwyc9YlDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqdEPuyhxQAjeGwRodoHDFpPF0Ynmlb6OyrHyl7ie1E24VVmZ9
	7bP/qzM6GSjOXikYoLA29If8gjS7194DSZKl2rfOShnA6vNkCkvsPK1XAAam1f92K/srBnD+EsI
	DrSa5/rzXqmNDoBDpjE7B5ZVW1e97zbaUTxCn/xc2Ijwt+NSd8MOXCPdINgW8wNrULg==
X-Gm-Gg: ASbGnctTntWp1YP6xsMRSfavjLVQ1rPOk/LsJ3a05+I50I4doJCSh7z/ZP9bY8buwR/
	qYWLRYBYEjIkZNN5RhwGR5oKe58pM1EJ0ZYlCqKEHyVvrhj07FUhb7b84r2IYtMpzQL8SV0dfgW
	W6pvedwQZTDNh6o6unoT5tG8upnE9Kh9h5Ll87n58wPJ2UysdV4N8mVNmIpdpuOxOo4d7ftLrXS
	cB80bZFRVA6Xq2NHonyyBZPQx7gLgnCvPbO6S0/K6q223uDVD5och4UPtjbBPM820t6+KP1ufPi
	RRZY6fSEOnw04huZI1lkhHYPaOCSzBYu9SiosA1CfmkwoamuwTYlZ8J/69rLzUbJ6Xp79Ht4VAV
	Ke34=
X-Received: by 2002:a05:620a:2804:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d44c28cbefmr18542185a.12.1751051799006;
        Fri, 27 Jun 2025 12:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAzgVSK1bhvsi8IxU2dP1+yUtNotEs7vFGntymL185tGwfB4paX0PSqMYbH7ZA9B7nCA880w==
X-Received: by 2002:a05:620a:2804:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d44c28cbefmr18539085a.12.1751051798284;
        Fri, 27 Jun 2025 12:16:38 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b0e6sm174318166b.20.2025.06.27.12.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 12:16:37 -0700 (PDT)
Message-ID: <c718dcde-21d8-47a2-9453-d98f0dd96f88@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 21:16:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: qcom,x1e80100-camss: correct
 description of vdd-csiphy-1p2-supply
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250627190021.139373-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627190021.139373-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CTTI4oYIEEVXs5w6v2Ggi7Ty5sp8ddhl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE1NiBTYWx0ZWRfX35OlqWvjxJmD
 6xJr7CGE9sDWVc6e/l8euPIDqsR4HBE7W7pNNon3OR/f5reHvSYOH9nZ82k3MDUc6zQOsdtRzmM
 CFKbf8UkOVRphmjPLSTfDsvwbWNHqdgafozmqKzjjpeqpmjYVOVjpTK5YEJXVcB3fqGU0k+2C8B
 VM8HYAJi83whOhOGl3tnVQJz2pc7f6Jb5ac6DHFKYGG21hL8hOP51wdWSPLjMeT2rprDHx6EVX9
 IrreqePwlJpuGLrE3V8BM6pNrLD5VrL6i4gBcmWd6rOnu1ElK++qpgi8cIa7TMKa+oNksaAdEXL
 Q4zjPfAtXnlHcRHppANyfoZC8MZgxyWDGwDNu3GSAN55fZnRs1+U2xpGWMuOlmr7D7SDtr2YraP
 7WpHFIe39IGIsbifoD7uaUEG1ZH5ySo2vkXVOmGtOT4pJ1NjUqPs36a6KMPBlrroVHHz8Sn+
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685eee18 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=GPXLWcMjtaZN7sqBiugA:9 a=QEXdDO2ut3YA:10 a=NXw8GaxpU7kA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CTTI4oYIEEVXs5w6v2Ggi7Ty5sp8ddhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=815 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270156

On 6/27/25 9:00 PM, Vladimir Zapolskiy wrote:
> Correct the given description of vdd-csiphy-1p2-supply property,
> it shall indicate a 1.2V supply.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

