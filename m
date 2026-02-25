Return-Path: <linux-media+bounces-53355-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC88JGEQn2neYgQAu9opvQ
	(envelope-from <linux-media+bounces-53355-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:08:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E46199348
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6F363077CD6
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876C7296BD1;
	Wed, 25 Feb 2026 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAiPMMZ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMoQ2PzG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24A03D412A
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031708; cv=none; b=tjtiQsaD7Gs/vpj03d9rn2IkMHdueLh2LC5AlWMtWiDDFSadU2gLmB+oejHiqvmDvq8a5mPsPjYlrn3AOmqXaFHxHHRlMGknA8z2u2Sr4gzWUJWL1LfkreMUFgKyQ3WOi0797cL3qku/9hgmmTPjYvQrdoGjPe12v5iYfm37ZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031708; c=relaxed/simple;
	bh=XdypX5R7YHwAfdYLbFXiX9GcnSh1xUjeI6q+u07iB2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I9B/LxQdv+tDOpFGXfTcM3Cr7FsUj3hVXQEqZzpPGD68pRnfGIV576ZSQuODFwnwkWJuZyJZMgFqp6LyRciLIk6dHLwxRbhkjmTQEozTJNbwdNAFXsvEDRlSngBgHI97UZzkTmAqYEp1LU5MkmrFTqUAAeg9V7lGuEmNf/Wb4ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAiPMMZ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMoQ2PzG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PEkXmU3041182
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c5Mh2h/OmTF
	2BgN3VOSbtDREZ+HVddrQQ8YeRPNbPwQ=; b=nAiPMMZ1DrNKc9psHSq0bddGa7G
	xW4TYmuNNwwZWhVKzi4uqv1V2W+5OIEv/2nUnFtQQvk38MJNFKEeUMnSyYucSfJc
	MYrnasR9ifuyQSEmBfIzV2EYgqaLIOp0dD5aUd4uP14GPk3II4b/xHU69MnqshCr
	hk53jXUdml8sSzYUSmwlw9JgIlQ7UDyPFgh69Lv7YkncI0+0T3uwkkEyVZP7BG+m
	MjdcGXlYrvxevlVp+GiMF4iuqpYEl5uHeAvWIgBdOWo2NDuZITzo4c+0lJoFbeo4
	GL8fIlTBhvNwGfwGELVTiC4xn+a4NJ4/jwWa3AjVtJKHBF1gT+pyzoUVYxg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350g1f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:01:47 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-679deba5e9fso25953550eaf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772031706; x=1772636506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5Mh2h/OmTF2BgN3VOSbtDREZ+HVddrQQ8YeRPNbPwQ=;
        b=gMoQ2PzGLK1xEIsLvFEVux95KQrGfVk7ArLmJRMDCaF5ckf2MDWbILm1/9McjTiwWd
         tWgIY+3dMRal8XGm4JofLXjXycVPWNM/n0YDmjULAjuxgMVCGfFZeGwLX7FYAEH0L39p
         1oEtt7ugJ74yNP4OyZsaSZ1zvyEGlBAsz2aOY1ZOZv6TLxNpGAFF6OyHDDGF16gHPEHH
         IZ1dx0r5BZm0cHhrxJmL6qWQxp8AtNgOEMyZwSSt7nHugsCqehbrl9yVXEoDl4c8i4oR
         +F0Vd/AX+2vwoO4RHdfGxZMpUiIWzkwVn5OZiTKBKSMw4JXGCoLWzj5dFNnq5rdsmDUM
         jVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031706; x=1772636506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c5Mh2h/OmTF2BgN3VOSbtDREZ+HVddrQQ8YeRPNbPwQ=;
        b=iyyBGEQl6ne3r4p5ZM6zJIPIF5qkL2bupMkGkqLJVApE9Frl0UXXegIg6BwvJTJLYQ
         47+I5A5JX0uhL0wF9KC9zBJXhrMB9CawjV7X8OFq8nNiOgA61EyJhk/WAR7jNrrcrCWh
         ThQr0x6CoNsfEIgR+IuikirrqEI1vjgHsO4FWviRFZATvPTOY/LoxiPCUdWqJqva1mE8
         9qYG0tvv/KehI+Svq4LZmhru3evD3svrqz2jOXdOvWlQLFCMsvIMLN3oRXORhn9xOWl6
         OdGJvnij/Qm6HNDfgwVlchcxlJLy+6dyxBhzoRowAc2vVAH8On6AVl5uXrnb8C0Q11Nj
         wX6g==
X-Gm-Message-State: AOJu0YwxmKszVsna5dEERVW+bC75oPD6f59W5y3qbGQggAi7GloVAxL8
	8z+mHUuNwoaCZXg5YPmNz4swXF26qf+nemgffQVs2PQeK8y4r3DdQs5sD08HcXKsEheMA0liHiv
	rMu4PmYEjceN4Ceey9WMev6JjdOLzu8oNRUQMgEfMNtE/yPHr/buNRNTUGk/L8Rll9A==
X-Gm-Gg: ATEYQzzZ0Dxv6hlRcsBLjR2HHzU6ZWJTOCPn844vThTANa/DjDW4SwGGXskLblcDI8W
	K1h4hx7RSuHDgMuP+dOijCyg9FmkA4zmyCkDqJ1TI9uIJ4FHnzgYG9Wg9Q2dyKQGrghbTHwxJqx
	n4JIOwsT/htgIc8IXyLdy9BQpggoJ33GC2ttAwb0EMIwURHy7U9qA9Wjw0bTnNhi/StgyZD3AvV
	Kp3GNwqU5iucBdeauDBiy4rAi6tKDRPBmw586DouBxv5tyiX/QNnBeQR4xhJIm8rlltGdE3laXH
	5Ljg2xyEK3FUJvtKAoJuzvuBKr/2GCrwadj6RjbIg6nOZD/t1cd9IjN3SAKwP6STZ7rs6Q9Jzo5
	K7u5Yrodv8JfnWbnKHfPADO/DpcIN/CcbVvLq+Nqm2wbw9C1piLP1dJ9KvI0iLTbqVVfFTG+qeN
	rAqWuNjj9Ol6U=
X-Received: by 2002:a05:6820:2290:b0:679:94ff:6ea5 with SMTP id 006d021491bc7-679c4250a66mr8429668eaf.9.1772031705918;
        Wed, 25 Feb 2026 07:01:45 -0800 (PST)
X-Received: by 2002:a05:6820:2290:b0:679:94ff:6ea5 with SMTP id 006d021491bc7-679c4250a66mr8429616eaf.9.1772031704896;
        Wed, 25 Feb 2026 07:01:44 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a08edsm4306552a12.5.2026.02.25.07.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:01:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 3/5] media: qcom: camss: csid-340: Enable PIX interface routing
