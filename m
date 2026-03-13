Return-Path: <linux-media+bounces-55574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMG0Kjyys2lYZwAAu9opvQ
	(envelope-from <linux-media+bounces-55574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:44:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B7F27E47B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B1AD30B18CF
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 06:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB143630A3;
	Fri, 13 Mar 2026 06:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzAYHGRZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7N0gHl4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8173559C0
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773383160; cv=none; b=bc8DPATQG3xiJHvjZmy6jwysCNQgcI3CQ8JkpRPArxTUIXvySGIYcEuCD+dGKmGr6mGrL6My8CaZvm1/sLoKVOh8qBwRoAS+QJAi4/nbDUT/RYzTh+rBnJb+ssfzjfzpy4q+nEQ4NAK2cIkxPIP6oGurQaG6TRsJoeGlVRC4Xy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773383160; c=relaxed/simple;
	bh=LsbQsg0o/+uDgkVPtQ5kP8cvfnTO/453nfFRkXq0zIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+qU1ERo4lvAocCUSGrpF1NvOE6YgENQ+FhsB8DTfaIKcPraIyJyAPEPnr/wT1hHDGWQH36xS2IR0grfoVZndrrCpAKqnSTg3wj0K5t7R8Q7kZinwTi4KtBWjwBq4VZH/JH03ri7OHtKXI+zzdZ18lf46rR9DB+o685ZpAYIpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzAYHGRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7N0gHl4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5thMl2018170
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J59aA9PzxumPe/s2A3PdOgoNUlWrn3JKmp1cHUzeeTE=; b=SzAYHGRZ7MgcibbS
	4+hRradh64QO9PHno6MNJl2J7Qx4tjRXRdpGwEPykxA+lQoPbGsvsBpNxEbASSoS
	b/4PSo8f47eyI6lGvH7xp7OeiyaGaSxKzk+qOSG5SreRLTpywSDhs7qoecqlW2zN
	e5Rjs6vX6/zs46ieGod5LaCFszXULkiP/p5bIb1QDwH6uUFIszkbFbsn+2UnsRhX
	iexjRZmIQLmALD4uUj9JjwA6Kc/adDG/FSdh0hibzbQ1FainfZZcM6NlMu1MDWGL
	2/xflsOr9b3ku3HU+D/jbumUVjtt1sDSGIyZOp2BmwrRz6vsnbRj5I5vzw9k0il4
	eyTMZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wvst1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:25:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090bc4823cso79911611cf.3
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 23:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773383157; x=1773987957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J59aA9PzxumPe/s2A3PdOgoNUlWrn3JKmp1cHUzeeTE=;
        b=B7N0gHl41QSWxkkQdGiYNV/amhlyGM6U/Faw6KOy3PvW11HrHMldmZvFjscEylv2oD
         DOajBt01Xpty436BCjlrEvm/rROEjWMt+4gqGYyAcnkiVnnnFZQ319wkVkTJhjOnAwdo
         PSAgHHpl7OOBraV8PAhFcltSXZpSoP0aYftEawe1yPVa9tsyWdoyL6Z4uxFBWRCLXV1D
         0NhPsJ2sU52OmwmpAHhUOh+0iy140EgCynIc5wsFhtN7S3RhnFp6CI2Q+II2MShjzfa8
         xS+O9JHC7LfIU8WH9PvYdr1pmzBiyMHDe9HvsfVSfxwhPFyOxVL5w94gElc6CmyyDam+
         w+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383157; x=1773987957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J59aA9PzxumPe/s2A3PdOgoNUlWrn3JKmp1cHUzeeTE=;
        b=pDTgCiesFReuXM+iE9wACFZUBL4c9sVlnTKNPK3PjUjyBU4XDMPmnzVZD/0IcGzrqu
         Xb6216VU0ANR/6rkOffBkDsBOVLSmWfh9+StPrEGtgBEmOAle5/XoKYMuH4SXUNjUW0m
         ZqWCync53kgbSpS4dNDCn84qgiViUFMtmh/tv5gw2TpzSbgmpUckZ6oZGquWjftYXcw1
         xCpQp834Uyid6sKWEbvF61YTCpzNXSFO1uBOl4swMQvyvAEvpk7t6Wn2P94hGa597RlZ
         nfLxBkkF7075BAkp7hIHUpFIB86/7hZKe3GQ5f3owbsxGvMIqfnYOjylNjn1lriS3U1o
         Ua8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBKzRAx3EgS7SJfLIXSkksaMYEZXqmTq88AIoJzbscbIyKr4d5Jja1AMl9Vt5UhhZzTRiuimwds5lbVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRYlVpgPTxaMZX4/NFZXfbXQ9RwzeVhpBDouseZYWp9hDwubDv
	Pb/hvluP06haQfkc3GyaVMd0HfC3KRBlBs1fa31NVIgHhVwDX2ksIBrOQojXIXLbYamyS08HX50
	nbAjGv0tTizv0AsJckplJ7PpGUhIEbqN6o/Lek6mtMvMD8A24kEzC1kJ1j3Q2Ys5FJA==
X-Gm-Gg: ATEYQzwrM2vEIcdF5upF5STWTIAtYjd8xHAsiojAf706iouMU8vxvPgtHmxaevTdN07
	bHlSZNtYA00wtwUxSPHV3haZOmIeXPJzkqlQU/UgxitHZBBxyStrjlWB7sstinqMYSHr8gACq67
	P6+XofTsKK1WadPFPfZbEBckB6PEcv0/UlDdpZtgXdm4qrp1nR8JagaMbG/yVb6uXes5vPysHvJ
	BpOJrd0rTnTjKrkqX4zcFgFx/K1EkkAbQHl0gelO9m/WgQ6PhYcbcUQsi/5v3MzZxVxD+Dtjr6i
	pixF1kAzuv8tW91vcAiMxvHrxlVGszwXTdJrMX2KFTw8/MgT6dbnmD9Wjtum6wrIxMpYeUxPp1i
	sW1QEXmEDNWEhozC+wOWoN/OtHjbMjEHhQU9NPYYbdK479RyGFX4Lzwho/5SozrcdCI8LCyfVzv
	wi/Iqv3Cw=
X-Received: by 2002:a05:622a:5f05:b0:509:5dd4:7189 with SMTP id d75a77b69052e-5095dd47afemr4619641cf.72.1773383157283;
        Thu, 12 Mar 2026 23:25:57 -0700 (PDT)
X-Received: by 2002:a05:622a:5f05:b0:509:5dd4:7189 with SMTP id d75a77b69052e-5095dd47afemr4619531cf.72.1773383156901;
        Thu, 12 Mar 2026 23:25:56 -0700 (PDT)
Received: from [10.111.173.3] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50939ec56d0sm53996621cf.11.2026.03.12.23.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:25:56 -0700 (PDT)
Message-ID: <661dae21-4eba-4989-8c3c-434dffbb8db4@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:25:51 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260313-camss_tpg-v9-0-b9095de6525b@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260313-camss_tpg-v9-0-b9095de6525b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b3adf6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=PsBzL59aWVzs1BVZSRgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BS8Ee2Hu_g029NOVm63YBY5gRo8MokGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA0OSBTYWx0ZWRfX3vFsSrTA8siY
 lYLEgiEB4tu0hVDttfSYebcBuTTI15A+Agmp7iyG1D2z5n/tK+kNdEx6JL6YqWV83IugQdsMFlk
 dBQmUqC6AU9pfxNbGsFLOcbD1RWRN/Vk8fPVn8OfrVIdEjlP4fF49jId4anIx2/uQEy7wCFeoVY
 yPqyB5I6ANOD/hT+slfHweDXB52hFVN6BHwDyucDxIJBC9yThF+kkfQ7IIO8RZzxmIFQ8jQnYEH
 Wg3cTLIAlYej3rCMgXUcZQDpK4RH0rVYg21+LpSv14aFgJAHJPMWS9hQaTEEzsrbckTR+gLETJj
 0mUvj8QVTonqmD6R6Ka4QZpV2rQWiAxA8ALdcG/yeLILqLWb4OU0QqFY4WJriBGkPRSZdDprrtu
 Y2sBpZBsYV88P6nbqEndXxHs88zWTU1D0yRAR6qgJRR5R2wWGeTs55orbl2W1PeixQmDglqnxtS
 mGhcYGvuVzc5iDaLGtQ==
X-Proofpoint-ORIG-GUID: BS8Ee2Hu_g029NOVm63YBY5gRo8MokGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-55574-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7B7F27E47B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 2:15 PM, Wenmeng Liu wrote:
> - media-ctl --reset
> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - v4l2-ctl -d /dev/v4l-subdev1 -c test_pattern=9
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
>    --capture=7

tpg only have pad0, typo:
media-ctl -l '"msm_tpg0":0->"msm_csid0":0[1]'


