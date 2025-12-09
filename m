Return-Path: <linux-media+bounces-48483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC93CB082F
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 17:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DAD43109373
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 16:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC073002A0;
	Tue,  9 Dec 2025 16:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALA2mSn3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ds7yw0Pg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2053237180
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296396; cv=none; b=YYVj073pOJGVRQfWZ+2g5p9KK5RZBEeEYdtsrQV6phZVGjYtHGoPWpWdWGXf5orPuhAU7F3vx8UxUyIdg3UU9amaLmT8HnoRIgevNq/zpwkMPhWb2rR/jIgJOpbSSo8BGJl8/BNWlBXJ/KhybcT59mFtBD+wp6HnQGDzixJYunk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296396; c=relaxed/simple;
	bh=TUk5HQ61FRYJ8QcY5WzDHsDdo4Nfj0GR8maXOM6MSgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlyeXwYzeZcle2NxqhRUJ3tLJY0KoEAMPzw5O0OJi0JBxUt+924c47YdC0/9v8u49lKnXu9eFduTe324xucsVmzhyP3cWxa+395lMxhAXTF3ARFxQgGqkoeLmrzg+vjZ5E10sX1IEEN5kGQy6/5QkHjuve7H1WP/pZzOSUY2ThM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALA2mSn3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ds7yw0Pg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9FhZBp3409415
	for <linux-media@vger.kernel.org>; Tue, 9 Dec 2025 16:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IQSoPSBIlV+
	6NPKvpbqQkblh3mR57JmpJwuHJzUodkg=; b=ALA2mSn3giqs7gI2HSqqmxqRBiF
	0a4bVnWm/4NCUk5KwgALd7tWj/Kin475wbzrzDYAc5JUMtM+FNlC97o9eSzQ2x1b
	CETtst5EfZeFvKY+by7wpiu88xzkqjDf92BkeyIdSV37aRURK/5faQxTpCH7v704
	yBzm9GpmRajlLmC6FPzN3u5oyI9k7ojAUQ/vXUMNt/72I/WHekW1KMliOEZybxzV
	bsYaCMhUDcdhNphQZyL3RWy8bZ8kHESM8sRyRgK1BfwEgek/0kCKcjYkZ36AahuB
	4qUVoD+Z4OxxgAkq+AkCM6FHzaincn4HHTk3bA0Dhk3qn5ON9AJXPcThFbw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axesf1q2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:06:33 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55b305e5aedso4199437e0c.0
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 08:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765296393; x=1765901193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQSoPSBIlV+6NPKvpbqQkblh3mR57JmpJwuHJzUodkg=;
        b=ds7yw0PgAqx7n0OEWV8jOfb0ZkCeEgdN0GJmHebmcxBMOYCrc93yMdr80af4ms7N0q
         NWN0kJ87IaeaFmnn/nFc8awj65Qm4UI3RCHJwDNI8XvM1bKNkPPp0vN/lOv5YcuVn2m+
         s4519Yx7HwXT3X+WmESfUeA3F93D0zJ52sAj96/VHwZON1bUp//Ld0minz3hT1qx5BAc
         Xkz3nq8Xq7A8+iq0PuBqdb31m/HgVdq3wJpVJauuIxyVaKU32jP+n4EDON6cRIjfbv+f
         PScFOVyDmYom67yuAOwUFccpmQtOlX/3QyXfRHef/mdxb1SH68O2gvyP6MQGEMhfsCea
         5Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765296393; x=1765901193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IQSoPSBIlV+6NPKvpbqQkblh3mR57JmpJwuHJzUodkg=;
        b=bGcO2F/JNm2YkcKzQHJUJAVFsjEjADzYsl3fjDKOTnDKK60NItuBFittuRgI5UxE+t
         nwMzbTS/t6L0Z7XBC67wlRM9vDql1CINK0WbJIxTtr9mycaU6mi724+lXk4GWnxHN+sr
         LvDIEvoo35p6v/goajDcNloyBONdoPY4X2xC4aK8HaJUlhZMLt1PsiQIuDN5ViuSrLvE
         2jdgpqFVu91aAGQt4aVuYouhTcyO2LlB1uH8fcpYHBxgDATTAjhpwaxccxHQkXHqlzXm
         zUHZHGRHF07xciQ9/Dxdm41wcdpNxb3ztlkCR+NpcP+Ke+y0sDIpKn0EOf8zKY8RrBDp
         jmjA==
X-Forwarded-Encrypted: i=1; AJvYcCWdtwi29s0G8Sn7YlZKg75nC7uLRYJ6WrxMYQU4N7NvOijLVbbKV4K6BActjCF0/VklGnlgPJEi86r7Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBjF+bE4VC1BtH/x41TnguwzRtfufyhn7qZSr7y3BaQ3KT168Y
	XDIotl8X1ip/odMA9bA0U+anTy5BQM22F+YZUosSVWGGJGpKFNMKg0CtxRBX+cZbFeI5k6bJqLB
	70xCvPAvKTo16vW/48Fc+JrKeVHyDnxJL9svX9IsFm/wXXVSw7DZMfNj7zCCKAVE2EQ==
