Return-Path: <linux-media+bounces-61266-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP/LG5QsA2oR1QEAu9opvQ
	(envelope-from <linux-media+bounces-61266-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:35:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D99E5214AA
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3364A3106633
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 13:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC713812F1;
	Tue, 12 May 2026 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFAu9hjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGf7p9lF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E4038D01A
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591961; cv=none; b=MlCzldqzE0apOwMpNFK/YLh/pSp6s1OuKbUgqrpXIsV8fy/4EvKFWViIO76KTIksvxjBGtIQVWlRbsYmkJWjBqk5uqZzjHdUAxGKpmjZsiRknczNQUu3WaACzGoWUOmF5FKvhdVe89k6DDEztlgPLZsTRaXm6d7OLBCi9JSN7v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591961; c=relaxed/simple;
	bh=xeysFtJxgOWWJUXnSw4gI1RAvwdXcj1YqG2BQcWJM7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPOroEriuYAiYxMtjn68c3UQASC/cph/E4mpJJX2DFihN317ZnVeYVgxNqGrxmmGjDI9giDqdUgXZjbRdb7s+wenUMq+XJmSwPPrhiv8MAR+L+o86I9dyOgKQ5Y3uXMzq2wzRYH+R8yGVnuAVnwfZMbYcYeR6hPF3+S6FSOBfZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFAu9hjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGf7p9lF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCgxRR1410134
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SK95NwVIQR5b8xzwtrY3Jh3Q8WFW9xU6ML8yfskO64=; b=OFAu9hjFqX2P/aNe
	/0wiJHBgYEe+oTCFZECo55h7SDQLDmp0+gx0WSAkDuFBXV5HTsrXLacnO8T9yKbP
	tAEP/DSBxLcXjsww0+oxRIWvqC1SDuRIIvDOxfpejO3UxVMFOHpN1u1Aqj5D3n2v
	sV4NfI+zPx1kBOrc2QTBh54EoaXGW3EEidK5W1+TMm00bj1iWm3iCNqmP/PuNfg2
	A9pYnr3wHnyqGlieXGYtup4biVWTZI2P2ml1doklqtfe9BP6cMOcRAUOeg2+2y53
	Yoc4/klI1SLSyhgtlnYfP3ZuIIL6JrM6Mo8G2YWrxoGgHufwT/2G08koQYhlJOgS
	cDVSsw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f3041p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:19:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba6ca20ceeso61563835ad.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591959; x=1779196759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0SK95NwVIQR5b8xzwtrY3Jh3Q8WFW9xU6ML8yfskO64=;
        b=ZGf7p9lFkAnYBNbbUrJXQeF2c0IURmOrFLE1mQJ5Qt1JiOX5ijTIn+3cKuI/oCyGnu
         gsQmohFP+DWIML3vrdc4okQy8fbeUSep3Equ+GKvlnxLuRHHLe0LSyOgs+FnH+ik3YZJ
         xNBTh4SK3qxinzMJRup9wB6QR4DQqmP8GrbCW5s9Ifusbd+PPkhVenVrS7UStYLFemnp
         Ed+gI2p+Z6eLmHg1ZjNCO8XnS4aCd1F5rcbxcovKtYYLhRi0mVlqJDsqZX0PWBM4cZ0T
         d2u4LsSeJ09yu9UeeG5aBI7tnHDT1AibeGiyDH5z/j5T2y9dRumt7hAp+LVg6RT//x0c
         /UYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591959; x=1779196759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SK95NwVIQR5b8xzwtrY3Jh3Q8WFW9xU6ML8yfskO64=;
        b=bItZxpb0gwD9CpIXveHiJXmj5Vk4etcCNQEoeWqABiN7k5fY/oL2ya+W77QM+s8qTq
         PPjaWpqgaD/pzkZMnYp4aTvHAHRWRetli+rsnHNHZ6qyLnAl9cVGRv0amaHQlGNtoeo/
         6pc1bvRQSQDQyVx1nl66kZGJ1PclVBTahgAba3zgYGO09+0ALFtx74tYQcs6rKy8ShmI
         kfDhZJQ4nIWckBxjJIvTeXzGbY+YdAZyZ3zk3IY4o9KwUTDhxEiCVothKZVPQfNuTXUo
         9JI+b8UmWDYCTgaysFzJVbWJBsrumKdWUnKvyN2VuyUmfvY+NrTOFAR/ALzplUamLiwu
         BwFQ==
X-Gm-Message-State: AOJu0YwCcFpMnELTiiy02opaJmPn2syxIkaZGBCUxRYu6s2/VdjHLQeL
	Ig2X/W3n/ziZdjXdUC7YCV3hTPOFEZ2JwT38C9e/iCzzLUiHQeyrk8LfKiq8kzfPWVCRgIS+d6b
	OGt2vTfPEn6io+D8CkwONaZGqHRZI5gEArlJk7+es/72JpvPSXWKVLnCMBhfsQGVNww==
X-Gm-Gg: Acq92OHORT4fDgfIl44TzJzWKpmrl61b0Hqx6GZZO1fA/O7OhSz9X6XmsgFA+Koz4nD
	FLQ3sZw0KF93n181GpT94Ffh+vKbovjRwXrvbN30tOglZKu0MWG7YcjGYjNTu42220kcr/hx7uj
	uTFUNWPFwLma9wrizfAuUG8uV8HCQcNkQ8KtL1YAN/YkN/biiUAZDi/VxZuEPArxDpOpkIkvmrm
	UXOKFLM6D6quOZ6ynrLyzx/H2skwwGCZEsHCVpS5urP3tFrwTx65JZWQ+0PFWP7DplmKhhKSQwV
	MHPHWbz66KPjUDmIwMQ5a/G3U/HFyMwLhj/1bVr9BntaqM1t1GLnd+TcdPC0ozEyL7j7baQzJaU
	nCGQENznxtrujbbztJCaceY+xvB35DJYn42SBJcwEJfc796ozNRuCN4cs
X-Received: by 2002:a17:903:3905:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2bd01140d2cmr36698355ad.18.1778591959039;
        Tue, 12 May 2026 06:19:19 -0700 (PDT)
X-Received: by 2002:a17:903:3905:b0:2b2:4d78:eec2 with SMTP id d9443c01a7336-2bd01140d2cmr36697835ad.18.1778591958583;
        Tue, 12 May 2026 06:19:18 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm169820265ad.36.2026.05.12.06.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 06:19:18 -0700 (PDT)
Message-ID: <43ae3663-a957-4f33-a37e-f5d8d14f2342@oss.qualcomm.com>
Date: Tue, 12 May 2026 18:49:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] media: qcom: iris: encoder feature enhancements
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SJXRv7zfFRHw37ywRcO1EPYyE_mxFqz9
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a0328d7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=o+V+sR5qrBln4ZYy4JV1aQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VeRfxp9FEjgYNq1EixwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzOCBTYWx0ZWRfX4TBSqOqi6MLc
 OVEMKVgP2G1nMoYSnvSTUmCuTXbj5h4AyWppItV5pOMUndpHPdcxmQLPeSrFztOGl40GGePO2pF
 NvYeFh8cjoBakdrvz8zNYTAmpMVSFLAnEvSljwgqZuGxzDLu4MbphG1ExIX51ylEhwcEWKmrCDI
 Rvx5x0DwmFMl+/5BRybJxg6f0bYc5CNfrHlOnEj07zr8oRPN1pOKlFlua2w8kwlqLuKe4DUx03x
 gqgPGMQSRSjhxQoQGK8UCroZ2bGLg8h00tgvlsmLj36xBhZZfx5FpkHko736f/QjUeWAiqlKvx2
 Y43TVRbQFbum4F6h1Z5aLXaCWjww9oFFjQUFBxAZp3tdcRd2QOWwkp3BqB/44JhlmDFtdrtN9eP
 750KbGmuB9QO8MtW40PPgmzpKG+IwRl+etPTpcfCivc5TyX/7eEv5cH1uOP8qA7IfCVdkCKjzrz
 ltef/8kFPzrHzfklWqg==
X-Proofpoint-GUID: SJXRv7zfFRHw37ywRcO1EPYyE_mxFqz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120138
X-Rspamd-Queue-Id: 0D99E5214AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-61266-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 11/14/2025 8:38 AM, Wangao Wang wrote:
> Hi All,
> 
> This patch series introduces several enhancements to the Qualcomm Iris
> encoder driver, improving support for V4L2 controls and enabling more
>   video encoding features.
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on
> QCS8300, QCS8550 and QCS9100 for encoder.
> 

This would need a rebase for Bryan to pick.

Regards,
Vikash

