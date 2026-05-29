Return-Path: <linux-media+bounces-63043-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aARpDO6lGWptyAgAu9opvQ
	(envelope-from <linux-media+bounces-63043-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:42:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD0B603CBF
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C8F030A55B8
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 14:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB83D3EEAFE;
	Fri, 29 May 2026 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="btev+3wF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gt1YkOR8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F33ED3DC
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065496; cv=none; b=RoI227KOudz5pZM4Ty9uRNYNLugARi+cF5gS9w2c6rhGWjT6ZWDi52z7siNfE4SYzJT6bKX5Xctm45ZRxoZZUBtqD1/6yTQ06elW6L3s01HGdOzYFa8VLHPusIjJq28ufC+ySw/UJO7RdM5lH0ci3g4h1/9Oc++uR84dB0wdqgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065496; c=relaxed/simple;
	bh=9lEkBuKZtL7T3fUi7MQIaCyOwfBBNHf6ISwkYn2IzAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbS3O/QDnNr1k7GmU0W2dUtnU+iN1xWYLXzgWrBKLu+AGf6GQeLrmCgBZv8kPI9k7xY4a7dx5aV+ZpO6Syc95sA0pwOj3wC8NtM0x/5e20S9eZcFhCJvYDSGaEm1j+/7uK6ldIsTjbvo95juB0x5wVTZz912w9CA+fh3J8l5mNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btev+3wF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gt1YkOR8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDL0cW3568485
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OhfLTkCRHJqRMZYe79jrqm1oJVre0tLq/Pdp8JbAs4g=; b=btev+3wF7m3pLyLC
	kPazX6StDaBQzzWOT3WEnIwyO/+Telo9/FiK1rpPNJOGZfpoQgr9KqlbKj72xMIT
	6YZMsnJzpcVJzTKV4sts8ErybJhB9/Ov/nIS1IIuB7YKXGJkW+LTpl20cpIt3dlZ
	yu8VnHFJta7x/ulvDrYVLCOrx9j+L8br7eNxKbiO8uR/RdkQoNSX5AqK4dM1K3lN
	Bg+ReEdjhv7iOap5McmhRDhYDzjjpScyZr/f46D5yYJuAX4UxoXjXY9UJHJETD1K
	zh6xZAbXu0QuxBvMX3Dti24Pg1p8C/POmpItYa0qoe6i1UEk9JLTVeDWS3Ggckyu
	37RJtQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumuyww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c857befe561so170475a12.0
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065493; x=1780670293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhfLTkCRHJqRMZYe79jrqm1oJVre0tLq/Pdp8JbAs4g=;
        b=Gt1YkOR8bMX9sDO/FCmiLSHggUfjNrnTYH7iuSpJpSCM/nM4J8sM2zaC92ixSH800p
         cTBYyfVJF+/kfih5S77l3E2w9h2T+FCZbywFjhFcodUcyzrQ7Oym8RbMzO2OEOFR0VU2
         DgSbP4rPqh1VSK0xqNKRZ/CNyoBaE1cm7fcEkZJoNxr7h6ijAxOQBCoMtGsLRYaF9SpN
         sP764y92+pbt8JSKDppVU5YORKKFPybmUOkmKqrsBuI7ttpKoVjy0NrHBZM27Qk1A3E9
         n+kyqSWCcBCPnC8f+k0T6yFGeAFK/uxwrIU8ujwuSnXHAN6gcXQc0tkG7VWDFMyF6zxQ
         Oyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065493; x=1780670293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OhfLTkCRHJqRMZYe79jrqm1oJVre0tLq/Pdp8JbAs4g=;
        b=TeDS2EZrvP4YNqw2F8v1JdorGZNrQs4xa3feGjnf3o3c2yifmeIbJY1GsF+e5PvlZ5
         T4pz1fT1ULtuKcZ2x9gFzV8NM9kbahH5KJ7iA0XO1x9kUn6XfbJLaLfPCEDLw+sxinQO
         +9Dfwatu0Jed86vyNFN1aSDqLEDBja8dsecVl4SkJNRZvOBFmd9H4VO6eEF3vF5BuQ6K
         0osdSG2oTzA1Jf7hvuFFbIGq8g7Pc/1jzrDgOFgQA78dflxXInPxQ4XOiNtI9PSi8TXd
         FgzPa2Jy9KMGQPtXSnscXx3PIkmBD0q2wTqFOFyFhGk5inZ9gQJFCEMeyU+LDH4pV9rC
         ON3w==
X-Forwarded-Encrypted: i=1; AFNElJ8TUipaiWOC0wFg64hUb82DnpVkOjdpFnrVpgrR/DEvaYkcrUu7UK+uyHEFO9QcgiOhMG/cqSwq320YkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF4niEjLpRgXHhCqkkN6LeMdOUY7tLfnhl1xUlls7Lm023v5km
	oDC0Rcts2/5xTZVUxTsSp1XUBonP65eQoMU27hSiE2/b1CqkGNpxqMpYRqhINnR+aUEEU+4eXbk
	UoeRNXcNtARqNqftq6E8kfEZczP3xpy9BQvWpaY7PHCIJo+2ylHTSVq9Kxhu/yehUGQ==
X-Gm-Gg: Acq92OHaYZVXM98oJzFd21gKpmWbky+NnQpApc0a67g28VsVj0pjZs2k2ji2mQjccJb
	jY1Qj2takKR89Jbe7fjlF+fqDkSC4R9OKXQuUprSQM3bxoPu/2r2ATKjMoWOWGs4ZXOlpUBwrp+
	DI12bb2G6WwtkRft39oTb53IulqxjKsmmELf/zUYPuaepeO/InOegDV+oVkxdnXBTpH+2MLphsz
	YsAiP3McWcjM/nBL34puZb4ZySGinPJazu8meOjiPnNeT6WpABoJcGSSmfcr6LX8I+eG44f4vA5
	iCcBMBjeK+xVu87AmnWD/jEC3cOfButEC3Q9Xx3vVBP0rco2oH+h54c0QL69kV5UpJDC56zPql6
	AT8j3T6gKLuG8Fly7CJxN9a4vBGfpFv/yABH2AgcMLsNLIS5QDpfO8ajMLZo5PFmWWw==
X-Received: by 2002:a05:6a21:7a4c:b0:3a0:b781:4c8b with SMTP id adf61e73a8af0-3b411be480fmr3690407637.2.1780065492585;
        Fri, 29 May 2026 07:38:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a4c:b0:3a0:b781:4c8b with SMTP id adf61e73a8af0-3b411be480fmr3690352637.2.1780065492079;
        Fri, 29 May 2026 07:38:12 -0700 (PDT)
Received: from hu-vikramsa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm2469394a12.15.2026.05.29.07.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:38:11 -0700 (PDT)
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:07:24 +0530
Subject: [PATCH 4/6] media: qcom: camss: Add CSIPHY support for Glymur
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-glymur_camss-v1-4-bee535396d22@oss.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
In-Reply-To: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780065463; l=3341;
 i=vikram.sharma@oss.qualcomm.com; s=20240628; h=from:subject:message-id;
 bh=ThwUpqoqpxggiYDM26CYveGVee9nWCp1GcaenJjTqA4=;
 b=2WI/R7mQuiKUcwOVOQrM3kzK9msV96N2o1X7AY5tlaFYdFqhPYZ/nHgc696IHGFZp8l1L37jj
 0piNurIlbToAs7LkT1I4q7Q8dJ2Xxt+0gDochIFsla4V+jSAqXxrJHs
X-Developer-Key: i=vikram.sharma@oss.qualcomm.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-Proofpoint-GUID: VR7-N_4nj4bzxNwmGAWDale1kPWibugb
X-Proofpoint-ORIG-GUID: VR7-N_4nj4bzxNwmGAWDale1kPWibugb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfXyAHxAGPu4R/e
 zBLhpFCxhMNh6DOAMG/oKCuC/K0YnbBiUjzd4TArpIqfJtpmrnrPA1tk0tcpBfHd/nu6Fx5KoWL
 ZcNbTdmeHPNRTc8QkfRQQPbHh4r9yPL2wi/Is9BkDbBGTOyVe9Uc9DHf0yG0FUdz7nxIU4fpdDJ
 VBBeWC4Vj4RCpEA1MG693jKIVNP8d2RDLmADt3D0phIXy0McoSCL/lbNFpVibdLoMrcXHpFkG8h
 HLqS/P+TC/ObBxvCJQ05wI5Jv/1AY+ddoRYcr8xgcsGeqBbSiwPvckKGOReOXmuwuZyjIqqv6nV
 vYPUtaSK2lgnpMlS8ihiDJTIJgmzRTzXqXOwQkunOvUYkz4JED0vCcSqSzKC65b9+BFXWRrff94
 K/0893o0q32U2KlcT1iuRmGXjUDUZ5zpYbUnq4LF43U2GR3r7TbKbklbCYM4s1LJS5mmYpIJr7B
 Iw6tbXTJMd/44CXvtzg==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a19a4d5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=slCHJDK8HlXwqJ58Y7EA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-63043-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FD0B603CBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>

Glymur uses the same CSIPHY hardware version as x1e80100. The only
difference between the two platforms is the number of CSIPHY instances.
x1e80100 has four, while Glymur has three.

Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  2 +
 drivers/media/platform/qcom/camss/camss.c          | 54 ++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index dac8d2ecf799..c6d8531bce58 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1140,6 +1140,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_GLYMUR:
 	case CAMSS_X1E80100:
 		ret = true;
 		break;
@@ -1239,6 +1240,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sc8280xp[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
 		break;
+	case CAMSS_GLYMUR:
 	case CAMSS_X1E80100:
 		regs->lane_regs = &lane_regs_x1e80100[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c6276d746352..864e16e999e3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4536,6 +4536,60 @@ static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
 	.reg = "csid_wrapper",
 };
 
+static const struct camss_subdev_resources csiphy_res_glymur[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
+		},
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
+		},
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
+		},
+		.clock = { "csiphy4", "csiphy4_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate

-- 
2.43.0


