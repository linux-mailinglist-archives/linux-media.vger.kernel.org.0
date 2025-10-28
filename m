Return-Path: <linux-media+bounces-45833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D0C15306
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 15:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8626934A58A
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 14:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85D721770A;
	Tue, 28 Oct 2025 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEZ6x4AC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3F32D0DB
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662257; cv=none; b=VpArpyBKl3dnz69J/+SmxVq/UA5SWBYHDrsp3eglop2Yvt1UGdtcI5efYqi1rUzkrUYPH1RqkPTEhN8V+PW0NGDra/n+bgiWNh96FCjuoycgAygC7y13QgHxQI+afWLnY929m3xbK3YdMO1PX3P/MGytjuM/OCwfKqc13H7k8WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662257; c=relaxed/simple;
	bh=RlL+HspI/qKibOJ3Hm/qcxkCvXtTeg2FxvrSbq8tYKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5UfBqUehOKMlaCjAAsP7luQ5C3YGbWQTJi0/LCvtQQjgl4YZtkbrhNu8oRrzzoXDuelO+pgV1AvS26ugzCovrjCPqeMtIH1jNIVWuqQhWtp0fbKjpzmgi/VZr87AxByCEz9ARal6TuAwGSA6qZJQMEslbIXtmPyCirfnNEjVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEZ6x4AC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SE0nIL3813040
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 14:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/rG46MMpKrRauqQ4haAq1ic3vjVmepSj7Kf1llU8TV0=; b=iEZ6x4ACCNTX+Qkj
	LerpyqWm+QvfYlmVDBKgpnJDIAN9SAAPvC6nnlidxd4A/LXOz9oamk7c9WDnMz53
	pMrkrmCbGR7BMvqM3IwGzBnuhdH45LbhRKbcxnjSngBeyiYvPp9NjfMooASqatrY
	67JQx4dRHhPjclbvNIf8D6irwmMy+XWF0uQqq9KrmjTKqXn4V4ZaEjgUHly8W/5m
	C+6a+Kd+OPrpYvvk1iOEs+XhH1S34j4R+ziwFdzl1Lgd8W8Q6hdW0Mzj0zAacRO4
	/7uOvxwOwqDshWAUdJuJUFUGMMj3yEzjTOifVthdunqgzhMuvEWAJSJXD8c63PU0
	bnPi0A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2g2ftrcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 14:37:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290bd7c835dso57720715ad.3
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 07:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761662254; x=1762267054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rG46MMpKrRauqQ4haAq1ic3vjVmepSj7Kf1llU8TV0=;
        b=QHgox9ec4cndZHC08d+DK4KHUfyz4wz/gbfPqXIKuqURt6bXUq5fPsgYoA7L4LZeoy
         g3NKGhZf+qQYb+N+6eWXgX59TRZbdNozhcCxDM+9llMbenF2GIPI5J4gy4soldE0uZba
         kMdM+AELboGWNk5i5aaN6oVpprd0vSBUO/PXFwzpaXYEg/r1Ljg0SNqJLypV4A5G4UXY
         nws5oFv+gFgtyn2EqpbvybLP10V8H5r80WyDCH2tKYOzHo/8ACp6zneNA6F1H3XkDb0+
         SV9EhP808xRS+SMF1F6+zWj1o1i7740waVGk/qqKFylsyazLauXCOtY7Lv/bpDjRoNo0
         Mydw==
X-Forwarded-Encrypted: i=1; AJvYcCVJFXxaad4IhbQhEesejLvf/+pLrucn7MspkTP1BC3STszh9i+sFn6cZnJRCXet73KA4d1qx2H09X3oSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsS9kTDJncfAQZbtwbnRjTisF5S5lMt/knC38tMWWNxfUcmRRP
	7rUdm7jR7F6Nq6RQcMK/2ycehnI1i4sN1aEOLdq7HVbAvf3LeLS4FmoDjX7ntp0B1k5OHisPy6Q
	B8+uM1pQNSVhMaROL/FosXAB/Lp1++zrMX6+5+luyzP0th+FXkPJAoprmTAWxakEo6g==
