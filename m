Return-Path: <linux-media+bounces-48480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67411CB0826
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 17:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8E7A30FE69F
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 16:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A8D3002B6;
	Tue,  9 Dec 2025 16:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlpiTYJw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BV6OxNIt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466E32798E8
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296393; cv=none; b=hTe9d3CvTVg31gwXRLVbeu0zA5WMSxVd3LNOnhql5oVqeIjMPZtfEACDq5WYIZvDPDCSVZaKPDEzCce27IX5INzWOHqxmcKzh2cQrM8yUiOnmdsDJBEFRs9NKguFrPy+onE8oWpMqVzysY+trqXk3C8ic6Lt8ssOpbguunytk+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296393; c=relaxed/simple;
	bh=NRZCm8IETwAdY3N51q2cRqNSBOYw04DxVFrUnbJ7ukc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOp79iyKchTIfkOOYSLGoOIULvDUbuUrBMY8/cswD4kB4Hz1tuTUSs46paWX9utoqdpAfxtuTqNr85z7BHqg25OVM7dB3SNceExJbjDfAk2//TPQJEkXebQwVqBNekhECTjihX/5o5bbKc6RDVB/6DwT2KMcrAtOmN8tpaIBE6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlpiTYJw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BV6OxNIt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9FiInm3605477
	for <linux-media@vger.kernel.org>; Tue, 9 Dec 2025 16:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/34YbQvmbiv
	yRuEsz4ogEJ2+ytDyL+nBqOFovpbI98s=; b=AlpiTYJwi9Pf1WihMVhQv1U2m7N
	AzlO3vkwboHJ/JZhOCiKtbU1U2R/8I0M4FwbejE71OknE/q4lC3qjEQYItdgVtFv
	z4AyX3uTOuITGkd7GNUuO/Sj2YuescCHkF8n8V+a/gGI30rS1PyNsooP8uencppe
	qq87/Dy7y2gXvW503qpAhzBfmDPUu35LOLO9rFF/B/oVn5Ahl8oPlWn9+UUZOYT9
	jevE2KI/zBj1WR6cyRkohuUQ6GGWEaFzPdFFNtbWTXnAoBPdWewc7b3T1RRluX3C
	1XiKIxDRIVVWeLL+iaAFfwLqwm0zgaWcyLWUeNmHx+dg4uHxtCEPeNWGgww==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp4vr658-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:06:30 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55b22d3b3e1so8743569e0c.1
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 08:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765296389; x=1765901189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/34YbQvmbivyRuEsz4ogEJ2+ytDyL+nBqOFovpbI98s=;
        b=BV6OxNItc6JcksSbDk5H8PgRVKeenoZoLitDUjChErhcjwU+JXNa8aW43CKPi4TC8i
         9imP6DfExctCdm8EgDDPfbuqKadocmyx6n6oIZgcErIyxWVqoQCICMAyBbkeUuYCgOax
         PVwVauAE3YpZp6ChxkUvmihRlTx1Oyj1q2keM0Am0ZcqLlLPdOl8Z3HOBJEcVe2wa2fz
         l6ZiiJKpdvDNtNL1w+abzhvZnRi8idtDM5+SLRYDuHZMXHF8/4HFHeviMFtdm43HNl4W
         hpHkNlGdj8Mur97gggbz7WtwA+0dGn5ntoAZlsKZFKys8kGcGY9r8OsQQD6LNQElX3BS
         S1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765296389; x=1765901189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/34YbQvmbivyRuEsz4ogEJ2+ytDyL+nBqOFovpbI98s=;
        b=NgCIP+zPVczjvo/PsPbqZ7nEsawxaYR15/LbSjAS31z+Ch6rFVjH37B4sXTUXFy9tZ
         eezWiznKqC6gmbeGu6gjZVbgjQ/0NY0W9VahPOzwicjudlSnD3lc7H9AVda0R+tSwPna
         cgirwzMa5gOb1d6iH3FJTa9EjjG0dCeRxK56dD+gvl1F6Pj+mEa644xEavT/yxs8iqoL
         yMl3jcL7BOe3JjyhzQj3xIGeW8xsrIXQHRbXvW0ECFHZ0Jao1vUyH/nraJrX1wO5CDj5
         1rR3b5MOas67Gc1yECX35BqR7T0fKxnLeqzedQLh2kqGGgYjYh++O3c11zOrn6EtHB2/
         4Tkg==
X-Forwarded-Encrypted: i=1; AJvYcCX8bdIAbSJdCg9VTXqC69RFQau4axh2AprnMQJ3wdrU6YNrBkZPyfs+tRdab3Wi1sTpLusfV8uye6Nuyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYwRXOFTtaHWhyUW5ZpuFbeXXt+HwhKCkszHZJiLS/2xkfwgVT
	unr9bYF7izHX+TNOfPAwEDuVJCCwfTCKr1huB4wxwWNLQOcMtzIap+9KxO4SO84TH7A+SdfideB
	K3ADrc2cAyeDVXhgz2DG24Llt7W8gUtkjRNoRU6M23gRxbX/c7F5HFhK1a76n/PNwZQ==
