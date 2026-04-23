Return-Path: <linux-media+bounces-59413-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPUZG2kf6mntuQIAu9opvQ
	(envelope-from <linux-media+bounces-59413-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:32:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E4452F9D
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B07443028667
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 13:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712BC29BDB5;
	Thu, 23 Apr 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQjdEduo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gzUyqk/1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF02773F0
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951046; cv=none; b=N4pDcJEk/AwEJD25056KhxeAiya3UWOAwc/6yUDW4co/d/M8nrJABVkaiafPPM/RBaTBGCOIzAsDoZ3aZzNBVMkiMdwwkQxHHV/QTJdLZBhzgPRGE2SH73UY6KQI0KZnNJ/FRSyHBQvuPI5e9rC+WeIty3ikDDXOU1Zfe7LRm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951046; c=relaxed/simple;
	bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxDjZReucNF2rbst3FubdJzW/usQ3a3RGiACLGoTo0QYOZjNYwJVvITOEcur7JOr2TXUS2pY2yM6RB9lIIK20ANRhFOGAcq1d6Xq6lmjy/KftXrF1jAYDap/vb6dFYALERxvpae/WZD67HsVsxs2MPHBXCpEOrnZA60psm21Gtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQjdEduo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gzUyqk/1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NBwdQQ009834
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=; b=JQjdEduo3jUB4J80
	UxY01Cnk4y+htGI6K4HB4Q9VDGH+RDJj4KsPymFhpf7PdRne3+z38qSjHKKdTCTI
	maE419NrLKzQIFyJf80l3FKqZANQx+9NL7JKfQQHU1+o1rKZxXuy82M4oLkjzL8N
	jN9t1SdVEGYdvdegpuVRKFp6Jx7PbciC3MVFdfDNs1cwXyCDIM0kAOaSON+6dEbg
	5URf07jh1XQ0GReKmv3koAWR9AfJUeoyqq/4F4qrrVz0Tkb1rrJZ4kiXluiwghpb
	Txi5+QjMDdGLFLpydNyXVjC1een+SDhfTCXse8e0xMENr3xxdMdvW3qTppJ6q1gi
	drl6iA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqk178a93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:30:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249541063so60388995ad.3
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951043; x=1777555843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=gzUyqk/1ozYMZYJqe5SAejOEUUO8FLD+sL9sAyefWixcPLlpr5P5HKFpweEyz9z/qX
         Hu9wQ7kaFTAkKUEOq9KhHZn8K5GzT5kiytx13esIjJE5kDwRYiMSQN6mW+UohKa6ldy1
         glbIDye16ryiyuPFIy8OL1BUcTwWKAQvKqsQsDM+9mfek/ycAtsTfIcdfTUcxSZgyg6c
         mwz8TrC2twGsr6zyHUMuNg98rt+zrniEs/7qUvzEEahFjJMj6IljBHOAwzgD5nvaYsFt
         ty9pdXzPTh3SmYScLUy0RoICe9sdfnceH3y+/YNGhmLcIDMLCKnMsSDH7SMEjHXWspa5
         xVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951043; x=1777555843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=JmBMKDqWXw+QBp/4n1S3v3lCyBj2o0japX+BE+fVKq/W65r05xg+J/LNwcucJ62MtN
         /xb1j4/U+uCpInNIdM+CcC9dD2N44AQY3uF2EiH8MQ7cFpA/pDc8c1bkgCQbzuZSvebq
         c7v6kaOi1xeritycprH42v+OdKeZU5szcd/Sps1oHLRdAnwBMiOL5WObVQ6ApYe0Hbdf
         NDkNgr7XrmFcukbEtvGojqUpTQNJpV61x1Khb+859KIO6Op+UaJ3DRVXpEX1Jeli5zi6
         aajPfFYpwR9gwzE2qkpTm3w4kQDqgkkRYTFiXTNH0hddVO7bbo6zSTWPcUcMz0GrWCs9
         /0TQ==
X-Gm-Message-State: AOJu0YyqzTzKELFtKcryqnovdTWpaDqJEoMO66+NpCFfa2ye9/qUZXl3
	aE9e5suCXQbFLlQeBsqq29bJtkXb53Rrc8vZ0bxbsK/Aqp9vL4AgPNVE857pC4UxmyqQxQ5UR7a
	AMRtl4ws87Oerw/C2d3WdiyZJY0hGy4ndCv2XGXxrkqr9Iq5OX2kP4/xHAHgcIZ6KcA==
X-Gm-Gg: AeBDietue2b6Bv77olbwn1Z3ROTx5k82YGllM+kKs+pAJ+wLC21itnJOeCeme+rigST
	opN/EEO62Wh5xGfqalQ+BabVMGx6jDUzN6b6zjAZwtDJm7FOmddif3OnBFrUo75SBcw/cAGXE50
	b+Tzve0RpVMS3ARRzm4t6WbhJOR8HE5be/0OymAmKFIspsz+Qkz2gLJX14qoSGrlTsXNRX+WrqE
	KEnx9Gf81Lvs2y5tCK5Psz+dIEhb1En0u87zQpr6Dh4ZjMq5i9IP88mryRR/oWMYRBzPRehBMW/
	QmKMaJHjHAseuTwtp2bFfgYYBEvvlLZDDnOJBeCcYXQ+FIGyg7JARWkpL8zaOmaVS30sJHh4tbm
	rsJGWd5n9vT4SXc9tNw3F9pIGsCTjoqq0CIeiYlnVfBRgc90ztZEg++E63U9GBUSy+Q==
X-Received: by 2002:a17:903:246:b0:2b6:309:9f72 with SMTP id d9443c01a7336-2b603099feamr251902055ad.21.1776951042383;
        Thu, 23 Apr 2026 06:30:42 -0700 (PDT)
X-Received: by 2002:a17:903:246:b0:2b6:309:9f72 with SMTP id d9443c01a7336-2b603099feamr251901185ad.21.1776951041662;
        Thu, 23 Apr 2026 06:30:41 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:30:41 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:34 +0530
Subject: [PATCH v2 05/13] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-5-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
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
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=3016;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
 b=gOrXRuyYOx63Ro+9sR82pXcBF5nq7YQVv4DGUiouKMpmgBheyBYqtRlAtDz0YtwxU4xK4b9hl
 ZU9S3UONyzDCyAMpp7MxY5zrCrXMGnz4RUuNOm3Zcit7fSDGObuuaq4
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 57kUSHqwx_s3iKEB3hdBoL3Nibtn2HhG
X-Authority-Analysis: v=2.4 cv=R98z39RX c=1 sm=1 tr=0 ts=69ea1f03 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX5uw4qXDdg/aA
 LTlrsgJM+EDgBPE6sjsKwNk2w1P7a0eRCKOuOq+42eW02MklYG8l3dJzmjiFGi7eNdcSAdikOBh
 wmWkyW0HXQgfhVnxJLnl+cEGW1OzDXEuPjQISaphAP4wA2j64kQOjtXmoY4G9Q50Eab17Jafk+l
 VprKGUYduN5F2S6TKGg48ZHlrhbtndTJtYLP05oEMDMOHMpnLbEe9PnPPAojMlL6Mdf+kJAt/88
 PIkDKGNLCDs1vsq9KfWUjvErEaGd20g/Gq9CoYibr4BIydpm6/waZhe5mvglm0JgJN5apr4aX8M
 UiEPM1rmpoIjSFkgM1BxMymDRFVjKznMFafIbG8Jaw+J7Y4GxGJVRJpU6GM4phQ/GlU52/42A3c
 +NkP3a3thEy+nkBuCVSiKWQg6kkZp0Y5WChyLj0WRgNvsgr99OzQIVqt7bU8HzM9xv++sxfmJ6J
 05NWqutxcMM8B0C/hEg==
X-Proofpoint-ORIG-GUID: 57kUSHqwx_s3iKEB3hdBoL3Nibtn2HhG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59413-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,linuxfoundation.org,nvidia.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 390E4452F9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


