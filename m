Return-Path: <linux-media+bounces-54791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL2LCaffqmlqXwEAu9opvQ
	(envelope-from <linux-media+bounces-54791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:07:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEC32224F2
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28C2C316130F
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554903ACF06;
	Fri,  6 Mar 2026 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7aWQTs0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNu+EKfQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A6E39EF2A
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805758; cv=none; b=RLVjBg6TzEZ+3RnEvA4RY5JVVA0maLqmFrWbe3bWyOpZK2zcsR0VY05WgU1IjAFKlRDIOvcs1DITxxyULUDVa8vSKKD9JKQPbbdEAbKqM4Htyw6FcdAQdrqp6JjqE9RpNWANjBUDkGso+dxrDkqzfKw1f74KV3D8HMcZljpYiTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805758; c=relaxed/simple;
	bh=XdypX5R7YHwAfdYLbFXiX9GcnSh1xUjeI6q+u07iB2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MyM9vzHYZ3CDZXqs1ijAqb2HR88QFcRuteoA3xt6RVIxihJpi8FwQ31p9ImE0QgnMwAaIJ/opJqiqqpkygnBK11icCndbkigp4UqF00ZGi2I2rDqaLG+8rgcZisErCAqirk2qsfHgqcb6UOe9FUIUynIqbRK/jszkYlOdhVw654=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7aWQTs0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNu+EKfQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BakAv1451605
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 14:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c5Mh2h/OmTF
	2BgN3VOSbtDREZ+HVddrQQ8YeRPNbPwQ=; b=j7aWQTs0N9GHkzkgqI7F+hmbMf0
	U3cx0Kj/nMfK1HbV0v/g1tw3jipIxchskdhb9pHpxGOHgWBqXOOvPS3GtGgppkiU
	nMeO6k6dWkDIwTo5VwTZu5QFX8HQr2t5Rh/VbreMFNl0wIdMGfMgpQ0koyPWHQqt
	M4JOaRTX7CvWrKk4nDwMfyN7zSvfI9FFXD7phdkb7ps5WczDYNLkonsYD7VB5lkV
	ELcGi7CQ6q8/75l6OEWG0o38ghQ2xplyhJqy1v0wzgI85SgiMmWNSBd2FxG1V0sr
	3OVpVk+phDqKTmTc4mzPaDXv36kVuiP3uw4GvtMQ7PjU0KSCDby5g9GT+gw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9agte1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 14:02:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffbe27449cso10306081137.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 06:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805753; x=1773410553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5Mh2h/OmTF2BgN3VOSbtDREZ+HVddrQQ8YeRPNbPwQ=;
        b=cNu+EKfQCDe5EMmBeYlJMO811orCyVVAbgW41EAeD06YsdGbUrnBqouUsmEiziFfAn
         XyQZeaUwjy8JchJ2rTAnLDlJTA6uXoRbw0Gt8qAVwnjm+Yk82iVWjq4KW06BEAhc7W+x
         RUwwf3LIuCCUOLWoZq7sSyA+39+mx2CqRe/fYVQpmfRoeoS6ITBDCCpQFvc++UmyxGbu
         vXKX5sVEsQV3thkIWuIwjwzDoDmkuBDw9P2qWHDgNecDkEbb/wDKw+mDKLuIJkOi+cFp
         ESEkK32SJ5Aaa5rjoTlC8Do2ou+aJdvyhgj77AgGJ6oUyK9xozCVnlJKWmULbvcwSuyW
         MQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805753; x=1773410553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c5Mh2h/OmTF2BgN3VOSbtDREZ+HVddrQQ8YeRPNbPwQ=;
        b=C36wmlXVD24F2G26pP7nWNWekszBryXFfjGMOGRg5Uipwkk8HSd7V59pORxkEPURBV
         U4NZ6MVJXzQ31mBYGuPfQW7h9zzZybuK5hA4QnU4aKyF7OsbUrq3VOKsVJETiyd9Yf/K
         Ywb2ysuoiEynDvzB7A9Rl1YzBlGtWO8anmI9jBcJ+3UVR8uZJiRZAXNDglOzWQ1B/XUE
         0vKT/kN/akFBSnAf0vRdjBP4hZUz5dllQ6SAiDPtaQ+2wpoWgiZ5grKi+0wRDOCh8Cgb
         PvMwxh5ZbImL3TospMtNM6a/yvuTuJnNqo1gup1iEKdCbzrYWWWTwwX8Oh+PYKMMfO6h
         nwIA==
X-Gm-Message-State: AOJu0Yyfx9DjBm9CkWjAXJ/z3O9sFKCriz2X6ji931qmzBzJtLtEArTp
	DKZWceYSakmymtn624Gc5nR6zp+QFFzyjjqFhG4Vamq1GO7RMvh2lt5Q5lbfLj7H6Qby4Trnu9L
	lrm5MWREf6Qz4rn++8aLvEtcL/3fwdAotMeRq4jITei8JdK4zTXy7uAM+c3ovMKbZVA==
X-Gm-Gg: ATEYQzzwv60OcigpmVjfr7kJZHb3kJIkS5fSRBSQckrccZnpaRTXxHe6hf4fC9g5ugr
	NOr+KfLBPrGa9oYQYrxk62pBWdE5cSPGxgQ26FVYaoYKYtCC7htP94MnNiD1FMrHnUGPMhZBKkf
	vpDRcv6RCjDUleaPTW3rB2eW0wMJXQ338ThbIceL2+8xym0SAurTNXYxzsR9kudA4+TOzbf8eDw
	vCCIpD0OA20yUUydCSaTpx8xqJ5y6m3pF2lmilQ3Wye3jXd3+mil9zu1OoN+tJ0u09TRyrW6gxa
	GvLqQ8wyDza9omd0Hf5c5s6iuitq3Z5Wiu7jF2AlKk9Kh8buEsszD3iRiVIcRPnfC2OKl73B+6S
	GFRFlSk3Lq/1P3i4jhIrr8Q0kEoXAYu8UFWbeDF7c4YofZbY7T1Fjt4Ou0FHeVnFjk3ItMmLtao
	P7j2xAbZJDjjEhe9o6IH6YA2V5r7GWV6801oKSRdmTlg==
X-Received: by 2002:a05:6102:c10:b0:5fd:ea47:d317 with SMTP id ada2fe7eead31-5ffc8edc536mr2505882137.15.1772805753322;
        Fri, 06 Mar 2026 06:02:33 -0800 (PST)
X-Received: by 2002:a05:6102:c10:b0:5fd:ea47:d317 with SMTP id ada2fe7eead31-5ffc8edc536mr2505792137.15.1772805752700;
        Fri, 06 Mar 2026 06:02:32 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237f2d2bsm20171425e9.4.2026.03.06.06.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:02:31 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 3/5] media: qcom: camss: csid-340: Enable PIX interface routing
