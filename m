Return-Path: <linux-media+bounces-65935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qwRxOIZjQmoV6AkAu9opvQ
	(envelope-from <linux-media+bounces-65935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:22:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED5D6DA00B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:22:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jk3aRe26;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ix53Egen;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65935-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65935-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB08430A4E2D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14893FF889;
	Mon, 29 Jun 2026 12:18:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0018136A373
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:17:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735480; cv=none; b=hc/W2qBcwBJHWnWh5T8kdI9u/SQJV93TAS2/W7FidnHiYYp8elnA5/QuNG411Dj7sIx6PnLsR4RcoRPSYo7GhXcBmIKfs900CDtR294P7ZDrjvJuHUXJMLA+QWbnfJL3a1GmyQpCcvxva5DeGx6OdfcnqyGsSeud9tIeVsvTyA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735480; c=relaxed/simple;
	bh=HaM6IK+lotUUTZQ9Uv9JPAvTQnruRH1SG/KqalYaxhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dbxZdd41jkVfXvTecK81fFtuxBOtNzOmrxJN6/Y1AeMcIxmaRRs4RvvdS6F21q/xE3eHkYJG8aafa+3y93/zPHusmR+KQF96ZBe9rPayd5GpUgrWBzfEb+cPK4/YrGl29rgoLN8Rwq/lPXR5HWbMFbnQgKIcxueqB0RkYmcx7hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jk3aRe26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ix53Egen; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASwSb2603483
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J3A9WII46LLo/46HRc1SL5nhYt9ppRwQzwP
	as0J+tmM=; b=jk3aRe26wZnulWyPWrjKZaMWNp7lYVBv0dX6HR+Joi/P7IQXwhG
	AK1rBYGrfS+CgCoJvHqBarjgKiZuqDLWCbTDQFLcqIZ41BNYzMuTQFu0LKeZeLYX
	qLtAHiW4Sc0KQ2piDNtBZ4YZX30O4cWn+lfHaJSWu+c7QJhI6jbp3QwqrGmNro6T
	8mqzwrcwvl7fHh8+dHdO97cc0Zjea5P4iHzUCrfGLvu9bUjLqri3byOV/dJMKLxE
	4IDyxhS66McwAgslh07xEwrvqml4smqhn4hbtBUbU4yVXXFzQW1z0WTGLJa9dInt
	33zHjDE2hMDiMoO1XMp7m4f94MCGbamoJxg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq88qmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:17:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd9bce7354so2156100e0c.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735477; x=1783340277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3A9WII46LLo/46HRc1SL5nhYt9ppRwQzwPas0J+tmM=;
        b=ix53EgennZ7JhaGKWLoONa+60DEPFEMARqiJiv8dSoxClDpud5d6dBJHThxhvZcZVn
         HjVFpMLni3nlG4jlE0Z5xDo2O5KsBGGn9j9Pwf9226vgFIsxOtiJToOEFHDDMuN67kCf
         kQQl7UlsEwUFUTJjNYzWApy/zZxXYAEYqG4uDqCUs7zkPF39J8Ar+18p52tgN5Yspn7z
         8My9HpSU6nHI54KgeV+eDCGLmhJukE0vBC7l6/jXpRAxA26NuL1559USgScFaEoO/19L
         tW1aluQAw4Y5HFYgpP3GVbNZUfM44qJBHhNoWkCLsgX8iepmpnQGuXvwhnCp0WPgGAD0
         mzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735477; x=1783340277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3A9WII46LLo/46HRc1SL5nhYt9ppRwQzwPas0J+tmM=;
        b=mkZHhz2Pnrwzy4bmNEgjg1YaJJAi8LEy2MX3doYEXTC5dqV3H8iB60eR3ykwYjHAO6
         S9PHKtyrSX6JNjjiUKXAr/LELFGNvFuEwtuvr2PMzTHPDJIUtnFsFNYfXicPln2trtcM
         Z0yCc8vdShzc+MZxHvcv1pqDlo6HVrdzlRNoSoWnwWPJz93F7QizXYQd80jY9+k42ViR
         quDgu5bygTMlgdZD63jSrLO1DCjuKvFKC02+/93c761LUlAREUjUKZs4BIsSAFT/bXir
         sDw59dDOL7eLOIw/ZdXy5iaxmrqVTUb0zmOwO47pPWBiBN9W1eD/D+saBW59mvKfnKfC
         Ii1g==
X-Gm-Message-State: AOJu0YyMfkk9TY5W8pxgJO2KzNBMC05KRvXR4RMwr0++PQATOtEF1JC2
	VfL3xc+XOmfoeLTluUVsBGX8ibcL9y3DEdRsO8+8VyoIZ/L6lKynk0YKgvGJgGSzo8C7AsaptL5
	UwgGJCkhYnExrGea6xgaa3OmIKJvKhdTYNl3K1cwqGk84es8DisV//+P2QdJ6YQuVnPahvOGHRg
	==
X-Gm-Gg: AfdE7cnIJbQuQHe2admQw5ymavzlWPDhLw1vyKwG0jlu2hrW3VrkvYSLuQNshAj94At
	a861tgOa29UNMvGs55f/SWSY6lzaKKM1IRnfiphJkfdJm5qcLAV2JBJaccJWtQBQ8bejLKxs6ID
	96c8JH6TGgAmkUnEXcir9SzwgjFnYzLB/Ekuvybj7/PMk+dmTRHTAllK14rn46gq8mXURWduCGn
	mNCSzq+2FVKFi/fJR0hQvkzDcijnrCy8SIKL2K+JEGoqGNuym9YEGFLPwhQG6XPZarz9NiDz+5V
	Y+CkF5+DUbg7xNbh+OeJjhKiABXxsKKqsh6ANDuKNAzr4JjQa32JG239LfYe32jXtVJl/xAe9cz
	UxYEYXGRbymTJKWCfMgvzRFl9rdZjjk9+wMs=
X-Received: by 2002:a05:6122:5108:b0:5bd:89bd:3559 with SMTP id 71dfb90a1353d-5bd89bd3a26mr3129543e0c.9.1782735477163;
        Mon, 29 Jun 2026 05:17:57 -0700 (PDT)
X-Received: by 2002:a05:6122:5108:b0:5bd:89bd:3559 with SMTP id 71dfb90a1353d-5bd89bd3a26mr3129533e0c.9.1782735476766;
        Mon, 29 Jun 2026 05:17:56 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f46e0d15sm6837519a12.14.2026.06.29.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:17:55 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add Qualcomm JPEG V4L2 encoder for SM8250
Date: Mon, 29 Jun 2026 15:17:46 +0300
Message-Id: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HX07K55vBTHcO4SxiGQNIXuHVI-PvTEE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX0S6a7eCJt6hJ
 wmU5pLL7TqNzkc1J+tq024RaP0fWUOj2dKqkyev23flVGf5+6hAOchF2p7qRa4pIDSMJc8hqZ/Z
 FjeIxef8Qu+DHB1YG1UKg2ZzDzEUje8=
X-Proofpoint-ORIG-GUID: HX07K55vBTHcO4SxiGQNIXuHVI-PvTEE
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a426276 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=xq3W2uTSAAAA:8
 a=KKAkSRfTAAAA:8 a=bNK7v6p62rK0NTNIeiIA:9 a=XD7yVLdPMpWraOa8Un9W:22
 a=P5L7wpMTXyg1GfFA3Gwx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX6ceni5fiU9Vc
 0CJOfLO/YYShyAY4v/ERLUIMOrw5RQnCFK99JTjqDqUCjjG6V0cKSlXA0EyvGEU/p17VrJQAF4F
 K2jP9GVvEAtG9zEl8W/LYlp7uBOxrQBsmYaIlW7K716cDTzspRr4iRCj2Tr8wrCk4LiTABIx63V
 C6O8fQmquCID+eRj5ZHEJxWVUywWnpBdnqhpin1g9UJB3OuDdwJf+Rg4Rng7xfx1uuyBOs6sF3m
 WbdSiW+vkcZneBw4PkUjKAm5B/1JUrmHsUD7cpKodihH0Wehn58UqOUcf/SQWWs2U4fyv538D3h
 Xwds8EpyNJdKyYkhhYA6D587A56FrUOtXU+4hSu+gJv6PJfyUKS4pz0acuGSOfW+1ApRC25Lfv+
 dUuAY5nn5tI3eb9/Ve+YawPNJJJ/JGt0ZhKeOAxyAuHD7WOp14X+1gxE5RYhLJdgwB92EuuBDex
 orNuaN1BQyzGfLL8EmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-65935-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7ED5D6DA00B

This series adds support for the Qualcomm JPEG V4L2 mem2mem encoder on SM8250.

The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
framework, with DT-described hardware resources and SoC DTS integration.

The JPEG encoder is part of the Camera SubSystem (CAMSS) and is described as a
child node of the CAMSS block, allowing of_platform_populate() in camss_probe()
to register and probe it automatically.

Dependencies:
- Patch 1/4 is related to bod's work queued in patchwork:
  https://patchwork.linuxtv.org/project/linux-media/patch/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org/

Supported compatibles:
- qcom,sm8250-jenc

Driver scope and design choices:
- uses the standard V4L2 mem2mem + vb2 workflow
- maps runtime resources from DT (clocks/interconnects/iommu/etc.)

Functional validation (hardware):
- platform: Kona / SM8250 / qcom,sm8250-jenc / RB5
- tested with v4l2-ctl and GStreamer (v4l2jpegenc):
  - single-frame encode: 8192x8192 NV12
  - single-frame encode: 1920x1080 NV12
  - single-frame encode: 1920x1080 GREY
  - GStreamer NV12 pipeline to JPEG files
  - GStreamer GRAY8 pipeline to MJPEG output
- V4L2 compliance test (v4l2-compliance) passed

Changes since v2:

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - IOMMU stream IDs documented in binding description. (bod)
  - Dropped "Properties documented:" section from commit message. (krzk)
  - Dropped clocks minItems constraint. (krzk)
  - Renamed clock-names to match hardware signal names. (krzk)
  - Renamed interconnect-names to reflect path topology. (krzk, Dmitry)

  DTS (arm64: dts: qcom: sm8250):
  - Removed cell-index; use lowercase hex, no 0x0 padding. (Dmitry)
  - Moved jpeg-encoder node into the camss block as a child node. (bod)
  - MMCX power domain not added to jpeg-encoder; on SM8250 MMCX is
    voted by camcc, not by individual IP blocks. (bod, kept as-is)

  CAMSS (media: qcom: camss):
  - Added of_platform_populate() in camss_probe() to register child
    platform devices; no conflicts with existing CAMSS resource
    management observed. (bod)

  Driver (media: qcom: jpeg):
  - Sort obj-y entries alphabetically in qcom/Makefile. (krzk)
  - Use devm_mutex_init() instead of mutex_init(). (Frank Li)
  - Check return value of devm_mutex_init(). (Frank Li)
  - Kept return value check on dma_set_mask_and_coherent(); consistent
    with upstream media driver practice. (Frank Li, kept as-is)

Known limitations:
- scaling is not supported
- width and height must be aligned to 16 pixels

Atanas Filipov (4):
  media: qcom: camss: populate child platform devices
  dt-bindings: media: qcom: Add JPEG encoder binding
  arm64: dts: qcom: sm8250: Add JPEG encoder node
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

 .../bindings/media/qcom,jpeg-encoder.yaml     |  160 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   78 +-
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/camss/camss.c     |    4 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   17 +
 drivers/media/platform/qcom/jpeg/Makefile     |    9 +
 .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  310 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  337 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  111 ++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  354 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1524 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.c  |   39 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   30 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  527 ++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1150 +++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
 19 files changed, 4844 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
 create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
 create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h


base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
-- 
2.34.1


