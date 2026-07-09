Return-Path: <linux-media+bounces-67166-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fg2oNICoT2qNlwIAu9opvQ
	(envelope-from <linux-media+bounces-67166-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:56:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C072731D62
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:56:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cO6M203q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b73y1LcD;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67166-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67166-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DDAA3106C57
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955C2322B87;
	Thu,  9 Jul 2026 13:42:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D367322C73
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604533; cv=none; b=lQ6maR2Fpsqcr4ZNrWeJj9LCDN9JtEoyT5hFoYRbcKmE2scpQTFbsiy7hUECTCV37IyrqSsqygIEmG8mt+Rp9lXUyBKrDqaV0eDPsqfxvt7zzQJ3xA6/3Dz2yGwTL90XJisQZ1twMV4NMiF1eV6/4M7V9unBclijygsZuX2Jo2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604533; c=relaxed/simple;
	bh=acnsSKVi2aqjcn7maAiEpfFJlJtCDzjZpY88Lh3Q2Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSoxFHo0ws5CCnOqUcPc6TP/okmP2mS6+I9q9GXM7sfsQ6L1oE4SRGAJuEfzKBFw12hMoXLrz5eXEkCFFnddwyWVVhZgt3i8vxYyQJbZFxplBw/J+2poJox44/zNuWla2rhmSSnRnuhkcGMyMaASUEw8o7eUO3xxgNOpQCwXtPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cO6M203q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b73y1LcD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNSIf1672672
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=; b=cO6M203qZaAkVx0t
	tRs11xo5OK1AxwHsjmLF6x7TNpQVlT3Y4b0oxz/KaVblLZX3TceNR3kAALjiaChz
	D6qJwINTGHUPXx1lzAuy9zU2w0KzyBwywVk5VcEqq6+O+kNb67ykEtmB4KO6KP9N
	mRkriKwl3Tibkua/oyxg1d9ra50K2UR6ILGRql7WhuXBEmoae+UAIUHZ9VL8GESt
	veYIe/+nDw073zMRlTEzH8Pg6qa7HNICbUqtJhVILb+1eOTp30FCC9U0tjSmgiTa
	D1DdemG0HaHGYC7vSc6Lkp9+KIV92yLMqU9KtyoIktfjAieDI/9cEGYP/c6qWZI7
	g5PwtA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqschmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e80385dbso353253137.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604529; x=1784209329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=;
        b=b73y1LcDEFm/R8P3cKwH9mSD/GS6tN1YtRFA2tl6aN1JkA2w/RnjY5GuDUv9xExR1M
         FNhlCU2Me/yQS7pftJuSd9nhBkW7FsNy80xab7+HedntJDX1W9ROTZimrEr2K8K2gujE
         snhGC5thzX0ArBlrCQOnWJ8tuNwzfSOpuOJUBIJdDJY2+prRJP6zp/GIcW9xCPUR21bS
         LkTXb8SeyuH7iB9fO6B4Y9mQ9J7SN/3b4Kolk1kIuwzKDvqvXzUNgqD3Zlub19bGb9h4
         LLli0xkm32eeC3p1dPrWuXAGKLur/PhW4dDtsznhRHiwW36W0gLinnrHhnKsBxXWrBcw
         iJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604529; x=1784209329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=;
        b=QK4E0q7R7WKYeE9W8RTGtd1E1OVK5Jznv9gHgkf9zaE5dtPMk8pw3ttjVJuBfw+t1z
         AASDwE8jtBmyk2FxsDqW3EY6DRhHivYBS1K+uh+yJp3gbTTLLXwZ/mRIC5VsZriCINqL
         Ga599UNRMGE7LGMLW1IeOaqCYYLg3U+G0D931UPXGYsdaBQUfsGS8c7FLu+PPpv2nleX
         bC7C8zFgJVeXrzPvfi8pU3kRsQChjmVxtLDlpUmWMkmWggk7xvikC9cMY7FlL3s8b+dr
         oqE05zCkydagp9UJEHnzaHTQHmJmTxd/fYvzhNRcBKkOveR4fXLtVszYYIIUS6f4A3z4
         nCYQ==
X-Gm-Message-State: AOJu0YyaooO3chZfqOJtoTmTXTU7tOZfaGrw2KoGnKYAlNI8Fi0On6KA
	8tGFHbKctgVJIlX9PQEi9JFivpXXI8GMoaZwLTUErZfS9pZJTcgOr+Fv3dhKIh1K1+EG7YFByN1
	CDG4ucktcudFKOO6URsGCzHUIWypHAseqplj4ZIlVB0SuA4PKexbqXcZEc7XoWkI/aUYFGdli6Q
	==
X-Gm-Gg: AfdE7cnVFUra2aqqfysykqyEZKSuB8ABQu1fYzyY+I7Du/B0pXkkTBI7wG5qQMscz0m
	7RhxCg4R7mSBhp+ystXc+V3TnKVenyZ3Vy18cJiw++Pgqw8j3Tj2K35M92WyHaVLqvsAHo3JrW5
	zO3MuP7TjeTQ8sJS/cjOrPoWs0kJUA+IOvRT8tn9S3CkPMYZfKinNEttpZ0s4vFWyIbaPOxQgYH
	ZOGFyISPbo2rJ5FO1iL606A7Ljrkd+urquvLEfgD42Ty0diKDP0ZWHAfPum5h6xeLgUI4sEGGqI
	KSB5pLqthvqKbOUpI2KCMO9FOh/GhWdeEECPhJWNNTHExKITZF7Zh95UFE0O3C0GRCt4saiIW2C
	FQ9BzCbM9tHWJ7S3WqRebDWRMzMwjcCq21CjcRAbuhtuxyX3jUt1P8EprTBccOtZEwq0SheDjGK
	amG8bud9Pj0qpyElMD77IFptBl
X-Received: by 2002:a05:6102:688b:b0:739:18ea:565f with SMTP id ada2fe7eead31-744e0310bcbmr3879439137.21.1783604529484;
        Thu, 09 Jul 2026 06:42:09 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:739:18ea:565f with SMTP id ada2fe7eead31-744e0310bcbmr3879411137.21.1783604528742;
        Thu, 09 Jul 2026 06:42:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:55 +0300
Subject: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5132;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QN/GQkI9t2+DaweZ0uUnFoB7t+XgnQ7MgtUodJ5uTko=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UkHPvbbqFQnR8/r4wF4+bOR69aivY98++Bc
 bTKVYb3bDuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1QatCACGpcvMXpTn4K8hntSyBuA+tEaQRVaL1pf6Tpr22MZzSC8ZqQ3iXq3EjJzSNwmE23G0WtC
 QVgQlx+gucW7w3OJ1vhTGXziJPHRonHR1zvbiPa9iMYN7n4wJKYDt9fHy4Z6OrTSE2hN+FHuyBP
 bLKl8Gs6cM4cEgpCGa7uoOeaMprJVCG22Kg07lE2NQuwUQR5v1fYPAtM2Et1KxFgPTcCvuobjIe
 K1UTNHZGTiTWphZ4cX5LlDNXwtApniu10ExsVKYHiVHPAiHDAtUO0/JNVhACo622J0l9WxDDLi/
 rv8bNGVWZYmcWtX2X4JRzNbHsZUPnPSrv7Dx+md3YO0nvu/x
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX9M5kymFEjrIm
 strvstbvN9HGypviOdui4pIxgwym20/ogezJzOHTQSBxpQYlGAMogCM7qFbf+loSI0FHhHksMMj
 iYvutXjMByr2wJZgiFhA23LwF+Oa88Y=
X-Proofpoint-GUID: OHywZ8MWNApw8XmNGI6SV_L-lu_8_pCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX+vLL/P1gLEPs
 t99oCS5pliE0781EgMWtoCp9mRkl9sfvTzSWhh3LxcVuoH7IsziJHK2OEJ/+oNHbUO4tStMQQJC
 NwZhLEbp+YqlVtEzHD4RphJQ6HlQbYCMjKCX1HYqdd5E0JtuepztQde2rB//jUEFxRapubEHjnK
 hFj1cXLx18n4SZSVE2uLZ1wf7mu51mEXUkcTSLwqwaYXY/Awp5O3Jq6C+XvuFrcheIi0y0+mIjc
 J/0Qo2kbbwySaOrb7jxm+ikRJthjio6ce8QZJbxGDYDxqr+L8qHisboTU2fniso8tCdP9vE/jSJ
 PsB4+Qpj/4xNu1U7sywKZFgrcbr23lVQcAH3GwjjsF1wvl27VyAreuDmXn2TAqwcF5vLRs6Avfz
 JmJJxTQsn9AabQ/HuYrE7KKBP0k0jrQx9sajjGJlafANYsWYKE8PhcFk4BlzgKJi6x22Cmk27S9
 E+5DMCT9jc75hRK/vZA==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4fa532 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gsa84qigJ8via7s57H0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: OHywZ8MWNApw8XmNGI6SV_L-lu_8_pCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67166-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C072731D62

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4c8bc7aac135..9fee5f28097d 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
 	V4L2_PIX_FMT_QC10C,
 };
 
+static const u32 iris_vdec_formats_noubwc_cap[] = {
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_P010,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return false;
@@ -110,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -119,8 +132,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 16c52ad07e2c..2f2c56bf9122 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -89,15 +90,25 @@ static const u32 iris_venc_formats_out[] = {
 	V4L2_PIX_FMT_QC08C,
 };
 
+static const u32 iris_venc_formats_noubwc_out[] = {
+	V4L2_PIX_FMT_NV12,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -117,13 +128,19 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3


