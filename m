Return-Path: <linux-media+bounces-58763-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBybI6eN3mkIFwAAu9opvQ
	(envelope-from <linux-media+bounces-58763-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:55:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA93FDDC9
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 050B130AB95B
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 18:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648A626A0B9;
	Tue, 14 Apr 2026 18:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCNd2Opc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJm2abOE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03D242D70
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192735; cv=none; b=W5IeKjd6ldw15GJflBiGR/HeqsAEZnwdak3QAjO0+NaZChkoEdaJFYSiqaVtm6y8uKZ9H9QI+VYLT1rrRUP9INinazuddb7cxKWvokYRQo6Hn8LCy0loPddFSBPiCKZzNtSb7syuqn2UG8tKPMJNaup134BiqE/rgShEh4Wyfwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192735; c=relaxed/simple;
	bh=cfFkk+VH9Ggmp50bdMLFVkMIoYR97xRkrbleCypxFjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l9s8CNmhWAE8AtzL58qgqOdpcygU/oVrDllidQu6NOkxlSBtnwg8J37oEChpzR2idlLugqGXhQJlZz/roqVvItWS7ZEXKmRTQ8mzbImaAIKRon7NUz5VJwPij8TcA8rYu1boryvanl0VDfsb+u4GxCEE2sdoUGvzdLnujLPYjyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCNd2Opc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJm2abOE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHbYoF3126648
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VtZ6CRwc4v1
	IZ4cowP3DEUUX/eSSDarY9jpfSatAxNQ=; b=RCNd2OpcHzvXqXgKK8/FLuysuaL
	diwwMfGqUqIv2R86FoLD7l0SVE5XwavaHp2vAUOY1H031UOdwxqVIamPnH0/5ing
	lKZzLDTX2QnFiKXHJcrqjAGH/q/lV7VewM37ju9Pc7MZ/u4gwX9fLu+zOJdhudna
	FSie0A9k/JvFma64Qy8KBYVekvTV/qDfqNSeePjkj0+SAl4w69/Ftwq3IkaxKHEg
	QWgZdX9gFOdvBTy7Wf9yrM6jZ0owNeUmSwa1YU05Nwz+CJzV1qg6a5EsorChkPu8
	VTCgQ71dMKl/o03mxN4GHe8eN2JskQZs796JbVPYW+DBFy1KYLF8USqihSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56r8sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso20715831cf.3
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 11:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776192732; x=1776797532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtZ6CRwc4v1IZ4cowP3DEUUX/eSSDarY9jpfSatAxNQ=;
        b=hJm2abOEBY7kP7nv5oR7dREh7q2/6zTAWQhG4zvbTWkp0YYEhQvEF5VCU1ziDtPXU1
         damP3Sxaxuzd1vFdqWPg0go0VpSPZqr/nHg5yzyRmtd4YJMFCgzy1wFqCbJ68TtqXCZ1
         GSHchQ+8Xrolpk1wWo7YXNlfuRWg92B2EQqt8PelR7SamKeOppsNhikyJYAEIKAAEjpr
         d88iKzvHYqPeh38lBKlBytPNJtqAXXvHzjqiJfCKCLVWeJbdEzW/ZnNIEhOaVs9nyCg8
         kgtT1tw3jMLE0oYFRBSjC89vji6Ry1GC8AsFwj6DtQtDeKSsWDttRXyYwfAzy7QrE8Wi
         tWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776192732; x=1776797532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VtZ6CRwc4v1IZ4cowP3DEUUX/eSSDarY9jpfSatAxNQ=;
        b=HX5AYePPAiMG+i/8mwfYBfah87fKFeKwvmdFDDm1YH1jJBdg93R9y+9tNH+jzP6uHS
         +A5YaCdjmDqRX1XM+zll50Rke8SLFYEYpMqVjGEA9CMtnCFhRahxaEETQKcZNSqObInU
         i2R2Xwb0j4gCkSC4XKJPfxb0JgRgK9kUjv37J/gqR+LdsJIglNTb0S2RgmJsJKspzj90
         gvyq3m9t12zakqhh60kQkbB9G1UvQXbskcEDnkbYeuzNoVAW4XqiQnD/+Ri+hryaBJtU
         c03p9wOf92Hoxj0NSerK2K1JCu1KBHdEvhoYWOp8Bru36N7On/6j//qbpJkbsMG3y7iq
         Ly8w==
X-Gm-Message-State: AOJu0YwuPcVkEp+uyPcsr7UvaW1IipccXjtkDU/Uf7EE+MU12z1f1pQS
	DrB4NdHZq/x0NbK1om4ZXGb1cF0UlIWv2/uhajJpEOG5ZXzJNjRyAaXAZHMXCpWqU34IHVwIqmw
	u4WGZ/GzxTXbVFPvSgWT7Sn7q7fx0doaYii63mgoEbe4Hr9LmQMsVQjtw/ydIiaZOaw==
X-Gm-Gg: AeBDies/FL31XUZFyFvCnVjCO0SzpeUXJUv1+/oXVZgaU/ylh4P0DNTlEt4wL9xILNv
	jghfa59X7i8kjJ9fPQbOy4W0AYPVQjh6nA1N9t12Ku2+oK/PPmS7IKPeDFqVbacQga71I+rD7Hq
	plaQYOvITcyyjCOmTAFVDO+hYgjoEX40PKJXOocrcWMrTsTUvNd/ob0KZgl01XREFT/3vmOC35q
	owFZ89E4Wq+znrKDjgdE4NJwb+jxTY8Bqsd7czw3D6+8KugkstkDW4JY6F+y69Em/D4sAPHlbtd
	T7OKFisy4TMonfQtj0LirXLdQKTGQBmUe6OO0W3h8UeqQTrnXV/UKfMbzwHuJGeM7arV9be3rtI
	F6/Ewqx9HENY7FU72fXDxPwYBP8/2yz4pcHK+8e53b/u4ZAUQgP5YYGnOLAKd0Ax4JGMlMgh07A
	jSRAcTbtz4KUs=
X-Received: by 2002:a05:622a:141:b0:50d:6e3d:2430 with SMTP id d75a77b69052e-50dd5adf549mr283371971cf.25.1776192731780;
        Tue, 14 Apr 2026 11:52:11 -0700 (PDT)
X-Received: by 2002:a05:622a:141:b0:50d:6e3d:2430 with SMTP id d75a77b69052e-50dd5adf549mr283371441cf.25.1776192731256;
        Tue, 14 Apr 2026 11:52:11 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:f062:40f:6621:e20e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e9esm427647366b.11.2026.04.14.11.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:52:10 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 2/5] media: qcom: camss: csid-340: Add port-to-interface mapping
