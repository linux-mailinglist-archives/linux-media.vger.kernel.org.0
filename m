Return-Path: <linux-media+bounces-47796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C3C8D295
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 08:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2CB34E43F2
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 07:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C383203A9;
	Thu, 27 Nov 2025 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nl3c0fji";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QbO+5VQL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB27031B119
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764229504; cv=none; b=q+YykVihfNj5sz9+xzRGDZFQ+rzo1BwhxgSuHXpqsFOaZm5dX4uw8ef8Lq6LD+/W9SUkf4g5OG3u/qT+8tHgM+8wLWXyv+eOJF1lqjwI1wurIQRucG/1RH4d25tCNsroEv7aynmvuHm71+Gu2hmFEvwleAHLwoeJF3L5+5vm9o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764229504; c=relaxed/simple;
	bh=vz/l0hbUbKj1WZhOqvp15gIxGg+vFoURHntWvH7Py/0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KJSr/76CTKEUg4QZ4K7aqghV5nY5VPmkB75HeBFqJoB9CVPQba+b5QVHbnRyuFwUKHYWVWU7Sl9fLM+bIindfcSt/wpc4vKuAyho8e623brirKB1heCURcv71iXiUfyRT1xbK3MKM/YBwpjI2RvoAQ0CuBJy1AdDSrk6YjvzJvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nl3c0fji; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbO+5VQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR4XPlN1457989
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 07:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QZYh3H10pSKlSStmP0UedT
	MeoJXklIx/VdIFb1Ao9Uc=; b=Nl3c0fjihROdI7pd+owoae4XIhh6ZNYzNYTFzL
	sGhwLTJmHbKSFIaLGE83UQyEWqhJRCLFu6Txe9ZCHreB4KFv+nQo7Rl5S7D4VdC6
	fIzhP1iELJEVCjkVhdUcdCtZdfam4gQ+F6mR/AsLbFuzwGpfnndX5tllKPn/gDkM
	nO50eP6+XJXLijI4jXT2Oo6v3rE32Fccu1uPtaFVFiuhtCloE4KgFJc8EVRMeg+f
	mlw4mLJ/n15VQvFiPeU/R5LySa4wtjRFwFpKEcw6xIpACqnoDULRbnLWHFA/lALx
	lkzP7QD4Qewxcqpe8w3s88/NMGwuOlbR8gXTYZnlBeiovWrw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvkph6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 07:45:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7aa148105a2so553906b3a.1
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 23:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764229500; x=1764834300; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZYh3H10pSKlSStmP0UedTMeoJXklIx/VdIFb1Ao9Uc=;
        b=QbO+5VQLhcH+RXE3CErldlX/e/NXBPYwpah9hkVOgAjqQqRN8aOHJ+7KHgaMEoUTdU
         EcMQrAF41mExwxmzVGG+sbEpQx2q4fj5ZFi9grFuE9hDJa9XGHOqEv6aBat48Q324FMt
         dX7xP8peU3XuZGLaPJdpstQwhVm4/WI+0JfkR4iri4OOdgTEY1nbhEHeF0TmZ4DfpU8e
         CfjsT45T9ZFiVTtfcebqMf9bE/kKZ5JPEjxGgElkVcoF4irfRt6Ce/zqLKjJV6cew6re
         azeOcnCEyHLQLppxOvfc4EV8zQGmRT7EVWJbqL8GhZdk6B+tJQtf0EzQYOmjUtKXtSgF
         FFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764229500; x=1764834300;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZYh3H10pSKlSStmP0UedTMeoJXklIx/VdIFb1Ao9Uc=;
        b=QIcECuEsT1fVvn2vyPwzsCHzM2Ts3KBKabp2YF9M38zVz5RoHYqUC7Exi/fG9oQ0Zs
         6lRqLK+GfBIr884FtSpA7V6HumXeYcGaYO69kKid0zLmYktLTlU36JVtsyjoa81cGMDL
         K+7V+j973jw1F73hm1o/ks1WSJaONPoRPGKH0eZpGB4fIeVOtMAQXoQhvTnS+ja8LszF
         lMEFIpz0xUOOSD84TsMQ5D555klbPnbqP6gYADpawYr/6Xdhu4MtIXMSfNM/D/665zJ1
         GLuLP1LzgREqee/Dtn3dnB/KNzv78JZisKTTnKhPxUWD3zsbffcjoj0A3w96DmHL36Ul
         aH7w==