X-Gm-Gg: ASbGncv6+Vknx1k0zsA5Ao0RH40Mvg7rHLRXhYEjBGdoG+TeZiJMoDKs0TqXLpdtZuy
	6nVfykT63FJvL4tBnCVregl4BcGiJ81t7X0kwxtj01R7u9c6WtsAHjnEkPol+mX+CMgk3ksnxQH
	vGwjQ5INACoIsK0wV3qWfF9z7PTDbY4EU4JcY6qpCQh25E2y4gwpnAxeYKM8S3GOQIDvxll3fQ/
	A18S4b8DkUZISqs3/CCn0+4Dt9Nl6wsLnfH40/EHPcXrSxZmXMvxD1bN8+/oCV/8jlZ2VjcQdzR
	3aNfbSvDWtsfIYGuA/I9iUYwbZrodtLhuSrv0TLCzgJaK9WmAIonU4NfZ/lXaOofvPw3CC0/5Hz
	8Whla3OcAbMszxo02ABaEOgSN8BC+b1ypDChW/xunRIxVpKZCHw/gnblo4srGb82pxyoKQAlLeR
	/l3CoHpvRp0cTKy3AFDw2UcifbprYwkUJmH6/aZoNy3s8ALQ==
X-Received: by 2002:a05:6122:2893:b0:556:92b0:510a with SMTP id 71dfb90a1353d-55e84717edemr2647439e0c.14.1765296392668;
        Tue, 09 Dec 2025 08:06:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzpuli9OdcOqQSzcmgPLXvVFCq09g+U8YakaSQV9CbQIDgSki6MX1ixddDqTKL3VUEEFemTg==
X-Received: by 2002:a05:6122:2893:b0:556:92b0:510a with SMTP id 71dfb90a1353d-55e84717edemr2647370e0c.14.1765296392010;
        Tue, 09 Dec 2025 08:06:32 -0800 (PST)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b3599050sm14324838a12.17.2025.12.09.08.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:06:31 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 5/5] media: ov02c10: Remove unnecessary hflip and vflip pointers
Date: Tue,  9 Dec 2025 17:06:21 +0100
Message-ID: <20251209160621.6854-6-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ak0T5pVPLEtSPxN0scqWmI06uU93wrCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEyMSBTYWx0ZWRfX7uAH/7+stC8g
 YS1eCmouCb9rAEvqikKheFEOcheqOL/NxIedznW+eFQKXBO9hsp3nkil8b7PVeemDIuTzUYJoo1
 gquoGakPoPt32I3uW0LSjwhal4YC9i829bhsbOxZhRjYwjf1gFxd20+caeDtGBo9QV640lbppzm
 bflrL5ZqIFtbLeiX1LR9P0IuwA7SYkLkzC9GiU5N8Dq+7M6/V4+wim4tD8PNlABDQCt+DOkBJDC
 z7MIuTpMlyjyOssUEZJkyn4NkrqCNybZQQZF+YzIyTa8On4Zaqa3wBwpvP9gHdWWu9zzgBZx52r
 hZf1LiSgrPYQSAz/93Ri/DJfDsjMHzh+ZKKEKo5rHnDcHSB/7yjUGnBiJRnoOsadneDHqCedB5v
 X+7oeDsr3jLotBurzNLoDDclByTaBg==
X-Authority-Analysis: v=2.4 cv=fMc0HJae c=1 sm=1 tr=0 ts=69384909 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nGEvrXC-CeBwZhU-8AUA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: ak0T5pVPLEtSPxN0scqWmI06uU93wrCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090121

The cci_update_bits() inside ov02c10_set_ctrl() can used the passed
in ctrk argument to access the vflip control value.

After changing this there is no need to store a pointer to the hflip
and vflip controls inside struct ov02c10, drop these.

Cc: Sebastian Reichel <sre@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/ov02c10.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index f912ae142040..cf93d36032e1 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -381,8 +381,6 @@ struct ov02c10 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
-	struct v4l2_ctrl *hflip;
-	struct v4l2_ctrl *vflip;
 
 	struct clk *img_clk;
 	struct gpio_desc *reset;
@@ -471,7 +469,7 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(ov02c10->regmap, OV02C10_ISP_Y_WIN_CONTROL,
 			  ctrl->val ? 2 : 1, &ret);
 		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
-				BIT(4), ov02c10->vflip->val << 4, &ret);
+				BIT(4), ctrl->val << 4, &ret);
 		break;
 
 	default:
@@ -549,11 +547,11 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 					      OV02C10_EXPOSURE_STEP,
 					      exposure_max);
 
-	ov02c10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
-					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CID_HFLIP,
+			  0, 1, 1, 0);
 
-	ov02c10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
-					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CID_VFLIP,
+			  0, 1, 1, 0);
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-- 
2.52.0


