Return-Path: <linux-media+bounces-60510-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHevEU/c+mk2TgMAu9opvQ
	(envelope-from <linux-media+bounces-60510-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:14:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D66204D67C1
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BB213022067
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 06:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883EB30BB9B;
	Wed,  6 May 2026 06:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4x/QAo/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vttv5ih2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89187306D26
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 06:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048060; cv=none; b=KPfk73wRfwDW449l7jqxwWiIGDLGPcTimuCuu/RaNlP9/w8wOVhkfhMOPqD36210K7h8mZ0uUyDNhWlEW28TPZ+UjVWOZLKzet+wstg+SB79cRugD7Q8ViVcRm/eEFCjYRAaE36iRg1Jv8NJDsH25UkJUDQm2ujPT9zYY/gICR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048060; c=relaxed/simple;
	bh=smEiRxOgi11Xr2p8jI71waa27vIxV23tX+FO2Ka/67Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iMnQEE5eYWgA2GoVpQqK7CtDoOpj7vk86G6m/YHQRHrI59zrSwIXxE5LlJYA/FmMUUDBJ0lZ/TKkW2a3CD2XhQAmm1DSwhwQZtprAF7SYVuzauXAPGm8i8J7vZ3LWVh7N0DfrFwNQIZV+3Jvm8L6TEz/u7NYeki0ZNdXCeUtRWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4x/QAo/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vttv5ih2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6463HI153091492
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 06:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bBf831aLu+3Yriw1g39FNl
	0oOafhV7FpPuP60SdHg7o=; b=m4x/QAo/qCbJH683vu48qgq4aOx+9z6+/GHpEL
	PnnUMNsB7cLY0a2y8YglVdK12lVIxQGVP48MIvHYAv33gemHCiMdd0L7/o+uALQs
	TQW2kJRdntN8L9FKDg6HNA3fNVL43cRlkWP6I45EnMu7FFwrcUHZsMGAhM/CLK5u
	GcXwWNA34TathGKDH2+5UNLtG4azDkXKHfrFxez/mtLZJQBZtGpVnugioujcDGJz
	rc7okeTIVqTBC/+xJNRxahUp063ZeXUPKraSJDKL/r/HgN3yNibYuv6MoxIPqY31
	81cbGJpZ4GFMacH6uOeJqKYLcQ19bb7QcJDsgw/w9zoLSx5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct3vh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 06:14:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36512c65928so3977153a91.2
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 23:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778048057; x=1778652857; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBf831aLu+3Yriw1g39FNl0oOafhV7FpPuP60SdHg7o=;
        b=Vttv5ih2uUySYyDVOTENoVkpnFR5/wZTZe7U3UDO7SjaMaAzIwkFdtFmjWo5U68WfU
         OX5C73jtbO11T/y6jCefPshgrWbgk63nb2supBD0nOvvJOLsdtcBxVJ3CzL5MzaZ78TI
         rM2B8p5nsziJ+O1tAEiXw3IyMTOHUDgocyGaMYYueEIFscLf/2WIO60baOT+zDEAqOJX
         OM14ELZWd2Mq51C8yYKc6QD9c3XarRHMdVqmvXZ1fhInYYubddHWn6uS7HxXiUY3tfeK
         VCKbJZbahzL0y22zCOMUIdl4z95kv4y5C1uA/oTjTj9pMteilPMId5aY0YqdyCIuIuoc
         miEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778048057; x=1778652857;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBf831aLu+3Yriw1g39FNl0oOafhV7FpPuP60SdHg7o=;
        b=shas/T+d2d85sS1gAWUtz024g98T70dUw2D0V+bOEf9mzqrP+hTHItiu8JRO/tQ0n5
         JNJ8i/Bt7KI81W4atz/gHlrAaqAkI5Fa/Y0ZaruZR3xNUOp3Axf9BSF0e7eiEola15GM
         KyX/cVW8FEoZPEyFdpjDF0PNqP8gl3+w3YTfNe5Vz/gUXq/Pnz97ZOKE/lGxOS9Bzbq0
         D4Z8VBxT+RgIq8M8s2Qiwteu925So1N2kPqY8J3oSKdfoQXGYdoTV3clUjRW2/2Abrwt
         qDpG+WzBk42FWMXatIeF2jByBaQ/bFhlmgrLp0i5Shwnk3d99Yh6huKjaqJ6UKrtjhFx
         WwCQ==
X-Gm-Message-State: AOJu0YyJqxiktqqopXeF1wCmBo+Kk94/MpEQ6736HiEgO5HopPl4gxF6
	FfMDbQETpC4lD1Ya9jkxlYoQ9UvM6hRD74bbIqRoGQlNuG7OK/fJNbE6/ATkRzIO20u7ZLXxwJy
	G96jkOtrnnygxg+2o5AyDoHkpKCo3Mxrcwg/2DXvKz/bUju5tu2/IbSuoLSlET4YXqQ==
X-Gm-Gg: AeBDievyE8xeAqKgWmJuLTY50WmccZ9PRRUAfmOEYSBQhUPvomxu7YbtQf71U2eAXTd
	t+egOBIjB9R/8k/endeTTAsCaBmajFNVgqrEkjfXAnvVC++k4rta/DKpBxjia4Qg04byATWIDzn
	tQ7QkA2FkgoYYHSG5jWLwltRJJM+ejzTur89127U6LeV6h1/x4TCLz/oeXcurruHJDl0HT+ahLy
	/9J7yiCq/Kb6upsCxoYMBiA8S5qRHON1XQWO4rJSYIVJyjEMh3TFFGcPGnVHjPpRIVazxkM/DZs
	6pg/qtcW2Do1lNJfTKfQHSYHv4q3zjOohqaBnTf3KI+kjdt8oNfBfZCO7mZwOoK0g0ORw7aRrx3
	BjfjR/yNwJ0B9Rji41o3CVzj+4SqPIth/GdDeJ/g3xGZlGcn/8cDFA89UudMoL/fZxA==
X-Received: by 2002:a17:90a:d004:b0:364:edd2:812 with SMTP id 98e67ed59e1d1-365ac7a440fmr1921596a91.25.1778048056954;
        Tue, 05 May 2026 23:14:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d004:b0:364:edd2:812 with SMTP id 98e67ed59e1d1-365ac7a440fmr1921556a91.25.1778048056301;
        Tue, 05 May 2026 23:14:16 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0158007sm578290a91.0.2026.05.05.23.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:14:15 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 06 May 2026 11:42:07 +0530
Subject: [PATCH v3] media: iris: optimize COMV buffer allocation for VPU3x
 and VPU4x
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-optimize_comv_buffer-v3-1-c1b4a44e4300@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALbb+mkC/4XNTQ6CMBAF4KuQri3pD7SpK+9hDKkwyCRisYVGJ
 dzdwsaNxs0kb/Lmm5kE8AiB7LOZeIgY0N1SkLuM1J29XYBikzIRTChWCE7dMGKPL6hq18fqPLU
 teGpBc6aVlooZkk4HDy0+NvZ4SrnDMDr/3L5Evm7/gJFTTnVtrCgaK20jDy6E/D7Za2r1eRpkd
 aP4WCUrflgiWcpIbWxpgOvmi7Usyxun/Y99CwEAAA==
X-Change-ID: 20260421-optimize_comv_buffer-ae7107673609
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778048052; l=8555;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=smEiRxOgi11Xr2p8jI71waa27vIxV23tX+FO2Ka/67Q=;
 b=AghHnqzMx/+vD0ootMVUbx1T927+q0+czzPTpVSs2kzDo+aUS3U+tGxwcn+r0sLhSc3hZHd3b
 3kF3bgHjjL5CJzD2HPXuFdTBsArsFmbFG/Y4pfTTDp9hN7fRTQ90/8H
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: PwgirkYQUjxIZfniY6KlrQSfEhfBXDVV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA1OCBTYWx0ZWRfXyrELwqTrQx6Q
 AUe+g8M6omC+adivHwHuJMRCSBM+tfNx1Eq6Bx77c7SP1EGIdhYOM8yV2/rQDO4xStP0NFXgBW6
 gngo6Zm6xyd2PGuG95Tu7G7qQ5tApfiDJzBjBFT8B54vBPZXR9/61CfANKf0F2ApuQVHJCWkl+e
 1mGbRD8yn9jE5L6xlH0JH4H/6H8E74tRQEhqXhENxhAhc3QvduxUSrQYS2rHa+SCHY/j/dwxzLa
 jhzNZQctmxYAT6sscYZyHTcRpK2xJd+2zzFDkdkrqDD4I+Shi6iEKuAeyLLpBeIxKiqDQ6qEI//
 gr5nUfUTYSmcrcj1XKqs3LAw7DQwl7iMlHFZXrcIyy69qxWx0fUOs+If6OSygqSGOVpWNXyOkIg
 6F86vvnp6aH2T+ceaapWPDkDwWSf4miMCrFlpyE81pgp6d7FY5hnKtvOZy/WtJJ8ws1SrvTqKHS
 EgaC4rFaYTSAqjFxlfw==
X-Proofpoint-ORIG-GUID: PwgirkYQUjxIZfniY6KlrQSfEhfBXDVV
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69fadc39 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=16A-JgH5IyFuikl4TKUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060058
X-Rspamd-Queue-Id: D66204D67C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60510-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
num_comv count unconditionally when calculating the co-located motion
vector (COMV) buffer size. This resulted in an oversized COMV buffer
allocation throughout decode session, wasting memory regardless of
actual number of buffers required.

For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
replace iris_vpu_dec_comv_size(). These derive num_comv dynamically, it
uses inst->fw_min_count once the firmware has reported its buffer
requirements, and fallback to output count during initialization before
firmware has communicated its requirements. This aligns the COMV buffer
size to the actual count needed rather than always allocating with fixed
VIDEO_MAX_FRAME value.

Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
COMV size calculation to use MIN_BUFFERS even before firmware had reported
its actual requirements. Fix this by initializing fw_min_count to 0.

During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
to 6.16MB per decode session, significantly reducing memory consumption.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Update num_comv from instance data instead of using caps num_comv
  in set_num_comv function to avoid wrong value update during concurrency.
- Link to v2: https://lore.kernel.org/r/20260504-optimize_comv_buffer-v2-1-69379a59e17d@oss.qualcomm.com

Changes in v2:
- Update commit description (Bryan)
- Update hfi comv buffer count value to use actual num_comv count which
  used for buffer calculation to avoid any overhead or fixed values (Vikash)
- Link to v1: https://lore.kernel.org/r/20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 14 +++-----------
 .../platform/qcom/iris/iris_platform_common.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 -
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  1 -
 drivers/media/platform/qcom/iris/iris_vdec.c       |  3 ++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 22 ++++++++++++++++++++--
 6 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..e53b1fca98bd 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -10,7 +10,6 @@
 
 #define UNSPECIFIED_COLOR_FORMAT 5
 #define NUM_SYS_INIT_PACKETS 8
-#define NUM_COMV_AV1 18
 
 #define SYS_INIT_PKT_SIZE (sizeof(struct iris_hfi_header) + \
 	NUM_SYS_INIT_PACKETS * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
@@ -1207,18 +1206,11 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 
 static int iris_set_num_comv(struct iris_inst *inst)
 {
-	struct platform_inst_caps *caps;
+	u32 num_comv = inst->buffers[BUF_OUTPUT].min_count;
 	struct iris_core *core = inst->core;
-	u32 num_comv;
 
-	caps = core->iris_platform_data->inst_caps;
-
-	/*
-	 * AV1 needs more comv buffers than other codecs.
-	 * Update accordingly.
-	 */
-	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
-				NUM_COMV_AV1 : caps->num_comv;
+	if (inst->fw_min_count)
+		num_comv = inst->fw_min_count;
 
 	return core->hfi_ops->session_set_property(inst,
 						   HFI_PROP_COMV_BUFFER_COUNT,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..2cda8cbba8d6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -95,7 +95,6 @@ struct platform_inst_caps {
 	u32 mb_cycles_vpp;
 	u32 mb_cycles_fw;
 	u32 mb_cycles_fw_vpp;
-	u32 num_comv;
 	u32 max_frame_rate;
 	u32 max_operating_rate;
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..80222fb9da7b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -751,7 +751,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.mb_cycles_vpp = 200,
 	.mb_cycles_fw = 489583,
 	.mb_cycles_fw_vpp = 66234,
-	.num_comv = 0,
 	.max_frame_rate = MAXIMUM_FPS,
 	.max_operating_rate = MAXIMUM_FPS,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 61025f1e965b..3cfecae80d1e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -15,7 +15,6 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.mb_cycles_vpp = 200,
 	.mb_cycles_fw = 326389,
 	.mb_cycles_fw_vpp = 44156,
-	.num_comv = 0,
 	.max_frame_rate = MAXIMUM_FPS,
 	.max_operating_rate = MAXIMUM_FPS,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..bab5c66df2d3 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -24,7 +24,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
 	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
 
-	inst->fw_min_count = MIN_BUFFERS;
+	inst->fw_min_count = 0;
 
 	f = inst->fmt_src;
 	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
@@ -258,6 +258,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		/* Update capture format based on new ip w/h */
 		output_fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
 		output_fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].size = iris_get_buffer_size(inst, BUF_OUTPUT);
 
 		inst->crop.left = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 9270422c1601..7ac6d9e49584 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -731,6 +731,24 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_comv_h264d(width, height, num_comv);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_comv_h265d(width, height, num_comv);
+
+	return 0;
+}
+
+static u32 iris_vpu3x_4x_dec_comv_size(struct iris_inst *inst)
+{
+	u32 num_comv = inst->buffers[BUF_OUTPUT].min_count;
+	struct v4l2_format *f = inst->fmt_src;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+
+	if (inst->fw_min_count)
+		num_comv = inst->fw_min_count;
+
 	if (inst->codec == V4L2_PIX_FMT_H264)
 		return hfi_buffer_comv_h264d(width, height, num_comv);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
@@ -2025,7 +2043,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 
 	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
 		{BUF_BIN,         iris_vpu_dec_bin_size             },
-		{BUF_COMV,        iris_vpu_dec_comv_size            },
+		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size       },
 		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size        },
 		{BUF_LINE,        iris_vpu_dec_line_size            },
 		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
@@ -2098,7 +2116,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 
 	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
 		{BUF_BIN,         iris_vpu_dec_bin_size         },
-		{BUF_COMV,        iris_vpu_dec_comv_size        },
+		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
 		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
 		{BUF_LINE,        iris_vpu4x_dec_line_size      },
 		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260421-optimize_comv_buffer-ae7107673609

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


