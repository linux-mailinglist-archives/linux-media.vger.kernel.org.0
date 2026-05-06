Return-Path: <linux-media+bounces-60634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLlwAjpW+2n+ZQMAu9opvQ
	(envelope-from <linux-media+bounces-60634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:54:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9F84DCAEF
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46795306B377
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 14:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5989480325;
	Wed,  6 May 2026 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfTmOtAX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2rSghIt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5A2423176
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078580; cv=none; b=ZkbSOAsrQObJl1D9dtFg9jcOIhAVweOSywin0xGMLOq2kjX7IBlhUQ+4Pe7mosTYJeyr9AXjtWkxDQ8PZcv8Ci91dF6QKdtyJWkR/h2StxgbaoiJQfXsgzYoas9nlonmvq0dLzLffwYxGInw2PmwTdJjXuB5bIGk2bQDFbr/1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078580; c=relaxed/simple;
	bh=7xdBxUBZ3lcN5J3YExFEy/pYiR+GDtAc2KfJFebVAlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+QEf4n7LSej30SbPo8n6dSD3yZlWvl4z0Qq3CeQJGmcWsXXlcfEuVecwd+K4DgbeacJ+A9RtgmfoFYvj5CAlhcMAtjUMAjcyjtKUKUmBwNAfyQIo+0KCYzQOfz61Cud+OEKMmXW4IWWZ2viP1wlFPPRIjVjYau2XqRTdg4weOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfTmOtAX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2rSghIt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A4gu03524221
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 14:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyV+NsfUbKRpPF/fp/3F8J5Jj8lRx18O6qDLkdl/xpI=; b=MfTmOtAXC8Ic6Ykf
	j/xClSdgcYtwkN36SXrm2olPyJXKIZLSnsmA9P5iWHLYpe8gkgC13UvDJIuxJFbp
	kgXjegjKGXC5kvB140BaMj60aJJKMFuh78B13koLPviQVa2vt7mry3XXR758Mdvp
	Fj9lE2HNta44qz/tmYA8q2wSEiAFzpanxa5NMGaHKTxPAp0FLh9BwORGhPnqFK1C
	1wLtNXzlHfGchTvr/0ybbO203pV5FFvTIBG7zB5qSLAekfsIBDVosacQnvWYNu/w
	RQnHmW5O8V3dR4zsVXwuRun0J9ILKY/VIxDrkEOI4docvkI7h4+YEja2C+BuHxYa
	7hVw8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jws0c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 14:42:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4654f9bb6so67186075ad.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778078573; x=1778683373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyV+NsfUbKRpPF/fp/3F8J5Jj8lRx18O6qDLkdl/xpI=;
        b=K2rSghItutNm6GufN7Of5HLOnYdiXzY0WBwAHPhX9MpUFrx65MKSX0E0cpCRvjKKPn
         aQXjDVRqpcyoj1JvH88P7OwuztAuUfhAyShWOFfRJgJCuItuu8WrF3+zdnT2klQfwZtV
         5wnFAXbPVDaRqd9DGaUVM5AjXdAP48+/KFLHvdPjGZFcOl/Up/e6U/yi/t29FeCKzMyo
         hu38Bdx49Y+GcSNUW2t9m/KW69H2kTZ8bllmcCD2fOiYZMKVNNdpuudVCwdFon7yTrUZ
         GKzIXL9BntddYySXg+84yZk6Bz+BToVSC8WdprmYsVBEltXp9dbHzoHO2+GsOJEfYuN/
         1BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078573; x=1778683373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyV+NsfUbKRpPF/fp/3F8J5Jj8lRx18O6qDLkdl/xpI=;
        b=DCLbUNFsA6XroYbml78oMAKxfYYZQK2H2Ldv6240LqUUePNgQnQIt2TJooWfFd7vMI
         AJIt6NYK8Jgi3kqMKIJCHjbMgkivGVWzA8pwarJKHyWSeJH+ddNPyTamvciHWkycGWNM
         8RK7P4+ZotkQX3FsOpvqXM0uT6HT7ROKvphhuq1F9LQuV8cPKOk1WYTKd7W1RZzmfuPJ
         mv9sNvaUXs1Q6e2rleW2g88bWRJsG5JRftO9svT0BzZS0NdcbFjQoSK4Uh1V3WZMmRgm
         JtM5fOHv6hh1NJ3rgVf+JbXKZH7HmJbuYe08bNoZZ0Li4DKl+3B03FnkF49H3S3jiVnU
         xWAQ==
X-Gm-Message-State: AOJu0Yx8f7KTJRpkWzQe8HcdHVh0FCpcXWjZ50q/bMF/0Lr754Oe+FS+
	UTU5k3vHOzsJVTE0LCxqDqFRxtff6yIT30IuG+hRfo3m/CGnahfPrCeszux58JCa7QUAXHBfi3k
	+YuAbJ6T/gT3ibkfhqkYNenO6vOpcUopjhzWgFcymCjqcmetR2ZDn7Kv3j2kg/jLGXQ==
X-Gm-Gg: AeBDiet8mGt/HWj80YEfBTUdaAFK8zLYi5oG6lt7f9g34C7zLHRUEF4Nthqy3B2gozl
	1baBrHbtyzPSVLtEjxu9FuAwgBdFaEtlrtFQd1pXzaAA0KxVDhG58bU6JOT96lmT5BbDtY2b1l1
	dAilcgdJHmYlUUBsrWuosv6JnAUanUbChi3PWzOBsS3a+H6b+ESIsUPZLLy46x0Du8SVNPNCkRG
	zmP1vV6K7/LoM8Y0QzH9TAMt/DFp8GMObXEv110ooU6iHXmgzrmbJyIqthEK0PICAF1MF9xNkQ4
	QvZ0zhzrpzHyfYEmWcVBsnsubi1EqormPsw4kfHF/qRpM1SgnbtNyKcZPH3qbfDjQF8VTtKsFtY
	uy+ZqXtQ5zFuGsQrEUV3lVGKN5AR60C6WrdjETMKHL0Fx1r2G21hkiWxBqBwY3ZqW
X-Received: by 2002:a17:903:187:b0:2b9:fb9a:1103 with SMTP id d9443c01a7336-2ba79ad08e6mr40451815ad.38.1778078573426;
        Wed, 06 May 2026 07:42:53 -0700 (PDT)
X-Received: by 2002:a17:903:187:b0:2b9:fb9a:1103 with SMTP id d9443c01a7336-2ba79ad08e6mr40451375ad.38.1778078572916;
        Wed, 06 May 2026 07:42:52 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7bf2c6c1sm27899755ad.21.2026.05.06.07.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:42:52 -0700 (PDT)
Message-ID: <b24018b8-8c28-42fc-82da-7b26d3175ed6@oss.qualcomm.com>
Date: Wed, 6 May 2026 20:12:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] media: iris: Rename clock and power domain
 macros to use vcodec prefix
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-8-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-8-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4CaKgnS c=1 sm=1 tr=0 ts=69fb536e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XbLICjIVyITgExBpphIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0NSBTYWx0ZWRfX327849HRKzyE
 LNv0aLymdSuIbD/5QU8JQSv3GDAayEHS354RoNY9H9lBRrkkPqFwaFEB9OW6UIPr9Vq9pItkOE1
 TU4f6IekOMeY8s/iewgt0qxmheK6pOtTBVpc1gmarbr+jtHd3nRNOPsgdNZxQMYhaK60vMS2K5W
 +HmhdwclfuFvfuVgymybR2VViDsac0NoNb9SSQRseI0jTVI/p3qee4vbFearRwokl8j3PPd2API
 oHo8pEacocF78vbmptibXJvgJhf4j2IRPFxgsEEu9cjKudEgslDnsK8APtffHzD+BhI1LEkS2uW
 CWNiZ+u6Xg1Mh9qm/eHe5BF8lxxrg6MYSYt8KdGuctavC3pjNI6b8GLsNEjaXW0uJtRly7aRzZr
 flNS6f9IVDCwmGDMd1uY06PrXOvXmpovC46GWXrwsnFgWZT014eAoKK/qZicBKHfkVnKmGGV5zR
 oXvHjpHE5jelXoXLZzQ==
X-Proofpoint-GUID: NzCRd1Mq_gu0qQHY4AyhFyosZ82b0yL-
X-Proofpoint-ORIG-GUID: NzCRd1Mq_gu0qQHY4AyhFyosZ82b0yL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060145
X-Rspamd-Queue-Id: 4C9F84DCAEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60634-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> The current clock and power domain enum names are too generic. Rename
> them with a vcodec prefix to make the names more meaningful and to easily
> accommodate vcodec1 enums for the secondary core for glymur platform.
> 
> No functional changes intended.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

