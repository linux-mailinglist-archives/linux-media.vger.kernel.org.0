Return-Path: <linux-media+bounces-49470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFF7CDC36D
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2196E303832B
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2D7336ED1;
	Wed, 24 Dec 2025 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYIGH32Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAlwzIWK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC603370EB
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579484; cv=none; b=cIcgoSRFjPRiWtYTd3++ISsJma9Vp6iAQZTZypfBf5Nn644Sr8Qqxk4aTrKwEnG0RCCNUwgdwjw91ur3Y7cKY79xviQ7Gy2DI6YmtyN6B2rKol2vbSjObkp2ww/MvsW3cssq7fuMbhMWv4Tay2nNCrobQ0HnXeIrXLee5i2WLnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579484; c=relaxed/simple;
	bh=fR/JBGeUDY8L3uZkc7VehEJU2PSE9gi//wsklRHk5bY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIsc43DHFRPzKHAG3Xao/rZDFD2+x0u9Bt86iBhJSfSFduKhvQUxOcpz/0MUC9w2SaD2kFd1X2nkHzmTIje6iNz3Jg+BXolxvLyF+T1drcf+tTFPiOE5AYU5acX241U6hr0v4AeNc1qBhF/j1B+wuMyy8h+AKYbr+/CfKsman9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYIGH32Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAlwzIWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3265U462214
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ZmW0JfzCy1J7ZjX2Z4M7feueyajCdPj/1Lchmmu0sQ=; b=TYIGH32ZiNRnXuiv
	S4NuXkUo2kU/sczIBovOeTXGFlWlL40ive+Dng5zDmS2FQ+c03wVyjPcRxOvqYfg
	Lf3SAYPpKwMwD0EGi4B/fiImnLAiRv+H7l0mI+BymkA48m7ZjeXhnQumDd509hQz
	dCotLKu+U0iTEAIGBtfy2BuHKf4KxuPZzw1eVUffo7gtgw44Z7h/0xK9vb173L7l
	Jk+xeFLH3HdjYdV4xdcgRkiQfegHYauaG7ir+0BDpQwxmI/lXY1u6L7yEmljpE2O
	4L1HbslLFKIXTVm/vxvuND8L8yYCOuhRPaYTiN7eOGmZr0TKfuOq4XyzFSGZLDon
	Z3CyBw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fu5sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1f42515ffso141455021cf.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579480; x=1767184280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZmW0JfzCy1J7ZjX2Z4M7feueyajCdPj/1Lchmmu0sQ=;
        b=dAlwzIWKd5VaAwQxoDipfP721ih2JYgMajC6XaspuML2r/fiwe8pGKMxGe0wLd2Gta
         dRpohU3ukEcTqTyAHQMpm97KxFMvssVau25Oiko+ZPJSXp+e1HCNccwfoQu9u3K7ElWZ
         978ogq/I5X0Mt39Lcjx0+7HXIX0E4p+1tP4kj0C1jp7AIbc66GNczZ4b0dKdvJ3O2nqt
         yRoxqXNm2jvibZX0sAssnGXsMoBfu7MxBRBU2Tj5kGABKsh4E9ijIC/tQ9/QOo/Oz6Fl
         v1kFiON8jtdkP/FuN2DCfkyRn9xfD+EpQny9Vg1aQobwtfpIpnvswbSojknzHsziGAX0
         qPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579480; x=1767184280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ZmW0JfzCy1J7ZjX2Z4M7feueyajCdPj/1Lchmmu0sQ=;
        b=gCyocNHWBWt3TalRxMvWPY8f3hG14SBKoxAkhBy2zUNMp4ixuX9B/KItT/N2EE1vw0
         nvuG9tMO0G6NBYzIhNg9e+YgMOu+0bYmR3vesYGvO5DvkVV0YEeGvUK4sNBJ0CKaE21w
         mu4kAOHbM5h7iGOlufxBgJDtTtI5DV2UAIm4wJljg3i4UObVtP07+zE54TRj2+5cmR2j
         csbQ6ua9w9rxjrRvJb/lv0Oop8A0u49Os3g9nRLvULccGbe733avFMhYitsBnWgQ1gqu
         M3PLCN4wjGb5sMgadStyjpM2LqxcMUiYgPW3/Fwp0NrNrCWI1A3r0+qv0oG0guBoVvFp
         zOUQ==
X-Gm-Message-State: AOJu0Yzzy8rAoIrdJv3gQGBJiDDhvOkxZkF61BoTxJbAaGdHP8eI7eVO
	agE11luk/272DXHymNJ0/Y+euPywPAYnl+2ScqtBoj1UAgkPl/bkJVr5yWIxnqIFrlDVYE9Iiar
	I702VunMUmGB+20rxAxmHeamKsnW8Xb+psJdg5qMz1+0iS/CWHLKGOa/8oGab5A/SAcjnxNLBlQ
	==
