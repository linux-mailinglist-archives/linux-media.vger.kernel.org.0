Return-Path: <linux-media+bounces-59025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Eb7FLlM4mnx4QAAu9opvQ
	(envelope-from <linux-media+bounces-59025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:07:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31741C607
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 512A7309A858
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 15:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394273B8D7B;
	Fri, 17 Apr 2026 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfko1gwp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrU/saTh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954522D2397
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438203; cv=none; b=HywxGsPxTZeG08R0B2ko4O262krgsuBqS1XkwJGZRmsIR6Q9m4YdppuGrsJvWtUhgKCrVCSym+Z7jPzBFsO9njVKDc6DDTHIoah1fGREkc5xd0QNgbcC1qxLmS5qVnPfR/Hy+lUZUX1H7TqjGmzc6jXfRU+OcCye53m6kS6Osac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438203; c=relaxed/simple;
	bh=9R8L9pnEC6/7D0qx0eTa9FTB2bGqiw8EzNmDTrkkM7o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n3SuVz0ehB4UKug9YuD1O2jbooIl1ck1DbCcMj+oTCJqUWAM6EpL8iAM7brtyhbNYnOguIzzFIxG3W9fUf05p0tlF5zv4wW33WokGNGCdG4zbBUtZ+crfT7sf+bOG4C3gZQ6l/gYBhSUtNCM9j8p15Ubxc9uSIClmITBjMFLcnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfko1gwp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrU/saTh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HEa6g9066451
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFw7s4390u02QSe6dzeniTny7yN1q34Z7uu2sNp1DC0=; b=kfko1gwpf+VtV+3y
	64tEFrq5mtt10P0ADLXlvcmSqCRLBHXDt5ACIPGiZqG363Aa2d3tR0FL+ddm5wqR
	Q6C5mhhPzWZhrDMP8mOfRMnDoqQsA2mXo82Vm5Ra+5/zzrV2ay/HyYoRc6p3v8K3
	9kFca3ckIk1XGNCpolG6evdGkhD3TWwXQK8oFmQANbRblJRihxgsNTmELr4z2559
	QGLH78DHintV/ntlLW9ma9A9jivkmwcbjz6UOLeAb81zdFUOVQzFeoCErffAGXOT
	mXpUWuZSX6OaXnU6m4Z1y6gfhvQthi9E/GiG0ju4zEE3HEX4dgPm/L6ELsSvaUOE
	C++vhQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk3af4844-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:03:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so8399165ad.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776438201; x=1777043001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFw7s4390u02QSe6dzeniTny7yN1q34Z7uu2sNp1DC0=;
        b=MrU/saThKCbhmzQsL2DU47W+jWseE3xhk7pOJlf9InzAA2edDtHpcB7lgRDBUw0nSZ
         o3wXtk/hLImo2pS5tOuwyYfGtgE+2Y5KfX/OmB+I2Tn8qtGHmpWRLzdlpR43CEmzB+qF
         PClcljGr5SpdUBuTooC7Y93XjuUbvw45mK1AR6Dvh0lNHIRhyWnwhMpM/QMyyZ9P9Z5t
         jLk0lnkr3iV6DsZP47JT4JxoqbwX0tisZtNm7JAJNino3DtJgpCEV01vrsstir4MVNL8
         rg5dY9OkzpSg1DqUMyye1oxZ6TvAm69S/5+1XQCp1Kee/ArmZL7I6LQlboSaopPIof70
         gfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438201; x=1777043001;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFw7s4390u02QSe6dzeniTny7yN1q34Z7uu2sNp1DC0=;
        b=CgmlJByQEbSk5Rs4r2guCo0HvvHsRyenKHXBKw5Vn3msScSIwatsGRf0lNoJ7SWCnG
         /wYgtQSb+J9yC3Olasd8Gv+3VRC7x1S+/Efop4LS0+U/RG65nQO8tvPnPkP776W7wAng
         xhWb9GvalJBVZxjkDWhbW0pvu0Y3uF+NjN5J6ur8iUUdZ0KG5Sr1fPVo0JNlT/mJGMKL
         UoDb+1TDeE7VbYFnmOmZMCh+/tdwbJabeAaEFbM94f3GmajahJASiNkebWapqMe8WNS8
         89Hz6oF/gq5se2TV0hlyUP4UE7aMcBAo1IfwSAg+MkCcYsf/OfAeoNNbbeR2QfxaOZOY
         mOwg==
X-Forwarded-Encrypted: i=1; AFNElJ/gsWN1LLWm1Rq+Rk8hRVhLcDYbzwZkh2s9vQ/cTz2NiS2FPrsAiaOxlpdla9uwN+e7v3D7yIStJy5LvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEKv6bRvxDj0OiBniCobJ+BAcZX3lvkcSOxGd5zt9k8dTyLLEy
	gZPbAbVo3MGSqQfQiRQh0T/gSvtG9ElJ1rtrzb5VbHSWvgNpYe5RcV3eIDo1wXaQ7pGGP6zzSwf
	8vWlU3nZsxEtyht59coTsy+zd80adnjp4h7ET/nnLJddies2+DmaZyD9IUuQFbX9Wqg==
X-Gm-Gg: AeBDietOdZeJ4z2s3Ld68IQVt6Z49Mr+sGCnNSW52Qy1PaxWn6cxQGDV8Do/LJqYYHa
	xUSNEr90R8d3J6Lb/l3dJU09MKHCnPuWPDb3OrwKQA5j63d99Juj+wfpZGAIfCyRWIamM1raWQX
	gZaZiil7fVwwHFPy9e+F31CKp8sP/aJHdaMHS8DsRvg1ZcdX+GiVCeQ+TmXgdSA1FkXGXgT3P67
	UBHTIQRNHmx/A2DL6REwYlw9OZaMMW/nmVqoXR/N7zYWx5vHaWhC3Sd/B40uQqXUUPfmeaUltKB
	yK2v9U2jIZXTvUgD8/7YyVI8Nd9b4bojigsHRv0pRPCR2Gi2SA82k6Oxn4O3iXo1Y95s3ruJf9G
	Ti/lpA6YNQy3hrrsdu6dLQ3amsIw5n2lYh4Gi46IAMAl3u0uUvxO29682iuBUOyMu
X-Received: by 2002:a17:902:988a:b0:2b4:689a:e420 with SMTP id d9443c01a7336-2b5f9e7a9c1mr22893255ad.8.1776438201011;
        Fri, 17 Apr 2026 08:03:21 -0700 (PDT)
X-Received: by 2002:a17:902:988a:b0:2b4:689a:e420 with SMTP id d9443c01a7336-2b5f9e7a9c1mr22892455ad.8.1776438200160;
        Fri, 17 Apr 2026 08:03:20 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa507cbsm23809775ad.37.2026.04.17.08.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:03:19 -0700 (PDT)
Message-ID: <9d97d9c8-29ef-3419-464c-2db642759d39@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:33:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 03/11] media: iris: Add context bank hooks for platform
 specific initialization
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
 <3vuensoscjzsjuh7c5e3jff5cej66iwboiau7vhnpvtmqevexf@ouox5cize3fn>
