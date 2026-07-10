Return-Path: <linux-media+bounces-67219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IqMdN+NeUGppxgIAu9opvQ
	(envelope-from <linux-media+bounces-67219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 04:54:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF46F736CCA
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 04:54:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I4AbOs+2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=heVCuf1E;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67219-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67219-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 374FB3018D28
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 02:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E0935E1D3;
	Fri, 10 Jul 2026 02:54:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D753A3546FB
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:54:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783652065; cv=none; b=WQDjnnvk0s8+S4j1tIWIUS0hviY2T6dO4c9UoOY6qMqo856ecNjiLXZlkDleYlj5YCjJ07RtAOmCQ3YavcjgwFeK+5WfL+lh3YYS3tvaHChm1VUTRVK9Ih7xthTKxAp6pZCipGNAznPZ99lHgKLMfyWnBsciWGAnzFGx7J2h/Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783652065; c=relaxed/simple;
	bh=7qGfQqNS9ydusBK8Xdl6zQRC0MGGIKcZHzIJPyGleQQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BcLwk1TxT5E+u4AkXl6NtxtMH4x4+Wqed1kyegChWbsnvyCWvlO/ncC8/NBlaDzwc9viHMYc5dhtBQvG9RaRvItLuF6jS+8Qv7aKm2xTELldWkp/SaG8ZfgPpH9sFA+VseVaXvMOwbhmwznSXdolO0De/Th856MRE9vEfv2SyAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4AbOs+2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heVCuf1E; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669KZBfW2917377
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u1SBCCFLx4Yl65ZIU3T88g
	9p4TgvqnsbLOSECaXWRNw=; b=I4AbOs+2LFwJy5ph1dd5oaxOE1W0NHyugL6kQC
	gToSpmBpoZiHAPWnkPcdshEfirsJ/+6pp3e5h0SkI3ixTn2YgUVU5SAKy3mhHPt9
	pTjizNJ6VWs2O84uA6b5L5yBlbsuA9UXkJt0y7kEV6Xbu3nb0LnsH5aupu0c3bJC
	WxQKRYjQrS1OpK14n1rRRn5ESGKrlGm4E1ZKs5d9WCACX4WsLCidHDlxEtL4b9al
	X6X37CNnvgc1NE0Ty3QTKmNqkCZ6mLCkGbk3dZC5Gbptgp9GlwdN7LJki/7SEG2d
	0WenEMJ4GXDPGfqBjgxSMQkNAHMIqVmD69Va5LnHai5OG0IQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte11aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:54:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso725294a12.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783652062; x=1784256862; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u1SBCCFLx4Yl65ZIU3T88g9p4TgvqnsbLOSECaXWRNw=;
        b=heVCuf1EHqrPkjC8QgBItv2nL9NJwAYPxHQVJC8n1D3gEWoMNDWBDpdG/YQICUECTX
         bg688kiGuTllXwXd4qz67pNdcnzxEhuR1KSEneWQzrI5kXHAjZPKlmioMi2BZk6LxbXA
         9iGafLdNcnwHSi9ZUeHIzHg19wuwhouPiatV9i9DR4LHhzJEQ6IKfC+9ZXP3YwQF2FKf
         5rZj6FPpAyAoGCVqWvJ6Q0iP9d/cWjV1IS5IVyQ0R52PZ525XAR/u00UiQ8jQwq1FaHG
         G5LGEFb222Btz+6XxDQD3Z6GhcAl6AZbD7PQO0N8a8hYtTuT8oleFhSjN3HxOiKEPdBn
         oMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783652062; x=1784256862;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u1SBCCFLx4Yl65ZIU3T88g9p4TgvqnsbLOSECaXWRNw=;
        b=HPH3CEkw4BcJXy2z5qI96A5R/XcuN3qXrQxRmf8neA/ZViGMajUSEjLopxSbFJcbMd
         D2SKPXF4RGspniH9PaHlhGTncFele/CLExQ6xr2lHTu2TJyhCUe13/PHyA3TW1Ob0bi2
         lpbPLvnYmiAJPXN7XHpiIW9ZkEx9G/HB2IYPRvN8Dahkc5KRuzD1L1G9GBzGTyI/iJfv
         m3ueF5a0dmGa465QnsEr0BIK6jomCgL+K86HS946gOTJ6gAJAjMgHIYYUHUZJDG5GUPy
         W9ILfhIwyU94QA5lQmmRzQ5Gbx28mKbI8KMspxbkqG4K6xvZHlGePHm/llOv+LD+ZTOA
         it2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqu2NZ6YEU5aIi3ecWb1EbvWt4JW78tq436Bfynvqf8P+rHwP2eZOZZBsuqZBosodPZdNjsQu10L4QG5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YycupLKwwcThqrMrDl3Ob5Pso54+H9GauSnoJmk7sIQI8+HUsfV
	0XtihZStA9CROaOtHewaV4QHIxq42MjXljDLBBJlV9kS7NY/Kge8j02Qsnmt9DWUwRnhplDfuM9
	/SkIbm2+z9cKULdURG+0jBtN5arKBZ4FLtH0aDauKt7Q/6vkQsxvzyiV8ohH3NeguZQ==
X-Gm-Gg: AfdE7cmx81Y/7hXFX24GUhIDPEFf7QBQiEI0qNubrT1UcjTsiMk/de7SwXd/3gGNbDf
	hsgjPEpar//+rlipw42sTdk/MATbtKkOsZuMHHTbz0XZNbK6JAon2SFJiDgIEfYg1X4ScAJriu8
	e4jH3PSTxeLmrJKPce245JaTWqaCodTYsb8tVJF5RJaVyjQ9zILEz6tTmocVgUhMojI9sQCwvEl
	Gc8ErW4ZDx2DPHMrYKc9SJJYWhaRE3g7oPmapPdlWAjuGk+TszoK5jEX9BQ6bxGbfG5s3F819IR
	qEJ/x6xd2h2D3hoAJaIv8Qg+H8YvPk5tgkalLWmXdejahtl8kKVzRHIcs8nXDduNw+7I0/X19GF
	ovpEXFY6rZHd722mqDvEPfUOIl/tF2JYqfhno/qVNMs3N
X-Received: by 2002:a05:6a20:cc0a:b0:3bf:9142:ba3a with SMTP id adf61e73a8af0-3c0bced4657mr11170285637.26.1783652062409;
        Thu, 09 Jul 2026 19:54:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc0a:b0:3bf:9142:ba3a with SMTP id adf61e73a8af0-3c0bced4657mr11170254637.26.1783652061922;
        Thu, 09 Jul 2026 19:54:21 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6596681fsm41843220c88.8.2026.07.09.19.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:54:21 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: iris: fix QC10C format handling and disable
 time-delta-based rate control
Date: Fri, 10 Jul 2026 08:24:02 +0530
Message-Id: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-0-701d6dfd1ac1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpeUGoC/52OWw6CMBBFt0L6bUkfAtEv92FI08cgNUClA0RD2
 LsFd+DPTU5yZ85dCUL0gOSarSTC4tGHIYE4ZcS2engA9S4xEUyUrGIVHS1nVjX+rfTglPOoTQd
 q8j0oB92kldEITkVLz67klTDyUhhO0r9XhHR2uO71j3E2T7DTLtgbrccpxM8xZuF77x/vwimjU
 jaaS2ZsIYtbQMzHWXc29H2egtTbtn0BDfzktPsAAAA=
X-Change-ID: 20260707-qc10c_fix_and_disable_time_delta_based_rc-4d6172b395b1
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783652057; l=1389;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=7qGfQqNS9ydusBK8Xdl6zQRC0MGGIKcZHzIJPyGleQQ=;
 b=nAEHoDGXaAtzeRSfV4ocLXAi+9AaeEm6snAXBGYCdEsLrZTFv9Jptlr1eXl2OBz0RCDcQPnm1
 DJMcj0Z3vIwDQN2Xm+xIEzUnSryZcM0pgF+nl9K5fgFlT5vw7Vd1JVo
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: t36Jr2wQMfPY-K6kJKxe4_rXxX_WfSKh
X-Proofpoint-ORIG-GUID: t36Jr2wQMfPY-K6kJKxe4_rXxX_WfSKh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyNSBTYWx0ZWRfX+yCrx08Uy/Gm
 urbpqlt0MdLy4hcb3Hry06tRbP3a7lFEDXl1DN5Xn+Ogku6aHxfNn9c9uzyZ36uv+4Q1x1hq/rZ
 WIK4XIr0qVvSKWMihrksUOdFIxWZB9T5bD1XR3wfnbE7/89X3Fz3w+xyds96ufgR8R3dyi0osU6
 41L4/W6b5zSMK0d1xLY1wmnGisOr2KSWkta0yBMjcvl+q+Rt9HLhfECAk3NW/V0wiiqJApbrYxy
 TEX5eMwR6c+AP6VJeiAHUU4BbPI1F7Z+N/wi0P2iTL9ajKtJ0x1LALpQf3I8og7NXIf7ap4wzEu
 sHeNDcW4H2hd1e7iCTlElzGvpz+uAEBu66qBqxHcpkxpijlQ20n9AoYqqXv4TG1MitJO9eFe+/N
 Fs8qOvVbt89T0ey/rK+q2oViZw3Jui/tNsFpuLDI2EtY7F5P3miGwSEH0RimZxZIMNo708WoZiW
 yQiLT5GKs/5ZIIN4zzw==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a505edf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=bHM9EGv_eIyXTYkJAFYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyNSBTYWx0ZWRfX41himglCJVj9
 7YUL+lcAvZiSmcLyOS8Pqn9aeJZPDPQUPEQKrK9kDQ6fkUM53GcOE2d0Co+xdxnIGOJrakCE5jN
 MlD/TtBd44R1+f4MOVCMe/gHBOFPuJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67219-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:stable@vger.kernel.org,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF46F736CCA

The first patch fixes QC10C format requests being silently replaced
by P010, because the bit depth was checked before the firmware had
reported it.

The second patch disables time-delta-based rate control for VBR
encoding, so the firmware follows the configured bitrate target.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Updated commit description (Vikash)
- Link to v1: https://patch.msgid.link/20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com

---
Gourav Kumar (1):
      media: iris: disable time-delta-based rate control for VBR

Vishnu Reddy (1):
      media: iris: avoid bit depth validation for capture formats

 drivers/media/platform/qcom/iris/iris_ctrls.c         | 19 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h         |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c      | 10 ++++++++++
 .../media/platform/qcom/iris/iris_hfi_gen2_defines.h  |  1 +
 .../media/platform/qcom/iris/iris_platform_common.h   |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c          | 10 ----------
 6 files changed, 32 insertions(+), 10 deletions(-)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260707-qc10c_fix_and_disable_time_delta_based_rc-4d6172b395b1

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


