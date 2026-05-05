Return-Path: <linux-media+bounces-60345-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGi2JH2X+WmX+AIAu9opvQ
	(envelope-from <linux-media+bounces-60345-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:08:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB56D4C7878
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8652430593E8
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 07:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DDE3E1CF5;
	Tue,  5 May 2026 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdjCu4P/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJvoHINv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D710D3DFC9C
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 07:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964472; cv=none; b=O6WSzmpDINs1xxYD0VgW7m62X9DVTmRZkn/s10i+lXmd0gMAJTIw2zzbchXSqBKgVgsNTWCKuLbiCKINQAdAI0Hgrz+ItUwEJX0I3Dqu5EHE6zdywCj9U6YJtz+KKJ1THj9paPp4olxGnWHYydT463dD5w9pvN/0vfvZj7qrMk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964472; c=relaxed/simple;
	bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMz0UFoo+AJuF9lwyTtgA8Ca0U9XHqI3jQ5Vg506mAadcCiXqi7lvUzLGx2nSaFRPfC6ZJZREcv82jWQNH5QcywtanUWavarQmaveiAzQC1bbo4mS69oVGZSuVJR3zsu3W1qDkyM7ZM1RtvIJ+ih1CzoNva4UFaBzFvoZYP6kSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdjCu4P/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJvoHINv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645552QG4128839
	for <linux-media@vger.kernel.org>; Tue, 5 May 2026 07:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=; b=LdjCu4P/8xtim++H
	11ySw/8csdxm7YeaptSggci7OMVSaCGBF4xeVOyXcx7gVzCfzBNHiJdGV7lZFoMK
	ezw57U65lW9LW99UC/Kt102lan8RhFEYhpp1v3c0UJI20DYN5DjN3wyRD5HQecKO
	CYh98HbTIHRetymrNc/kmpCWqvgscUZH7w+fAFntRaxaeIm0IvRiVc1o89rvlMa6
	fvyes115G99cxv6SAmOmj1qHKPqa97JxkTfEVOw+EpgZteOB6MC2S5MIoxgrSl+P
	zcSWZsidybdF7FzUEec60YwoTU2xNjGO6RbRHkKIPg1XGNFhVV5wvnrF0q+oUahv
	jXB8lg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw3up8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:01:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365312a27a8so2012804a91.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 00:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964469; x=1778569269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=IJvoHINv7od6KCDboNRw7XbHnGn23UDZena9ROtvpIF6VEjPen/gmRPk7TKyDrc6KX
         N0faQfaaXMkPsL6T/q8VvXplPdiWgYOu0/0vPGS7EXz+XtUAqaUFbA/bF/NhmAIZIg2i
         UHVxP/A1FSEyB+JyHBhhpE3gUK7hIWBBj51yAN+KLfIKhWLnAw4gJteQVnwNaeh6MA34
         skRFn7ZjnWnYuqtSxywCQ9HLP6+foGYscQ6AmNPLK6ysD6BjpMNhrpey1WIzZ03H6ejU
         mLF7sxj1hKeIg9QEk+pi3Z92zjmdPAL4ENjlwZEm5Y8U2v7D9rYnU6nzSlYjbN2LD+vW
         INRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964469; x=1778569269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=mLho5l8p6GvBjy21W4WnNY6rGwqf9KF461AN7yKB8TKH5k5oxdTcBaS5xMmBUa3JdO
         ceszRpfW8Sq6VRuQklecNI2c/jxyi/BCak+E0YI7dXgSM3rzsyv30buEQBQraxBSA4jq
         42I3eqAletNQA8Cyjdrm8yRnNiqnJWL0Zh/06EJ2sbLMy7ItxGJ6938mfTRM+isojOdC
         Seq3xDD3LlKdhSvtjM2zRHZRhW9ZrD6PCY8maXFYr4R1DzvTx/nPST6EtVH+cDdPerv2
         k5rrEDLeQ0rUCC0i+6qaH7mh1xXeKEqYkd1k+c6hdJoQ0I3usNzp50ng86ya/kf+gLot
         eEEw==
X-Gm-Message-State: AOJu0YwXDvdM/sQc9c1ovxei5e3Uk6OGuOLw9r9/xJQ2+tWjoeN0GdaZ
	XifmPJPdLYKtfcXRihI+RgVhBu7lKFCfIoRCYL3zoi8pZ68aa4WmW9g4PRBy54MkPyFmU6mPbCd
	n6DgZ6Z/BX/8Ki874J8KLxBhJucdLoBjbxdIU/3K7V/G+14zQx+6exoMfiRRqaXHYoHerMJKR2A
	==
X-Gm-Gg: AeBDievSQSnWloIppzP/RTAycfEIxUDlpJYS1MlWoGLU8n2NPJpzcs1s4y11Bb7h0r3
	fsnymVHcEgYZBDOe7wFw1nGExAc39hn8pIWTaUi9Lto7fUjw14jdUNIMG5crALe1i5hz1f/w3A5
	CuuOoVvQUQf9vXJHzBq1wphgrmSNptBXvZTkUNkqW9gawcP/tgKOp6eIh04Us6IDrETqXioi6Yu
	mL6c8Lpz/mMuiPJMPxtdFSvrlSFtrGp9iRodLNe/GJqmu/oAJ731aE7cR6PkObzo274aacT1J4u
	nD3TOi879XqAZct/iZlm3Kj59yXhsVFSB4ZAfUZxJmB4roANZsL4u0Bk0EoD5YILN0j/XfhwbXP
	0aPu2FZwP9Hw+hbs8EEpYZ9ilPVZUmcR1tvV0FM7T6LEb+AVje99F8PBY7FwY+aat0FrK/GoUsV
	jA
X-Received: by 2002:a17:90b:4a:b0:362:bfd6:a875 with SMTP id 98e67ed59e1d1-36577369c85mr1964941a91.1.1777964468577;
        Tue, 05 May 2026 00:01:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4a:b0:362:bfd6:a875 with SMTP id 98e67ed59e1d1-36577369c85mr1964891a91.1.1777964468052;
        Tue, 05 May 2026 00:01:08 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:01:07 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:27 +0530
Subject: [PATCH v4 06/13] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-6-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=3016;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
 b=gsq9OxYUHQTzG9WaiC2/lfHisQcvobFOu9F3SM0jPXdGrbQ3ToFwtcC7nTt2I2lSoKXnT3nkO
 Ac2QeRNg2mbAez7nZcKlVIZXGff1VBznkJqWiAmryQnRSp7Q6fkMsYh
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f995b5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 9ltd-1xYseZ6scGypmJOIUa2P03VwuV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfX+lqN3YTGKReG
 2CC2gRcWQfIjh0Z9JC2yfAd4sJBuRG1MBOFFvezyfgzH2DMBqPX6IEo64AAz+cJmyQzH3Y9Mon/
 VGjpdGit27NUwPnbWbF7dbc7Zv2zHtlZ2KKzg15rO1CYfjQKIfqi8rWf9HYruILDzNWVLxwTc3z
 Xg7Y/X+Z4+/PHaLjbQLngDBvXYRPyESVB+/jdOIaHUq8tIgEDQV8/r4WyVjVAg+ZPu3MkAnTdeU
 zW1vitF1xK3ldjJWY/t1LkTEnygaqf8paspO2yGw/f3amxkOcMj623QxMX1gsEZDhW3HrOASRSv
 aelZE3cwRh4FfVL54vVNwu3YNSeGi372O5SFUPca/08p7eztUzQhCS3v6qOEEsgUmGCNBHdw6CN
 IxjDv99z3WP8x7yqjXj00ngkJbQls9Qt/0qe3geee+9FoPovPPFNTBpJQDqRJ0hX6k9GnIC6Xf4
 RjjnnuCMccuZ2iAvPBA==
X-Proofpoint-ORIG-GUID: 9ltd-1xYseZ6scGypmJOIUa2P03VwuV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050063
X-Rspamd-Queue-Id: AB56D4C7878
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60345-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The Glymur platform requires a dedicated firmware context bank device
which is mapped to the firmware stream ID to load the firmware.

Add init and deinit hooks in the platform data for context bank setup.
These hooks allow platform specific code to initialize and tear down
context banks.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..55ff6137d9a9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -219,6 +219,8 @@ struct iris_platform_data {
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	void (*set_preset_registers)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..34751912f871 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -142,6 +142,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->init_cb_devs)
+		return core->iris_platform_data->init_cb_devs(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->deinit_cb_devs)
+		core->iris_platform_data->deinit_cb_devs(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -193,6 +207,7 @@ static void iris_remove(struct platform_device *pdev)
 		return;
 
 	iris_core_deinit(core);
+	iris_deinit_cb_devs(core);
 
 	video_unregister_device(core->vdev_dec);
 	video_unregister_device(core->vdev_enc);
@@ -259,11 +274,15 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = iris_init_cb_devs(core);
+	if (ret)
+		return ret;
+
 	iris_session_init_caps(core);
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
-		return ret;
+		goto err_deinit_cb;
 
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
@@ -298,6 +317,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_deinit_cb:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1


