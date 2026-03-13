Return-Path: <linux-media+bounces-55680-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E0VDc4OtGlvfwAAu9opvQ
	(envelope-from <linux-media+bounces-55680-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:19:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 978482839BE
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 210AA3251AEF
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97926308F38;
	Fri, 13 Mar 2026 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlgISmAk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPHG6eH6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7E32D63F8
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407891; cv=none; b=ZyXA3vZd156UJCpCBvJacnY+Tx8u0HmDI87GHkIJFp3iildTkjo9tXBnluw+/B1cNbaxkSbKjBKHUSJ5ruRqma56SkSyhVIoLeIsL/at1Y5Qv1l18WjR358JDysgctrhEnMX125St0PthbJWb45+EXDOkoY9UkL5g9UCQ/CUKNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407891; c=relaxed/simple;
	bh=jNCdg74lamuGD1UwCEDaEydNF2dHY+kZuekw6IrpkD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mJGYlewTThIfbDHFjpzahaLV0k3EdpSchZaq6pY7UdGBppHrkyeIMiIKJsD1T4W86XIX3+GxUcDJIqnNRFb2e/V0KXc8yK9yJ1BKSJgsJfOAemlSqZWa4kyilMeyIiQGavo4FlHrgrMgmp5ysQE/vYDrL9hIBoKnugk39nWlZ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlgISmAk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPHG6eH6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8vCfp481530
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WF/zWS2XHVT
	Yj9WBeCDyXKUQspJtdjlDOgAAUIsTqq8=; b=MlgISmAkxe7HdGtHOPRyjjtr5/P
	R7tsYA7IuZvYGzQhmmwHMwchjwapUBbEHX9oU9HYWvQ2+4TBO9aZCxdpXhBTyA3k
	dCMc2BdW1P8ql2pPNRI3wMlyvl3sfL0Qy8uxTiKo8iYYNwmurXSn7PRPhr/hPabg
	fowkFxUC5IVSdVH9DYQJrl2ATj4Wr3ROCqPdG6Hkq+2MDOIQ7nv5ZdOG30zRR1Tv
	VetmuL733vhlKOezX5V4co4qJFDbasDQHGeIn2qLjQBcwNuifvzE5ZCJRxsV0z/x
	xTJsMubbUHDcao6/f8DNZTSRz370FHqUveYmMZYlL0Vus2wDHGGomjsu6SA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7ru9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd76ff19d5so1209709285a.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773407888; x=1774012688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WF/zWS2XHVTYj9WBeCDyXKUQspJtdjlDOgAAUIsTqq8=;
        b=PPHG6eH6YaJuPAba/uSP77OSRfdORFbh5udmh+GL4NKRkWnhc1GhzkY6VyouZk1d6C
         Uqvfbpp6S3nlbLsgmP31oJJmXpeELu7BhuuXIiq0Wt4cmVTFpDwAfty0TeZ1Y01icXUq
         eOHv97ap5M/jzodviA6OFhQLor5latwYs+mnzUklDItVB1U7Uk/6KTjOO7FQCNRrINW8
         9FivvEFvHVqgyAhM+A0cH6HRHpEY+Z/3bu+dub9PMGIAhtjPNdt5nctY229OhYbwI+0P
         L7wRkJJrgp9VfGKEj/px/iRcU2cjxJLC2uoLuJTC0BdOg8uA/iJUgbtxB0EalOY0q+GA
         vHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407888; x=1774012688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WF/zWS2XHVTYj9WBeCDyXKUQspJtdjlDOgAAUIsTqq8=;
        b=SgqhNVKTE0JeRylviA3gWcvEI4++L1Y/LRFTy0VmbzIsR0/iMLIs0d7vbx0Z/CF9tp
         CKb40og5WJGYmSH4ZhJ3TQAifileIQPFRDDQCb1/qhUyIr2ZLe2/u1B/oLaEeDz7tc9x
         SpIVLojGjBifDi6j4KlEMY9soEs4DwJA7HOijzI4VvDBOAwyDaQp69rQzx+QCc8QrFl9
         WxrRuH7qp8vAXlvaqxj63stu8LVCsWfGxgqhl1kgxgYRL5ydkiXjdFAuzqb0YMt9AihA
         hZGnMuU7kcbedo5FQtbbfG2WUwtLtFL0TEm3MhRYQkqsUEruue1eWHwHBCVi4a6pEUop
         3frA==
X-Gm-Message-State: AOJu0YyKCaXabcWkroMlZVQgp9mMHfAFkguJoDKIlFqdCCCdjcQRiZk2
	Nq2EvhBQxkLZhff3bgOiIdvs0E7fxvEQBLYC5gypHRILm57IJM8LBQ2LJVXRO8/eu12URHVlZNA
	KBGZF9CwZcb1C27IuEFJ7ZH91q+kUt76UwQvKgRsgWv0gRT2PmuuFkktiQY7U0LLTVA==
X-Gm-Gg: ATEYQzzmah63JPEV2nqgxa1kvVuzSuy3VzBV3N0fu4isM54PpxG/LJEOEPOsKjSHgnc
	pfXg7SdtsbzI6Uqvl2236Nezw59P0/ADhh29F2j2flZR55zBGCao9q/lw+ODFyVaLzLy+kq0T4A
	yzUDov6g0XF+12p4LHoBLZzRhfgcZoU184mz4NoT90+pVSD/9MSiKnVL5zHNqbtBFe5ffMzFDCl
	lnppIUBMIIQCfoDcRhVrvQi58QVoeMdlt9QHsw5PI+KxMPhNrqNg6ch9uaX3VCxIr1NO/+nWF+F
	uHY3cNueUd6OIULOEQ8dsvMMQr4awBvbEu/K2tQo5/jfguv1Js/RXFRPk2HpSBW0Xjw3ajwFaZq
	6G4mzCIRuyNnOBLr5IEb1DxhaEbtCwTnEuiDM3A1Zbs4lNe8QoZOnCSdfK5l3Hcri1k+36AIuHI
	+U3AepFNxadqOj
X-Received: by 2002:a05:620a:4081:b0:8c7:1118:c514 with SMTP id af79cd13be357-8cdb5a0c90cmr446665885a.17.1773407887935;
        Fri, 13 Mar 2026 06:18:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:8c7:1118:c514 with SMTP id af79cd13be357-8cdb5a0c90cmr446658685a.17.1773407887378;
        Fri, 13 Mar 2026 06:18:07 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm207778265e9.0.2026.03.13.06.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:18:06 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 5/5] media: qcom: camss: vfe-340: Support for PIX client
