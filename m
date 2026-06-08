Return-Path: <linux-media+bounces-64190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T3dcA6vNJmo6kwIAu9opvQ
	(envelope-from <linux-media+bounces-64190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:11:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 140F8656FA5
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:11:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OC31Rygo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bNCDcJ23;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64190-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64190-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1B28302BCB7
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5693CEB83;
	Mon,  8 Jun 2026 14:07:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8893C76BB
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:07:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927640; cv=none; b=p5l/c4DkFKhn5gHjb6bG/zIt8H0KSdRzoX2I6ll060cpsoUpYXvp5fb6gAFdu/C4a1xmqPLdAKb5A6SESjJOuus5J8OWIFERHb6opR9RfU2F17udWuvR4nFGJerCqbq2hGlz94oEBvpxxXFHj+B6Q13qVmDbcdDureeqV9qW8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927640; c=relaxed/simple;
	bh=ldYjYAGXo9AsC38/Eko4nOrSCJF7kUU15KKBuwcyPE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcEVWZqFz7B+egCbQFaSLNc9SMyzk+u5ZIFgUI1ozGbmOOCpNlrdECveRyHhKCm32+0mK+5Xve+pSZa2qaoBvM97etopPK61Q2KYSs0LVr7kNgHLfC8lzBsnaYpxMQU74Cn/SLtFjiqZse0RL/gicd3JoWJxHIb4noen24/nWhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OC31Rygo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNCDcJ23; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR5N53300388
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 14:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=; b=OC31Rygoa1cYQ7UK
	9AstLNJhmhLKmaQa0VOgF/+XRdBFUCC6UwS9wyV/Ktb/FolVJv2qtrcqRBUUKEhF
	vrky0DBCWlGUYjlCFT/IyMCgbFBN35Aw3nWyzA4aWzjQL6BF0wrTbY/MswV4R6uh
	f0pijpz7YoE2Rea4fvPIRjDUs+fdGP7Ltj0xxkfEXfHTP8WnoM7ermmKDDca1Rhn
	6bID3VorwtqOeOXbsP9sh1U1pRZJ5mPPEiP4x275t++Ds33TWXvANm5awMSgBQxF
	/B2Vh+T6t7s1kY8jxEK1mrzk1NEfSRsEq2wEtKMn201qSygK5uX61ncJLtfOnUIF
	4MpTcQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna9237-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 14:07:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf08c2a24bso41971095ad.2
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927638; x=1781532438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=;
        b=bNCDcJ23DOvD2qBRslbnMB3+nETwx+y60mYMZrcH2n7BlLK2FP3PFwD94u4n021kc6
         wpSNsgCa03/eurbdGG9cqY/mBIBOAiRfczMeXNJ5i04EXCpVuNGARTUHAZg6B74wtaHc
         JkkiLgfsGmVkrYzCm/8D/cnnsKF8QtC/tN7HeZmiXxPfAtZ2aOFardzr/XWUmg5RQeNl
         d/L1Yizqyk5rCqpvTfVp2XhMW2bsiDfBi+gfCbrMoFGf2kGKo6EycHFHgy6jaYC12NJY
         eG1pvsgIlgz1sKXfwFSwGSA47A5ykxb1BgV0nhnWl3Gs+vKGX3vitWVewLNkNa7ACGzL
         FvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927638; x=1781532438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=;
        b=Ev4eQLWXbq35Q/Xcgg6TO5Wx5pMCEPi4nKRZtQwiIc93kWhzPkzDNrNN23pQCqeh9G
         oUfGpT7sTfhH+OA+FTPxH2zWV0KaRuTslWkK+2SNvV6O3F/cUlyH0O3sZSzKiS7jUPSr
         /Rv1tnZvCW7dyGM2Zb+Cq4pU+VK2v3lcdgNKamfE9+t0ZV7oG2pJd8Z/qYHDRugcPBqp
         mq/Rklu2ZTsNQ66/LlQhamz7HHjgXI4bHeg3bsar+lZE8gLzWGs4+tJoWT6T2EAZGUD4
         ZTFb5ow7n8FhH9VjHC6WYL2Xonyg0Uxb8tKDN6fv6f3PvsMmQ1JccM5T0ZuueEVc7iXg
         XPMA==
X-Forwarded-Encrypted: i=1; AFNElJ9bv4AXazayCubm8h/r0azS91pWGMespI5ZW54uZ83JOcap3RUMy/fhpPm1X9MMVS3sEl1qN019fxL3QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFR8UeeocauqHXnABnrkbi95gtILIRQyGVXp41VOTwX8AUh/Fg
	c9oT1Sbem+rfmzdquqGY1hsEiA7cVG9PvcmBIlBV0FM0OKHLYx4bLXSW4wnFgiaaKZMDy7ll8gl
	+gJ2276uGFytVE6k2U0jBrlcwwgiVDSC/B/gXdKjOzLw6O3wwAdDgCwiDl2P9BTyMcA==
X-Gm-Gg: Acq92OH7rgPgEAZmOUPMITxkh+S25puVm08zQ/opBLAirI2Og5Eoi8mLElKG7rdxmjR
	f5AuI86k+9rltAgyygwllsyIqcwFIP36B0NHxpQQs6lssjkdMZwO7CEAgt1VPRngWpaH/s16otg
	Hrny4B8ucII4zn9LDX98faHEFApQlGetOzV1kHjePWez5wDhZeTfxeoT/sr7ogml6q6tbiUp/mw
	k1fRy9A35dr6qFYY3ZhdGXazrOU/+7tHIyvCh034o6NmzIiOxo0aWyhJ8ewt2OSev4LjO8AGFDh
	kRwgWe/PELHtuF/xzEcSxWzyEAzXOqLHuXZSAmkS1NTTtWaEKZ13T4Oh8Qr06bvUoIZmBeyPclU
	emrk1DC9E0GI0UhJpVYrvJDRfAboW4JZLVfZTrWXC5Apyb+MmV63QJ9f5jrx+D5Y=
X-Received: by 2002:a17:903:3845:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c1e7b3fe70mr187867225ad.5.1780927637550;
        Mon, 08 Jun 2026 07:07:17 -0700 (PDT)
X-Received: by 2002:a17:903:3845:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c1e7b3fe70mr187866695ad.5.1780927637093;
        Mon, 08 Jun 2026 07:07:17 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:16 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:40 +0530
Subject: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=3808;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ldYjYAGXo9AsC38/Eko4nOrSCJF7kUU15KKBuwcyPE8=;
 b=mJqkPYbxbRsScJQJpieQcSgJYF8xfF4BRtw/Lj10jdnv8SKIh4KRJCE4LdjY0kpg5zUwH8pNn
 /0Xgj0KhF9PAINqKk2urbc3bNU6KqB1yUijwzwn9HrUSDaWSKExfPm0
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX+5aZCaovlkyO
 n3uOZznt9dSrq0LJsdbnCDU/jmUEL11s+R5LXZuO9a5IGmapl86cSwSYmZQ3U18LrnPXzI/q3KA
 X8XaPYDAQUo1X+Iu4nGpCfCCG92iuraV12TRcLhbhZcNPcU3dPB02DfDEWuT1wr9q50XXrMuLzG
 15uImbD7gEr+xyncMdsNVUlFBnW9D+1zOL7iSAHVyqOj6fheDed9mP3N7qPfExf+Gy0IUv0ILL0
 pIh62j9YwKXZ8SEH6Cs88pmww4t4kVab/ZIuryqg0wTPdwdybgOokJvrRQP6tPvTg4MfVKG3DNy
 m9ipmHoaYiBl/+QBTu6amP8ghp0SDfWtmEfpG1G6mwEtcunvRzHo5x2JljrtmroqVsDVWO52Kn/
 xNBGkt7T66ZCQGrfpLVyIkYftx46efwbtlSXB/wN21U/8Wh8y190k+70txX2Ea+d9viuxbY2A+e
 0y79U/15HueEDvqE3MA==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26cc96 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7JZC8XBhqYczC4Ahd7wA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: wT2zQAD1_61KO_Syva8CjJzWC_VhzhTY
X-Proofpoint-GUID: wT2zQAD1_61KO_Syva8CjJzWC_VhzhTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64190-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 140F8656FA5

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..b93ce4a92a998ea5d9d4268d2fd46030fafc4084 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,105 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1