Date: Fri,  6 Mar 2026 15:02:18 +0100
Message-Id: <20260306140220.1512341-4-loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-GUID: Chvp_dD0f8NwfncZw4fokFB39kI3V4ai
X-Proofpoint-ORIG-GUID: Chvp_dD0f8NwfncZw4fokFB39kI3V4ai
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69aade7a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Qlv3vNw1l6VwQTj1CKsA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfX9s8+M7GHt358
 KklHPrfmLZSb3rjFEyrq8G4lmZyT48cgmmGGgp6RG9t4c7xfEnA/uQKk+YlNikg9aySQwReu9nj
 pHODmdRKg858NdVLEYVfvXA8QK+f/4Qh1Fe5JgH8fdm5kpXQ+Thyug53dODq0DDtf3xMGIbtSQt
 IvfllyKP37qwbs4xi6RSCLBUt3Arv5w5SBMUD664TRwHEOCHBzsNXYbky4mYZRhXMp/e2Rrdb27
 R2H1cw0JuYVN2dBDRTVadLIGZlG8ZOro9OwmieQFlATzm+Gm3qZD13DoF5fm957/SexYBZBs9pq
 YiwVbgRfxn3Gp/RshgAG7EXYJIH64VUKjfTSR9BWxE8KnREXUstTo/Ie80ogkGLhWvSyXGcV9fX
 Im7bLYo20pKtkOvCS6B6ToMUnlee+kmqSzDqW5duTwi3u9TekqDEYeupqHlMTDRyi3+l2BVrHUM
 aBFVVqk0UVtB8k6raDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134
X-Rspamd-Queue-Id: 7CEC32224F2
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
	TAGGED_FROM(0.00)[bounces-54791-lists,linux-media=lfdr.de];
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


