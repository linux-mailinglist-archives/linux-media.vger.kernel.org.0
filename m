Return-Path: <linux-media+bounces-56287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LzMBiGRu2lmlgIAu9opvQ
	(envelope-from <linux-media+bounces-56287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:01:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DC02C6761
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 023433123CA5
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C555939C008;
	Thu, 19 Mar 2026 06:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lc7V6YK0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hPbMBDLl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC639B4A1
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 05:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900001; cv=none; b=Qc4btZhnHRUq4hfz/p+g5Qlv2JJbEc3Qu56eFYrRmQQcraJbMRGa6dPk4kT3QC/GRUYCUmKjzzZLYx7Dhc5MOQlC6TuXk+PdA9B9FrERXfIgLBmHf9ZTB16g3zmV+gS4v1+sxLGeBwqIschemE23wTFALELYJk9JxAQiiBC5PVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900001; c=relaxed/simple;
	bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iac8pMIXa+ES1hjBS5/Pk8BmRSxjY0ArwM0lDlYzVuBgBxNTHCewG8LrhhKNP370U1/Oeb8ZTqJSLRirPZTRgtPxfpYYdTOiJIyU8qhbGV2lEF/X6ey/f7RQCf6UdRWrQxOT18qeOfV/EiEkSZh2tRnM7Y3Q749XYpwkI1F2qrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lc7V6YK0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPbMBDLl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Xdh93172309
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 05:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=; b=lc7V6YK0FbSHn7JB
	i0R9nbyyH4z0s5gSIw923aJ0kW3D+WgrIWiGg9OqNh85P5fv7P5NOGFziAu8He2w
	8Ow+m2FzuozkIGi60WuZf5rw7/sWeZaf6HcuQI7MdsMxXURrXygGDliAOA+2BcEP
	XkEulYBYO5IJJPrawR/+n2QPRE5xggUB+bs4D24goMxGmIOdM3MomqHt3x/0QAap
	7lya30RseMaw6nKdXAPGLoojWchwiAj4+bqG9k8ASadVAKnzIPNyqn+U/EjSAe8P
	kSuzqigtDTj6GnBSw/+ncpiDk2bD5S7Vey8Fp+Kk7jgcMET11/SceNdDzK3GLGd/
	CH24cg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9hxup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 05:59:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50939597b85so33297641cf.2
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 22:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773899997; x=1774504797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=hPbMBDLl2fGHgdlw6D0Zg80W4QtiJSybk/yU5O13ZV8gSGDWHxkh5mqMG25lGoI+gG
         LGB/dy4QWGVx+CuQURNhzlPSp6PJe2xMY2xzv4220QKQ1C8NkHgM4QG3oeP2QuKzfG8e
         CU0flO4UPZe7yhAbQ0jsQVlwauJaSH8jzyIaJ4ioJnKosJLquz5G4Y+jiZvD6hlmEiHm
         8xBNS9PHnlkD+x++JEdn7CeogyWfSzFEMfCWRROTKSeuXsx1ER2iPgOD8rRKJMP255jy
         qW8FrzFAN73JLsOHWxXl3jt5Byl/Ug1l6D7vCvW2/HsHqxV7XWjqxTYfTI76xxC/ZG6W
         gE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773899997; x=1774504797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=QGQaU3vjZ6+RgFLJZplJ34pZs+UJjTW1DXfUrNjplxWokLfHKZ4sqU85DaeW+ggya6
         8bXw5sC+GpKQKcKn20ilZsLfkrWHsXqPHytFmquAH9TvQqcczU21dvfjHySGZJsYxxle
         yAQ4mEB8CnyZ9m2fz2Bv91OAvqveKJiaRZ9MbtDsK1dr6/xrTY9OsBwJFWpmgeRpvmk/
         7pMHgbxwzrYC2vt/HdGKBQHYNoqtA6Fz31L5O6wC4jCLolu3cWcuVy99oVXeu5jx74kz
         +pStRqtKNgZE9tyoM4zy6U7AjTaD+WuNRkwgKeCae264AFQZgzDdXD3XUKVwIH3OIZAy
         YRoQ==
X-Gm-Message-State: AOJu0Yw5aB+hGvAotP3WtJl9bA6FO9JA9T1TraEqRDjemHunsguBuYdq
	S+GoSQ/LOPP1qbuTa8orDQBcYFH/q7FNZ7HYkkXxxIbeefFdSdjSp9TT/FHML6oTd997hyjR78p
	L6yVRZs5nk+OX8iOUOi/gbeSVEpdsvKTpv4EU9PFCMHJVTsYEkuZbMCEvfsOaMpfWkw==
X-Gm-Gg: ATEYQzxR6ge/dXu61ET2Z1N9KsRmfP/F0i7gcun6IxfGf23wH2DgrTCumXU02U2hvPS
	XpsORxd+dnd/BLmoXJiVNzaaV5EViQL+T12sVCpWaKt2ixbGlXUOso+e2SziWI+RN4onjve0ekw
	SIc0h5xs8UGVVVVrPKPkkXL7roAy5jJGtMJS6GRhFqIwTu9Tbd6rrPCj0qxLir96ILpcGQ4w17T
	g3RZUt3pyyCUZVtPZNUVRkjUh6xvm34Nb07vw1P+r8IBzPlQNRsc5O/aslJAkeCfgw3JMBzHm2O
	wqMOVQIU94UOpeCOW3FwHUrPR0Z4aGDYs9KQmP3x5uNJ50ejXUScR8xXu0WVHCEO1k/B1H6e6EA
	hY9Fh/hLYH3oc1brrpkiQY3LGSstIQEFL4uz44ZUQovieaFIkMHV9ZyXDRDnG4J+VsPMy7NTKAS
	XtM9fjlJF8Bb14r6J5a+ZQltrrfsZaD8IZ5zA=
X-Received: by 2002:ac8:7fc6:0:b0:509:4fa1:d478 with SMTP id d75a77b69052e-50b14806c74mr80322041cf.12.1773899996780;
        Wed, 18 Mar 2026 22:59:56 -0700 (PDT)
X-Received: by 2002:ac8:7fc6:0:b0:509:4fa1:d478 with SMTP id d75a77b69052e-50b14806c74mr80321771cf.12.1773899996290;
        Wed, 18 Mar 2026 22:59:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm993174e87.56.2026.03.18.22.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:59:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:59:45 +0200
Subject: [PATCH v8 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-iris-platform-data-v8-1-55a9566ebf60@oss.qualcomm.com>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6161;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGm7kNSiH4qc82JIJ47omaPGDHRE4HukOpV7GCXPWv6FZHJ+x
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpu5DUAAoJEIs8ij4CKSjV7hIH/AuX
 8ah352W2TAfSKtPGvCutlH1itf8tcu4g4qewycoHfAD4Zn0Rmfp5BNAiMzgDObrfCCa2FQ90L/X
 GOO0GrIzNC12IcEJ7PZusILjpdKhrltUSAfTUeah/rEHVnGFeBMdTBE/KnqyTKbEs2DXJkNBuSh
 voABuZwktgJ/jE+k4QxhkiC2vZcCYEnk3HftR6Gx2O8NW6sULka3sl7YEiZkRnZ77ugYsVywvMP
 t1smZGAeEn3TyS/I6qjdcJotrG4hmeGjqXlfY/74CBRfM/fMR8wVTniFpnR2T2BeW86sT8YJm8K
 hxHmcu1HbGgy8QZatQC2BgexBgcLv+oocngyOgA=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NCBTYWx0ZWRfX1BSv0W7kbogw
 Yrt/1VcwUYHSMLsn1k5OHs56stru/CNR2pgnY+1esnMc3f1dfwmyc14A1zEDkxFBIt6X9Jfw5Jb
 vkdVCqrgxd69OPy2GbXLaHrJfXkebsST6XYmyM8YykuPF8pkJ/fumDMHMm55kBtQ34TauYDVDZA
 QOy6ka+eR2hmoYjWkH6NJ27Fej8GYpNiyJLFS+XHgBFqk+c5zpAt8bgFaWdFO39Czy1su9y/BHI
 tilOj1TRqx4vlgfsgZEagaaAIlqIJmYBamBMPC1lXNJ1lnHmqUqhOJkX2NTL/fHZUF1dZDijfAs
 X/Zeg826ujNWpddcRPhp6I8ZGD8vjCOJ/OWZ28B6PRGbbda8PbcqfgvneFzwiErvuDascS+lq6P
 fl0DjHvC120QZxhBLm3K6GXkgiJNc9n34s70dQRUArudzHlXO8vgjsCO0LDaGzyg5okQB5SU8eX
 lAese2SeTIy8wivG40w==
X-Proofpoint-GUID: PrVxRLXdfFf9iTYO6tNxag7ZKO0E11Tn
X-Proofpoint-ORIG-GUID: PrVxRLXdfFf9iTYO6tNxag7ZKO0E11Tn
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bb90dd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=hYMYe-gnznq9qBW6PAEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190044
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56287-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: A5DC02C6761
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PAS ID, the authentication service ID, used by the Iris is a
constant and it is not expected to change anytime. Drop it from the
platform data and use the constant instead.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


