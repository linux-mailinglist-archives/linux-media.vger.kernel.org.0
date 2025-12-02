Return-Path: <linux-media+bounces-48105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F29DAC9D4C9
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 00:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2AC44E7114
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 23:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACEE31AF09;
	Tue,  2 Dec 2025 23:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlylHzgz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7CHiOQW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D945A327C15
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 23:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764716637; cv=none; b=Ipapx45RvV2IsK6CMLjwEpvTX3e0GylZbyagpQrB7QT41ZpLG6VIukDQutHXl0Vz/8agWtSsdLrPII1LSw30LC2/1K3ViP5zMUl/Uv7xERFSCOTv/gI7DmeMxhKlGjPLScS3BPwmdZ+GOuiG7kgETF4KmVnZQoUVCCDtV5YrYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764716637; c=relaxed/simple;
	bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+SfLZ8NznASDqftu125h3/uxwTcQ1TYPrHcqx0kLqUAhkKd176hB3PYsnq80DdxmRFPmhk3kkGcPFBxs7DRFv8Mx3pEbuhrsHBtU6/lpV9B3WlALaNmHtaqbbft59G7iVkqthE2n9dM+nzxv8cY0x9pODzYU4VFEmbrKp/cpsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlylHzgz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7CHiOQW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2Kw9wm3309977
	for <linux-media@vger.kernel.org>; Tue, 2 Dec 2025 23:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=; b=TlylHzgzKHYQUeja
	DbMYnSfYhBCFlpjoZHLlx0Y1E5G9OQIhnbMfcq89rS6JkAPIthU5s2VWL5os2++y
	nFZEVXwr4Z9KcT/hGGQGQoT7dk/fQ6yF7WDN9Nkl3CbtVPvVZnq+6PF4N7q0l8vC
	0y1dgCJD4eBfPBq+JmBwk1ebjkkFooqRgk7wYllAb9hQJx7z6jyrR0e4fI7bjpdT
	R4ZRWwSRJJyA272tHwQKpSwS1LTyPvL991lVi4zkJLa0xHXXc6WflFDM1U84SGZI
	AUsKjBatZPLCFi2Wx6YJ2ruFl4QMJHRYyd22D9KAqlLkWhWshZNm48IQcx7hKrcn
	NdZH4g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asxwwj3x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 23:03:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29844d9e030so9172095ad.2
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 15:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764716633; x=1765321433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=Q7CHiOQWTy8Maj5nYzFbSygSGJMtk9rFO9htTbgwxD2d290p3Hs1ojc2Ju1MOnN4yB
         ewK+pTx0RkFuqhRTkazqpsLfKcMcJRnh7ZnqS0nrVmuV4EW8Gdeah7UWzwFq90xl/F6N
         yzxlYEWq5tPgC3YBqinX4wPRFOSXenv/YZ6O8wxxjtOF/iVrmWG9EEppv7S49EVz+d1L
         +hBewfObREb4aUDuPQ0oUl33CEYL5XHc6bGrK79L3OkfXceOfZDqvfb+iAMx6ab3JKnk
         TYx37M2RpJ17/F0r0eSh1XDourffjERM8wEGF00uAEkPXxi39YGfk1r/oJmqP4iVQKck
         yHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764716633; x=1765321433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=ewxHRzSQf9ilsr+y2e9z7V8QdmUQhAxFtTeu/s9iHNFCN+KFxtazzrIPHUbVQwUtjQ
         JkRgM334I4vicJWC1/FZso4iyqFv2ne0glTTf/b1cQlfnJpZCdRet9c9z+vP9/CN4t8V
         W7LH4gZWTbu7CjejPBKi52fELGkHJqc6FJjcKiaCvGu6NoHC8v+Ly8ZjT5tFOIEH8UHK
         nrTmM3tBDsCq6A4upBfcpa057bpkzK0hTp0wn7Z8iG53Rg+Ksg1gx1XrGX4keEx++Wzt
         fUrBAIeQBkGWAAfkgu41yLl67iaosnGo7gU48gF1rUFG0xzi/akrVUlCtItu2Bc6azQy
         bmOw==
