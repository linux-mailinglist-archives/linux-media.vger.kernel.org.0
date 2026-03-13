Return-Path: <linux-media+bounces-55679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGcjMr4OtGlvfwAAu9opvQ
	(envelope-from <linux-media+bounces-55679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:18:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A52839AF
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 293623228A1E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD17031A55B;
	Fri, 13 Mar 2026 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/9ogVMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COFGYA4t"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001BE2F619D
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407890; cv=none; b=tlPsJETNkiTaAIKfvb5e3g7EliVIjtNkF7DywghlhptRPf999XHNp2Co16a6/6kVGfSW727QhdCLt5F+IZvuwuXVqKzPjke9dJEzMzSVE83RJwepAlI769tutPdaBCiI4Kv+1TnVcTGEpoiKwKzgFYMnjJ8y+j/6ZRWs+MW2ER0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407890; c=relaxed/simple;
	bh=d+KRMLLNpcEVw2kFVSwDP0JqHxMB2sHOJdggHVlm45A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eWEGAX7D9j3nCaFqw86WY9qj1AqiE7PVhYIVqAqTMwVo43Fk67wDuS8puaxT/v/xlU5gl2Fzfw+u1G11hiGQwIZVJ6pUYy5pmTjvekl+RYVtuhvo5U2aAMakj97SGtmbdSyoZ0NGul11rin5FlI+suO89eYKtuCjATzaJgg3eqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/9ogVMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COFGYA4t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JUQ6240711
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q1T3Fu0dLNk
	YTeyUsnfNWRTUqMfwz4dVwls3AtOTrLo=; b=j/9ogVMoRVDclnj8NHpu3R/q0L5
	nhyZW9TGO5ugCSCeeLJYhNMpzEY0tAU5OhKXVTZJpbJaUZbUroPyJwzrM8uJgf+j
	uFdGwe55dmmGx6O67IJVfXBdY7f6L8TrDNiycIg7DvZxVuGN9cK9us6t/X/gsYbL
	xqtqQLL8eV+8PuCCSZQJrEZXlmqd5/ggF8m8fHS8dETa634/IiVw1P0IObpvykpc
	plwvn7ZJiv6GI9pOhqi6wYjhQueaGOXPxsLyfugXI3FfmWwkn0RQCEz9f4qlpPJ0
	3ZEOa+0WtldDBen/dmCiLiUsuB5iLyCxKjDYazrzlDXjBXhD86/8HdaCrXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d97uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091782ab06so294934141cf.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773407887; x=1774012687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1T3Fu0dLNkYTeyUsnfNWRTUqMfwz4dVwls3AtOTrLo=;
        b=COFGYA4tGNGQN23xJyztSECI43vtklfmxOd1Vc49q3puDBVHPKfvMzHzffk12zEiEc
         A7vmwvd8lwEVpMRQ7rVxPsg2J1e7PWmyFksO8bDV5k1fibAorhOGJr12xbhkephJ7wPf
         Q1UKORFBmtNFB2c/brHLCijxNYO0skbw1F+BWdHrHXUUuH6v1T/AeSbWJHN41UokMnbw
         PX9peoTqKKfMcxTPJrS2aLiE8yVUvp6/aP4a9LKjTaOfD1PuwwaSoElivF+DoSdwlm9l
         yftOu4cOjPOFXEy5FnUrk1XK1V2cUsGBtfqn8jQgi0pmya6XRFdNpCIaf0izQS/qL7di
         9b+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407887; x=1774012687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q1T3Fu0dLNkYTeyUsnfNWRTUqMfwz4dVwls3AtOTrLo=;
        b=SYxiJd+d4yregUx+H809PqZHJ2t6nvMmriA33FC3fQ9qXvtigCT8reAk+QNQNMxdUT
         gAxkhrC4l0FgEWhCJclm1rTsxorkUL8rJbqNrdLNo8rxDQuzN9D+U0Gwgw2+7pNTCc9q
         0YGkuRHIBT4RznSBPdOqK8Om6rW0CfYZJUyNAjx6cw8CJ1r2OZBp9EUm4yISNwK3txuh
         VXidsnFloWk8oMJaLbbpoH4kgK6LFVjeTAquNTxHC+rh7SFFYlQU2IdU2m9zOUVvymip
         Ose5yF0pP5GkRKZU4oiyitG40vEyPsncYwl6GufNkvInfy73uCfnKZ6Rdcaf3sH4Yf9U
         xVDQ==
X-Gm-Message-State: AOJu0YyOIQC0jMa0u6AhIIbCmL4bBL0Hbnig1NtgMfk6JZnd3v6dyvgR
	PKRuvzjXjNl9mGUzS51iEHGz8+Ib2zBIjOxrBklc5ynZP/PZYGR0BpDSNjJmnvsCV1iIirw3W85
	QWZaCGinKfplv4qyCnoOD0yC704djDdyoLtrxY203Ym8H8Te86yj8yOLPSoyk4nfwdYusRj6I5g
	==
X-Gm-Gg: ATEYQzyVoFUjL0ZrhuHJfGaXEPm14RBV6bEoByADoceKa5NmpnauubfPzVB7z7a5zKY
	cy1Yl6xBsVUGOZ1bt6tpSfyh22W3CKwOxDiLXIxTlPf2g19qGNkewVQPvmzJh5bG9aQwvuCovvN
	Qz7/Th26w7WK4vSWejK8I5i3b+qJI7iN6zHEKxlzR1TrM+Bbh9Ceh23pA20lEw2wDoV8AGf4oFy
	DBMqzQvNxcQLmehnSFD/YtF7X6eXfvND+sOMGY2KBtjZN3lJ2a/8ZPoGljPrcCFSEEzCxVsAwPU
	TVLq0TEvRGEl+cxNSQbVYqwI0UJteialpMFyBiWhK2mDJl94/2+ln5Edt3fcqSe5uv+fIIcuvpR
	6q77NKxcvkaBRgd26hOkYDZdQG6dWvsoLH2AL23A66yo3EoRZ93/FrnmHfut9OIAYpK/qGdIzcl
	9G+38gW+FStUUN
X-Received: by 2002:a05:620a:4707:b0:8cd:937f:1404 with SMTP id af79cd13be357-8cdb5bc5f8amr456296685a.71.1773407886668;
        Fri, 13 Mar 2026 06:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:8cd:937f:1404 with SMTP id af79cd13be357-8cdb5bc5f8amr456281685a.71.1773407885305;
        Fri, 13 Mar 2026 06:18:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm207778265e9.0.2026.03.13.06.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:18:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 4/5] media: qcom: camss: vfe-340: Proper client handling
