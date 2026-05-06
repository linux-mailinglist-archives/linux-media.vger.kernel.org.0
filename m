Return-Path: <linux-media+bounces-60628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBN0JE1T+2k5ZgMAu9opvQ
	(envelope-from <linux-media+bounces-60628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:42:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFFE4DC6EE
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DFEA309DFE8
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 14:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E693247F2FA;
	Wed,  6 May 2026 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iN1G/EWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvtkZsZF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4B648034B
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077597; cv=none; b=Aob1n7qfXE+LtY2alAkNbLSTKkeXs+cLFbN5KYhaPCNKQuFWACoKsdSF+Su7Enfdu3oQCAuxUPeE7ZKuiLr6tLb0/b3FpI0fvg7Hj0EbYqUkXBbuwxQQ4IGnf+2OQQrWRAm147bYDAO7d3CWvOTyRAoQiNYnoC7rSYXpAwQztmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077597; c=relaxed/simple;
	bh=srPsf9DGtjuwNp0lmZ/jXjqw3neX9w70YKOrPJckz/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sp2Xux0U+Uw+AjvNqPUxwHnDwbh2Iav2szYg2HcKZwkSMXBXC9B2ljCi0G/2cMBaBdNkF6CdxNb3G9OOx9hgw4lPmVYzOCfrEHLT+1EITbzU57hmYR1iyDTRU15yZTKU5lkFrKfPUWuvmk58kpiwXXKUAWCAPmqfn7tgoavympQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iN1G/EWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvtkZsZF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646Bqqf52581342
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 14:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rqf4RBq3GqNRH4BGmUrshX4k7nqqdx7ZkyuDEuKF3e0=; b=iN1G/EWNwfgWQKL3
	YAX+dNLrgxe2qqzkPQEvOTz9o8n8gYjG7HIbqbrC2dQ48IromOGPqNvckoG7DZUm
	YMO+2WEfAZPWoygw22tPuxiAD/h6hOndd+qVPjNqUqVRFRM6tGdtUqqM45pMfRdp
	XocTHk1vLrByN6EWoqEqhTNyBZBHOB5b5YceOBvwtrKR8MYSM71ZWotYXEId+SS/
	UMwJWBgTzPwoMThpSEhpbiqecdJibaGDgMNoNp4Bq9RAIKotGSQrGHjBacQsHnz0
	8LDRjA1lCwoPo8jw+yGY+eQz4Qi6m+3mXezqCYhCE5tTPSwx6+s1H879cO2FAT+i
	4t2eFQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyyvw1y7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 14:26:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-836cfd84728so458080b3a.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778077593; x=1778682393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqf4RBq3GqNRH4BGmUrshX4k7nqqdx7ZkyuDEuKF3e0=;
        b=NvtkZsZFEwZi/479mxw8kezbBqwrCiUc8ummFTwSSJgHaffXvJdLFBYkRA214aQ7BA
         r3HKzrr0ikF3E3vw0oUWOexuGK9yR45CJEtpt6hjOr157SA/Y2fW5jpqTlXuaOLTMRGk
         ivWEC0dAY3fqkSrPFQpM0nCTysMhPAWzqAxqDtRXftcU+5hLEIEdTSsVfvoMY6jtbYob
         WwyCtFoIbxGBVDgLchzajLcdBAu1bpgLd8n88tt9tw0L7I5L3WCxfEa4U7lhbBj3mr/Z
         FeWcKjx7xBPu81PWQFyLa469RfL1FEIzehXfmNJFo7l0t5bnPcMLko/vbq360uyxbNDt
         O4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778077593; x=1778682393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqf4RBq3GqNRH4BGmUrshX4k7nqqdx7ZkyuDEuKF3e0=;
        b=U6yj0Qz6vpxxGNAd83uykFcGnz7O3nkWNi6YqZ+VpSAi91JOD0sOY+ySk65SxyK3OS
         uHkh9r+53hVWXDNczHRn53n8Mz1gVPWaS+opSHXBfoH2PzrLkLqOgzaxgsaz2OK083gA
         JlNfoGXJgH0ZeMKNgc6jILD0mtr/1p9LBb36mE914Hhx9JXHp6GQ42xtAXwre+ybC7KS
         hwB/EblY0/Y05taz+dDx4BbIGxRPdZBzqs/n/DhcGSWiA9a1EKLGwKCVR6/krj12eYwz
         thtacdX4Xf2hzbAIEioIGVCXxDa2DB4MKcgpJwSlpENraWSKiQEwiZBB0zAc6kALub88
         ND8A==
X-Gm-Message-State: AOJu0YwLpfhH7kvUn+V4FLm8tiQGOJgV8GriCMEhaQ6+tydRR3dRDFN8
	ulQrqZPYqzPcBiSeuuto2kIcB2wm9zSJ5c99K3iKgycgJF8128WKv259vvrhAH6dg4Ljb7xAA64
	AoWMEl1uJ5+4lP+ccmQiCFsHHjVEtTrXXdLCuA5vq3fevhT9eR8Npkfpe/44FQDBZpg==
X-Gm-Gg: AeBDieslFa2GFRzs0G3fnowwPRDRzFaZ0yhiBdlEB06OriJa+5OgFkECslz22Mm3Uqg
	t14vqGQBalFt06RNl/dOazgcLlt95Vfo5UwlUxe1MUNUdQ/1vi7EdH6pfuuMGB3Osh6uCJThu/o
	rHXHVKGFXBrC8CG6juicKzzWhJ3CRzAE/5vqD9y/n/ok2l2HAZut92qTnWWT92RHUMbqLvPQhbM
	/SHCm4RAzs1ipQOFS2mKL6Wt7tbHqUKWVINwx+g92CRRJLRklNG5rOUbAAo96BVXiFmqBrCyGPT
	Vzn+VDm6+qljdshZzniLfgRAQWPpdZGuA60Oe/R+3RZOZsv4kcGfgzlQu5JITELSbZh9j1UhtWo
	VlYwQ6Tun3OlLhDQWSH4qWK1yfmEk75vJPraU3kTawxr2ahToWr8upAnjjl1wBiNN
X-Received: by 2002:a05:6a00:98f:b0:835:3f9c:c681 with SMTP id d2e1a72fcca58-838fed5e872mr6814183b3a.34.1778077592423;
        Wed, 06 May 2026 07:26:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:98f:b0:835:3f9c:c681 with SMTP id d2e1a72fcca58-838fed5e872mr6814130b3a.34.1778077591827;
        Wed, 06 May 2026 07:26:31 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36c10sm7146996b3a.25.2026.05.06.07.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:26:31 -0700 (PDT)
Message-ID: <0c33ae9b-db53-4557-8fff-27c2da69366c@oss.qualcomm.com>
Date: Wed, 6 May 2026 19:56:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] media: iris: Add context bank hooks for platform
 specific initialization
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
 <20260505-glymur-v4-6-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-6-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYCNIQRf c=1 sm=1 tr=0 ts=69fb4f99 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LctZHUKdXz4wyCJjwzEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0MiBTYWx0ZWRfX3eVF1cQDOOwU
 LagtlIq6YsHciqxpaexk2Nu38NTWVvIWIVd+7EO0K37tsSirf+aerhg4oEaGUI8APzk2VwzgFNt
 fYXwn51ibF0TBAhafB2Yh25k+UqSymTDI1gEZaIvQX02pMMZp/xjsPn8lNi1Eb1iDBvPCme2vr7
 Pt+b4spqVGBqpvRF3VdRFJQLVwS+ZQ/5d78fQN7dOHF4GXWrhPUGYdivV20TpsnXNf8Mo+jEtey
 Ppe9SjfEbuDRtyhx93oey0lA0kEylUqjp62KWMVeNYx9e6cb7+SSh/KnwNHlxF3c9DBSE62a2r/
 N5DXNE8xr+PbxuoWVnTnpw/lGcbyVcTbrsrPyiWTo/utKyeSBYpHiC2G7Mp42PUhVsDpX3PXzsz
 ir4fd5WH6MANedqmvjVaxdvvRxHLgPSxQ4is3A6nfdMVi45qqNp+pDyNnSYwYglAitVAJLz9Iwh
 nwYFH3PTS+qkKr+nuKw==
X-Proofpoint-ORIG-GUID: dDrEc4QPPGBFeQVxEOQaHeWgyz0VG_eY
X-Proofpoint-GUID: dDrEc4QPPGBFeQVxEOQaHeWgyz0VG_eY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060142
X-Rspamd-Queue-Id: 3FFFE4DC6EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60628-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
> The Glymur platform requires a dedicated firmware context bank device
> which is mapped to the firmware stream ID to load the firmware.
> 
> Add init and deinit hooks in the platform data for context bank setup.
> These hooks allow platform specific code to initialize and tear down
> context banks.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