X-Gm-Message-State: AOJu0YwFw9lM4UO5SigEdnKz4lu1fK2ODX1Dcnx7i+tV4vQ+rz+K7nxx
	UT4fW8+lDOmNU/QUzuTALM8tLn+1u4SoJZkSJeLGRQlow1UqIuA9ov+6ycG3gL111p4expJ9iRc
	X5L/zpYUZT5avSW6xRF3lvYQee4oNrPNuLM1jQ9sYKp/TBFS0IGvMIra/+7Y44GPIJOFUUJHY7w
	==
X-Gm-Gg: ASbGncs4yrVOzAnvOD39ni0EDV8+lQM1xEvhNDE9FG5jDgdnzoCKB4gKZCzEL18DgjP
	zLmPRjVNsEfbHxm03kYE3fZQRFFMobmLRWxdQXvxuCyOBG6gi9qoq1zY+0vkDLf40enfYZUZ/LW
	3SlrcdJOfugA6iWqp8l5GO5IPmVZYRat8jNlw7ZZa+US5kPdUIJGCIAR5JzgVjXjOjCJrkPVILR
	DlkvWO0EnIqFFob67g3avSltN0ZdwbLouUsDujstvuTl6BM8hsXCtwtpsFYMv+Ooafp7+AgRIMj
	KDqjOifoEWMy8xe3i0RvLuiLrLjL1cwMCWH0fIFxBopWw/6AxBoh0WvB4AS1Hm6pflTnxskXv16
	Ghmfs8WqVSW33aJjmqtsfTcuVxtdS7l5mimVTjBdQqCSIwKVZvH+DBXD8cKoyX2v+g3G19Q==
X-Received: by 2002:a05:7301:290a:b0:2a4:3593:5fc7 with SMTP id 5a478bee46e88-2ab92d4f166mr197734eec.1.1764716632984;
        Tue, 02 Dec 2025 15:03:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm9BSRNT1psz8NwizpSBICXbG+d9VaYkNWXco6LMik+r3f27uYkTXLR12y9Y0iXZ3zzWNFOw==
X-Received: by 2002:a05:7301:290a:b0:2a4:3593:5fc7 with SMTP id 5a478bee46e88-2ab92d4f166mr197714eec.1.1764716632432;
        Tue, 02 Dec 2025 15:03:52 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965ae9d06sm59214149eec.4.2025.12.02.15.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 15:03:51 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 15:03:43 -0800
Subject: [PATCH v8 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-av1d_stateful_v3-v8-2-2f74a81773b4@oss.qualcomm.com>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
In-Reply-To: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764716630; l=1333;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
 b=0D+QFk6KZFBQle4kRKINuh1cqjd8MLcHEJ76GnMdyFAKL9vLnA4rbHmP8E+HMBxUmKNRw39a9
 pauq8KZ8fPiC2JA+JrwYxIIgBIWMgD6XVvTBPZ19n75RNpNsYgCdtg8
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=JbyxbEKV c=1 sm=1 tr=0 ts=692f705a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: BKZT34-nUfzONIWuf0nYoxgzIP3YEq5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE4MiBTYWx0ZWRfX3+FODc3QD1J1
 UGKfhLEERS7rM/++tXto6iNxCIxGrxcUrWZkRkiLw4qqMrgFFFgPLHiIwRJENyoz1jWv+/lAuRs
 Hyjjk9FQS99hlOWxWoXBZPN14Cz2e+n4EQyZW4qpqwkCY9G3gQC4u81o49+Iv/GtKEuR4ey6hS0
 DwcoeFoNrwyR8VWKkylc8KfFSB9QxG+QRuhidyuzv05LZsdMjfPTjmtkND40Cn5kGtp3Ryu8FPw
 aRIDfFpBMXjJfyKdZd8O+xU3yrJOtCCsPh0A6Noq3/rI30OXZtrsLu1WUmYp7KI+DL8jpK6mhW6
 uSnYDssNoGWH46wFcYXAmT9aMo9yDOusi9x1kXSQjR+x4WJEkUSyBAHLIkJL9ZJoyct7aSwENr7
 BsIA6rJngxqOBVb1sHPPf/exydKMJg==
X-Proofpoint-GUID: BKZT34-nUfzONIWuf0nYoxgzIP3YEq5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020182

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..37d33d4a363d7eb02119b84bf368dac8e7a8bd8e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1544,6 +1544,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU Stream"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1


