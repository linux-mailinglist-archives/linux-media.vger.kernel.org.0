Return-Path: <linux-media+bounces-54792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPxXG+TfqmlqXwEAu9opvQ
	(envelope-from <linux-media+bounces-54792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:08:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E19222528
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06569317CFA8
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881AD3AE6F9;
	Fri,  6 Mar 2026 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4sAJMNu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z79MMDWn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E533ACF11
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805765; cv=none; b=Lnng41QHcKfpXFSe62azMoKcvSjOGatoRCc8AJqbwiIOPea7EG2bmBGET71cbdzar2680aQ7OgnmmuaQGwSLu63rcTWqJY+uhv3ctWQ1bIAcMgc/1fIch4zALNiPfGiDPIvQRu1uegovgvTxP88VnP1wFwqmpx+Y1bcgpryIKF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805765; c=relaxed/simple;
	bh=EDYsvqb5RsGmgJKZcirhixacxJ9cMh6CHZqD60mgbwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=obGa5VOSYTiZAKMTzdNwpFQL9TQKMWf0YGbrhEaq3OP88PkD5VisCuaFvlS1++Dfg2oSOenX6rHqNFouOW3IhaukWX2w7QNPDpt5MNIYOu2LIkV9h30vBJBL6JyBZ+2EDa7B2g7xfVqVPrvcarWhJuxRyFZOmsgZeZ95YqZnsh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4sAJMNu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z79MMDWn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb4YA1189035
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 14:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hUJtIXwURM+
	mnrOq4kR+X5jB3iPfIoZRKw9f5krjPCU=; b=S4sAJMNuOL3Q3TKNm3kl21gXaUw
	R4TCuj3qeghYfcWSYjQqkyio86mF/7BjYgu6ueZickJIoVm+EKTtabpAtd6UqMsJ
	MVHhfbEQVgcAHg8EQU3cTrlDjZYe8W/CXk3SbcPKMlqLuKOqTKLjDQpLUw/5t1wb
	7JLND6im1kvBM7f6aKaQXUiViBoqqfuHuXAd/aGuzBAxwUucBlhdgjrKH3b9P/CV
	kIq7gc//627HHfvpyfDQ+WNd+LYiFqOLanomLGWyd01sNXd1T8YDiL+iGS4fmEch
	ee4dwtRzngcUm3xmRxfU3etN6ulIkIRoKf/4xI1C2JI3UFcYp98AHVTnREg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14gdv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 14:02:40 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9483c030e3bso98847437241.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 06:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805759; x=1773410559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUJtIXwURM+mnrOq4kR+X5jB3iPfIoZRKw9f5krjPCU=;
        b=Z79MMDWnWC6zPPglVtjaNd0pO2rvfZZIUtXu3IVJm1K+po5K+9H8w0mMZrMD76DqCz
         Icg/ugxI1Sim1vc3vqOwTHdf49p9V4SfYydTs9fNipUEzb0iAZiSire4UB4WWNWeDylh
         ZE61qiUkbJEFkrP9lztLAmspBh3hLEI5kHOO30sgrIx8O/gmXcjoML+Nkd38IHq1vX4O
         m91eD2AiKIMwK+ubFlZgvhFRbuy7oHSXZSDowg5KlWwuIKAzQR2BS4ClWvlfG9F6Ukbg
         FD+QFoEQLGr0PdArqHnpApUXJhvszDd0CFgY2GJ2TsBJNXxXwNT/yiwN6M9bjymddaOM
         /8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805759; x=1773410559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hUJtIXwURM+mnrOq4kR+X5jB3iPfIoZRKw9f5krjPCU=;
        b=K1o+Y2lFwvFEbr53gmCTblQBezziXQF2mqifXUXhpmdcdHonr5cUwqzpEOqoC691bB
         Nqj81ppoao7ce93ivxMhXeDR9pjdKN+iMjcYxhXKmERQBHscBU2zzfTGSr/DXnDnHK5Y
         zsIzCnOBolK4HQvbkG9JuhW/UpGceCv7Hdf5RH6Ot7/7PTwvyBHQ4JG8421X48SH7jMm
         3oYtYpnDT1b9PKJXiRvxmFMjDYtPKjPWKTCIr7kYRSTSkXZgv/3BGaWnrFX5V+uySu0D
         srANr1Ad2RGwjETU7ocvqH+JIsuPADw1LRDkQLR9AvCHsi9DeiysqMoG9mrHBQMFuwlm
         hCfw==
X-Gm-Message-State: AOJu0Yxgy2gQTnK7K29URWx1njjIGsQVHQaDUxqG/5pXTYMlQCVRhQXy
	81YoSxcC9/V5Dljp5LZllcFosmvFnS9Hy+HA/7YPb/9okr4Bvlv/wheFAOEzj6S6znMB4c5XoS9
	mx0QE0AGJtnKVDzRBW+iV7yoxnAixVqasDbfxSYltu922pGU2/YopkRHns49dZ6NIEh1Z3LwFJl
	/N
X-Gm-Gg: ATEYQzwMljXY1oD4UwK/tJ0yKcW8SWoNAjxY05+FFq/zTKMWSgIpjTgyxHP3RUpwFDH
	X1xGIZrNd/vAhi+5SPyeu8lcwcI/4vbOOTuFmIzJ5x9WujFggOXGN7NEpFEolEmS9VHmaoJFsno
	Rcim3CylVEwzIRnURqldikV11tRAbVLu/WN9Rq7q59V7iB0F8fXHTOIY+PUbIYzGqpkoH9VqUTG
	SnmqQhUCEF5HG65cFRcRfBXHx8WnNEZZeO9C8BQ5IvpGL1XUh49FgjM3u7gb2g4wVVwwjmLPSGq
	J5grp9EOL6t00BB6yCSEcMgc/dzE6LOZ+nppYpP5Ajd0iwbcjPcPPrUTEcqp7hNUySvTrjFyk2W
	eA4KRAq9JOlSY2xmZZhQjezN4Bbq2+fubg6noebRvgJxdAE63zrA9g4mM3OZwgdYjdYmNb2OjI7
	E/yFLqLwtjc5FED/gyal01HhDeT/b0JkqY/nRfgq1xNA==
X-Received: by 2002:a05:6102:951:b0:5ff:9ef0:9978 with SMTP id ada2fe7eead31-5ffc8c6d768mr2946430137.6.1772805757766;
        Fri, 06 Mar 2026 06:02:37 -0800 (PST)
X-Received: by 2002:a05:6102:951:b0:5ff:9ef0:9978 with SMTP id ada2fe7eead31-5ffc8c6d768mr2946331137.6.1772805757092;
        Fri, 06 Mar 2026 06:02:37 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237f2d2bsm20171425e9.4.2026.03.06.06.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:02:36 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 5/5] media: qcom: camss: vfe-340: Support for PIX client