X-Forwarded-Encrypted: i=1; AJvYcCX4qAiHi0MD++kZ7oNg+TVvkla138qIsCryjAzownIlFybeajdkm34oT49RJ7RLCaAGyqyGIjLMsP0QxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEAMHetmDj9CFwUZLN2xKQ2B9z+S2U04R6XYb6x9gyjrYTO4LN
	r5pv+jFSz1LRfXUkp0DFNjqFVOsCOWUiPW3efk99rPI4kkktqcMH5pYgTuqMJs1+WrysauUv70/
	mXWRzZpCeMyMD3JZFkvBJf0gEDzXFMVD1ogUjJTGjbrearcqhbgS/HxWeSGe4Jq3yFQ==
X-Gm-Gg: ASbGnct7KUEY02Orz/+vycQohYTYBVESkk+PlHTrRAo5klIyv+2vuApVOIDMepfMFPd
	8fpfM4YAxRqGkFr6rwg87gx7erD+1KTbmQG9miESyujyGtX4dRTi6PZQsAy6R/q58YCVMDjJ0kB
	0LaEBsWTcAWv+tWh3OO0DfDZLD2uuw0usq67EiSlMpIwciZC0Oo4eYNzre7yybFww201UeeLNrk
	I7jet2muJyvwvECY9Oo7/SkVyoj96xzU722jpYNHjF6k02Wx24ki6yOzCbuwEeVZKf+KQJ74xZS
	AC0hKgYAlvOu8HD92jUg38JWUVbSEDEUI/961NLwzyqqCQSVhenP92Wd2xxprrioUqa16rE3cSN
	Oww+xoC/juHaWclKVWcoD4JctSTZeoJdqNgWcKxEGBgMpJASuW/3WS1GLv6ntg/hgKllbRIYbqM
	yY1BC6EA7f6FT+
X-Received: by 2002:a05:6a00:130d:b0:7aa:5053:f42d with SMTP id d2e1a72fcca58-7ca8b0c00a4mr9855690b3a.22.1764229499454;
        Wed, 26 Nov 2025 23:44:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdcKI+nxPs47o6VDLaprLXObyDUX7roo8pLYbS8O4AyoV7ZwFGACjxMDRyVRzEDAAyzPQJkA==
X-Received: by 2002:a05:6a00:130d:b0:7aa:5053:f42d with SMTP id d2e1a72fcca58-7ca8b0c00a4mr9855660b3a.22.1764229498970;
        Wed, 26 Nov 2025 23:44:58 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f080beasm908717b3a.47.2025.11.26.23.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:44:58 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH 0/4] media: qcom: iris: encoder feature enhancements batch2
Date: Thu, 27 Nov 2025 15:44:31 +0800
Message-Id: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8BKGkC/42Q3WrEIBBGXyV4XZc4iebnqu9RlmXUSSM0setkQ
 8uSd69JLkuhNyPfh3iO8xRMKRCLvniKRGvgEOcc1Esh3IjzO8ngcxZQglYKtLS4uBFuIQW+0ey
 ip5TPfNXRRPPCsiLtarBdhaBFfuYz0RC+DsTb9cyJ7o9MWs5STMSMB6kvTo6q5d+A1chSeuMrj
 R2YSvvXyHy5P/DDxWm65LFjLTLJvQhLX3QweENtrRptaUDVNDpblmhNC13VkkNoXGlB7IJj4CW
 m72MlqzoM///7VWU5BKWbwYAzbfdb7rpt2w9fI7lAeAEAAA==
