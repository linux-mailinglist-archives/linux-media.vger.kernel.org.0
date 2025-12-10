Return-Path: <linux-media+bounces-48517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B55ECB1846
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4C9D302CC89
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D3D1F2380;
	Wed, 10 Dec 2025 00:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USRkOBjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HjoDq5Fm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A831D63E4
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327186; cv=none; b=R5q124CTfOJcTn/I8EBmAvyMJJUF/szhubxTqz+VFEX1WwMmw20sDZ0jyU460z6p5kvQCgP1z+oN/3WYlDHrhwk/aWyrVsV9TKO9Ix5HyY9b4AyuxeE079vVFPRMNPLsp0BrpO0H0JcTYa5e76giw1C4wmOl6e9XuiraL5B0cC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327186; c=relaxed/simple;
	bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mi/Y/eM/iZX5vgWIJTwoZub7ssNEvji0V2ELZw7pfLNfo7AtsB/2phlSGdxVp99VwpRkj1cooSkjG5YqSxOpdNHIAzzfzZ9WiB7OzfD24xfpb5YxKJLchMbpyTyA2cmNoHtTc9qsdv/K3SUoqfQU4ACf4p74+lKUmVwVMo317c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USRkOBjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HjoDq5Fm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0O4uB1218531
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=; b=USRkOBjSuvXdpmf7
	jW/1jyjYYRfCg9zhRg8gB3Kh3zgtioc1L88z1Vzzc8U7x1pQ1ONe6l2LAk7PNc2I
	zulOGK2nfAZCyW159m5sTlsawfRp4XqbIlMAgNwwvvSRKYC44/SowHPwgmhd1feu
	kdo+adYpgQB8DWKyrY4s8Jvs4gY7wyQ76oh8Qtv4niWLQ+WdzYZMrHuVLyOA9oL8
	WggJoU2rOepgI+q/gRtxYp/Rjzkkzp2rxT/ZydR45TswA/QlySzeTq7wxWYu3qGi
	KgUPQ8Qlmq1KNbjNbIQF4YME1kJct6OjsjsLKUkl3cYuWWFhkt8vBKX9k2jADON5
	2O86IA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p1m9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bd29dd1e6a3so203746a12.0
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327181; x=1765931981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=HjoDq5FmWYP5hBG3FHN1Xe72M0gdiL0fTlQ9GQtqRgyvvd+78wCOWfeS9ZeeKraUSx
         qXJhih/SCdO/yS/dW6U68Fqjm/PgcEVPJCHY9PSFA4DKT0OdDmmG3OVwgRjnCl/1b9fX
         unrSHEC5ZVwsHWr/sk+4nwvXwr1f8Y/mPE0OShDRPs96IvA7nErwii1UHD5v6XFfmK75
         Eh5L+CYJ34t3h6RoP7aYzy8Y8yU4jMR7AoEqq27ZNdFTJChmZFXHlaw1Xsq3lS4792zb
         UWQyi6E93uPB2JzWvRrAT1c+iKHXe5gaUOQm8JNWb9u/AshGhykxZmPXJq/wHbqLhdXq
         Oo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327181; x=1765931981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=EXco7imGFBgFTKhiKNdF0rqJPzWn9spGQRrSaKsWgxNe4S+P4htisFur+JTvNaLq9W
         jGxjx48InijR+U4+0oYYPeFwPQoSz2zUbfxcMXiN4iE2E0aWI7+/UlxdUVIkkQHUe3Br
         jodORGiu86REtylW+UGY4V031PFnngnGJnU9Cff+8GuLofC0oWN3ymOk8JBxDtxghl1s
         Nq6lwiF5iEgenpdNkzNVK1uzgfqoOp4B5c+qzq+f6bzYUJ2i1e01AOq367VqYqkTdsW0
         Q9o7w8sNK2IvHjfvfOuLCvnDRP1wLz7dfmBVx2NiBKyqJw5V+x9dObunYnp6QJXdB+g/
         mSmA==