Date: Fri, 13 Mar 2026 14:17:49 +0100
Message-Id: <20260313131750.187518-5-loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: FPtl7nedqnzcohNjn1Ejnt254wGocvf_
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b40e90 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=1p3C7QevpJGBfu06fjUA:9
 a=SNiEU36zzXyr6W74:21 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfXxBrJ1KSyfIJP
 oiZvzaXwi/M2NHn5PqF0XvBHSwmkomPATxQB9rTiSb3tKyeFaCpydOg6Z8s9kXhinlQBJUQSUkt
 FnvMwp4umHReL/fui54pn4OjRUyGHNc9vvjRn9rRubZ83zsm6U+tVomLe8dbnjffWX2x++IEREZ
 mRxe8iCEbVtbe9H0IJfgXc+ODCA462/3YdhMJhStcX0DiKvCLlxBWP72wwun6xn2MOzqKyIHFVK
 MlXDYIJ0SFHZwRgq9esixnx164DkOfcZxl5vglNxsApu+KE9iBgj/ckRypqXMxJU1JRqXR+YkbE
 3jdrXToI1OY+slmEDMXhkNCi0tspgsLjkDdKl48WXDAwOWlfSxR+1+lbylPiVdmsMHPkc8Akuk8
 oS/4GymFDue46YwXM+DGqGrcOe/GOuVLtxn8SlpCVX8pTTzLaSip4liBHnfdvBo2fn0Ud0/MPAQ
 wnQIY+//tfgVhZ/5crQ==
