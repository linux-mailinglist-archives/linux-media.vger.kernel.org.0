Return-Path: <linux-media+bounces-45184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE8FBFA2CD
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 08:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C96561A01366
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 06:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6E02EFD9E;
	Wed, 22 Oct 2025 06:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbT4OSXS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C3219F40B
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 06:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113282; cv=none; b=PWDXltvTjWsR3xn6qRJd3C+fNq7Cz1GRRA1rnIQikGfF4yImhsQ9HsTFoSqSI50iMaSuIXk3s+k8FdpAWYZfNcBF61Y3aAQ18uEEzXmtBTRBX9kRV0pB54bMJ9hMBjvBYamInzRUUkEehK/WUMwq8vQH3xmKmO11z4FFd6t2/QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113282; c=relaxed/simple;
	bh=Sglu3AHsdA56DCF5eQWWlJB8wv7B+UPJmWstntDnA1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOl/bgMkaE/HfWjlfDp8H/VaLlJkrGsSbdRrBcQezi9at46+WhUzmpKvjbQB2GXf4rOUXh+FsRuds1VyDaxEcmSiYV30s5yoCRGnV3a4Y5uvW0Uk0e1A2+Sba6NSDOKbXLenDu0fGqtR07JiiL5klYxPx/wYK78sa3xo5QQMiyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbT4OSXS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LKfIWo012332
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 06:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFeybT/HfJvpZ870zvEnUeOgeVUn3AqbfdXfhS0xCBA=; b=bbT4OSXSVy70ojXg
	GZLEUlW4Cd+rDP2onY9nC20OE9A4Z3PskmSXaO09KYOwqeugQjj578EncreSYzlV
	GC7+r5aQeeH5h5WKmUU8wRkcPW5GoOT+LzQJ35mFa7Neih8SKDTiuSErYjkXdgvB
	kTlzOCNJxr1Y81o0KmFSIfkH0kRHHosf7U8m9q6dh1+41RQKeRdIc17S+fzl1/dI
	3WhQsdi4ansztVJiWk7U6/1/mcexZTdVMJaQ+m3pKIKzRhHol4uvSM1TRTR35qcn
	3itZ5s2PjSJjglbe9xtW7qoJix1ov6z3GK+S/xyf0FiZLFX8NOCD10WjsQ+IbmO8
	8GKLbQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0h9g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 06:07:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78108268ea3so576310b3a.1
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 23:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113278; x=1761718078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jFeybT/HfJvpZ870zvEnUeOgeVUn3AqbfdXfhS0xCBA=;
        b=Dt/82SYStN+Ff8G16SqtRosKFN6N6ojJ5zPgmwbfmbKZ4pSx9TsBxfv5LYIaQrQxsF
         xBIUSX7sjZktA5exwKeQNwn+JPq83d9En6xcAhBisD++UrLHGTXXf7WrcFK9WVgzQdo1
         XW+cXJLRouzgDw9ZZzH76Nc7Ts7yAae+0TRXusmU9fw+ucbJpx3hlua1yZX4T5ciNO/w
         /bswjVgUyZp0fCZN5xr0IBDPjqaHSMfa/GaTUT12kih6S9+IzSyfTUiRIH1a3iGDyVXv
         GJu8ve0+gmHmqC+jjMEuhB9rU3Y9q3ck0dD4GTWjk7Cg/0PPM0OAWOONcy4eJY3qr87q
         TRZw==
X-Forwarded-Encrypted: i=1; AJvYcCX1cD5Z+YipvziC8/UbLVTULOn3n6ZI0UKEUByaWIuUOIML1SeXwHTgoyjBqzCkkL7bjWll/B0FpM7rmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4TJkrd54KHDT/pRLIxU0p9TZ/5a3OlkZ1p2HTdR323WBhbpQa
	MHN5j1pGsv+h8qAJHjBke9GmmKGl1iAnX1+r3iwOJidRuMr18tvsQsNVeD3/Q6H496VxcVxcyp6
	3cHoF7/Xb2PQMYvNXWJcUzrCh8Zhnq6v3/v8FSZTHZCL1kfcvEniNNv3bJxtmvXEpmw==
