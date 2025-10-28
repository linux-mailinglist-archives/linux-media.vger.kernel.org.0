Return-Path: <linux-media+bounces-45826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 424B1C14A7D
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 13:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D7D94FD208
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CC932E135;
	Tue, 28 Oct 2025 12:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RM751rUr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF562D9795
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761655001; cv=none; b=SNOLxKcqgHy3is4TiWFRaeV/guZN7Uekqhm9YIfx2i8bqhOTChC56KzWLFoQF/AMmfLkp/NrU9vNc55qhoe80PrNstymwCkaCRmIyktkE77jjB7V6poB66tMwZyB7Ekv6iJfrA9/Ye2l8YpALtEChh/+ZAI5gvz/zpS7GnWzwKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761655001; c=relaxed/simple;
	bh=FLfcye51sFnGBYEcyuAIBEV/z7O6KUMGBmdbRlBXsto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZsOq00Cv1mTA3wsi3gu3ic6NQy0oH8Ysq1WBNfxL0IL9I3vYQ8Sp7nEOdpdWF1VveScw6km2ckgLivu6vCiq1Z4AyJTqri1ClwQYC1w0TGCeY4bNU4ejKeG1hhfo9nmMLW3FP3Sn/B6y/dlbhYz2C6GLYrZGGI7utby5ykFe58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RM751rUr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SB4Nsw552425
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvaxdhK6o/XoM8ZzALCqs4Bk7cLM9dlvXJsxb+O4/+w=; b=RM751rUrwy3pxkX7
	Thq5nGcytUwunM3u8KZizz56ll+jhWuAillm5db+W2UECSr4FgkDYMuexPG1kgNR
	zITkuMiuVJXJ/L3vO6+VGT82Fs63WnitqnhrGv/v9SelleiJPZ+9mubJJVOGb6w/
	6iM8VwQo9/38b1N6cnBV0Ob03tD2C3AgHwG4N+Iqjq3lIus4PbVsRNOL/rsDfFcu
	YE0n3oYx32G2FojjixUKRoOjYBkfl0VYCK18VGi/jhG8lO8gaTolclE3g3AHEZBL
	lA61l1+X6k6nsS/NhXmMjqphZzWKfYAyJ+sk07SN/Jp83/gnv/MU+CvpD14D5bRK
	0L4hqw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pjf9df5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 12:36:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-277f0ea6fbaso70160995ad.0
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 05:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761654998; x=1762259798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvaxdhK6o/XoM8ZzALCqs4Bk7cLM9dlvXJsxb+O4/+w=;
        b=gwAAH7rMyUPgZ23oPTZREUQQNLVkku8hFUBZ1+LRmSvaC17CihGe/kcvdg/j4u5qRr
         a9E10qy1lzGrGlos5sPmkdz7A1M6OJHGOtaulkQm5hLsZ5w8JMZ7F6/1tIkS5R0PUSyf
         BdCJF7iUBi2VNU0qUiIymA/plzz0Y80cpEJbmaqXdzqyhBaAFVnNZaXaFUZp1NemdjC1
         +X2vQ5095Ynd/t8UTj0gASBaJCtQfC6FY+x1DuyVk4iCW3dN4wzeO3pP9WeearSFDIMf
         sV9CBQf0IqJXL5KZ1+QUJu88yER6J2usXLIu9qILF9BfZkHu9PaULB52f3eSFwA6WZy1
         vGJA==
X-Forwarded-Encrypted: i=1; AJvYcCX55pd/mb6ATDJSrx+32S0Fxyen7J+jINrtzI4shwuNTqFdxBaMX8WZtYQbeEk8tMGchKYeGUsQjrxx9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhDmGjBT24alkYJmGit1dPI+XNnjtz/rDjFxUTDz3icRmAdcEw
	2yKEpvFVN1FmHkYqc3qauOMgzASIsvahMAIiCQYfrVm36dnqiHgELe87GHNrsCWyOU2ORgmX3Dz
	vSm/+S6uWzxq9tYTId/klPi9x6dic7qUFs/3xuaD1yuq7NoeRcBvTL70PA9Uqvd97Mw==
