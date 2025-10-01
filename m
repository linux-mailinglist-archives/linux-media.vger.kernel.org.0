Return-Path: <linux-media+bounces-43509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B3DBB18D7
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 21:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 472613BD1AF
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 19:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C5730215A;
	Wed,  1 Oct 2025 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LVqwTQ6d"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49892E229C
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759345222; cv=none; b=FVqSOd0kNyDvpdAzDl+CuAKbmo3B2vy0B62LVMt31ZTyvBIfekA5h9PKXsoqepcR2uuguPISObxFehN0n3W2ZEAf5Pk22sKUUd26sQ+f1rSdEPCpPeoVdROwhBp9gnJ+IH68ij0jCKG2pR2gVLqvK1Zc/W4CPiFbZgiWBeJpYYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759345222; c=relaxed/simple;
	bh=cbFzklju0t/aOVK5k/0N5wnkX1i8mrIAk81GbJ2UUBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BjjTZCTGPkOiShSGq3gmppoEaBbc6tmiknNMncGta5crGgMaIQ3Iq7xQQvBt1YRmxV4o9H4VLxzoNki9IBTHnI/Psv76v9o9Dc4TB/HEoZdzofVtMpthkYG8ZobVQ5DAlQJOeonqnDuFnu7+KvPIkeihp958daKNftKXOFozBQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVqwTQ6d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ibwba032179
	for <linux-media@vger.kernel.org>; Wed, 1 Oct 2025 19:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fzbb6D7Bmwkuw9nm4Qwnfa0A+U7kuzPysVdaz5i1AsA=; b=LVqwTQ6dah5qT0J7
	iu1gnf/4ZqD0yvmZOm90gnFKMhVicCryWeB/FDOJ9J2AI7YK3l373qjzBaLGuKKk
	E21wnmShjN5ULj2MA89qKq0aNQVpIZz5ORWGXGHdQC69OFGTks5mr6fqBcaKwl4s
	H3DVY+i6vWzKPbhZlafs1MIro47EB4tq2gG9aKmxrsFdU4Y4qRb8cFzroGO5C1yA
	FH1TBbi1TScTpmS1o9UR/FvWnY2j5vUBydSXEtqDP3r4hn6tywWKIFcyotFsUsRA
	QzGNtphmrwSTWfdp2T97caOL5yHstxrVWH+by/QjeCTxqWKvHIe3x9+AVUsjszg6
	GOOc5Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5wre4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 19:00:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eb3736080so51709a91.3
        for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 12:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759345213; x=1759950013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fzbb6D7Bmwkuw9nm4Qwnfa0A+U7kuzPysVdaz5i1AsA=;
        b=DebbgG9nW9+0OWLdSEdl7wim9nEUlsSSoOSOuoAMbK8cHFva1S1VxG9vgElbnuHrE7
         lZGN/FeulJ4BzRBeSut4aawjgE/dSUPl5SDJhAdLevGCMHM7IhTp4pig67cDbL/JpqWr
         r5X/JvXDJzOtOrTHNCb1WfuOsx1NXkqs/wpkcF3RUw6eEkBLy/IQRKmp5Oh/T1/M+onZ
         5Q7RxuwOOus2jnmp/66c/RMxKXgA6LfmdVKmm3sJ1nbhGnWN9F3EHyu1XZoCUKueYWfj
         c0idrtm1i5TTpUhayKmvAQ/P9SkkbSKQ0UiDiO/vSeXUkEf0NAhGBsI7aM70rivF0h/Q
         jhdg==
X-Gm-Message-State: AOJu0Yyb+i5FWfQtASYtj45EMm8BC9yg54KzbcasCyZhOTIKfPD1jPW9
	EvkYYH7F5Ki70QUR2nxlhXaUdmRp0c4b29FeytjkuOFQVFGiXge3Ex1mm8aod9tc+eaAJMcJI8A
	p9iW5xsxmj5JJZxf0f6Cy5XmsBU8tVPP3K4Lof2n2A77cAnNPC1uNG0ER4km90v0w2W9wcMIXRA
	==
