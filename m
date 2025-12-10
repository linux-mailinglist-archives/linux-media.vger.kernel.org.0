Return-Path: <linux-media+bounces-48533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4855CB2110
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 07:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5700F30D3318
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 06:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6220F2C0278;
	Wed, 10 Dec 2025 06:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENESRYdS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kV1b3B4O"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F2D2F656E
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 06:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765347794; cv=none; b=XH/h2YW3fm22wN0wmWKB7N6ZkTAwHUo+CaGsTb3vLlLbvOUvIp5lwIumH91MFz+qBzAGeXFluqTS8DrcTG6usGQZ03I61X9avxneGqWYF/J1prGzJGSXpYfak/YwlfciYZ7r8VxQ25yLecQ/l7JlvL81NADARMgfp1fTFHz4DHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765347794; c=relaxed/simple;
	bh=KshUgy5d0lXs2WTaSgxpD+0zvJhzbpqn0Iwqzjo5oQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erCOzQWxPR4lhI+nuvDxP8iRJWNVvQS3bDlBPXSwOQxmo0+YSWrGgg0U15SJSAnFZMbmuV3iOsiefh5vFxa5eNb1InSjs8etvwsAyhilMEhxIkA+arqZA5A8YIyR2nxbNe35r9FGU7R+zR1D6Nf0C7LoR3xrxER7qO6APDOT9Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENESRYdS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kV1b3B4O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6DvMZ1046570
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 06:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jV9m2DgughyhakGYAa0qNgzBkw/sBE90T2QUQ+XIiDk=; b=ENESRYdSiXNEOTBd
	mjqm49eOHo+EM65iHGzDSTvJn9Te0OaAH2LgaFy4d+r2ihsdfiK1/2IhW0LI8RLK
	iQKFUl7nMHYHmicZnkxFyelICrwZ+SJSSfZfW8J6R4B/6Zmqd7amtD7nefdQhrfB
	fwYSf7clT06UGyW+oeuZydr8FY1HnlH5TJhGT/uDwY6uu9AH6yV70133cbO1qVNM
	5oYzrlJmRdbIE+dE7yykRUuuJFIZrHBDkqCkTFF4H3DJiB9xY9JrjsVRxSRPLci2
	uGklgN3IAhQPejbcEpflBJ1pqdyAwytRNqEBpD8E7CLEEUvWpewrJ+W+yjkE7F8G
	KaSw7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axwbf17pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 06:23:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956cdcdc17so70137645ad.3
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 22:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765347792; x=1765952592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jV9m2DgughyhakGYAa0qNgzBkw/sBE90T2QUQ+XIiDk=;
        b=kV1b3B4OMKuBu/Y3uGPBPyia5CAD/XIRMtKxRGLP81PgezJWP0HGOCVQmA+W1fGzOp
         xvAxtrDun4vw2jz8x0QAjeMbueZQ/N/YaZ9hnUBfFk6UD6om4+xFg1PIct/5JPORbNt2
         Wptu0KzWxHtY9vNF56n9AVFiZAOc/F7GRl1Cw78T89hqVUJV86hoPniNC2C2SS4L1Yh3
         1+wS6GCJ0VggQuB/0UpnnvdQhhpt3V85zg0rxZykexMi8Oen5xd5MZTcWGzdnB9jQl2H
         QW2MpXm9f1RI7JJyM7EFdLFJWpnLMcUcnK5RboTzTd4wJCwZOFqnsxnvVUHEywG6y+PV
         dzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765347792; x=1765952592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jV9m2DgughyhakGYAa0qNgzBkw/sBE90T2QUQ+XIiDk=;
        b=LOsYctMhA+cVFaA+L5Uc87Y2U4oqaqA+withcDkqom5ByMssUWdogmqM5DjFTggkMs
         xzKOHNSjD5QCvMI6NGDue9vF6PQ6ERugWPJp4mmVxNdXBnZGonOVUmrKDjKOAlQcEQk4
         SBy2i93N68yWQvxyby3lKLflPu9rYgXEhgjkRflZWC5jKhGxNK/ssbKwfKsJEKJXh+0Y
         DUv/R0+efT8a2TEi9YCpwI2v/sgB9XTlGLcN5AVoH41BVVcTSJq8YOAE56oRJX8n/62d
         bG0IBWKjZrK4b5zZRyR7NkpKOgPnPMmCYBez5PSRUCq+g4E41FurQ1QcFjlb+y6NDXei
         x1kA==
