Return-Path: <linux-media+bounces-48481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6208BCB0829
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 17:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8356D310296C
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 16:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66CC3009C1;
	Tue,  9 Dec 2025 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juZylYra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xx5RIPJS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B485B230270
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296394; cv=none; b=pUN2fIWp++zXvXfXDZoQDjkrGomz4YXWamp/ZQcf+9zqUqrgspueBmS1kVODFR4uozzQvTGEDLbeQk5pG3FCWosry3VrniOVhgghyOLUd1QYah4VEqX0E+lN+ZYCFTIoYXULVZR5LIjYhBOwH8UBmPyX1OO7OWzgCKiAZ+LN+Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296394; c=relaxed/simple;
	bh=kqQ02uNYH9dTb+2vLW/XOdwhY3+ZH6CdhKOcNVb8kMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzgdOafTWFminux+0raqpBj9RrQ/lT702Y4aibnL7idT8eJCUffdwxlLQGHNQ2+0ojM2ezIpEfQzMkf5giFY5MK7A038iVLi3erD+Mjv4VE0QUkIBoZPTomhaZBzQwtdEEmSZrObd4UA1RFGvRDzhE/0+iwxfEqY7kbkhjndGBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juZylYra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xx5RIPJS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9FiDW43605282
	for <linux-media@vger.kernel.org>; Tue, 9 Dec 2025 16:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M5K3JSp5UL3
	18I8topMFMu2S5qWUL2ydxcamTghCIUk=; b=juZylYrasm3Ya0LJq6O46JoLMMl
	ri0xOnPfGrO+Wqx0No1rQhtfxlDbdmHMQRydPaRwUT1SXUFmMR2yEA6mecPX3xU+
	NdV7pmIhY3HvZlRC6hpkF23YvcmxWcqgjcIsDThp7VnkufJG/0nTkmAaqXlMZ8r/
	n8MEM6R3Q+kkUNk4lpsjrBbRN8PKPo3pPrdvo0xOxduFq4TtGPNvzmgcU3WHQXNA
	lvhX/WPmg+Q+FczF5PSr/tQ2iX7tX1CEAo0T/jKOA8tfNWPXqrNk5UX+Znc3tNYJ
	McMmtbXdzVIG5wnoeF4kAab+IZr5eFTNSv0rUwRJGPOiHaAEf+r27lIVlEw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp4vr65a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:06:31 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55959f13235so3025277e0c.1
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 08:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765296391; x=1765901191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5K3JSp5UL318I8topMFMu2S5qWUL2ydxcamTghCIUk=;
        b=Xx5RIPJSlfnt8uTI+86/DA5Ss9rAneQdhHOMIUs86N6XZfa24gPPL1pW7KgpZt+umw
         lGolc8RuMJyA/vUfa7SgHYlzra0w/Wp90dSrLOQXjUB26+qnQP5rVhSGhcPCG/sYBAjN
         kRs+uTYmZE2x8AJpKGMdb3UooGuOviPh0JxwXRUtT2Fb0+yvGk9WhxjrLSYxSWSSKHH2
         fr4nplKejytBDKqFxdd0JZmtujKzg7oAndIaXRwuWKxwrrH1FYB4LUqjnGcfBrvY2gvA
         iPij5DqrYZFutHuNj0OqcQrMiIqejrcN8xJDVdbN7n8W0CVgoALZkC4o60IpqViFC1yd
         hPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765296391; x=1765901191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M5K3JSp5UL318I8topMFMu2S5qWUL2ydxcamTghCIUk=;
        b=jRTJjFwZ1i6gGfywiDk8MdVe/L/KaO6tSbWxA0ia30b++yO/zdG9FgXTagGGmjFmLy
         0KM88ud57sZ9BqW1FYxzC+wB8T6euyewQqKsfHDSpa5Wi4MjtSSFr4VuAa5LnLpWNkty
         mpGiV9esnxbEeuYYbmYFQ0+6oHO3v7uasqbFinv+sB92iRHvIdPTdojARnMoF2D1d1oy
         XuvFiLYzgkxhCE1CFcxDm1R4G0HCwT4B1GwE2JivMJpPoskcXkt/Z++thhvaati72mtI
         FU0VgVk98GM8ib5jqo5d0ShQhtuy/6WiCRbhDR+o1bBmlqyLOEeaPf7TkzXvAxh1xY1K
         St0A==
X-Forwarded-Encrypted: i=1; AJvYcCUDNvZ0Cta6tTiR69StZpXFIbBS705EleaWAVVP5VmnjZH/IGQMCpRDOh6cxZ5x8pndCXWGsXm3CDMAUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdCgH6g2DkbLx85CjxtNkjkH/Bcd7nonLPkAJ6osZz59JIV3zo
	Mbz8bAHqaHEJNVTuvzchvrMmefe2ax7RhMSKbIJ4wzdw+1zRHilr99w+pAnesv9ro2dpLDGLJtM
	djtZqXdj3xOyi7IlgCWnBvDAr2Ek6pNuhLu1n/KIwxwIoZQaGVsslQ4Bt0k9H/Lbw0A==
