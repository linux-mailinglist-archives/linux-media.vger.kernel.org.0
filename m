Return-Path: <linux-media+bounces-49478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB2CCDC376
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F21FB305A360
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739A533C52D;
	Wed, 24 Dec 2025 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKP+egiO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCbC+XuG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58CE337BA1
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579495; cv=none; b=ljcxVwUCd1WCd/Z4xnZ9SoMeKAGa0ZcUkHR4qIanVjAAxNvGoVXgDGAtx/fGT+HyfaxofqkrKOvBLRmBYpWQAdj9Arf2gwAJPUfN1m7jhHHYdOrJIk08WpMx83U9JQcPRyQY3Z8rS2x+r3JFw7qNmyy3s83KasvSDUbeRs+O/4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579495; c=relaxed/simple;
	bh=IMLWnBpEdvmDo08jNk86LMqu+0sVPIzGgtm02Xt1+lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=En9iq5YG1saAUkNf2vIUDuY8q/nr6IyIKHdK2525vjJGz6oeZDeEjiVGiJvdP+3ExbJBrPKYVOf8lRVptLzksSr3KocoxZ0423yPCg0dVJylnewKTs4tjYpFpytdht6mcXhzEGwKb9wukaHQx57wgFK784fRGA0OifPPXC9wENw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKP+egiO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCbC+XuG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO5Y2Hu1018267
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEoBh9JKwu7r7A6P4EErTSOLtSnplstn9SiQ4qQUmE8=; b=kKP+egiOKgzx0nwi
	Ihz6XdWM4nTV1S7J3FchX5ktw6Fakrjx1GC+jvqnv2p7YSw/c+WHp/3sz59fiwaj
	RuEGLszP7RxxOrpM77b9mOiXezPqizX2giyCNtg9uNODB/J4Pg7PyYDznl2yMXWh
	OaWclwPTg4IzIlvY53w35S4u8JuKASS7jZCPMXDSWwRYd29eGwAad8PYp/YbcdBm
	QxdXHmCOFzVRd0zZPPSk2zx2pNtivLxsp78AMCX2mhn0uGyzFhh63U55+ZaXmOGq
	GornK1WbwiiYxfbBjewiU200R59zTGg2S/soOvIJjEdNWR4olj7bMsW/iOZHcWvo
	iN4isQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsaurx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4a5dba954so139538881cf.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579492; x=1767184292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEoBh9JKwu7r7A6P4EErTSOLtSnplstn9SiQ4qQUmE8=;
        b=eCbC+XuGgm2vapEw0UdbxujsjohKZLXHh9iauFcVykK7ShryOzMfFQ4SoMCsOiWgp6
         WK+6Svfj71bh/rNl9nJmgMrx9PbJfagBfOEYdIKD/9dRSpkrdw8Fc/OJea26q9SI9wst
         0ifL0z2GBjMmX3aywvX7uioVCBZuqahtnIy39vHF2DjIhqs3Q6LCOeSUoAs+nRRf4rcE
         PSBJihuXMlbEUWTVVCciCG5ovYtFtB/BAzF1EZVuQQknmQRx3WGaovq/0vymn3u53kyD
         K+4/kNER0IFnm2KbHdX2D2nXpynxmr8rXXineO40LC0t6NzadRt6bwWx533v3b7uGDFy
         xyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579492; x=1767184292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bEoBh9JKwu7r7A6P4EErTSOLtSnplstn9SiQ4qQUmE8=;
        b=d/8v5QAqaBaAadjtnXBpXaJ56a1lrwffBNmDsviVswpw1PJG1vIbnzxhYkHuwRaFgV
         QmZ0I208p5mo6+zaFFAU7r87Si0sbRX3+JfewFVQ6DH0PwIjncmfpmwlJ2qiHz5enM2+
         4LMrWg2jylpzzle8d2eAXZZhFz00g4gycNqi1jLBSDYJX9Blha+QONNA7MGw12jXAjl0
         eChcAykAzBkmXWN1gbYCtuKu1v6e9+wCAXqBL8tIXhiS7Sx5wBs/LVvbjvwsY4cQCur3
         htRVN0jyxPNR09bKzKgBNYsVdcBkefzhRYWyxNGMtUW9WtE6fiKpUO+0nOIOdEBBHu1j
         57xw==
X-Gm-Message-State: AOJu0YxgM0kvevfKR1dXYrGcSUUZE5chkSYqx1pnfq4h2+846XCGHSL/
	FPFohfaqlP80Axq6yG7AphI60z+GGgKB0CEPdlzewdUoWkyBkDX9pr9rO2elyomKGJbhWqNeaqL
	tCXUk/fMO+8O3JUXKl6FlDIj4wdmqiRnzbBYUjIkxtFDkUkpQ5e/fAUbbqAKTDvHiYQ==
X-Gm-Gg: AY/fxX7nTRpfTl8cioQERGBfhFhIdCbdlaA0xsBt3WLq97J3qwZYEBlhPxQiWbnKNS4
	bsqOKBjMgeCE4mVeQvQu8pxK+wDE2Rnkkq/oW4Yz6o1sYyxSDprnHGa5sVUL4t/i/+O5attdt/C
	vlh0HN6p8EtuLWmVeicAmLCsDcQQA/RcC3D4fKMZ/7zC1XSdhCQp2UTd7mgtqEzjtaD+rLLUjIU
	+r0x2omKmnFIDDj/dTPMRMPsPu5IM9PFotbAT/5+sDD4hh3CO7weWFEBontJ0nKAb6+xbQjln6B
	ul1NTg57zHuxRZkUHmSwfHMoMhqB2tiNXuAvk4mwSUpUwsL96kFLAti4p9hsumEpseKp65W1b6w
	QhgyecFKSnyjVZlCoYOxGx2pEYIiRsKITPNtbK7ONAgvdOS6kTD4VN1tyRlvFYv4nIf6hBuQ2fo
	LqARYUtDGB7R2HCzKsStYWNpsHL+WKvV2xvEVbpqQA
