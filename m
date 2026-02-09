Return-Path: <linux-media+bounces-52390-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL07N8OtiWndAgUAu9opvQ
	(envelope-from <linux-media+bounces-52390-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 10:49:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4337010DC38
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 10:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B12B730514A3
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 09:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99A9365A0B;
	Mon,  9 Feb 2026 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7aMd9R8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnPHagjX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434AB17D2
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630374; cv=none; b=BhTIalvXUw+Ky9doZGXGlrBAazO+ieKTQWH2+oHuqN7Yv/iCDHCwoIzLgsIzKUgsEahfDqscXHc34jLSeqjDTCDNC/2lupD+KAz/YWcVnsnWTO3nsA73pRMHbkum2wMYO/OnEGYj7QrhqJDq0xKAl6y8HQVjbmtu/dTDU2jzkMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630374; c=relaxed/simple;
	bh=d+IIsIi7kfuO/G+67G2tw1LdxeHxrkFVOKPANmKDm+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyfFVukrOjgXCCwsW0C+j43C8MM1swbn1pEGTc9yELyToIDfBUmsy7a2qd76Lr65//YHo3yOscpUJV/pKBZDPyz0h7n9W713E927G7LIGCMnkMOZNpw4UtQhm/TTlTcFbKMyJ0WzZTbCn8C1hMCW/UY5Qx/v/0ZL4MSqKXu2aUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7aMd9R8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnPHagjX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195RtOf3251831
	for <linux-media@vger.kernel.org>; Mon, 9 Feb 2026 09:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25cM4AyBvQDwMyOQmDFUD6Vsy45wjcF7vLOupDtJlIc=; b=d7aMd9R8cOOMCrSb
	qJ5FPjfLTsSJONwMaJeZ+9oKBd4dYmvUrDJ1hWUWBMDM+5A7MOJyekR+/XI58BxD
	RLm2k36tqyu/uihzltDmBArG1eLbHwReW7e4vKKRVMBc9WSRnSQsgkuctM1eN4vA
	KNU6aC+sKt5XIzUBDDbB7YY3rcAsDpqmgCyQl15JGKQeUOeAxOHRJX8ziGiI7AhQ
	6RJDyk4yxjC8zYzt+HA040RzISgSKhaMTIgD2861jyBBuAGxPnf3NOzEGrnkvd1C
	E/2jDEwxoSEFbPS8htGg7JFQkGV+urcU1EpHYAvUMjE2yce5bzKuQGP3iz8Rqy+C
	pZ/14A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79f68vsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 09:46:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2381ea85so73536175ad.0
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 01:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770630373; x=1771235173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25cM4AyBvQDwMyOQmDFUD6Vsy45wjcF7vLOupDtJlIc=;
        b=KnPHagjX19ua79ssAcNyPuKLxGoBXv9zpuhVJyc9SpzKHSVdljwJzsQvZWCjtUrwBV
         WiUe4eWgEkaLX1gtYSAXZLPediXH0Pikjl+IDEWfcyoMGMe/SsUCohGoTW/oVBI+ipGZ
         Bkxl0acJWofmww9mfK3XX0xUz2Iv+SnAP50w+KOM6iHRoHo0oaGVQfO8Q5cHHD2OzGG0
         eHk/pHCDjY8t5TvTVsQ9qz6bu/Cj7TIYHibxLesD8j++zcs601P3YpgrJhCK8HmDYetW
         T8cXI6NhdKLvoo+J8kdmNszBl+HOPhmiMTbaA9xO12PLw9Af+YU1jv84GUYjf8tM7qEs
         hGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630373; x=1771235173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=25cM4AyBvQDwMyOQmDFUD6Vsy45wjcF7vLOupDtJlIc=;
        b=i/FTpc49iflC2IOrqdyJOmErPhxyEBgIDbtzxTBqjI45utBgChfDT/G+t6IUJhKJel
         l0LO5kxzZn3BGzfGO6Xijyyqz0rPtodoZOdfKD7S3AKuU2Vp+5o3DyDPe8KHWmeWiwXk
         oqa+fBetGQm/2Gh2xcKSLY5tuZVxA6ig8z0e2ShtZ44NXcYmScYYPFFAS4AgV0S5NyiD
         3mKttNPSV3qFqdSG+OyZ+/RgmgK9XbMjRHNLGwx85o5KpQrlGCLznb+oo1RtoJ5KL3yA
         1QzK1sutS+9NB7QEcKpcxDS+tAbRpFU57WbRBRKMVujlTsdpSwgxRAhxmiTpYoC3DfJj
         ekvw==
X-Gm-Message-State: AOJu0YyV1rFT3SEXofxVSB6me0WhL1H/38mtmbeW5U5xbeEIauacwj43
	l2ia/cu5I1JrwedoeceOITlfJhZfgNuhurxI0tywT//TkKQDpkZ8YKZIgkf1ClXj8aS5jcMcbZA
	eS/QmGx7Rb0ZiotgupqwmdS7mQhDndiAb0QhSYteAtspaeAB1mg3QNDUQosDMrJT9krfdxcugNg
	==
X-Gm-Gg: AZuq6aKjS4YgEsckeqKHLYGsMise7eiROYuk1NRYyBSCXdzWL7otsQYJ/6cWgclwfuM
	Y1Chk/MaNVD1ODNse48HQ7qKTEhqAo+D1P67il+ewFlGy/zHr37bj6vMqS7XhYcNj0ZZeHSBkmG
	KuecgV+dYCaYPmMFPu46N5z620/dpfKjTmWer9mLHWBryVjYDvwozi0qiNNLS3+MWv18xuATR/T
	TATFZMam6zNjGBbbvT8YiiL6tvQBKh0/OsMuEMemRg7uNK0b874fZuIM7VH4K/OADjDsTCjVR6m
	v9694XIPupTpZR+McSH2dnFqeDK0HWfgd30jICJdZ9XcKwjJ6QtkcmuUW5EMjOyK693AkNwfEj7
	oVvexGXOqWysFzHm3YGUxLpjHfJL04p+kOqpnpIX7rPMb6jY=
X-Received: by 2002:a17:902:ecc9:b0:2aa:e7f3:fb05 with SMTP id d9443c01a7336-2aae7f40696mr30693335ad.59.1770630372575;
        Mon, 09 Feb 2026 01:46:12 -0800 (PST)
X-Received: by 2002:a17:902:ecc9:b0:2aa:e7f3:fb05 with SMTP id d9443c01a7336-2aae7f40696mr30693015ad.59.1770630371987;
        Mon, 09 Feb 2026 01:46:11 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a95eedbceesm76884925ad.84.2026.02.09.01.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:46:11 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 15:15:26 +0530
Subject: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
In-Reply-To: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770630362; l=11953;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=d+IIsIi7kfuO/G+67G2tw1LdxeHxrkFVOKPANmKDm+U=;
 b=53xKooVH8vBgCq1uMmaR2pBQ9REhprsPoAtitazBLZxCelfr6+wODouLSHSKoqLxsQxW6MSeF
 qliQ3AhabqkA/zF+FvAXopwBcMj3CD8tbJEcv2Xdcc+O15jfcNWckcI
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: Ir_rry1vHet7nNC1kqSmC2wCAMkYxZTm
X-Proofpoint-ORIG-GUID: Ir_rry1vHet7nNC1kqSmC2wCAMkYxZTm
X-Authority-Analysis: v=2.4 cv=W581lBWk c=1 sm=1 tr=0 ts=6989ace5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=hg4RzyEoevDTOF3Nx0oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA4MSBTYWx0ZWRfX+7PuLRInkXew
 YzQ+X+bWsCiVZV1k0Juu4T4dAMgrHtqBpwD904gcwkXnfbfR1LJ6jviFSsX5ILMyQnCx2obFBAU
 olI3FxzeCYKZIkkT/ENIbdEpW0ImfoxciAR3otZreSqfCgBUPhmET2Ipq7FlH0JbYdBh/L5K8+M
 iHHM68EhIn/Lwc1+I9ms+pMUVh3ji21HW6e1OUbUCHi0aO3a3HjZ9EombVP8gjGW14ivZRsExDT
 HXIPH6C94FFCg09BVkjTN/qyKZF1rTTWSVmj0unPnYFD1Q6yIJ4pAZl2iSO0teIsVznSP+CJwW6
 EhlKRHUEsPLLgzvYghrj9spff65c4UShf5Vu9uEb0MTQeTxn7Vzak2kzbMx5sTYMuWjRoIgrNhu
 YYrDvPSOLoVJnBjvsIjCZXbsiCZ9pPpi2ZhvYjzJ3MVR4QF2EfKwnsqFH0a1ItT9rW6vnL7UoKo
 wcwpxBER88gEJPcfhCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,60fps:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52390-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4337010DC38
X-Rspamd-Action: no action

SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
use Gen1 by default, but boards that intend to use Gen2 firmware can
opt‑in by specifying a Gen2 image through the Device Tree
'firmware-name' property.

Based on this property and the availability of the referenced
firmware binary, the driver selects the appropriate HFI generation and
updates its platform data accordingly. Boards that do not
specify a Gen2 firmware, or where the firmware is not present,
automatically fall back to Gen1.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 30 ++++++++
 drivers/media/platform/qcom/iris/iris_core.h       |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  4 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sc7280.h      | 15 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  3 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
 8 files changed, 135 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8e4cc6d6123069dea860062f0172f1e4b90cfc13..b14b04b32b62e324a70a558063dc673f7b9c2981 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/firmware.h>
 #include <linux/pm_runtime.h>
 
 #include "iris_core.h"
@@ -10,6 +11,31 @@
 #include "iris_state.h"
 #include "iris_vpu_common.h"
 
+int iris_update_platform_data(struct iris_core *core)
+{
+	const char *fwname = NULL;
+	const struct firmware *fw;
+	int ret;
+
+	if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
+		ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
+					    &fwname);
+		if (ret)
+			return 0;
+
+		if (strstr(fwname, "gen2")) {
+			ret = request_firmware(&fw, fwname, core->dev);
+			if (ret) {
+				dev_err(core->dev, "Specified firmware is not present\n");
+				return ret;
+			}
+			release_firmware(fw);
+			core->iris_platform_data = &sc7280_gen2_data;
+		}
+	}
+	return 0;
+}
+
 void iris_core_deinit(struct iris_core *core)
 {
 	pm_runtime_resume_and_get(core->dev);
@@ -67,6 +93,10 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_queue_deinit;
 
+	ret = iris_update_platform_data(core);
+	if (ret)
+		goto error_queue_deinit;
+
 	ret = iris_fw_load(core);
 	if (ret)
 		goto error_power_off;
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4f9b5e00cd74f0d41e0b827ef14db..3b6ff3405f504359a094ad65d5a3252f20adba4b 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -121,5 +121,6 @@ struct iris_core {
 
 int iris_core_init(struct iris_core *core);
 void iris_core_deinit(struct iris_core *core);
+int iris_update_platform_data(struct iris_core *core);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580eb10022fdcb52f7321a915e8b239d..f1bbbe043e3a3ccc5eebf67091162678eb83bf45 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -43,6 +43,7 @@ enum pipe_type {
 
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
+extern const struct iris_platform_data sc7280_gen2_data;
 extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430ed2a070e092edae9ef998d092cb5e..6dbdd0833dcdc7dfac6d7b35f99837c883e188e7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -414,8 +414,8 @@ const struct iris_platform_data sc7280_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 	.pas_id = IRIS_PAS_ID,
-	.inst_iris_fmts = platform_fmts_sm8250_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
+	.inst_iris_fmts = platform_fmts_sc7280_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
 	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..8987fcc0cceb8632424e1d686ad04ca310d180bb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -15,6 +15,7 @@
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
+#include "iris_platform_sc7280.h"
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
@@ -1317,3 +1318,85 @@ const struct iris_platform_data qcs8300_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+const struct iris_platform_data sc7280_gen2_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	/* Gen2 FW for SC7280 requires bigger size for line buffer for encoder */
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.bw_tbl_dec = sc7280_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sc7280_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
+	.clk_tbl = sc7280_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
+	.opp_clk_tbl = sc7280_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu20_p1_gen2.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sc7280_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.core_arch = VIDEO_ARCH_LX,
+	.num_vpp_pipe = 1,
+	.no_aon = true,
+	.max_session_count = 16,
+	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
+	/* max spec for SC7280 is 4096x2176@60fps */
+	.max_core_mbps = 4096 * 2176 / 256 * 60,
+	.dec_input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.dec_input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.dec_input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.dec_input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.dec_input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.enc_input_config_params = sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.dec_output_config_params = sm8550_vdec_output_config_params,
+	.dec_output_config_params_size = ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.enc_output_config_params = sm8550_venc_output_config_params,
+	.enc_output_config_params_size = ARRAY_SIZE(sm8550_venc_output_config_params),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
index 0ec8f334df670c3c1548a5ee3b8907b333e34db3..6e05f2542a5457bd0b3b6acced3bd54d166b2023 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
@@ -6,6 +6,21 @@
 #ifndef __IRIS_PLATFORM_SC7280_H__
 #define __IRIS_PLATFORM_SC7280_H__
 
+static struct iris_fmt platform_fmts_sc7280_dec[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_VP9] = {
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
 static const struct bw_info sc7280_bw_table_dec[] = {
 	{ ((3840 * 2160) / 256) * 60, 1896000, },
 	{ ((3840 * 2160) / 256) * 30,  968000, },
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 22c7b3410710328b900fc49459cd399aa0e89b02..1f44d3ea337df63fbf5317b9b99139a0867267c3 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -12,7 +12,6 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
-#include "iris_ctrls.h"
 #include "iris_vidc.h"
 
 static int iris_init_icc(struct iris_core *core)
@@ -257,8 +256,6 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	iris_session_init_caps(core);
-
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc79d15585ed5dd5f905a37521cb6dc..0727d5d19cb9b7ed1f72ab840ae5dfda0162e23d 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
@@ -196,6 +197,8 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
+	iris_session_init_caps(core);
+
 	if (inst->domain == DECODER)
 		ret = iris_vdec_inst_init(inst);
 	else if (inst->domain == ENCODER)

-- 
2.34.1


