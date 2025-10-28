Return-Path: <linux-media+bounces-45819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A38C14840
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 13:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6198919814F6
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CE2329C7E;
	Tue, 28 Oct 2025 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+F+Uw9R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00281302178
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653111; cv=none; b=GURJ6yx4tY9bQD4dbvNaRAmnDSLRF1t6ff59Cm+RRPmK6U23tUtUI8qhrmg5sX7tVzb/yu5Qe5eCPn9eOJTFq21x3Hsdmo4qCKfHv70OAnlps99wu73pTEglFvNfibKAD0ZapkdXoi9pdZv9xeZM/jZPaO7H+k45ljfExBfixaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653111; c=relaxed/simple;
	bh=rbCKjKedGn3lNL5DA8iywRojNwxcHHuGUb+g62HXVcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6RNcioRijTXBtSS/+QkFCWpMHPqkIEZhI1H29P8R+skZpsiesarNkwLHZYeirhtP3H6Zk0brydwbef7mg5TiqS8WGno823egv6E4LsgRwf3DlrqXTmNWKiqWARoK6mNX91saxahAr7g233HYreblwC29m5ajrZ/Cr1cPj6/+iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+F+Uw9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S9q5KP353700
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVeMj8aHmAOBLYyWb2kA3eC/uoHRmImo3B+A0gZx0OM=; b=D+F+Uw9RQtOpaPag
	SjSKLaGuMU9gWg4SymJiIdoqnj+A0TFfrU0nWxiHlbhNGoJPPXu53pulvzPAvf1o
	2zG+znbSIP4u1MINv9V89dFII+Ce0oEhf1yNJZy+bYwOgxqvKDHhxe1REvw9Lqm+
	FyEtL214nKq3YzoUnSMl1rHqvmfej/eydAs6W3heDXZ+lhZ8YEflk46L7rqTXnjd
	dxpAIH7kihgHDKfKk/S6sHalqS7w8Mx8A4YSYn+HWOCmITt6Ecej6k21qkHBRxPD
	9V5c67iltDqxn3Revod7BzHKEllQRhVy1+DjsLIdHJGXfQptBovbDJzRc91RE1UW
	SayCww==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2njrsh84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:05:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78105c10afdso5278839b3a.1
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 05:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761653108; x=1762257908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVeMj8aHmAOBLYyWb2kA3eC/uoHRmImo3B+A0gZx0OM=;
        b=kVWhedjP7opjXfje56Hfzjk+MmODtKSrDP8peHPLwGpBx1viL5T2K3oBN5IUSRzTVW
         sAI2BKrvjFvRQq/nteRdBzhfWdQ0nq5vptg5KWYJh7sRUi48chlloJeRKo0mBFhj7fzs
         s7EaUmmOpGxKjMNyT27yIhORWAIB0H/pkbckXwzJpmLdKIH/B+4zciVJAT/QVogfhZoj
         1gQd/37DCOudQdUhxcLukmauK9EQLGgcFqxn2xXN+nY8VKv31GawoAtYStpVV92pyqFu
         kgKGNRLmvOaydjOMNNDtI6wHqh7wTRqgCyR9l+Ff46G2bL6+nvp/xYsdoeC49eafo1o2
         wWtw==
X-Gm-Message-State: AOJu0Yy1qBT7cN3k6PubY1znClpDtnU/nRHHKdFmHI320JaBV1udAl3x
	WIf7l3rYDxYCTbmPZLixQRzFM6AasWPQ269u1fsVVpDDaRagqF6lrB1W1D/HuOtSoyQK96LLjFm
	eZfij4IkDa9dq0v6Q3Kxgf0DMnM4NpkeWblsE+njmmHuThTNEDh9V4p+OUYDOEyELgw==
X-Gm-Gg: ASbGncujLvm0P8ErmANtsjN14rrrrhetMtotNK9z/zrJcRGGr3LEP0QpB8u4GejyFNr
	qiGCu4pmJpTXuTOS8fv/g7KbHrIiWetXSFUCLLd42QkbC0xrxx5AsvAy8ROJQ/Ges80Fs4ZuoFg
	uMbHfg5A0cO8xyFY4vEghkDh9zD1Ge+EfEzkV+g+YJzEb5BQqkEa9cGqSIPkOa6QAoPnl10lKK2
	9kok4iWemBn/AlJ68Wh7439wDgpF2IGoSM17CPg/6Uu7MiofHMNs3MQOvN3G9XG4P1zi6wWl6IV
	I0hMGQop+mOprd4EJq2BLKNssmoaQTHe9Fx898oYeX6+3LAjJ5A56c6eVOqQe+Rw/yo5EdPcQsZ
	YFdcCGKbgIvvvTLB7nUKDvq9N01rLNec=
X-Received: by 2002:a05:6a00:391a:b0:7a2:81fe:b748 with SMTP id d2e1a72fcca58-7a441a92cf9mr3968319b3a.0.1761653107352;
        Tue, 28 Oct 2025 05:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIeqxVp1SuLasX8Q2uSFeqD+JQjMYiarT/vEc4wmKhKICAmfDvlDsrfzm0Vj71rwWg7P7V7w==
X-Received: by 2002:a05:6a00:391a:b0:7a2:81fe:b748 with SMTP id d2e1a72fcca58-7a441a92cf9mr3968276b3a.0.1761653106869;
        Tue, 28 Oct 2025 05:05:06 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41408757csm11411627b3a.59.2025.10.28.05.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:05:06 -0700 (PDT)
Message-ID: <d1e665bf-9e94-b078-c984-fa2fb1392a32@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 17:35:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 6/6] media: iris: enable support for SC7280 platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
 <20251028-iris-sc7280-v6-6-48b1ea9169f6@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-6-48b1ea9169f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dqvWylg4 c=1 sm=1 tr=0 ts=6900b174 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fr3eplbp6RILtt3BeFwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: yoU1owsFqnFSI6OE8sUSSB0KmLHlY9Td
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwMiBTYWx0ZWRfXy/DNizQj4c+0
 imi1/o7cwEBTN4F3sH9LtsdV6ZrsibBNCABQUnYNsGu5OsY2g4CZHA2qMyorL48VeguU/M8JDuB
 3lQk6b8AUARm88la3O9vIGVaQLe4Nvhz8s9tLJv3CfRwtOdMv+EQkjLD9WtNRbpwU9zF1AbHAFK
 V6zn6ny+fbAp8ztelYOObrFDoCtNZf9InksRj6TDLSeNNlkWlNZoJg75v4MQfQcRClZwp23RFZh
 0Rh75hEA8XstqmHyB7v6VSdAAwu6XZA0C9INBXGo4EdRUdy9epOmM9SBq0OoH3BjPjgdkGM4SXF
 yHXQNGaEQKiHyoiOcVqRyv+rpQcNoqWVVT4etnyrEfG2T+fPGgJ22N7IjDmvzmqHlu7Zx2Dg+hV
 QnsQdTQu7viqiUpipj9Sa5us7qo39w==
X-Proofpoint-ORIG-GUID: yoU1owsFqnFSI6OE8sUSSB0KmLHlY9Td
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280102



On 10/28/2025 5:16 PM, Dmitry Baryshkov wrote:
> As a part of migrating code from the old Venus driver to the new Iris
> one, add support for the SC7280 platform. It is very similar to SM8250,
> but it (currently) uses no reset controls (there is an optional
> GCC-generated reset, it will be added later) and no AON registers
> region. Extend the VPU ops to support optional clocks and skip the AON
> shutdown for this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