X-Received: by 2002:a05:622a:8d07:b0:4ec:f05e:2e11 with SMTP id d75a77b69052e-4f4b43cbee7mr206714341cf.80.1766579491864;
        Wed, 24 Dec 2025 04:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwJCB8NRVia6NneXVnLVFWql85or5cinFqsljTxuShriyIXsSySNjTAIt+O+zfUO/rvvpTJQ==
X-Received: by 2002:a05:622a:8d07:b0:4ec:f05e:2e11 with SMTP id d75a77b69052e-4f4b43cbee7mr206713981cf.80.1766579491466;
        Wed, 24 Dec 2025 04:31:31 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:30 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:22 +0100
Subject: [PATCH v4 13/15] media: mt9m114: Drop start-, stop-streaming
 sequence from initialize
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-13-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfXw0xLh2plRF6o
 rnWt7EUru86asPkTPO8TTCehbbtMtQV4kDPTIBpWjLHEU3sOlnDzasOw4fDh63OhCkxb/6FCHi2
 WIuT2bVAkWRsdSP6hThVLonsbDudyNVlYudRTHA5emK/y8/Imm/LFU1jMD82RD/UWZHK+wIOg/2
 nRHLvviItHtt/jl6WzqHdcuNbPgWZ4Lf05rZzUN/h1gSjAk9w8o4V9hQUpwmyldYLvteaCqOAIc
 SV0O5uW4DHr5h6bvXi7mzBWOTJNGAYNKulXhEOvJnGlLWxhT2ahfMCwZIvdn4+DZSyl8uO3XBPk
 hOSA/NAnrl8drGC8JA408eZBEF0cVwcUJ03bLeQrB5AQnZKTnaXonZ/H/MpoHr63NJ9tpcygtWb
 yfmGnCsQYzFa8sdPCNzQoy5ls5ZD5l+0KUmFav2b0s5dOJFwmZ007wM1vgQQzWrxBLS/VnT04j0
 r62Uptv7PwFaTaY/hcA==
X-Proofpoint-ORIG-GUID: 1aUwaAo6otLdeA6-kZ-XxDS5PUh6I9Jr
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694bdd24 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hSCjdWxdfPpt4Nx0-uUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1aUwaAo6otLdeA6-kZ-XxDS5PUh6I9Jr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240109

Drop the start-, stop-streaming sequence from initialize.

When streaming is started with a runtime-suspended sensor,
mt9m114_start_streaming() will runtime-resume the sensor which calls
mt9m114_initialize() immediately followed by calling
mt9m114_set_state(ENTER_CONFIG_CHANGE).

This results in the following state changes in quick succession:

mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
mt9m114_set_state(ENTER_SUSPEND)       -> transitions to SUSPENDED
mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING

these quick state changes confuses the CSI receiver on atomisp devices
causing streaming to not work.

Drop the state changes from mt9m114_initialize() and move
the mt9m114_initialize() call to mt9m114_start_streaming()
so that only a single mt9m114_set_state(ENTER_CONFIG_CHANGE) call
is made when streaming is started with a runtime-suspend sensor.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v4:
- Move the mt9m114_initialize() call to mt9m114_start_streaming()
  and drop the config_change_pending flag
---
 drivers/media/i2c/mt9m114.c | 33 +++++++--------------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 447a5eb34a6137a8e87bd119401571b5592fc77d..41e98f719a23045293ee47d8980675510a142afa 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -789,14 +789,6 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
-	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
-	if (ret < 0)
-		return ret;
-
-	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
@@ -967,6 +959,10 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
 	if (ret)
 		return ret;
 
+	ret = mt9m114_initialize(sensor);
+	if (ret)
+		goto error;
+
 	ret = mt9m114_configure_ifp(sensor, ifp_state);
 	if (ret)
 		goto error;
@@ -2318,19 +2314,8 @@ static int __maybe_unused mt9m114_runtime_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
-	int ret;
 
-	ret = mt9m114_power_on(sensor);
-	if (ret)
-		return ret;
-
-	ret = mt9m114_initialize(sensor);
-	if (ret) {
-		mt9m114_power_off(sensor);
-		return ret;
-	}
-
-	return 0;
+	return mt9m114_power_on(sensor);
 }
 
 static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
@@ -2562,8 +2547,8 @@ static int mt9m114_probe(struct i2c_client *client)
 	/*
 	 * Identify the sensor. The driver supports runtime PM, but needs to
 	 * work when runtime PM is disabled in the kernel. To that end, power
-	 * the sensor on manually here, and initialize it after identification
-	 * to reach the same state as if resumed through runtime PM.
+	 * the sensor on manually here and identify it to reach the same state
+	 * as if resumed through runtime PM.
 	 */
 	ret = mt9m114_power_on(sensor);
 	if (ret < 0) {
@@ -2575,10 +2560,6 @@ static int mt9m114_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto error_power_off;
 
-	ret = mt9m114_initialize(sensor);
-	if (ret < 0)
-		goto error_power_off;
-
 	/*
 	 * Enable runtime PM with autosuspend. As the device has been powered
 	 * manually, mark it as active, and increase the usage count without

-- 
2.52.0