Date: Wed, 25 Feb 2026 16:01:20 +0100
Message-Id: <20260225150122.766220-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UfW03KvGhRdElilfS0pDMKfYvBoUcNvH
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=699f0edb cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=Qlv3vNw1l6VwQTj1CKsA:9
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0NCBTYWx0ZWRfX4ZhxCgex7mV3
 AfzAjVtuqHRa9KaX4LIlJ4Qs7yhhBL0T/iWBqfJGfKM+HuEXE96XPQtLlVtkGYWS0UuTqJOdyPi
 S4Udp5a1Yvoojmtb6775i1ZlQTW5nCWhR9/pf+scKCXybGRU0XmAWhU9sKUh5YTrevleHbIh425
 hc8niUt564NCj+Vh0ITR4vF/EvSiRopIoHLRQzfLPHHYWkZJMgzRq/HBEIIfasMb+folT64ONfj
 yjkPhxNp6zLF1ET+q8ROFFUr98HidS9x7JQ9bSDbnSwJJQWANq1Ro+rQ6xA+xWrAkAFzXBoIPO/
 NjjSjU9k8C9ByWJo9DjtXcRmMyV4V258kOL5+ZnwSC4IxBdNqubfVEoPE4VwTDIMnQfPX0YioSA
 8zxPAMOJobmxnZL0NuFiM2MY+nJiCbGjucSt6et493tl/DDoMJ7yP2YOIKkmeK22vlcaNIH8u9l
 lzp0Ehprfr5HQ7iUV2Q==
X-Proofpoint-ORIG-GUID: UfW03KvGhRdElilfS0pDMKfYvBoUcNvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53355-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48E46199348
X-Rspamd-Action: no action

Add PIX path support to the CSID-340 driver. The hardware exposes a
dedicated PIX interface in addition to the existing RDI paths, but
the driver only supported RDI stream configuration so far.

Implements a dedicated __csid_configure_pix_stream() helper. The
PIX path is configured similarly to RDI but uses the primary stream
(VC0/DT0) and the appropriate CSID_CFG0/CSID_CTRL registers. Stream
selection logic is also updated so RDI and PIX paths are configured
independently.

The PIX pipeline can subsequently perform further processing,
including scaling, cropping, and statistics.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-340.c      | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 9e80408727ee..f61493d2e72e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -56,6 +56,7 @@
 #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
 #define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
+#define CSID_PIX_SRC_STREAMS		CSID_MAX_RDI_SRC_STREAMS
 
 enum csid_iface {
 	CSID_IFACE_PIX,
@@ -64,10 +65,11 @@ enum csid_iface {
 	CSID_IFACE_RDI2,
 };
 
-static enum csid_iface csid_vc_iface_map[CSID_MAX_RDI_SRC_STREAMS] = {
+static enum csid_iface csid_vc_iface_map[MSM_CSID_MAX_SRC_STREAMS] = {
 	[0] = CSID_IFACE_RDI0,
 	[1] = CSID_IFACE_RDI1,
 	[2] = CSID_IFACE_RDI2,
+	[3] = CSID_IFACE_PIX,
 };
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
@@ -123,6 +125,30 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, bool enable, u
 	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
 }
 
+static void __csid_configure_pix_stream(struct csid_device *csid, bool enable)
+{
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PADS_NUM - 1];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+	u32 val;
+
+	val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
+	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
+
+	/* For PIX we use the same VC/DTID as RDI0 (0) to capture the main stream */
+	val |= FIELD_PREP(CSID_CFG0_VC_MASK, 0);
+	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, 0);
+
+	if (enable)
+		val |= CSID_CFG0_ENABLE;
+
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %sable PIX (dt:0x%x df:0x%x)\n",
+		csid->id, enable ? "en" : "dis", format->data_type, format->decode_format);
+
+	writel_relaxed(val, csid->base + CSID_CFG0(CSID_IFACE_PIX));
+	writel_relaxed(enable, csid->base + CSID_CTRL(CSID_IFACE_PIX));
+}
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
@@ -135,6 +161,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i))
 			__csid_configure_rdi_stream(csid, !!enable, i);
 	}
+
+	/* PIX */
+	if (csid->phy.en_vc & BIT(CSID_PIX_SRC_STREAMS))
+		__csid_configure_pix_stream(csid, !!enable);
 }
 
 static int csid_reset(struct csid_device *csid)
-- 
2.34.1


