Return-Path: <linux-media+bounces-59395-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Hk6CPwJ6mkzsgIAu9opvQ
	(envelope-from <linux-media+bounces-59395-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:01:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4421451A1D
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC307301027B
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F143E92A9;
	Thu, 23 Apr 2026 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDpAuxkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GoZpaPEL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452393DE438
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945638; cv=none; b=NnIaf+MELHVE+A6x4cKzoLUx077NP9FSfMhzs3qr04+jGk4segs/JPq10D6p43QnthKZXoBVroY2EoGsb6n/ADMuCnN0kDvwLXF1OwJCRkUEIS7Bg/fD/Zo7SQiSCzDgE/UyLrqVfO8SIgpMPZdc7GqelnzoRldBmuX1Kh/hPJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945638; c=relaxed/simple;
	bh=oL8lY7kTuiceRDZRaGs24VyCt20j8FzRSm6Nt5r9xZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mJDuA2GWHbKL1k4SaGBhr+AxvTZMw8pDMuXu2O//QquWcZwC7Tz7S52cGk0KxgZSA/N9H3hovf5m0voII9t4jTgk3UPNuSMu+7IyxwASUlDhL9Zwjl8lXxqcr9owCOMZjGbcKozfDa/zZzKkarCFUkm5qLdvntCoSwEwCp5bIjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDpAuxkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GoZpaPEL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u4GW3768928
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eIrHtygjWg6Sl2zjvdxf1O
	/+BVTjvrWFBlUr1RH7v3A=; b=WDpAuxkSGIhJqfPeId+thTzthAEyrFT1piVRAR
	pbo2u1NtaTDet2pk1VzY8xykbV1XIcOD6KxR78UbhPUb8jKbN85+A/RjTLykRUn2
	Jm3TC2QjjTa/r0N8qXoFICA39Vy4obtJWy6FrY12JqqKpQ7l4ZBVWAfGFtjtJEC3
	R6kzJZK6itCfaI3iwRzSWNB43mUHf5wvR3EtXZRctXhdOYGTSsfm/TP7ehcUSDjo
	sx8xDUJYFa6HNfn7tOTej1yGf6/b3TQp5VU4wzDfar6ve+LHQe1qdm4B8mRiF8aF
	40mnxHJ1uI1xeEAeQeAMOdA8Pe+U67lqI251Zu2Ciz/BBHNA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq3rf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b241be0126so129490875ad.3
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945634; x=1777550434; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIrHtygjWg6Sl2zjvdxf1O/+BVTjvrWFBlUr1RH7v3A=;
        b=GoZpaPELuMBUgfovSqIAjEe3C4JuxxyEmzmZrEm3ZrYT7X50GErpLn3dZINEgoWM74
         SU6gLhgTcUY+v0AA348Tiu/SyVjDzQQodC4dgr0/4btbKdL3pQqaKjBu4/jaIz2Qp5Eb
         G+nYXYZdXZ9YWTfQnTqeHKS8RiKPm/3DbfxPllFMfKkzYDoJXATek/aTUMIR3a1iKyh1
         X8WWPtLtpjCrvApA/6MaihWurHn34tS6pCz8bkAPMnYrebEr/HswVUIoKc1WrkxciEgL
         2rfnMyzoXt403m+T+iZYZfSQlXmEwJBQMdlTv3knwOr5xzobhZBzwkrN+ie1GzxeApdw
         dakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945634; x=1777550434;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIrHtygjWg6Sl2zjvdxf1O/+BVTjvrWFBlUr1RH7v3A=;
        b=Bn96caBSQuMjrY8is1CTqR2crYqZ+EAuZ5Pjk2vdVIhC0ueTKkjMRY5NztRgKykrqD
         Sn1wn1qe7s5SPDbMGSRGb9IbMK4vHHJ51Ahop1Fb95s9AxNV2mETY7x4zaOtB57s69fL
         phSMOH/IJNeEJi13mIFiJO/JHBiT6MtzQBkyQkBgkJAl7EikVSlFK1geLRX0Ct00iOpD
         9xVZueeM3j9JVa1Z0U9AkUz7Yh7zXADwFhPsqLUqSPRq6qaKCPAJ9BZzUMddThLB1+kw
         gqQoyPcj43vNCL+m88HC8aBlmwu5P+ku0QiTYdzg2eurO6AXZSRJXoCYYIpUXqffEL5r
         4zyA==
X-Gm-Message-State: AOJu0Yzeh4SqkPqWBA/6zTh1HaTYw9ndxDcO9NnYy2rwd/ShoO9dgFye
	ivVKEi/1lMV5npYV+oDhEwa7f8G30f2DG+Bw7MkBTWVrcEpCbdbV8/y7/TOc8jQY/n69ioKebYi
	WJzHhoSviJfOggkI3u7TXoDVTg9Gux2PZUNRGjs9YnS2Fobu02wz6rMNkSfgNZhx6OqNqOc57XA
	==
X-Gm-Gg: AeBDies4HRvM7ez0PBlW1v55tUxOX61ESM8B7e+kUiG7v/fZKKBm7l9jiW4bYc2fyIR
	J21CFtthRGSUb3mMi/OfYnr3j7jtw8xkHEkZbaUMMFrLFLUJFhfacRabXIpYUUbKNQ2PxKXYl3F
	lUyDzjlraIZ5JK7m/a4EjdJgjavgh/k6Duci+01Go2d78E8NIYKTDgKESVIA+XaANUB8cY8pu81
	hsI2OxD7jX4HDv6PZgqx19kiDbg0+HoRbxGv9V2h1whxrsuv0UmOdu45YfrRZZorDENCMXQ+PSi
	z82XvXLDYCT6T/1BpW0d7kyXxzA19Kggq2DIJc5EkVvRIRdQ4NOhcqtMoSMLaMh/ztAgVY/ObO4
	OGPOaluD9/V1OhzFV8GbUpNVZeZCwA53SqcOQh3KNu8QfD3mjulnWQBFA1Ik35XJhkRfgSg==
X-Received: by 2002:a17:902:6bc7:b0:2b4:5ddf:24f with SMTP id d9443c01a7336-2b5f9ed21f1mr207066465ad.10.1776945633308;
        Thu, 23 Apr 2026 05:00:33 -0700 (PDT)
X-Received: by 2002:a17:902:6bc7:b0:2b4:5ddf:24f with SMTP id d9443c01a7336-2b5f9ed21f1mr207065705ad.10.1776945632497;
        Thu, 23 Apr 2026 05:00:32 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:32 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 0/7] media: qcom: iris: miscellaneous code-quality fixes
