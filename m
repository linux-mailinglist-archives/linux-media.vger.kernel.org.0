Return-Path: <linux-media+bounces-51917-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPmlEeEwf2k8lQIAu9opvQ
	(envelope-from <linux-media+bounces-51917-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 11:54:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3646C5B21
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 11:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E438F307EE84
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 10:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5D732D0C4;
	Sun,  1 Feb 2026 10:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aa23tBV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a//g5Xam"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6D4336EC7
	for <linux-media@vger.kernel.org>; Sun,  1 Feb 2026 10:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942970; cv=none; b=AcsnY1r+XiqwyuOYAia1JUaQ0kNu0hNpWpjQGSJiZs12oDfCKI42Yywc6LldKRLLvmD+gM/Qa9W7eW1TjuBrMZTOcT00LlQJqNDaoKK+6+7qDhxVDa2vUPp/596OOxDqnnWjekXY1oy7+f3k3sheUdrgo3JRaX8Rgg4uoicdNus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942970; c=relaxed/simple;
	bh=rOtATlSUdBEg1H0iWW1mR8swNg1N1WiPDt1QTwWw37Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPRucx7aUBIcZrNWsu38arQ3aamtkdvUZcZWMnyUwaaEU7r4Bszb8iRQXajhTxKnx6I2krkC9KFCZesSmBwbqq2OZLHadQ9CeKyjlSdl8FwTb7bm2gcwT3Lp6g4Ur/lJl9FZe9HJW4GoYMl0dcOFzAoAauELGY0nOheA+qTTJJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aa23tBV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a//g5Xam; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6119SFOg3310842
	for <linux-media@vger.kernel.org>; Sun, 1 Feb 2026 10:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=; b=aa23tBV7ONrBIQXf
	HkaUgvvVAUtiwydR0UX1F/GOAy0MPW3PNYf+i6yotyR/DY2beQEpOmi4oy3JRTCu
	WXwi9JBc6224Apt69Z3TFfyr+Sg9a3BSVc03y77TxxmiIEqITXnjEagJRuraEO+A
	evK/GRhDiB2wcxu7bfcaDIkSPzEROt+E4wjKO34vV019LI7nNHe5TzTI+M2oFP6d
	z9mkE53LL+38PQLG79wTv/Mv1geS/H3OYdfVR8vGxKr+tmmIxXnwgnv8e2E8M1v4
	gutw3VBeMMdO/DPAq8wP1uSpjRy1iqlZrzNT3e3DO8N2HKgTeRrTTpr0DKMFPBsi
	3yDlTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx2dgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 10:49:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-503342386a8so141795371cf.0
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 02:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942964; x=1770547764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=;
        b=a//g5XamJQkvZj/is8HbT6D4aetlSZS9pvnRW4sB6Z3TBCLFyuVPDunt8zhsbvf5DO
         KSRL9uSllaSYxMmvLsCZwe/vTVOdyWtN2ibGm/ScOQUzTWE+X3I/12muREQOtZQcymao
         oo5s5os06Q83LjadQM44gSe1GuY9BpsX/6LYO4ealHOrWkYjAqd8hJz6RKGMYDCv4dj5
         iV6fzxaZrwg27cN79jdZetEKi1kHhLQsDwoJi6gkkqflXeVk50l29e9Yz3YS2uifdVkM
         gX3hQVMP5OLv+ElLfPEI/UyyMgx4O5J65R91tEB/4OZDjookWv4kYNF9gFq5AfIXC3jX
         sXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942964; x=1770547764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=;
        b=hpP78/yugPCA7nCVrnuSTcypWaEEYXqHQTyHUi18MZnRAEgymxjnL/So66ZpFEIziF
         k7SDrEpLP/75w/2vdrMfZhhHTVWuhYFAeK0Evq0TMUUM7fy0zQqzW6kAASCncsW0XoT1
         KFCX91LyN8K6R3sL4Ve31Wz984XQjMcZl5qkb4qW0tR3bp8+3F+khTb7Xi0c77VGTjSl
         yW6nYEopIkLtF41dAE0G3ap0Uv/sn9U0q5bOHTqKA9Bnr9edEx94Mg7a+KyVdjSgqHoy
         x6/C4lVx0d2Ua1qHOQ982JVlaCcpkLIlqaRgaySbAGO5Yh0ZGpjFbZE8IU6EUK1RVzHQ
         H1HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF0vBOKuCW98pi9XoKpYPG+tPM6N59xo7WrUsESJ+393IZHa8EHL7ykdwOB6f01VDoIIj7fVgYwmxAew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzufLwITBRDwcpYm9RNc8lzSlYWOo5AfgaSNJprrrffLbd/vPvL
	EWKKnGMWKB5aT9hRre5Ctmr8sj74kFB4ttey/lM5cJC7i3hZSKF+9mGr90mwEq5TaEVp5XgYLjw
	QPkudhVLibt379QDtYwQcFJpndvtfCclkXDhceI7D8Qaw0lvuFxbLgj9P5Eu8UDeGIg==
X-Gm-Gg: AZuq6aITq22P066xjPq9QaZ88w83+cyiexZOCwOvZrQ77Wutsl/yM+pjIu+pVot3ZKD
	ScysSOxtwUOP/g5+e+dKCgl3ktlFa5l3RoLQF0pspXyt6jofCFqguin76EO9ngV0+uHMWSh1PEX
	BneTFx9EpJsDFax7NbbLyJe0H0KcdahaqUP83tnxkJuzn+K/b562SA81O+Vk9oR6fh7f9gU1jcJ
	C2D54B2kQKf+Np9G6WQxIPn5xJjB/MPXDDGYRrWnfgv+zB0bYHUpX1tEbT5WIh3Ba25XMnZBgzI
	e8I3tnmK/2ea+kAJYmaonJsjpBTFbij0tLZ9Fvfd8E5ix+HK2tc7xRVhSLvJkKh+tEPokiYoFGP
	re7CnoHkMX+w9/SexPU3deXuKxXpruqNSJz2pLghQVAi3a7zWIHBIkiKeOFa/SSuHdK3U1LlAls
	0Su8QfTH+8rzMTFifV96yxtAY=
X-Received: by 2002:a05:622a:1186:b0:4ee:1301:ebb3 with SMTP id d75a77b69052e-505d226c899mr92131471cf.54.1769942964432;
        Sun, 01 Feb 2026 02:49:24 -0800 (PST)
X-Received: by 2002:a05:622a:1186:b0:4ee:1301:ebb3 with SMTP id d75a77b69052e-505d226c899mr92131241cf.54.1769942964085;
        Sun, 01 Feb 2026 02:49:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 01 Feb 2026 12:49:05 +0200
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-iris-venus-fix-sm8250-v2-8-6f40d2605c89@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rOtATlSUdBEg1H0iWW1mR8swNg1N1WiPDt1QTwWw37Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfy+mrexJvxvRxvLaDB/4xTWsitXwKRuyapAos
 wg/sBPcXI+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX8vpgAKCRCLPIo+Aiko
 1eE9CACeDHGYlons6fPMaRboS7Ni6okVtQVdnWfL12L81cp/aVNkJSn8SC5yV1oTFjQLoo8PFNN
 isOA74pcXcDEcKxmDKGKK0Ukcg6y5aezORHTjfw2eBYENAqFz18givnM45c2feDkHhDOtA3X8WO
 xyDB9oT5EU1HTv5vwRcw+kC7cpue14qKM4AD0T/R4FInatsE29mwajYRBTDSlU+49ku4JTbLVQH
 wsox9HD/rbKxlyWWrcchYEYlKxsIRdcMvd/Ik9JgAB09gVotPHLzNfVnsmPXoRfH8eASGGXuquK
 /gnW+qiBIJgQoIx4dz77KWzj6BsUEclyh/ByBnOgW2UCFd+J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: DMcKwOWH_7jU_lr7z5ek63yWrROxzCfR
X-Proofpoint-GUID: DMcKwOWH_7jU_lr7z5ek63yWrROxzCfR
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=697f2fb5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jxPhmlQz5o5YGUuCidoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfX0IY8coFJ5X+t
 4hdEoOgfgOQge6wplQPoohdsdiUPq3jjy7IgRyamEdH6uvQF1vB6qKHp0iGubS/xu8YI9wcIqWX
 qQvmiadIVc6cMPMadZa7ZlEaCnhhvvZ4rl3NI8prlIpMIHgNppPGGCP+gsQyCOQJBhNlzgkuOZw
 3EVBUQRgHadL2jHJ+YoAAihUrJo+bQvU/ri/kicQPGyidFhpZhb2+seSRMmv5yhkvY2BkJRPk+6
 9XQKYZGHijpEpjtEV8cB8CsR5WA0oihcUbLPx+3d02YsZGpKh+KXsl+VjRRZdBTw/gcHsszbcEt
 rOXYmMa8kKtzBaJgjkzNqiYG/h/8vUKsLOiex+BNFsBHJPNHqZtIQCjU1TsKP8VufRg2aevX3KH
 FUEx7/K5KgpktrMpQaUWWAYIbb8qUwQbYO8kpKx74XuKb1rd6NPCHE2wC1N0r/283zcvN1DBjDA
 ID0SMUMWxnmewtu3e8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602010094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51917-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3646C5B21
X-Rspamd-Action: no action

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 531470506809..21a186e199a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4350,26 +4350,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3


