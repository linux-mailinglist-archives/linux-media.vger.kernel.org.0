Return-Path: <linux-media+bounces-40307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BFEB2CA11
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 18:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBAF35E6F28
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFAE2E5D39;
	Tue, 19 Aug 2025 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUr/u2nm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C72E22B0
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622540; cv=none; b=hfw4KTJYynZmxXaPTY9Y5xbywt8WR70Vzsw6sMD7cGmrfGqNEKEVb0OJuIE8/JQoAdlHPnW1fddaGOReICZERmXSDN2YdmY/GNGJnZLsGQC710OV06gtHj0+JfBpzCvfBWjg+i9NV/ojWXjjaRT4EPjCRr3zxThWu7RvJoC/i3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622540; c=relaxed/simple;
	bh=Jz5i0hb8iPyBN4hHz1WzlmNjotDeNcwA9V2rf5gcWrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGw1jxlOnTIWxiZWH5UlGmL37oy8y/vCKLblxZ8EqE4Db8nnLZXdgwWXOFUdozOMzSM+08BvAtpSVUok4W3Lxktj1D4at5rk4xmFJxPMYQ4WbrTop0I0a5+o6YlVvRR1HdVwf6AU7CDD3SrBv4GN3tz996ypNDhnHqUyi3hqPjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUr/u2nm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90ac8007276
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MHzX4m9djdY
	BrCYq6RUgrrQ8tJswsBpsxDwBSp7qf/U=; b=NUr/u2nmxmdVRpXNIpi6Bv/ZqJF
	QaF80JGuChksMqQWy5NghH2UKhmKs/DyGXhWImn0feeIlofLOqVX9jY3q7mo38IX
	kepnbVDMivsFl9nwsC/IjIL7rxMI3voD2/CDVL1tpyduMjPWpoHpKCPFKVF9X/Fv
	mRdjtAy50pwfxZ0vbwX+bcDaB5Kndt//uW241ypCIczKc+CNUDtrxzJVgx7Zb/bf
	0WlLgwbdIcFtn+ZxqhfgyMWY0+/oeElA2farCiWXCtqbt3PABUtQNVApONhHFl77
	2eTn+FS2HFIdzSZXtEigG6kCG9XsWmyGl3HBNFyaDF3JgJJkOoLON48PEfQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj749cx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457ef983fso108238605ad.0
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 09:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622538; x=1756227338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHzX4m9djdYBrCYq6RUgrrQ8tJswsBpsxDwBSp7qf/U=;
        b=rC74yuInL89cMu++I7TXfs8DWxobeQQvYCWnBtBXHdbeVMegHrEh3GyovtlT4RH6bp
         0NpeWwGidAFvts8lrUL6KPBn2VSKImrFOg/rqYnUq/PbAp0mH3I9p7a9pm1kMnqqCt/a
         hSdnRiIWNeRcizzpF+TJWKpHYHa/AwMTOg5ufsFsc7nRQgQtGV28hUx/gYoWNMEU9Dz4
         kYJQ4MD5EquAS4oPnpv+yEEw1PdXlTB2/9hAAG8+1LFj76Vi3nN9X1YDInRCUGfAJhft
         t8lh1AvoMp7aVTphgCOmEZK1vPj22I297r5opkpsTy9Qjvt/8cQl3YCAg+U7x8SzV2XC
         z2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoT8juAtD7d+Gwo+U0AACpjFi3K6hhJUIH7lfvKXGzApmiuIeFnxw0Enyo71ewlOYEL6LXMUqwQAcJkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpTIrQTe7/lzYL1lWYnTELrBrj0r+eNGE/qnIY57ZJ+jpgET7t
	YnSWjeMrfhmGu+ZQ6lICrbgtNwnvPQy3UMkunFh5vdrPic20MHv1+DmR22zw95C2360TgvkfuLH
	biAsv4ieYxxeRgDZ9nTf/lGwxzROn6uGgJaNIcHZrhg8yszf2qpASep/LINecWGx6lg==
