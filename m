Return-Path: <linux-media+bounces-60559-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOKrNWEL+2mbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60559-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:35:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 352124D8B03
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03E48307A38D
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 09:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E293E51E2;
	Wed,  6 May 2026 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBrBBIeE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPWDWuwt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72A73E9580
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059961; cv=none; b=ACp1pqTubZe9wsS1zCbxMMoT6XeTenSW2bWG35z7hxi60/BwrGkzr+cjpx1VKG+NBNud6XzorCKzvEOezE0l7KYI02TD8yUEvhVCKZ25+o9PvxqhBCubaLanihBY7X7A4YYpTd3EMkaY8pKMzQrTBE/j+/4WTOq8c8nZyFz9NxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059961; c=relaxed/simple;
	bh=f0FQAS1GD3dN9uwV8F5vKw0hNMRhc34lZFSrPLYTbjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7SNR1M8EA9lwSkMSVDuYm/KfMezQw918vGQzGAZX6okuFWi3yCg7p/maK6UFuuPdAW4Gw4c5CDzvalRfClzg838JSFfGQNQOmS4oO9MJAdXc9OHgBlG7JDD+IF5M+0cZvThuOiNnB8VEVYnwgRH19hnqa34sBmOdS8cKyMUSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBrBBIeE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPWDWuwt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466xTA41515371
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 09:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f0FQAS1GD3dN9uwV8F5vKw0hNMRhc34lZFSrPLYTbjE=; b=XBrBBIeErZn1ngc4
	lvmrsupECFO+P0Qp73xN2be0BwwzxheaW2Fu46M76lHtLISshYm23wjtootAwnPK
	UOVWOB9yOQ2RW2ZY/weXgpvw6ibGCTudakdq/bvOYr8GEYB2JwqoT+QC8tAkAXlC
	bpaSi6ROatTzs++iP0ttFRx8C0T57JpO19s+kfWH84kl/s72B5eKC8U7TkLjlry2
	A33z2hUctu0DyYso+8GyXpSG684Y1u8z0ns9vAirOT5q1mlQ09wIU6kg8ggkwIAf
	LAeneRU5rlXdcs7KLDaSg36lx0J46pE4O7I5bWnfZkr7E2hG6T/LHYEo71bo0GsQ
	Cki22w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e00v1rq5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 09:32:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so11390205a91.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 02:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778059958; x=1778664758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f0FQAS1GD3dN9uwV8F5vKw0hNMRhc34lZFSrPLYTbjE=;
        b=GPWDWuwtHZ7He3qQO76vtFpfJEEmgYhgvLGDj5WlEOfUJhRVt6tlyxF/o2i/j1odKS
         UOUkmTOi6dlf/Hr8GZB7ndspbWMWRPxss1eLCuRQMTLnySQnpMdIHkV65LXXluAAGUW+
         LW04u+2BggA6pxDoY/psgA7/s5wOZNGMRAHOWs1CmTWnzYZCmYcLxtFtjLK60wVYjq4l
         m28GP27IztN1JTAhEmAl83ChTS6Ng4g26EKrnSeyEJ2CJFA1DUGlPb5KQbJhz9pXqsk2
         jU7vrnh5g0oEcJW7UTeEibZq0m06ueDzXk1K8vR5KCOyrlp828iSsw6/CFtyzUfeuRi2
         Vr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059958; x=1778664758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0FQAS1GD3dN9uwV8F5vKw0hNMRhc34lZFSrPLYTbjE=;
        b=qQr9a+B1ZlcRZGS/SOyodT99wriBBwUGdK/bcqiJAo+P3b/GdbHxsDrlHLzy9CrpV4
         UjxCcmk74yC3XJeCM1xPa4zhLTDuQ6nZvUC7j11iNrHFBanOBhon6l1wNF/TxrTwOVFI
         RBjthhEUbt0gm5RXDd30Yqf5TCPJtytFro+/4MxZ11lZeWRv2Zeqj7b7G1EPONMDqQok
         lwpaFWcijteM0tZ4WvetpahnubQuQw3OpC4uzpvzWmlCTvfXDLcHDuWvNSkHhpEh8JIW
         jg1746ln2uWMUFxeoEN1/BD8nCwDuNbFzAd0UCZEOBBF2lTVtZq+e4uZ5gkqeONL3k94
         eEqA==
X-Forwarded-Encrypted: i=1; AFNElJ/6PQxM8FXXbvkQioXuJur/9s1gNQcR3GRkAL0E0n4FrA/5+HTF0R7AxpDU6W2FmwFBHN4oA9QZDjhlEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmFElOhEvZ13b8KaSk7kt/iP4JUpPrArRV2U0rJj63gej3S5sz
	W8xKndJUdCibYml6ZSotQSO3mBnSEhVQAWRcW5tAs+VbBQHmhdL62V8wYnrzb6NCvs7OuINLPLJ
	L7G7zWri4pjWsv6HfPEwfqPPKSm6+eE2/Ewnwj/LZWclFmwJbEJbfIn9mDxKZ9lS76w==
