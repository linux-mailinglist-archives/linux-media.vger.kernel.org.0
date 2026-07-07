Return-Path: <linux-media+bounces-66916-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PHKhKEt+TWpT1AEAu9opvQ
	(envelope-from <linux-media+bounces-66916-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:31:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3172720165
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:31:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oXsRJxzY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cEaL0UNq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66916-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66916-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3BDC301560D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 22:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0044D495509;
	Tue,  7 Jul 2026 22:29:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EDE48C8DC
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 22:29:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463387; cv=none; b=K8JewaGZst0DOWAJ+Ykl9fknW/6LKrsm9H/tlUn5x68eJHAfkh56wQYwBh+Dwf8cR65dyJmWMXOE3LzRD/UrpXGVwMl5TovuGGnnIPX0WHRKG8jbmxcX/vTTltIuNoq54TgjqMElK7OfSPO8UdIQQps7IA588TXMvRgrtX9cBfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463387; c=relaxed/simple;
	bh=D12Kqe684KHhLTzzN0zwuJ804Vm06UzaITtnqf7NpI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D10IGJIn9OYOJuWtPPV0MphnBmj0QX/UCP55Y6rF5Tx+iI6RNedyl7KMXA89phnv+cLh+kIP9WXzoPkzjm9kNywudExFI8XRuR7Tm0Ot3bVi1iNmMR6xd4H9geDd9F1zHrTFkhcvgepVbrXAzfPhY4GhIqzbRlBst7gJGsLol6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXsRJxzY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEaL0UNq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5RXC370216
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 22:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=; b=oXsRJxzYj1RzQzG+
	phyXbmcmkaDzw1ilGkRwI9o3SHS2evQzkpU7guJwMUecNW+BskZK93wPCHvKzq2w
	6n+dwZ+KGu0AgC/3kg9ISm/ZmDzEVRGTXeQJJFtU9Umpfw1x6yXo3oHQGh2Cp8A0
	3aqOFmgiCFs4lCxGKwPOLOVyfBPEyqq0v9E6h9sdqJwBF+thTX5+f/r7Kr6dVFjm
	I5FTMEEg9sGXIWuL9F/bCa2TfB5xRH9dKJlc/+P/sojEBa2sTOuNa9PGgb4Fjp6v
	T6UAIfIw/1VlWCCkDu8XM2SqJYJLrtooflxByxh8SJ5Gtuy9k3l5Fw2eo4ViK2gy
	7Ep8sA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun3q5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 22:29:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-736e9030d93so35162137.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 15:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463384; x=1784068184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=;
        b=cEaL0UNqsZt8Ln6O1BjrP2fFCsEUgwsDmuCTFntUxivXo17v/MUr5e6L9prPpWgQHF
         dPIuS1O6VzjtiDvjLyqnkjGo6+YL585SHNsJcLO8fuGTqfcsIxI56RMSZ0npkjse2CnB
         WOJFalktTofGOmIKE6VDTKR44ARIV9+1fcKTxnBzCoTBFugqx0bpaD0VEalEJaSjS6+6
         xKbWiT5FMz12Byu4S6GEvrdewWnsr+/Md5auKnbcQV1UP1TI8zaJxe0XRdrEz43RJ2Dp
         m08dR9Eu7+PiYLc6iZR0E+ySfoRs0trblHlnxe+FVGgtyuZJxSFhPfpA64lq6gjZtQqs
         P54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463384; x=1784068184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=;
        b=GIIWLDD5Z8Jr+RLW3vjA28we7eGJnK/jl8/erD1YC3z90rXpqHU8FSAgCJza/FEPtq
         Hz3JiQiIi9HpGpuy7GRdo0cjpsizPIKt70u5Q+SbLhFfKNuau3qMecM/I4P0Y39hmmqG
         1h3oGOPBy7InSAh/zqLamFcn9fiRaYbTONZKE6b8ufAmT/1TF00BWKkQe6rjgYymcEDI
         BGMWrhN+A4f4En0gFOh/jpyYjMtIQF3u/hZZXNfIiFyfTqg3uX7h/L0LQQ9biQ4l1MYT
         gWEdBdTAGeqlRmbSjRiGe2UxnKcnqCRTND/qi6/2di+Yxf4e3zu3uF6qUtHQLISVfXO5
         bOmA==
X-Gm-Message-State: AOJu0YzmhUZc7W8Rh8NPRtK5LNtxe4SVnOvqRTVMPYMCnOyTP0nATMpT
	fYmx+eXmqStmDAYqk8Q1G8b22RUM/xNBKNdEZk+GV7f//5dS2onlRykOnX+Nu5vPEuCZOVCdmlJ
	hMWaF4QxrPwJISwkieo6R7qkrbzUrMYDC3wtzrAmIsOPJ4fFV49RlIC5L91/MghLuyDjo0aEKOg
	==
X-Gm-Gg: AfdE7ckO7qf20GLNqel+QjlTATll0zEnnX/stKzuMpscAF3mPkU0HI7jrtD0sWxinfj
	/mXpY6wVzMjsQc5etI366pqXBe4dQdqsJYiJOX8tgQONvwcHTKU3lQDYi+hBXfhDsXbL91wt+YX
	CElN2YEuqp823ZPswjwZIftm5jH0bB21nK689+mB6yAY9p/HcFVXQR/lP0dt2p7FLIrLY6XGCD8
	CSBOH4u56/aoR2e0EYJ16RZkW6OQ4zp/haKLc6chFio2aLAX59GaZCCN4YPbwqLo9AeEn0q8Ki5
	cQMeE3u/puxiowsBq9ZDj4PQWAcoZM3RtL7kKWj/sE6GtSHitP79wQCIMFp5gC/5lhlzdJo5dNO
	O1LEy/USiDvwYPe2//8yMW+yK/6JFB2XLNHj+4AfnebsLDFKVLCdiZ4IN/YayKLGER0T+K5ngeC
	WDVjYTuLxLyBEIzI806yDH/vxw
X-Received: by 2002:a05:6102:5615:b0:737:bcfc:5fb6 with SMTP id ada2fe7eead31-744b7c951d4mr4346742137.1.1783463384165;
        Tue, 07 Jul 2026 15:29:44 -0700 (PDT)
X-Received: by 2002:a05:6102:5615:b0:737:bcfc:5fb6 with SMTP id ada2fe7eead31-744b7c951d4mr4346721137.1.1783463383705;
        Tue, 07 Jul 2026 15:29:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:52 +0300
Subject: [PATCH v6 09/18] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-9-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5396;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D34MZH1YqLFpbixHKqEmKSwRwy+EVhESWZFGb+Rb8ys=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2pmIJ+Ta2MfVrlSZNGx48C9tl/beW8v7ddU
 IsJw/c4dw2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qQAKCRCLPIo+Aiko
 1ZcgB/4pcPaP09mT5qhJGmEp9afqYZ6BpWw3hSSmIGDTgjfJqTnm6MwI+wV2AEPSjqBYODQUzX4
 KU4nSTrSUBZ7Jo68cut+341DT1Ej7UI2/V/OLkK2Du06DURZkwIUcf1AoAmAHxkTkk+GBLw94SK
 DTyuTshDYTjGiwCOWpL6lCs2W8KS5PiQRc1ogGpA5hjk8np7ll6qwq7EjGvTOHQmU/jLV8ZpRQ8
 wLbwH2K9hSbKJoBnat4MXZSmpiIFa97hV+avxlqkt7yLBAz7Xrm5vXq09YGHKNe3iqhvVd1dADw
 sI4cZQImVOGocTGFt4M/jHNOYgbLQ9Ix2OsDTY4OlXsJSGjA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX1Tff0P3RlmVh
 tqKz/nUgifO8ygeM0+lUMO5+PBrFLIMCiy6wG686J8F2BQrGU/wtUdyfg3R03ANOeHNiU2sRc/+
 XTC9nsTUEGAQUVoqhycjXCYoHElGYDg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX/fJSKVFVgKH0
 wniG5PYqFuzNCcOlgYwhzcOKK/1OhF9IdmMutbGp8h9P12USjmAUfyr35ZCZTdNi1YgaiadbNiD
 agj58znVV762JyUZ0H+Ldpxbe0HjCXp/Eu4YZPSCg5oLkTCZRmBe4CGCzU3PTS2BXUpMMOFT438
 UCp74mYRuifDx+OYfGq4uLGqdkK8MFPIZ2x3X8PHytUyRjsM1ln/Qp+/2l7XlaI5elPBDrST++y
 Cn6HBTPTic3Mg15JYgI+LnxtFaXkgq73QxYHATJSilo4OHOlyPGAcmXvFYv08yULjQAza7oOJX2
 BttQrOCAmno5fXvqeZOFSf/+OUvA5IqhYT3G4R+i1jEIdTy4U1PD8urSMUIwJSeKpOLxscls35e
 Im9wQ/Eo+UEQzuz5a4nhKu2k2mmxQ4f2Y9YdXTSp2tcWZIY1RklG3OqRxIT1lj6lONKG2J71Uuq
 846lPVUPXtpLTcv95Dg==
X-Proofpoint-GUID: 1USLTDr2vqpHlV5BMCp0m6UVRVXR2CTI
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d7dd9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jsq_lj1EPjN6R-bUmboA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 1USLTDr2vqpHlV5BMCp0m6UVRVXR2CTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66916-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3172720165

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 5 +++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 81fcb2854772..accc1627defd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -316,6 +316,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 940daddbafcf..e194f67a6f48 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index eeedde8fc9ce..b8099d7ce556 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -116,6 +116,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -146,6 +147,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -184,6 +186,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -214,6 +217,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -250,6 +254,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..caeaf199cef7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3


