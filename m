Return-Path: <linux-media+bounces-48554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E07FCB2D10
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 12:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1085C3129539
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 11:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9BE2F99B3;
	Wed, 10 Dec 2025 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHZ6cFdM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTkuCTZ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7366A3009C1
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765365887; cv=none; b=bm+bow03fb4hmXE5T+aRDqWpDm7KZpfpRmovWOtTOhTOkjdYaG0fMXcZ48PrJExCPVNeHfRN5VMBRZfHCbwdIRI/R4HtdEH8pj8nEtRLjVeADzIbXH5lumEbUKKxL90RypDBr/En0ab6qtCvzubrC5avhsdbeQHe5M3xI+EOjok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765365887; c=relaxed/simple;
	bh=p1ea6ay8ufm0J2lWS0W8V4i2JgtoHnpfuwkuQBoZc5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ll5PxaBdUSQ27O2OvUQV6UVMZ28AvqfRreOEVqvG97P0WYoKR52Y2KovWD5CNFnhRpLAB0aA09REd5ToevTLTqgsZLxYnbUWZkvoIv/ORahSAGq4WeTpTgykQ3lAiPDPVEHuk766QK9Q+/aPd7t0uRH8eMtrcmWXqFdtiiB2c54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHZ6cFdM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTkuCTZ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9GntS2858878
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EXnPPVzzyqK
	pLtjyF3zBnG0Moq7cItIML/Q/1DSyvh0=; b=aHZ6cFdMSqo/Au/nBx9f1W4twWc
	Vn+WvvykLkqtFHzKH6Xd6iMIPQdAkyaWliua1N5i6AsJramFmmcb0NytF8vpuqXB
	sJ5DSOxWGikaTWSb5ykd0aPs/XrWz8ipXLmdicwmLln/R4iBWXAb/94SHhRLTZfg
	QPchOjVPCpuM19Q39X5sxdYEyI7XAano9cSfSgaH8JAsJXw6bbAc0ce8IOrpVjML
	m4FJ3dOi1UbSSQyP6nNd3otVdO79gzAaS0P+GNqh8WfjRgedygk43HoFQMVTPhrv
	5yjQqAg90HeAAG1Ab9E7ei2d2qBzYO04CJyp8DM2H988XML3YCxRpsIkcBw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay63frc79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0488e746so17059611cf.0
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 03:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765365883; x=1765970683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXnPPVzzyqKpLtjyF3zBnG0Moq7cItIML/Q/1DSyvh0=;
        b=fTkuCTZ8KX9A+7tRfjMgc2lx76dFQTMdOYQHEpeRBJ9Tn+ds1mkXqudCqlRM++uEmA
         HqDFio1Fn2BT5+VZbyzaMqQ8tcy4fMPYQoBBAxTLder4vh6/h6u9NXmmGhxaLlPDeQze
         hnpd2I+0sA9bNHxRYyEG/3dcd0d7/6Rn0GoEX9qQX0kWxygOiwiFwrhhFtBwNQrgeW50
         C42iVWgE0Cituavlbse1njDFFxfNskCih/6SQEW84FtHFoB5+HPOptpltZyk3jGkxH7+
         487q74YyTRkDfdZ9bMqFr2Dd0eUVxz9TOxwnqTa3v3Qk0TQTiOYFwW3RerVBY63B4gzh
         QUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765365883; x=1765970683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EXnPPVzzyqKpLtjyF3zBnG0Moq7cItIML/Q/1DSyvh0=;
        b=vjgwJQ46F33fKhDCyROOlVgBbvoMP5hfjPpaBivowKg5v7pnYIEi9etuJ0ip7Yjyx3
         u1brRUaDp3RxG6eW8D9jkpNu2r4HpBfr56OuTBJqXmt/gcti1X1pRivLq57OYRGi9LdD
         zuWnoi7xXB7RUj3/65HyKTvqOBAruok903cnKSetKU3xVjWscahB7PegkWokwoU9irQ+
         42ms87Rmbq5ShVjN3QkDRrTd1Kj7TcOJUIkO94PIX/jf/0N4k+3v2tPyOMOgQdhsDt8T
         Z5Lzs3qEe5R6hW8gTQj+YF2W7alGHZVghh9oo5CzhHBkZiSkVjsbG5d2QBHvuFDfXAt1
         j2xA==
