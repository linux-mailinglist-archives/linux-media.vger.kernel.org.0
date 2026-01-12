Return-Path: <linux-media+bounces-50384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D84BD106A4
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 04:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C490302A941
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 03:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C3A307492;
	Mon, 12 Jan 2026 03:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itTJ8ncR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DN+kpY0m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB669303CAF
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768187268; cv=none; b=AMs+XuWUpi1mXwZ8XtFB/hbseuoIhCXwtnbXIG1QJxVkQKy4/3gnIgk2ANJ4D21Ndc8jkq4NOgrwW67X4eOooS/Bu1OAaG1MSwdYUy+3Ptt2ky67AAAqhQN4TbinS9HVVr5iPC/+5wZmFWbdspT8KaWqCVygUoedmaFBPFdI4/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768187268; c=relaxed/simple;
	bh=xIWxF8qqcTSw5yf5KjNsxJ+3DWBHl5QbBXmqPKxqAPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGV1yEWd4+HKYJb3VGhnSpqfBeMw8TuDWl/7b0J89Apzpq+qnp6nXM5Lnti0qcOiFdFnOuQpZMJs81C2Z6iMfufPwPD8W1Ij3t48JmNPCbtR9/m4mv0tGnLPXxedY5HvTT70WjKHJT5mMhWjO8da9MJo97TtTGfDVU0pHesNan4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itTJ8ncR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DN+kpY0m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNcgmj3286906
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/++Xx/yBXksYUFw+xHC/+ucGThZ3NK28ihDy9joDCww=; b=itTJ8ncRIEe/TEhU
	dkFkltjxY5ratlnXCL9IMQA0MXAT8AtQl2PfJ8SE+xS5bHiltosJXGGHv3+u6qR+
	NMVhJ1eojn9zzqlmXMP4tNG9b1uTt6jOlvEjOWKLU/sCiN+sJlP1Jpfx5WMX4HHY
	wM2ERD4M1DldtrwOIf8RfU5Lgjl6HVoIITNTOqvl2BPtJgG27h1U0a6twRt+YLpH
	saHSav8cRn1TdvTKBZZGbducIJ//PoCW+/Hax4C1NHWJwz4lp3xgYSdzbJJU0E+j
	R0pXDIEvXqItDCHXZX4J4J+Ci73b/Ol9wOZ9TA8sqwoSLVL8sOSzGiEIkbaOtUZF
	Y0Sqxg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntujqkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:07:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2ea47fa5so147620706d6.0
        for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 19:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768187265; x=1768792065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/++Xx/yBXksYUFw+xHC/+ucGThZ3NK28ihDy9joDCww=;
        b=DN+kpY0meJZhj9mAEDmz9OKp9cZSBluF7aBQwdXSGLIbY3kdLTssF4h8tQjU2p38PL
         apvcRy/gEzDvS02Oa0kfqAcz45ZGSOvx4YX15MiX/d24pUVO4+GyJysj1gmX/qkGt3B+
         VI7kEvEKiT608kuHqF07QsxgctXM3TvAVgjLJd16NDYNc5HR+5xseapfsf1C6H6DZUd5
         rlPUsC2GnSecZe84sBHjZQIEN/AIDlFJvWyiLA+ZMYSWXI/OXHnm/g3ZwxU/bo1XZ5y+
         8AIsLJfV3w5Y2KiVGx/Tw+mrB1o6V3dYgf8X1px1ri2zeT7Rk9jLv4LE80XAiaN3DEon
         W6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768187265; x=1768792065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/++Xx/yBXksYUFw+xHC/+ucGThZ3NK28ihDy9joDCww=;
        b=Y5uhNHDHZkSkXuogU5IzIBOCEBDu50PhYR3CzfjCXj0EAWR493G6lbjOV/0RaSBAP7
         V9gMNHW3TiDYSmgGdts1Y2s1x1bQNe36ojZXFpeTldqZ1wxPzU0pVbATngRCbD6B/5v9
         aMRGSlz4I9PJxD4x59nnPbNqP2I5KtE2tWcxbh1FmYDUsN8rF7BdXfrPPlexI4CLekS2
         ig5uDZumgDO2Ia5XnfVPNabVgq1U4M1Wy6cXaWQXNCl7ug4C71qMxPG88zvPAE91PQYs
         7F6Cbd+tPCr9+i9JBU+f+L4GH7C79pdNHEcqOxTVVKZoD150nWX3rzbyKZn7zncD4Z/P
         JyVg==
X-Gm-Message-State: AOJu0YzbRG0kS6g1ctv5/0sk1v+x95ivL1dHsN4657arw30VtgmBN/hZ
	GuF+PYBF49xvtYqKnBLVIOZtw6aLp3lTINIuxhrjNhoO2t42sAfQAEPEPkW0+062Sm2+67+ust3
	x/UdeuFvjxC2F4/P0Ik5XkxPC3+7jPGNScoWJrOV+hCD1y0EPUVTdPbwRo4sEsZJkDQ==
