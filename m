Return-Path: <linux-media+bounces-51515-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ICSOxjNdmktWwEAu9opvQ
	(envelope-from <linux-media+bounces-51515-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 03:10:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACCE836E5
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 03:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CF7730117B3
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 02:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C34C2236FD;
	Mon, 26 Jan 2026 02:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngULxMQf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cA1AWr7e"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7EA1FDE31
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769393391; cv=none; b=XCmfff/50lV5WLErUx2Fo7rHn6m29PpAL1eilVwtShj6MnIjtgXb1/g6x6UNf3wSwkBfEHoJk3uSBlB722lhoE6D6QYMq2NFeDQFWoVegZE2DB1MCdaGt/bcEQrNTQM1ujZqcWZswC/EiNFHYKlXu6wQWKGKNaIF5gLMwcbqiYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769393391; c=relaxed/simple;
	bh=vHxga/uSYViZ719FSLl/RswfKHr2CDa4nNQE5M69E3g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ri2gB0Ow+kUG4HZ3MAF4bMaOOhl2J+ZBgL1d/GoQuXFEUUSuxvLkeDJnS4QriWH9FWtilwh/fH0HbA3UC8Ae/Xiv0dQ6sOvQTph8spGGlpA0QDMGGzlSpArigAJjCbBmHsHt0/VYPrlL4A/lyN4xAgW63I/ERDLRhStJkOJ4SUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngULxMQf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cA1AWr7e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P7pVXr3575046
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aDH3OZOrhFiB8qZUJYQrPC
	gbLEM5wp2a86h0yLVbzqo=; b=ngULxMQfRw0E28p73sVzwCddedmuqR7NnsnW9I
	W5gsveAXn9BeLAqd1aWyuAGf4tCYbOgiyk26OK5Aztl1IPbK/qqVm1KMf4IRxIKO
	wEQ1aC7V4/FyQO0+Qt7JC0D/Qln/NeanM773iQNnE9KTfaDhOvspIEFbtBgLoyNn
	aAcLGDc7o3dWJL9QH9QutAcnU9VBJ5xK3M5L4JKie2rxeFO89sUKnNpr8eidoTY6
	OKvq7bYp2ULE2HcSikaF7+SmLVpUuaRxR7/O1xmtHgOEw+fjDNCZneWS8NkdQDWl
	uMUGqNF2tVX4FXUJwkPu/z+X4NBGpj9HkoNuRmPxAAEMwsQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwtyaja2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:09:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c53919fbfcso1040293385a.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 18:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769393382; x=1769998182; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDH3OZOrhFiB8qZUJYQrPCgbLEM5wp2a86h0yLVbzqo=;
        b=cA1AWr7epKQo9pdWrbSPfdt/4NgPZetnTWEbf01T01pT96FPAR3sAS/vM8/vlkrXJo
         bPjvtj8gagbZq3Soq5BTMlijorldw+AcDg3cgKYSnJOM4AVFJLGqJXt1ELbU7F4JledK
         f3htyVH8VD8XEyCMjVSnqNPWdund0aknkpwkOTFdnRnHv9xXJ+d/iWdo0F77vbxCyAGQ
         yXgFyjSKQdZ4rU/vo0C2njuerPqa39VCeX6jHuFjKUCeClWKNUhpkRoOtMr2OZ/p7w6h
         F8oeAImb7miDrFrlTQh6FFAjvtk6w3EKDfGxX+USLyE6WYedvXjkEg/vupaXaxTfqyOA
         1b/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393382; x=1769998182;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDH3OZOrhFiB8qZUJYQrPCgbLEM5wp2a86h0yLVbzqo=;
        b=cbjuThcvOEgkRF5H+LfcRC8DSXntx9DlLpyqiiLJ4clWP9Xk6Wis9UBmH796yrALyq
         kkfzVabCR4B+gMiFMJBRujntdvgzeFDWRlHtLs15WVnqU8+wfngoz5j0+gcFvsZ8WAd/
         i5gbE2f9VXcpZlJHaZFYFYDdx6vR6NRJvbC9VNJ2AXmeQEiKHBL98YQJj4BA06BoYRJ4
         iyK536Gc/6SR2z2A/4B4cLHw23Yn9xRvGqfVrWF782UZzt/oAphyNm7NahvWlWSw9chs
         p1TlMA0jLIWhsf6n8FnK996OQN+gxO9lJigsJRGNiK7j9rFLPm0js5uwCGtNW4SGW+10
         vBuA==
X-Gm-Message-State: AOJu0Yxp3uwsl1ekYYBXc8/spwPOg9fT+TEmLiucJxfJyhK9VaJaFVpU
	VyngO2N5BkCD7AXSX75WI1gtenBm4OfJPRTLnNSC/eJguvIN7BVtWdiMDey8E3tVbvNervDrheT
	2fEXLwxg+TAVVuflf3RatHkeHLXKK72IlcBBtro9Mkhc7SrzJAEkIFvH4+f1PBJxiQg==
X-Gm-Gg: AZuq6aJhVdK0632nh/Xpx/pNvFM6dveTqnN+bq9TuL5GGXn2nQvKRjvwjZ851QZy9kv
	QE24gRAMRVZks5TZjSEFyVfHIBpJbCiexXEaE/Buu+mMNRc8PjdKsrf+mHG3qU21rj2D7tmAB1B
	JV6badmum+nBhoVxZRGG/5abcmaTXgrQvdYbMQVytbZQeyqblNOAZjNZlTSIhx19IVzsLXy6nTV
	Ill7lFGUNXAASlJSHCwm7J8x4BVUaPx2e8KapHCS7I6BWiMr0wxtPK0aHmIZKWzvnqD4X2GBdWI
	YcpkBGpQWAyEmvhw/HqNUcMmofPWm35IjcTUMFxPmmvHArvSlCQ2a/v1OX0HtFBTgsp2tVyxzAF
	E6+exrrNxfuiuEnlXaSFVITLt9x74Nr7qGcKkR/rnvKt+9BRbjx2Thh4VYntSR3g944RPjE9GLW
	whkhsTDI1t0/PanXmH0feR5VM=
X-Received: by 2002:a05:620a:2946:b0:8c0:ceb0:890a with SMTP id af79cd13be357-8c6f95853d9mr375529285a.16.1769393382357;
        Sun, 25 Jan 2026 18:09:42 -0800 (PST)
X-Received: by 2002:a05:620a:2946:b0:8c0:ceb0:890a with SMTP id af79cd13be357-8c6f95853d9mr375526485a.16.1769393381775;
        Sun, 25 Jan 2026 18:09:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faed52sm22778201fa.2.2026.01.25.18.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 18:09:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] media: qcom: flip the switch between Venus and Iris
 drivers