X-Proofpoint-GUID: FPtl7nedqnzcohNjn1Ejnt254wGocvf_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
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
	TAGGED_FROM(0.00)[bounces-55679-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E6A52839AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We need to properly map camss WM index to our internal WM client
instance. Today we only support RDI interfaces with the RDI_WM
macro, introduce a __wm_to_client helper to support any interface.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 84 ++++++++++---------
 1 file changed, 43 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 30d7630b3e8b..d129b0d3a6ed 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -69,24 +69,19 @@
 #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
 
-/*
- * TODO: differentiate the port id based on requested type of RDI, BHIST etc
- *
- * TFE write master IDs (clients)
- *
- * BAYER		0
- * IDEAL_RAW		1
- * STATS_TINTLESS_BG	2
- * STATS_BHIST		3
- * STATS_AWB_BG		4
- * STATS_AEC_BG		5
- * STATS_BAF		6
- * RDI0			7
- * RDI1			8
- * RDI2			9
- */
-#define RDI_WM(n)		(7 + (n))
-#define TFE_WM_NUM		10
+enum tfe_client {
+	TFE_CLI_BAYER,
+	TFE_CLI_IDEAL_RAW,
+	TFE_CLI_STATS_TINTLESS_BG,
+	TFE_CLI_STATS_BHIST,
+	TFE_CLI_STATS_AWB_BG,
+	TFE_CLI_STATS_AEC_BG,
+	TFE_CLI_STATS_BAF,
+	TFE_CLI_RDI0,
+	TFE_CLI_RDI1,
+	TFE_CLI_RDI2,
+	TFE_CLI_NUM
+};
 
 enum tfe_iface {
 	TFE_IFACE_PIX,
@@ -108,6 +103,13 @@ enum tfe_subgroups {
 	TFE_SUBGROUP_NUM
 };
 
+static enum tfe_client tfe_wm_client_map[VFE_LINE_NUM_MAX] = {
+	[VFE_LINE_RDI0] = TFE_CLI_RDI0,
+	[VFE_LINE_RDI1] = TFE_CLI_RDI1,
+	[VFE_LINE_RDI2] = TFE_CLI_RDI2,
+	[VFE_LINE_PIX] = TFE_CLI_BAYER,
+};
+
 static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
 	[VFE_LINE_RDI0] = TFE_IFACE_RDI0,
 	[VFE_LINE_RDI1] = TFE_IFACE_RDI1,
@@ -209,10 +211,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
 	if (status) {
 		writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
-		for (i = 0; i < TFE_WM_NUM; i++) {
+		for (i = 0; i < TFE_CLI_NUM; i++) {
 			if (status & BIT(i))
 				dev_err_ratelimited(vfe->camss->dev,
-						    "VFE%u: bus overflow for wm %u\n",
+						    "VFE%u: bus overflow for client %u\n",
 						    vfe->id, i);
 		}
 	}
@@ -235,49 +237,49 @@ static void vfe_enable_irq(struct vfe_device *vfe)
 	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = tfe_wm_client_map[wm];
 
-	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
+	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
 }
 
-static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
-	u8 wm = RDI_WM(rdi);
+	u8 client = tfe_wm_client_map[wm];
 
 	/* Configuration for plain RDI frames */
-	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(wm));
-	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
-	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(wm));
-	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(wm));
-	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(wm));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
 
 	/* No dropped frames, one irq per frame */
-	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
-	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
+	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(client));
+	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(client));
 
 	vfe_enable_irq(vfe);
 
 	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
-	       vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	       vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u stride %u\n",
-		vfe->id, rdi, pix->width, pix->height, stride);
+	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
+		vfe->id, client, pix->width, pix->height, client);
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = tfe_wm_client_map[wm];
 
-	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
+	dev_dbg(vfe->camss->dev, "VFE%u: Stopped client %u\n", vfe->id, client);
 }
 
 static const struct camss_video_ops vfe_video_ops_520 = {
-- 
2.34.1