X-Gm-Gg: ASbGncvcnvRyWKyyMJTcQS/UqyTi7hAJ+MneeQsE/jk2fibjMNNsUIrpdZh7hdYimJX
	hnwCSyVc3Elut288rNN6oP7WMi1FlCnWyuzRn1ohJXEPa2IN6QFiiHSxEDZcD+iEUWjdlY7xA77
	8ZMSzu3eEn8fyYrxXuSojzaM6xSGNimZG7hpva/3bMRLJz+sbs2Wnrtf3Bv14U5IELQHyFl4qUe
	+gvO6ccLD6jQh4IpSTtUe9zTLSBvHjLAVlzUfjt2MvlLsQLAYpH5VMDb/Soebyl8ZX0I8cBxAu7
	1/ZXL7lQq2kQ73tx3hIBXQvfmz+ih4iXMfpD8/B8zX+W1PDXAsjgdICEzAo1tqn1/2TXkRXsHJC
	ZLxTGNqfhN1hef2qtrJ1s7dP2cs99Qg==
X-Received: by 2002:a17:902:cec8:b0:269:aba0:f0a7 with SMTP id d9443c01a7336-294cb37b846mr42602875ad.2.1761662254228;
        Tue, 28 Oct 2025 07:37:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNEIHDBFZq7QwFF8HDQMJV1KmXTeW/+0baTbAylgg4BeWPJ1O+kRI2qc8L1PgzmAvM7ihU7w==
X-Received: by 2002:a17:902:cec8:b0:269:aba0:f0a7 with SMTP id d9443c01a7336-294cb37b846mr42602425ad.2.1761662253506;
        Tue, 28 Oct 2025 07:37:33 -0700 (PDT)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42f34sm117630335ad.106.2025.10.28.07.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 07:37:33 -0700 (PDT)
Message-ID: <3524e5c8-3848-4554-91cb-f2e034378013@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 07:37:30 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: qcom: camss: Add Kaanapali support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
 <22f63af8-281d-4783-b770-36cb1feb4732@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <22f63af8-281d-4783-b770-36cb1feb4732@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEyMyBTYWx0ZWRfX9+f3NGq5glFG
 UJ78adZryVByZ9jER76nLd5hzV6ilGlEmOrTAnh/Alx/0FH9W27ZTm2ENpP9EBTBGbZv47/9oiZ
 JEzv5d2ZDJTuPjwJG9WuTHbVa3sny3f7ffeM2TpIFQXYeS5C1KYpnuCUk4EKEtp3glyN1TOnocE
 gvgOUAobykYHTMzkHoWkbLDn2Xz4V5Zk5ORlZu0/lgMI1OVDMfy2b5cqojD+UdP8q0KN0heQVkV
 5PQQBqY0RcXUYmvcmb629j7DHRNPMgiAovgqlHuw6QcsxInX2nGhBL03MSMvfke0gk6bCXP+SzD
 9KREsAkX7IDx2xX//kiNFtWpJ3fXKLErseONp0H0xKK5O/073oh21PmFYIod0RHeWOatBj3Yo8N
 ETojLqpDVetiQ8cna1l4mxdsEnaXcg==
X-Proofpoint-ORIG-GUID: G7xASBfNSBjbTaHRz_a3rJ7qbI6HF6Dl
X-Proofpoint-GUID: G7xASBfNSBjbTaHRz_a3rJ7qbI6HF6Dl
X-Authority-Analysis: v=2.4 cv=FIMWBuos c=1 sm=1 tr=0 ts=6900d52f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7mIJVjpd1DSiGoLQp9AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280123


On 10/28/2025 2:34 AM, Bryan O'Donoghue wrote:
> On 23/10/2025 10:14, Hangxiang Ma wrote:
>> - 3 x VFE, 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 6 x CSI PHY
>>
>> This series has been tested using the following commands with a
>> downstream driver for S5KJN5 sensor.
>
> A few comments here:
>
> Publish the code ! Its actually in your interests to do so.
Hi Bryan, if you were talking about the sensor driver, sure, we will 
evaluate it. Hope it wouldn't block this series though. Thanks.
>
>>
>> - media-ctl --reset
>> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F /dev/video0
>
> Good to see, it would be nice if you guys could also start running the 
> RDI path through libcamera - softisp soon gpuisp and start showing 
> some realworld results.
>
> Not a requirement to merge this series but, a strong suggestion for 
> your own verification purposes.
>
> ---
> bod
Sure, we will start doing that. In fact, we tried and faced some 
dependency issues. Will reach out offline. Thanks.
>
>
>

