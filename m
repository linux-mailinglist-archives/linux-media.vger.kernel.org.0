Return-Path: <linux-media+bounces-44795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB3CBE6751
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 07:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38B741A62BD1
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 05:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAB530DEA4;
	Fri, 17 Oct 2025 05:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx1e8HAF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB422173D
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760679836; cv=none; b=Arws0YtBC03p8reUe3rManCM1qK+SGZ/H8V/7V9NCePxqSVDnVn34pcj7cEwmeFTDO9eUtNU20RZb0oKA/+MOoXTFisWsKh3ifVS+vx3Tn8Xa+txRg2fEQ7Dm2DkeKSp5+XL2WfqAqdKvmafKSQGtc6TA9Gnp1KivLKfSrYst08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760679836; c=relaxed/simple;
	bh=fnigGc0tuE0Cu8RTpydT8F42NNAM0ID7srvItgLzc48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMX7O6nJJ9++LLfJj8GjWmCYLsPJCs6VQplJs/WsRRYOF4aEkrN6eu4hrLznMDf8TTG8B0wSb8eRA+zfi26fBuUEdWyZOn3eSXNPJfbePVcVZ1AT3zdxX2xVucC6khr6gALWqiKvmfYWzE3mmOeRVksMpnLAUfK5S9X3bv8n1NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx1e8HAF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLLMu006080
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3HNTZG61tyGQ354XRaFA4/AZERq12Hf2Z0ImUJ6OR0=; b=hx1e8HAFCx6uBYMg
	m7yR/nOd6c5lUCIGDTJ0wQwmY4zNQIH+jhhRsPuKHhke7Btk23+h2C4KZIARnDIT
	vjfxB27/rRtgNc2pX5Ty6od64uwMfT6YYKCJDQhwo5GDdbRlCCRjX23knDnq2bG5
	9tu5/vcfOSsb7k7n3I2aI19dCdwgmIRXHwB54AA+wYmBKklY+hGO1VAeeYG9wR6N
	WMPzMDBTsSg8zTOn4JjWrKl9Ct86vrzXNe3qqHMQAWsJnx5DcOc69aVMnveA8uK1
	gcKAblYccMr/rXB82ylAO2rj74A5VSLl4v5Y1EOmnU1dmhj35/NXBJmEq0WED4Zt
	KXTEyg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwwagg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:43:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so1323913a91.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 22:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760679833; x=1761284633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3HNTZG61tyGQ354XRaFA4/AZERq12Hf2Z0ImUJ6OR0=;
        b=UgGvrvg9CW7yEexjgWnfvITq0p1e+MLVULs1mjW2DcLCUMx73awWCxpVtS99XK7w5u
         JP4fNC9QJb3iO4uXI9Ao35hpheltIfaya8NfymPLq8CRIZHS9Tb5hWznWwyGRvlp/qYY
         jkiGukPNMqrLT3TzFClCRkp44aO5TI7JcUHzr3zu7llD9ltsdNzFB3eCFW2/F2BGxBtx
         1wsZY+upllxPYElpAda979Q6ZCtdZJqUkG+Gea6SgwMd3NKBZYzYFqgREOi/R++Ki2/E
         qCqI4JEjcjUnCUBWlV/7GQYYpokLrj5Qve3wpyw4yRkJardgHnm0ZelQl8Gsh01vyFCn
         IZfQ==
X-Gm-Message-State: AOJu0YzjrzMWxv/OTslkCQklKVccOEEmqHd7UVYhLg2MiE0ttY1kf2V9
	0ekk0nMkZDIl7vMqHrzdzk0Yy5uiFGfPp2iedN1dX89lzxG3NJEvxqmc1Derr0qTdmWzbvfu+m0
	tlieA5aAGTc2q+wA0XFpbnQ+x2Me5E7IE4dtU2VmkqOrbnWSZc7tQ44xDO9gpRFwo6nsXP0u8KA
	==
