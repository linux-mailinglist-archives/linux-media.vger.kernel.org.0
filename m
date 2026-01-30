Return-Path: <linux-media+bounces-51824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI5hGnqpfGnuOAIAu9opvQ
	(envelope-from <linux-media+bounces-51824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:52:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C74B6BAB90
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39E88304CA7E
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9679037F0F1;
	Fri, 30 Jan 2026 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgh/ySsu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/D3TUrz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE96537F0F3
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777366; cv=none; b=H0XgEXx8Tubl1ZDHekwOd2Wk80x7woEqXVmyKO4+WZ+Okp25jql5yUgmFbvL91QWDTxiTdBsrtzg/LvEitbthhErkLWv4oXKQDiyJeOUGu5X4rhztLx0MSE5QqLSVVBLExdr/ptKuQ2yczhfWtewf18x3wg0jWgQMiYjygcDjR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777366; c=relaxed/simple;
	bh=K+iBHGVfK1+Z96SDFvc/aRLaNcnv+Zzn7na8mPRopKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAH2ZHzreph1GQCu+v2vRhEab7pFJ6qkf9jirvXpCfqCSExk4Vz1AfpVManDJYRVH4PNubxLfvysmDCSoMJkOu4Bh87HUPhjH48pC/rCUa+VJ28Fb3+d+DRG/+oChKdBskTMIq9EEI0RCOox/URS/PY9bRcaCStLCH/iptbUqGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgh/ySsu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/D3TUrz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAwA3v1488294
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoR9Gqm/yFZjJ8eRAFItY0g4nyGdiEiUyHMrr9c4s8Q=; b=hgh/ySsuSv/wARBY
	5BjEzvP7KChP33QndGEej+gDSH33SLEKMfuWI5EftQQUFIRwFuAENV9wdfCn4+ZL
	ZNGHzDlH0WlOAiQLKhQvlzPHR2+2VCv25J2/SJ3Tt2+WEaJdNGThAN3IhRIba01Z
	3Ersb1iVg1tORqhfFuhgl3TqBPl906b9UAj3kt3pbCCw5sOf9RCOmbCbscpMKdIJ
	4HCcFSZmmGkt843ZFndD/hlbqCgCuDgOvI30VEm2FHRi4uquiECLjIVrkEIh76vE
	AkwrO/1iPOcTEUAL+E/IHENSrZZdFKFAEymJ6FCmkQrGGzMWU8lxVbzeGnreT2fD
	V7siUA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bp3u74a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:49:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a863be8508so29289985ad.2
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769777363; x=1770382163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoR9Gqm/yFZjJ8eRAFItY0g4nyGdiEiUyHMrr9c4s8Q=;
        b=B/D3TUrz3OjrhIMPAKeJJ89SrMoVLeozIqKccFYjDBUQw8eh/cVi+rlUBkHNSLs6N4
         jZRNCaO8kP2F8AjEVVhnwCDTYGODFSl4+x0ok31VPz8Jv8M70Z4c23+q7FozfPgELrQ9
         7WeBjS5EeFILr17eSR4O1HmbE/QGBgJ043nHsF406BjhuF0diQz19VamMKNA8YawK/S3
         9SI3xzjgYKt9FeZDI68nxNTYQdKJVo5Pfn7i4E/0oS/pcg5+L3bg1x1feehO6z98q4hq
         L6OQSABOI//bJc5aMdVMT0Oxo86VqQtiQy6aoI6aHeE5iZp63SIks6odHHkC1vws7nfH
         0abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777363; x=1770382163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoR9Gqm/yFZjJ8eRAFItY0g4nyGdiEiUyHMrr9c4s8Q=;
        b=HIau5pcsCyPzJrXWXIliTtTcfiDmFzTaYhBdO6l5uB0/IziHJ8SD8yMtp1nk37gj3L
         buvK586uDvfhNxpc6H1WBTxL95A3P9bdQYc2iVxzKWcr0Q/kaI+HdCINi/iIVmTrX5dz
         jfO8Ox2fNUqxRLbYOb9KgzvAKp8IJ+Hbo5BtmuP3YJVGsNGHz5dY5VOEthYnCkfIEwyE
         T1XJHbTCvP5fmN+F2URkNWcKKPzyvLkfa4+/hmy2w4abBqBo7kIzuPujqv70dm7Ucqq0
         VDd3ehPly8q7Fb6r2NK2cXSSeTFsWG7I7wixjOD4dy7VCQsei1723ByVuU6BLRky4XgD
         5uYg==
X-Gm-Message-State: AOJu0YzCkLl73tyrhajFeTOIvAZ+falCdVd0AYz/7vH7QaMWIMACDmfX
	DKa5VW39Vz3rAOcf4hzR37wZKOpNiIAxs4P/8vHmhPaCjGiqb7jFtQT72MrMmXRZhoro2Fm6Eso
	NlDnIXzmTyDzG6TbKVSGOuTnCp4OFUCjGfxj+HMvM64oYEmokBupf8zItxsvAxXfedzzHdluo8A
	==
X-Gm-Gg: AZuq6aK+qeQj7O66j0C5jv4/N1gxPAxT29mgSOTprB2MIHbJ6ijInDW/TR6QleKXtdT
	Jkcf0uC3yYF34ypcLw4R3Ss1h17i6ltVMSaI1ZfXmjtey+LauRZRLUkFA7kOqByIcrjIqD9VZd3
	QvJG58N4TRt5MsLCLHW6ZlNvdiBrF6RBC03iuGHDfs5UgWcu4ewtoqnXAiYn+LheleNpLuiN6z4
	yfSwjPAADae6+3FlOUUyLb2vmFrJwROZRVNbnQjmGaM2/myRRPILuagXuk3mOuqj8f7ySZQYWTJ
	S2alR9JY4v+0dxcxHffQVL8N+Z0YdybBHnc5C7esHDszX5QxfbqubBdwieIoqFxljnHkzipQCHM
	B7gMk/iK68M2U/M+5Nxr/5NMKCvtx0kaZJ9nHSG4=
X-Received: by 2002:a17:903:984:b0:2a1:3cd9:a739 with SMTP id d9443c01a7336-2a8d81667f8mr32460015ad.43.1769777363358;
        Fri, 30 Jan 2026 04:49:23 -0800 (PST)
X-Received: by 2002:a17:903:984:b0:2a1:3cd9:a739 with SMTP id d9443c01a7336-2a8d81667f8mr32459595ad.43.1769777362791;
        Fri, 30 Jan 2026 04:49:22 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b1esm73225085ad.63.2026.01.30.04.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:49:22 -0800 (PST)
Message-ID: <906e19fa-28cd-acc2-dec0-7833f672602b@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 18:19:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZYaNlU9nLc6avsCQdC35l2eGOlfTMFiX
X-Proofpoint-ORIG-GUID: ZYaNlU9nLc6avsCQdC35l2eGOlfTMFiX
X-Authority-Analysis: v=2.4 cv=d6T4CBjE c=1 sm=1 tr=0 ts=697ca8d4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=UFr-MfHxuXdlQTEX4dIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwNCBTYWx0ZWRfXxV670uGxTm5B
 fR38jvgvdRVbRh/AcmO8QNk9ebnLj7niHoq15EtPmDrKJ3YSILuF6BWOGD2/uw9UknGYXVfYS8A
 +cci1zsm1HIMkOWn63maA60uS2sZntT+wInatzv5LuMfAZc52k/LBLhN0Rh6oXHlj2xEWoTkm5c
 xCcV71+ekgyD9r7TTt1XcKK8cjMU+enRm6ZCBDG0lL01IXaaJhcWMgrim6beoWkFGjDb5AJNcN0
 0kh/mvjgx5ypB6LdAxroqf7halY3qyyF2ZeE7hKA9jPh3/s0d922xo+RBKU9sXZxwSpq9BudRJ8
 BSCMxr5og7sYhmd7qPK6+EWblL7NWI62BAcETeeX43prWVPGeboivoA/yi+q4qM0wzqZJ6Q5uTT
 ooCxgHw0InnZvAytVOTHUGE8JQv+wnrgU5vd9oboEZenLoiRgLpC/J66AuxrK3TEJGfhdo51QCn
 FN1jluACWNNd6xqsiVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51824-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C74B6BAB90
X-Rspamd-Action: no action



On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
> to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
> SC8280XP having just 2.

SC8280XP is also 4 Pipe.

Thanks,
Dikshita

