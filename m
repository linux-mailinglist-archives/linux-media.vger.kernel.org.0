Return-Path: <linux-media+bounces-66339-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OXe5MnNJRmouNwsAu9opvQ
	(envelope-from <linux-media+bounces-66339-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:20:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E259B6F695D
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:20:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S8lYFLYe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FKIEyztY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66339-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66339-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC1F4329B122
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 10:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E71C3EC2E3;
	Thu,  2 Jul 2026 10:52:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EDE3EC2EB
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 10:52:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989555; cv=none; b=mqT2meAekJj3BvTZz+zx/0sWPwF28iOtqJXbNxPsKBqZOaWawWtvb7ML2peArs+oPHNoVgV2Ihg5zaX5o7OCRk88QYqADc5KkDI6fsuNMwDl/ZZSToZ5+TC6Bef4in5InlWlGKeWfoPbE1SSL7f+5eVFZy6PCLNK/poPQOdGBSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989555; c=relaxed/simple;
	bh=1ElxFLNDdcm7tT0G2r0483Te8LeJh+5WxdZjxDn7frY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DozbJMCKFcubhgWazus5nyqj1sZ/QW9611T/o0uKZ8luItWt7anEZMvvDCs8B7Lav8Y2E/ViBOHkfovwIAIkM+HejvXhJnye8bsIRMXyIzya7pWmn8V8zjTcvLfUFC/Xd19AfQ8nB0p+5NYzKRfuNfLcFTFsBySZj4aehVrfVTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8lYFLYe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKIEyztY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628XuQL3009571
	for <linux-media@vger.kernel.org>; Thu, 2 Jul 2026 10:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQ8k0Hy6I4Il15nmvaRyog5wQzrR4WfLYo49ICWlyxk=; b=S8lYFLYeWGog6qSi
	BGGiiMNfwDpONqVvBrUpkhOTnkc2OpaDpoGZUTHcKS2kGQy3Y/16RYl4aP5D5Gww
	EnOA2B2qkYtdsbnXCeWYQlse1jJpeML2nr4DnGL3MZ9Rsk3JMhT+zuQ0lbf7ZKvO
	bVsWxKS4ro9NEXnAd+/YpIbXz4Ij3mmCj7BJOHY4OQgoxuUPwXvHJ5LT2n8CLf2C
	74ZsyFRKu+tgJw2u58SLco1MiuRuUTXMUF7NEkF8lXMCAhqyMXjPh8cHbW2IE1I5
	kEW0eEa6Now3v/wVBzpV+8iVwFBLdYHB2kF6wfOibRd5jVJdDG2B/4qPL4pRlLUx
	LSfllw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579ruktx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 10:52:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e695a3b28so45769685a.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989551; x=1783594351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQ8k0Hy6I4Il15nmvaRyog5wQzrR4WfLYo49ICWlyxk=;
        b=FKIEyztYoKFPF5cOvK/LIHBoM/+V+pgzemMyQC29Pxj4YpGqDRF2Fo/3sMhrzxHe3s
         p6ME8lBoRKBt+MmKK+3vy4fy3AhRJI4NVcVl6BWflfh9UHw9KBt6HaP2CVGKL+wFc2gT
         6NPMG9sigAT/h6z2ggtKL7p6HNHfxTnnOJtLM4unQV2B0WUFA63lJhypL4/vUXYOgFAg
         69YxVCf4GUmZeRAZVOwjA8TxAJNrG9oGFp4ETy4oc2WEwKAZMKUn8lXkEdXp/Tv9Gckw
         DyTIiFbA1F1d6FpiittSpjFKag3qyH6EfmKdfqDVig7VOXSaWanobrfdAoYu2shtUUGL
         Fjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989551; x=1783594351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cQ8k0Hy6I4Il15nmvaRyog5wQzrR4WfLYo49ICWlyxk=;
        b=KdulwVbLb4olgcHi/HeNQjTAQBh+Fb24yBW8KniEVWwrE3fmWnRCaN2nKhfaeuJhvf
         T5+zoMulE+JqlT6BQkMlAoOCPW/+/r5jVRomFp+aX6c5J4HYp1WvCrrw87LcrAL9osAs
         S4Yvd1tEjqUCWsxVFgUABcgSf4BxGOccKmskGTLwwOf1aK8E01TgFQ90Is48HhjXqzKq
         aZjmwIFv5PPWIDcILDbDhV8dNu8/mc4qXWSeMd+wNZlDJMBAnUytZ3Qr1P3puQ3BXkz7
         40b1FfDxKMy/FapFYcZvLjOymaxoLjKA/QzZ21/bmeAjJ3eP0no4KFqyuKZeP2GeIoVK
         v1YA==
X-Gm-Message-State: AOJu0YyqhMGTt/zreGU9nbalamfV57CTOm6OHc8Gw0AKFMr7Mvi1OAgi
	HTom82piXPFxGxTW43c9BimXnSMgusS4I/5ZCVpfoBWuEFYPnGs5K6LJdmp44oOoi40qNzm6aqC
	UL4JhvsExe1f0ML+Q0TmBQRPY8cDZEmmLAN4Tr6gHnLFoYuMywpMqV+AF5fNVi9p2zg==
X-Gm-Gg: AfdE7cmHsN8zqGTmK6IxunJeyT0gQYUrRYWOMBFE6Vm6juz0tSX4dRKgTA3sg9Pt3ij
	D56EhAtgR6zCcRZXGMG343QVttireYRpuTeW/4W6QUNqNqNZYsMa9wz6tyUg1WVMBWZwW6N5nw0
	EytfdAK1bOwfVJ2ONdKp8PHvcKX3SQWK2znvl1193C8qXoQQDvyusFPwMTjtfLdT/iNgUi1jWcM
	IG/pz08UfmXdd3tuljw7ZLqNhKsnhiCOea5dhdRKrhln3x9dIaaEcUnuQ24LtY586Auy57thYxM
	xn5IyWiOrFtl/rKVo7olDbIKMgFru1xqE3CPFze8dkb39KLaezQycBNaD16X8Re0uWM/HXnPMVL
	+YisoLzS736owKkzu26kDnW1DcF2bsTzrEg227EB2SVAzx0nS47OPnuS3bUUwbkKwOwmodaSn+Y
	b0O6s=
X-Received: by 2002:a05:620a:4008:b0:92e:5232:91f8 with SMTP id af79cd13be357-92e698667f9mr1332329885a.43.1782989551520;
        Thu, 02 Jul 2026 03:52:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:92e:5232:91f8 with SMTP id af79cd13be357-92e698667f9mr1332326885a.43.1782989551040;
        Thu, 02 Jul 2026 03:52:31 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80025696sm193565185a.19.2026.07.02.03.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:52:30 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 18:52:07 +0800
Subject: [PATCH v2 2/3] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-og0va1b-v2-2-0071442caa2a@oss.qualcomm.com>
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
In-Reply-To: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782989539; l=9702;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=1ElxFLNDdcm7tT0G2r0483Te8LeJh+5WxdZjxDn7frY=;
 b=277ZisM3LZzlVQQCNv4tmkxYOtxGcbf4ReBhT2IpIAU51mHAzBJVEQwy7L2ffAFyE7SDwawmS
 4AB/ZFm6dRxC+Q3ezPE7xjLF0mjXRjQDVJ2r4XxAEFwX4K2JZO9ajtJ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX0Jb7X3UccCW9
 88KSGOhC+p6M+acnQqHhDynkMIeopmDrrtk6F1nWvOhm2C4U4T9dB8rkJk+2nKbRWkQSOlpGPeN
 OsQf5ntjNAnN6IRQ2XdtrMCck5ocTf01bI7UgdWCLK468K18Uwu9k3Rd7LOqYzMtCBCPPERtDIo
 nEWtfbTiHFL9/KTdJkMsGh8cdnXDlacPcUGpbXmGnjtjQpmzKIiwiQbKuhPi8ZxAGoR93n/LXaC
 hS6t+tpUKNHDf+igJDgUvdkY4JgBWcoq7vRDqxmJRTjToQmkmcdiVoGKLNwg2Y7IKfMSk2F4wYk
 fooxFDCdvevwmbBjHeZg/r+4nFioW8oTAtfSUrbufaHqa8CBvnbC1QQJAX8KuOMQIB+K8tGf8LB
 atc6glMLCq/xCKmCMrvrCVoPNuvwjI1O+4zqekak6nNM96v5hZ8LtVRelxRTJAyFPvATZWNssgk
 KwvAe1tMJKsmkqQUrRg==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a4642f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HEqEudTBrfRQd72pXM8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2EMLxgw1i48u7IjBTJROCCb9PQA9Xpfm
X-Proofpoint-ORIG-GUID: 2EMLxgw1i48u7IjBTJROCCb9PQA9Xpfm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX2Fr2KaYXEhtr
 3GCBkAcg1mvPZhReBU9aLFXOjM8or6G1/uM7jzv2jsAWOnsY/DhkNS6AmL9/A8Aoyi/vwL3okeB
 +cKIyBulqw9ePGTK2tFED5eILCC9otg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66339-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wenmeng.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: E259B6F695D

In preparation for supporting further OmniVision sensors that share most
of this driver, move the sensor-specific parameters (chip id, MCLK
frequency, test pattern register, link frequency menu and the list of
supported modes) into a new struct og0ve1b_sensor_data, selected through
i2c_get_match_data() at probe time.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 101 +++++++++++++++++++++++++++++---------------
 1 file changed, 67 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..acc06b10bf896f734926289099a70fbc2bb628d5 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -66,10 +66,21 @@ struct og0ve1b_mode {
 	u32 hts;	/* Horizontal timing size */
 	u32 vts;	/* Default vertical timing size */
 	u32 bpp;	/* Bits per pixel */
+	u32 code;	/* MEDIA_BUS_FMT code */
 
 	const struct og0ve1b_reg_list reg_list;	/* Sensor register setting */
 };
 
+struct og0ve1b_sensor_data {
+	u64 chip_id;
+	unsigned long mclk_freq;
+	u32 test_pattern_reg;
+	const s64 *link_freq_menu;
+	int num_link_freqs;
+	const struct og0ve1b_mode *modes;
+	int num_modes;
+};
+
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Colour Bars",
@@ -97,8 +108,7 @@ struct og0ve1b {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl_handler ctrl_handler;
 
-	/* Saved register value */
-	u64 pre_isp;
+	const struct og0ve1b_sensor_data *sensor;
 };
 
 static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
@@ -254,6 +264,7 @@ static const struct og0ve1b_mode supported_modes[] = {
 		.hts = 792,
 		.vts = 568,
 		.bpp = 8,
+		.code = MEDIA_BUS_FMT_Y8_1X8,
 		.reg_list = {
 			.regs = og0ve1b_640x480_120fps_mode,
 			.num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
@@ -261,23 +272,39 @@ static const struct og0ve1b_mode supported_modes[] = {
 	},
 };
 
+static const struct og0ve1b_sensor_data og0ve1b_data = {
+	.chip_id	= OG0VE1B_CHIP_ID,
+	.mclk_freq	= OG0VE1B_MCLK_FREQ_24MHZ,
+	.test_pattern_reg = OG0VE1B_REG_PRE_ISP,
+	.link_freq_menu	= og0ve1b_link_freq_menu,
+	.num_link_freqs	= ARRAY_SIZE(og0ve1b_link_freq_menu),
+	.modes		= supported_modes,
+	.num_modes	= ARRAY_SIZE(supported_modes),
+};
+
 static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 {
-	u64 val = og0ve1b->pre_isp;
+	u32 reg = og0ve1b->sensor->test_pattern_reg;
+	u64 val;
+	int ret;
+
+	ret = cci_read(og0ve1b->regmap, reg, &val, NULL);
+	if (ret)
+		return ret;
 
 	if (pattern)
 		val |= OG0VE1B_TEST_PATTERN_ENABLE;
 	else
 		val &= ~OG0VE1B_TEST_PATTERN_ENABLE;
 
-	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
+	return cci_write(og0ve1b->regmap, reg, val, NULL);
 }
 
 static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
 					       ctrl_handler);
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
 	s64 exposure_max;
 	int ret;
 
@@ -333,7 +360,8 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops = {
 static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
+	const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
 	s64 exposure_max, pixel_rate, h_blank, v_blank;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *ctrl;
@@ -343,12 +371,12 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 
 	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				      V4L2_CID_LINK_FREQ,
-				      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
-				      0, og0ve1b_link_freq_menu);
+				      sensor->num_link_freqs - 1,
+				      0, sensor->link_freq_menu);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
+	pixel_rate = sensor->link_freq_menu[0] / mode->bpp;
 	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  0, pixel_rate, 1, pixel_rate);
 
