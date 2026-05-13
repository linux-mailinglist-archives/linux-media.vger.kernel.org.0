Return-Path: <linux-media+bounces-61439-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGbDBot4BGqpKAIAu9opvQ
	(envelope-from <linux-media+bounces-61439-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:11:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89306533BCE
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2C7132036AB
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C5C47F2FA;
	Wed, 13 May 2026 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/gZlQy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpYXdq2Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C6F47DFB5
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676584; cv=none; b=fE1x/SHCxyOGQQGXIkBMBFTopfWIwD5t+NZ7cxTmijIBironPpohDvV5wJUGXq8+uh3648zIy1keMyJadhNQlZaltVbsCTpfi9rvk5bBgIokGDtCuxvtBv+J6rHD7H0BiIE/GDPYSfxwgeRdJd1D/A4u+V0Q4k1JeuGPmDnlmzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676584; c=relaxed/simple;
	bh=meJeOGC9Adf/PUbg6XCNyvrgECBd7eveB7tX76HF7r4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYlXhRb0tKtmhmGKZ3V5H5YrjHZKZ/cjgqEpj79EFWPAQfFtnTqhMHfFHOOFaiZLBHfbVWZrdcn9Aq/2pWd15sMuCVqNiqXoclIr96mZVrtZ231XRRL8KGmd5KpPcOHKe0CT23OFJT1+gokHW6WaqPN+Y2Lfemu9SGX7v7FNtPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/gZlQy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpYXdq2Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wsaJ4159821
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=; b=Z/gZlQy7PbIStwmq
	AjIUq/tQOUp3KBfEiMyznFR3aaiYfcnConYxAmLAAxsvt6SktT6PEzYezoTlv2ly
	pVQd2y2hpav/6QJLVDUsu0bItjIaPZKbPRNunCAmJXqi8I+qoL1NdooVF5mUF+D6
	8GxnHXNhlxhTZ0/7S/l2GQK+2+VRn5jHr9wUwC1OpAtf9SsmtDPLg8Bdbj1vi09J
	lEMfSPJVGsw3rN09lzSMT4VnWWX9IY5LSJgCFFw5c3WjamAKaZachb/apmMbyRX5
	NNSP3JmVLuZaPV/n1zK2PVu2zPmjvSGb1qPY6RcbXtK5XrNoeN+kai+xckzz4HIK
	kEQzSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91rtdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb3403e99so129933691cf.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676577; x=1779281377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=;
        b=jpYXdq2ZXRK2iMcwhz7NP73YE7Uq1WAcubVXdVr1zhstESVfk4ZGE6FxYG1970PHJp
         XRLXWKIkXPml3SeGiJxcaAJazzOPRjhCfefVS5NrBIKXxHMBzT/kjDkqm9md4wLF/7Uf
         41ZflvPWpbO6OyaYkV+2xHTBvQIQJdxUMclgSQ+DqeOfQb9HXyuOLwj9d2x0R7UeRNGX
         mVCKPQ+jh9qqG7vMIpqHaJmdxpG6WC6ub2O4WKMe08RbCSPrW52MzbeY8ZCqwqmsfRnO
         e67xOBH5hTqQ6kDzTFMhHe8322Ge5olPruPJz4rbN1FVOBdD4ECNub3S9S8juJ/ODkEG
         xZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676577; x=1779281377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=;
        b=nqfDF7DCW4yo8+njH7qnpILwPt3J9n4xgojauVIzp9hSi9jjSyKpP6/VQHLZJur8/O
         qkfVK0m2JsxTySek/OFyh5qY7uBfBI6TBHpw662Kck1AwkPuQriym4QnPKQlZDWQFaUV
         PHoReVfrzrCP0cbbPp+nxA2R1wUOOKe0dTqUYxBlXlJ6qwSLeNtO13+T6uN3V6iJJgfE
         btY7d00f6zCIIl9l4MphPzq6a+1Pl3qE6d3vdmIWG6WWz1tt1wvMJq1Fio1Y1TtGefoR
         zkwat0lN/jcUftC1ViSk1M5SrtG0Et/bXDlIH4eske9C+S4JzeN6lKzb3sigZ64DDyhF
         0iEQ==
X-Gm-Message-State: AOJu0Yw3VmvBeGdMzBLnULzSuEbA/1Fd8MVurWoghsHAFIdLIykqd1nE
	ASag3jsx/iD0rqwChysOBH49wtyO7Q948GeVI7qRQAnWSedM2WG5nkdTvoPbytpp/aElmUweRX+
	ebUnthjfcQJjjsge34eFNO13jjt7Qx7tZ3dpKL7j39zZBwfJCz5+xvM8/732Xj+D+5A==
X-Gm-Gg: Acq92OED6t1ySsSNb6AKKGTXYPfJTSmLS90tLS85+B3gRhqhmDHSdC6ztslFUQnZjO7
	KxtLpLR1FKtkycLIDJ0RVmmEG5yOGIrkKppncE2A3TMClmXL68k8DsrMPsc/9kXRlPupwBD20zt
	jcvtufAVUFDaoeWAzBdvknIO61HCGoKySRCtbSE9AydHgmE/KWxO71lblVlhByT6B6FO/iwQwbj
	A2o+g+iHOr3P27qeP91iBIMDgl3m/uTMpiKZanP58aJe1sFt2KsRb7qZLyoW/M18qLvwaPIukm8
	f/qZTGWPCNr+/GdLOV5/NfVrW9CiW60rv/Zdr7Ywp8PyGf+QxTohiBR7jy4S86X6pZnD2m0o5LR
	RySMTUm/S2hfjrg4GrskfKZc99FRvTLVuh1PiAfTpPaOCZRurIadR5am7Ise6ROhKg+Bmbwyepf
	rmOvfs9+HRy4rmayxe2sGZoiy5d4BFFGX8Twk=
X-Received: by 2002:ac8:5cd3:0:b0:50d:2a98:2571 with SMTP id d75a77b69052e-5162f4f3e7cmr40521771cf.26.1778676577421;
        Wed, 13 May 2026 05:49:37 -0700 (PDT)
X-Received: by 2002:ac8:5cd3:0:b0:50d:2a98:2571 with SMTP id d75a77b69052e-5162f4f3e7cmr40521371cf.26.1778676577015;
        Wed, 13 May 2026 05:49:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:49 +0300
Subject: [PATCH v2 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-15-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=meJeOGC9Adf/PUbg6XCNyvrgECBd7eveB7tX76HF7r4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNCqDkd+/my+4Zch5WrbQGUhtinV7vQ2iMJK
 aI9jiLyywmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQgAKCRCLPIo+Aiko
 1XA8B/0aFQviITS2/29twOQtDjV5eET5d/nFw8fkKm/wkjrCB7yhkkDeZY5KZuzKcg4jsg+V6O5
 QUqasSCemq8H6HSaF3x3Y/MxlkGlIijcxWzSPHyRyO7qmdIOSkzAoNV32UTj7KQU9RjWp2h/QuN
 +iY+viGXFR7vGTK3Z0AuM2DTeyG/ryvEDbU1cvhJKEfdLFfwXCA605iqR3ehhcJR0TtFS5Uz2VU
 qMvdB9jBrFSuoACAc4vNWoN0e6Yic2FQS8v6tmmbM37s7Qk89tsD93VI8HZWz+OQ3eaFfauQ7og
 Nz3bKCkpqxSkpQG1tMyF4l4iVGxNgqlbG+1qaAclLxBhiKx/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 2P2RGZ6TP3rcZLzjvPH6H5KXR27Go0VZ
X-Proofpoint-GUID: 2P2RGZ6TP3rcZLzjvPH6H5KXR27Go0VZ
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a047362 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX4fvrn52tRoTg
 mv7/dFwOFIrFRjwazH3dOxP0//5o7wyx3+7KORJB78gS/ve6W/ZmLrGM8t2E47t0yN49XVzJrde
 grXG5viSyeQIMExXVyw8b8oDFgwGiRZOkvB194V5ilQ4D/v1UAmTzp4CmYWmCzqib7sHQzK3dt6
 HQZCiJE/6uby7N3DGUtPpHuB4OCsUm9kpWKcYBoFCbOiScKPK6sPPxn2aiAQos1XLx4tGgplqSZ
 yTG1byFy/OOxkfUfg153C7ickxp5XOE7RP42IfylbOrhyu0AmZaP040iYseEat/wrwnZ/hRE4e2
 LrXBkxvomFloy8pHEj7jJbD8EWJfIJD9B+hyTImhXsHVm/rAjVTpE4lDipdfaE+IyUAfbt3K2OB
 /jIkl8vxSCQ/oitNqqTXe7XvEt7MqTU9HnkyWFC6TWtGEU9lPH4XcfYzYzxdGG64Td/W4rbT/yt
 FS7lGL6ckgmWfM/Yx3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130132
X-Rspamd-Queue-Id: 89306533BCE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-61439-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.30:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a87e8afb23df..8838fa958571 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1074,7 +1074,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,12 +1124,15 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3