Date: Fri,  6 Mar 2026 15:02:20 +0100
Message-Id: <20260306140220.1512341-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfX7rpbTub88z6/
 WCAN5Ju5dOQOdrxH2oMsI9p7Yl2f6nnN176A/AAkWUzemF9JktVBjns8G7qWWov8onTfKyjwCxq
 SIsi+UNzjk5KxTRetK/WzZIog7Ahw2I4ere3xqyecK13WaxI+okTzgs1jaVGXCjKnW0Xo/dUtDS
 V1evA8asfvpxQsc939UwGGGDUQmWCZOvnE3Cd9MFV06L2Wyygw9tYrZp/gzD6IPrh6ICOaQmOw+
 iVQmdWjBlztu3OvRn8jsozREhF7Y8MiSEXyu5sGVCNy27n/GCOiOn8whtooL/gSv2lgfcuYtYgY
 9XH7/p70HmNBWIR4CtKrc5eNafl5Y3BFwsOqSp3K3mp+NCpIMNMfs5w2vblDgTw2ecAPtaNp811
 f5UnoLvqwk8hWjgUzNzdez4nyvXrEohucoZU3ieUz/NLzzve19j3Xt/3mbquCq6zm9M+Du8QtcX
 WwKC3cVc8/vumi+adoA==
X-Proofpoint-GUID: AoKlFGklYv9_HGYJqxCLeUWQl-KG3D_G
X-Proofpoint-ORIG-GUID: AoKlFGklYv9_HGYJqxCLeUWQl-KG3D_G
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69aade80 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=T0JAYaUI_TIkQzIuI_sA:9 a=QEj_SxXEJzKJbFzb:21 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134
X-Rspamd-Queue-Id: F0E19222528
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54792-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for the vfe-340 PIX write engine, enabling frame capture
through the PIX video device (e.g. msm_vfe0_pix). The PIX path requires
a separate configuration flow from RDI, including cropping setup, line-
based write engine configuration, and the correct packer format based
on the input pixel format.

In contrast to RDI, the PIX interface embeds a lightweight processing
engine we can use for cropping, configuring custom stride/alignment,
and, in the future, extracting frame statistics.

The functionality has been validated on Arduino-Uno-Q with:
media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SRGGB8_1X8/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB8_1X8/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB8_1X8/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB8_1X8/640x480 field:none]'
yavta -B capture-mplane --capture=3 -n 3 -f SRGGB8 -s 640x480 /dev/video3

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 85 ++++++++++++++++---
 1 file changed, 75 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 2f8205fa40a4..fc2dcba43188 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -54,6 +54,7 @@
 
 #define TFE_BUS_CLIENT_CFG(c)				BUS_REG(0x200 + (c) * 0x100)
 #define		TFE_BUS_CLIENT_CFG_EN		BIT(0)