X-Gm-Gg: ASbGnctwEuyhAcZHcJ9Vw6KxrXUSGnE4OgUJFeFo54Fgl6u2zuANPF0PYkmB2a+U4ep
	aOkv9cvEWT5hjo9mfnafnye+FbFVsxsF/j7koYt4AdaUGl5OA1kvvUjQc6H8g8rijHlechhkfKC
	fTRXKlnM1lz6SIFQ4mkVYl27BY8JeAaMP3YglWN/uiYv9i5+K8dvqoi5LMt+PsIskbrEnc2k27l
	PAiWlyoAZ5HeGIL+v/Ljr9cnYkOE9UaUSrwX6hsMkkgaMmp9+X0h44XLLx6NbZ1FAu07lc2LzKj
	ahkldC/HYZNV/hmaJsYu31ZeIi8MjvGTpUK5XLpfWrwg2KjDxv2+SBvjdLzRYEK9pTQFYXy110f
	zagarWcXiDzpmxFZK/Y8/k2iMXJlZ+ZuzdZ7Ov9EMoVjreTDvObljuBeBtt5BYhy4slmLNtlqeR
	Q/FzFv5fv5guIaVfcm3ieXVV6NvmemRbJq/SVhssDXtVabyg==
X-Received: by 2002:a05:6122:130a:b0:559:85d5:bfbd with SMTP id 71dfb90a1353d-55e845b4be5mr3168921e0c.9.1765296390674;
        Tue, 09 Dec 2025 08:06:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGdycr5HwuVkl3aPfKTcO1oIzNlA7040nE5UstOngg6SNhR7xzCCufqEUEg9LVC+3o0TW+ag==
X-Received: by 2002:a05:6122:130a:b0:559:85d5:bfbd with SMTP id 71dfb90a1353d-55e845b4be5mr3168775e0c.9.1765296389354;
        Tue, 09 Dec 2025 08:06:29 -0800 (PST)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b3599050sm14324838a12.17.2025.12.09.08.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:06:28 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 3/5] media: ov02c10: Fix the horizontal flip control
Date: Tue,  9 Dec 2025 17:06:19 +0100
Message-ID: <20251209160621.6854-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
References: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0tul3_f083aOCdoE0WfLl4dpov6nbKdC
X-Proofpoint-ORIG-GUID: 0tul3_f083aOCdoE0WfLl4dpov6nbKdC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEyMSBTYWx0ZWRfX8uu9npomrZB1
 bwrRofvywtrGUARRwhteBQRxsVMm4u8ajPTRQopp+9rlVdHaT1eE9BPhgNnQp4fy4CDtITfoUcp
 qPa3x7bRoucwYDnQUrtZ5ARu29PXi/8DxVuo+LeBJt9MKvRl0Zxogi2EqCgUvXpZPsJSGbdo+CA
 q2IFzwo5rYljtg6O5f2vHdv3AGWBBYRLNMBL8lKScV1UOO01pmh4vTU7Zh6BhD0LHzExlb3VAYA
 2yUOjiLSbnQRnumIAymVyR5C1hOFdEF1f3DYgNVzYTeY7LPd2pdXAsisY7Q4jhuM/sap2e4VZf+
 S0gr7M7oQ0+1sEhRevRb7Zt4FihYP+vVwzbGJ3Qi0vivZ/dGwSalUiLF6jJCTmh9r3VUT9OLtFx
 Q+Rg+cGhy/cLOt/aIBhDTo4Mchoo7A==
X-Authority-Analysis: v=2.4 cv=IoYTsb/g c=1 sm=1 tr=0 ts=69384907 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jFe5OU4AeXr8QxTHl_sA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090121

During sensor calibration I noticed that with the hflip control set to
false/disabled the image was mirrored.

The horizontal flip control is inverted and needs to be set to 1 to not
flip. This is something which seems to be common with various recent
Omnivision sensors, the ov01a10 and ov08x40 also have an inverted
mirror control.

Invert the hflip control to fix the sensor mirroring by default.

Fixes: b7cd2ba3f692 ("media: ov02c10: Support hflip and vflip")
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/ov02c10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 384c2f0b1608..f912ae142040 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -170,7 +170,7 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x3816, 0x01},
 	{0x3817, 0x01},
 
-	{0x3820, 0xa0},
+	{0x3820, 0xa8},
 	{0x3821, 0x00},
 	{0x3822, 0x80},
 	{0x3823, 0x08},
@@ -462,9 +462,9 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	case V4L2_CID_HFLIP:
 		cci_write(ov02c10->regmap, OV02C10_ISP_X_WIN_CONTROL,
-			  ctrl->val ? 1 : 2, &ret);
+			  ctrl->val ? 2 : 1, &ret);
 		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
-				BIT(3), ov02c10->hflip->val << 3, &ret);
+				BIT(3), ctrl->val ? 0 : BIT(3), &ret);
 		break;
 
 	case V4L2_CID_VFLIP:
-- 
2.52.0