X-Gm-Gg: ASbGncu0a465vPNISCJ/lItYvXLgzf8puh5fmPXcZ/1YTbNXAoA+Cco5DgEPxLA/JXR
	osYFqo5KsUFUVUtKeyhYoDWvzXAvli+zNEfjTwAtZ0Ej2B7K+xRCvN+0kWa2eetUXHiEuMxpd28
	qfNvQ2znH4SCqp4NKwPRg3psso2P+R/XWsD1amccDUD1C81UMdCVwH3wVPoN5u+u1rgw/TY/rq3
	o+WqbRqS3Fp4m0+tl3JvEh16t66L1SeLIiMg+BgHyOWL7+mgUgkc5VtlIp8VotoKhK6XKtQlCO7
	pDDQpaLzDMDfrEEcXsnCKiEwAsI/jUVTR9vbrld5CQJFB2pUaAzeE0vl+rt2etJK/15LBtLbbQG
	6Rv+bFsuPIU6gzl8TYONtIQwUQI5msbsrxg==
X-Received: by 2002:a05:6a20:9149:b0:246:3a6:3e47 with SMTP id adf61e73a8af0-33aa6879675mr3426058637.12.1761113278338;
        Tue, 21 Oct 2025 23:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/8gASKFn2EzrOtCVC4l7qI8001cLdClTDmvQxCAmZe7gdni7lRkjnTKbSZfKe6wvNF9YvPw==
X-Received: by 2002:a05:6a20:9149:b0:246:3a6:3e47 with SMTP id adf61e73a8af0-33aa6879675mr3426021637.12.1761113277873;
        Tue, 21 Oct 2025 23:07:57 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.252.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff3f6c2esm2019810a91.6.2025.10.21.23.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 23:07:57 -0700 (PDT)
Message-ID: <c3a468be-39b0-5c3d-e4d8-9e45f3f6ae22@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 11:37:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 0/8] media: iris: add support for video codecs on Qcom
 kaanapali platform
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <579c8667827cb1ac5778b48077f4f84e875b69da.camel@ndufresne.ca>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <579c8667827cb1ac5778b48077f4f84e875b69da.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX6AI3/nXhiosn
 l9IsBKSjf+hrRKCl3uJf9hPPICURcLtDoORJr7QBmFon9sw7pdPlkdUeL8vVyTaH6IupmekUsOH
 Hv1k6HeQpW8AEJZeuCE+DZ/RzmrF7NoF1fwqRkoQbCMfQzIC4puX4EJPWfqDZNHqmMWLjKW4ail
 hs8TKDDu+zKUjDZ2dvjZjeH/cL28LEH+tqyuhffWtdVaSV47do0mS8ueabCCR6yvRH1gmXz++wn
 8E7TTBMWqa1ZUqOMjBNP9c2ZQR/s+Z816cIrycwS3sVn+/1Oh34fvknRWsF+Q537OA3cUIw0qD8
 w3nfDq6X2eZIkIn76BevOHrTSPcYZzSd5xiZ0h+ArB/PvohTQtmQ7uDttuWi67ro8E42IoWjQzb
 SgZi8mDKFYO7FRUgzYjlBxQmJYshPw==
X-Proofpoint-ORIG-GUID: 3pElWpmdQBp0sKZlIKKXsSdLQGuMjaxz
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f874bf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=FoPg1IWog9mqHsjG+aRTFA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PfT22KiLOBK7PLsoD1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 3pElWpmdQBp0sKZlIKKXsSdLQGuMjaxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

Hello Nicolas,

On 10/17/2025 8:06 PM, Nicolas Dufresne wrote:
> Hi Vikash,
> 
> Le vendredi 17 octobre 2025 à 19:46 +0530, Vikash Garodia a
>> [  350.438406] qcom-iris 2000000.video-codec: invalid plane
>> [  350.447079] qcom-iris 2000000.video-codec: invalid plane
>> [  350.458821] qcom-iris 2000000.video-codec: invalid plane
>> [  350.465860] qcom-iris 2000000.video-codec: invalid plane
> 
> Just a highlight, the driver should only print stuff on default log level if
> something is malfunctioning. uAPI miss-use should only be trace on loglevel
> manually enabled by the developers. Mind fixing this up while at it ? Hopefully
> this will be obvious to you next time you encounter it.

Agree, this specific log should not be part of default execution and more so
when this is not malfunctioning. I would remove this log as i see it can be dropped.

Regards,
Vikash