X-Gm-Gg: ASbGncufzk1ul8ZfyTa8q3BulMCmuHkWrdHodBnMq14wdCMill1Qcrl0agswOeF8JY1
	vtry/dxyaBOe73eUssFXe+YeCZU6bWQAJy+FoVv4F1P2gkin3w7UKerlLpW4mCm3M2/UuMRHPnR
	8rppsPEiSFkyrce2zz83iKbts8Jb637fl0UIEEQsTwj5OX/6WMiczCbWGL6vi9Fry6jBb1vVXw1
	fKMyGSTdxzUqJB1QR2Z1tyswU4mps2PnA949Jo7WPCvaULpX9XwPumYcFUi2oPqhakXGOnF//kk
	2CXAyYJmjLmeg4DuTtbCqpnKFlpDQrwAG9agHIipR3+CZ8ptF8EfUq/y7tHaXT1uwc+gkk4MF6d
	yrmEk4mvKChmu27FbWJXIChUYFjvqaWIa2+OZkgS9O2A5cE/nJyRM45xV0R9Gm7QDJqQMUg==
X-Received: by 2002:a17:90b:3f10:b0:32d:17ce:49de with SMTP id 98e67ed59e1d1-33bcf85130bmr3076492a91.4.1760679833252;
        Thu, 16 Oct 2025 22:43:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkKGplr1e0FIgqAkn9VUk4CK1gCDjmZzv4MNeOLxFkbKA9yNA7SDpBEBqH4wd5+MQPSwf8Sw==
X-Received: by 2002:a17:90b:3f10:b0:32d:17ce:49de with SMTP id 98e67ed59e1d1-33bcf85130bmr3076461a91.4.1760679832877;
        Thu, 16 Oct 2025 22:43:52 -0700 (PDT)
Received: from [10.249.28.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd7b3da16sm1465311a91.18.2025.10.16.22.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 22:43:52 -0700 (PDT)
Message-ID: <49032ce7-a954-49d2-ad73-305e154aeca6@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 13:43:45 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] media: qcom: iris: Add support for scale and
 improve format alignment
To: Bryan O'Donoghue <bod@kernel.org>, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
 <1pcfuFRPOvlbfcSRFpaPmuhVvjNGodlAA-7UuSbGcqo5JUEv5bhYSaVjnriJNG4fpngOAgeasXFZDGVWzX3ZOg==@protonmail.internalid>
 <20251015092708.3703-2-wangao.wang@oss.qualcomm.com>
 <a1edafeb-af41-4c96-8c39-a327528e0802@kernel.org>
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <a1edafeb-af41-4c96-8c39-a327528e0802@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXyqYMpbUeYov3
 eoAnc5rxRqdbHKGUwrz79nSiYJdpMkc0ySnviKe80HQR/LC34nbgBlZMfWtUGPsH28l98y8KvBb
 PuviErmG+Y6N6H7QpXHViqzvBGLa93e396pNLz9+wcoKNFZ1+lYXHp+q+wpC/AUUFAMiU6xGT5S
 laKT/QcH8WdROVsz4OsvskD5aOmUZxrLfEJQXRm749iV5R3UOftWxAL9fkuf1pcVbdXfOIWhKEp
 Ldi3NJlhlvUxq/z3KEj+Vm/c4699TmmpVWMIALEMx0Kxwr/mqKcZAXLVbn7hn6gpF9CaEdDnHSD
 laaBQKmyBzvuNBkuFtx6VV2ZYLWOZvWc+9dKDQv+mOpI+IBINK0AqmfTxpJoffpwgpFv++c4yaM
 /OhvJYyuR+DJ55JY62SAPlsB+UZM9Q==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f1d79a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yaWMp7WbkpMwZxctSSYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: EOVXKfWmRXyFnb7Nfl2FMR_cg2DB98Rn
X-Proofpoint-ORIG-GUID: EOVXKfWmRXyFnb7Nfl2FMR_cg2DB98Rn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On 10/16/2025 12:00 AM, Bryan O'Donoghue wrote:
> 
> Generally a patch that contains and "and" could be split into two patches.
> 
> Please do that here.
> 
> - One patch for your alignment changes
> - One patch to support scaling
> 
> in whatever order is more logical.

Sure, will update in v2.
-- 
Best Regards,
Wangao