+#define		TFE_BUS_CLIENT_CFG_AUTORECOVER	BIT(4)
 #define		TFE_BUS_CLIENT_CFG_MODE_FRAME	BIT(16)
 #define TFE_BUS_IMAGE_ADDR(c)				BUS_REG(0x204 + (c) * 0x100)
 #define TFE_BUS_FRAME_INCR(c)				BUS_REG(0x208 + (c) * 0x100)
@@ -63,12 +64,23 @@
 #define TFE_BUS_IMAGE_CFG_2(c)				BUS_REG(0x214 + (c) * 0x100)
 #define		TFE_BUS_IMAGE_CFG_2_DEFAULT	0xffff
 #define TFE_BUS_PACKER_CFG(c)				BUS_REG(0x218 + (c) * 0x100)
+#define		TFE_BUS_PACKER_CFG_FMT_PLAIN8	0x1
 #define		TFE_BUS_PACKER_CFG_FMT_PLAIN64	0xa
+#define		TFE_BUS_PACKER_CFG_FMT_MIPI10	0xc
+#define		TFE_BUS_PACKER_CFG_FMT_MIPI12	0xd
 #define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)			BUS_REG(0x230 + (c) * 0x100)
 #define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)			BUS_REG(0x234 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
 
+#define PP_CROP_REG(a)					(0x2800 + (a))
+#define TFE_PP_CROP_CFG					PP_CROP_REG(0x60)
+#define		TFE_PP_CROP_CFG_EN	(BIT(0) | BIT(9))
+#define	TFE_PP_CROP_LINE_CFG				PP_CROP_REG(0x68)
+#define		TFE_PP_CROP_FIRST	GENMASK(29, 16)
+#define		TFE_PP_CROP_LAST	GENMASK(13, 0)
+#define	TFE_PP_CROP_PIX_CFG				PP_CROP_REG(0x6C)
+
 enum tfe_client {
 	TFE_CLI_BAYER,
 	TFE_CLI_IDEAL_RAW,
@@ -255,18 +267,72 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
 }
 
+static u32 vfe_packer_format(struct vfe_device *vfe, u32 pixelformat)
+{
+	const struct camss_formats *fmt = vfe->res->formats_rdi;
+	int i;
+
+	for (i = 0; i < fmt->nformats; i++)
+		if (fmt->formats[i].pixelformat == pixelformat)
+			break;
+
+	if (i >= fmt->nformats)
+		return TFE_BUS_PACKER_CFG_FMT_PLAIN64;
+
+	switch (fmt->formats[i].mbus_bpp) {
+	case 8:
+		return TFE_BUS_PACKER_CFG_FMT_PLAIN8;
+	case 10:
+		return TFE_BUS_PACKER_CFG_FMT_MIPI10;
+	case 12:
+		return TFE_BUS_PACKER_CFG_FMT_MIPI12;
+	default:
+		dev_err(vfe->camss->dev, "VFE%u: Unsupported pixelformat", vfe->id);
+	}
+
+	return TFE_BUS_PACKER_CFG_FMT_PLAIN64;
+}
+
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
 	u8 client = __wm_to_client(wm);
-
-	/* Configuration for plain RDI frames */
-	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
-	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
-	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
-	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
-	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
+	u32 cfg = TFE_BUS_CLIENT_CFG_EN;
+
+	if (client == TFE_CLI_BAYER) { /* PIX - Line based */
+		struct v4l2_rect *crop = &line->crop;
+
+		/* Cropping */
+		writel_relaxed(TFE_PP_CROP_CFG_EN, vfe->base + TFE_PP_CROP_CFG);
+		writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->top) |
+			       FIELD_PREP(TFE_PP_CROP_LAST, crop->top + crop->height - 1),
+			       vfe->base + TFE_PP_CROP_LINE_CFG);
+		writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->left) |
+			       FIELD_PREP(TFE_PP_CROP_LAST, crop->left + crop->width - 1),
+			       vfe->base + TFE_PP_CROP_PIX_CFG);
+
+		/* Write Engine */
+		writel_relaxed(pix->width + (pix->height << 16),
+			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+		writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+		writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
+			       vfe->base + TFE_BUS_PACKER_CFG(client));
+
+		cfg |= TFE_BUS_CLIENT_CFG_AUTORECOVER;
+	} else { /* RDI - Frame based */
+		writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
+			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+		writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT,
+			       vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+		writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64,
+			       vfe->base + TFE_BUS_PACKER_CFG(client));
+		cfg |= TFE_BUS_CLIENT_CFG_MODE_FRAME;
+	}
 
 	/* No dropped frames, one irq per frame */
 	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
@@ -276,11 +342,10 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 	vfe_enable_irq(vfe);
 
-	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
-	       vfe->base + TFE_BUS_CLIENT_CFG(client));
+	writel(cfg, vfe->base + TFE_BUS_CLIENT_CFG(client));
 
 	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
-		vfe->id, client, pix->width, pix->height, client);
+		vfe->id, client, pix->width, pix->height, stride);
 }
 
 static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
-- 
2.34.1


