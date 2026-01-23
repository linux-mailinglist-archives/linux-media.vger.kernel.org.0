Return-Path: <linux-media+bounces-51407-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEw4Aro9c2kztgAAu9opvQ
	(envelope-from <linux-media+bounces-51407-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:22:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE56732E7
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4A693043470
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4B533F8B8;
	Fri, 23 Jan 2026 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNJlCuOZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTTquzR+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C418633C511
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160010; cv=none; b=VUbd1+di/VsNR413eouBgSUeK2974E2AiC0gvnccXNocQ2/wmMgUO6mbHXQ4BYuXoxLPQwJbOLvCYC8DywvQL3XZTRU1SC0sL+SoNQ4jnbzL4yTedjmV5EbB4hpLugs/GyoDcx8XH+fJ83LwrTVgmc8HwsMRoIP6/y8GH+dOcpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160010; c=relaxed/simple;
	bh=h/q/M+E5lrtZX/hw90ezY6z3iSB5h9ybxP4GcniLh4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=meUsqsqB4k8cwqgInQzNBF3MFZ7oCIThn1p7zSPII12gcCz/+wYPbOMb6+o0+S8W1NJPkAS+DSFaBIUcmeR9Qm0cLYClLJDBsmVJ34xL5x7LPwjH0ae6jEqlBpWhb+5rfTMRGsW4UK/DrgR93Sqzp5jawEuMubb/pjbWqVyERCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNJlCuOZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTTquzR+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6NDgR2922039
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 09:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P07mPAN8vsvPMA4dIY4vzmQfDmmiMxbFEKJUREEi8/4=; b=SNJlCuOZIqGF0dHD
	IC51N+ecZ2RI4OsYyAWb9FaVBcEXNHFRtg5Q1M0e3aMW+U2FNViG1jhAFcsB3+RU
	zVm8FlM2Z/DqjzHCK4hPoYBsYVsPqTT+L1urj2CzdsmojxWtLVTIlMOe6l2qXpiN
	8u4525Dj/T4cbDQAL7Nje2oL/2UjXlOc2sEqhmJC8be3C6viDgtadwkmQcpTAyhL
	+0at33TTv8recgcpRR0xu5sIFLYEGG1NanpF++ehxO3tvu1SC8xQqWeJeIBbN1wq
	NTRB4PePV23IxDT/jo/k4le6mEeTjJh2++aBqkCJSzs5DRuBW57f9iT2d8SrHAHW
	33cinQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1syjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 09:20:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2f8e7d8dso61492116d6.1
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 01:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769160007; x=1769764807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P07mPAN8vsvPMA4dIY4vzmQfDmmiMxbFEKJUREEi8/4=;
        b=WTTquzR+ArmZSM3FGoLtGuyVg70sF+BpMNqOVeS1ryo56PvtO2uRxjN1WTq2mbt9Oy
         xALIikEHZlKBhI2BITiBxuKW8MnOY+lhZIald9To2a+bhxIgUEVzQHWEJYHnD/SoszFO
         OReEYDdS2tWHNLzrXaZ05LRez66VOBsgrQvjRyqaDBrX2myuK1RYEZeQ21uGkLrlQtxV
         mBwQFOXjJgP90d43x0/PLZ3UXwgq5cDutc0ids34N0eIaRLb3dqguiGXxSEhzJNByCpD
         Xtgu5Cac5S1kdkACNg6KS7/zEys7Xye42PCRjhaaqlMK81nLk7A2qRHZCTvAOLBPEUz3
         Lo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769160007; x=1769764807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P07mPAN8vsvPMA4dIY4vzmQfDmmiMxbFEKJUREEi8/4=;
        b=HdUE59RvQ1rD3ufweD3N2P+LbG/aD/4BwxrhuxGrDAJb7gy5YMJ87ylA77Ogqi2X0S
         hq1CvNwY/WDVLRipCH/oLhcud7WFkGrXrgqZ++7daa7MK8CNeik4RedfoqjlA3dPg0Jl
         aa47KfxcrvQQ/U2XF2PNrU8hAy7VbswwuAKWVr40QRES1T2ynDtCC2YdFdSQ3R0/Dngf
         +7gkilkYLCSLu7663Dfv+BsBPlVBtXONZAINky/hI4ou3RyLX8PC3thSlb3KlERZAFQO
         RnNUPhyR+gCLEet7tF9GgXtF+sEQ0rGbrRb0Pkrb+dOnLPiaaiEfRj2232d6f3/yJ86K
         PjYQ==
X-Gm-Message-State: AOJu0YxS4Cn6+LtdjVikgeVWa8tlwcgaMHplU/2gh+c5QESAvFFMFOjQ
	JWL4jvJDpGXcjNDcesWBuO7rLj8O+PVz0slzYZwfVfvFBE8mvT+MoZH5Cx0NLhBOTPf5CjPRPzM
	OnWBtRh7oN2S4FfFlMFclM+ZX0ReQmtAqL44U8NQc9LcrtsmyO6wz9LvuCy5b5cWeAA==
X-Gm-Gg: AZuq6aIulFoJ6gElffXLC6VtQWWQQpnrlhFR53CnYwmILkwj1s81QYf8z1xdv2ftsOi
	Zy+5Aax3r+Z6tens7XnlQ081aS7/On62U6RS2zEOoQDFWNaT6c6H84hYq2r5OeHNHlvAdY+OT5W
	+WbZZOrr1HmFlPErC8rYESrmATKlc3EqGeqDdqGTMmmj/IBA9Nm+sVpt8o3OUQjhlfgyLohOiUf
	0hO/4+y5opYpjMXvHlK+4voFlvsmxoFajRt2nFfyNaDHRZvCKSdnQGfiylA9Ec13JZWplQSgJuC
	aOJzWYiIb8uM/O++EVQkr+nykhkbBq9OsUQLLH0u+3trezu7/E8OR0RMHjOAjNsD3NDzS+DTKeg
	rLasNanoDaneJeFonm+ZmbCil7edPsB51I++0wJmbDf3KCKHDxTFu85PbxK38y1y49d7NeYlFjj
	Lk
X-Received: by 2002:a05:6214:5284:b0:894:7a20:4ce7 with SMTP id 6a1803df08f44-894901b0001mr30825656d6.28.1769160007159;
        Fri, 23 Jan 2026 01:20:07 -0800 (PST)
X-Received: by 2002:a05:6214:5284:b0:894:7a20:4ce7 with SMTP id 6a1803df08f44-894901b0001mr30825486d6.28.1769160006802;
        Fri, 23 Jan 2026 01:20:06 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8949182443esm13111066d6.11.2026.01.23.01.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:20:06 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 17:19:56 +0800
Subject: [PATCH v7 2/2] media: i2c: imx412: Extend the power-on waiting
 time
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260123-imx412-v7-2-e58303f2b76b@oss.qualcomm.com>
References: <20260123-imx412-v7-0-e58303f2b76b@oss.qualcomm.com>
In-Reply-To: <20260123-imx412-v7-0-e58303f2b76b@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769159998; l=931;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=h/q/M+E5lrtZX/hw90ezY6z3iSB5h9ybxP4GcniLh4A=;
 b=GXfVUEEzc8E/PNqS3KTP9+sUgEMl7iPak5/yZrfgIcBm+Z9TnMnHAPl77/GFM2BHGbDI3FrZ0
 +4w5jnfv9ukApV9zD1VG/j2V0MdxeXQenahiCuc4lBBGze0S+hLZHGn
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: nsL2NikbM3fUuaWLMHtjCJr_MvXl834L
X-Proofpoint-ORIG-GUID: nsL2NikbM3fUuaWLMHtjCJr_MvXl834L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA3MyBTYWx0ZWRfX65Tp/tuyrz0+
 yPzgPtGk9HT5Qs+SnHqrUi0JE0OnQ/nYRfUhPOpn3/7b81jr8k88blFbgGl2DQ0Hive94Ysaia1
 ZpP2kCipGjwMV0Sp5YeVo1SRYmTSytyjPcIXxnKFSCytAMT9MfGVw0OZCzSwZx/Tf6keQrHbN92
 y0f4y/JETlTkV+kiA6BApGsVTLZXdrjZCq86nEzoVvahF/bmAXv0NEEPK8oOLdLY7/MGeEi1XkE
 fKSQebRYVZgj/Ju4ri1mYfFdvEBXYsjq8mbrJF2tWVUfS9FYKJ/3j53V57IfT7L/XmFrJgfDXmE
 LQKpdCVfslWcfDKyBX2edmn6xMRs33m5Wgt1hIT4j1MwzvWYAcre+tTcQTUKs5IounrAj8/zYol
 K5QjHoO3PwXP3GxcVVEcELIcjHGNarpZBCot0PNIIfXlpDddDOc6HneaD0bFY2H1I8GzBNFGcgW
 BZqppqJSQhTcQ/wyA1g==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=69733d47 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dXID522kZObDGRcwZQYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-51407-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BDE56732E7
X-Rspamd-Action: no action

The Arducam IMX577 module requires a longer reset time than the 1000µs
configured in the current driver. Increase the wait time after power-on
to ensure proper initialization.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/imx412.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index aa63dfc349181bf9c180ffd566b0317d05b410c1..e25e0a9ff65c3554d1d1c8297d945378c2c1f27b 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1037,7 +1037,11 @@ static int imx412_power_on(struct device *dev)
 		goto error_reset;
 	}
 
-	usleep_range(1000, 1200);
+	/*
+	 * Certain Arducam IMX577 module variants require a longer reset settle
+	 * time. Increasing the delay from 1ms to 10ms ensures reliable startup.
+	 */
+	usleep_range(10000, 12000);
 
 	return 0;
 

-- 
2.34.1


