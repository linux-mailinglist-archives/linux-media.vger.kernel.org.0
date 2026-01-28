Return-Path: <linux-media+bounces-51738-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDbqA74JemkK2AEAu9opvQ
	(envelope-from <linux-media+bounces-51738-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 14:06:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC94A1CD0
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 14:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4674F300A314
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 13:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A02352C53;
	Wed, 28 Jan 2026 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tl3KLk/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWXSAM5P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B1435292E
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 13:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605550; cv=none; b=n8JN8/FTncQawU3ueFtTSx8WZFaAT2M7tcnTbvis78RL0wNWWJPBSJ+oOsAu+BE7jQHG38Yqvf6RTVKRmKrkQPl1/ImQJ527kpHR5I5OwSpKn9NVzerVxVtsFFlRBjj+5pMlc5aICG5+78JIFCRhaaGS6S8HTZYc2f+c+4RLRLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605550; c=relaxed/simple;
	bh=bH76/QTPcRxzHY4tUxojdSs6Cro8RoPOo1iFYRRrfF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dY2XsP/CThUCZD8CVdF/mymDs99LNBKpxzKXfHzXM8usIIRE1tBNsTOS1HBPusSW0HT6BnvFFi0M9JLie9gL4wKHt/Xx3cF6skvEpuD3frDZcie+czOOrdTu/0pn/KuYwSg9V81XXYifs+guFzVm8aTXOVzsYHbao1cOWAujInw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tl3KLk/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWXSAM5P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92Rlt3907615
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 13:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53awUpiyXimko7CQX2fVOIT8jsbK3XQzIJl3V92zEgY=; b=Tl3KLk/ap4zenZj1
	3hmN+QI7xpvcBy/0KGTSf74CqdaVRVPBDn4J6nWUMIEZkPSW7F3hhlZQHaSUWdfc
	9RxJQuzaRTOsvSSR5DJ2GNAVCwSOfHGHKFfr+XLj5bOaLHpkb+p9EOo/tE8YFPgs
	6MEmjI/eWqD1uUdiN9inT8HlVV2w1FVndsKbOQV2QfN8bWY2meD33IWh6HojdIhK
	0+PF627JdVt2vTb6ll0lLOBVeSZfvjedtF5x6QUZ5oOSrdiTpZ+XHdLYKtsfnvm0
	eiwGFfwQp+9eHFEV0G6J6Rp0aactUpX9v3iy1ADaalueaCREw9OfbpgrCjCTy2Og
	TLPXbg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g0bw4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 13:05:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25e494c2so12877595ad.0
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 05:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769605546; x=1770210346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53awUpiyXimko7CQX2fVOIT8jsbK3XQzIJl3V92zEgY=;
        b=JWXSAM5PzWIF1bikkm2Lw7vAuxCIMmDBc8GB35Y53GiCw/ZSQIBbzyjSFdZBfQrH4R
         V8QQ8tckcVkoX//j2UUcNTPL5q3jzAl1FodSXhxOgOj3FdCGehdxn+BeanmBCzL76Kud
         xX0Wf9T65AgvQmNzzEkbgBG+cnMIbZJomf213Dg9cdwN8MRbDLRS3xEzQvCpIjdMZFIb
         JgFB872JFLRKuKs+XUJj/9wDd9wsmmo88Av6Tlc4bTGCPEt3ZwToTqz4xM2/W3xNIYtW
         E+Wc+/tjKOSibeDa0bY9/Sc5rp83DBY+nCiaKRyvB/2HW9x1UGWzpLKocg0IO2bEW50b
         V2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605546; x=1770210346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53awUpiyXimko7CQX2fVOIT8jsbK3XQzIJl3V92zEgY=;
        b=fGVRoHNqRPPKzDSxkbUg9RU0NYYVX2Hy4+r6JR3zFf/RAhN18zrOrHMiJA9c8/3z+K
         VBOopJgA7Fp7exDKJ6PflfVFIF87Awc21Rf/yglNPaVj3CIqH0LU/QvZQTJ4Vs7lqLf6
         tmhDwMR9urkBKP7T+tlsOl7Kx7px5aH9GMOaBg2KyKdaIqRA1lxcfJQQ5OtE1YG03XOc
         1QVYA5Cwqt8ao+TBgrI0pQWUJdL/T3Icu0Q6wBgZW6Yumx3tT2/uOPYzSCNpPdFTPddi
         tNc9koyejlKudkxR6d+77NcGWWMObTrDMor8h33CfHaGL1cNHS7648kPhw3uLRzVDih6
         LYdQ==
X-Gm-Message-State: AOJu0Ywvx3SOAlLTDKH7J6rUPsKvVsfOdPdczyunKk6Xg+rSe+cfPr8k
	EuMG93DBz9EC4KXCWpAMdSzkYvfPFTjCf+SssOTXAO8aTYmvWpoQS7vbP6aTsqv3z7V91STDhkr
	EfBZIOTAITgxZajS5R6jdITpeIPxmc89ixBUxJHZwbu3MpW7fy8ARgvu3YjQIiwf/JA==
X-Gm-Gg: AZuq6aIJ7w9J6exkGTw59PSulEkqjvOtH6nngaNVHi7BeFt8gGp5A/VkuTFy2BRHYWK
	40nJWJz+ja52Bc9U78VtYWTyYhX9enVcqie08m/OCYZg97rcqm9rm1ezwAqek9CYnQPj5+D71dp
	iAl8WeChxC+ZUZ0mt2aGuocFnTCL1CWeLDvQ4Y0P1yKWC8E41wxnlUE/HhfSnigfAJMYxhq9naE
	QfnvirC9BBoVsp0/owxnH+8WiQjUnMp59uJhEoEnBiyYqYGtlCjdne7mSM/PNGtS6GAUoSE3SbO
	DZqQbvk6qtMb+9jjl0nV8lZfinvbh4Jjfx8m0lizDga43ceuZjwmIJMrGFkr+gDhRBteow0Sd0c
	L6vGCD1rc3btwoBsiJfa2ta3tQnSQIyXoeHn3R66Tg5U=
X-Received: by 2002:a17:903:2f91:b0:2a0:f0e5:74eb with SMTP id d9443c01a7336-2a87134d275mr51385535ad.28.1769605546313;
        Wed, 28 Jan 2026 05:05:46 -0800 (PST)
X-Received: by 2002:a17:903:2f91:b0:2a0:f0e5:74eb with SMTP id d9443c01a7336-2a87134d275mr51385125ad.28.1769605545689;
        Wed, 28 Jan 2026 05:05:45 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6fd513sm23324685ad.95.2026.01.28.05.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:05:45 -0800 (PST)
Message-ID: <815c3b94-7237-43d4-9f28-4af0787f2152@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 18:35:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: venus: flip the venus/iris switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
 <20260127-venus-iris-flip-switch-v3-4-7f37689f4b39@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-4-7f37689f4b39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4h2tK8tKVKhhAidJOfwjQKupeuFxKFZ2
X-Proofpoint-GUID: 4h2tK8tKVKhhAidJOfwjQKupeuFxKFZ2
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=697a09ab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=4hJEjaH6g9CgPEswoao2AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d5ADb93ID7zXtwdUo70A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwNyBTYWx0ZWRfX45bmaG8w2+4K
 TSxFFCcrMoBEUIZ7tRnM/VBhoHNGiNEPAczfnZn3TeuwEHF4pCPan/jBdsNfqKzG8VGccj8uTp9
 A0658MzhOCYSFO3zrnd5CrCRjBKSOu1y++Qz/3BmUtm9Yc4bQIU1eLx7VRN2Fu/lXK1Ghy0NM8M
 ryZ3xeT2eu7zh4v251OfsKUOh41pbl7tr5gnp9GV1+ksBJDcPfwtcF4ckUqQDaKFyQO1Vzo6Owz
 D75Cp1pW2r63rDHyoPR+OflgCh1Up1dVU6MoLRQX+0RItXOwn3g66hxOd5374RHr2rN31/dzdQs
 23ZA4uNxMtKdgjUT+Cd7f+NXpLWcIBOgJeXAZVXsP5UnHZ2MnYCWh6RRgLmY/nRwnoY7rjH/eUF
 BYlPWBJvfjsZqzYvHBfQSs4TcakQRDZpocDSvR4tE2vKka34mxhBxmMgwIEgs/gaQemaRSB9egT
 jxm0rl3flN3PhyNcFzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51738-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFC94A1CD0
X-Rspamd-Action: no action


On 1/27/2026 5:53 PM, Dmitry Baryshkov wrote:
> With the Iris and Venus driver having more or less feature parity for
> "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> switch. Use Iris by default for SM8250 and SC7280, the platforms which
> are supported by both drivers, and use Venus only if Iris is not
> compiled at all. Use IS_ENABLED to strip out the code and data
> structures which are used by the disabled platforms.
> 
> Reviewed-by: Konrad Dybcio<konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_probe.c |  2 --
>   drivers/media/platform/qcom/venus/core.c      |  6 ++++++
>   drivers/media/platform/qcom/venus/core.h      | 11 +++++++++++
>   3 files changed, 17 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