X-Gm-Gg: ASbGncvesCmD7aeGfvnLSrZVl18RHd9B5Q9ZhjKkp37yj4tV+9sVEwDRSh7zEVEOWA4
	jNdZAy0MOK/fKGgTpkCWEZ+Qd6TJalfqldaMW3tljYz2FvxCxwM5FMJgYE12L1Rkz+nAWE38AQt
	byk0Jc0H9Zr+4PywitxKGnzxlqG26eH+9L7E8mTpb4QnmQ/fDRhVgprpTf22ws9Oi1wX7052nMZ
	giqN1CwwkJTYOZYwywy5mvbZVOK2sBEjpykl7rbZd1tmKOVQxXkvtp55T1THMK0P7Nrri4j7IM7
	tTDkRH7qMgBOr0n+Zue48DCqVLvwMnS72bICkURSB5p8PQPUjgyAkv/QYmbVkIiJHPwQN6yM21r
	aDXUFlrOqOtQCEfAihqcSSAWDvJPBqX6m
X-Received: by 2002:a17:902:d48e:b0:290:c902:759 with SMTP id d9443c01a7336-294cb68834emr39140125ad.51.1761654997001;
        Tue, 28 Oct 2025 05:36:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH602JtsdGlIpxmGIxTcXnfxZHUapmzZkM7OuWAMADDs9uW0/ImWEVIt9erQ9yiVzq0baBf+Q==
X-Received: by 2002:a17:902:d48e:b0:290:c902:759 with SMTP id d9443c01a7336-294cb68834emr39139765ad.51.1761654996545;
        Tue, 28 Oct 2025 05:36:36 -0700 (PDT)
Received: from [10.204.100.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34024246f86sm3768571a91.0.2025.10.28.05.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:36:35 -0700 (PDT)
Message-ID: <9f82ed4b-4bca-d990-22ad-b75492aec36b@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 18:06:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: venus: drop bogus probe deferrals
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan ODonoghue <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251017055809.8037-1-johan@kernel.org>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251017055809.8037-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ut9u9uwB c=1 sm=1 tr=0 ts=6900b8d7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mla-0liI9X_7Yk9rKOoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwNiBTYWx0ZWRfX7pEpDjMKb4g/
 RMOo8rB7a28KqG5avBNy6GG3NnyhSRi4je3oc4d58pqTCyJpyFci2Ch+qlOqHJfjLsvWN2k1Jje
 R17y5GjFwQu8gE24T7VtdU2l4vlylcWMtLaDlBaQ3dcQgTkXlX/lXMjfy7IIJli6M8Ih81VfRQJ
 2ABiBYbW7h/sPRd1X0WmSk594DCSOolDrI1dzHeFoiToUTCBWgMAozWmA2daWOLE86D6q4dX+kI
 QBq1siUDXnaxL6NY7qeLH2dD260LKkiMW4Q8TsyNQMdWMVgTu1Fyo82a4HeAj0R+d8UMj2gqbCI
 IRcMk8ol2bx2HF+0na7B5AMcbo2MQNsMAWYO0mYx80VNhrY6cJhsKfsQx/Eko+AmwYeS8cmB/QW
 p5PRzuQiCMkQ8m9R7U7FR27Nnw3TKg==
X-Proofpoint-GUID: qx75lq0EWGaWbvi1d3UtKOgMRDaWFJyG
X-Proofpoint-ORIG-GUID: qx75lq0EWGaWbvi1d3UtKOgMRDaWFJyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280106


On 10/17/2025 11:28 AM, Johan Hovold wrote:
> The encoder and decoder platform devices are registered by the venus
> driver as children of the venus device, but even if someone were to mess
> this up no amount of probe deferring is going to conjure up a parent.
> 
> Relatedly, the venus driver sets its driver data before registering the
> child devices and if this ever breaks we want to learn about it by
> failing probe.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

