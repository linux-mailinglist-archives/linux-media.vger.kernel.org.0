Return-Path: <linux-media+bounces-47155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5EC5F7DA
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 23:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D363ADA26
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 22:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE4230DD3F;
	Fri, 14 Nov 2025 22:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="miU/a84C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHZuM8mQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BC42D9EF4
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 22:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763158617; cv=none; b=ssQsWcZQXvr0AfKOYMyC6vOZ+FN32gZ24trU+I+sMfXh7oW6Up3duDprbTk98MkM3qVZRoTK6J1liaCMLo0WVv8Quk1piLreSCcrbxJLDAbqPSXVYJGtf2WUacTZKvAtGyWFCyN2LqOwBQMSjektG6vt898xgpMUrD96iTGXVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763158617; c=relaxed/simple;
	bh=Euo3aYyIiS2EFzYRpUBRUMp9JkSwubI8mtwHHK57FSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upfqDnPDVIVdNDf7JjTEcYQ1bsfcMH1NvJBbHHY/TFgDIhXzKFhogFjxOt7BgCC9arJogFAo9h2r9c/VLxg24QBQ53OOY0tqym20x5aPihAtR9pIHB19LUqFS7Ibh6MrLP0kFi6ISo9Bl2B3Bwa9mVvJQJklCE8XLMbD6SUzLgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=miU/a84C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHZuM8mQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEJVOPl070919
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 22:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztuYyaE22UQpg1VtA7huflvbOJvFMCvZ8dxISGtSh34=; b=miU/a84C32DqdD0z
	21baSOB3AveoQhq+vbZ6Az6dl9OJb+X8KQneUyh2ZOvFuIuiHUmeltvI+DUV8/ke
	rIKgEctqhccb/sV/CbW1zYMTYBnZaQsD7rC5OJ5hIqdZXrBnJanVoveR8pSN+D1e
	N/okcizq4i4lmYM+AZ9DgS9fOKNp5XeK14jI7XhR8QbHRIA0KRyKkQ+R31ueaSF8
	FDZlHuN0qJzoxNNueytjycl6T3gK5qjLUTtZp9GaILFNs2MYNxP2ng48dOaLAQAt
	bbmSK4jQhHTmcN96AnxBgyvmyryI/s/NOSY9K12oZ0gg2VV0EMVYhnzlwvo9nc1B
	0hZuPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeang8ebv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 22:16:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8906754b823so82523985a.0
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 14:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763158614; x=1763763414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztuYyaE22UQpg1VtA7huflvbOJvFMCvZ8dxISGtSh34=;
        b=aHZuM8mQYsCGtM8wSsktH1odDnq5QjK/Iz3GtPHVAO0+/dZHGCSiAXqtzHFmBPrKG5
         NeDPVeMAijHBU2rku1QxwXC16Tw26G2OqlbvoENZSTAXwD148c1wR7kYqxNAyfbnXExu
         xKz/W96XnB883is0phBupiKK8I1CXttqDwbDldJ8BAVfqVuRSExzpVeVSVhzX26dKYh8
         dxMOkS9xj7JzcdYVe7sY+sh3TmiwUxWYfic0iHwFU99VOE6w9jSlm07FLOMbZroAKUgF
         EZ6KU1BG1rYuccDkoUdY75NvbpK0akDw5Rglka5+a2rxoK1oUMDi0cbwqj9uIXOvYKGG
         SAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763158614; x=1763763414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztuYyaE22UQpg1VtA7huflvbOJvFMCvZ8dxISGtSh34=;
        b=S/suYXJTFMQwY9uX3J8yxfWG39L3L+yycDKp19aF8cp3vUbZbrWRKckGhmveCkSukJ
         6G+MdpMmZiOBaKQCzLxdMB1jvuXO7VXMFd6o3R1O5t/Yw6Phk8i1WnjGmplrXaC4d5M0
         Uxo0rS63GgUSWTG8YJ8CTBWPxfuQZTkRnpp0N37N1HM0gnWX5wZV163WBJydkv7nsb+b
         N3LkRoBpEXtlGX+EGIxUz8AvwWlCqoXLlTIcYJuA3F241NblRpxdxlEnfK1pkQUMQTOQ
         kKmTVhrrdB5w+4tflJhUyNN2aH+YIHvY+YQeL4nR9DcdT1fwL0MsfauIU7C/ltXQkbt9
         8qLg==
