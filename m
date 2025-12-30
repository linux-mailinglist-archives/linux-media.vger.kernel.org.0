Return-Path: <linux-media+bounces-49747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7947FCEA409
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0854301EFDB
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58A932D444;
	Tue, 30 Dec 2025 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="po2c2+3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZEC5U3L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521DF32BF35
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114201; cv=none; b=MpOCmQ1FbahFYmtzcWjGlnf0ZRk4BvpMs4XfyZv1TSQk6og7Jg4mLDozSl02rx7f8DKUGOGgPiNxkZYAnuk3MXP1U/mrt7BQeCiXVDV3OkipTNxjlT5zAta2peTt75oRMtonV/Y4mo4uee951mWsLjt958ookD8GpsHLB2GBvhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114201; c=relaxed/simple;
	bh=Cwha3Px1m/zPBd8AbVvEtXLPMzCeLMJgNeMAIHr21dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d8ATLdCGiCC/22DcIRpQH0VKB+BQ1fzxEHS33trZIq+9PpSZZ9nk7a7nfMsANVBXizdjgqXU0rBgBwnADGzFBUX75mKneI9B5Gk3xTO8e90mIDITjtFVCRdHJicu2DMcflDvpYZWF50PJB0qsnHW/tWJbLAU7g61AOAVD6diue0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=po2c2+3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZEC5U3L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU8futM2284787
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPfzMnbmbFisVAYJJDxs6C4Pzdhg/FOKBAdmstLRHeY=; b=po2c2+3ScYvoPY+/
	ktOj/Joq+aDAi+OHC3w6AFcB6J9rjo8PuQ7F7/nfFLrgsfrrxQEmvAhFFpIuhIJ8
	7l5BrcW55zkq9VEBY2PJU5DPnNp/qwYJ5/lCSGk5/HxETY5WfMpnu8Gt4oANeWVe
	NyEmIN6VmgyRqumn1tAy99peZw3ZMz+ZaLTIcedzc1VZKSer28kmPZDv7EhmTlVT
	iypwNBranIKF3UuKrcUEp0j3QnqddBrNgfYfTOgYfPpFPL5FlLXk6egFFayvzD8Y
	PC0VaRzh99DNO3sVtYZBPpwzHAs8T7v3afRNbXUWzBSfZ0hOZ7WpHFUYQGIBnMeO
	+eScog==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gtjku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:19 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-78f92e123f5so125112597b3.2
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114198; x=1767718998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPfzMnbmbFisVAYJJDxs6C4Pzdhg/FOKBAdmstLRHeY=;
        b=BZEC5U3LYZUydUlcaWbqNDZjIljsQ4Q4yckHxH22jy62jjLRtPLOjHbMnABDqB3CXb
         MDlRkVgQkLJsOtce/H5XnLZvZXjNmxAtJ5heq5yLtjloCM5FA0j3wOhqNv8HXHizU/zp
         meOWL8hhX0cZ/Jr81zoIVcrKETo8Zcoiaq+3+QG418Y8gpMPBQyEi8vEichbt85CWXzw
         S7wiOwy1mJgAgMWWLB/uKnG//trIbiWTnidrIVWXxJ7Pdd9YasDLDH3VAlRtRylJ5wmy
         B4SBk9b+fWjeU8i4zv6zJxfoJYFoYrCtuXyDlpCO79eEeCfWyFNoul3JQOEOjixKFv/3
         muxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114198; x=1767718998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sPfzMnbmbFisVAYJJDxs6C4Pzdhg/FOKBAdmstLRHeY=;
        b=pnnDxl+sp8f9miOcGFEVcvNmYkCSkvj2mOyjQqIcVcWk77KJGeGqTXl7R0O5N8yfW9
         GSDgYaqTXMWHxatmZOIW74xp6EO3DvzjlHYfFI/1w1WZDgbaCHCFzBcL2xsJn3F9IZJO
         GuCcMy7Fqp0fyWCWDRnzCg1ENwnCdxzrYR4/afAfydtOW3bHmUnY8Qshi+2HpzoA/lvH
         KJx7s5MJyNH8nNquCJ3Y+xx/NduQNGuBlYMacSs3FdUe3NrOMwySYx0guW9f/i3K4BzW
         CDA3vBDxUsJHvHYgaDe3yFViP9n9nPt0Rj85eJEbNo/l/xhTRy6thP0nZh/dWM1oBPl+
         /P1g==
