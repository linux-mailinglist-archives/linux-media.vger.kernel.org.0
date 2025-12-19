Return-Path: <linux-media+bounces-49130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C5ACCED0C
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 08:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 712583010047
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 07:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F802DC781;
	Fri, 19 Dec 2025 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4G0+MrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tk5vAo3f"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC662D978C
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130185; cv=none; b=OCbPwoIRBUXbeyJ5BYdAC1SUWZRJ7k1VJS1pncjgVJwtrKwudkcMpvRumxpZboj5WbZGpreCppMljNmOcCLYgdGWhf7Jfu+sZDkCbze3yqakVz2PJZxxfzSxpAdDQzy9k/jrh6YHQedUP2b1JTGJnkAH5qrEAKoKSSI5noz9ZJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130185; c=relaxed/simple;
	bh=3ZWpMg0E3NYmyWAE3aXiRqWAX0J6Oxd7boeZoR987B0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XOV4p2EgsETHnofpBX8qVnptFiDUxyUTNhLORzU2QQ7Bv2KGo4EaB2yPLVFDtCRG/wLIpmXaOQdFYX0Zd4BnUgG5U2cL2JUu0IFK+VFf0j7oLnfL4N2lccQhOz190936PLCJsv2iAIqmTEM7Goewo7E+E4u3EOvQ1vc1Sb1APs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4G0+MrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tk5vAo3f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cBFQ3975663
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H2shBnxcq1hvmtnJQe+gxT
	z1FeF5AQZBEuypaTKm6w0=; b=Y4G0+MrHM2nP82sxd3VmR0W4OJet2IiCaF4nhV
	z5dtxXbMrAulXC9WjTkAbx6uZ9JrvVZIwH4EyXED45VKOjO21GarbBzhc4nQo66U
	JjMLORiC2f1FVG1tGGM68PbwFATqKpyyZMg+QyfiOrO6qxPo6N8M3/lb6vHmE3Zu
	8SqY6BRzvjWlSu2hCyVxSbuiO4gt2mqHIdrcPLvvYAwCLkxg2kDau3L8QF+NYfWK
	7bBJ/jsgUUOxto9lSaeGHqo9ObjRSH/hzLniIa9S09uE/y3qLxyn3xrDydx7quBe
	hv4Yieauf3J8JcAXyt8PcTnb/n7WjA6ePMn+Nx2jJ728tQFg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fhpjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f69eec6so19182155ad.1
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 23:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766130181; x=1766734981; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H2shBnxcq1hvmtnJQe+gxTz1FeF5AQZBEuypaTKm6w0=;
        b=Tk5vAo3fc6OLT1IEigifXVuQT5+L/lm26XaQzkM/RAzaQJUHRH3wvf91kKiWVRyzzg
         aP62yVdvrz/RaVmvS2jtVT1iTMzi01AH53mFaZsp+gwd5BO7qsg2vFeeIYSIWn5g8PVi
         XdzLH66GLk+x0y2CUiOpkEHhMlTS+Cegr3YdwBPF9e0OWi+WmgDSzGVJwxivg5m5L7yo
         en74ubY3P07LWaZa7sn0326sLkFsi6m7sZ0jamMiXcMgxgMyT7KKiULw0G1XVszTjyT/
         CGD+jOJtxeDOHyZWRatoNXwNwp2cF6TfKaUKEvK9Y0EHjqyBR6rjdnNUYOrhLtQIqk74
         ZmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130181; x=1766734981;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2shBnxcq1hvmtnJQe+gxTz1FeF5AQZBEuypaTKm6w0=;
        b=n8lUj55Sp0PyUAw+g+NiEn40NZj5A5gv7y2gF/xxPyXBuaAaoM/fRM+YJxuc5qJTjc
         1enVrHkz+MNe4G49bqkB0wYvSfrFOQB8zYR3L4F+LEtF10BoLT1YkHjgnpgDnoyMgcwd
         apnz3b4X2a4VWVo3AcZvuCfwG34uf1mD5HeqBoY46oGJO8PpWeeKGPjM/w7aLsasD/+0
         V+keKNqiIRrvuCEkZrmfHNfkhgbgph2ClxRfzK5O1gLt4pO9jvGESSxIjvBelFABQLg/
         rs3Fr/2SQmHvHy4DkOzj+oq0RHx+YhzmqP+ubfbxNzI85ljMame14edZzJgSskRZgqiP
         K8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWej6NXQ8GXf7W4xY8QD448Da7JebbXcHHqEm7+3RpXcQqq6nxAkfiHJYtWk1dnBlg9JeiKRp3Fgmij6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9QCoOASYuQ4aNv/eU5Ok5IPfNFe8RA5ZWeWOGYGKqRGzXVz28
	xTvwZoHJfHHkBm16uWP9u16ATlXj7h4bEHttRJAUAzjtl0OlTb4i83ZCgFlrMl7Sa6EPmJFT/3Y
	6vsW1MQwGbQzXNpMrwYgyvlyupTbK+f2UfQYzZPcxr3ExoDYmWy6yc58rhGCHMPV2Uw==
