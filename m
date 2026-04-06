Return-Path: <linux-media+bounces-58139-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cENMALgw1GmUsAcAu9opvQ
	(envelope-from <linux-media+bounces-58139-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 00:16:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2EB3A7CC0
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 00:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BB0E3024A23
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 22:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6829039E192;
	Mon,  6 Apr 2026 22:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUVLVWwc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRux7HP6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0834275B15
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 22:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513759; cv=none; b=Digbwcqcs5tuiG1i/bZf3OgY/iocQR9wgnrq4h9MpX3DRR7zbkXOf/jp3f0ijnJaSqGMdwL2THua/G67xxdKYHb46tny9bn9MnEsqICiGmZIpSGDknqUXCTHYeIlfrYMR/H1WobzfbF/G3lza8Zf4622aybCZq9nFgdb7brPnso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513759; c=relaxed/simple;
	bh=ufbiwlC7n+mVE9N0WcwITOuaDJJGgW93T+WTLGk3fO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LLkmGDqdw7ct49JP/85J+3L1bwWiolukMIEd4woBAkJqNQ0KTJBflsywfnhPTahbBwYFXF6V7arvpw+Yx5FZVdfwgnmDc141WuARSNPd3EW4aWfY/6yXA37xpHztPV5ueFvtSy6MXaQiaf/1/yN9faCSCvWdDJxwLYkcBrs7XqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUVLVWwc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRux7HP6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQU8w1407039
	for <linux-media@vger.kernel.org>; Mon, 6 Apr 2026 22:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NnrMBg5PGkCoZpUqSbKxxX
	7LMDvDiwVEpbwlfS9vpa8=; b=UUVLVWwcbzXxInCM378y1DJVLxz8Ja0ccCkdpZ
	3XkKLxOE8SBA18qi5um2c3ua1H6w2qgwAV7FhGAKOiqhZWai3U8BHnmir5fWYHLi
	ttKNSWV5Rc7FDlAq51HFvDjVG0MmuRjDqACkO2CywUouTNSz0jN11c5cRyi+PXMG
	zhB4ckB4OlkG4YRHsDakbz2lFNELLAVo/Y9INgDx2UMgUUqo+Jxt9/IHldDsrU93
	iQmxx3kl+ZrvOQMQI+x0QXEGI/OfJrGrQTlxeXgWP5SSN7o/xBLMfkNs+HSww0HN
	Pz0Vfp2Rc6zdHBjkcBViziMyNXTpWAHyDuptE1J1CvQY5Sfg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrar3cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 22:15:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d984c74a8so28663011cf.1
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 15:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775513757; x=1776118557; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NnrMBg5PGkCoZpUqSbKxxX7LMDvDiwVEpbwlfS9vpa8=;
        b=hRux7HP654N+sU6ph7U/jEEjfxFHBC/qJ+VYzj3MW7Oz5QID7ZFwWEAJgcvbvBqZOm
         DxLGEzQMrF4AfJhKQaSMACCCQmdEz/+mbNl9swl0s6Scfyq5v10BttZzxtdM2nE+G0Qe
         xuX4+wot/9ArN3bOAwMIKldBYdE5MpAAyGdApP871R4EpMTItu2Kw5HvisVjSYKeEVld
         SVjbLTZ62ywkkw23cZVwv9GXkstzwzUcvRmZXazasRbvoGC3q3xJJzOACeTy9PPgPlc+
         xxyYpbxKZcMrOf4yFp75p9XDw3GqnB61M4bHrE43W2DEyBXxQGRfvixnYnA0Fb8yikHZ
         X3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513757; x=1776118557;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnrMBg5PGkCoZpUqSbKxxX7LMDvDiwVEpbwlfS9vpa8=;
        b=EPxdRcXIQifskGNy5RKf0zsRPXVB6GKKScA12ykiBf1qa+lzsTMdHJSLGadffBHWgC
         ds0qFVSU+2t8DYxTdmJeeRYb9jJHcPV5B8rqh8LCqmdnor37gXsFu8asK1CulnMMK+Du
         YKXWnIdLK6lCIFjP4J7UtMXZxj7RGsdbf38jgxIEaE19JEjJ1n7c51dqjJ5Ksyb4fRZB
         nCLRyje8HkTpwic0pdk1kIRDuCgUeiNlYhof0ZGlU5RWeDUCI7zholnMOmbOrypWo2D+
         AusmUGlBvBNv5//vmlFnF1L8gy3WPLJMz6tHl5BJXur469bENhyZ87ItevvXMKISfQbf
         u//A==
X-Gm-Message-State: AOJu0YwIEl0zOBW2biorDTiuoqbXdIacjtqhmGmjybJDA1xmwIvC1Em/
	/uqD6Bi//vxWUGcuGV5wMf/SpnVw1HeVnwe3rM8jMdXgBKG/8XDZzHC3HTiDmOZilZ2JBbNL73g
	h5rifVXowqSGoWK8T7ugLRpVHg9tALpzRdgpfIHp+W7iW4mAuzpBfSlx0gAo/3mJ93A==
X-Gm-Gg: AeBDiespigUqQKirv8BzwE48dWEau5YgYxOwk/jWMM1loEqEeapmv/OqOGmDAeXgpHq
	3z1wLaUZ/BZ2HP6PtzyB5l+hCKgkUiDyRPOlY+WUb5ktQOG5ol6rdjcS7krBZADJHMm6TV3ssVP
	UHSreHNMc+ojmdyVrcS7j7D+eRRNU5UuQWFNBpoeZz4iHFtt8rtkKWbKn7cHUP7A8A70+Y3i83s
	xnMrvbDaCWfYOI6VqB1lycEfqaLqj7zHVJHSm0vkGMU9tFNyD6SaquEYnWrahhxpkHgxTVIdLWh
	3y9/qfCB+ThfjcYywxYo8YYI7wkK98xSZY/2bTLtfXZa/4NZvgCFCn+Vlu+4PSewb1ybts6Pl7T
	G/c2qHruh2q5c46f12x8NXPbnF9Gqx4l3g+8d4FeuyxNaHFfq3HeU5Fva7Yi0UpWsUYqlev0/4h
	eGLDGrQkgdugi1Ji2sBXHXhQFHrmHqFrG+h3E=
X-Received: by 2002:a05:622a:1e9a:b0:50d:7587:dc46 with SMTP id d75a77b69052e-50d7587e069mr184368801cf.12.1775513756740;
        Mon, 06 Apr 2026 15:15:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1e9a:b0:50d:7587:dc46 with SMTP id d75a77b69052e-50d7587e069mr184368341cf.12.1775513756310;
        Mon, 06 Apr 2026 15:15:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd6799sm3615125e87.81.2026.04.06.15.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:15:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 01:15:52 +0300
Subject: [PATCH] Revert "media: venus: hfi_platform: Correct supported
 codecs for sc7280"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-kodiak-revert-vp8-v1-1-deb61ffa4d6c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJcw1GkC/yXMyw5AMBCF4VeRWZukrsWriEXLYEiQFpFI312x/
 JJz/hssGSYLVXCDoZMtr4tHFAbQjmoZCLnzhljEuUiFxHntWM3ot2R2PLcCZZmoJMvSSGoC/9s
 M9Xx9zbr5bQ89Ubu/IXDuAe6q0Np1AAAA
X-Change-ID: 20260407-kodiak-revert-vp8-793a355417be
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3642;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ufbiwlC7n+mVE9N0WcwITOuaDJJGgW93T+WTLGk3fO8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp1DCZaxX3F29e8Kpb59fV1Bf76gAmsxqMRW/pq
 6w2WP8ppemJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadQwmQAKCRCLPIo+Aiko
 1S07B/wOU1Et4TARro6rrda2Mp/6YnEHr5mmP8Ec0JBVD5n2uBUIItVDZTbN/EuQyc1SxPkGWfC
 JDT3Dsr1mtx//H/ekaeIf1SQRqpcrwaAw1rV+WeX96bfgXZiMqPbgDUTYRU9CfGcxb/v8Nzr6Pd
 8Es3hilHlAtpUK0NaoD4v4TIW/Mt6pfNX6HwwbulSU60erKiLduP94X86WqADBTmSWT9BgWsHZ7
 jVXNthdLwpJtagZLY6FoLmkovgn8UobUYUsERgs2Ggz3MIRsy2UGW3kR6CShD5ovednUvSBtfvg
 2nksdreZ/50Ew8B5O8KZIhUQjZHFkiVMoHWFQmiEUTrc6ZCr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Ei1je67Noae-XGk1uDBFPoO0tKrzQp99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIxOSBTYWx0ZWRfX/3DnubrzDtX+
 5DjUVzfMLsEnL/3KEkan+aeb+JOmW4NXnQ+dstr+yCZETqYUWcirA82GVz8cbaECJ+U7yu75qFE
 Kx9waMm2YhA/Sc2YSXg7fckcUkKWgaKdow8mQ1Mrazz1DBy/Nm9JZDsYV62drmPFTyElGSvr0I9
 GR2I9XRAAAkgUWsEXYNDG9YW7/W/4q5LPf2rSrCyScDj2dkddpAIewRbhsScuA9f/vyf/tSINfh
 64ztrzsf9htxgZZDKMc6irk+iShMhv+hhyXbGoGzpPg+Bv9FwNnJPgDaT6M38w6cUUOyYIfJl3P
 xbfZ0NiVH/9lpIh1pfTrr8nGQqBByEbw1FGLmRLdMh/hM5vBac7T186lVxZI7leBxfz/Cmb68bm
 ZTqAFD8rBtxSs5oWVuYbJhi8BZmxMkiKMlX1AxO7HjSFZvvcLgDGXVgc55oVfpTIkUTqyPOQQfl
 680sDsVqX94pNyD9UEg==
X-Proofpoint-GUID: Ei1je67Noae-XGk1uDBFPoO0tKrzQp99
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4309d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6tpo61D6deqqxnN-Fs0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060219
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-58139-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E2EB3A7CC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This reverts commit c0ab2901fc68 ("media: venus: hfi_platform: Correct
supported codecs for sc7280"). The codecs might be deprecated, but they
still work (somewhat) perfectly and don't cause any issues with the rest
of the system. Reenable VP8 codecs by reverting the offending commit.

Tested with fluster:

|Test|FFmpeg-VP8-v4l2m2m|GStreamer-VP8-V4L2|
|TOTAL|50/61|50/61|
|TOTAL TIME|12.171s|11.824s|

Fixes: c0ab2901fc68 ("media: venus: hfi_platform: Correct supported codecs for sc7280")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c   |  6 ++----
 drivers/media/platform/qcom/venus/hfi_platform.c | 24 ------------------------
 drivers/media/platform/qcom/venus/hfi_platform.h |  2 --
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..c4cf6cd50a9a 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -268,7 +268,6 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
 	const struct hfi_plat_caps *caps = NULL;
 	u32 enc_codecs, dec_codecs, count = 0;
 	unsigned int entries;
-	int ret;
 
 	plat = hfi_platform_get(core->res->hfi_version);
 	if (!plat)
@@ -277,9 +276,8 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
 	if (inst)
 		return 0;
 
-	ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count);
-	if (ret)
-		return ret;
+	if (plat->codecs)
+		plat->codecs(core, &enc_codecs, &dec_codecs, &count);
 
 	if (plat->capabilities)
 		caps = plat->capabilities(core, &entries);
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index cde7f93045ac..f19572ab1d16 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -2,9 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  */
-#include <linux/of.h>
 #include "hfi_platform.h"
-#include "core.h"
 
 const struct hfi_platform *hfi_platform_get(enum hfi_version version)
 {
@@ -73,25 +71,3 @@ hfi_platform_get_codec_lp_freq(struct venus_core *core,
 
 	return freq;
 }
-
-int
-hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs,
-			u32 *dec_codecs, u32 *count)
-{
-	const struct hfi_platform *plat;
-
-	plat = hfi_platform_get(core->res->hfi_version);
-	if (!plat)
-		return -EINVAL;
-
-	if (plat->codecs)
-		plat->codecs(core, enc_codecs, dec_codecs, count);
-
-	if (IS_IRIS2_1(core)) {
-		*enc_codecs &= ~HFI_VIDEO_CODEC_VP8;
-		*dec_codecs &= ~HFI_VIDEO_CODEC_VP8;
-	}
-
-	return 0;
-}
-
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index 5e4f8013a6b1..a0b6d19f3e1a 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -74,6 +74,4 @@ unsigned long hfi_platform_get_codec_vsp_freq(struct venus_core *core,
 unsigned long hfi_platform_get_codec_lp_freq(struct venus_core *core,
 					     enum hfi_version version,
 					     u32 codec, u32 session_type);
-int hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs,
-			    u32 *dec_codecs, u32 *count);
 #endif

---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260407-kodiak-revert-vp8-793a355417be

Best regards,
--  
With best wishes
Dmitry