Date: Mon, 26 Jan 2026 04:09:35 +0200
Message-Id: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/MdmkC/4WPzY7CMAyEX6XKmUB+tlHbE++BOKSpu7VEf4jT0
 BXi3dfQy972Ymkse76ZpyCICCSa4ikiZCScJxbmUIgw+OkbJHashVGm1FrXMsO0ksSIJPsbLpI
 emMIgu7L2tm+D81+t4OclQo/bx/hyZT0gpTn+fDhZv7f/WmYttaxKY13dOwfWnWei4331tzCP4
 5GHuL52VIT7ytHTzhOtJ5DvI0xNMcGWTqOnBFH8bcUllXFKG7WjKVSmUtvCyE5bbqJK65psGfL
 6BUwoy+YnAQAA
X-Change-ID: 20251119-venus-iris-flip-switch-d59a3fbc6a4b
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6822;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vHxga/uSYViZ719FSLl/RswfKHr2CDa4nNQE5M69E3g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdszjiK/YlDxKPnsGYLNafMx58TXYJxR6vJUMw
 53exppVHFuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXbM4wAKCRCLPIo+Aiko
 1eN0B/42lGlHJXv8C5Irm2AknE2C7snY3iZrkihTBz88mgUCj+/MO+DrRVmJQ8jrqZttFucza2P
 FwrjUFVMUMoVpPW1Zs8xtec3j7Gsu6UewzEQ+7eNASIuOItZ2a/oAu56g+nqa54RWKbega1fLdw
 Xl5Qc1hlPlgeefcE+fYwdq1uLDr0QPwzUGKl3csITWRyt8NB4jsKbVTKo1BF7/51w/e7u2TwswH
 x8QhFd2TO48iG0lR9fICcnqDH7LFmgoReeKsCO1cxF017xind0u72McSQmk260Am1x4k6YEL0UB
 vK6gW8Ej1mi64MdvX+wYrPzclDq5wxNHsg7KzOA29wbO14LJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: s2lXPMX73XgzPK9-ZlIDLzyVEYoZ4J6E
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=6976cce7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eXfWA5zK0X9Z4glz7VIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: s2lXPMX73XgzPK9-ZlIDLzyVEYoZ4J6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAxNyBTYWx0ZWRfX+SdYcHmcHOUg
 32csM5MLkFw/McbKPfdpr15CJXiGgAkiJhWAhJU0UkvNp54O7jJC16jFlaB7HDv6NUCwJQFdoZd
 J0ox54IZ1vExohivuI+8Ws25LeG9u9fFS/az+MfcWxNbwQFe8d0n6fOwlq4X/XMh9qv5Pgzx0Mg
 BVKhzDEZAs/HBxpRHiY1w7tL+Rf1zkKk/tDgsoulXmdbgjqQfujJLviBiXRI0X/nwuuKpqP7AeP
 hxndhM6CdpsgLMJ3iLGkrJ2BXbrE7Nfu/omNpCxa2OL5GXbyRObHp61ai72Ib0UoOvXiSJbA8Oq
 VY9+wDDeFynEBjLhs6Y9BM3pLW9CD2A0gZOFzkwUbwqUXWBygJslyeGGHyY6bXgKqXOZwLshT15
 vNmrA/DTbK+mn16LMILPdnX63UDVOHYPJBMCUs4vuTcfimEVCd5KGO77PSyy/zw1fP/BjrFpKcI
 ttVH7Zc74TV7LIl++Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-51515-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[out-h264.md:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,out-vp9.md:url,qualcomm.com:email,qualcomm.com:dkim,out-h265.md:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6ACCE836E5
X-Rspamd-Action: no action

As the Venus and Iris drivers are close to the "feature parity" for the
common platforms (SC7280, SM8250), in order to get more attention to
squashing bugs from the Iris driver, flip the switch and default to the
Iris driver if both are enabled. The Iris driver has several
regressions, but hopefully they can be fixed through the development
cycle by the respective team. Also it is better to fail the test than
crash the device (which Venus driver does a lot).

Note: then intention is to land this in 6.21, which might let us to
drop those platforms from the Venus driver in 6.22+.

Testing methodology: fluster test-suite, single-threaded mode, SM8250
device (RB5).

$ ./fluster.py r -j 1 -d  GStreamer-H.264-V4L2-Gst1.0 -s -so out-h264.md -ts JVT-AVC_V1
$ ./fluster.py r -j 1 -d  GStreamer-H.265-V4L2-Gst1.0 -s -so out-h265.md -ts JCT-VC-HEVC_V1
$ ./fluster.py r -j 1 -d  GStreamer-VP9-V4L2-Gst1.0 -s -so out-vp9.md

For H.264:

Only the main set was used on both platforms

On Venus pass 126/135
On Iris  pass 78/135

- Fail on Iris, but pass on Venus:
  cabac_mot_fld0_full, cabac_mot_mbaff0_full, cabac_mot_picaff0_full,
  CAFI1_SVA_C, CAMA1_Sony_C, cama1_vtc_c, cama2_vtc_b, cama3_vtc_b,
  CAMACI3_Sony_C, CAMASL3_Sony_B, CAMP_MOT_MBAFF_L30,
  CAMP_MOT_MBAFF_L31, CANLMA2_Sony_C, CANLMA3_Sony_C,
  cavlc_mot_fld0_full_B, cavlc_mot_mbaff0_full_B,
  cavlc_mot_picaff0_full_B, CVCANLMA2_Sony_C, CVFI1_Sony_D, CVFI1_SVA_C,
  CVFI2_Sony_H, CVFI2_SVA_C, CVMA1_Sony_D, CVMAPAQP3_Sony_E,
  CVMAQP2_Sony_G, CVMAQP3_Sony_D, CVMP_MOT_FLD_L30_B,
  CVMP_MOT_FRM_L31_B, CVNLFI1_Sony_C, CVNLFI2_Sony_H, FI1_Sony_E,
  MR9_BT_B, Sharp_MP_Field_1_B, Sharp_MP_Field_2_B, Sharp_MP_Field_3_B,
  Sharp_MP_PAFF_1r2, Sharp_MP_PAFF_2r

- Fail on Venus, but pass on Iris:
  BA3_SVA_C

For Venus several tests crash the firmware or crash the device,
so test-suite was executed with extra:

-sv CABREF3_Sand_D CAMANL1_TOSHIBA_B CAMA1_TOSHIBA_B \
  CAMA3_Sand_E CAMANL2_TOSHIBA_B CAMANL3_Sand_E CAPA1_TOSHIBA_B \
  CAPAMA3_Sand_F CVMA1_TOSHIBA_B CVMANL1_TOSHIBA_B CVMANL2_TOSHIBA_B \
  CVPA1_TOSHIBA_B

For H.265:

Only the main set was used on both platforms

On Venus pass 135/147
On Iris  pass 133/147

- Fail on Iris, but pass on Venus:
  INITQP_B_Main10_Sony_1, WP_A_MAIN10_Toshiba_3,
  WPP_A_ericsson_MAIN10_2, WPP_B_ericsson_MAIN10_2,
  WPP_C_ericsson_MAIN10_2, WPP_E_ericsson_MAIN10_2,
  WPP_F_ericsson_MAIN10_2

- Fail on Venus, but pass on Iris:
  ipcm_A_NEC_3, ipcm_B_NEC_3, ipcm_C_NEC_3, ipcm_D_NEC_3, ipcm_E_NEC_2,
  IPRED_B_Nokia_3, VPSSPSPPS_A_MainConcept_1

For VP9 codec:

On Venus pass 174/311
On Iris  pass 232/311

- Fail on Venus, but pass on Iris:
  vp90-2-05-resize.ivf, vp90-2-14-resize-10frames-fp-tiles-1-2-4-8,
  vp90-2-14-resize-10frames-fp-tiles-1-2,
  vp90-2-14-resize-10frames-fp-tiles-1-4,
  vp90-2-14-resize-10frames-fp-tiles-1-8,
  vp90-2-14-resize-10frames-fp-tiles-2-1,
  vp90-2-14-resize-10frames-fp-tiles-2-4,
  vp90-2-14-resize-10frames-fp-tiles-2-8,
  vp90-2-14-resize-10frames-fp-tiles-4-1,
  vp90-2-14-resize-10frames-fp-tiles-4-2,
  vp90-2-14-resize-10frames-fp-tiles-4-8,
  vp90-2-14-resize-10frames-fp-tiles-8-1,
  vp90-2-14-resize-10frames-fp-tiles-8-2,
  vp90-2-14-resize-10frames-fp-tiles-8-4-2-1,
  vp90-2-14-resize-10frames-fp-tiles-8-4, vp90-2-14-resize-fp-tiles-1-16,
  vp90-2-14-resize-fp-tiles-1-2-4-8-16, vp90-2-14-resize-fp-tiles-1-2,
  vp90-2-14-resize-fp-tiles-1-4, vp90-2-14-resize-fp-tiles-16-1,
  vp90-2-14-resize-fp-tiles-16-2, vp90-2-14-resize-fp-tiles-16-4,
  vp90-2-14-resize-fp-tiles-16-8-4-2-1, vp90-2-14-resize-fp-tiles-16-8,
  vp90-2-14-resize-fp-tiles-1-8, vp90-2-14-resize-fp-tiles-2-16,
  vp90-2-14-resize-fp-tiles-2-1, vp90-2-14-resize-fp-tiles-2-4,
  vp90-2-14-resize-fp-tiles-2-8, vp90-2-14-resize-fp-tiles-4-16,
  vp90-2-14-resize-fp-tiles-4-1, vp90-2-14-resize-fp-tiles-4-2,
  vp90-2-14-resize-fp-tiles-4-8, vp90-2-14-resize-fp-tiles-8-16,
  vp90-2-14-resize-fp-tiles-8-1, vp90-2-14-resize-fp-tiles-8-2,
  vp90-2-14-resize-fp-tiles-8-4, vp90-2-15-segkey,
  vp90-2-21-resize_inter_1280x720_5_1-2, vp90-2-21-resize_inter_1280x720_5_3-4,
  vp90-2-21-resize_inter_1280x720_7_1-2, vp90-2-21-resize_inter_1280x720_7_3-4,
  vp90-2-21-resize_inter_1920x1080_5_1-2,
  vp90-2-21-resize_inter_1920x1080_5_3-4,
  vp90-2-21-resize_inter_1920x1080_7_1-2,
  vp90-2-21-resize_inter_1920x1080_7_3-4,
  vp90-2-21-resize_inter_320x180_5_3-4, vp90-2-21-resize_inter_320x180_7_3-4,
  vp90-2-21-resize_inter_320x240_5_3-4, vp90-2-21-resize_inter_320x240_7_3-4,
  vp90-2-21-resize_inter_640x360_5_1-2, vp90-2-21-resize_inter_640x360_5_3-4,
  vp90-2-21-resize_inter_640x360_7_1-2, vp90-2-21-resize_inter_640x360_7_3-4,
  vp90-2-21-resize_inter_640x480_5_1-2, vp90-2-21-resize_inter_640x480_5_3-4,
  vp90-2-21-resize_inter_640x480_7_1-2, vp90-2-21-resize_inter_640x480_7_3-4

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Sorted out SC7280 Chromebook bindings (Stephan)
- Dropped most of ifdef from venus (Vikash, Konrad)
- Added testign results to the cover letter.
- Link to v1: https://lore.kernel.org/r/20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      arm64: dts: qcom: sc7280-chrome-common: disable Venus
      media: dt-bindings: qcom,sc7280-venus: drop non-PAS support
      media: dt-bindings: qcom-sc7180-venus: move video-firmware here
      media: qcom: venus: flip the venus/iris switch

 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,sc7280-venus.yaml      | 10 ++--------
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi        | 11 -----------
 drivers/media/platform/qcom/iris/iris_probe.c             |  4 ----
 drivers/media/platform/qcom/venus/core.c                  |  6 ++++++
 drivers/media/platform/qcom/venus/core.h                  | 11 +++++++++++
 7 files changed, 34 insertions(+), 38 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b
prerequisite-change-id: 20260120-iris-sc8280xp-85d13bc60536:v3
prerequisite-patch-id: d34f95892aabfca4695d8b41c4001a23688e72ad
prerequisite-patch-id: 0dd97291d4aa94feb2e915a6a6324ac0031deca8
prerequisite-patch-id: 9de15d81588208683f296b6d48363226df41fbd6
prerequisite-patch-id: 6a89a4c1709b0b543a7d2a03954b7a628f549aa5
prerequisite-patch-id: 668a6b7fec7ed8302ab23c65ad76481be06847f6
prerequisite-patch-id: e423b8d12b47c7414e694625204977e37414ce4e
prerequisite-patch-id: e5be869bdd8a73b5c3d3407b1a47c66c944dc832

Best regards,
-- 
With best wishes
Dmitry