X-Change-ID: 20251125-batch2_iris_encoder_enhancements-3e5c42b93a25
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764229495; l=14019;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=vz/l0hbUbKj1WZhOqvp15gIxGg+vFoURHntWvH7Py/0=;
 b=zON1rqXeeeVurlqdLJtHZWGf1rccY5wyXDchotUEYU3zE1SXYSZtwDqjFvNZryY64Xc0B3CEX
 YjZfJNgLU/jDA2JVzhdYYjnPc01UDEHh/idtk60kFaqaxJ3D0IlRZG6
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA1NCBTYWx0ZWRfX1AtUeNANoKM6
 jHW433CIhKbwnDAHhmZCeRh5dpXuCoXgBTtAm4egj6nJX/3vqCJN4MolghNooTscUgZGZ1AIo1h
 cSbhsVap7+ElyvjqkWqjuU2Yyd1DO2xmVGuPgA23yp5MaERuPlYMQtrHRD4q5aAVXnt7A2v8z/t
 /15NaWRqptqwOOuIUwtRAg729TMkF1tB9X5RA0Zz9BEgqIDa81MkGCBM0c+1S/CyXgTUjAunOaq
 evxLETaOOuH2FvJwE1euLAoLATNPHdxIM+iCkwYhtT+bwVyMhyIG9M/Lj2FtBk1UvbvdRmsxy5X
 x7VOzEqSO8QiEn5k1Uu4PPpz0EUhCMulImBWZQBs8zsKesAJeyZjwIgP30w+OGNeTH5beBtNdpP
 i5HEhSeh49z0kNhp9itSohvttbV0Bw==
X-Proofpoint-GUID: sqNvhYqSiZpYNh288EOBWI-qTzAFFnJJ
X-Proofpoint-ORIG-GUID: sqNvhYqSiZpYNh288EOBWI-qTzAFFnJJ
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=6928017c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9ARsnYGZO-bw47MJTgUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270054

Hi All,

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
 video encoding features.

All patches have been tested with v4l2-compliance and v4l2-ctl on 
gen1:QCS6490, gen2:QCS8300, QCS8550, QCS9100, X1E-80100.

Commands used for V4l2-ctl validation:

Intra Refresh:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_random.h264 \
--set-ctrl intra_refresh_period_type=0,intra_refresh_period=30

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_cyclic.h264 \
--set-ctrl intra_refresh_period_type=1,intra_refresh_period=30

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_random.h265 \
--set-ctrl intra_refresh_period_type=0,intra_refresh_period=30

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_cyclic.h265 \
--set-ctrl intra_refresh_period_type=1,intra_refresh_period=30

B frames:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/b_frames.h264 \
--set-ctrl video_b_frames=1

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/b_frames.h265 \
--set-ctrl video_b_frames=1

LTR:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ltr.h264 \
--set-ctrl ltr_count=2,frame_ltr_index=1

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ltr.h265 \
--set-ctrl ltr_count=2,frame_ltr_index=1

Hierarchical Coding:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding.h264 \
--set-ctrl enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=3

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding.h265 \
--set-ctrl hevc_hierarchical_coding_type=1,hevc_hierarchical_coding_layer=5

The result of v4l2-compliance on QCS8300:
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.18.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 52 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

The result of v4l2-compliance on QCS6490:
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.18.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 27 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Dependencies:
https://lore.kernel.org/all/20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com/

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Wangao Wang (4):
      media: qcom: iris: Add intra refresh support for gen1 encoder
      media: qcom: iris: Add Long-Term Reference support for encoder
      media: qcom: iris: Add B frames support for encoder
      media: qcom: iris: Add hierarchical coding support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 337 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  12 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  55 ++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  45 +++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  12 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  19 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  94 +++++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  90 +++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  58 +++-
 10 files changed, 710 insertions(+), 16 deletions(-)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251125-batch2_iris_encoder_enhancements-3e5c42b93a25
prerequisite-message-id: 20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com
prerequisite-patch-id: 2b77a7b9bfb436751da0bf69488dbff567a38479
prerequisite-patch-id: 190f29ef211b046f0d031e3a4b52f2c3bccd0cd9
prerequisite-patch-id: 92ff1a1958eeacd53d70e155bb8214f9987ddf85
prerequisite-patch-id: 0dae6aaa8db7df0729436cf9268d29ea363f0eed
prerequisite-patch-id: 6382693f5a5a7438660f2e592b30163551d92791
prerequisite-patch-id: 9aa16211c36540a61d219eb25f09b7625b9bdbde

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