Date: Tue, 14 Apr 2026 20:51:59 +0200
Message-Id: <20260414185202.2714019-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
References: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69de8cdc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-uu0Hre1PwtQhwGgMcEA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE3NCBTYWx0ZWRfXy7RzVGvWgHGq
 THVwxI2bqRWI2pe4mzP3GgFruyFmnkHV6ybCWWlLdXnXv5qfRFq3IaOYXU+r2ilKdk3du5GP9Cm
 XO1sxXRuwN5Vq7wdiFLQ3kRtUL09RT/sOD9jI1tQcwTO5rolBXwlEkxTOaeFaN5gPHbufnWcdr2
 ylGEbHFYhTB9PKfkkDc9iAVhOn76nAtbkGLB/oQqE3y7xKFBsfpUTvTroHSdKoXfjK2IaI3s0Rv
 nR8v6ylsbOipTgZDMc0rtoqnJZnItUy3ZsX4MwDjVmmR4F0jMX9CzEHPCDFKTOeLp2iD5s3CYnr
 2KlDfgdl1+wUxnbf0CqFj1d5rGb9/v1fvLs9vUi64zPXCE9d9cBroUd013DTEJumLDd38M7mkCV
 mCZBdwc5iTR0KOE6Lms1rYrNPk/Y7dOjT9LohQz7jxNpCn0N4huTj9fTr/2b/1ScTRUvRqOEiTp
 AGdeOXTy7nj1XrBtMzQ==
