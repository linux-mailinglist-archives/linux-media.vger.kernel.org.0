Return-Path: <linux-media+bounces-45827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B94E1C14A77
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 13:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E670D564698
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF2832E12B;
	Tue, 28 Oct 2025 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFo07WM1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01BA30EF8E
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761655060; cv=none; b=pIzCVNA9/jvvkYbqy/qOczbB0WOKrMjSBf2iXPLq6m7sWsQqDWIETWExCJCS024FlNXMnYDQ4HLOWdpe3dAyQlmGPBzn2P3QeZKAMXYEUdstPhLsAzGKdelXgPIqqS9gKwfDcadRjmoNxdCfZEH4+VLSyUuCnDSJaFP32rpCuDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761655060; c=relaxed/simple;
	bh=yRm1M4TIBj43blkffZ7nQ2I5bVoIf+kji4IiZpdTrOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkg3bcREYBqoQI7hndhdJdvIZy1CTT8FK7nY2O9r4a3hj6DxvN72UgRnDTY5cJPtaXr4FgB0BWNGK3LPhfVvHg3hAvI5zjsY/Z0dndLha2k3xll0H0bLjV/qOtCw8oQZW+TYu7vrI4StiaJRWaghCcOwdt/IhXkePQPgIhSA+Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFo07WM1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA33Fq1237835
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99LNhlXT/Af4jWAmqi3dTiwpeXStpX1VM9hPDnHcE78=; b=SFo07WM1xZXvw6ne
	hobDYBjFaEpkuXV1ZznJuQL1JiE3anQ56oEubgn+8M55A2yiJKVrEJ+zq0NriJxb
	znXVVzJSeyR3S/r0JG1odZNBu0DRs1UJ9YZfZhBHwQBNgcppgmIk4gNqdOhxopNI
	gJxV41WpCQbsbavoasXjYTAfTMrpPvzwlSRBbFxx6GUlq4VIZHSp7rLMf6KjE65F
	sTjU1X7DjBb556CrFXH13RqluHulalRcHK6A+YrS1oaOPLbkRCeKgTCfAtuuvjfQ
	Lr/7h2gM4Ox0NEYqYkf5rIw3Tes+zGGFPiSBbXnSHje2+z/nzuJwRTlbfyGD+RO3
	rcC4Zw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2ur3gdr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:37:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2930e6e2c03so62714455ad.3
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 05:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761655057; x=1762259857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=99LNhlXT/Af4jWAmqi3dTiwpeXStpX1VM9hPDnHcE78=;
        b=UTIJVDyBZsYwFcZnYCaOnNqwJgmVksf4SQ+C5Ys9VefLZKarGdaliHONiapK7DFmE+
         5B1n0q210hWlyKvknY36LT5GXtcj2BjZJPYiIZWWJ6g8b/5EXOQOylPaeTIgI9xrotik
         icPGyVDKrXKnzfVQwuFzxHshOaMuJYgWZ9tl+cihXyF5aGCvJBsizxxeR/ChF0WhSVAC
         FzqOKGzlIn3AF4Vl1XvdfSa4o2JvI3QWWAefh3vKoGVlHCOl7F4goOFYvnO8m5UOzjDM
         zQb5ASgYYPgwmHrEy4hgpdefbenXQC74/+ef0bRrKmW+X+Gv8i4Ta97HrUnXKVihYtDh
         YHCw==
X-Gm-Message-State: AOJu0YxOapPb/TYwuIlvp3ZFApyZSztTb1qxwV3ptFpZroDd3pT23KIg
	QmTd1cfE8FUDCOLQpiVx+S8454Yb000drQIpVLGBzWGVXV72MIGI6/yQAaSz8lIscZCP25HW9OH
	mcBvENJ0nlxAn9ybHt2MaCNvDUgtMG3LQYjJdDBeHp4P8M5N+292bRvDtIRMA5qs8ew==
