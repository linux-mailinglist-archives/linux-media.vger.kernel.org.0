Return-Path: <linux-media+bounces-63760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pPYPHE4xIWqiAQEAu9opvQ
	(envelope-from <linux-media+bounces-63760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:03:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB96763DD34
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:03:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MOYqBtJR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N7BJEXHS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63760-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63760-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E6A33019135
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 08:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4081386435;
	Thu,  4 Jun 2026 08:00:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419EE372049
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 08:00:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560052; cv=none; b=KDWYYcqwC/cD0wLdwrgRbt00Nz1HObrXUKZWmXKOIIxct+yyDmwAF3ITVZ2yro/Aa8Ep2TL3e+UPFVtq/jt9TeAzJIOIOHcfDJXtEY+x4yoyCOKktB2/0Exvr3Dd+M7RP0eyuW74BsXFitZj/SPtowtxT0fbcfP7/EBb0frmP3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560052; c=relaxed/simple;
	bh=oJ1ytt/FOpmYZCFLanZOIYvwzrmmHZQbwMng2Zl3qts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=USOPocihHv49hH+UOA0lkkQin7KV/+fK1REPIpmOf/FB0M0wQzOKiOC3EKGZBdYACxWj6G8Ax6rJkffY5gh54l5uNk2ta2skY/ZChzNYvLGEJwGKeXA7LzIdagFbDxjUjPuHVHFO/VhEWC4U2MZUqlVstfiyV6BX54zdlpl3HRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOYqBtJR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7BJEXHS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540tpej598093
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 08:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PGkUic8oCRlwGh4ari41i/
	ESitpvFp86ehcfav6zcZw=; b=MOYqBtJRjoN2L7AzbCG5m6BbdQaxbj02O3P6H/
	wCOTDx59tGEjMaaeaATOErclNZEprkycgEviEmdgJFpMPftgeeGly1PUE2EDZs4K
	ekLlkL1UqQsSJgb8FkfRp1d3cEXerY8Vj+4ACl9o41QdCBjlJja4zdoIaEIN5/z0
	b/b+dqPxkdzTYPf6wK0gp9sdEHi2H8STjwAhmIpcWVp9MntTpZx93eLKcmOu5YB7
	NnUagHfuxsAHV64rcbaGgPR/Pm+TKBW4Oj6Sq3haQeD3PVsPQLEM/ru1KewE8hBW
	bg3Y5BTzdHlXRfD/ktLlu0oArXyytyaVY2Q49dhCcgzj/7iA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m19tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 08:00:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf32259e0eso6667625ad.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 01:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560050; x=1781164850; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PGkUic8oCRlwGh4ari41i/ESitpvFp86ehcfav6zcZw=;
        b=N7BJEXHShOJHVvjv1Y/IFihVmaxPaM3a8gJPTiWHwZ2VAsDYYYvnf7iwaR2ZSligdn
         +pxp4Cfp+xv5k33fGluEEbpdq3zXbY2M6PrT9eelq6BYtoQpdLFmqq3jv0pL4tOdxTG9
         J1XRtgFy/aI2l9utc/wXkMZIFAqg8QljItvc6zog++y0v/YgXtVQMP2Jy1NqVLTDUbL3
         ZZk0NtDHqHKskCuWu/7smVt7xW+XVQEm90W4FX7UIY5e7vPNyspuLLF5ZsPCIbLl6fqf
         XEheqsFmJqcrdOdKqa++C3jS57uMxMd21OkJ7wXo3biR2yiJJtSI6msxSWo6xp9fCo33
         YSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560050; x=1781164850;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGkUic8oCRlwGh4ari41i/ESitpvFp86ehcfav6zcZw=;
        b=e8nWTRmvMVtfMuiB3/jcSiGNLAzF9FR/08U+4LExQgxbjo3suqSYPu6fusVze6p2Ba
         J2CKArBWgxhqbxzo33BRcL1yq7hAlfeMll5SiE0I9GABfqh0DdAtqq1q3vQ/07+M5TGJ
         Qdvt0cLsPiTDlhlTCsQ/RLaXh/9ADjt61ITHA6TBQQXR9cXnVEvyW2/9zVyuQ7ckD4bV
         vyfq+HzqCvSEIekoQk7IWMaeCgX7AWvL0CoD24lnjNn05+3V+4CsYNOsrc+7TVdLXZ+k
         H9H2qCd/QjgyNFsSa112XkPyHWBd2aPk15/pCozapXxXNNmORkgbK78EA03Cwq3CXnyf
         JqEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JGub4PF2D9dxrGq8Qcog5NklAAp2FTYXJawrxX9hRbeCPxFFMMejSlbhbDWySMoqRA3DC3bIMlXMnCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd2m2l3hYBUZiG0ocxImk17svztHTI4uBkcs2R7Uzhoyi0P71m
	sngxUuU6R5HU0V8k32hbYT4lagXrxHuhUX9G7APdkMK8v1wBiXLhRPtZFwvvIDZpfw/yzfiFMbq
	s/hhUoksHXSzjvVrArqK2l6kRPVIE59vV8psH3Mjua7qOCW6hXjL5SITrJuf5jbOC9A==
X-Gm-Gg: Acq92OFp5aFIZ3E22qLbfW6GePc7Pyd9vt/mgh4FRkzTxZDBll4StHHLFNT+Ezkn+xV
	uv2MecUKHmahmKpJP0DTu/Jq4WruzAiFZvGIz34C97F7EdwVOJA2w9lFGCK68CUJz1R5JUS4DUu
	NDPL8paRBSZbJY33YTqGXnKxpg3inu+AtDoMJz8CjD11/b6fVTNFhuyBsHoEyn5qS8YlHiJVk8q
	4GPxIJ4kPoAuUfBqnclEYxketN0+CE5vezCaOIy0Pg5Vu7q9lo6ueo6h5Wakfrt9KHKI+BE/GDq
	PjZgrcSZwOsVQLrLkvNADEGItO+ED7un+GTBbkp2jptCwwcqIGhOXEVAyiO9BCARc5o60tCgdRw
	u9ygxkaQzXIT03YJ5HGH1HO0Zj80KEw08KuA/vG20EB3U99Ho47e26rWnw/BDnLC/rxP9gyaA/Q
	m199pziVxKPiJgG2bYAHc94hfOHly8aZE=
X-Received: by 2002:a17:903:1209:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c163a242e3mr69052725ad.5.1780560047911;
        Thu, 04 Jun 2026 01:00:47 -0700 (PDT)
X-Received: by 2002:a17:903:1209:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c163a242e3mr69049385ad.5.1780560044851;
        Thu, 04 Jun 2026 01:00:44 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm49374565ad.3.2026.06.04.01.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:00:44 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: qcom: iris: add dynamic encoder properties
Date: Thu, 04 Jun 2026 16:00:37 +0800
Message-Id: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKUwIWoC/22OzWrDMBAGX8XoXAX9WLKVU9+jhLBerRtBbSWSY
 xKC372y3VPbi+ATzOy8WKYUKLNj9WKJ5pBDHMtQbxXDC4yfxIMvmymhrKhlw/1zhCHgmUaMnrh
 ujASrrSBfswJdE/XhsQk/TvtOdLsX77R/sg4ycYzDEKZjBUoZBEDU1tQWhDOtJU1I2qLQUsvaU
 uPBsdV1CXmK6bm1znKT7VlK/M6aJRdcSdWik0b2gt5jzofbHb7Wy4fyrLE/tPuXRtd31knfdhr
 +0qdlWb4BtXPjtT0BAAA=
X-Change-ID: 20260417-dynamic_encode-3751a6360ed4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560041; l=1510;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=oJ1ytt/FOpmYZCFLanZOIYvwzrmmHZQbwMng2Zl3qts=;
 b=X57JDngHEePDSG+Z5Efjop2FJdIGCuRL2z5mC3lMOD9ovGQR6UG8gRlmr44zh+rnaRUiOrhZd
 xMaFPYOR/5QDKrkT4WNYuFviNSrYTjnCjyUW6smiIQqEex/ibT7CwC7
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a2130b2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7J5Ww17mAtRdPOrEpzAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NiBTYWx0ZWRfX1Gz2vIatkQFI
 QEYGGxoFuQNzCMoNihvp/SYLl6/JIRHEbuXOTYm0ZJ113G/MiF4jbhsei1Ni0mL1Lili/UhV0Qx
 drWDnCAS9s6Q+Ix3n7L3KfvH6RpaZ9pdfzYqa6de6EhpLDqzmERRIFRkwetqythfXie+RZ2zg5h
 Hnx6alQi0LgOb6R+mNVW6FIHQ9JSE+kyqdbkF9NWsYERN7k+MjxZ2v8JPy0k4/3Z3pFbdkanQKJ
 oAvpbEY2LSTikGFGXYiLXh2cgaufuRg8LeXFS+DIO1alluh7RRmHSiVCFaqIPmsQXxVLdweyLA1
 NWgYbP/uuTlKEV7PsdSy1sM4ciFvPRCWHYLbAFo5v/QovDnOkKz6GNcdELR5ocO2ZVILuHBwVGK
 SJHn0jT1ZIF9KzkNF4sCnTZiX68NXTKEkExXMsqr2XnXSTqWOOijHJM71e49veex92cMNFZBxkm
 Hp3Gf365RJxZwKfHHzg==
X-Proofpoint-GUID: Z6R67XI510I2E9iz51i3KDQ99GP726AJ
X-Proofpoint-ORIG-GUID: Z6R67XI510I2E9iz51i3KDQ99GP726AJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63760-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB96763DD34

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
video encoding features.

All patches have been tested with iris_test_app on gen1:QCS6490,
gen2:QCS9100, X1E80100.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v2:
- Rebased due to a conflict with commit 'media: qcom: iris: split HFI session ops from core ops' (35da0884068226ca3a53371dbf685db6e0d74658).
- Link to v1: https://lore.kernel.org/r/20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com

---
Wangao Wang (2):
      media: qcom: iris: Add gop size support for gen1 encoder
      media: qcom: iris: Add request key frame support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 24 +++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 26 ++++++++++++----------
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 +-
 8 files changed, 61 insertions(+), 15 deletions(-)
---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260417-dynamic_encode-3751a6360ed4

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