X-Gm-Gg: ASbGnctqj4GXzmeo6jzcj88fNYZ6b5sy4Gb6ez5EKxctPmk+T1vIGa5R+p3cBSdDgnt
	YgW6RSC1QnCsqBsqSZUHZ4FcWwTVdPCy+LlQ5FXYHHfTLbOG22AVjszjnDU0sjax4YPCVQoMYkf
	Cj9bsf0jqvVmavZm86/mECtTRIlCYIgHoHpyuvud8muO/pDqCneJCk9MH2fBcdyHR3bSrwff55h
	xLxb4+nNE7movOmuIsAVUSk3o2QoymVmTx/3G/lD0VItAUmQSDk61Y8HTeOS/HUO7XYgV2Jb9tw
	+dTrAoI3sa/nXvdABYa2m7iAzy4pYyEpSrZG6NbOIv+7OhoXVwOfRk76ghWBZkZAJydni2lIfKy
	zn1SmJvfE8/DWusN9xPU3VB7H5tOjaxk5TzSllqgotDaGHJDUh90A1/32aAprVz0VVgBzrrsnkp
	ppwd/XxiMm2y5Hnua68zacswrl3fjZliI+MgX3bMxG1YzXWw==
X-Received: by 2002:a05:6122:1d02:b0:559:77c0:d46f with SMTP id 71dfb90a1353d-55e84447987mr3630056e0c.0.1765296389129;
        Tue, 09 Dec 2025 08:06:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzmdro47zgb688gln6XcKQTWtbt6sCUVvtH2txK/sLNs2h+ytXzOErdi1p4+dBGu1v2hLzrQ==
X-Received: by 2002:a05:6122:1d02:b0:559:77c0:d46f with SMTP id 71dfb90a1353d-55e84447987mr3629939e0c.0.1765296388021;
        Tue, 09 Dec 2025 08:06:28 -0800 (PST)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b3599050sm14324838a12.17.2025.12.09.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:06:26 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 2/5] media: ov02c10: Adjust x-win/y-win when changing flipping to preserve bayer-pattern
Date: Tue,  9 Dec 2025 17:06:18 +0100
Message-ID: <20251209160621.6854-3-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-GUID: 5h02Z9RCCR5KfQo6U-CxKWxFVkMf69mH
X-Proofpoint-ORIG-GUID: 5h02Z9RCCR5KfQo6U-CxKWxFVkMf69mH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEyMSBTYWx0ZWRfX9IN5aDEGxeel
 dXj3F/3siWRUCiUEWvTlks5kMmETzanjMSRoSO8Rt7bHOFfmf9ulvei48o5oLTPWKX1N21DxLw9
 p6oCl7zB5MlU/fPlC7hO8jAOqyL58PxUlYbAq1DI0pNvZdo6Mrs1j5ghmJKmNEfmj2Pi9OJstfZ
 1RcEjYEI6vXen7LB6hddGE1BcKMJlIow3us7jiftPsyESBeCfXe84rXXN38eVDOt+LnvX/bo7Bw
 uzghllrJjyvKW6qL15wbEGtNOnm1bAE2rWlJyRuAeMf0Co5PhejkYuqyhd7wiT7KMwFbbIMzyaJ
 aKsVmvmy+Yf1s7IBNrdlfwVJFM6y1AHexWbGUhVEhw5YXXVHmlc2UPdCUDW7psKKaUa0yaNvmGE
 fWJ3Fx6B86igkfOryWVtMD/VeIdgrw==
X-Authority-Analysis: v=2.4 cv=IoYTsb/g c=1 sm=1 tr=0 ts=69384906 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=oX69UmKp2CGo4zr9RpIA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090121

The ov02c10 is capable of having its (crop) window shifted around with 1
pixel precision while streaming.

This allows changing the x/y window coordinates when changing flipping to
preserve the bayer-pattern.

__v4l2_ctrl_handler_setup() will now write the window coordinates at 0x3810
and 0x3812 so these can be dropped from sensor_1928x1092_30fps_setting.

Since the bayer-pattern is now unchanged, the V4L2_CTRL_FLAG_MODIFY_LAYOUT
flag can be dropped from the flip controls.

Note the original use of the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag was
incomplete, besides setting the flag the driver should also have reported
a different mbus code when getting the source pad's format depending on
the hflip / vflip settings see the ov2680.c driver for example.

Fixes: b7cd2ba3f692 ("media: ov02c10: Support hflip and vflip")
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/ov02c10.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 6369841de88b..384c2f0b1608 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -165,10 +165,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x3809, 0x88},
 	{0x380a, 0x04},
 	{0x380b, 0x44},
-	{0x3810, 0x00},
-	{0x3811, 0x02},
-	{0x3812, 0x00},
-	{0x3813, 0x01},
 	{0x3814, 0x01},
 	{0x3815, 0x01},
 	{0x3816, 0x01},
@@ -465,11 +461,15 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_HFLIP:
+		cci_write(ov02c10->regmap, OV02C10_ISP_X_WIN_CONTROL,
+			  ctrl->val ? 1 : 2, &ret);
 		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
 				BIT(3), ov02c10->hflip->val << 3, &ret);
 		break;
 
 	case V4L2_CID_VFLIP:
+		cci_write(ov02c10->regmap, OV02C10_ISP_Y_WIN_CONTROL,
+			  ctrl->val ? 2 : 1, &ret);
 		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
 				BIT(4), ov02c10->vflip->val << 4, &ret);
 		break;
@@ -551,13 +551,9 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 
 	ov02c10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
 					   V4L2_CID_HFLIP, 0, 1, 1, 0);
-	if (ov02c10->hflip)
-		ov02c10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	ov02c10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
 					   V4L2_CID_VFLIP, 0, 1, 1, 0);
-	if (ov02c10->vflip)
-		ov02c10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-- 
2.52.0


