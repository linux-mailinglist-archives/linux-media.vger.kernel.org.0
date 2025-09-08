Return-Path: <linux-media+bounces-42034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705AB494D0
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 18:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71B9D7A69EF
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 16:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6094235BE8;
	Mon,  8 Sep 2025 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nc4WM7+r"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E95B223DD9
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757347790; cv=none; b=U6QYF1ytGwynFwQhIdSyeuMKlj4p8wcvKAf1NmC0LJnlcViWATjeNkCBVYXkpVAAKyvNSJXKeNMQBARialdbj+6oXF8asEQtCcIUC9EabYyOU2RKJ1DnAP3MdblX5Fk71iPWagCty4bBYhB/6DNODjSkILptu1t3rvYM9L0fXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757347790; c=relaxed/simple;
	bh=ubWdoPQHWOLDpJjgP9VamsCXUKRL6blwyUiqfCr+RMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=McTClhxLCuUStqIT1qMPAKgyvvW5hsbkz1k1P32YFpH0vMuJjArnKQ32bjqNaqHTznZuaqVBIQqO5HsTaT30Ygv4QGWCkleaAZSPdn0gq7PS9gJbVyoTl+dIveEYqvp0kaGy+rgrcV/BLIYzDjO+5lsr3K2DOQFxIBtBTV9kXIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nc4WM7+r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888vcLm017440
	for <linux-media@vger.kernel.org>; Mon, 8 Sep 2025 16:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CoUaDuOr0Aeqkj/4XHl1iuTrcEJpXOBDJljwriwNMQg=; b=Nc4WM7+r5YAV8P5n
	N32xQYxdol1iNduD+wLaVxRRACWnY9JFJ6LLHaQVciQKjk0WfkczXVAAzjVDrqET
	4nVoe3SR64EsEmXWPfnJ5H0jN4LN07anEG0rC4Y8npb6WnrmKyapzXPHxLA0Obny
	LQ4lKEmmjuJ0sqDh7dRNIzjvBIO/BixzdQtGfhwQK5+EjvkeEHRFzVonAJyM2rEI
	10U+A/rFJNwVtWm1ldOMW4azMiv8irhLapeQCFI5NwZSOqd+FFJ9n3XbwS8OCqi1
	J9N+h5GCRC9sZ9jPyeAjptssWM2TFVQjii2jhlaZtV9oT5UFCcPLZQapG0GWdWRP
	egMdnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0n69g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 16:09:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f92a6936so10115771cf.3
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 09:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757347787; x=1757952587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CoUaDuOr0Aeqkj/4XHl1iuTrcEJpXOBDJljwriwNMQg=;
        b=nZfixcYyptC9FwojqAn7xx2U3HjUrWSIvw1eXEuGbnz+ZDLlUZD31FX2okHfDP32KW
         XJLhVPe3DXcIIai0WGD9jg1Bn34TuvYBjWDvVo1qFK+B+yK9WWL9u4dE+Bs+9owGHkwi
         pmNb0JTspcWzagUyzN2GjPMQ4NL4jN0b8PKy28WVTlYnJDZqkQ8PTQaLMS+CiN+WB0jl
         4KqPBp2eKo2KdRvURUpvJVnm+6P7naw944z7kiW4FX0dchoVLLuNt1zHgXi/bgDT4pry
         XpuPzMxzl675cDfOYHkgKbpdNwXvFOtnH6C22sE9KvAoclI/INr13VWiO4orUwqSJhy5
         RNNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxprlAr/fCivACWOBBhQY7o9KUWO+xYONJKavfT+HE7TVRZklsW6OEq3/NV0F3oxJHKhJqx+J/1nk9yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgJk28PINS2F8UT06tsy3TT3b+bmsjkahx8ETzaMVdLgTxuXHy
	jhNTQJT0nfnaWZg/B2g85WCY4rWh/lGyWoIHLhlJ+FGKmgUj2NEgCW6s++A4epfOTdUcLhlqxs3
	evww5QRn2stqXqhdX7ZezaeWNk87QK78I+KPbMXKCPSyGOwJGYSOSS4jfKYs0e1mB1Q==
X-Gm-Gg: ASbGnctNunzVX3F2xJyN8W3k+vOBin7e0/RlnUQ1PpKAM2crPml9CrqDXnPRsI2Mj4/
	mF7WNjkymKl+7faHOTF7B1TEAgRp8LkX/Y04A0hyisMm19UMO13xXerjT3OWduXA+L9OtRflhKx
	fJmm+Chy6h/i0ilx1O9wm2DA+yXOOw0XgsYCaJIVc9kzVu+UkLluqdnO6ZF/Gb2x0QTfC53zQQK
	aYha78TDowC38AXkTp78b9SQXLHNuCHRdF0V5ggZBpMikfws4loV7+e81RCyAYJhDRIbNWs+BO+
	i4hbyXOUzN4n5DgHT0zWn/yoc0/+jHbC/LqQmiA5t4eh7Qk0uThVBlvbHpA+0ypUafte9LExEXS
	Enyp7j95A4egO1jEZby4m4w==
X-Received: by 2002:a05:622a:587:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b5f837c266mr64567571cf.2.1757347786593;
        Mon, 08 Sep 2025 09:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKp0kzn+Vp02fMPwlJf0k2yNql13pFOExJFPIqquXqfbLcwld8IobIzG+7YJra//PBsHnvLQ==
X-Received: by 2002:a05:622a:587:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b5f837c266mr64567221cf.2.1757347786096;
        Mon, 08 Sep 2025 09:09:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc579ba9sm21968793a12.52.2025.09.08.09.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 09:09:45 -0700 (PDT)
Message-ID: <92123e16-d98d-42c4-9dcb-573dd7eb1973@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 18:09:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sa8775p: Add CCI definitions
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, todor.too@gmail.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
 <20250815-rb8_camera-v2-2-6806242913ed@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250815-rb8_camera-v2-2-6806242913ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7InIi14h1Z3gdfzSa-n2-kZKjCheCXQ6
X-Proofpoint-GUID: 7InIi14h1Z3gdfzSa-n2-kZKjCheCXQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX+R+8zbG+XNea
 yEcEPT9zRCWEu1/yWtIzX2eS9c6lIHVN/kM5SGWdCEavOvZpbNsWfOAADTvmVWwtSYqYuVhzivS
 6PRcwz8InHjpDRwFD8I9yFafr2qyFL4wT6M8WCTCqmQNNcj5MUdjief+pMX0mpQiZemuDmJ2jU6
 WL8twMjxT+Dd162M2ft2yYV96gYifOPuuB3RMdzm8v6vJyTHkMk5VSBlQgdrVYD+ZB6xKmCrn+f
 5dl0Fy6aZAYVbElC0o5DAuBhfh6uD8F2waU+T3gWyKvdSnP1aCjXP9bPzMg1r0DQ2+UGsSxg+zp
 GYNAq6MFaax9SJwml7FqrQFcrjy+r5q482TtRbmQcZ8NaKgtyG0ed7I4MQYahYHBJGjEi8YYDaJ
 VUn6F6qY
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68beffcb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Is5zltCUzCQjwDH9xFcA:9 a=QEXdDO2ut3YA:10 a=kxpXfmk2mFwA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On 8/15/25 9:07 AM, Wenmeng Liu wrote:
> Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