@@ -407,7 +435,7 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
 				      struct v4l2_mbus_framefmt *fmt)
 {
-	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
+	fmt->code = mode->code;
 	fmt->width = mode->width;
 	fmt->height = mode->height;
 	fmt->field = V4L2_FIELD_NONE;
@@ -421,8 +449,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state, u32 pad,
 				  u64 streams_mask)
 {
-	const struct og0ve1b_reg_list *reg_list = &supported_modes[0].reg_list;
 	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_reg_list *reg_list = &og0ve1b->sensor->modes[0].reg_list;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(og0ve1b->dev);
@@ -484,13 +512,14 @@ static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *fmt)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct og0ve1b_mode *mode;
 
 	format = v4l2_subdev_state_get_format(state, 0);
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes),
+	mode = v4l2_find_nearest_size(og0ve1b->sensor->modes,
+				      og0ve1b->sensor->num_modes,
 				      width, height,
 				      fmt->format.width,
 				      fmt->format.height);
@@ -505,10 +534,12 @@ static int og0ve1b_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_Y8_1X8;
+	code->code = og0ve1b->sensor->modes[0].code;
 
 	return 0;
 }
@@ -517,15 +548,18 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes))
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
+
+	if (fse->index >= sensor->num_modes)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
+	if (fse->code != sensor->modes[fse->index].code)
 		return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