Date: Thu, 23 Apr 2026 17:30:04 +0530
Message-Id: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQJ6mkC/3WNQQqDMBBFryKzbiQZVLSr3qO4kGSsA42xGRtax
 Ls3FbrsZuD9z3+zgVBkEjgXG0RKLBzmDHgqwE7DfCPFLjOgxkZXqBVHFmWDy4VfYkjkaV6V6Sr
 djabBurWQt0ukkV+H99pnnljWEN/Hm2S+6c+If4zJKK1aMrWuWkSD7hJEysdzuNvgfZkP9Pu+f
 wA2wVV1wQAAAA==
X-Change-ID: 20260420-iris-code-improvement-19409f16258c
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=1700;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=oL8lY7kTuiceRDZRaGs24VyCt20j8FzRSm6Nt5r9xZQ=;
 b=6gcZwThJ9xJ7vHMnVnorb//NKP8y5g/L8dZxIsyZx7HcS+EU8+ld2iR3icdx5/IU3L6jhzKKc
 8It0pNiEGTVAAPuUlA1iKeBBNnsCgntrNRnNRbttQDXbM1kkmmjQt1D
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOCBTYWx0ZWRfX8nvyNtBhF9O8
 M7tT3Wph6WDVosgOiArep28uXFZ1augcvle046JBU8jsjuBN7Zqq5gBxO/XTH/UcBECzhLFL2Fs
 t008m5cM5Auv7LN3Pcy7FmrW/z6MtkjjdDJR/e8emRZ3gEQgRrr4QDPw8HHEV6cErQHR5vG+SYz
 bc5S6oealOoMu5QAKbuj3OmyAd9z4a8H6nipqeqyyNOQ2i2W7lDmMwJBTYVczP212xxXvqdxh25
 VdBbgGdIje5/hv2O3v51iWz/EEu98GySsfaSVJCvYduyvdviEQhpaKvbhyB7Y+BSNSbVRyFEBW4
 u2BoForxq7Ej7VEBYauomuw7IqlWO5IEF5xp741S0qDVez3ZspGUaon+KQyXLFL2z6eR3Ny8ChM
 5t05FQysQE4YmdoBklr+jTNDT2AsuRT+goqouK/eTCNTebkB8mLsYf4i5mAidERXHAfpi4BVX2y
 zZtNcAown0nu1433RTA==
X-Proofpoint-ORIG-GUID: Vi03dBOeBuITy9EMVotv7oBFMbJkGwQY
X-Proofpoint-GUID: Vi03dBOeBuITy9EMVotv7oBFMbJkGwQY
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69ea09e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Lb5j-gmOE-iAMMu9PAMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230118
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.7.a.0.0.1.0.0.e.9.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-59395-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:query timed out];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: D4421451A1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series addresses a set of independent code-quality issues found 
during review of the Qualcomm iris video driver.

No functional changes are intended.
 

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Changes in v2:
- Updated variables names for iris_get_int_buf_tbl helper (Bryan)
- Removed un-necessary fixes tags (Bryan, Konrad)
- Addressed other comments (Bryan, Konrad)
- Link to v1: https://lore.kernel.org/r/20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com

---
Dikshita Agarwal (7):
      media: qcom: iris: Centralize internal buffer table selection
      media: qcom: iris: fix state-change debug log printing stale value
      media: qcom: iris: Fix bitmask test in iris_allow_cmd()
      media: qcom: iris: Remove dead assignment in iris_hfi_gen2_set_tier()
      media: qcom: iris: Remove duplicate HFI_PROP_OPB_ENABLE entry
      media: qcom: iris: Add missing break in iris_hfi_gen2_session_set_codec()
      media: qcom: iris: Make iris_destroy_internal_buffer() return void

 drivers/media/platform/qcom/iris/iris_buffer.c     | 123 +++++----------------
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |   7 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   4 +-
 drivers/media/platform/qcom/iris/iris_state.c      |   4 +-
 6 files changed, 40 insertions(+), 102 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260420-iris-code-improvement-19409f16258c

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


