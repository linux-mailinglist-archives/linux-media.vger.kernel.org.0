Return-Path: <linux-media+bounces-67006-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sWxwLvliTmrrLgIAu9opvQ
	(envelope-from <linux-media+bounces-67006-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:47:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A21D7278E6
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:47:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=inHW6wmL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="JNXhn/x8";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67006-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67006-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE50A314BF1E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D8E48C405;
	Wed,  8 Jul 2026 14:34:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D33B416CF9
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:34:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521248; cv=none; b=T5sZY84RwP5yOAUY+L83K7IsPSU81aoHvojCz50LZk1uSZ2geonI6QuhsHbHMXs1SLwq5k8cUMOhLDcKK5gLFNrHCFkBvCOPsdr+kOFn1zihPvwj8fwYDoFuCITYttLrieeeH2Wa5xyEd0ikXKn+K6KwUYvA1bT5g3tgdOdompQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521248; c=relaxed/simple;
	bh=W9GQ6QR1JtY+YQtEccM46qsoY4lGhyLNE1fe8YxR7W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWTBNXJgq60rdMoGgjy+caGANuwVkWGD5/kIeVvgjlVvPHDx1vqvYJKmSK6ptPDPE+gZQ1qco53TPD6h1oz1+h1jq0MXSortTLFxBoTT9ASvvP/Idw6mL3RGdmizAw9yE9KlN+BxBiGo4dsYD6+/GbkRSMgYMm5PAUIJtz4/iqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inHW6wmL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNXhn/x8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3BW92751092
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 14:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fuuPcTdtSUx4ktmCfxB7qi9HDDnUWY78a+UtvuR/mKQ=; b=inHW6wmLy9wnj9NO
	rw0K7/sElJWgPGN5ADayehLMYph8/1SETAwlYmL3kwt7sFRnU+tW84GMVFERRi7i
	D8Q1E5KMmi7zyIWe9zGsPXkYo9dd/A9+aK3X5W5IgbzbdWssTMfRF+NkAXylg58q
	FH8bmI6P1Lu9K1/k677m3gsDJYMjSWe9uc7KonmxC7GMKLYHc75nvA1dhACXwy2T
	WBRgbpKqMxrvkmVdFYTFBg/iKyES2QbQmsIBTnVGeMMJvjH14buPpZiTWe3YE9MG
	tmjSTbICTcRP0Pd0IUFvTdKIEC5lZcDo+lcH0VqdR4ebUlbsl5EHC5sizFlGkZAK
	cGWkpg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hj65c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 14:34:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so8061561cf.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521245; x=1784126045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuuPcTdtSUx4ktmCfxB7qi9HDDnUWY78a+UtvuR/mKQ=;
        b=JNXhn/x8vrqM7/R9z1DZRaTiBmwAXxNWFn+5ZLrbWJac+0AfKfWS5tpoKCwxBmRno9
         JWM2/xkyZ7xDrnkJFr6pgAdVa2agV87VeMghVHpjrCVQCp8FG8lmHp/RnAyBPtkr3St+
         RNI7gehHFwjDUHdYdfP0V9GAse4JSdvuB5WRDKq6vMBQ5g3qoagbL/ushmrhBMbYSXCi
         jMguFQWCwUA4lZVlooReN8v4e3xTA8VUsz/Z1tCww9967cfCAx1pQewLgn+7qoaWybTH
         NqdVVBxI1++Z1ZJYWkJTjYiNEz9RV1xIiC2IPntcionGW44+tSpGk0kE3FDEzLAWlnKO
         tWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521245; x=1784126045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuuPcTdtSUx4ktmCfxB7qi9HDDnUWY78a+UtvuR/mKQ=;
        b=GK+XEy5Ftqk5PsbTOUB203N7I3dHmgkIaXIjvVs3LX09gvHfQwjOg4mM5cI8auTEVt
         wnO1BIM6EVcwblvwYErKV/YjNJBJM3vdv4m5wJqxlwqAuXAYj0K465T+sd5ua7CLPU30
         xgnAtobSdO3qHI/wAjz6op1+pnit8A84/2SosjazKutzhkUkryxXPFYbgmQ8Per6z6d3
         UkS9K/wZ/rDg7G7o0Q+Jzwp8DiIr2GFMJZAGGT+RySYW9fy85TKvbUv7HVJTZjTdjfWP
         KuInnAa3SCIeQuvQQa+VrExAj+tJnimVD1ffCCwEVTZTrtADoXugCvECVpHq0tHrgg5R
         vRAg==
X-Gm-Message-State: AOJu0Yx/kIA9mROErRK+71mVwtjgFM8e2Y6fGoNDGzl5RKT9eantq+lV
	a2iFWinwcauYIVgLY3HJwlH9XoSwCHn2uYQ+UYX6yXlo/mEa/m3L3CT33CCEL/3XZChvIw5nCTr
	9HZNB0TVyyg7RE3xmCdpJgtGYz4P0O062OWsj8NgjbTX2/Erao24rYr1flwGepMeFLA==
X-Gm-Gg: AfdE7cnH/9yzisq9cPyhAYn+9nNi1MrtD9Q6KvIzuDfGwFqkXWWJ+8eG1/XQV4m1NW4
	repM8TPB6+UckPQanNCvtguZv80KBFBWr+C+eau/meTUPiMSt4sBY9fl5vfKFBhLhphEKPb4aWJ
	nIbQMKXEhlGlb4S4WLj6IUBMSJDA8cUJlnNdqcaxxOfD8V9/Cop7lYWMhL85FIcCbDvDowO/Gpc
	pjcbl2VP3SxNaUTka8PUoR/FaEMvlwgXeZj4wjNzZv16OY1AgA7WYRbx2Nt8areecCQT9i6Es8P
	527UugI23CC45mEOlGpkG8vkODhGL9niRB4KFL25JJESOMcoCkBHMkBgBv3N4x5iglpMIauMdyn
	lIVY7XtboGWMVtTJ+/+9arnO0NrqWKwaA4ESMQnviLoZ7WOhnhDDvR32wpBsMXt1eig3OU7kTq7
	5lC4E=
X-Received: by 2002:a05:622a:102:b0:51c:1b78:b044 with SMTP id d75a77b69052e-51c8b41e37cmr31615131cf.61.1783521244609;
        Wed, 08 Jul 2026 07:34:04 -0700 (PDT)
X-Received: by 2002:a05:622a:102:b0:51c:1b78:b044 with SMTP id d75a77b69052e-51c8b41e37cmr31613531cf.61.1783521242894;
        Wed, 08 Jul 2026 07:34:02 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d799dfsm8960807a12.17.2026.07.08.07.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:34:01 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 22:33:33 +0800
Subject: [PATCH v3 3/3] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-og0va1b-v3-3-de8e44455a42@oss.qualcomm.com>
References: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
In-Reply-To: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783521218; l=13795;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=W9GQ6QR1JtY+YQtEccM46qsoY4lGhyLNE1fe8YxR7W4=;
 b=OJxBEqmDNnE+mpvn4QgrWkjbdOM+4xIYymQ2xYAUZUt9rDFlGZ+vTSfZalCs8Bq77atAjlP1A
 NNS62HjbnMDAI9EvKSbIlcwBSxsjyIwhohtOBPeOA8OsFgPHQLpAwKF
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MyBTYWx0ZWRfX03tnGdyqZO7h
 Fy4/xlqVdDEmDNBM7HK74McRdWNwj+tTT8pQwy4fRbsC6lEoIIg0i07XUjr6AUTQdJ1tG8r0G2H
 W1xnOdOoyF5j9WekYgIInit4G+eW2ajyP8I7RhKkisnIBKEQHGT1gU2RWgGJilsVp8gZAUMzaAy
 Epaia1ADIY3ewXgPxdDHE7qQ/B1x+YFQf2Xp1rECX9tNOH6XMtuc0WiTScXO5oB8UHs5uKZhLcA
 /n/aQtqhYbqfjZp448X7OwPImc0OhjWVo8LtEWbC1bPHvLUu+cClo79ExPHab440a+oE0uy9Djp
 OffyXSxyf3AqKASYE1qy8twTBaxuxEYBvIiL50ryoQC41Zvg6cB5xjCSi2YL1adWmWerT0AsZ8y
 p4XpQ2eIKMJ5IDGKidLRJ6U7JOkMx0NLQgwAmHqXSJg8ufoGC7vdg/oH9Ufg9zqykRWp+8NzeP6
 +NEUeUZc56DTs8T3HqQ==
X-Proofpoint-GUID: W3jaSfXMtW3Km7mUlBX0qE3iEHxV-5iq
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e5fdd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=tvl-DPrvojhGWlv_sV8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MyBTYWx0ZWRfX/tQBpN7oJwmX
 Zq2fTZZpDsO2wD1aMP4n+bsjkDpYpG3USp5+9WGXWgdpFCciwhGHiGRbDvmhPQ1xWIXBjQcKNu4
 6Dqodavwy8j/Dt0rwr/0fdYjiRqKvdw=
X-Proofpoint-ORIG-GUID: W3jaSfXMtW3Km7mUlBX0qE3iEHxV-5iq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67006-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,linaro.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wenmeng.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A21D7278E6

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the OG0VE1B. It shares the SCCB control interface, power supplies and
the single-lane MIPI D-PHY description, and differs in its chip id, the
test pattern register, the register programming and the output format
(10-bit RAW instead of 8-bit).

Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
its 640x480 60fps register sequence.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 278 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 266 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 041342fbe3c822400388f58a03e6057e186f060f..c558cdd43314931db35e463641dd28e10b94ec8a 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -14,10 +14,14 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 
+#define OG0VA1B_LINK_FREQ_480MHZ	(480 * HZ_PER_MHZ)
+#define OG0VA1B_MCLK_FREQ_19_2MHZ	(19200 * HZ_PER_KHZ)
+
 #define OG0VE1B_LINK_FREQ_500MHZ	(500 * HZ_PER_MHZ)
 #define OG0VE1B_MCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
 
-#define OG0VE1B_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OG0V_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OG0VA1B_CHIP_ID			0xc75641
 #define OG0VE1B_CHIP_ID			0xc75645
 
 #define OG0VE1B_REG_MODE_SELECT		CCI_REG8(0x0100)
@@ -45,12 +49,18 @@
 #define OG0VE1B_REG_VTS			CCI_REG16(0x380e)
 #define OG0VE1B_VTS_MAX			0xffff
 
-/* Test pattern */
+/* Test pattern - OG0VA1B uses 0x5100, OG0VE1B uses 0x5e00 */
+#define OG0VA1B_REG_TEST_PATTERN	CCI_REG8(0x5100)
+#define OG0VA1B_TEST_PATTERN_BAR_SHIFT	2
 #define OG0VE1B_REG_PRE_ISP		CCI_REG8(0x5e00)
 #define OG0VE1B_TEST_PATTERN_ENABLE	BIT(7)
 
 #define to_og0ve1b(_sd)			container_of(_sd, struct og0ve1b, sd)
 
+static const s64 og0va1b_link_freq_menu[] = {
+	OG0VA1B_LINK_FREQ_480MHZ,
+};
+
 static const s64 og0ve1b_link_freq_menu[] = {
 	OG0VE1B_LINK_FREQ_500MHZ,
 };
@@ -73,15 +83,31 @@ struct og0ve1b_mode {
 struct og0ve1b;
 
 struct og0ve1b_sensor_data {
+	const char *name;
 	u64 chip_id;
 	unsigned long mclk_freq;
 	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
+	const char * const *test_pattern_menu;
+	int num_test_patterns;
+	bool cache_test_pattern_reg;
+	/* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole lines (0). */
+	unsigned int exposure_shift;
+	/* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B keeps 1. */
+	unsigned int pixel_rate_mul;
 	const s64 *link_freq_menu;
 	int num_link_freqs;
 	const struct og0ve1b_mode *modes;
 	int num_modes;
 };
 
+static const char * const og0va1b_test_pattern_menu[] = {
+	"Disabled",
+	"Standard Color Bar",
+	"Top-Bottom Darker Color Bar",
+	"Right-Left Darker Color Bar",
+	"Bottom-Top Darker Color Bar",
+};
+
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Colour Bars",
@@ -115,6 +141,196 @@ struct og0ve1b {
 	const struct og0ve1b_sensor_data *data;
 };
 
+static const struct cci_reg_sequence og0va1b_640x480_60fps_mode[] = {
+	{ CCI_REG8(0x0302), 0x31 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0304), 0x01 },
+	{ CCI_REG8(0x0305), 0x90 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0323), 0x02 },
+	{ CCI_REG8(0x0325), 0x68 },
+	{ CCI_REG8(0x0326), 0xd8 },
+	{ CCI_REG8(0x3006), 0x0e },
+	{ CCI_REG8(0x300d), 0x08 },
+	{ CCI_REG8(0x3018), 0xf0 },
+	{ CCI_REG8(0x301c), 0xf0 },
+	{ CCI_REG8(0x3020), 0x20 },
+	{ CCI_REG8(0x3040), 0x0f },
+	{ CCI_REG8(0x3022), 0x01 },
+	{ CCI_REG8(0x3107), 0x40 },
+	{ CCI_REG8(0x3216), 0x01 },
+	{ CCI_REG8(0x3217), 0x00 },
+	{ CCI_REG8(0x3218), 0xc0 },
+	{ CCI_REG8(0x3219), 0x55 },
+	{ CCI_REG8(0x3506), 0x01 },
+	{ CCI_REG8(0x3507), 0x50 },
+	{ CCI_REG8(0x3508), 0x01 },
+	{ CCI_REG8(0x3509), 0x00 },
+	{ CCI_REG8(0x350a), 0x01 },
+	{ CCI_REG8(0x350b), 0x00 },
+	{ CCI_REG8(0x350c), 0x00 },
+	{ CCI_REG8(0x3541), 0x00 },
+	{ CCI_REG8(0x3542), 0x40 },
+	{ CCI_REG8(0x3605), 0x90 },
+	{ CCI_REG8(0x3606), 0x41 },
+	{ CCI_REG8(0x3612), 0x00 },
+	{ CCI_REG8(0x3620), 0x08 },
+	{ CCI_REG8(0x3630), 0x17 },
+	{ CCI_REG8(0x3631), 0x99 },
+	{ CCI_REG8(0x3639), 0x88 },
+	{ CCI_REG8(0x3668), 0x00 },
+	{ CCI_REG8(0x3674), 0x00 },
+	{ CCI_REG8(0x3677), 0x3f },
+	{ CCI_REG8(0x368f), 0x06 },
+	{ CCI_REG8(0x36a2), 0x19 },
+	{ CCI_REG8(0x36a4), 0xf1 },
+	{ CCI_REG8(0x36a5), 0x2d },
+	{ CCI_REG8(0x3706), 0x30 },
+	{ CCI_REG8(0x370d), 0x72 },
+	{ CCI_REG8(0x3713), 0x86 },
+	{ CCI_REG8(0x3715), 0x03 },
+	{ CCI_REG8(0x3716), 0x00 },
+	{ CCI_REG8(0x376d), 0x24 },
+	{ CCI_REG8(0x3770), 0x3a },
+	{ CCI_REG8(0x3778), 0x00 },
+	{ CCI_REG8(0x37a8), 0x03 },
+	{ CCI_REG8(0x37a9), 0x00 },
+	{ CCI_REG8(0x37df), 0x7d },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x00 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x02 },
+	{ CCI_REG8(0x3805), 0x8f },
+	{ CCI_REG8(0x3806), 0x01 },
+	{ CCI_REG8(0x3807), 0xef },
+	{ CCI_REG8(0x3808), 0x02 },
+	{ CCI_REG8(0x3809), 0x80 },
+	{ CCI_REG8(0x380a), 0x01 },
+	{ CCI_REG8(0x380b), 0xe0 },
+	{ CCI_REG8(0x380c), 0x01 },
+	{ CCI_REG8(0x380d), 0x78 },
+	{ CCI_REG8(0x380e), 0x08 },
+	{ CCI_REG8(0x380f), 0x30 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x08 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3813), 0x08 },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3816), 0x00 },
+	{ CCI_REG8(0x3817), 0x01 },
+	{ CCI_REG8(0x3818), 0x00 },
+	{ CCI_REG8(0x3819), 0x05 },
+	{ CCI_REG8(0x3820), 0x40 },
+	{ CCI_REG8(0x3821), 0x04 },
+	{ CCI_REG8(0x3823), 0x00 },
+	{ CCI_REG8(0x3826), 0x00 },
+	{ CCI_REG8(0x3827), 0x00 },
+	{ CCI_REG8(0x382b), 0x52 },
+	{ CCI_REG8(0x384a), 0xa2 },
+	{ CCI_REG8(0x3858), 0x00 },
+	{ CCI_REG8(0x3859), 0x00 },
+	{ CCI_REG8(0x3860), 0x00 },
+	{ CCI_REG8(0x3861), 0x00 },
+	{ CCI_REG8(0x3866), 0x0c },
+	{ CCI_REG8(0x3867), 0x07 },
+	{ CCI_REG8(0x3884), 0x00 },
+	{ CCI_REG8(0x3885), 0x08 },
+	{ CCI_REG8(0x3888), 0x50 },
+	{ CCI_REG8(0x3893), 0x6c },
+	{ CCI_REG8(0x3898), 0x00 },
+	{ CCI_REG8(0x389a), 0x04 },
+	{ CCI_REG8(0x389b), 0x01 },
+	{ CCI_REG8(0x389c), 0x0b },
+	{ CCI_REG8(0x389d), 0xdc },
+	{ CCI_REG8(0x38b1), 0x04 },
+	{ CCI_REG8(0x38b2), 0x00 },
+	{ CCI_REG8(0x38b3), 0x08 },
+	{ CCI_REG8(0x38c1), 0x46 },
+	{ CCI_REG8(0x38c9), 0x02 },
+	{ CCI_REG8(0x38d4), 0x06 },
+	{ CCI_REG8(0x38d5), 0x5a },
+	{ CCI_REG8(0x38d6), 0x08 },
+	{ CCI_REG8(0x38d7), 0x3a },
+	{ CCI_REG8(0x391f), 0x00 },
+	{ CCI_REG8(0x3920), 0xaa },
+	{ CCI_REG8(0x3921), 0x00 },
+	{ CCI_REG8(0x3922), 0x00 },
+	{ CCI_REG8(0x3923), 0x00 },
+	{ CCI_REG8(0x3924), 0x00 },
+	{ CCI_REG8(0x3925), 0x00 },
+	{ CCI_REG8(0x3926), 0x00 },
+	{ CCI_REG8(0x3927), 0x00 },
+	{ CCI_REG8(0x3928), 0x10 },
+	{ CCI_REG8(0x3929), 0x01 },
+	{ CCI_REG8(0x392a), 0xb4 },
+	{ CCI_REG8(0x392b), 0x00 },
+	{ CCI_REG8(0x392c), 0x10 },
+	{ CCI_REG8(0x392d), 0x01 },
+	{ CCI_REG8(0x392e), 0x78 },
+	{ CCI_REG8(0x392f), 0x4a },
+	{ CCI_REG8(0x391e), 0x01 },
+	{ CCI_REG8(0x389f), 0x08 },
+	{ CCI_REG8(0x38a0), 0x00 },
+	{ CCI_REG8(0x38a1), 0x00 },
+	{ CCI_REG8(0x3a06), 0x06 },
+	{ CCI_REG8(0x3a07), 0x78 },
+	{ CCI_REG8(0x3a08), 0x08 },
+	{ CCI_REG8(0x3a09), 0x80 },
+	{ CCI_REG8(0x3a52), 0x00 },
+	{ CCI_REG8(0x3a53), 0x01 },
+	{ CCI_REG8(0x3a54), 0x0c },
+	{ CCI_REG8(0x3a55), 0x04 },
+	{ CCI_REG8(0x3a58), 0x0c },
+	{ CCI_REG8(0x3a59), 0x04 },
+	{ CCI_REG8(0x4000), 0xcf },
+	{ CCI_REG8(0x4003), 0x40 },
+	{ CCI_REG8(0x4008), 0x04 },
+	{ CCI_REG8(0x4009), 0x13 },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x400b), 0x34 },
+	{ CCI_REG8(0x4010), 0x71 },
+	{ CCI_REG8(0x4042), 0xc3 },
+	{ CCI_REG8(0x4306), 0x04 },
+	{ CCI_REG8(0x4307), 0x12 },
+	{ CCI_REG8(0x4500), 0x70 },
+	{ CCI_REG8(0x4509), 0x00 },
+	{ CCI_REG8(0x450b), 0x83 },
+	{ CCI_REG8(0x4604), 0x68 },
+	{ CCI_REG8(0x481b), 0x44 },
+	{ CCI_REG8(0x481f), 0x30 },
+	{ CCI_REG8(0x4823), 0x44 },
+	{ CCI_REG8(0x4825), 0x35 },
+	{ CCI_REG8(0x4837), 0x11 },
+	{ CCI_REG8(0x4f00), 0x04 },
+	{ CCI_REG8(0x4f10), 0x04 },
+	{ CCI_REG8(0x4f21), 0x01 },
+	{ CCI_REG8(0x4f22), 0x00 },
+	{ CCI_REG8(0x4f23), 0x54 },
+	{ CCI_REG8(0x4f24), 0x51 },
+	{ CCI_REG8(0x4f25), 0x41 },
+	{ CCI_REG8(0x5000), 0x3f },
+	{ CCI_REG8(0x5001), 0x80 },
+	{ CCI_REG8(0x500a), 0x00 },
+	{ CCI_REG8(0x5100), 0x00 },
+	{ CCI_REG8(0x5111), 0x20 },
+};
+
+static const struct og0ve1b_mode og0va1b_supported_modes[] = {
+	{
+		.width = 640,
+		.height = 480,
+		.hts = 752,
+		.vts = 2096,
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.reg_list = {
+			.regs = og0va1b_640x480_60fps_mode,
+			.num_regs = ARRAY_SIZE(og0va1b_640x480_60fps_mode),
+		},
+	},
+};
+
 static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
 	{ CCI_REG8(0x30a0), 0x02 },
 	{ CCI_REG8(0x30a1), 0x00 },
