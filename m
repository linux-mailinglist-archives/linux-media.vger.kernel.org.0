Return-Path: <linux-media+bounces-57390-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEF1FYQTx2lUSgUAu9opvQ
	(envelope-from <linux-media+bounces-57390-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:32:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A737434C4D3
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31EB9303AB42
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0D9388E67;
	Fri, 27 Mar 2026 23:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+ErroJm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFT/iLpg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A9637E31D
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654132; cv=none; b=fn0BhYzHlJnUZ1zHbykEcfdqhIl7VZ0VFoBh54DnYno+6XRZlxsS5A/i+BYU+hzGx4bKpmQnS1hsjRW+BA/m5J1TS/I08PaAtRL07gZvTY9qlGkVC7HKyAuYh148bwt6TEFSYLXYJ/6mq9rL3orTDwGDzlP8LjPD5Gijz+dhXT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654132; c=relaxed/simple;
	bh=R9G5DrWK7ZdreBHQ/NvwOHQkAkxN8nydMv+XrJUDCnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIWyZRKjX/KwwZTaVCF3WD4ou0w6yg2moiskJbuAIvoBya9ebZeK8BolfFGD62WZiUG/dzhg6YsUVLfWoliWBoIX4sdKzQa7tEs8PaciCwrx62nUzQF89TCmx8re9g3OmdNZKl7ZvypQiCufBWAoROKV6qqhUG/o3L7GA/+HVxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+ErroJm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFT/iLpg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN423O3991227
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=; b=K+ErroJmZN/PtmZm
	5t5n34u4jSMg6IputzjXuqP7m3uRcthXbq0JsABVNMdYqP60Hxji0gn9aqFtw8jX
	mN0j/Jt8nmWJPiH8N0jTUAtaOgX0w+4FMLqOhmZvyyHFy2RY2HSt3lnZasrGlDu7
	Fir7FxhlMVb614+8SlFCgk6ec3lzhq/uT+6DDMrC2fen2RDLhfEcolpmXB+W7KGG
	Sdea292aLyJ9WacfMJNimeN0cbXdMhB+BuYxtnP2I4euf/eyEXz0xExq8M6PXT4g
	p3KASCBEWqOH2jmEq9uV+F2NKOYpECVEOTAOoogXXiglrDdVQ5qvpmcXW/QKidCo
	RB4b7w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d61m7090a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:28:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a0258c5e5so29021926d6.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 16:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654129; x=1775258929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=;
        b=MFT/iLpgePjvGU388tV/CeMR1QoFkSeVCiX85X84X/h5rTTx4DrYuhW6I+5vLB++pQ
         t6s5bP/UnpAf9PnKBy80QYn199m6fwH0y4MacoEBCSv8X0MG6FSEzkDvn2urGNbbMBpZ
         +OmDiFarcTqqItxnROVcJZph97wZzJXJMmueoz5FGAsScjQ9INnrLYvoG3ah/amLV2l9
         Uh2ScDuATEe6W289Iarz4LS/yhdDvi72KUfZnU5Brbt6Xrva7V8MRRcGH0c+gNDEEhBx
         HKmWTvxXyDoYOJfrfzOwca505Pt9R/9RFxg6wLjruViuLw93n9JW5D3mk1dONC0xVpyP
         USDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654129; x=1775258929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=;
        b=PPdgyiqDRKkO5cCs7iBT9TyIYAKqgaDTDwQTEMgbUF3D+wlpFIII0QetdIhEqy1LCj
         K4og6hzaMZifH7lBx9DOxxtyQi3LQH083LK8cfYP9CJ4pSRlmR7CB9yj12VjRiQCn+vh
         BlOoUwjuJSimC2EcXH4/prNpca5AhkGQuxpZYZCcDvf29Bi4CiDojTVf+t8h6lpm53KU
         pYrQd/YxwDVgb/aqgdmKrNgAfGo8kb/WLSCVWafkDtPUqbnpNYsYuruA7jm5KML2ycH8
         CfiC7XoyIZelEaA/LGR4a3O9PsQ2hjqnAd6EHcig5eaMV68+N6M7g2C9X2y2a6YQwnPo
         ccGA==
X-Gm-Message-State: AOJu0YxRvRW3V2wClAqcoMKgiudlYiZiBev5EkYQQHXjr69DWKfzlfBK
	fnGDcNMKEz3UCaqAvaxMJjcNsffYkRxacOFAbZ2Je6ZH91WgKZZ9yh5VktfObfnqH97o/cIc4F7
	xhIEMIuXQziXTDeV/LhIuA3m2N2Dy28cKBSHSqHoxRk971Pvz1icwSjgOPw8TcvSrLA==
X-Gm-Gg: ATEYQzwciCtlpX2k8G1r7lg6Kxd4RA0EFO0H3jIn3mFkpDVpF5Df8koQrcQ3aWtP1Ty
	WwZ5uyqR+mwqQqbom7BeFxtVymE6Bsaq18xM/6OUj5FvUATix88EuMFQZ04X/2GNYEweOEnfN72
	00pmEJG+F9thBxGlDRa270G81nwxK3sljabScXIE2GFRrVcLs2dP8O2+zzooUt+RPB4d6wJMSBy
	2nHFlu5oqyIklI3hEeU8kEVhB+KwfziLnrt+MkGBfhp2ae2QUGlfWggupjgLbbJENHhl9ILtbsw
	YCp2aKswybLfRT4gr7BJKFtKfIRi1QW66SKmWzI0H2DCDfZ3rgXNs4Dq+v/nBcQRtT3jEnCmdHq
	U7Z7pxrrYbaNtUCJHI15ot+b3cPtuSrHiagQ5nZ/XRErZiiVw6s6L8FkH+GWHXcQU4lG5LN3U7v
	TzrHogTL7I1BZuAQgylTsJGmyQKGdPqvRXVV4=
X-Received: by 2002:a05:6214:6018:b0:89c:d4c5:452b with SMTP id 6a1803df08f44-89ce8ecd0aamr61287696d6.38.1774654128564;
        Fri, 27 Mar 2026 16:28:48 -0700 (PDT)
X-Received: by 2002:a05:6214:6018:b0:89c:d4c5:452b with SMTP id 6a1803df08f44-89ce8ecd0aamr61287406d6.38.1774654128060;
        Fri, 27 Mar 2026 16:28:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:28:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 01:28:36 +0200
Subject: [PATCH v10 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-iris-platform-data-v10-1-46b92bfe7b52@oss.qualcomm.com>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6224;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R9G5DrWK7ZdreBHQ/NvwOHQkAkxN8nydMv+XrJUDCnI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxxKnGzFzLWO/Mi2GmBFgvtEPZnhh5129inEBi
 1vgr3eRpSiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaccSpwAKCRCLPIo+Aiko
 1WsiCAComoaAZ/Vpey1OTEqQAJ9lXi4tS8f+bzCYfowGHN/DSrhUlJCGb06jFf9gtf/FkY4Qs4o
 QeRfJZyjNU2YVWbiT+26AS9gePPKCqNRz9Cs1B/f/krHspR2ZRfHIzl8LHb7LLLq42/JCdmT1Sl
 6/LnRv+T02jspPRxJS43Y3THaahoq972okgViMqK/XnGTy67wCEjtPdaW7uKNG18XU5tzX6QJ5e
 D7dcXOlZbPJF/vuhLzX6Nn0Y4byPzkbx/wjBSlg9VDBKdMYWlPONfo/EM9zCG0d+AHWboVFErXE
 JAKzsJxZm4R/4l0N0tARC7E6bc4Az7Am94lWHtZQgFFGFfvS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfX9j9/QstCv1pu
 VwZlyiW+meFnejQpx5dLOungNoPPdSF/+a6Di8aUCkGA7PF6EACWGP0EyFwvQLcYwcHmILfRV1b
 aaYjV50iPleMUdCRfqY9Sly9aPHXj68p6l9JHSL8oHqdBgwhjsLTyPZQYOzUrTmo/NcYVheBvlJ
 0WhMAuA3qCKEE2E/sAoG6QiP+3TmuQZIyV4BO3DCUSsZllxpb3dV38I8Opihmk/rXig4kgy61Fk
 Cy+f26ydIc9KwkOnvtakhcjUhbvZVyFEmR5PuYGwcgEnHDrnS97mBlhWpcylPuhHGN/PSMk2+Dh
 cReRxkH2CGTatJnblyp8wOrmDWkYGvfQHIxUCwWTKb3zQoIPpED4fPeewNIb+1RSM2R/qkP6bt1
 4KqOPcGWCQ3p+doj/xk3xNXS0yrpY0sjWlH+XlrxwxExSDzodSSK9EOkFWgnScyFnqYn+1pCF7M
 pyI3MOfCjQ8edu3p8fA==
X-Proofpoint-ORIG-GUID: B2wSxG9daNGX1zGiCBfGCJd0x08IVD4K
X-Authority-Analysis: v=2.4 cv=aoC/yCZV c=1 sm=1 tr=0 ts=69c712b2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=hYMYe-gnznq9qBW6PAEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: B2wSxG9daNGX1zGiCBfGCJd0x08IVD4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270165
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57390-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A737434C4D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PAS ID, the authentication service ID, used by the Iris is a
constant and it is not expected to change anytime. Drop it from the
platform data and use the constant instead.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
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
index aa71f7f53ee3..07ed572e895b 100644
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


