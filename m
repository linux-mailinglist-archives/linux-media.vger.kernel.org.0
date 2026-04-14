Return-Path: <linux-media+bounces-58695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AeZF4LK3WknjQkAu9opvQ
	(envelope-from <linux-media+bounces-58695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:02:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E84503F59B2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2243D30A7622
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 05:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A244C282F3D;
	Tue, 14 Apr 2026 05:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpih+3HN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfXgGpsN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C460D1D5AD4
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142851; cv=none; b=hn/sovQdmFcUFo23hJwRkt+YB9n028QTp7Z6NTQyO4E+aSfam5pBhPk8CzKu+Tj1T8rsF6kXDC7ZyS8F4wiuGRRlpvU7X6n7Sa/rFTTXzGTYBDuR4H8hVegzyAvNDU760Bu9KshSdAdtEKF6+Q8Y362I6E3b1gji7jHeTf4ktlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142851; c=relaxed/simple;
	bh=i6ZmiIhYyteEX9ku3DC5s4Wu1KZIwZCobr9Vm2PQ3dA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OhyKARgpSqlS0+mtqOdDRCLS6hqltpOp4cmnBcxyDTyTPlcHxcQBlTcfm05ojXMNqB4O5jQZqJC3YFU/xJZ8Y0hX2kL6pJnhYHB57g4Zk5HdrWuHxAAGOt/AUi1VfzwQS0z3oZyvriV7gjQ8CxBqN0YzPzAj3rlDdJP8uWaOjBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpih+3HN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfXgGpsN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLBHGd3157473
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/V6Rs8rcZ7PWWMWLKnxm5Zkp3zsUGa7EcbO4a5GtxCs=; b=gpih+3HND/I+h2iI
	E0zqieeXjDHZEX5HqWtB5fFp8+ztXhjYpp+BxQA6KpiVtJsLFu266A99rfghPyA3
	CZNBXiYcpMEZ6v55ygSTZwCIEKf7WVVpZljpgWb3BB6GR5cmRBOj9AFDq02Tj96T
	9sg3iE6DqeQ/Us0bcs3pnxzMCBkeC3WnQtUs24HA8LTKMx4mxANkyBGUhWRBro5l
	Gb/kmekTcEnuS1/9ErG/er95B/PF8Z/nymCprb/dsr/aD2EuVWqf/SoYQYhpI+Vf
	QXPlClLSmJKrqjqxyrKw1FMQ+m4so/Fbk/0OTxntujLR9KOlANZGPhDmIauKCGpa
	Pa/RXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86b91xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso22020805ad.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 22:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142848; x=1776747648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/V6Rs8rcZ7PWWMWLKnxm5Zkp3zsUGa7EcbO4a5GtxCs=;
        b=MfXgGpsNZhD2vbCnRQ4SRvJfkAZ/jOcLqtSH7Us58Qx/S78oF2AsabHZodkUrM403O
         LTOG1HL1STDjKRsub3HwvfEKOBFSpfyfIb599mKB8rj5Cme/FVpPbj2KdpZBdGionHPz
         oSJslYE0tZx0Pt324nMrz1r/b0ZvNEcNSf485qaiQOStZ421GFkP/CrrlHfcI5Bjoi1u
         40t9ObujkEO82G/kTIYWgHT0uR4AIVhhfSnWIRyNU0jFMF9QGF1of5VJFf6lZPidc0+4
         Y7zYA+2NWaGc8BjT570bNqp8ur5/iu+1wyK9evUeGeIlwBf++1dy0jhR3+UTQt96Wrjl
         rc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142848; x=1776747648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/V6Rs8rcZ7PWWMWLKnxm5Zkp3zsUGa7EcbO4a5GtxCs=;
        b=TNRkU+6Vxo/K3vZyqnmyLY7lqC1YKDIQv37HTBbHs+sKpyRkR3bL8VixOPWfqqM0Y0
         5v/gJKtC0XqBI7mUebjVyq7X++xzoBLPsagr2Y9CNg/7kB2TcRajXMg9OgBi7cuaFaTi
         r5coyvIcmFua188yMBiXYXgtDBosRGqud16IZHYahhxj2XQyTkrfCAPRp188xpxEBLPp
         hUys6mqDTeJ1RVY5fwhkZ9LcV9NKWU+iVZ7uOuqCWEs3B/N0KYLROn6EDMLR8DSnzPSV
         uHnTWeko+RVdRwI8cozQnL1o3MTx4XGn5PdX7YQxc+Nx8UbpynlmDl3S4vqiJgwESGtl
         607w==
X-Gm-Message-State: AOJu0YwqN+c+zr//MrMqfNucimti6MVliDlzsn6mQD11KsLGm1wcnC4V
	C4n7Oz0QUdk0xkl/O9oMTbu0GVXp2H4WOr5WF7XuTe6HRQ5+nR2IHvA0E9+5aGWmCi3le8LMT4D
	Teb2PatN/vG942/SAYbvpQusJjft0F+Akbc5lGpTn4oscnPyRBqgAKMHOmSuStFF/MQ==
X-Gm-Gg: AeBDietdUREGIIF28XRi97QItSdDeyIc7emib7BZ2+muwbQVjDJ7frW88XZMlFBhE4D
	Wa0sAcKXHgUA+LXs7MULGDtIV3BVAtDC2lKD7SZDPmZBCmAR/+o+jWXEoH3TpET4jFuRyd1MzxS
	0Vx8e8+7ujd4WUQ7hnCSCrjZxH4kc90cyRo7TXkP8b5oObSWCIwOJ+IijtyiF+FjHZAR+uNaGQh
	LBn00nJDMvuhCVcGTNYy3ZtAESIN/ZqBZWZqSH8Yk4eRRvQ/bvdH3uur8qYKXO66MPe3R15tGoX
	A9Solt+Vf+qHpZfvGwfw552v2iwXLCJNkMeCXVNvxGOcZCjWPJptrX4A+5XGw4t/DS1xlXTvnqA
	epvU7YCZGFgZ6r04j44wyPWfrrSfDSy8cNHDpHy73B01vPAUlr8TUv0o=
X-Received: by 2002:a17:903:4b0d:b0:2b2:5597:bad4 with SMTP id d9443c01a7336-2b2d5a69f1emr147906785ad.30.1776142847498;
        Mon, 13 Apr 2026 22:00:47 -0700 (PDT)
X-Received: by 2002:a17:903:4b0d:b0:2b2:5597:bad4 with SMTP id d9443c01a7336-2b2d5a69f1emr147906225ad.30.1776142846873;
        Mon, 13 Apr 2026 22:00:46 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:46 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:29:59 +0530
Subject: [PATCH 03/11] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=3016;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=i6ZmiIhYyteEX9ku3DC5s4Wu1KZIwZCobr9Vm2PQ3dA=;
 b=+2+NbB6zm/k4yanN1JURhnrXB+oAf2ZOIVM4jw6hSDlg8urxTn2L1XRBSID6qg9Tot7pjAl7Z
 FeYY6PQsmWiBH7fqg1XPOijE2WBn/Q5eKdptaSAHhJBvzPYfJMoBCzA
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfXxgE/wW+icrNC
 KHGIyFQxEs0CsTAGlS+L8INzYSRaMWIFKO63NIlGq2oJaYfQoXbdIPGMPVbv5nMh9335XpbZmVE
 zTQoVZPwnvxeIyOy5sqDsi79yPpMJqfB5flYn9CPpKSWrcAmzVn1E6Lxd5b5ahKBFpkW4zco+38
 nuSvwLSH9jSQikFSqaH5hVSPleo8hxdzgWsdmXMPMTC0xge4ATuTmUMp6bSauna8ZcYiA6qHJMz
 HBS4iqOLWTlz/yIHXEbIvYshyLSEdOGRFqKnezgVYgR2c9kfpi03VwpN7E9Fv2j7GYZYdFdzTDm
 UE6tcaVxENcHO45Q1RMBr86KTngOqt/R7+6PNaShQMHdIOzibdaULiqs8OCmEPhDIJI6Zld85ly
 t7LLlfSA+3IFtNY/xdFgF48WFjcYAC9UKFVj/9xQWvill2wY9wqi1G4akmfjMD0reP6T5CjPgIQ
 e4ruRbn/V7vBXASs1+Q==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69ddca00 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Uu4Xh7xNeq6AZRsRxPaKwJiyz9XsWO8x
X-Proofpoint-GUID: Uu4Xh7xNeq6AZRsRxPaKwJiyz9XsWO8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58695-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E84503F59B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add init and deinit hooks in the platform data for context bank setup.
These hooks allow platform specific code to initialize and tear down
context banks.

The Glymur platform requires a dedicated firmware context bank device
which is mapped to the firmware stream ID to load the firmware.

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