X-Gm-Gg: ASbGncsyJ+/mfKq+Sxg9kpq43TLJD+FD0Nnba8/ZZ7Yq9Bjiu3pMMs3q1oqHmCSWkRD
	e1V1LFlxD8sE4mXRfInlzFhv3KbvcBVUirXNOnQdn7CDiaFgFp4Iy1QLOQ0zkfwTsVhQWlsyl3Y
	rzBSIC/d5RJUL96Cl+xdRwpi6oKtlzewy2zsQRVzsg1L5bFaY3NFk9ukfPQjJn3BGcTLLbZv+SI
	AwzUmGbC18Haz1tjleBKjYgnnUWOKbtzKT8KOgRefQyv2R30lIUtCqingPc0ov47Yeej8FQL/g9
	7SE6Wu8BvhwwHLnVqA3XewKbAJaKmSghCyhcE/rLDjjmyfSnwRfvuHNvrE6Pk/MSAlFyYco3xYi
	Vl0kCm3tVJ7EFfwsMq7KMJDyOt5DhDg==
X-Received: by 2002:a17:90b:3b8f:b0:330:3fb7:d874 with SMTP id 98e67ed59e1d1-339a6f9bf1bmr2810441a91.8.1759345212645;
        Wed, 01 Oct 2025 12:00:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU0c19fNY/PyxVHOgSgPEi+CF8xRjUV83am/qs0geCdBh4+DtSYFpaDP7KREYcLbWT9Ez2mw==
X-Received: by 2002:a17:90b:3b8f:b0:330:3fb7:d874 with SMTP id 98e67ed59e1d1-339a6f9bf1bmr2810405a91.8.1759345212108;
        Wed, 01 Oct 2025 12:00:12 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701cbffsm2950074a91.21.2025.10.01.12.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 12:00:11 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 01 Oct 2025 12:00:05 -0700
Subject: [PATCH 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1 in
 v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-av1_irisdecoder-v1-2-9fb08f3b96a0@oss.qualcomm.com>
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
In-Reply-To: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759345209; l=1143;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=cbFzklju0t/aOVK5k/0N5wnkX1i8mrIAk81GbJ2UUBs=;
 b=gi+ywM+w0EdQ3OS8oxXQgqMEfOBg8jKv02Tn24SC664SL8J0QfJWrjPb/rz0K4Bj0WwgE79WE
 BkKL8HZfsjEAjncShaEcdrUN66HSq83Vcqf2ALeEn2oUQew0yG9HIV+
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: pGDlved94Xjo3I2l4O8OOOKhtt2utCBE
X-Proofpoint-ORIG-GUID: pGDlved94Xjo3I2l4O8OOOKhtt2utCBE
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dd7a43 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXytjUGaltt2Cm
 39JQ3SUFR9J5pSPnW3y8sjZHCZh0bYcdHp3VKdGoiie1q1b6Au2+NOFVAU8OcexYbAegE3z0/3Q
 7HazVCci/+cJc60/ovZdczQpotkBK+R9YzfJmbAnR/bX9N5jxjMLBi22vSeds1Ao+6l5hJt/toZ
 34V4xw7rQ43RUcMs2eZR44IuhDH/d1VQuxMG6aMYJpR//ogrsb9L224ZUmW4jGfG7vAPt3I5CmG
 bxMd86ak+7VhK35DqKC0v88ssieYqj/tGBg39w1R9DS/A5PnwJZXSHwakzpR4xkYANWjvZl6ATV
 jCta2nWmPzBnTxSMVC5qtj+R3grWP71gcGoGHTN1fupPw6I+NVpPYcUo6dL7SYJjiBIwG6DAozM
 vg1JKL4iR5wjrmMkjS6/lpWtKq+J1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..d3ee7736b74b0f277d3208782e3ac3282eca1e6b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1