X-Gm-Message-State: AOJu0Yy5tGzXhYfF3Nzu5BeRQRraL6yI9rdE0UpdTpQm+fB/pKa6nKQe
	8VTzoMr//yAmg6E3iw748NosEGYrxM9j2SZs1kdZmrEF7q/aXNvzBd93oyXAwuLdBNMh1HvKkbu
	L23M94u7nGAGAYW6+shhbQ0WOL8m+cyRMAd8ay2jHRacbnDOVzGmAmothvZRV99vA4g==
X-Gm-Gg: AY/fxX4sylg40TL66jCU+p+1vWT88cyVmquB0j4s2RlNMyOvHTMAGXDguxEQIJq1vnY
	g/8QEk0cePuTCKHPXko2ExorfUrUa3EnvGzUkTkPEne/zrC3/7PpHNSUKcwjY7Dx1jTcbnz5Zkw
	aXqa103aAKwwEUn6NTdtdfgfUD3dbIyNgs6d2xTMevgaIsn2i0G9gA/44vySSE/Vtuq3MsKt7bv
	OrRyr8oDsR+7zerBawyLaCg0+JR90IfbWpOvUlPPUsHvs7HlKy9t+MTOB84OE1IRyJObBUirqxu
	92R51IyKDxrf4nGrcHtnibScHpBbCz/4Ipov/ncQOn/c1vBgIMgm7S/bHmrrAl83UlacPYtVPQ/
	qPjJuBxxy59c/1yxS0+qQ+Ibb9ca9CSomPL19kxvCIw==
X-Received: by 2002:a17:903:3508:b0:27d:c542:fe25 with SMTP id d9443c01a7336-29ec2d6fdb6mr11316825ad.41.1765347791913;
        Tue, 09 Dec 2025 22:23:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvM4IwNHrM97R2/FYKkNJGb0vlU8TIrlQbRy+8cA3XEWXE6yBkxLChH0cpZHrwYFHrHhhY0A==
X-Received: by 2002:a17:903:3508:b0:27d:c542:fe25 with SMTP id d9443c01a7336-29ec2d6fdb6mr11316675ad.41.1765347791363;
        Tue, 09 Dec 2025 22:23:11 -0800 (PST)
Received: from [10.204.100.70] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf968sm174496635ad.34.2025.12.09.22.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 22:23:10 -0800 (PST)
Message-ID: <0c7314a6-960a-4ab6-9238-3a1ddeaf6949@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 11:53:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/5] Enable support for AV1 stateful decoder
To: Bryan O'Donoghue <bod@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
References: <XWtaMcg7lGClZ4pwr8czLvqGdhEXidF54raCx36v4Rahfsker2E__wKY0i87ff9Os9OAZxAepPTDFO00wvXLlg==@protonmail.internalid>
 <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
 <611c84b8-e982-419c-9d58-284319b226e0@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <611c84b8-e982-419c-9d58-284319b226e0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eNXT6aXYTCJA5e3RQUfoC--HxmO1rJPV
X-Proofpoint-ORIG-GUID: eNXT6aXYTCJA5e3RQUfoC--HxmO1rJPV
X-Authority-Analysis: v=2.4 cv=f/dFxeyM c=1 sm=1 tr=0 ts=693911d0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wZqRJUKcRvhJrFRvfkEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1MiBTYWx0ZWRfX2LoXnR4xJ0SN
 67M7nLky2Jn490TvHZF8BUYl+iLbfFmDqUqUAEm0519WILOE4sN9fwVkGh+5LAvca4JGmK1Qle2
 3dSNho62DABiMDYdUKCQTLhpNK5yC3UbBr0/LCTtcW82xRDBU7xspWNLXEaEeqrvgzycY3Vzznn
 gmrxUlIbe8NS4mO3dty7GmG0ifzomhJznfx1CNR+FaU1qBHt1kUR0wX4F1E5th/OFw+Dt/fHkDD
 5048UPk8H9bwboavvcKDXpnBBLKJIHt8E4IF0vhPWKxaGYv+kX5hYFsROVuF7hNCvCQv5lpa36C
 E5yKE+zcQBU8E61FojXyPDvyMGpAD6jtHvSbow18ERlUiMvc7W059zCLMc2qpSmfOr3kfK44HOM
 1RWvKHmmsf+KyNupB6gDkwvYEMa8rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100052


On 12/10/2025 6:11 AM, Bryan O'Donoghue wrote:
> On 10/12/2025 00:39, Deepa Guthyappa Madivalara wrote:
>> - Add inst_iris_fmts tp all the platforms in gen2 (Wangao)
> 
> Is this part tested or just added ?
> 

This is tested on lemans, monaco, sm8550, kaanapali, sm8250/sc7280 (NA, 
as AV1d is not supported by hardware).

Regards,
Vikash

