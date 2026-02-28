Return-Path: <linux-media+bounces-53814-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGwTBV+nomkK4wQAu9opvQ
	(envelope-from <linux-media+bounces-53814-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:29:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D8C1C15F3
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4AE530B9FA2
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765633E95AA;
	Sat, 28 Feb 2026 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLGJYf35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCwVJMkq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1683D903F
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267336; cv=none; b=f7eO6yOq3BrEtz1neAbm4FcDRSUxwnfoaEUEerO2ArkW8d0tWozxhme5h0jpYfFjqiJ3T71jnE7rjSUts0dPzAPV2aaYzyreem/1SGDaWGp9zakHnMCq21Kour7eBHjoEHJX1mOVrbuofaFhNVkTcOBOS68C1UlJSgwHaVp+zrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267336; c=relaxed/simple;
	bh=M54qLiSx0tAuQGp4cYCiU0fjAE2JjhmPrU/j/fMoZxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j4wa9CFKidIu7+R991SJA6zQBCAc5XTsRUoO+kCZaXJ1uNlJ+SuElTjWU7Pj7m5CVgD8Mbw+KCAqhVltbZJLzn9U3F4BIxmo2tjiVkfVclIOIHTS1sPd7Ko7tniowZzve+s1uck73dBvpV53ps0kr2cPOWf5IXTLAktD4KFgvRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLGJYf35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCwVJMkq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6NYQQ2376978
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+utxNAm/m2FGs9Q1dMAeV4ThMYgtQg6P+gmWB/t/PiY=; b=BLGJYf35q4Mj9zMu
	wbpCHFaOUPIyTBNcysuRoKj27v48kSZHGXhy4yy290+66qkDJaUKDdPt42P5Ukvk
	h6cxFrdfjY+1mAXYUHOpMW2TWxDIa0p3ryC8mvVYKsMuiLGdDB6T2HSib6wOVLij
	BFniajMyQeHfGKEKhJK7VFIQ9kMq1TRFYgQCzcQ4JE/H2/x9CxvJM4IkIhfSlTl+
	4r8XMGunMesfjm7lpw/Oa79GoZ6zGKXZ0NyiGXEt8jTV6aOKSdezy/o2twrsUu4O
	MZoN+O8NTxHhiHoweT4ruFCQxNR+N6f2NoqsDzocJ/bsH6rMhL27YurRQp10vquT
	xLLMEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd0j51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:28:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3fae6f60so2845626985a.1
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267334; x=1772872134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+utxNAm/m2FGs9Q1dMAeV4ThMYgtQg6P+gmWB/t/PiY=;
        b=KCwVJMkqywOi0aIxufoBLIelALT6HlUlbgMuKUtnC2IkNuwySi5hBulvt20GOYKJMg
         PI/G11nNUMlSu7jZGvhiVX3URn1DLjn0QC8Sl6jZCX/nU1rfPEB175zPTvZbUVdjFm9u
         X/5HJF+ZEdXKTNVfdOBak3nsxUjVC5nypFvRjQClG1zUcc53n6R7mYIcyNn3D32tSZCN
         lgMClYX4THWnNQyQObD/TaIMkf0dPJPOl/t2Vaz+UCZ5a4znz9u7P+4YBHHiXd2Orwl9
         u13CAiszQf7h/wgJnN0R1jyepdHZabAR3hS2PUbRf/oAY5Px6Fz5avtCpAs6j5T1PCA4
         8bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267334; x=1772872134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+utxNAm/m2FGs9Q1dMAeV4ThMYgtQg6P+gmWB/t/PiY=;
        b=VwelvgFey5Fqghb5g+lvPSKccV+Ki63d4CtXqCYzO5/D+5ShPcEzm0RUeqbjCX0CqK
         aDldT9+8BDUiYq9Z4WpKtZOQAXeLt2AgghTHPv+nSUES9XLN7/niEfGFmWr9EmejZtsz
         8M7ie0fQu6UVOx0ZB5izJNY8eAPxmnb6VeAG7WSutHRHzLkFcnQ/HBiFw+MhvEO/7+SC
         fjCUMP9+3gssm8+polAwOapWNcdJs53chM65/IV7XoHYgwMer3t003SwN7i3KEBSKMSC
         LhlcKC6xhmQNXVQwYI6Kk+Ol88xM9N8F8dkxptY8MOg/4vOLY7zMyuHPoWnF1ztaM1Z6
         cuzA==
X-Gm-Message-State: AOJu0Yycsl1g95C2kxOoNXio9DEI+dFpXDbqU4ghuYz2SUS3go7B4Vzy
	3FDQSJ6tKhsSXiCFA1cGMkRZ9QHkYszEmS3ZgCqaHn7xA5clU0eoQcAYrcv7hRcPqXDnCl/o+g1
	HtmLyU7WW7/a3AraGwVsKpTUAIymrQBCiaCb8rZ4OG5hEQD5V4BE5O/BLl7zZ8sCaeQ==
X-Gm-Gg: ATEYQzxpwZIsRTbex7Wf+W0JFq/04XxLWT4Z8PT4TkozNbcqXEz98WAGr7tgoMPtCaV
	PeyvDnhPcNyloakTKvPqV4v9l6Ft1b2+JyxZV0gP3Q9VbQHwcWXfDleE8o9Jxl5cmZbRkAVRrbX
	34a1WPmcQ07ipbybyE9tv887bFgXKQlU1xlK9ecOdxCMGkjfB76wuas0HTTrD8ag5xTelI/iU2G
	AZZjji1SNtCLAw1Lkyjc6pVbQWASx0NK8PiQXFN7KskrZUm5CoWGshTV2uJoK9MkgWGCc6eEAZ3
	hM79vVjv21YkGasxTXw398qz9YToUsuRSgdOXkdrBThokW0U6Ffd62782YUWsKHXoMycm0kSM7d
	w1juCDulXxV41Xf5fMYc4Tq+22TiUWFpKkOuShq5ToJTL14DB5r+GsKe+3ZtsTig6UOKJg4K5io
	oK74vHNmBuPIhnbchGZsE8fmDdc8XEHHs4jys=
X-Received: by 2002:a05:620a:1aa9:b0:8cb:df8:e86c with SMTP id af79cd13be357-8cbbf3cf0admr1021270285a.26.1772267334076;
        Sat, 28 Feb 2026 00:28:54 -0800 (PST)
X-Received: by 2002:a05:620a:1aa9:b0:8cb:df8:e86c with SMTP id af79cd13be357-8cbbf3cf0admr1021268085a.26.1772267333613;
        Sat, 28 Feb 2026 00:28:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:28:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:46 +0200
Subject: [PATCH 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-1-c2c53539f948@oss.qualcomm.com>
References: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6033;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=M54qLiSx0tAuQGp4cYCiU0fjAE2JjhmPrU/j/fMoZxg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+ai5fbMbnIbVrrUKN7dN/OEqB/Hz/LoCx6FDZbnFLuYf
 A7lXvLqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEIj04GFb9tDnRcmbilORW
 5tcv1y6XnFgma2ni53daJif0VPn5Zycy/f/kaG2z/2j8687WbW9SlrrfCUtv/fHjp+kiln8G7d5
 GD+OD2rcsKihvFbtX1+u27xtnnuCTg4qxhoevlCry8RVGVIRaiCdN53Z6421dyrzTmrN9xmFT1S
 tcAcGx61J8DG7s4eGr2aLjmGL3YXsh80+TJZsCltacMrl2WpjLZoqt8I6P+Yun5nj/zv1y/poY2
 7lg+fUT/is/vCvSJm3t2r27kOf+jeQF9/6t6v/KrNqcH853tY5rpqH2r0aGjYds4rTzndlryplr
 3wq/TnZ7IynK/KjoZ45CcOyxU6vkA7ODVFX3PBI/HLQDAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfXzNEpgcfMPz3M
 Dc9nprFm1FaAjsbMdokFlSQ4MkPwdQi9QXKbNf+pcRdf7xcj63ImKiW3DNywwfAXJi0GjNWLBr8
 CfKm0pB9z8WwN9DAjLFyIIvWXOwL2uzZdq6dfNbqEfPWkos5UhATiafmaFBVdJskaLe/90x8mOd
 G4WRCXHm6c49X54a9TJGA6327v3uLCgBpe/hfUEjDPeZPr5fp9cikD2M8hp9yohV6no1+yTGB2X
 bJE7GLdcvTsMThlUMAQhTu2CCwFjSsl5susaX1a34djmbGOp+rxVpeUyJf9HFA7moGUoOe7vxJX
 8XQqFwq7hBOkvPiaYQ0iUdAKaAcKUXu/hmnzAXKbz3JMXxCDgII6sikaehM4yX0StTfqSPkiD3u
 MzdsdCZ/f8zmiraPuRSDR+9efxM03/e2e+c5S6oaHcraAhV0bt+Y70H/vRQYNRc2XIIQrAxOVtl
 yF7mmewgNFfPNLx8aIQ==
X-Proofpoint-ORIG-GUID: WpPTwAFlqy8tGlCkxxVAItHLiy897HTg
X-Proofpoint-GUID: WpPTwAFlqy8tGlCkxxVAItHLiy897HTg
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a2a747 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=iXhRqYnz1ivtNB1IvZoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280077
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53814-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0D8C1C15F3
X-Rspamd-Action: no action

The PAS ID, the authentication service ID, used by the Iris is a
constant and it is not expected to change anytime. Drop it from the
platform data and use the constant instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c        | 11 ++++++-----
 drivers/media/platform/qcom/iris/iris_platform_common.h |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  4 ----
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..bc6c5c3e00c3 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -12,11 +12,12 @@
 #include "iris_core.h"
 #include "iris_firmware.h"
 
+#define IRIS_PAS_ID				9
+
 #define MAX_FIRMWARE_NAME_SIZE	128
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
-	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
@@ -53,7 +54,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	}
 
 	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
 
 	memunmap(mem_virt);
 err_release_fw:
@@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
@@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+			qcom_scm_pas_shutdown(IRIS_PAS_ID);
 			return ret;
 		}
 	}
@@ -103,7 +104,7 @@ int iris_fw_load(struct iris_core *core)
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f42e1798747c..e4eefc646c7f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -12,7 +12,6 @@
 struct iris_core;
 struct iris_inst;
 
-#define IRIS_PAS_ID				9
 #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
 #define AUTOSUSPEND_DELAY_VALUE			(HW_RESPONSE_TIMEOUT_VALUE + 500) /* milliseconds */
 
@@ -226,7 +225,6 @@ struct iris_platform_data {
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
 	const char *fwname;
-	u32 pas_id;
 	struct iris_fmt *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..1bbdefc48d71 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -360,7 +360,6 @@ const struct iris_platform_data sm8250_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
@@ -413,7 +412,6 @@ const struct iris_platform_data sc7280_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index a526b50a1cd3..1f23ddb972f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -934,7 +934,6 @@ const struct iris_platform_data sm8550_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1038,7 +1037,6 @@ const struct iris_platform_data sm8650_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1133,7 +1131,6 @@ const struct iris_platform_data sm8750_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1232,7 +1229,6 @@ const struct iris_platform_data qcs8300_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,

-- 
2.47.3


