Return-Path: <linux-media+bounces-51483-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO99MisZdmnzLgEAu9opvQ
	(envelope-from <linux-media+bounces-51483-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:22:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D04E80AD6
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B2463016905
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCD6320A34;
	Sun, 25 Jan 2026 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSh9p+3H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPl0/a1t"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEFA31D390
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347229; cv=none; b=sdUIe7G+G1YWR4BqHyXo2eiu3HXVcPpLzrxlykT1FLCyxUGEn/KXO+rAVaoP0zXRVu14wLc1gSSmbVdnts6dI4VJSpVcGpmUEpMD0dzRJ9GWBcBRxfz7lz3gd07dZ9D/t4Y3E5MpOL68eLCe8u3pNK+WpdAHPj2MhC0HnUE9680=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347229; c=relaxed/simple;
	bh=Bmf9KEkMp4HJCg1ZJJDbmmSwGBTwEzmFyX3bT3VUuIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rRskiJyJwrt76VWb/9G7uVP4jgxVLuiUnD7zmesVwp8L1PB2fki1F4jPeAmyqKFHkJbxDVhz0E9z961VhqRKqnasAuSQmxX3+AOrF+fPM0IqADcidcovrTX2pC0SL7crXByBp/+wXW4s0oM1/NM+9efpu5QX9Gdr62mLNdmRX7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSh9p+3H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPl0/a1t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P9qtVY3387389
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JArmttMS0xgGKN3K5jgd2M6cFrUBTdyxOVP5jaPlnSA=; b=pSh9p+3HA0dDAxQp
	S+XgNjM1XOXHLOyi3N35KbpevM66SoMNk0/KdN5LeuX0XYOaUQEUko3YRyHMA/li
	8/kLnyZB0avKgUt+0XCbTxhjduUFWLA1Xft1JnzrGkZrP1zZtGhuUU7ch99jOJBG
	/s+9mqIG3mjSU5/FX/ZaeB251aSn1S0qLmHd9HklE6PyO0QKYp4tl7q05cNIiQpf
	bdzHApekEt4zlaIJS83LWtmlsFfvSlbRAtJq7oEPsEjxDCqwpSycEqe4HK3/1Pq5
	4zngfSuNMQPQWk9TptjsRN9vNJhW3TEdOYHD7MkU1+PstwvJQG26AL/g79wA+Z4N
	F53uhw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9ft60c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ba026720eeso1241398285a.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769347226; x=1769952026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JArmttMS0xgGKN3K5jgd2M6cFrUBTdyxOVP5jaPlnSA=;
        b=cPl0/a1tmNmfrG/0ZrDkBkjZAQJ4Kp/mPRWgdh+LLJ4nLFH5YMnJH7qMO6BlpqnAqS
         UqE9hY+u2oWYX8+d4QeYS1qHHMStjrQpRYVB4myxSS654HKUE7QifQWGQIbKd7VYOfuQ
         v3JmneYxskHVQypgYkfkQcqOXSCnjt0vam3B+wJwCtu30JrLepFDoDZzQeBlkXkGQXCC
         u18XYk1FN7mT/coOp4Xid5R3vXi0grmSm8NCtBEbwgZXkleIUKML1MMeFD104Y1XVL/K
         noMX++pPsFMqVzIiChLXr0JMmDAygOW9PUJjqybynKNBXhybkRGnke4zBhKxd1RPSqDj
         9rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769347226; x=1769952026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JArmttMS0xgGKN3K5jgd2M6cFrUBTdyxOVP5jaPlnSA=;
        b=ABJ/7eqeLACpMKJjY2QsfXEOJ+xIDTFEbuLbuH5yEgd3UXFIqLl1uqVLURb/64Yl5j
         FLGtE0WjkE8GVDXuGl3IS8JgpEKh/1iNtjxm27cW06RBWdlL9Hz2ffZkWPMuM/UePh2W
         6RhjImkeeahM9h/soQ8JOjtBMWLwqqsfDbxdeGKhVHnL23P1lUSuWbdx0ckexsKNmf05
         AL7xfuhau12hqb5jptA6im+YhzaCvhpUz3fRQAsyy8dHT3IJtbJkj5bVzkJXifG+P+Ye
         UU81X7615T/IYFa/j3aDHhtUeNSUUaA0xZ4wngIBqZtvNjArwABin86hvnwReii5cwPP
         VhCA==
X-Gm-Message-State: AOJu0YztYuwvkP+hdtDgDa2uQZNvSCU/nw70h81Virb6biDz9N60WXV9
	k5to1dSI4+WsfJfMoYmQuqq6dX0gDlnIeB/qSBTpMD1y3MrRH5Pw2J+KQmqCIbc1B/IxsXkTX+E
	IH+kKcC0GgyS9NMWXt/Hqqt+j/Qa9+4E8whCbG5MNST+bcFANiwVSrh8hffbaf9QwAw==
X-Gm-Gg: AZuq6aIFIKLvzck0WOQr4UtBq8qJezB2Wuc5ecQcYBAbCxCuMtDl7U8AhW8i3sLwp+g
	hEvrl75it3jqVe/SWztep48xVxoglat1tzR0+2TmkDejXIaAmnVrVpXjc40h7jNKE97/wtx/lBN
	d97ae7RjIXTNneAxOUPW1Ewx0ndlhH/DI8tF1EcLaPaIDiORg4MMXMYyIG3nQT+gVcp5TGsEyXp
	1PRGwBe2WRhMLhMElDwnV/5BUJWqJAgEybFodDiNjA63ztA4iw+vq9MaFxyknfnYl/losII45z8
	HOx5C9sP1F6Ohhv0xbzoqeyy6YA3CAAUP88bxlRDROoBfSKDoic9tzyHymz+VnxHgX1ejKNSdGK
	HXOkApwtYE7ZH9C7U8cLB+ZMUP2CmRG5P7DHWD91CM6SmvE2xwS9uLTzagWPImstPeXcQymDi0b
	BqqI7Oo8MclQDzSU/PmgBdMyc=
X-Received: by 2002:a05:620a:2953:b0:8b2:ec1e:fe30 with SMTP id af79cd13be357-8c6f9615bdamr178467085a.57.1769347226288;
        Sun, 25 Jan 2026 05:20:26 -0800 (PST)
X-Received: by 2002:a05:620a:2953:b0:8b2:ec1e:fe30 with SMTP id af79cd13be357-8c6f9615bdamr178463685a.57.1769347225786;
        Sun, 25 Jan 2026 05:20:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1706b5sm18901821fa.24.2026.01.25.05.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:20:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:20:19 +0200
Subject: [PATCH 2/7] media: iris: introduce SM8350 and SC8280XP support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v1-2-2c5e69fae76b@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8971;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bmf9KEkMp4HJCg1ZJJDbmmSwGBTwEzmFyX3bT3VUuIk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdhiTEFN5VQ++J9hNTVXGC/cZclDCPl2PJ5DaO
 wZS1OEaLDeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYYkwAKCRCLPIo+Aiko
 1YPHCACoOroUXwSvoKFeekjSnEEMhL1PzTA9GiInbseIYMQysxx3mPS8mtq30//oUaN5ISEl0JF
 u+9r0WYx4KLMndJL2Mj92H+u+Kl1v0BRQiXDrezHkE2OfR25JiZQpfK51SDE+E13mbGVWvw2w5X
 JAytYz6x/3b4T5mOLPOVlZeD7/BS5hk5PTquE0gJgSyFfye3fIZohdjDCoZ8kR4XKyJWAgS/yYr
 6b1N3kapOnSxS/bihpdQks/3zTTbTyJv8CNWpHj+Skpmqd6hjJEv9eRsKzOhp3INBsHFHbavxL8
 zgLyVJzcTspfsFhDef1SMZaVs2qH760xeE2A1am7tvaSTrL1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qILpNqXtlyScv4Nz4xe7UXrBh3w09OC4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExMSBTYWx0ZWRfX/IL3oC3PSHR7
 carjFu8g7pd97QxAWmawK68T2iCoMpES9k1ITW+hRGpxh3l+Fp3uLp8yb7RYMvwxMJLBFhq2mh0
 7mViPPCchacvTe2r4zMAmVPccYVzp45RETu5DP+kHhb/SqtppDKeJxgt1LqbS6ayn2yCOAmXinp
 g+PENo3D39slUhETBQ6htEV/odSHzhbldsB9ljC28WbX1fyVHDm8flPWC3YjiGrkBCrl5Lz6Vwg
 MXoL/Jw2Ac59lcpDRhx7RHlB1z5XuryWDVi8muwHrpWP2yS0A7ms67oCV74iI/2WrM8g0/DT9Kt
 QvkXV6stMiAhcoSTOcfbU8vBV5LmsaymzpnO6aVHPnCR+NnF5rTKBO5SVV3zEr4i04Fu112O6Ij
 KB/YS+wajUd/QWUM9v3kl/F8HkaI78uuLK2bUilNjN+MOYG2gpkwKR4PPrRomlnJeGZevFCdljK
 vtwUz+xNf6fstDBTFzg==
X-Authority-Analysis: v=2.4 cv=btlBxUai c=1 sm=1 tr=0 ts=6976189b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UUdjpNFb6dwvVqmIGXgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: qILpNqXtlyScv4Nz4xe7UXrBh3w09OC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250111
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-51483-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D04E80AD6
X-Rspamd-Action: no action

SM8350 and SC8280XP have an updated version of the Iris2 core also
present on the SM8250 and SC7280 platforms. Add necessary platform data
to utilize the core on those two platforms.

The iris_platform_gen1.c is now compiled unconditionally, even if Venus
driver is enabled, but SM8250 and SC7280 are still disabled in
iris_dt_match.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   5 +-
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 111 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  10 ++
 4 files changed, 124 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af..2fde45f81727 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_gen1.o \
              iris_platform_gen2.o \
              iris_power.o \
              iris_probe.o \
@@ -26,8 +27,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
-ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_gen1.o
-endif
-
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..49dba0f50988 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -43,7 +43,9 @@ enum pipe_type {
 
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
+extern const struct iris_platform_data sc8280xp_data;
 extern const struct iris_platform_data sm8250_data;
+extern const struct iris_platform_data sm8350_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..c99ff4d4644d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -14,6 +14,7 @@
 #include "iris_instance.h"
 
 #include "iris_platform_sc7280.h"
+#include "iris_platform_sm8350.h"
 
 #define BITRATE_MIN		32000
 #define BITRATE_MAX		160000000
@@ -392,6 +393,61 @@ const struct iris_platform_data sm8250_data = {
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
 
+const struct iris_platform_data sm8350_data = {
+	.get_instance = iris_hfi_gen1_get_instance,
+	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_set_sm8350_preset_registers,
+	.icc_tbl = sm8250_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
+	.clk_rst_tbl = sm8350_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
+	.pmdomain_tbl = sm8250_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
+	.opp_pd_tbl = sm8250_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
+	.clk_tbl = sm8250_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
+	.opp_clk_tbl = sm8250_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
+	.inst_caps = &platform_inst_cap_sm8250,
+	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
+	.tz_cp_config_data = tz_cp_config_sm8250,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8250_vdec_input_config_param_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
+	.enc_input_config_params = sm8250_venc_input_config_param,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8250_venc_input_config_param),
+
+	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
+};
+
 const struct iris_platform_data sc7280_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
@@ -446,3 +502,58 @@ const struct iris_platform_data sc7280_data = {
 	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
+
+const struct iris_platform_data sc8280xp_data = {
+	.get_instance = iris_hfi_gen1_get_instance,
+	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_set_sm8350_preset_registers,
+	.icc_tbl = sm8250_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
+	.clk_rst_tbl = sm8350_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
+	.pmdomain_tbl = sm8250_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
+	.opp_pd_tbl = sm8250_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
+	.clk_tbl = sm8250_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
+	.opp_clk_tbl = sm8250_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu20_p2.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
+	.inst_caps = &platform_inst_cap_sm8250,
+	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
+	.tz_cp_config_data = tz_cp_config_sm8250,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8250_vdec_input_config_param_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
+	.enc_input_config_params = sm8250_venc_input_config_param,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8250_venc_input_config_param),
+
+	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..10b00d9808d2 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -357,11 +357,21 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sc7280-venus",
 		.data = &sc7280_data,
 	},
+#endif
+	{
+		.compatible = "qcom,sc8280xp-venus",
+		.data = &sc8280xp_data,
+	},
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
 	{
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,
 	},
 #endif
+	{
+		.compatible = "qcom,sm8350-venus",
+		.data = &sm8350_data,
+	},
 	{
 		.compatible = "qcom,sm8550-iris",
 		.data = &sm8550_data,

-- 
2.47.3


