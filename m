Return-Path: <linux-media+bounces-57730-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOBbO2p6y2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57730-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:40:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FDD3655CF
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 128843008242
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EE43CCFB5;
	Tue, 31 Mar 2026 07:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoTO6+V/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8zIECzH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2B3CD8DE
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942811; cv=none; b=hsMbLjUpxNAHToOjUgbdkqquHPpE72Em49OePgDImZEghoNEVN+Ajr5mqumIU13ZQPbtN69zqUYqJqOhCaBz6VJgWHprPpJ1tpYSO7W88HwHvB2JZN+ltZGnmdrnwvDAKQTauex0ZoLlhmzbCm8+Ri7My6nBE5/7vuZDnZz8BIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942811; c=relaxed/simple;
	bh=IJVGYieJGPFUQXXMPA2+Az4Owd/nGNxNkkhNaqq24GA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=baG7fDjXxPa5ZdI7j5+FKJX9gLynyhjmcp1rczhjMNvJkXRygIKcUM8+d2i346m2zpGXK6abFb+iAzwP/FpDP6a62QQuLa9yNYTqcpLejGpq2AXa4Qy3vbTihyq7So4InSSD6GYke1oSDSdu58yb6COVnDTxtz/QUTFSlOFBpwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoTO6+V/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8zIECzH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6xsEs2164238
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OoPs/pRzXx5+0DV6kkDYwpPjNriZnITrWcZF/HOHuag=; b=KoTO6+V/PbYivYtD
	zrcu/fgqQJcYGRgsyjRROst0Ul8YAbN4r/0VNP/Avc8YZnGOmqxcbgXCSPWnE5m8
	TZQc+2z3Mh/Qh5N6U7KlBxGCHn1wVNmJ3jnXWHIAQilGo9pwv6PdpOOdqIG5VMZk
	hrHvxgyc8Zkcv+5vPhAmWcYFMS5yDgUEQeFQUpfVRef0iOBS6enPx/6GAFI8mLwP
	eQCHrqQcF9pYjuXvY/kQLzeBDs0PeIW95VIP2w17ISijtBzjIab/mwfiAQBDWuqH
	jwZGKzT5Q69wTyO5NgnseROfLd8OukCyzYK6lWWvtc63tiw3uWvwS6UiK2MVnwXF
	qdY0xg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga05dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:40:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so3407272a12.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 00:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774942805; x=1775547605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoPs/pRzXx5+0DV6kkDYwpPjNriZnITrWcZF/HOHuag=;
        b=Y8zIECzHrA3LT92UGKs9LcwpEz1MJXi8Ha3dJeuHPXwBBx1WsZcCqBAhYsR7z97UNg
         Qy261rgqyUTUMb4BZF/mQrfrormp1AaCfHA8Cye4jKNom1IY3ZrxE8Udwa586wOK6vFp
         57noa4Od9mSySNBpjMMcZMD/mEgCxACJkYLgzj5m8iGujaIppOKZfJJYj3wB9vaQFYoD
         PQs9BYLFrvz7tV02BkEKg0UnE2vfhg+Tej4I4j+IsqvwZWFysmk5FCUJ0pGwjuvX8+3d
         vPuyUG2JHS5ZpUgFKkZwElIPS07oLLMCl3k/cjK1Cnsp9ydHOrWgJLkVnRciI+FAL8ZU
         /0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774942805; x=1775547605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OoPs/pRzXx5+0DV6kkDYwpPjNriZnITrWcZF/HOHuag=;
        b=soZRqJAyqtmZFgV5jjLIQCs29vJjlTaY7i3MCHKnW/M3B95da33h4CO1m12PCntBB/
         +CCfnBSUwNIKhtcr24n/o58qJLCb61wClJukgNH4OAiyFgSfv2erpoVnwVmP8VfY1rkm
         AjRW7ouyrgnJxWPyqWtRuHSj5V7eccjE01WusA9KTCZNBzM+DVafFMbrI8qN/RcA3q53
         DtfbTGohVNzq8qtY6HkyzFyIPAI4Ed4by/CpEYs3YqGQ3HEdTwzaCxFYcCzTVGP5ulDN
         UMxVA7mQzfSblwgE/vGrZGl8kBcgSnrNTcGNtkM3fQ0I3DF3qT/T4Ww6CjWY7ycBPLdl
         4gEA==
