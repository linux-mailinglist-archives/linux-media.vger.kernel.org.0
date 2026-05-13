Return-Path: <linux-media+bounces-61419-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLQbOY9wBGprIQIAu9opvQ
	(envelope-from <linux-media+bounces-61419-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:37:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46692533209
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5C4F3051C49
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3FB413258;
	Wed, 13 May 2026 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I43MYmtQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjXkG4e6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658013EFD0C
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675693; cv=none; b=TrLffAFG5Lot7qMvNc4Q1Hz1sEcTSYDETGmiQj2qJ/XmYW4Jvtv/CqSvVMaj3QMLGDtUZqYBQcME8zvywVv4CtsM8ksbsqj2dHeyJrgpMNnzlZjRTMSXCKJ2Z1HwYmdN0KZy4Jc8cWI4onLQYuRz1Wv4GC3yY+FIXfSXpyDCFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675693; c=relaxed/simple;
	bh=QYtKt3xVT767f/e8GatW4qi1b551mF4Rul2GLUG2IWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDma/LIlCVMG1Gl43HXmd0WctUd7J3q0UjEsWKL305qu8+CaumWf7wwYbMWwtbp2DZvky+A9b4PwUG0OrEApsKMBLrSiBpXYOZ91n2eeuk/sBYKUBInkigeJoRECERgR0/8AFn+qPMOyt2NTqPgJCCLTBJD1l1Zb1z/LL/6+elo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I43MYmtQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjXkG4e6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jgVg3007378
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=; b=I43MYmtQDcvGEFsr
	bItGmK/3BjfJ+sown/zP4syTUUTvr7VS++Ev/oTzo7bDrTwbnYoKHwSP1xulns22
	e9u5sHN9en/phQMrfIACbm1OGAahi/dyXaWQxUUf7qHWXeLJjTRinmFkVp2jmh7G
	6O7Butt/5kGBEjS6li5ef1omanx1Q/pvb5derpUzj6Eo5H8p1dsBLyXSUuEez4FJ
	AGjC8WNp9FAvuNlBcaDiypOxjzEgw7AGyqvd86y6vtMzwMcdLVrm0O9dV3x3i4Uy
	Vyr4Ejrue650loSYh2YuoQVVB6K+Gox1qSyLONT6btzd+pC+tkRibA3aPQkuea18
	/uUAwA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0gjq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-634ce585b41so1762055137.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675690; x=1779280490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=;
        b=AjXkG4e6YgSm7h+fHK5q6EDGQNRGfLsQ9P1TS2fqIS3IBN6PgNs4hI7PW6Ix2D/ZvT
         wDeAELx3xkqHcerUKupW9LwtjwdJkNMQY/opTU+EMkKhZONAWcpKLd1zT5+shv5uqvlT
         yrhxfKu0OI/P3OOVw9pZ6xvjshGjrWEFEWLD91RpeJeVipzQGEe8WjgobRKRpfPiUoYN
         NkeMeYchqoKbqdjKH/AmxSmRuMGwbFMiWkIo1ZF+AM5qAaMa/0GyF0bW0hXUNPmz2Lbd
         evqZCaDU6IRnYD7AEPG31D14Jl1X2aaB+T0+W8AzbkwF24PgRTy/a1FTXj5KBWDp7t13
         o9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675690; x=1779280490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=;
        b=K1VABafHzuhYomhHcBZFf4LT3/2+qWsXQhvczxcODOc9jUUDvE1AV5LitqrQcVlAYz
         iDoSbrZkicS5bJU9+aOhG8hu4pPaPNXsguu73FD0/oU/W0KMTJN+oRPuNUiELhghJ+wb
         RgamkwDx0iP3H8Pd/X61pVWvjYvKAWbn7PA+xZ7xatPDwsNq98XTbbCo/bWm6hkl+3fK
         53qQZ8ZYuWr+g/Uydnh+ASKEwPAkYm0R+x0mn1k+aKkuH5OtdLCmm7XWrPjtiTWbnnRC
         OW76dV6gRKBgZUnqaxl+0+zFdZkdSuF1FhsZvRH0LcguW1JEENhcc5TXoEVBbmMu9xGg
         KaFQ==
X-Gm-Message-State: AOJu0YyC5Qx2Nsk1PKCK0a2HGhDJzBGKVN1njmAJVXoTu+JEfBKFwNJe
	utMYhH79CXkV2PRepeRUIATjeUUho4xLCrVQdjS9PsQUu4vQ3Ma9GRh3gEk/HoYJpd1BXY4m2dh
	ry6wWoIXbWSgVmSj5m1kFLRNs1ouhqGAF7a4N4+TqCofl+gs0jc+PjPImMIgq4yV7sQ==
X-Gm-Gg: Acq92OHk0LfNjT4KN4GFlX6V5N4Lny5ZfOcv7KS1cSV/51ZZBybuZlxq0iaslC97ICH
	Fk85wwHhGOFx5AFhdlNzj34VKi0ku4GrKAQxYbDK7TZRGmbBjAPgS50PD3o6eVRV43e5FnRlCLE
	E3ORVvJieG4H7BHTE0CeErb34uT+HyvUUnh4ioMspepR5KDLjsVcmaN61y6jHfdbm/sHofNupe8
	AIjpdjumlqaMh+mbFzemCmtvTys1eh9zH0ZlLqQGOGJNqd6C257NiVJoo5NBlhS73pevlnmWuq9
	9AmtxpEVkxcU5IJOjnXi9pWnUxuBmPAUVfqIY+Zk9gRmVQ5QuoiztDGha4Ek5s2/RaEtTbHISB4
	rQACef6zIfVFybM+vqktGNWCQkytNdOSmly4IZmFKTdMv6erDJOf6Bax6RtAUhgifQjtmElEear
	Spk25q+BiKktEUMP7y1X6yYx9P9d1LRG/FDyI=
X-Received: by 2002:a05:6102:370c:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6377239d295mr1216077137.6.1778675689764;
        Wed, 13 May 2026 05:34:49 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6377239d295mr1216053137.6.1778675689222;
        Wed, 13 May 2026 05:34:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:43 +0300
Subject: [PATCH v6 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-1-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
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
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QYtKt3xVT767f/e8GatW4qi1b551mF4Rul2GLUG2IWg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/lDI25XetRzV0C0illHa2FiXU20q7jvnhcw
 BJbZhxV6g6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5QAKCRCLPIo+Aiko
 1SwJB/44JcZ3uKZR5+uHcBcVBeGWzwezV76GM0FPxWeqoH4LaF1OiZVndsrxR2RJRoWeqENFT15
 1OKoWa/fQYjIA8gOlwaLB2CH1q7PQxXIi6ozu3OHuYe77zvpRp3IQV28GK7ACzqvUu5PEwzimTr
 mE+MSSL6j4kMdbaYS1RG+JzKTIvmEOSuI0sNV9M2tsnJBa6aWQw5Zh/5IQTWUI/7y3a/V8tJxHG
 h3P0jOEhwHBykhFNxZWV9SuqLo1Ze8J1O1ePTR9R3vLiUwgHafukQoRrUABpL109wrMqmGQu1Bo
 E1R0TKj3hEYTQEgaPT36CiIzWUoWdvGHC0JSKCPxcureuC2A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX3kgUPzS1Lu3O
 aMFOMBeuZBo1oyjnTquaXZzVBn+7c6ijNm3d3ZAecb6pW3X8NFMJ1AnAmnTIlJQEgxRdgF77trL
 IjtTLrlIBx9bhaZ7V3KjM6ptPcYHHtiUYUxyuVLIdgGdRyrEev1g/iHfvGIdPAbqvq/I8P2SNGP
 R0fJnEteHK8zBuqI2uVVrh5zCEyiLbIlOsxw5PfvDeUkoHTSzHkGYsdFDrYxSYI5cM/XWAOzAd6
 q2+DQNmC+04CZdG5BgO0c6cyhVgpNH62cp3HyDdJCp0LWjGnmbibDGnjQQI5nJ1EsFHoJxFAkLT
 2exgZSPB19gckc2zHfOGKVu8WXTYLp23V4VVs5CWgF5Bovmj8yN4pbH8xufcl2Br1bZJ7KgYbiR
 zk80uQrvUXbQOJuXYi6swJcZ5qLbm4+sx4I+zU3LLrLRi8/zfratUdHNtV3al32fFm+wUUeKIc2
 LBbLhD/wDUVAarpWR6g==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a046fea cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DuJnIZi-_EB7d9bgGRcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: s5AxTfWfY3CovFk4e7ArP8n6x0VvRYQa
X-Proofpoint-GUID: s5AxTfWfY3CovFk4e7ArP8n6x0VvRYQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131
X-Rspamd-Queue-Id: 46692533209
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61419-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Iris block on SM8350 and SC8280XP is compatible with the Iris
(Venus) on SM8250. Describing in the bindings that the block is Iris v2
and not Venus. Document SM8350 and SC8280XP IP cores, using
qcom,sm8250-venus as a fallback compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index 43a10d9f664e..aca748e42aca 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -10,15 +10,21 @@ maintainers:
   - Stanimir Varbanov <stanimir.varbanov@linaro.org>
 
 description: |
-  The Venus IP is a video encode and decode accelerator present
-  on Qualcomm platforms
+  The Iris v2.xx IP is a video encode and decode accelerator present on
+  Qualcomm platforms
 
 allOf:
   - $ref: qcom,venus-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8250-venus
+    oneOf:
+      - const: qcom,sm8250-venus
+      - items:
+          - enum:
+              - qcom,sc8280xp-iris
+              - qcom,sm8350-iris
+          - const: qcom,sm8250-venus
 
   power-domains:
     minItems: 2

-- 
2.47.3


