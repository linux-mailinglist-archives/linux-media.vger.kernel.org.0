Return-Path: <linux-media+bounces-64946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9QIKIUOTMGp2UgUAu9opvQ
	(envelope-from <linux-media+bounces-64946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:05:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF3968AC65
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:05:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PvbfC8V4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jMTzFipm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64946-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64946-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BA583019033
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7473078F2B;
	Tue, 16 Jun 2026 00:05:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561D813AD1C
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568304; cv=none; b=HTsalF+GFTeWNpJryB21OycRRYg5I1FO6+A5gQiY8LOLTzy25gMN6vZ0Py2x35B8tx5EOn9bft7VHnoGOKKcQ01qUZsHYIFRz5mxO96roJWv//Wkk/SqsHGXwmJyZ8MJm3kBdrqKbTOp2LO46qtNi2G+sXvxxZIeN18ou498pUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568304; c=relaxed/simple;
	bh=+Z5rBkgfi7IwcRuoWGZOUS606iHRju+ESdKBNL5RkTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9Z/fhUY3+UrL+0k6Rc7NZtaYJs8ensLSI+NTRxuZJjuqziNzCo277PcphOdGfhyuVpQCZchOxWkvuwQnrh9gvM9Nojje6D/lU6NzpDS3gsChyk5UWYKumP17QX5OOM46kqJfRAV3eKiK54cL2/hU8CJliQz3qlgQDuWk76zHkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvbfC8V4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMTzFipm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxD073578291
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dNNWLjoL73Wgtu4gxCh26z70OXEkNFEiHQmOGKik4I=; b=PvbfC8V41HYOmj2b
	8dzeZmvMSxLgBHpkLIhKUwh8ud/KHQ5rPIVZAdSJpIjpBc6GTHJI+UTsM0V2b6gP
	uwd2wN3S7UnkUa8zETGE902okz0xeeUB6weSDKt7tb8CenMCDx/OGsttGKesMbSl
	HzgHV66g2f2I1jb9AQc+GpYbhTfWYeWjdCBjxJlSK8aPdPInVGDf9WVjfMRkMErz
	X3t4n+PfDNJWemdJoKADR9+m1U+PopSKX3EHPr2pCXe/i4R9Q6rvbFsyqToEWCxF
	EXYX78Bzc9K7ns2ufVw9t3psl/Zn9NkMH00b1BzghHo65EfD+2Wefx6S4iwnuz7Z
	KF8oyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete983thh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f6ff639aso1105083885a.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568302; x=1782173102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dNNWLjoL73Wgtu4gxCh26z70OXEkNFEiHQmOGKik4I=;
        b=jMTzFipmh3rRnIuELwRKMK4ECSPLE+O/SkTbswfsoFkRKvV1KT/cFUpPm+0gF9D4qZ
         sD0L0ginphKDq9STOi+ht/cv2EeXjylwOxrT4CRK1irOHlu6owVpbyE9NSQ1qn7qcs6/
         mEUifgaofUBfh/Xo8Bt2z4p420Lw4WUkCcYvhLh6gFfCNTyLIXlgIVhWe09vbAuH+sVi
         WNfKIMYlop3O4UcSBirbt2vaUC91bybvWbFtOrO8xHOZHfJuPupqhlPk0uMUlUyPaNvh
         aKM1miy/OQkX50KIl1WxpOHhTGUMAA+2K1HB6bwAu1u3hW95OeK4yrmLl5BP5GRmPDMD
         QM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568302; x=1782173102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7dNNWLjoL73Wgtu4gxCh26z70OXEkNFEiHQmOGKik4I=;
        b=V/XtFLli2JodU878SdJLm7aSLrBWTfndI1eLXEOqHXKYIp99BPm39miYMsslDshY3F
         nWuPX/AS4GvaAskaUIXNJFlGGD4x09KJJQK6UiN6lezwf3xBYwoFhV/1/v08LdtEorwz
         iak3mq/QywFq6N+6jFVJbsu1efHUIJKBNYnAhR+taSMjAUddkfakllOoO/4beokieCi9
         lFx0c89W6ToPqY4m4+5Apm1p90uDq3mFU29qUAgWZv9lFQ00Ll4cFzjQFaVHlvuJFl8D
         xvgydWeo59umugZ3zF3ZxEbLm5aE8TLA9+3efrCvkOqSwG/HLTSZenFrByWrGWWHNr5M
         nTkw==
X-Gm-Message-State: AOJu0YwbpjFhShqGp45dhlHjVoLjOGkHx3dAVHkZ9qGzSxtsc9udjygL
	VjWXZuTg9xA7ZCCROd/L5L+YXBNcvLuHs9GUosO3taRWgPDbU576bhZCy92QXUMKGT1i8Dp3ISG
	NWYIaQ7m6KDVJJ1EDgSdTJungkUotuyGeSUpEBDmdrpVimZXy0h5c7mORqw1wGrGk8g==
X-Gm-Gg: Acq92OHMF/LW825avX77Eo/jXSSE5fnsQO3qyJh59If9B0j/2u6xWiZBTcZWujS6T4k
	YO7z/Ly2qbDeqX+SenZ9C8M7l/bLDqMC0FPr+a1D+GaDkVFsm65tFpReSn0T7QNAnQvgjc18HBo
	tiGJi1wbfPhbjTgYzfuMmX9MXCR4O2GAMr6LnSj7rsSejHWzhHBIgRsNIaR9j7advz5LPkYLUmb
	QiNvfG+Udq2JexoC0h/FuGgDc43D1PleM7PDJfExeYiZYyZnsGtgM5wEZCW9zMZY3MudTJXj7k7
	DgxLIVy2Lrd1TTUWA7y2go0X0S028KmFbAaX3Sch1UcRyiwfcLQlOuhA2hIVhBj/bSpOk47s1+0
	mY3dHh8D2pI2VPv80RBUTAbgUQ3lw5MT4KrF39fHDtEXQHLLfnj6jqj6NPjD2y53RXl+JJhQofb
	hjXJrWKAsjdZGrLQH25unYeSpPpVs6gOopZV4=
X-Received: by 2002:a05:620a:2984:b0:915:8055:3f91 with SMTP id af79cd13be357-917f1f4bd4dmr1972932685a.43.1781568301519;
        Mon, 15 Jun 2026 17:05:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2984:b0:915:8055:3f91 with SMTP id af79cd13be357-917f1f4bd4dmr1972927385a.43.1781568300966;
        Mon, 15 Jun 2026 17:05:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:33 +0300
Subject: [PATCH v5 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-6-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AJFs3OudyuZVurF6CXPv4L/hKHLI2q1ug8aHEJrRBk4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMOtFFKn3Gk8q3r1GPmozoFOIWr7mSKtbmNS
 Jlxjkpt71CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDgAKCRCLPIo+Aiko
 1RMYB/4ifAOK6LvptRsRn0YV0KuNuvYytHJ/Oq3Jh2aBS/RVs2Cb0DWqnmnWytzvYTakL7UvICQ
 a69ho8YoudM0PI6X2muzHU9J1Gq9L+3J5QVXNbZ4BoUbJ3Y47h459v81um5MDQB6H+6o6jw7Zw9
 v08a1h/GFzmxOPkGg0sHXCh+RJ6yRFuDdSIm8LY9n/hZXX23C02nAKMZ3bM1l75g/2SLqLMN9G1
 yqnU5h3SpwR05XpGHgQqxavFiS/ZVJerf9Tm55DznaQgj4Ey/Q2fZNshMWzZiTsPYqw/FjMhzXj
 aF3C8equN+008+VD3b0IJ+TyP14w1IPLCHx6ZvrGJyyNyr2h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a30932e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8x7frTJZr8NRtTWezWTCdUWBs-y6nqzA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX70COyzXysshe
 DhWoVbxZyPtqfeuij7YPJzUNj60DAdP31Xom3ZYjN3QmNa4G1y8MsX489wTuK3W/tYa60ubQb7N
 EnHmuOSLLSGbwfHMqSHAb4sdBb0voYc=
X-Proofpoint-ORIG-GUID: 8x7frTJZr8NRtTWezWTCdUWBs-y6nqzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXyUdIZ1/vY4Ho
 DZA7Ix0mGA0bH7ajZAmqAl3/ZnO02PYQDNTT55vDSOi8L5khhfE6yDK+kMYkGv/Ud0acvQ8dCYf
 CiZ6LHOIQZWvYIU2fJgY/Bf3jw1mW0ZQELmCCryqT5VdziVg2wOiTYe+fqFhX2ip7Au5hjNBtPf
 3DW73Bng8vKLoB9z8yAEUAU2i04Qs1DPCadU4+mzac5ULv0nIsABlJyoWYl6joVglS0x/ndKu+k
 3I82rvpzkGAU0dpvoo+1f/JGmFe1j7ihbEd7no8grmv+Qg9TTkZmo8oto1oMAhCMWee0leAmW5Q
 dERG1/aVGOzdBii1uiIos+9RrH74AcLUBc8n3Iu7f7Y3F7a6MeiLIsmtLxSoNxqcpibFIf0dTOf
 BELCkd8kTIg969VRDuel03iWv2YcPVLhq4pdYtuK7cR2f+2jhIidvIBUXyoV1COVxN6HfffmLIe
 mTNsfCC1IV2wZ1gytdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64946-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EF3968AC65

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 7 +++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 55a4fa356985..81fcb2854772 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -315,6 +315,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 961dce2e6aa9..eeef453c583f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..6cde94d86408 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -18,6 +18,8 @@
 #include "iris_platform_sm8750.h"
 #include "iris_platform_x1p42100.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -113,6 +115,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -142,6 +145,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -179,6 +183,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -208,6 +213,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -243,6 +249,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 375bcd923476..41498f94480e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3