X-Gm-Message-State: AOJu0YymhZe8+2fBmIDBczyAE8fcEf4IlOWJumNq8tVhQtv9yU/uEKEq
	RI1BSpiMIJpkkMUSFH4CWR2WNn+M7WtekSg5ZtsBBZW13HC+fKASZYHlw5sU5Ai/LqFumZ5i1gA
	GezIB+jVaEebd7I5IUIto2v2SBd4YmgXRClFiPXemnHjoy+q4xH6qbxtg6GqcGBrGvw==
X-Gm-Gg: AY/fxX4qYFkd/R4RzzXdQ9kAFvY51lYvn2uU/W95atNZseuBQN6EBj6S7o6kmuuCpRY
	MwW/nPec2WZmK47UU3CYm8gXlCR5KNGOSiiDJ5H0Tp4VAKWI09jwXgKavpf5tZE6swF3v36vJo1
	zqZoH5b1PK3VjTT4qsYpivJ6o14k0Pl+c0mK+unOs33nD1svoipwizqKxWiV89gaj1vvcZSOu+d
	nbLwsf7yRoLckog+S8oUzJxW0BggKRFj60Jjmj6lvovk8qu0NcfsVzMRuYBbX3dQezGWKIPyYJA
	IYu5/aihA1YxgadKWGSATiH/1Q4deWqr9I/aNO9oZwhMuB4mP8rmXvAXrw/tgBBJiLLRoAv1Em/
	4THVe5vyPxfqh5NMiVGMuDm5+E+fdqh7wV9hsbWfGrrlJNP/84Qm24RkXZqR8VpHuZPtKcA==
X-Received: by 2002:a05:7300:3e95:b0:2ab:ca55:8941 with SMTP id 5a478bee46e88-2ac05595d7fmr219221eec.8.1765327181323;
        Tue, 09 Dec 2025 16:39:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcxAzdJF0AG1CFaNadntreiFa5e6hauyRwJLN2Uz501RCUJncoCLxPRCWXIhm0/rWYAxNJzA==
X-Received: by 2002:a05:7300:3e95:b0:2ab:ca55:8941 with SMTP id 5a478bee46e88-2ac05595d7fmr219211eec.8.1765327180720;
        Tue, 09 Dec 2025 16:39:40 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba822b615sm46666784eec.0.2025.12.09.16.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:39:40 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 09 Dec 2025 16:39:35 -0800
Subject: [PATCH v9 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-av1d_stateful_v3-v9-2-718e3b3934b1@oss.qualcomm.com>
References: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
In-Reply-To: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765327177; l=1333;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
 b=fSzHx+/q/fjUJVPkfTCXZT3q4eqoyQyaVMklyUyCVBkpOFyU9HKezq7EWARCWcCJ8BADRsEAd
 RJdZrTBOLwrDhKI+InxPZICCA1cdK/hdIACWbROpqMSVNy3iUs9YwfH
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: hZbRLFKchEs-uDX1b2IrbeJpJLl8PL9b
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=6938c14e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwMyBTYWx0ZWRfXwKf8FnwDA1gs
 NPbcu/xdOtbgbpaGoLPZSytOUhFlkCa9K/nbpG2cebutx5SfiFsRvBWVsZVYt8mxP/JUzeRg1CA
 o/utN4ZL4ymBiX6gezWIAFuZcGM2L3ofWuPuHdcU+92jNkYuYpawoUfyIvk284OvmV54fwJ3TWD
 WcL8ihC34AbC+I0cJwHDELbLMKTu3awJt4FQtSclH8+C36kXu3wEljXCUmTcv2DCHS5zPGc+Rd1
 1qjAswXyukvX2GFe3jPSI7Jl2CAcN/E94VC2NJAqtil6eoNQaqdSyStmbL+bgota+1z8wHUoKS/
 ghZwcK/cnKWONPWXJpPa+jHzdlC444tviytdq8UNtvr4ItieyDm06Jv0B7/8xVtLg1TxMh6QhJ7
 rTXbmRIJuQdCd3vrlyRoZnBZePjRaw==
X-Proofpoint-GUID: hZbRLFKchEs-uDX1b2IrbeJpJLl8PL9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100003

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