X-Gm-Message-State: AOJu0Yxf4IRG4sHqm9ueIff44TC9ovUqIpoDThGv3i/J4auXuDsCRtjN
	5QjWg9chY8b/q4VceNmDzVW1PuavYXyrZSRYhf9+KCqCu/c+AepqfM4nr5iMe5ssZUh0GOjDfMY
	q9htaqe5UnegBX+KocVFXX1ACAnmfmyMHyELaj2Io+bfF4ZfpFDa5lQdgKCIvldZ3Hg==
X-Gm-Gg: ATEYQzzmQoHWEQb/N4PjeReciQKbajTjMnFva0hz4MrAShBxck0c6Pyn+m1mj0MKKqY
	7S5zsskiMscWpbB2gfwnU7G2CRbmW+AS2yv0gX+E7taHFcvBUnWApjG4+mSEIUaUPb/WhSralM9
	q8v4oND47fgobwhgnVdzMnVIPxp9A7X2OzE1ZMKHPJYXJzFXraA/ALQ06yr6gyuI8Te4z3pvYBZ
	lz+FltI0Pe7DQkAIQfi2heeRhjUwhS4rkOyUKJ6kWFZ96Z1LDJkNFfq01BSnp6xvVCeYV/editU
	ez6Mzc6VI+ifzV3vHvCAB14bYdxMSJ8nJuFWlctO87PjelxZZGT6wQcRkT7Qcacpmr7eq7Q3t8e
	0+3DX64ZEE6h5zwJKCjWjVCvKrtkwwq0XNSya//ABnPZ9msvaiYY0QbyzOjk=
X-Received: by 2002:a05:6a20:3d08:b0:39b:edcd:d92f with SMTP id adf61e73a8af0-39c87849172mr15954988637.11.1774942804676;
        Tue, 31 Mar 2026 00:40:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d08:b0:39b:edcd:d92f with SMTP id adf61e73a8af0-39c87849172mr15954953637.11.1774942803884;
        Tue, 31 Mar 2026 00:40:03 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916baab6sm8013076a12.2.2026.03.31.00.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:40:03 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:09:55 +0530
Subject: [PATCH v3 1/3] media: iris: Switch to hardware mode after firmware
 boot
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-kodiak-gen2-support-v3-1-958296fab838@oss.qualcomm.com>
References: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
In-Reply-To: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774942796; l=9610;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=W00eNf4MKHWhC2JzGqOh3CVzD4wB6M1OX9hGCaQXRy8=;
 b=S6Y5WIvIO8HjhpxK7dugndmBcmeoIAWO6KOSPdy0N2NNdAlpRC6Xx5oYuLfJs+TnUM2GVOg0g
 gfoStHT0iTPDxOxYxqib/wZrHTzjmJ+ZJg4OhYlWE+bw5PLsIjuLmA5
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cb7a55 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8QxTX33zP25rWUhdfb4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 5N_q-Hntj5m7wyGQOAwA9QA5IyXrBHHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3MiBTYWx0ZWRfX2zl50L9ZnYbw
 NJ0bT5a8b79ZHE6Fg0/nzQxetRKTdHeIF8Se/q77zeyGXQxIH+N4FutLHGluYZMD8Rrc7yh6X+m
 JXSaJPyGGLe8ctgg54BvtrWxYoioKR6dXnEqXCt0RLZHNFn9aGbMVHoZAhQxRsNO2Zaw06NhweQ
 vVLFGaHJgJzK91Fp752UQnOxYPqQXzay/PZqkpuU711HR8XCJnrLI8r2xoFpiZ91Y8aAPTCixMI
 OHekKVldMAEaXUUC+73UHeWNyilnszypDRdW8GONWYBEkDduE6yx+HAxZI8lJh3p/jEtDPoSpty
 65k0bJv4A035vFhRQ9wCVKNM8ceNfLSkR70UL0Qi+8DVmMGxMvkerDQiHX6KhS9AsI6T97IphmF
 JWBXeTVhrKTGWIFehYMjpFcR05nbVMp27qOfSmvTZI2V3Qh9YyL1RXgeFMh8zpKlUFMso2tTkOd
 16EXg+Oc31Drgg4FMFA==
X-Proofpoint-ORIG-GUID: 5N_q-Hntj5m7wyGQOAwA9QA5IyXrBHHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57730-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6FDD3655CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Currently the driver switches the vcodec GDSC to hardware (HW) mode
before firmware load and boot sequence. GDSC can be powered off,
keeping in hw mode, thereby the vcodec registers programmed in TrustZone
(TZ) carry default (reset) values.
Move the transition to HW mode after firmware load and boot sequence.

