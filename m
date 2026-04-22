Return-Path: <linux-media+bounces-59310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GArlEWWu6GkhOwIAu9opvQ
	(envelope-from <linux-media+bounces-59310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:17:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D83E44528C
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C01A303677E
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB023CF676;
	Wed, 22 Apr 2026 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBxerLW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8uJLBZe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0203CF661
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856614; cv=none; b=seiiSoyyH28/JzcTignjlomLfK7GAQn485u1mIQ1ydtmnlfotNmncG28pHkt5KQb28A0PVYJtyV0sabhbKKBvADOVTts88838ujFdfXdujOG6DC6MX7LbwFZWpPfEt5p2lGfWIGV4utmliyvvkucS4jMNtjjBvR8owkQh3CKEgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856614; c=relaxed/simple;
	bh=e2y9wTZu6s6WYwxufIjwXwcP/DQBfXYY3tqrSKHlTew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e7699VhlyhrE0FRZO49jlkCbJ/yxOdvu3yGlwIYnktpw9RR4O/cFv8JVBjpkA/1C98Dj918NGtQ5x8/RDaLPbGNj1ejNPs0X3dcFf6knt6/wx3fh0aN62gmvkKO+2eAWAnE7WMF+gs0Vyz8EeN8uVuG5kFEUJMhEmwVksRCd5bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBxerLW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8uJLBZe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAFFKi4051197
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z5zOWApMG5LHCvbFxmcKOc
	Ch8WgvRFOM10PJA5IhT90=; b=dBxerLW+K5Wetb1Y0tc+wzXSTHVvCvdoE+1hw7
	JZvOvb/o3aZGIZgfUmY8LXyj9/Ffp8DC0Vqraah8s71Rd76HucdEucLjktAvu17U
	Z2STygKwgfjcCe4baPPyY3Z1/dQ+hIP1J06MO2Pf53u1xo4D4KTBNjeFooGCyBHG
	EigbWCjNxVoKcBtE1YvwHfe5LrKrmp0xwYqOjuSyWh85TnZECkgAwLP2Cg8R4aEJ
	k5e+78vbfX3MiGQyw9kgofxxY02CkdnvEfpAgdxGMhdET44O2MY3Hiu8zEK1BywT
	Vd3kKmohcOsB0PyMjma7/fHlw6IFeMDuLLmwQ2vJmgItsMew==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfk64a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:16:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so4691120b3a.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 04:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856611; x=1777461411; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z5zOWApMG5LHCvbFxmcKOcCh8WgvRFOM10PJA5IhT90=;
        b=i8uJLBZeoVQm0yNqC9GZIqWd7N3M0fMALp7BRcRwPG6FRQDPhscxZGND0a+mWHlkRj
         Mlc2tj8vVSrwPyA31pBvYEO79BbqNl1P8QoYgp8x9Auja5RAdzoZNwRg8ariQv98gU0y
         w9qkg0CTj06Fjha2rIhloZqmcRRKX2ycR28+gp1LlWQlcDmktPAsmGBbD5ThNKVDLxi9
         Puvleaig6/GuoCgbk1Q/BbcxEeWYDRUsW1aV6W0uxNJBv7mlBIX424pTa2/nybpsUVFo
         Q1r6Nf1SkY6/ZDp3W/jo11XZMbC4JTlFNgiec7IqE5zL0ASq1lXICUcE+mR0R1dAbfno
         eNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856611; x=1777461411;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5zOWApMG5LHCvbFxmcKOcCh8WgvRFOM10PJA5IhT90=;
        b=ejJ7JQ4TUVOKOmBNjWHPTY+Kx+R4Yu3XDUYsndyppbWHxR5rd/bJj3VbgS/AgA1JS0
         voWQQc8GvPoNO9wPtliidoCC1MwC0FdRk561RlTTFFmv00pJg61VecUA2JgP9eLhET2z
         ARBspgFtNobVWMeQKYOdq/+Xg63k13+5DM7hKPvfNviFc3v3wg50HnOsbWvx59gNDSDi
         gznivx18gmcxLWXDCMRGaJ4gRBmR+Wc8e0PJglSbuPfkzc6wHOqMGjlwlUSO3/pFZMbX
         mHoV+So78q3mKOCmKcF4XGN31OiYMFLZb4QrpfKlbpEi0z88885OS1u+jKcO6xp71her
         48VA==
X-Gm-Message-State: AOJu0YwlUdYhzqlQokwvx3TjgyMf5jt+VgCDs3Az7Fk+/LkCUiN/xgNf
	gt0m1VtOwJnCuYUVRZmIpNnsh3nkzg+Ilyt73yH95xbe41gRJatti8x+tp3SFXa5NfwvSJ8b/sE
	9DXWfaeAPlom4QjmyOM2RzT/VL/Qs4/Sdc8V03dMKV5hd7UkCqPhfBY9iWMcv9AOIpw==
X-Gm-Gg: AeBDietLGpjvQRpG1HvqzJ5KhuoXDBcdSxDFBOqc2ZH+33/g6XeWTKjbeaVmW8dKVbJ
	VYEVxjmDBCvUXq9KbneDCnKzU41iZqFN76ZEe/7Jvs5QTSqHwTUbI4qvXZtKu5C+lrvDbAZ6ZpW
	35SLNFJRIvud+4zB6YOEGOxr80rHCA7v2QWgN342FAv77x2XgdplZDIB6w/6BfXLC6R+zNSGvT9
	DpLDn9uoQwJE3YIRCwpDitJ7lq6lQrr4CkZ6DKdvG6O06naGKefMcbYLc5VTi5gj+oxgHztwhSM
	MUcvn3Y2Vwmk1vei8ZfjZo8IAGC55Fe4lyJtP3EG3xOR1H4I7b++03VZ4jtNU6/P+PzcqQ948p0
	Ng5g2LsGKS70NZov4/iA3z1sujl7OKlpJlS9bYZVgInNQS+oHk0qWVaiqAO24fHcGsc3IRA==
X-Received: by 2002:a05:6a00:4299:b0:82a:15a1:14d with SMTP id d2e1a72fcca58-82f8b50fb85mr17146595b3a.14.1776856610884;
        Wed, 22 Apr 2026 04:16:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:4299:b0:82a:15a1:14d with SMTP id d2e1a72fcca58-82f8b50fb85mr17146564b3a.14.1776856610385;
        Wed, 22 Apr 2026 04:16:50 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:16:50 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH 0/7] media: qcom: iris: miscellaneous code-quality fixes