X-Forwarded-Encrypted: i=1; AJvYcCWUeL1yEAWarhbLAV91ukKB6k6e9gTPGznT3DnTtJoTiJ9Rxdo2S9CMRZMAaNNditG9uXFPGuElhneSvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/YJ80HGzy07Al6ET+i1VPFFneNUYyEUHE9Kj3AECS/+rp8Uo
	tk38Q+DtrAnFjB9UXEbfYKKK3PB125cKvz+gkU8fYH0jMvzfGYMGDU/olTg9gDFItrqWTl1Om3d
	ib7Cxnc0x6elvccZxs+ZAmPTLyi6q+ym4PkhOdH92Lfh+X5HBfTnL75qPaj6ldNNIYQ==
X-Gm-Gg: ASbGncvYByJ+v3m/62KywJOkRjtM3AstZ5uPitD3DHUxpY/7B6XnAVNXBjc4dIHj03p
	sRWX6nTTHO2aA5i0ceX3ZuopFOcjY8PwcZH5CAelJ3kfHBJ/sGtsj6OBfT0ommCXaoqwilovEFc
	9crZkLcAyLICWek69sqXctoDEaSPM0XntXEgfCK9MWBkbDr9vcF+bX7W50Oa8r4F9PjNCx6tYl5
	aGLNEu8jOP/QmUh53YmjZjD3iwGNiZYZe5hz9QXMpxxFwRiw9SMjUg+oy7gMfnrIWMf2RxRBIUH
	9LDfOGlCgrP4r0uqynI61M6dBWwhoxD/9xz9C/MdSF3d3S5zsxtf9IzoBMGa76zKkI5481PfkfB
	m5JupgaRVTq4eiFqkiap6AKOFfKQ8JEd4EWGeiwEd34GzTCURXvO8cE5QBqt9sklODbLgNUcvNK
	78GEjMU13JU56oA5rxZxnSYwQ0
X-Received: by 2002:a05:622a:113:b0:4ee:4656:54dd with SMTP id d75a77b69052e-4f1a9b2f408mr58820601cf.19.1765365883577;
        Wed, 10 Dec 2025 03:24:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz9YH/CQOWCZ0uNhUDD7VVCrPgxFaalYgHr6GnwHxySrtWyvkMRkRQSOXSESMb03BR69qqlg==
X-Received: by 2002:a05:622a:113:b0:4ee:4656:54dd with SMTP id d75a77b69052e-4f1a9b2f408mr58820361cf.19.1765365883181;
        Wed, 10 Dec 2025 03:24:43 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49e3fb1sm1696851266b.60.2025.12.10.03.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:24:42 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH v2 5/5] media: ov02c10: Remove unnecessary hflip and vflip pointers
Date: Wed, 10 Dec 2025 12:24:36 +0100
Message-ID: <20251210112436.167212-6-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lNRU-59tpJgrQgqNwHI2b7WXoYXCYCJB
X-Authority-Analysis: v=2.4 cv=Y6P1cxeN c=1 sm=1 tr=0 ts=6939587c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=94ErC8f8ZRilHP8a1i0A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: lNRU-59tpJgrQgqNwHI2b7WXoYXCYCJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA5MSBTYWx0ZWRfX9BWmPamxd2WY
 JudKqL2usE97ZNLiN4Xq2yZERKFmb8caMP+wHytDeu2W/fAkSH2YKTNEEoL1ECIf/XdGG0LxqDu
 Hr1wu/9AS+iakxyNSMUB6k5/M+4VYcUrUxMM78CFrq7T8Aw6KUCaD4Sf6fhl+AoJCJEiKOmAXUo
 HTSsmApVNDMdt/+qDWvvIOm9J3/Xs1M66+DeuYwLTELPGH1SHqcNFCKAiuujqQNJKD+kksDbKaM
 HKxuLeAFh50jpVJ+VQIVIz+3KTa/5Pk/LjR6RYkfJe3L/pjk96Z9ExkN/wpz6yTbJL9EUk3mJRm
 +1Sy3jikMRPov4TZHpV60jCVoPUN7kvQm92TDrcYHbWdsc7PYFZ20YJGHICHhNodE4d4/5HzfeU
 gkKeGHZT9YNzRpDwcBk2Vj5lJPibUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100091

The cci_update_bits() inside ov02c10_set_ctrl() can used the passed
data in the ctrl argument to access the vflip control value.

After changing this there is no need to store a pointer to the hflip
and vflip controls inside struct ov02c10, drop these.

Cc: Sebastian Reichel <sre@kernel.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- Small commit msg tweak suggested by Bryan
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