X-Gm-Gg: AY/fxX5o2CKMIkyiUjdBpx3FwwgoWQtzE6k/MUZDu5tjYEvsbjybRDx2BrIHNnDcNlB
	c3Q0EVdAWZNWn/Y9pyl9FRMb3GiH6L4yVG8j5XhLryeTLKlF0m1EmVY/Cz3NkAA4dOoFh2tUjyy
	s5wno1GhfwrUOkaId91zpAfyxEDy6mxcWJSjLxcidv297Sjj2N6/SD+6vOEsoglSjYRIRCeghvr
	Ni8qV7gYrrec2OeNdDUwW0lq4znPvmeAITBsU4uOALlaL3q58ep5JmfwXvVsbrcOrgiMEi0sryd
	OmsDhnpAOaA9dYreqQJ1B1qICa8vAvbce1CWREYZdVYuyuQPGpy/3iBdnP6fvJimugqOocBn8l4
	O7204kRIZJakUa5Am6cT0DJ/Zbu6HYlWDVp6EybBU
X-Received: by 2002:a17:903:2985:b0:29f:2734:6ffb with SMTP id d9443c01a7336-2a2f222bfbbmr16064685ad.22.1766130181222;
        Thu, 18 Dec 2025 23:43:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRy7n/XhFB7vTNl+qtmTJWFvrxaf++vGYy6ksfOBskmEYghHgKuRml9j6GYSNdwUraDWr2kw==
X-Received: by 2002:a17:903:2985:b0:29f:2734:6ffb with SMTP id d9443c01a7336-2a2f222bfbbmr16064415ad.22.1766130180554;
        Thu, 18 Dec 2025 23:43:00 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm14007325ad.51.2025.12.18.23.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:43:00 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: qcom: iris: encoder feature enhancements
 batch2
Date: Fri, 19 Dec 2025 15:42:28 +0800
Message-Id: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYBRWkC/42Q3WrDMAyFXyX4ei6xbOenV3uPUYosK4thSVo7D
 Rsl7z4n3d026I3EEeJ8R7qLxDFwEsfiLiIvIYVpzAJeCkE9ju8sg89aQAlWKbDS4Uw9nEMM6cw
 jTZ5j7nmVeOBxTlKzJQOu1QhWZJtL5C587oi300NHvt4yaX4MxcAp4U7K4J2jjPwfsFSylL7y2
 mILlbb+dUrpcL3hB03DcMhlwzpMLLdBmI8FkUY02hnjvDPadw6p7MhZRbayrUGltG6wEVvAPqR
 5il/7Sxa1J3z++kXlcAjK1l0FVDXtn+F+/Oon/Sxj3TB4BuTffqd1Xb8BL51ZF8gBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130176; l=15320;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=3ZWpMg0E3NYmyWAE3aXiRqWAX0J6Oxd7boeZoR987B0=;
 b=GyPwDAMntZ3ivsFiFmGYJxh0V68XS+cKdDqVlOTsn0A4zS0nNX4Lt6d3HPpcb6poBL/lvK92g
 XRkUgydQjLfBJqH1xHTUZwyhNtEFgnFavstWY/rq8WwFusm/PfpsAcI
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=69450206 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ySfFoKJIzKIMhuUfuzwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: xHtVbaiVSlLejkwT_OniOkCKfRHOBG5p
X-Proofpoint-GUID: xHtVbaiVSlLejkwT_OniOkCKfRHOBG5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MiBTYWx0ZWRfX5ZPWXhVYGhTx
 NZLABIdoTkVlKCaU+EGCKJaLZyvz+KfWOLv9eZ2lvhoKmFzit0PXfAb8JjS3qCyFyAcKGnfRO21
 m3Q0PlTKJUX4gFPfJa3HQfB24+I9jdTJYGrLsK18ooJWwcV74sbgpYRTrlgP89DH2pcxXomhktF
 2ddu3+Sjv7DArlLpDqa9ih/ibMpKK0IRp2SWVzt2CgqEdS0Bsv/J5oq7JIj4XvJ/n3SXcy7/irP
 sfHQN/HTvJaAuyU/efBoTBA9jHKbjv9fJ+P0v/xjkST62zCKUo/S/pYlL6priraTkZEEhfPR3IC
 /+kuANrUM9jRryOyO8c1UaMqn03mo1x5Ig5DAjquWHOk6aBGq3y883WhhZvrpEqnrQi6e9diFL3
 eD0Qu1hXLcn5jhG7h9kRlRZ0v+VAg0Ay40nQpfN7DzahAA1Z6fsqPLAJPqnfezrJhydimLHqE8y
 /DGjEzVwULrcsjtY0LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190062

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
--stream-to=output/hier_coding_layer1_3M.h264 \
--set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=2,h264_hierarchical_lay_1_bitrate=3000000

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_layer0_6M.h264 \
--set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=2,h264_hierarchical_lay_0_bitrate=6000000

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
        Standard Controls: 33 Private Controls: 0

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
Changes in v2:
- Add comment for ir_period calculation.(bod,Dikshita)
- Correct the maximum value of IR_PERIOD.(Dikshita)
- Add a patch to optimize the calculation of hdr size.(bod)
- Correct the num_recon calculation.(Dikshita)
- Add a patch to simplify the calculation of COMV size.(Dikshita)
- Catch the result code of session_set_property.(bod)
- Add comment for shift operation in hfi_buffer_get_recon_count.(bod)
- Add support for layer bitrate setting.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com

---
Wangao Wang (6):
      media: qcom: iris: Add intra refresh support for gen1 encoder
      media: qcom: iris: Add Long-Term Reference support for encoder
      media: qcom: iris: Add B frames support for encoder
      media: qcom: iris: Add hierarchical coding support for encoder
      media: qcom: iris: Optimize iris_hfi_gen1_packet_session_set_property
      media: qcom: iris: Simplify COMV size calculation

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 476 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  16 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  98 ++++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  49 +++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  18 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 161 ++++++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 226 +++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  65 ++-
 10 files changed, 1102 insertions(+), 42 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
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