X-Gm-Message-State: AOJu0YwCf0KA7nsX5aNtKEj9eftTFHk/mG0uwRRnf3dfc0cxBgMDfKEc
	q90clfXD34i4fJalvGmJq518riC9etmitkxEoeL+fVZdq7SPld8tJYTGgR4YtJX9gvsq4kkQSQz
	evmjUscDw1SXTsq7MMneo82GT7OfNQSiaZER/ueXyMwY4NU0R6IHGEHUxmrDHsyIOzjUxWVf3IQ
	==
X-Gm-Gg: AY/fxX54mJD1v2SqwRo/n4LDu9HUK/w/nLMLLYRa9/24/V4dZR1VRnHngSNEmGurS4r
	zYUV1sZtKzvPKGZl2Me2pj6ihn6p7f0Nw6K0fcQKvEEC6jR1GmoiBg9sjKiug7YUCqMgwCsHGQY
	DITdU+7c7XybbnaLBNp8qPc+aRxS6bFH4LJdv9rUajA8iLzufR60PULGSaqH2QyaE0YmYXD9v3e
	zAXiH8RzXwDXc1SMNXCsAamhYoiMhBq3X9W4m+vOH+g+Fp39Z9jakSfr6ylhuM+NrlYZ3hxULV7
	f7+u/lYgJVrHD/zgnvmJlhi7mPxENt7YYt4q4akiGSNKisxDJEuO0XzxueT5QY9Qnu7GP786QCF
	8qmkdGq5OpvkXuUaHXnNSZuN6NVq9wdUW0HbJksqd4UhDQwUziehqNFJ/YmL21EuHHBAJH03XmE
	cJ+qYkwiAJEqwhTaSW/oju+XKLi9V7CvCHokkx+k8+
X-Received: by 2002:a05:690c:968d:b0:78d:f5f9:aa9 with SMTP id 00721157ae682-78fb3f31facmr276677367b3.18.1767114198192;
        Tue, 30 Dec 2025 09:03:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0xZu/T+oVGXM7NhvV2wNbK/Tfal6Kx3w6wvnh34Pjj9UpcxZY4/TKNhPqmnQUYbj+4hVtjA==
X-Received: by 2002:a05:690c:968d:b0:78d:f5f9:aa9 with SMTP id 00721157ae682-78fb3f31facmr276677127b3.18.1767114197807;
        Tue, 30 Dec 2025 09:03:17 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:16 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:01 +0100
Subject: [PATCH v5 04/14] media: mt9m114: Fix default hblank and vblank
 values
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-4-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: D0WF49i8y0cGdpnMGfkMhMbV_x2tnqpk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX5heKJ2H9DbKC
 +uNgwpljWYsus7Pp+9rW26ucUkxPpPr1SWUMYCEqRI5x3UON859fp0V7ceW9ZynRhbhznDE0x4V
 pxfhLco/GQJLtKK6RkEQ68w31oMJHeeDqNfTck1EB7N5GpniDFvZKwvvRjmO5ocrif1r/oUPBGf
 8ePcSsDnZHrytiZnd2oDZ038E3H+u2b9qdGSYtPY+hLXmijfNhNO8uZo5z9bxA1my4FRJ0HqtLw
 NnlKvLg72dT76xNZy1UrP3IrtlpPFzyhazENbnAAVfG6rpxkq13PLpbczszmJ3k4x6LmPyfjhHu
 oTowB1oMAwA9pCz8ECtoB8YcG2uA1GpZIr4mmqR5OkA8a8S/u5Vp2NyvYoUog4w1bE0xnm+DSO/
 4EZscFkgQWztHHtC1izpOsetCkSEy9kXUBCM04LfWkC3R0ZU1QTtGlymxY0RZENkgNSzcweKSRv
 kB33Lcpi0O3pcOOt8kA==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=695405d7 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=5Pw3dBPW34w_b6RJA_EA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: D0WF49i8y0cGdpnMGfkMhMbV_x2tnqpk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300153

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
index d9cc260a13bd9f7dc76b69696ce18b953f43e3d0..3cb00e69623fa422bdecbe3eb36f911d92405341 100644
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


