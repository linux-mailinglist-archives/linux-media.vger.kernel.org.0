Return-Path: <linux-media+bounces-63057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKVnHh/QGWr/zAgAu9opvQ
	(envelope-from <linux-media+bounces-63057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 19:42:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88745606BC7
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 19:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AE8930DCDD3
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9021C3905EE;
	Fri, 29 May 2026 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4esPTDH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nrufv9zF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A810838B157
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780075869; cv=none; b=aphQ90y0tT4HKo7WhWarfCW945gluHNmBCdH61TrjHn+UpXcvqggmJpB3A95U5s9DjQpBkSFvWPcEcrzNKT86zAIkhDvfC78Jt9sAIq9OR7wBq4jrg4G3xl2zzKMyFXS2TpNwfID3p3SwLxUHt+4er4Kthj8QdAoCqf2fjuqXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780075869; c=relaxed/simple;
	bh=6XtuzAYEfFRw+HYYz42AkI11W9apPm76m7J6y3guol0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgbc8ebw6gBoOZkHadwAsPN12WZNpjH88yFeEWioUeqtGzkw76wo7Anu0JF8s6iEAbtTfcPuZAnKRNhmev8DT2njzGyD0+J2dRNddfR/7gTL1HwazNIkWBctqR5nYNItKC6KhHn6nGN3IwHgnZiHKzR2qwpV9ASde30KRvRMVrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4esPTDH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nrufv9zF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8Vcw055319
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 17:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=; b=X4esPTDHlq+Rsv8C
	XbAcFT9hcaGFg+2OcBQjIPdDp0LQGn9CtGtOcrfjUnQuB0OsJ4FLm5a7uqYd2R/A
	vviQZtUGLD1Zww5tRizwiuO+5O9eny4ME6bhlPQoEsnHbs2mGGhv9yOd3K/MkUyt
	no1dFEHBlc21336KaM8+mWwh3RoF7mhff+nlFlO18jFuFoHAmAMvogt9wso9ZZ7V
	J3rdS3i2lzRxvNslmAh26ZCFT+Pa150ebYXyp79xHtxLIgzZzKz01woDGCwutUIu
	DJTF0TgnuC5gcTBNHbSy0NE+L4zZAlMM2vOAcW6aXypzOx+S9KnYiKqunG1anTNy
	5J33Vg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efdjngqn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 17:31:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf30576aa3so3286715ad.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780075866; x=1780680666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=;
        b=Nrufv9zF1QfK5xsRcVoSjI33YXOAosHHvXl4KuQXm7x4pUdsF81Xxma2cAjQKapoN4
         0yigDKkDm08nIJts/kJyBCcQc57MrEIXrQGy14AnRY3MjhWkUJxnVvYdrYE3KV2mZMwB
         RUJNhHzJJb5ERltg1WpgekVtqcqb48klwOIrcdt5Lxjmnxyswa3abBMdzg4vty9PcWaD
         mc6ySFj/K4/4Z6gQE5tuil01IhgjnzK6y7nPkZMdc3+ww0Frv4YMjdMdv2cFRWRW6gy9
         5J5/tX2BNuqfFHJ13wAikO7I0NclVcTStKKA6gXDmR/Bj+MM8plecWpIPFQRIWzLcm17
         vwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780075866; x=1780680666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=;
        b=AO56stLA3L4Jgr41Do52JMBKgWe1J2RHxLrXD1DaKuZ3C9cqDPQrUuiWy1hh4tKRWC
         V3LqYOr6+5r+p2b+cB7tDDtjF9KPGKB5eWfEp3Jwp3gL4gkrXmKFConnJpAxx1TsAOZg
         xxDhmHwOPaay80+IFbF8JIDqM36hAS7PpA/xW+YnKs+Kmlhdivb6FaS4CPr2nFTAV5BZ
         Bye3JF4uTOmfkuFZtzhlABLhDX6gR9FSY2541CKrV+2tVQ+OQuFtMFbqcsP1gHkc+AOH
         CgvkZuSoCAiuTVeMdrgtl6pPN2LrL0E28olHlOxUPOXspJtwDORSvlz5kJqR3It6Pt7u
         pE8w==
X-Forwarded-Encrypted: i=1; AFNElJ/8z3MSc+vNp140ZT5eWIkcePRnR0XDSbXoyz2x/rK7F3gfkhpQnRbneFvaDlCvcXALqfexIWfzdsILHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSyxoUHQ/1gwuUPnE4HIit+6A50XzWh13J5z0t29G1VPtMw6cQ
	d8F3ISYymdGZJZRewE3rTNFYd0AgZ1ThGNr4IurhZIoslGMwG1Rvebt1JABGT6GAxjWs80EdgH6
	YhtNfwSYJOoE6RLEtEgDXJ8xhCx+3iadVGWT7CupR7SVyhX5v8eI3LOja39oZFAhKrA==
X-Gm-Gg: Acq92OHPl1aluTOBaJrgjU5hCNbdFd7tSDM4+2bzY1LjKKkHX37OBFXv9lqxZzfFCyC
	T4azyAUEkYjInD/LfwNAdzcKoxTcDhIFeHZDbwIWZYnW2I15Yz6H2aRKui401XFgOvuupJ++Dj2
	qL52NHZr0HKgBPBGOIU3O/3PsCa4fnoPsa3/ttjYpiCTOP/xF7E5NHkXQEWSDhJ/qfc1EQuY6NE
	xXrdwazkVLmKAoFnOOjjDHsJO2OeSzhWEShkzgfIqiXk9pOYGzgUJcuFiV7Gnhyq/tThVbRmsAK
	ZNfZpiP9T/uqk1asbgENbfduSxb6K//Jddhnk4lNTSObmWHnIxPgazgFfitYTMXdiFcfS4yzpWJ
	L/toiWF0aUgvav5OwXTyVctLOgjViAuBcWYQqwzyu6AIXtf6MxSIXF76DOgGu59o=
X-Received: by 2002:a17:902:d50f:b0:2bf:2015:5ba4 with SMTP id d9443c01a7336-2bf3682a24bmr9445255ad.24.1780075865565;
        Fri, 29 May 2026 10:31:05 -0700 (PDT)
X-Received: by 2002:a17:902:d50f:b0:2bf:2015:5ba4 with SMTP id d9443c01a7336-2bf3682a24bmr9444745ad.24.1780075865095;
        Fri, 29 May 2026 10:31:05 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.224.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm25476575ad.15.2026.05.29.10.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 10:31:04 -0700 (PDT)
Message-ID: <bc2aecf3-fedd-4b15-8e69-33ca928831d6@oss.qualcomm.com>
Date: Fri, 29 May 2026 23:00:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add
 DT overlay
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
 <178000731452.4557.8537369407478321842.b4-reply@b4>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <178000731452.4557.8537369407478321842.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3NSBTYWx0ZWRfX5H4P1HZfKDYI
 Uj7agWQPBqTAYv/ml0TA3DXmytm1fiOR/d6gORYgDrQYhENeXDl9f/eIq7RZDpfGyJovll0R5UH
 kPwnSQgg/a3krTNAjgGjgrUmcO9xBt7oc+JUkBjiBAg9AJM77ha02v7O9irTV1F5x+tY0reLwL3
 M5rrQ665h2nezinGf0TLsRq5m3N0yA7RJlFc04vLN3b4WlJ6V1prVNmzVV38ev/ARGT3HIJlWVE
 PH34yvbwFlaJ9c48YFTip9KWG1g9N7IsyGN626NhMa4Q2wlZws0r68jFEAaPZC8kdbbSBIj3mL5
 Aa8WgK7rWEZyBc0LjwrveJj3DxGxZt+5TmwCjmE1+w8kf7yUvsjt2/fg6jsIeRKCMzvgBL/faNS
 n1voy7Ttcm/0YQKNL6hw4/o2pr5lBF+NY8prEp3JSIMHw+0wSJJzmXa4jYI/gO09SAYg7EMqDnE
 MbpleFhh+lNEcanQhFA==
X-Proofpoint-GUID: ncjafcXJaxzp5PJwkyMD66nItBBxIvnp
X-Proofpoint-ORIG-GUID: ncjafcXJaxzp5PJwkyMD66nItBBxIvnp
X-Authority-Analysis: v=2.4 cv=PtKjqQM3 c=1 sm=1 tr=0 ts=6a19cd5a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=tDSAgCU/rryVExTQDfsVjg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=iShi-8OPmrKBgnXoZJYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290175
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-63057-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88745606BC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 29-05-2026 03:58, bod@kernel.org wrote:
> If the overlay is not specific to board then the overlay should have some
> kind of base name shikra-evk-imx577-camera.dtb
> 
> This seems like a minor nit-pick and, it is 🙂
Thanks for the review!

The overlay is named after CQM because it's shared between CQM and CQS
both use PM4125 PMIC with identical camera supply rails. The only
difference between them is the integrated modem on CQM, which does not
affect camera hardware at all.

IQS uses PM8150 with different supply rails, so it needs its own overlay
and can't share with CQM/CQS. A generic shikra-evk-imx577-camera name 
would be misleading since IQS is not compatible with this overlay. 

Happy to rename to shikra-cqm-cqs-evk-imx577-camera if that makes the
shared scope clearer - open to suggestions.

------
Regards,
Nihal