The bug was exposed with driver configuring different stream ids to
different devices via iommu-map. With registers carrying reset values,
VPU would not generate desired stream-id, thereby leading to SMMU fault.

The efuse tells us which hardware blocks are actually present. If efuse
status is disabled for a block, the driver will skip powering it on or
resetting it. otherwise the driver will perform the necessary resets and
then switch that block into hardware mode. This makes sure we only touch
hardware that really exists and is enabled on the silicon.

Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |  4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++++
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +++-----
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++++++++++----------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++------
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +++
 7 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index e6141012cd3dda7e029a5659dcb3048a23cdc150..1f326f696d08014f5ebfeb0b99cfed70665fd6ab 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -74,6 +74,10 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	ret = iris_vpu_switch_to_hwmode(core);
+	if (ret)
+		goto error_unload_fw;
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index ad8e4ecb86052d0c4ec9338b2874293494471bc2..8769ec61f11769e004945063381d9baddb302b06 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -159,6 +159,10 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	ret = iris_vpu_switch_to_hwmode(core);
+	if (ret)
+		goto err_suspend_hw;
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 9c103a2e4e4eafee101a8a9b168fdc8ca76e277d..01ef40f3895743b3784464e2d5ba2de1aeca5a4a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -44,4 +44,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index fe4423b951b1e9e31d06dffc69d18071cc985731..3dad47be78b58f6cd5ed6f333b3376571a04dbf0 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -234,14 +234,8 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
 	if (ret)
 		goto err_disable_hw_free_clk;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
-	if (ret)
-		goto err_disable_hw_clk;
-
 	return 0;
 
-err_disable_hw_clk:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_hw_free_clk:
 	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
 err_disable_axi_clk:
@@ -266,6 +260,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -274,6 +269,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_off_controller = iris_vpu33_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +279,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index a8db02ce5c5ec583c4027166b34ce51d3d683b4e..02e100a4045fced33d7a3545b632cc5f0955233f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -252,21 +252,10 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 		ret = iris_vpu4x_power_on_apv(core);
 		if (ret)
 			goto disable_hw_clocks;
-
-		iris_vpu4x_ahb_sync_reset_apv(core);
 	}
 
-	iris_vpu4x_ahb_sync_reset_hardware(core);
-
-	ret = iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
-	if (ret)
-		goto disable_apv_power_domain;
-
 	return 0;
 
-disable_apv_power_domain:
-	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
-		iris_vpu4x_power_off_apv(core);
 disable_hw_clocks:
 	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
 disable_vpp1_power_domain:
@@ -359,6 +348,18 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 }
 
+static int iris_vpu4x_set_hwmode(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_vpu4x_ahb_sync_reset_apv(core);
+
+	iris_vpu4x_ahb_sync_reset_hardware(core);
+
+	return iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
+}
+
 const struct vpu_ops iris_vpu4x_ops = {
 	.power_off_hw = iris_vpu4x_power_off_hardware,
 	.power_on_hw = iris_vpu4x_power_on_hardware,
@@ -366,4 +367,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu4x_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index c6cfc1d9fd9ec5a8f69462188a03aa5cb4e1cee9..7bba3b6209c2061dce72facab7c2b58d6b3bb9b9 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -292,14 +292,8 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
-	if (ret)
-		goto err_disable_hw_ahb_clock;
-
 	return 0;
 
-err_disable_hw_ahb_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_power:
@@ -308,6 +302,16 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	return ret;
 }
 
+int iris_vpu_set_hwmode(struct iris_core *core)
+{
+	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+}
+
+int iris_vpu_switch_to_hwmode(struct iris_core *core)
+{
+	return core->iris_platform_data->vpu_ops->set_hwmode(core);
+}
+
 int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 {
 	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 07728c4c72b64bd15f4e4fdfdce90a5d4d6e9d3e..09799a375c1426d808ab5ea4fdfcac3a203e15b3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -21,6 +21,7 @@ struct vpu_ops {
 	int (*power_on_controller)(struct iris_core *core);
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
+	int (*set_hwmode)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -30,6 +31,8 @@ int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
 int iris_vpu_power_on_controller(struct iris_core *core);
 int iris_vpu_power_on_hw(struct iris_core *core);
+int iris_vpu_set_hwmode(struct iris_core *core);
+int iris_vpu_switch_to_hwmode(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);

-- 
2.34.1


