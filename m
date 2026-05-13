Return-Path: <linux-media+bounces-61428-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Om2I1h1BGqdJwIAu9opvQ
	(envelope-from <linux-media+bounces-61428-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:58:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0685D533731
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E174C31ACCD5
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CB5426D2C;
	Wed, 13 May 2026 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAx6Trp8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O55O23dq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F591436356
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676555; cv=none; b=uEF7mW7UZe9/jTLgtWJPE7mdOhiuHepgIheuIgqbCIO7Kqw65Bk44sRpZNYut8hmhYitfkJwnvl4z5NokKzUHI2f9pXU4k1SrTgFuBMQccXuk+IKh9HcHGdDB2ncoKyVpkGdclcgv8Cjvv58rXqcnpJ0RrwnWQZuROE/onj0Uiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676555; c=relaxed/simple;
	bh=U1WEKcOZrCsXwGbYO3VwEdQBYlx1VxXoS7cDYZcOMmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nt3iXgCaWzgA6MSkPDnNRZ6W9gjfPFHqfrqRn5b6HYn3lKudpwOdHVBFyyRC4n2tubJVFuumhh0pUqsFJ8GKjKx8UZM2l75qgKp89QvRmjDXkymEMOKrjIFvBdgUd9kneIwhwxWHWjRFC5F7dVt8dgQEhrnxsk2b0ORHDE5DcNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAx6Trp8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O55O23dq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rIuX4082600
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=; b=DAx6Trp8zN/Zkx8F
	EyNHy1+PdaaDVCFQLFDKKQ7NCKLTnA8C5andj8oivDew1KcntvRaIwspFMNtNgC2
	PXNJsScvjKgFl4PN65mmm9fHMHOlJ1ZAnPNYMv1SGMcrD+cZe4zPwS62W/U1u0Pi
	bSR4wqaX2CbnmMnogAFGyqF1ck1pOV07yNx9sAQ1dMaXMckOahuyO6/haepwumWn
	wou5CKe0+p18xkZmu1/oagXS3sGYUmiTMNdiI7aQo80vRmAFlHhX2s0nfdP9hkFX
	QRNIhWFG6hOFxcMCTF5YennuaMDMy8clLSr7O8m04luYqkJlAubc74liw0fw5nxX
	y4TNIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e0tkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da529ff48so160189701cf.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676553; x=1779281353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=;
        b=O55O23dqRgpb469xUiyw3RpkOQjgJdF99+IZb3cQCW8Vr2qVTn+CgmrGyFhvnzBzom
         7bjRbmzs3RGESrXFN8gUSpCjaNkwgqbXtnYXukYU3OJM2ny0os1Uo/TZQwg/ealIO8UA
         XxafcXZQAXEcNp+ZASvMAoO8joQAgBpRjQvXDh2p9PKj7pZ0AxiWKqjh1JQAHg31yRVd
         7cEcGlTBD8+KGCua0YBYye7mbUTNwxq9A5JlWRJdAravfizOL6eOHnOKPwOEnHAk96ht
         ZRT461jjq5tYBckjzUe07H51U8NPSDhHYFWmfqRBwksMVtaaSbvz2hVHpTXuJ/OhUTiy
         r8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676553; x=1779281353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=;
        b=M/gdVOhOFhArVcrgpn1bi33c2sKbQwNzL3IqeFGmzBzdi40GHMJrgPtSUsYbEFEqYT
         GLKdNGkoZtmoSie8QZoUHUK33OTsPxiSubLQGoWj4beeM3Cxahj9/4APr4HhKQY9KIO6
         3mg3wtBx86luXbB7MnaYsOcfB9ADb+q5mjvO37DCM3wVkotnrrR4Ur8YBCMGk2Y23QUM
         HEoPv8vKlT5nUkINsY3/+lia98w0V9FDOP+FTm/8TPMlhnW7OTJlAQxM03d3h/VM1iGQ
         rFHPcYltEAHJRb6aPEdjdKn69y2URRNK8nU+qXvaYLWmHzimLmEQk5XAJc2qsQ1t106y
         1g0Q==
X-Gm-Message-State: AOJu0YyLXJrVSR8OGLGDIWyPvjfdVNJV0daa2RcknrotjugVnXxF/dwy
	/PTTSUpsFj3Pp1TBROAIxBIacqnZp3sJkd+cQzvnWYS1lDX/XIkoUj2MAps9tzY8FEEQHmOc/jb
	D11UftAd1dAucLSf8slt1sfX1Hbgn/sfkUSMo3jAWAfILQj2ah8QNrP2ZEjIvUdd4Ig==
X-Gm-Gg: Acq92OHRO5LagVVRyj98M0ecUkH6qVGUOPXjt7DBgvQB53UK1u57Z3cHltyAXz5Xs+a
	ZE7KsuXJgVgRJ780v6K2Fah3/y+JpIozijVbRnEoKvygKERF7spvi3e3dQ7VDTlI/A6PCZu8jR0
	MAYALfTcyrIMtMV6K7VjUwwxElsnsCGjSViyQXN6o3G+tjH4qqCIdlCi6uY/kEaOdgN3L4kg2Hn
	aZJSB/5G9BeB2+OHg8vkgfg3YN16KuvaClDGY1apqhAFvdnOlc3oRyQL5E6jyBVm3LmbtZhgCR+
	i5pDy6vFZ3OoW5qTlMYWPMQf2/8Koy3cxFZN+JSZsAIaVRkK0C0k4POvVASb4u2+4v/ZRDEDS2D
	jS9Dj4zEG/ccfAS1SU5rc642zaP2NAkNlISNQCxtu6+iWp/IwVnSqczNykyw2QOP8eD7bOrqDy/
	v9xk0jWgfa3Ixk/ZNxptQW+YK7O6GS5kDVTsE=
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr38734811cf.48.1778676552606;
        Wed, 13 May 2026 05:49:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0f:b0:50f:bd79:2642 with SMTP id d75a77b69052e-5162f611564mr38734351cf.48.1778676552085;
        Wed, 13 May 2026 05:49:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:36 +0300
Subject: [PATCH v2 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-2-411e5f7bdc4c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4536;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=X3Z4HL3UZoUysuTz1/xwzlwJPOeZfHAr2V3R4DT1iDI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHM/rOGpk62mEvyYzTUSmmxa/tsYrrnZZDEdj
 mwZJD3UNf+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzPwAKCRCLPIo+Aiko
 1VbHB/4xgL+o0pFRVbWcQXFvIz4kiCzjS4V8GF2MG7OYQh+tfpdavVF7ltbdflw8Anmibz4W8WC
 afIDGpQxjQEfObIchp/9AHvFj2yz/OMQqMx6lqX71hMDKCrUoYMXaafljvSP1lGfyhveQcNEYi/
 yTTevfEug7tIiUQoQRE22t39rY8FzUxZZzwo6rWqneSxeHsE1MA+LkY7KaFsRMKFvAlyGnhCkM9
 XROtUNNR0vZySlB+1U7gVdEQReqQ0dAzig2KqQOya90O2UQlLssTvfDgk/WQNgF1bf0k6VkDBqy
 gR1ytxMXjY4vO4luIUXpyacIdZqJjQtPP/aCuN27EM7ZVPNm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: g3z5XFFpyyRs7H5VVsa9xIFpmM-jhlNY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX0/fqWz1Gxp8l
 PbhVqtuFD23DpSCyZf8xgzUlFVQmTnhQWjCilu7B/l5Z6GYJGa6qA1T4YhIvQrFPEtC1lrqlEZw
 PkLe3cgJ24+zPJmLYurkxcp0+Pzolv1bQpaYbOl5Aq3J/LCfj72fsafJGTJocxFJHgE7xkljVRg
 BW04CRAkYzxtYckMapVUN0H7El19cWmQh4qiC8aFo9Eudc5rhSd7mG1gGr9aYZN7kruFsqHlD8f
 53QjPgqLqq5odYY8uP2tNGGdRruPvqp+nm/xADcozPDldhuz2SeEdnwu4p8VX5PB5d+iiN+WA8M
 5HckC3dkziwyAtsdG/2VOxZUSfylJnRul8tWBXefw47wgma49AopVdldJJsF6TPkCbJhO4dMRpf
 0E4H4dEZLH4eF1X7DTCf7WFMzWpdVxAoSQE4vZWfL3xqCst+xCbyGdnlBLKMXVC9CU/WwEvZNgb
 XGmtiTK7ik/modSCJww==
X-Proofpoint-GUID: g3z5XFFpyyRs7H5VVsa9xIFpmM-jhlNY
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a047349 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=HWmRtQhKy1KQUjwlQEkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: 0685D533731
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
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61428-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 9 +++++++++
 drivers/media/platform/qcom/iris/iris_venc.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ff8d664558af..bd44e6437480 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -74,6 +75,7 @@ static const u32 iris_vdec_formats_cap[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -85,6 +87,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	default:
 		return false;
@@ -100,6 +105,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -111,6 +117,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2398992d0596..c41f4103ccc3 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -97,6 +98,7 @@ static const u32 iris_venc_formats_out[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -104,6 +106,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -123,6 +128,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -130,6 +136,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3