X-Proofpoint-ORIG-GUID: p7IhMsE7lfp0dVO808SR5Olgtp4gNauh
X-Proofpoint-GUID: p7IhMsE7lfp0dVO808SR5Olgtp4gNauh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140174
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58763-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5BA93FDDC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The CSID-340 block uses different register offsets for the PIX and RDI
interfaces, but the driver previously indexed these registers directly
with the camss port number. This happened to work for RDI because the
port index matches the RDI register layout, but this assumption breaks
with upcoming PIX interface support

Introduce an explicit port-to-interface mapping and use the mapped iface
index when programming CSID_CFG0 and CSID_CTRL. This replaces the
standalone __csid_ctrl_rdi() helper and simplifies the RDI stream setup
path.

Also correct the CSID_CFG0/CTRL base offsets and clean up the code in
preparation for full PIX path support.

Like RDI, PIX outputs Bayer frames but can also achieve some image
processing such as scaling, cropping and generating statitics (e.g.
histogram), it also offer more flexebility in term of image alignment
and stride. All of that can then later be leveraged to improve
software or hardware frames post-processing.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csid-340.c      | 37 ++++++++++++-------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 469b27c10d6c..2822b51e72e1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -41,7 +41,7 @@
 #define		CSI2_RX_CFG1_MISR_EN			BIT(6)
 #define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
 
-#define CSID_CFG0(iface)					(0x300 + 0x100 * (iface))
+#define CSID_CFG0(iface)					(0x200 + 0x100 * (iface))
 #define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
 #define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
 #define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
@@ -51,10 +51,24 @@
 #define		CSID_CFG0_DTID_MASK			GENMASK(28, 27)
 #define		CSID_CFG0_ENABLE			BIT(31)
 
-#define CSID_CTRL(iface)					(0x308 + 0x100 * (iface))
+#define CSID_CTRL(iface)					(0x208 + 0x100 * (iface))
 #define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
+#define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
+
+enum csid_iface {
+	CSID_IFACE_PIX,
+	CSID_IFACE_RDI0,
+	CSID_IFACE_RDI1,
+	CSID_IFACE_RDI2,
+};
+
+static enum csid_iface csid_port_iface_map[CSID_MAX_RDI_SRC_STREAMS] = {
+	[0] = CSID_IFACE_RDI0,
+	[1] = CSID_IFACE_RDI1,
+	[2] = CSID_IFACE_RDI2,
+};
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
@@ -70,17 +84,13 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 }
 
-static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
-{
-	writel_relaxed(!!enable, csid->base + CSID_CTRL(rdi));
-}
-
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
 {
 	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
+	enum csid_iface iface = csid_port_iface_map[port];
 	u8 dt_id;
 	u32 val;
 
@@ -110,7 +120,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 		csid->id, enable ? "enable" : "disable", format->data_type,
 		port, vc);
 
-	writel_relaxed(val, csid->base + CSID_CFG0(port));
+	writel_relaxed(val, csid->base + CSID_CFG0(iface));
+	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
@@ -119,12 +130,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	__csid_configure_rx(csid, &csid->phy);
 
-	/* Loop through all enabled ports and configure a stream for each */
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_port & BIT(i)) {
-			__csid_configure_rdi_stream(csid, enable, i, 0);
-			__csid_ctrl_rdi(csid, enable, i);
-		}
+	/* RDIs */
+	for (i = 0; i < CSID_MAX_RDI_SRC_STREAMS; i++) {
+		if (csid->phy.en_port & BIT(i))
+			__csid_configure_rdi_stream(csid, !!enable, i, 0);
 	}
 }
 
-- 
2.34.1


