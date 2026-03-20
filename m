Return-Path: <linux-media+bounces-56443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKKoKxGpvGmk1wIAu9opvQ
	(envelope-from <linux-media+bounces-56443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:55:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B1A2D4E4F
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B11330F4EC7
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401283242B2;
	Fri, 20 Mar 2026 01:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0H0lOJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MH3swVtd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0642230100E
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971704; cv=none; b=n6Xt0ID4HOJAr+rV0rKmZ48ukYXTrX7iuLqTpoeoc+VlIqwZyI1yKCyHoy0gzt+XYddiEqgOrSh1yjpcRT0mrI3xt4S3dmyj2cOGKkqdl8Eie427XnBT7bhNY3JL9F4vXQM+UcGdfV54k3GFR1N8jKNbEm2BDG3v7FDaDGHN8Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971704; c=relaxed/simple;
	bh=R9G5DrWK7ZdreBHQ/NvwOHQkAkxN8nydMv+XrJUDCnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SK8TnnupP4r6i4iTlzHd10Mlt5xa4vnFkFqwWRrAX4FzP94Z5NPx9HHQ0YVZkndm7XiQUcKJa9qx3BTuPOZlBhJVypOLoICO2xHEZ+r7f/yJeIXu5hwiRc0eyxN3Ogc7Gm1utANFb12YTX4uYNExAf1qZTg8OhPcaWfc009/tMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0H0lOJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MH3swVtd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JNUt9n4155723
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=; b=H0H0lOJ8LZBrcg2Z
	oqfHF1G7yYVkcxyh9FMZuHnFq0EjwwtzPv/lk8xEZQNk27L95teSv+oLWwgLay4A
	fvvaUFGjrbVtuFe2sPXW/O/OL5LFlg/AB64dRYpJniQZBwLy8jcJc1NH124TSWOl
	JxGUM0pRJoY208DJZVsrIMsLIGZzPKV0Cpkm3Ai8dOk4DOauPCQ+paBAiodEfjRb
	Sm2WCQqcsWz7xUS3KwX7l9wGwJjDX6IgAhx9G6ogsBE+TuPIfu67o5h+rps+fnLB
	mm1C4dbY9IsEn1R4C+h/ZXywQSP9hoQ6n2GHHg2sATIaXCpthbNMJ8VXadCyFRqj
	2lvPvg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt91xuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:54:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090cc6a7d2so11514821cf.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 18:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971695; x=1774576495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=;
        b=MH3swVtdg9ACOcTFvZSgEAb3R5kYRK20tei8Lhs5Jbn//U5nB4b6QL68j3vkkezUKn
         VtwDgNId9NblCDJJRncy5+C4PDuU1Epg99I0EkmKk8q9qXE6JgaiyUzK6kcqRT9Oagiu
         FBN23tXo0mP40bhEb57fBfVLczwW2V+co4hKCk/wXIDrRfULpF+S1gALTlnAiKii8Ldl
         hOdTwL1lrqXQ1HRILkI8m0/4zHz3S7+Wbhz1w3RHeMB76gWuKYHgFU1rsT984Qhf2TPN
         wFxh80eQLZ66Cqefad58hiyKbzuxkOiFGMxCWytbzVghEI4X0DRhcLyqDv9sM3qZj2l6
         uPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971695; x=1774576495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=;
        b=b0nQyxoA62relRNBIXFV/ef/r8YbhQhREMgnr5XEEv2XIM/Ts1wlX5K1HNZrdggR83
         ImRvHfwLBVU9CMb9XpX3DkhzCtFNUtMrSpArHZ/dC2Dj0naDJiZnG/xdb8NPQ3h3PWEJ
         Y0MlNERBdxG/BmEcH6MT5NpQcZvn5DMVxq4ZPmY/CS4WNAuqCCJvBm2XQvxUZsvdGTWp
         QQ4b95dh7BFPykDe+vrKji3hmgD6XSH8S1B3qUBSYeJcc7ULuCtHNPldJc4etl83A/ua
         9WEg5i7NoOaWsLTz26MFHKnQI1hF0+gTntfEUcztaC1Pxkd3JolP1IMmMvFPq/5n8z9m
         tSzw==
X-Gm-Message-State: AOJu0Yx1TPJyKM/L7HRTq29yYhgt/rXN91+EuFzPPzZq8HFLCgBVE1R3
	6HE2q/SZNBNpT3rA7vcKVWxBIvjaE8hpM5Pgt9Uw2N1Q29aeu1vqcO+linmVIdiizezBUco5K1l
	Di/9n4AHyqe61WiewjaaxXgvfspog3NYhRSCGyj+LWlr7OKeDAtjgxIVZqRv+io5Wow==
X-Gm-Gg: ATEYQzxKGzQigpD755WyEo+VB73SIxInD85ezamXQe77dVK55WsTCwDPG5Zqx+WwoKt
	DjRIoO98TKbBFCpVNHpYOdvSp/1F2oX7JVEr6Ahjpd+G65oob+Hul+tMe4WCaUPF5nI4o1J0R51
	If/6JEXx6m2YtJFC2a2c/T+xz2/mz8P05CXBbzbfb7IGRw8oOZDuBuFXSdnFD5epe8WQNZec9WQ
	Lum2v1BmPK1yh0xhalWYwQfmJQTeg0oYw96BHS+/4uOW0swiXgGq2WadnQXKoJj/Pv/bfp+HX+v
	ins1NK1BYnxVvtoZ+nqMG3N4ZK4VRxQ34n5lIjN9py4SSD8I+vtqhwXfCilQyx9yngTg1vaZo6g
	+qIy4790JpWSD1E+SJbmv4Kg4V2e/vRMG3erV0CmaDarjeROJytvlkMkNCBfK5ehPsJm17oi4ZP
	mj8P3fyEVyKya7t0zoNmvwB9+pRbTu0y+tzdo=
X-Received: by 2002:a05:622a:1b28:b0:509:20de:4acc with SMTP id d75a77b69052e-50b3753f7e5mr20695181cf.47.1773971694881;
        Thu, 19 Mar 2026 18:54:54 -0700 (PDT)
X-Received: by 2002:a05:622a:1b28:b0:509:20de:4acc with SMTP id d75a77b69052e-50b3753f7e5mr20694881cf.47.1773971694286;
        Thu, 19 Mar 2026 18:54:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305eefsm232344e87.70.2026.03.19.18.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:54:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 03:54:41 +0200
Subject: [PATCH v9 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-iris-platform-data-v9-1-3939967f4752@oss.qualcomm.com>
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6224;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R9G5DrWK7ZdreBHQ/NvwOHQkAkxN8nydMv+XrJUDCnI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpvKjkAsbxPGbFF5oyEt/EhISI27We56rjYzWCN
 q79SvGI4w2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabyo5AAKCRCLPIo+Aiko
 1a4IB/wLZo1cEX9xuwgfkg11keF9bpNDNrmy33+EVeQwnsNS1kAMZ83a6MJIy0cmHJ7sso/63CR
 lzQddruj3oRXL0OBvh3ok8CgAgyBLbUhIiOoXAStz7RgJjX1+RmbSVr2K2Bj7/k6oYcP4gTQocS
 7Qu/eMA8V8PV5bhlkaS3N3eSYYFmVbcEt/8P3U3npzV5WNwf1IU3oFdZevBNx/e7gUMRugdvbSS
 cnqXdf/y01I1CZw7+gmkytpslC//WHhyZut9ceCecME+xWopjGu/ylaAhimaciGMxJrZJ2VXYGb
 91/ZoUsrpGdbMLajkBqo93XGiQ2fX4tqUZ2H8jYKtQ6W4uQq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GgH3ZDxh4xSxKtlU9rwX4p7zFGWVHCWC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMyBTYWx0ZWRfXw5qpqTaNAzRP
 2T07Lcg5exEPC76ZIsynnidtJk0PZUHqaJZLl7tbXMkdyW+buWl3PwbBQEEhR7pj6pf90L5taXe
 JmiwaxQr2lIAlFJufnxXDsZzYHdiFXVu+OMszol2t1vp1NGz5e5WoA8TVPypU+mw8QpQyl8T54B
 9lFy4spvqsMDAuuHuNZjetyZxEfAVXZU5UUOolUC4rPO1F4ybQ+0O925uRZY6HAL/cW7H6sKfnw
 xxHRtZyK1gHa0hSN3aiAQ7lrf+4kkowiMhlG1Xg06fYvfFsBHiCb+GinraGElo1eSnHlM8fZwkJ
 MgMp00RbLhe/anU3QqP5y3J0o6YoqKRnRH7ITIg3hi3mE7icPSwkYL9sZ0X0AQ07z153W/uCOJi
 8KOd31RouP8O9oJL3/Z/n3c4jYJHpgWYUr0stAAR3s8tFpOW1YaM8Cpp+jXhJEh3IKfsrWCsfjh
 a+zN+uQ04vmYchqCo8g==
X-Proofpoint-ORIG-GUID: GgH3ZDxh4xSxKtlU9rwX4p7zFGWVHCWC
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69bca8ef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=hYMYe-gnznq9qBW6PAEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200013
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56443-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18B1A2D4E4F
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