Content-Language: en-US
In-Reply-To: <3vuensoscjzsjuh7c5e3jff5cej66iwboiau7vhnpvtmqevexf@ouox5cize3fn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1MSBTYWx0ZWRfXyyaCBHqA0XVm
 B9+tJZNMR2XK5WHqDfFhCrgRf2vRLuBtWv0fEKEhPiCW4ZTpxtTtDOwm+FHcUfwh9tWYbe90DkE
 +aTHJY9Lb3yWSc0DA8DsmF68fFxw0jM+TQDs/ARleLBrdW1fExF3z5xfElXWHZrZ6YzuxHHzQwe
 Ik1ei6RmLUIchND83BkQBmJChUUEQULlRNzszf45vjW97mM7Aueor4f6/qug57F9k3i9FNCdDFX
 PzUbv9sHzn/cG+psML1AhGVTOlpHFsjckOe3VtBjzXpXw41v8o9AKK5tAEwkcb0pMCXo1TxtR02
 sE4newptovq4LOI74K5Y1XNhH0VPkDQrsDJZb5kYIs43/JfST8YiP6hkY+CfYrm2OYO5VwP+CqO
 8I7jlPFusg59OlcPou7VgcqQnS5D358U6ICxz+DdRMOGlaRNQtJISfbK04FQbbEarXd/nqbnymY
 8FwiEQhQDRc3j8Ypd2Q==
X-Proofpoint-ORIG-GUID: gwFvkPqhZjI_ONY5OeNaYOUChb1iZ-qg
X-Proofpoint-GUID: gwFvkPqhZjI_ONY5OeNaYOUChb1iZ-qg
X-Authority-Analysis: v=2.4 cv=DfInbPtW c=1 sm=1 tr=0 ts=69e24bb9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Gxg087mSlOwoK-wMwRkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170151
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
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59025-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA31741C607
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 8:46 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 10:29:59AM +0530, Vishnu Reddy wrote:
>> Add init and deinit hooks in the platform data for context bank setup.
>> These hooks allow platform specific code to initialize and tear down
>> context banks.
>>
>> The Glymur platform requires a dedicated firmware context bank device
>> which is mapped to the firmware stream ID to load the firmware.
> Change the order of paragraphs. You should start with the definition of
> the problem rather than putting the cart before the horse and starting
> from the solution.
Ack.

Thanks,
Vishnu Reddy.

>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>>   drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
>>   2 files changed, 24 insertions(+), 1 deletion(-)
>>