Date: Fri, 13 Mar 2026 14:17:50 +0100
Message-Id: <20260313131750.187518-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
References: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GrYJiqsOx6nxPMycQo6q2ijg6aJlNW2c
X-Proofpoint-GUID: GrYJiqsOx6nxPMycQo6q2ijg6aJlNW2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfXyquEEnXCsPP3
 fLz0uDTjAHLMWLSGQhlzFkdbORuARMHr8ZxhoSj+PeFi3KIOhl9Gk2CtwW9byzB2Dnt+TcuEzTS
 x4gGU/xYWxLBy269kbg3mtmqPEGfRMmtyOuBRM/mbxIYdOmvnWMgIUonlJ4fmwhinPRNQMAUYka
 f37GMa4Otf0gQJZ0pKHaWeY7PLWUBg166sZuGdpaR/wpjY6dV0qFChKvmLgYt/J9fCanhK77ILI
 G2MHrCmDxCHvIM99lkIchVP3FE045U1Yq67XrKxqokSlJaLyg9zyMnCaXL4kOu7Mg2E4nCFJrpu
 YTUjShWt+bYC3XcdzbmYQXpf+7wPOJbsWDioutFvYJkHtiSS8wWtfQmtfaXJzzGYsUEbXt7apLZ
 IwDDOkz6H32C1fyp2Gn3P+aXXjizwAbe67Mf6oPgxtyF18KFRJnuRhZ+NJAGQf3CijIqSYpzyGO
 HWNBlQJ4AqiyKjhWW3A==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b40e90 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=T0JAYaUI_TIkQzIuI_sA:9
 a=QEj_SxXEJzKJbFzb:21 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
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
	TAGGED_FROM(0.00)[bounces-55680-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 978482839BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index d129b0d3a6ed..600c472534fb 100644
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
@@ -245,18 +257,72 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
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
 	u8 client = tfe_wm_client_map[wm];
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
@@ -266,11 +332,10 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
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