X-Gm-Gg: AY/fxX6GLkX+0SqQoU/DFw7WYUErPOixzQ0DqUaUghc3xC8zzK10ahb1vjjnEmAyO4b
	4qzpB8eW06tDUqbZwlZefuQrFuYLtqg4uuuxUCff0V2kDyZRMif4apuf2H4oPsLc10uhglo84V8
	b2Ewa4Pc+/p+GGUXVQJ8VwGiR1GUV0FTT7nfOfe1bQpXueN4X7fIhtsQLQyrq97z35YVQJFIXDC
	kcQrL5+TBUYDZk1MF08/1DEF2g2TWoCzx7vkZfHyOpBGayKpn9/rwxDdvlEaBoMe0JebRr47BI7
	moZ27b1a9hbAHVBwgY4kGMeDvLfgkKHgsjhrH+1TonSrwQNM+ii2+LaD2O9gksbTFT9+QT+X99Y
	v0Vn+3kpKPQws1jhJtU/cCudfr8q3DshfhFdcZ1k+Rv76RHHiTm41k9MMsAMRd2ihz6PhqlZ8
X-Received: by 2002:a05:6214:1c8a:b0:88a:355a:8d1f with SMTP id 6a1803df08f44-8907698fdd8mr308487636d6.8.1768187265180;
        Sun, 11 Jan 2026 19:07:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSEm5v201oW1/gAgQSazQnh4dS2BuTWE/iCazimW9e8H5+77G0//8vkZ3LsEjiZmN59LgYIg==
X-Received: by 2002:a05:6214:1c8a:b0:88a:355a:8d1f with SMTP id 6a1803df08f44-8907698fdd8mr308487496d6.8.1768187264809;
        Sun, 11 Jan 2026 19:07:44 -0800 (PST)
Received: from [10.111.167.32] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077234405sm142792606d6.30.2026.01.11.19.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 19:07:44 -0800 (PST)
Message-ID: <1344ad43-a4c4-4e37-ae4e-eddd2c577b3f@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:07:39 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: imx412: wait for NVM read (T7) before
 programming mode registers
To: Bryan O'Donoghue <bod@kernel.org>, sakari.ailus@linux.intel.com,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tjF2Z2nt6dR-T_d-5cSpzZqItgoMsUzNmUBQ-jucG9SMQ9Q4y9cCrW4aya-hRJR0dQG-q63OBmZajTWMbxfeUA==@protonmail.internalid>
 <20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com>
 <dc68db73-163e-4443-b334-31e2ae529e99@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <dc68db73-163e-4443-b334-31e2ae529e99@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNCBTYWx0ZWRfX8xegz8LIkKfU
 nuYqZ8cHpsOaqUcrjjb4AGpGHpag5zn4H8XpOtGG0Dqcfdm1/Ac6JnpQcgwPp9GoqCWwGee8KF6
 x9ICkEwO1kcSmG0fhuVWrOoMnpwtFh9a/1U3fELk6o9r2VZLtl47oaitzQbPcHZBTtqnZpe3cOB
 tOwjphOWQjRH5puQKSSxr4ZZwpcsp238FJjoJ0PSgOZghDwtbejfX04S6xjRjN0mC0j7POiFbjf
 fghiCFEzI0AOeJAJD2vfFjpbX/ZzUaKxPeMoTIIhSzmmcc6ycnj5c94aD0fAApm1Yg6zzXpFT70
 DLyfqvbhPAzoCy+VxTXmbZX13ysEOiijPuCI3WVwBr5bHbz6V8zcGJBgt4rWGjHpW1oPQ3f8T2j
 +CYZHi0U1c486kMO56OYDHn4uXjO0WvyCpnkv61hdtBXFBCJrL5GUlEEVdhRYIo98hPK9NbgJg8
 +rF6aA6evI4/c8sB8+A==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=69646582 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=1tItfX1d1ggIHMnC-N4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 5JpXbUPJsQNUteiyQGlBdtJwiPKo1-Bt
X-Proofpoint-GUID: 5JpXbUPJsQNUteiyQGlBdtJwiPKo1-Bt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120024



On 1/9/2026 8:32 PM, Bryan O'Donoghue wrote:
> This delay should go at the end of the operation that requires the delay 
> not at the start of the streaming operation.
> 
> The delay after the stream write, should be related to the stream write 
> command, not the antecedent - the command that came before start_streaming.
> 
> Basically I think you need to put your delay into the CCI_ID read NVM 
> parameter load routine so that it guarantees its own completion.
> 
> Because for argument's sake if start_streaming() were not to be the 
> thing to happen after CCI_ID/NVM loading, the logic would no longer work.
> 
> And you need a Fixes: tag for this patch too.

Reading the sensor ID only occurs during the sensor probe process. After 
the probe is completed, the IMX577 will power down. When stream on 
occurs, the driver will power on again and then start streaming, but the 
sensor ID is not read during the stream on process.I have tested this 
change on imx577 modules of different models.

So this change can only happen during power on or stream on.

Hi Bryan, Sakari,
May I ask if you have any suggestions regarding this?


Thanks,
Wenmeng