@@ -275,6 +491,17 @@ static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
 	},
 };
 
+static int og0va1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
+{
+	u64 val = 0;
+
+	if (pattern)
+		val = ((pattern - 1) << OG0VA1B_TEST_PATTERN_BAR_SHIFT) |
+		      OG0VE1B_TEST_PATTERN_ENABLE;
+
+	return cci_write(og0ve1b->regmap, OG0VA1B_REG_TEST_PATTERN, val, NULL);
+}
+
 static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 {
 	u64 val = og0ve1b->pre_isp;
@@ -287,10 +514,31 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
 }
 
+static const struct og0ve1b_sensor_data og0va1b_data = {
+	.name = "og0va1b",
+	.chip_id = OG0VA1B_CHIP_ID,
+	.mclk_freq = OG0VA1B_MCLK_FREQ_19_2MHZ,
+	.enable_test_pattern = og0va1b_enable_test_pattern,
+	.test_pattern_menu = og0va1b_test_pattern_menu,
+	.num_test_patterns = ARRAY_SIZE(og0va1b_test_pattern_menu),
+	.exposure_shift = 0,
+	.pixel_rate_mul = 2,
+	.link_freq_menu = og0va1b_link_freq_menu,
+	.num_link_freqs = ARRAY_SIZE(og0va1b_link_freq_menu),
+	.modes = og0va1b_supported_modes,
+	.num_modes = ARRAY_SIZE(og0va1b_supported_modes),
+};
+
 static const struct og0ve1b_sensor_data og0ve1b_data = {
+	.name = "og0ve1b",
 	.chip_id = OG0VE1B_CHIP_ID,
 	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
 	.enable_test_pattern = og0ve1b_enable_test_pattern,
+	.test_pattern_menu = og0ve1b_test_pattern_menu,
+	.num_test_patterns = ARRAY_SIZE(og0ve1b_test_pattern_menu),
+	.cache_test_pattern_reg = true,
+	.exposure_shift = 4,
+	.pixel_rate_mul = 1,
 	.link_freq_menu = og0ve1b_link_freq_menu,
 	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
 	.modes = og0ve1b_supported_modes,
@@ -331,7 +579,8 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_EXPOSURE,
-				ctrl->val << 4, NULL);
+				ctrl->val << og0ve1b->data->exposure_shift,
+				NULL);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_VTS,
@@ -359,7 +608,7 @@ static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
 	const struct og0ve1b_mode *mode = &data->modes[0];
 	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
 