Date: Wed, 22 Apr 2026 16:46:33 +0530
Message-Id: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABGu6GkC/x2MQQqAIBAAvxJ7TlAxqb4SHcLW2kMqa0gg/T3pO
 AwzFTIyYYa5q8BYKFMMDVTfgTu3cKCgvTFoqa00WgpiysLFvYkrcSx4YbiFmoycvLJ6GB20NjF
 6ev7vsr7vB0W5IWRnAAAA
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=1408;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=e2y9wTZu6s6WYwxufIjwXwcP/DQBfXYY3tqrSKHlTew=;
 b=OIrSFZ8+Buad4HUS4YwjMBV4YjzplOWOSpcjx81xLEy+qMoSdpN2oDM/m2JsWt4mtltcg5Jzm
 lY+DEXpyI5+AmD+FYvQbnpHx/C3JogK+FP1fXQQOcvdxQHItPokTV4t
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfX/F+VdLY0pZiJ
 yGwuN1NvdZea87McpEcPgvCevatJnselHTVWv7njG8FYwZU9B3XUkUxVnhlJ+WZnVIkKNvkRkX+
 tQ9cQg02MXwgaYZcdTNTmQsJ2rjyK/92o0iDgpoo+maCMkDYvJl84uYDA00dzDAxxh99lwkZZpY
 hwkgeKXn4kTaoGhVzWYvrC5ugHMQniwIfWbwqSK/b4cN1T9ykpsuGj2yphiU05PKFXNVs6h5pu7
 V69lROkJHyly8A9hUE7IUYFE51nvIS07b72hpDhCBSVZ1vd7juyuNrb9Mv92rN0GcKTeHa5iD7o
 4kEGjtcFJK6ESG0HhjBH3ht/faBfCJrMiIjszMVKblFNiadEo4qZK7XRVe7xSfqY2H4kX+z5w5W
 YmpGDpX995G0iRTIT9BsFzWskUsDdv6nQYutQov8oHVKnxqAnms44uX9a72dBP1VO6z82ba+mVY
 VqS334gR7duLIcJi3ig==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e8ae23 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Lb5j-gmOE-iAMMu9PAMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: rdPHHlmfu3VhCv3dmbH8HnYB34JUVOqM
X-Proofpoint-ORIG-GUID: rdPHHlmfu3VhCv3dmbH8HnYB34JUVOqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59310-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D83E44528C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series addresses a set of independent code-quality issues found 
during review of the Qualcomm iris video driver.

No functional changes are intended.
 

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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


