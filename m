Return-Path: <linux-media+bounces-56307-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACILGRrDu2n1ngIAu9opvQ
	(envelope-from <linux-media+bounces-56307-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:34:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553A2C8BF6
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F234730B31A4
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0843B3C1F;
	Thu, 19 Mar 2026 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="equf/blw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aa9F//f8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E53B0AD6
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911239; cv=none; b=bu0nwAy1v/AVknqa4zNyeY7bq+BUYqnhthP82meIO/i5WiAr5ycJNLl/lkMc8wKPqyvBULmEMEoVodF0kzpT+pFNkXr4KhXSs2JUwCq1FrAS6d2frePe0EQU2Irq3i8Efk4k4KPUqDM4uNRypPa24ldRq628mxVAQo45EjpRTJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911239; c=relaxed/simple;
	bh=phJe4cOiYkLMs+xPLqGKhHIyzrPV/SU0j8J2JM1JPXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d29/fzZ/c/YOrnqo7i2lxX57skWRD4VS/W+m9x/kjkqrdOh2U1o4tUK0b/Z/i2597CY5LsTBW6lU7NUUfvXjUrjvVQcKyX4OziRyNvLFvDR/v5SD2QCv/EH0qnEPIiagSqXs2KvaBnhxUjVZsjWvgduobUC+DjxU+9UGY2w3i0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=equf/blw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aa9F//f8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740fC2883726
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZD1cRHOfX6I58ti9hUBFh6NzbgdnGh0D9rATqcSJrR0=; b=equf/blwTPRxgN21
	n4ndgXbU5m4YKa11RRzJgLWd1CmOJVyim8hjcvCd+dvX4Cd/4izN+UYnMOV/gOaF
	pPErKz7kpxaA9dzrqw8SbbPH2SqG4kaTXzq8wA8iwIcgT5zCgXM4KhhDnAEXchyo
	JaU2iLb0KGuInl0aKbXigyvIoF4LzTdjcs39AOIb1Jz9YYuFXyyzgn7tjiURLtn0
	qtah6sLJ58P/WPoeA+X3ENSZ2E0kv4uhRszEEYaMDJTepb5NUt63UQ/L5oiuDfGD
	a7c4eC5rvdOEK2ckGBhQDgfzdy7v7Q4uryt3Te4s2/Uncj0TIES9WockfvFi5VAK
	WE3Q3A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyuuuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:07:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b061868724so57685675ad.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 02:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911236; x=1774516036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZD1cRHOfX6I58ti9hUBFh6NzbgdnGh0D9rATqcSJrR0=;
        b=aa9F//f8SXTute7fMN3B6sraO5f7YR9JGMIQKYa7k4XHTzo3GphQcNrmyIbvZgU9wB
         zB2/gypih4+5adoeCGS4PCPy1Fv0OqdEBudMAKplP87DQ2tLTQQCA5b+IVAK46NGJJM+
         ohxtOrO9LDP1i8k+fTxBBSkNQhrSOmgUCn0bJR+tq5YQQJucgH6fqXRgCQ5wHvOcMTLT
         ZinV7f1MySdV3dqXj6KEeJyJflMIEzUHiO0BjE9fIQpMJRKBgA5YEnu7YomuSC7LU7va
         Vt29B7cFOD9qv2eYcPW+hWYMGbVJTy04tNr/tRdEB9SdXUhw8SlQaEisU2/XhG9UNuCs
         MF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911236; x=1774516036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZD1cRHOfX6I58ti9hUBFh6NzbgdnGh0D9rATqcSJrR0=;
        b=FaBU3w1ziUQWVxAoBt9GLYuITRlodnov0TqBpGEFQ+5w/Irudf1zsWNxCyA83fQ/Uu
         e/zH28CmLzQWU/OfAUq+HViRKufxp3k23/PNfywGUmt7xdTJdt0Yvwkfm7Al0Wa6hB63
         I46puYgix5rMPUzOxQcfHnDUA8BOwXsmx/noT+cWsHoOiNz7n2Phx7HISYontEcNMo3E
         QOo1uDoPoFpJSmpXt51HhzantPr3uHHEX/t/cM1qUF52pegFNnGxIY+SXkDbio/H1M7c
         FcfWVQ8UJwjDGnvawXwVJ1qfOPmltonES/GHRPbBTFqAtADNF7mrXwW1kQpMvuQxhEIK
         gEGg==
X-Gm-Message-State: AOJu0YxSei9Jjn8SvL7XoLjW32MUYUJ5psTg5ejZ22g48VF3iLBNuTBm
	QB/CMFd6Z0lklGJA3diNhCEWmtqY3lZsSWw5tAayMQajd8GEbM02S5rPkwr9vZCY2w1UVTsjRZY
	coehUsp9xGDedaFyFgjlbM4IUppsQugQTqftiJc7tvFqs0ewASdT6bhqZsBxvfKYWpQ==
X-Gm-Gg: ATEYQzyywLyPJqi2RVzzKTx8GepcZYELQR41Gxjuvb6SahOQSNhNd/FGQsahf7cFPnC
	Mjm0t3PT+0p5CDTVGsPirCE4TtOy+Lhl4LcaSG8ZVdNc4jvCDSHkSzeNYen20ZXZLorpJvCSnw0
	A+lycr+aebMjft8nyimXcw07KGx54oIBDjSIEtFFIAytRha0c/u9QIGFhzKtwe4vUbg/miAVVg9
	KpOj2dOuvaRTBlI1JjiBfBDhx9CX9b5SqKiqwpO8FhPF+D8s3FNdOCLKe8GyqhBVy7VaCJqzFwz
	PR/Ro/x/YjbRixLe7x8PZJBNEfNfsHLIRALZOuZcnbqPupdYJAwuxlukwA9YwpZ+RE2CgSAa1fo
	J0RVQ1Nbas4fiAzXm1+KbnFvzPTcCTcEKVXMdgbcGw90npckDl3Nkm9Y=
X-Received: by 2002:a17:902:da90:b0:2b0:6e8f:8e9e with SMTP id d9443c01a7336-2b06e8f9399mr68692845ad.20.1773911236441;
        Thu, 19 Mar 2026 02:07:16 -0700 (PDT)
X-Received: by 2002:a17:902:da90:b0:2b0:6e8f:8e9e with SMTP id d9443c01a7336-2b06e8f9399mr68692505ad.20.1773911235957;
        Thu, 19 Mar 2026 02:07:15 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.254.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5ef42asm63996555ad.40.2026.03.19.02.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:07:15 -0700 (PDT)
Message-ID: <9a60ba48-f9f2-4998-a73c-162809651b63@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 14:37:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/11] media: qcom: iris: use new firmware name for
 SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-10-55a9566ebf60@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-10-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W9aZuaTU8B19qqJ0gS5nHxhxkiD6w3k-
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bbbcc5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=vmayvKaVtNuonzR42S3udg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ygpMJMYJU6yCGMAIxH0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MiBTYWx0ZWRfX72gU+YuNEcl7
 EZCbmxhqrme/XGmvTqxFxR6LFjPmNBR1lm4Ffa50QeYentOrrrOY+ip4J1+yeEhW6MMhGJG56ti
 YAn1pYqt5zOhzusOT3x0ghioySLFppCWsc3w+xGsXL2CCsaRbuyUo2bhb3DjvWB/VHULUz4xYcB
 lqAe6FgjCsJDdKQHGj987a6gIO3EOTio7yIYpR2gWagQc93ZRgdqmsUzAFCNVTfT8tPeyw78iKI
 AYVzvlxYp4YWpvGCSlk4wd/mdsMLCQBAqxYSrbqEkopjOYCskLCTYoo3WxOx2J2bYLXr7Xsts8g
 03UUPMJbgy0Zu2j7/+F7m2q3lgtL4M9knXLznKCj4n2jZa1dAj26o+Sp4VrZYt2Qp+WiNukoW+2
 JXTc0TxcZocvkrz8Xw86odsczeCRT06w+3wE+XpYCqqtBfMQyGuT6owkeXG7Vcl3f113g9oVXy7
 qc5VLXWsznNmSyz/afQ==
X-Proofpoint-ORIG-GUID: W9aZuaTU8B19qqJ0gS5nHxhxkiD6w3k-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56307-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6553A2C8BF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
> since August of 2024. Stop using the legacy firmware name
> (vpu-1.0/venus.mbn) and switch to the standard firmware name schema.
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