-	return data->link_freq_menu[0] / bpp;
+	return data->link_freq_menu[0] * data->pixel_rate_mul / bpp;
 }
 
 static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
@@ -412,8 +661,8 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(og0ve1b_test_pattern_menu) - 1,
-				     0, 0, og0ve1b_test_pattern_menu);
+				     data->num_test_patterns - 1,
+				     0, 0, data->test_pattern_menu);
 
 	if (ctrl_hdlr->error)
 		return ctrl_hdlr->error;
@@ -620,7 +869,7 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 	u64 val;
 	int ret;
 
-	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_CHIP_ID, &val, NULL);
+	ret = cci_read(og0ve1b->regmap, OG0V_REG_CHIP_ID, &val, NULL);
 	if (ret) {
 		dev_err(og0ve1b->dev, "failed to read chip id: %d\n", ret);
 		return ret;
@@ -632,10 +881,12 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 		return -ENODEV;
 	}
 
-	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
-		       &og0ve1b->pre_isp, NULL);
-	if (ret)
-		dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
+	if (og0ve1b->data->cache_test_pattern_reg) {
+		ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
+			       &og0ve1b->pre_isp, NULL);
+		if (ret)
+			dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
+	}
 
 	return ret;
 }
@@ -731,6 +982,8 @@ static int og0ve1b_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
+	v4l2_i2c_subdev_set_name(&og0ve1b->sd, client,
+				 og0ve1b->data->name, NULL);
 
 	og0ve1b->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(og0ve1b->regmap))
@@ -862,6 +1115,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
 };
 
 static const struct of_device_id og0ve1b_of_match[] = {
+	{ .compatible = "ovti,og0va1b", .data = &og0va1b_data },
 	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
 	{ /* sentinel */ }
 };
@@ -880,5 +1134,5 @@ static struct i2c_driver og0ve1b_i2c_driver = {
 module_i2c_driver(og0ve1b_i2c_driver);
 
 MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
-MODULE_DESCRIPTION("OmniVision OG0VE1B sensor driver");
+MODULE_DESCRIPTION("OmniVision OG0VE1B/OG0VA1B sensor driver");
 MODULE_LICENSE("GPL");

-- 
2.34.1