X-Forwarded-Encrypted: i=1; AJvYcCVwzGcMAYLWJlyFgC2dFbC4Hzg/yPGXpaJSke6C0PFeJSvpgAQBoN5j5jzKzRTJS4EON6RdCvsl6GNF9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoogZE2bqSVRVmDC+wc0nA73LC2bFD2YM40T8wYV3zsTv8+2Zf
	X4RYnpw0i8PbBT1HTBNdq1YQ2gBpmMiPOb89RFqEWAlqCyxm9ijAITi7uh4wULfFeOLbGX3U5vz
	MW9di/TWCAJ4vXenTcFNtNTW6LnCqcBZzyictVQpz0wiH7BtMNwitqDqHhAPgkalErw==
X-Gm-Gg: ASbGnctGiIQiS6grPDBBiuZn0tp+wZe71vkzLWWQ8y5z17PZXAsLseoBP6HbjahBg0C
	BnLLYmm8r2vzoyi18Bm/esyMBnnTq6AQKkVycfCfVbCCTJciv/34VT/QKzyQTQG/PAZL4x+oGPq
	v24F8DXIZtQ/MQ2/4Hti229QSjst0B6qjMmLI0JfAGMw/LHBgggwWLnxGmHXMjF9A97Qbd+97Os
	lIoUxfxeU86/T5O3J6CxkoUUMC4TuwIH23lcFuBFDiPFHo9ubbsOFw9IKm6trTcnsWdvA+b+ZEz
	CQPg7Ka6sX1DYj1lRGY92YJv08+BpHx/1RyNKJJKDNSuQeCEC/fowVdPjZTqsCA9b8Khkg3UxiV
	ScUEPKHzRICoPR+TTi/DlDkydDwwYLWTENm6e0Ik3+i3FJSMT8JaeAvOD
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr44152471cf.8.1763158614256;
        Fri, 14 Nov 2025 14:16:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0nd6c/kzzPXZC2X5wHVvvmNWn5NWPaIyzTQSgkf9L94Ds3FA9xJLXbYLBIFCtp2rkNjJ6Mw==
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr44152181cf.8.1763158613803;
        Fri, 14 Nov 2025 14:16:53 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb12c87sm471442266b.31.2025.11.14.14.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 14:16:53 -0800 (PST)
Message-ID: <5fbb0239-7f8d-4e47-b035-4de270b6a348@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 23:16:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_nihalkum@quicinc.com, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
 <20251114064541.446276-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114064541.446276-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KcQD6qbc2g8m-U4dpRWOmWgOZECYaE5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE4MiBTYWx0ZWRfX3ghCxz6amV0A
 xUr6NNYsTuE7OFWu4HSbjWzlRzcpE/iarvM+pLRjcQ3bmAKg3p4OOLZ6cDhOzMms1yokYWyw/IV
 vb4B9MHj3rOFNLmfuqc9XolAlaa7a9TQ1hfUrTccvmoORlF70YOAbgg8pZRC1imCeG3xWPKFH8i
 ycVPk4mNiuZrQUCDxwQ3fdWkdmMl4h+1c/S62E8lbFK3YNaOXz6C3cU8m35n2IYkx+TDishgxcm
 tCXM+3/IJLwjuFu3Zr1vAnX0OLQNq+zbFjtfm7AFdUnLbGy2M3FBge/ff/lxir/Y5Ey1KlX4+Xf
 bbQX1Rpas6aeBW8LzJ2Fy72cmbou4G3PQmIDld/8BiwEFUd5BhiKHxnz0ryMQn03y0wTorvgn9P
 eA5Yg//vXknI8MzwFplzzDXC5itgGw==
X-Proofpoint-GUID: KcQD6qbc2g8m-U4dpRWOmWgOZECYaE5C
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=6917aa57 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=MC0u2OBjPC9q_JU67CwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140182

On 11/14/25 7:45 AM, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains three Camera Control Interface (CCI).
> Compared to Lemans, the key difference is in SDA/SCL GPIO assignments
> and number of CCIs.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