X-Gm-Gg: ASbGncuBdyyfgKvh13ThP47uUfF09dIHlSLa52dLXHL7lRNrP7y4VWsEyQDVkUeVOUt
	VhA9Y2vyvviX6NrP4LtMZD9m4XNQyroMQeUNZrKL1k3pX5KA+T1QdstxY6nQuVnZIyQP/Mrs998
	LLLt7GTMIw1F4jNw2lQwVheewlWCJQAOEfJFnXt0TZgBeaVgPBaeXer4jverTw5WKcHIKQqG+MC
	tWE5xeCrhHPj/3xQkaxgIiTfEYl1vfCcTxlobS7C/r5jcQaS9QXFceUj5GBTZhPQQKsMtXZqxL8
	mG2PSOz8zkStKV8zg6SqHp5WE9koqZ8kj+IAjGFhRAF3b0vUz4xh+CQLEZ9iy9zmRZznqsl4Xre
	xGQTfClnwYA9EegPcN7QF4AYBYHazSbZL
X-Received: by 2002:a17:903:1249:b0:290:9934:fd04 with SMTP id d9443c01a7336-294cb4f2ff4mr39101485ad.28.1761655056928;
        Tue, 28 Oct 2025 05:37:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAZgHhxzDexQDBRyUSfiT/26LH8xsFk+GPIEhyz87W5I8sZgDI57uvMcXyG/B24K8RaqV4Ag==
X-Received: by 2002:a17:903:1249:b0:290:9934:fd04 with SMTP id d9443c01a7336-294cb4f2ff4mr39101175ad.28.1761655056359;
        Tue, 28 Oct 2025 05:37:36 -0700 (PDT)
Received: from [10.204.100.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d47ffesm118301755ad.87.2025.10.28.05.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:37:35 -0700 (PDT)
Message-ID: <90902474-0e93-cce4-0024-9481c6f305f0@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 18:07:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] media: qcom: iris: Add sanity check for stop streaming
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251027-iris_add_sanity_check-v3-1-232ad24d75d3@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251027-iris_add_sanity_check-v3-1-232ad24d75d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwNiBTYWx0ZWRfX/F0ZM1zwFckE
 hTd5LU2zMUaiqhv2RNa31LI4/tnMWlk5g20wmUxmEBD6IboUqCpCTFgM+rG8URrvDxB4p8vYvy8
 JK1AGo0SoWwOZiB+ANdLx+zoM4o+BTTNNkywYZ6ZJsQXrQrLPknwimWuN94CLhKGqtbAevl4AFK
 9IOLT0JxwjpFV6rQEXqyPkbB+45ih3VlJUahiB7pWSvP7UnZ01ZOfTxP1hGEuNU8/85MqW5T201
 uShysCIQpwUboDUvg3aBCQFlNEK6hYveGTCxRcHZsofuNoFRI917C2TLC1+VbGW892NG4ixSZNJ
 okjaKXtzeXgehOmOwmnw0KxnocIfBMU3M4A+yCdq+MkXC5h61tOS0g868TACg3xpAb+s9ESr5kk
 zyRDN5iOvIO5xTEHtAnDvqTOHuQkcw==
X-Authority-Analysis: v=2.4 cv=Jub8bc4C c=1 sm=1 tr=0 ts=6900b911 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=N8j6xNqZg-U2LBr-iOcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xqSzIKMHIYZFB7AK2PCZkWiNPWY4L3H3
X-Proofpoint-ORIG-GUID: xqSzIKMHIYZFB7AK2PCZkWiNPWY4L3H3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280106


On 10/27/2025 3:05 PM, Wangao Wang wrote:
> Add sanity check in iris_vb2_stop_streaming. If inst->state is
> already IRIS_INST_ERROR, we should skip the stream_off operation
> because it would still send packets to the firmware.
> 
> In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
> session_close is executed, which will kfree(inst_hfi_gen2->packet).
> If stop_streaming is called afterward, it will cause a crash.
> 
> Fixes: 11712ce70f8e5 ("media: iris: implement vb2 streaming ops")
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