X-Gm-Gg: AeBDievxF5m018cOqfAVkM2ytWqsvCXar+JtESouW0zBI8wnD3HgmKU9yYnFpVVBk4P
	BiXkmP8ex80+/q4WOwl7P6HhgGOnNdHoiBUqBal452LeHzI3MluLKdUVm8uIbf19t3iUQa7UrTH
	2p0UhgOqwh2vJD0P8z05/edFMoSCBq6pcRNRzsmZ5V/z6VI1URVkJNq21vbVJmU1I/I5Zp6+fUa
	bq+2Xc2MASnQBknzluQERUMNVL1COP+HzIUxe3XMxVs7PhMYbu39Zu2IR/jo5g/FgXxszo3C4Q9
	m2kfPJs00EFHkGMwd5NTCSwy7ov5i91Tjpov8hhATZnQhtyxIKp1Pnea56Pu6qQjcivu0OfnmEa
	OTWtdfFYhXgkH6uNCP8dv23ySJIo+f+U6UULLYb8lDKNVZ6higlD+nb8yA5Bn4FlL
X-Received: by 2002:a17:90b:5546:b0:35f:be35:fedb with SMTP id 98e67ed59e1d1-365abadb3d0mr2543405a91.9.1778059958533;
        Wed, 06 May 2026 02:32:38 -0700 (PDT)
X-Received: by 2002:a17:90b:5546:b0:35f:be35:fedb with SMTP id 98e67ed59e1d1-365abadb3d0mr2543361a91.9.1778059958052;
        Wed, 06 May 2026 02:32:38 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0058b30sm1020810a91.0.2026.05.06.02.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:32:37 -0700 (PDT)
Message-ID: <455376f9-48c2-e663-3be3-fd310afb7f7f@oss.qualcomm.com>
Date: Wed, 6 May 2026 15:02:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 02/13] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-2-17571dbd1caa@oss.qualcomm.com>
 <20260506-inquisitive-wondrous-lori-a9e639@quoll>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260506-inquisitive-wondrous-lori-a9e639@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wwnWdPrYyfhjTYBUjW3aAZTAa51HfzIo
X-Proofpoint-GUID: wwnWdPrYyfhjTYBUjW3aAZTAa51HfzIo
X-Authority-Analysis: v=2.4 cv=cKXQdFeN c=1 sm=1 tr=0 ts=69fb0ab7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=TQHRF8L8_Bey4eUWYNUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MyBTYWx0ZWRfXw33jkFrqjgrH
 F0ZJatTtgbqANgJKeDTdalJZ5O6SZ92eAmDX1x9KMpCDiGvCj6zlRcQplsOndXeAAwCLaeRskBv
 8xTxOr9QTX0A3JcqAlhxFi5zYWm6fXC0fgMD6Vy7SInrsrUZpRUbP2mx9NfS3ZHLa/lxWVNsGao
 zAGNCDfCfEwFTKYYFgCI2LObDj/cOoERh9v+tLO2h6vwSLbrkCe0d5Dt9IXE6xdEhXsqxA8IUYx
 So7kuJHqlH6xyFBB+uU9hNs3Ltzx8eC2hMSm4lIbbLtrsHeLyHFs19mn1SM4m+aZUAUesLtLDDH
 fvV+wJ3mBwVoQ3cJOdAHl1wNRBtsYSk+rqnIZ3fOkFz5qNwpjOR+e74a/9xx4nu7U68VIAYBAVq
 cqSIehKaafJuZrlbFqnNeHblRQ7hV6k2+uCzNC0orc6Co3/IKx65xt1yVR3pjE1S7tVPyI5saUj
 nk+sS8KuwYql3sJmtZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060093
X-Rspamd-Queue-Id: 352124D8B03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-60559-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 5/6/2026 12:11 PM, Krzysztof Kozlowski wrote:
> On Tue, May 05, 2026 at 12:29:23PM +0530, Vishnu Reddy wrote:
>> The common schema defines minItems and maxItems for clocks, power-domains,
>> and iommus. This suggests that the number of these resources can vary,
>> while in reality they are fixed constraints per platform.
> OK, that's interesting approach. I am fine with it, but then you need to
> remove these from "required:" list as well, because requiring properties
> which are not defined here is not the most readable.

Ack, I will remove them from "required:" in the next revision.

> I still do not understand though why you cannot just grow the properties
> here. The point of this schema is to define common set for range of
> devices, because all of these devices are supposed to be veri similar.

If a new platform schema uses this common schema but does not explicitly
re-declare clocks or power-domains, it will inherit minItems and maxItems
range from the common schema. This gives the false impression that the
resource count is flexible for that platform, when in reality it should
be a fixed constraints.

If a new platform requires more resources than the current maxItems (e.g.,
Glymur due to its dual vcodec core design), we need to keep bumping maxItems
in the common schema every time a new platform exceeds the previous limit.
That makes the common schema a moving target driven by platform specific.

Thanks,
Vishnu Reddy

> Best regards,
> Krzysztof
>