X-Gm-Gg: AY/fxX6Zkqg4eKOAMMskqfpUXYIFGCX7BlVGpCS1AbAJbQpw4URyekSd/gJhPMZEIdM
	AMvObZlFKanbYaT6KoWeF7Jgp/LpRNysnmDllfXxzWVep8Up49pwH5SM55b92bXD+FgCY2TaRyV
	JFA2ZeRWMcu/u3r9ZRxFrbtjwN/e321EPpsK90OiQYcck9SKpuzPzuzGMOjfUz6/Mdhnfc8cVvz
	1e130XDNgpxa22Cm4sGf9VC2W2PrEYxlAmfpi/+hfMyY2gY6bdD03AY/rpHO1tmRdZgm1TpvPQm
	02JUuTsbrypSd9hKooH1lrlCHQ21egLr5JXNZB2GzuJ24tO5QV3HNvzgTO6kU6OWdBSoeRLAMyu
	OCh/M7ReDML+qJBJBuxo7eK7LNYf6X/WsxzmFTAtoixQ5HVJRBxAe6I2A1SrLOViToCPKBEZV50
	vrArEeGD8EgcTzS9FzflAy3yVsPHvFWlIU0u0+hG3c
X-Received: by 2002:a05:622a:5c05:b0:4f0:153a:65ec with SMTP id d75a77b69052e-4f4abd78ea0mr254876321cf.40.1766579480256;
        Wed, 24 Dec 2025 04:31:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEe4VlcMJU9/78lQt8mav1vBOayjJg6SBN6pREq4nklWH4BBei3urptlUKobab8bG1z5DsSMA==
X-Received: by 2002:a05:622a:5c05:b0:4f0:153a:65ec with SMTP id d75a77b69052e-4f4abd78ea0mr254875751cf.40.1766579479775;
        Wed, 24 Dec 2025 04:31:19 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:18 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:14 +0100
Subject: [PATCH v4 05/15] media: mt9m114: Fix default hblank and vblank
 values
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-5-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: y-AEG8gFm1i7-mIlnmC2yMms-vlQzOni
X-Proofpoint-ORIG-GUID: y-AEG8gFm1i7-mIlnmC2yMms-vlQzOni
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bdd19 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=5Pw3dBPW34w_b6RJA_EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfXyD6fPihXemcY
 JtZm9o4oyWAjA5ZL76m8gmpZbDAqLM3/mqcsLTTTXFCV2VAmpwStDNwJ4KJAd4vrEFhuJF1Gi98
 JVOQA5DNGu1+DXYIERBH4UCScnFBrY2uLNI4BLn0iTaTjfu6eBTEK95bcJtayeWutucGwMY4AXS
 Ubz1zscc9H5nXfviaQ2NXc0v3yBKlliuD/8t3wO8MQ/HOi1Th1nMtSQ3UEbOH3Rdyot1KBkQaOh
 /kNarDJJMBCLwxr6iFgOMH/omfIf9xE+99od6FdV036sPTcsTEaqzWNdZA/fGaW3d+f9LAnLcc7
 oB15fX9RKbzTG7V16A0BSNdojmf6j77r/dl1Dt3H0tMqmiPH740ipMrPKvLPnN3151yuYXEUYe8
 SkR0yFVPNNh2e4CfH484BrPiS0SBSfhMcHBGaIg9U9FDd1SHvu28ZTUaZVZTP9JXOCLQ4C7Bq9G
 gagWjSRG93nR2+jq8BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240109

The current default hblank and vblank values are based on reaching 30 fps
with the pixel-array outputting 1280x960, but the default format for
the pixel-array source pad and the isp sink pad is 1296x976, correct
the default hblank and vblank values to take this into account.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- Update comment about resolution / pixrate / FPS to:
 * Set the default to achieve full resolution (1296x976 analog crop
 * rectangle, 1280x960 output size) at 30fps with a 48 MHz pixclock.
---
 drivers/media/i2c/mt9m114.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index f63ab4bd040a4a62833d8bc716f94fc29aa03bd7..3fed509055142d7a134cae6cabadde423743178c 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -332,12 +332,13 @@
  * minimum values that have been seen in register lists are 303 and 21, use
  * them.
  *
- * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
+ * Set the default to achieve full resolution (1296x976 analog crop
+ * rectangle, 1280x960 output size) at 30fps with a 48 MHz pixclock.
  */
 #define MT9M114_MIN_HBLANK				303
 #define MT9M114_MIN_VBLANK				21
-#define MT9M114_DEF_HBLANK				323
-#define MT9M114_DEF_VBLANK				39
+#define MT9M114_DEF_HBLANK				307
+#define MT9M114_DEF_VBLANK				23
 
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120

-- 
2.52.0