X-Gm-Gg: ASbGncuhfvrVGkdwR08cGuHeZlaVHuLoprb65BRHUT6P35tCcAvgqb1HEM0rp1rmUv4
	h2kn5p54RyFfdjyWtk5Xs5+rEIHttrt9Q5xr6FaGuL1VwzD9xlZdCpBTZru4X02TXFuaLvkRsN/
	3AISzQHehyvBiRU7t/5KmrdLq1Vp7/tlmM3jPbdq7ke4ayvv8KRk7bfTl+5OgH88C9AJDJ48Kzn
	i2npStmtBmQq4CN8zLJUEMMDXFP2pt6AnIiqPqDljsKxTSHTrIj0lqPVTbh4jq6qmhePaYD6Y+J
	Akvd6nLqoP7CMSgQse0CVDvmawCKbdKRI2QafRzkxcPPy4dI7Z+BzU+HQiKH54H9Dfc=
X-Received: by 2002:a17:902:ea0b:b0:243:597:a2d6 with SMTP id d9443c01a7336-245e02a52ecmr56406615ad.1.1755622537706;
        Tue, 19 Aug 2025 09:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdZh+CflCKOL+J9L55ubWiuqFife6t4XkwShQjJuGcwmfkYC9b9mA7fxGUIeUJ/HsPN4t1Pw==
X-Received: by 2002:a17:902:ea0b:b0:243:597:a2d6 with SMTP id d9443c01a7336-245e02a52ecmr56406285ad.1.1755622537275;
        Tue, 19 Aug 2025 09:55:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:36 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 04/11] firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
Date: Tue, 19 Aug 2025 22:24:39 +0530
Message-ID: <20250819165447.4149674-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rvM2Is2h2FVg5BdeBjSLKtYYx3vGDUwG
X-Proofpoint-ORIG-GUID: rvM2Is2h2FVg5BdeBjSLKtYYx3vGDUwG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX1ptfJvUO7zk7
 N2Xd2av4VsqajCOFpPjJAiPMb02TaWWDhjFU+lP3BwLvndxuFg179s6c60JuRvdQzHOgDj4UpVb
 wJ7jdI3Wld0eoEluU6fmf1d5oNd+z2Hq2AXMyaROwphCeDLpgooBOjWypo7P1f14Qm2luV7Q/u/
 c4XIeWAynBfF2+m8MNGY0kUh5ZonGd3+iHKPzZR8yRrxqelDMHADxrT+MHqh78SnHdLAfuJMow2
 hintf6HBpCVsLkQwoN+XEwkzFpxiMBg6tHgjOYJSvMv0joonogfCmXpdyLEIG0kz1snx5e7n7ZE
 FMxOnUyauiX0GAeX+4f/+G1OGO/SZMnJdbLw4O7aCXbi3Y1EBCxC1RGfMwtZ1+YcC71hz02/a7Z
 EC12JGQj
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a4ac8a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=7vI4Mn6wnVF6ixtUiuoA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

Simplify qcom_scm_pas_init_image() by making the memory
allocation, copy and free work in a separate function
then the actual SMC call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 59 ++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9a5b34f5bacb..7827699e277c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -584,6 +584,38 @@ void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
 
+static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
+				     void *metadata, size_t size,
+				     struct qcom_scm_res *res)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
+		.args[0] = peripheral,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	desc.args[1] = mdata_phys;
+
+	ret = qcom_scm_call(__scm->dev, &desc, res);
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret;
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -604,17 +636,10 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
 int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx)
 {
+	struct qcom_scm_res res;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = peripheral,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
 
 	/*
 	 * During the scm call memory protection will be enabled for the meta
@@ -635,23 +660,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		goto out;
-
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		goto disable_clk;
-
-	desc.args[1] = mdata_phys;
-
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
-	qcom_scm_bw_disable();
-
-disable_clk:
-	qcom_scm_clk_disable();
-
-out:
+	ret = __qcom_scm_pas_init_image(peripheral, mdata_phys, mdata_buf, size, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
-- 
2.50.1