+	fse->min_width = sensor->modes[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
+	fse->min_height = sensor->modes[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -534,13 +568,14 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 static int og0ve1b_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.pad = 0,
 		.format = {
-			.code = MEDIA_BUS_FMT_Y8_1X8,
-			.width = supported_modes[0].width,
-			.height = supported_modes[0].height,
+			.code = og0ve1b->sensor->modes[0].code,
+			.width = og0ve1b->sensor->modes[0].width,
+			.height = og0ve1b->sensor->modes[0].height,
 		},
 	};
 
@@ -586,18 +621,13 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 		return ret;
 	}
 
-	if (val != OG0VE1B_CHIP_ID) {
-		dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
-			OG0VE1B_CHIP_ID, val);
+	if (val != og0ve1b->sensor->chip_id) {
+		dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
+			og0ve1b->sensor->chip_id, val);
 		return -ENODEV;
 	}
 
-	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
-		       &og0ve1b->pre_isp, NULL);
-	if (ret)
-		dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
@@ -624,8 +654,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
 	ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
 				       bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       og0ve1b_link_freq_menu,
-				       ARRAY_SIZE(og0ve1b_link_freq_menu),
+				       og0ve1b->sensor->link_freq_menu,
+				       og0ve1b->sensor->num_link_freqs,
 				       &freq_bitmap);
 
 	v4l2_fwnode_endpoint_free(&bus_cfg);
@@ -686,6 +716,9 @@ static int og0ve1b_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	og0ve1b->dev = &client->dev;
+	og0ve1b->sensor = i2c_get_match_data(client);
+	if (!og0ve1b->sensor)
+		return -ENODEV;
 
 	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
 
@@ -700,7 +733,7 @@ static int og0ve1b_probe(struct i2c_client *client)
 				     "failed to get XVCLK clock\n");
 
 	freq = clk_get_rate(og0ve1b->xvclk);
-	if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
+	if (freq && freq != og0ve1b->sensor->mclk_freq)
 		return dev_err_probe(og0ve1b->dev, -EINVAL,
 				     "XVCLK clock frequency %lu is not supported\n",
 				     freq);
@@ -819,7 +852,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
 };
 
 static const struct of_device_id og0ve1b_of_match[] = {
-	{ .compatible = "ovti,og0ve1b" },
+	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, og0ve1b_of_match);

-- 
2.34.1


