Return-Path: <linux-media+bounces-52360-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC3iD0ojiWn/2wQAu9opvQ
	(envelope-from <linux-media+bounces-52360-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 00:59:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEB710AB3D
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 00:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7763630479D4
	for <lists+linux-media@lfdr.de>; Sun,  8 Feb 2026 23:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202E138885B;
	Sun,  8 Feb 2026 23:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Atx1lWEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZ9w4rhZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47667388843
	for <linux-media@vger.kernel.org>; Sun,  8 Feb 2026 23:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770594948; cv=none; b=DWlEfWy17TqsvyhcWD5k3iZzqa8a0qPRTE3TeaBJuj7Z1r2XKbkx7DopoEalqLEA7WzOIDacFSLpHMtXLv5juzWDHKiWG8P0RmD/WvgaI58Uq5AEvlvObYNx6/ZfDCYZZQ4ogXg+1Tklehwtt5fuEX7x6qKHngimZg9g75oH1aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770594948; c=relaxed/simple;
	bh=AguPyjryJFtRx2eaJbYNMbx1txjYcA3Blb6q3wboAz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B0eruoEoQeqgtYd9gSYL2uyudvfLvFJJ6alwHbbSKvb19UhxMt2ZQOJ+fgalIZGY4q0gp4y4XpUuon9leudOSy4/JQPabb2g4lB/Vd1Hc71qGAicZEzOLbOA9r5THy212Nq8c3XP6XNcqPvwscP2lfAjehs5A852P3QDbwPbbDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Atx1lWEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZ9w4rhZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618Kj1Ni2299745
	for <linux-media@vger.kernel.org>; Sun, 8 Feb 2026 23:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=; b=Atx1lWEWblDPAMwp
	7xSV2eP52dUX4koVfMcXw96uCx1rex2qok+m28aRfzvVOTKYsAAA/lkD50ANn0GU
	8DyFaonPNUrv355TvVRQA7KEc4fBbd07fZQMND4HvkPIPMH37/X+H521Kj5wCdLj
	CydJ9Amkiu1C2KwFILRtkLa+RB1xNlNJ2PKrkBNvQZighsa4LUfxsquDmpYkfcAr
	7IomCc0WfIPJdyiI0XtwCpgSzWVmxC9v0xGU7MOj6I3qhxX3UK4IgE3sFNo1URvg
	l3cFPWjKLrVmc6Z0C8b/JjtQRtdzhUb61Hzx1G3cy42HxkMCc6z/YGzgqCG/pZtA
	/0obBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xbfb3jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 08 Feb 2026 23:55:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5e166fb75so1238357985a.0
        for <linux-media@vger.kernel.org>; Sun, 08 Feb 2026 15:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770594947; x=1771199747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=;
        b=HZ9w4rhZtUPgJWBnjKO4I/Y5jP6AEILBDeFlRsoPNNRCMZBfQ0EGRt1+ROWnxvlbqD
         nkC62huSUQOwbv+Zfzit99pj0BClmgBk7nOMxzWHeJfY3uScoYGW6olzRuwu+2TmfVHE
         m2dO1Z9ugLiVULnEjtmgcUIJGcN7JTVqojbLSYNrsnpw72DPuLFbSdAD3GhrTtaCPsu5
         IaXus5xKZPuanMxinilztFbViRrD8NneGK9RveKqAhrtsTkqohj8s0Ecd1WiYgzsEXOe
         RscNcdiF4EQ07fRX0cx8AvLiQTNuc6QzZCU3CkNKdK1DdgbvPterUZNNva0RDHWcD2Im
         /orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770594947; x=1771199747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=;
        b=wJQfoz701gusquqvAa8uW6Kz+pdTIsTvs3ys8dw3G/r6Oa+FdsPo9xfSwlthV2j3ij
         5Dy7z2IjmJDLee4pi7fkk8Wq3MIcmWqj1chAmGdLCyscYODgieHDt8YJjbmIZskZIqzK
         iLEO2mHf9pS7cKe+WCp7uweUvU6MzZ3zsgX/g6Ani5+K/HcTamu9c7Jr7dUTeMdiy86+
         S+C9yfjkAMVpYIrn5ti7nk1UsmOQgwIpzME9tkShYarf9ZC2Omyh1hn+cU9WueRhcs5m
         +SBZLnpyDkK3rBEhFiP3LVGtB8a9L7q4hSAIMa8OhUT6psJufp4zhHHT3ohBhg8t6lLc
         ZDUA==
X-Forwarded-Encrypted: i=1; AJvYcCViVCoeg/Bbk50yqhjXHiLgxON2RjKtxk96lV2DgvOLsochkwj/LTIOgitlcre8yaufsfW8aSI75hUCBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+/HUqkzGsoGrIyPAD2zWk0WtcLp4nStp0xkNPqgzsy2NRa5kj
	FkWdSbcaoO9oXDkIOfmq/LIJiTo8HgyFR9MsDvFUUjapYK/CyWbG0XRvBSA7q+TmBt2wtMc+jrU
	j4ItoARGlS5IKn9Akf7vKD0tYYdOOXesVAs/FgEkwbNVeSiAmoTe0vW2/zY6IXXnEew==
X-Gm-Gg: AZuq6aJNowSgUtMt4FPGyDSQ85R7NM/sKVJTZR5oPNQ7IB1qtznq8LRlTyL9OXOELVO
	N2KlbSb6Cx8Qb5ydgHe1mUmHsUMyZFunK5Nh5e3ynltt80wufYD2FlUZsQvDGqchmIUbWeAY0kw
	V26GpfDYy83iDA60ZbpjlC9S5iBRk4+WgDgjFcBxnR2lQ3Zx484uOt0QLyCxhA7wI8LD9Hqga2Z
	fzRctFQn2E6M3rNiNT23PZRGxmN7LzvMWWH1mZSly7c/K8sZbY0V2CEMFnJyagHMHQBcstOv6ki
	Fse+0p1Vj/UYV29B5JHuKg6ZfHXnDXCJWv7bYNVALdWkKR+d/UuiM2J3Ebp/dZ7rqM56LuroO3v
	4+QFdZ0plmwycDHuPVEPpBD9blr7pJOTQcr9anaDooAw2bvML9VtCQJTU215iCj7h5hJ8OSrEW0
	UzH/EPuRw5QzyRdBq02fDW3VY=
X-Received: by 2002:a05:620a:390a:b0:8c7:1b3f:5eab with SMTP id af79cd13be357-8caf17e3d13mr1252410085a.60.1770594946670;
        Sun, 08 Feb 2026 15:55:46 -0800 (PST)
X-Received: by 2002:a05:620a:390a:b0:8c7:1b3f:5eab with SMTP id af79cd13be357-8caf17e3d13mr1252407785a.60.1770594946165;
        Sun, 08 Feb 2026 15:55:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ee4sm2188074e87.4.2026.02.08.15.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 15:55:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 01:55:39 +0200
Subject: [PATCH v4 5/5] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v4-5-9662a0471d82@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AguPyjryJFtRx2eaJbYNMbx1txjYcA3Blb6q3wboAz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiSJ70t1Y5lwN36+qM0IdjFviCgJPTo7IY9tFT
 nQCnAXi4eiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYkiewAKCRCLPIo+Aiko
 1dngCACFJUOZG90YgvHwIKNH5rBm0cnYlHslF4iaZsx9Vv9DbFf5jJCHqjRKnRtRH6N70/B7mMs
 LYwMFOuuh6IcfU2YOtciTktW14G3GkzPDYc8m73e0AYiVM4Fr8/oQ6BEaFATQJNb4JQOAD850A2
 bNdWeKtujwd+JPUSuCRdElQ1vsuOYDtP4z//SN2mMqr519aE172IgPmkswdt9EOmGrt0BwGKY+q
 KxdO23YchizPSOwlZQiF1Zmp9HWQE7k35gBky0Tmw5VW13aK+HlstEW50rQ108i5XENqWy/6HIh
 kqqNc1Ga5GABW5SPabYcIWijPnyV/IXPEk1QxlgeUWrKhDit
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 9zzrF6G5ISJfImEOwcg4banxEE1Rm1tg
X-Proofpoint-GUID: 9zzrF6G5ISJfImEOwcg4banxEE1Rm1tg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDIwNiBTYWx0ZWRfX3+09ExndWEWF
 RNNiIZWHcM2PE9eQnOmLBf2haClcI+ZbhvGW7nhaGniQfRwyBiKkkBackMT1VaECuDFgrTJsYzX
 /Tg8u1Cs5c3L4IXHkeco2nLFlJRt2e336lEHSO89XHv82SKGpQ82CXPWDeosYc7XLKyV3j+wVMr
 MERa8w4R8CEnEqScAKYemH81wkHm0tnS2XpxECwAGVriPd+TDRuaTFOIXQ3Dv2txMkvLfTfEoHf
 wZG4JjTI5VdPq32jUHqGvfhyDRSdfGeY/5ve5oE5ZbdgMvUugofC07+5NPhURrqfcobbdLGUr70
 uooAEUc2lm3JkWohBiPGgUSuVOKdSJXgy8OhMUIPO3QnK09JwMdpBxXTNlxnsXNYWulpqwGrkCx
 Wpr8yh4bili5GLM9B6lU5fJzTG+eTgr8M0G7NkayG0pez9TNtK0wYpLevnPk7HbGn1czZUDbobA
 Fu4L0NdRpc1UYOR48RQ==
X-Authority-Analysis: v=2.4 cv=aIb9aL9m c=1 sm=1 tr=0 ts=69892283 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=EQKuo8RqpatckOKiKW0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602080206
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52360-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aa00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EEB710AB3D
X-Rspamd-Action: no action

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a1ab8c3c27e6..a80defcb29ed 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4350,26 +4350,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3


