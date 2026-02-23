Return-Path: <linux-media+bounces-53205-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCYnIpWmnGklJwQAu9opvQ
	(envelope-from <linux-media+bounces-53205-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:12:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B831A17C18E
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85AB930355A8
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E4833A036;
	Mon, 23 Feb 2026 19:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kG4wmDO4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwoVsAt7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43436AB49
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873788; cv=none; b=Ztr3gx63T40/6HguuBW9A/OVQmjForR0TJbvci+q8yp33f0vX2PtJudZJKnWAFMRPL+BYKtBNz5502MOMwzefs6bvLBsGMstqvbliM6Y4QtcS4SaVslW4T7L7XRbXyq0CqplUxATO7lAiqLr1QEcX1U5DpTiGzYwDq+NH/PpmeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873788; c=relaxed/simple;
	bh=iLQ8c+Sm/Die53QHNPeJqNsBysDvS6aLmEkWX2M3O8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfcbv9/fdjZZIXVSwvCy9loK38jswrS47O7bF07aZT7YnenUZEkAysPmqKTlockaG537B4SxsFewiYxvfKXPf1Fq3cdpZN92QJ6j52t22L+YF/BYYrUTp5T+p5d9N11EAKV+JpMR7Bq3ryGat1mv6s2TqCePAlUccN8V9Dd2Ees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kG4wmDO4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwoVsAt7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIHmc3322185
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJPcPVRr65YeMFEr02KOUusve8jQFGasCqgJNjYMLUY=; b=kG4wmDO43TdEaah1
	kwFIpoYkIqCc8p+LATPySwod2UV5df+9/oqv80f2xPZlLyZL/yXusCxU389jJsBc
	ZbbT7SrcP8OT/3jRIQzRMpU8PoKAO8JOXMGHHFHGEq6vNqeqgRruSXxWh1yW+sks
	PvgmRZ1/3z/rBosdenfDeZjliUBQjyOZk3XwHpAlEuLlMR+eKEDGIz9+qHlaDFlU
	7jpVvgjmyC+SqFBUQZaxOdwGID8oqptoesxk6hVJ9Q1wt5g6/weVvVNyvH8KdOlq
	YJA4l58cj//HbrZye7jl/1IWU/GWwxZPgTrC7zaxek4+W/x/YY2n/0DOf9MqH06y
	K0Po/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y1m4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:09:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a8c273332cso438428225ad.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873784; x=1772478584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJPcPVRr65YeMFEr02KOUusve8jQFGasCqgJNjYMLUY=;
        b=PwoVsAt7c+e5eQLGcTonM6KRgaDrNKQQw4KtfGg+Lsv078fWibG94ajj9jLSCy8AUC
         1JmaImJtVgqntllwYr5hh6YASNNYzvSExLmcxIBzH7NXE4aZGBDdo5haqJt4jshOBGCa
         GZcxXDlbe+gbQO9XYeK9Kc2jW/Avxm7m5mFDV8Rn1neLMmSpYPoebRDqzAJRJeAa5iDA
         4iAGD7mBxcWbPRZexFtHeGXdFmsi/C38KzQHz7nnuN4Eyp24UP1q6cUIyDIsmoxjva7/
         2j757RU7YMWZAjy1by92vEKFk7xfGnz3W+NdWnBLALCkBSs1DvlmQVoF9RyOy33t5xur
         kzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873784; x=1772478584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MJPcPVRr65YeMFEr02KOUusve8jQFGasCqgJNjYMLUY=;
        b=o6YxCnSIKCB+zFCprH67e0j/ftKrosfzTMLi7lF6covismiNKaBTuv4KmOyGYNpvvL
         +sN1dO1yQtvsXOgdUF9Z0DYVmFSfkN+4ue8o9q7hJTBIAPh+z6LspnC2uuCPPrpa3jS3
         N/GVXUjVpVjHSdQe985Cp2T+GuBjP4mnHFUMTcsX2+obKAbO470ZaWEbmf7C6oK9GxXh
         OcT40mJdqoWkr9GdLr7dKRYH1zxptLhWh370YVkipbqzWsNezGkFCI9Z/BtXiFkkLD0o
         BYd5C8DoK/X+uI2wloRXJ42JrRADfh4bGpYuGWLmWWHL1KoUh8mTURLPfiJJJ0tK/kOs
         NDLw==
X-Forwarded-Encrypted: i=1; AJvYcCVBrgAbpUHFjgK89FiGZzxQhY/uq1kWZQzL9MKKw7HlnmEk8jc9SY0Hkr1XR+cWQMAP1GBMFPX7Js52fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWewwgYCBejlOk/ty9ZqCSU1YjFNE57P6ffUbRn2FTjlMtr+38
	xv8u6Z6NoodXcbnE4UiVUBtNncjpTw+EnUwKzDEQTvlNFGZ8qUc9GmCyZQVbsFFesFwwcjrnxKr
	AzP0gD8sZTeo9WJypLGItVoojv8x6Mt34oVD0Ga6tWD/iaaLKsClfYJoxveotT0CrKwQqBMjO7A
	==
X-Gm-Gg: ATEYQzxrfjAp423AnfeMWDpe3bUWsgSeACMifMo8xvpQ3lU60NxYhybZqP1ZeAZA9tU
	l1XxPvSRHMo3rXvfvpfDfc7+xODZAz1xQIv6UomyXbGSpd2gslePjB3JE/PfiR/jnG6lI4BkhVJ
	TLQARJdWKrvavI7bfqjYdUMoUlEWMAoEEple38VML8JXouswGhNe7nO3BormYhG0O6CW828qYJF
	Z5XGQFKtPFZQpalcODFKXi52/jhyDV8+Qe22Hj1S2qlQA9cNQAE9CJkP6uGeC72pdcohCvLTTVY
	Fj8QZQmOs03MLAXD4HcJLIEKCsS0+sZFG2X04D0jm/pgHk4ZwS7B0MU+sGCMexpHZrTai0tFaP+
	ABG9cFZ6Yc/cJGDywp0fnMGxUuxBmNpghW6eWdQKmAabGh0pQfSsrBA==
X-Received: by 2002:a17:903:2445:b0:2aa:ecec:a447 with SMTP id d9443c01a7336-2ad74504e77mr105282815ad.36.1771873784182;
        Mon, 23 Feb 2026 11:09:44 -0800 (PST)
X-Received: by 2002:a17:903:2445:b0:2aa:ecec:a447 with SMTP id d9443c01a7336-2ad74504e77mr105282525ad.36.1771873783703;
        Mon, 23 Feb 2026 11:09:43 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:09:42 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:38:57 +0530
Subject: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm DSP
 accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=10008;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=iLQ8c+Sm/Die53QHNPeJqNsBysDvS6aLmEkWX2M3O8g=;
 b=ZBLecOZ8SdMNZ1UUQFp4TQ5Efvw9R8lIP8FX7UXoOp+NWgdD2+C0PgFZix6DyqkZ4sVZhzdR6
 j5DF2sxp1K4BUEuwKGYj3zRftFADwXcz/jCBY6b3tdpgazbABOsCbPo
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX1hifs6et6B/6
 5RjqwQc2S+f3Di04mPwGmAlWxHpmA7ezqtniZFa8GKP/eCDcgLnONYvXLZPNZkyw6yKH6YqH/16
 NLC3WgqrfDUej9lWpyBcmk41qrhl+b6nMCxKlBm82UFemDbW/IgFvpgalRwbolUv5oByhevdCSx
 L37IVuhVZybZuOmYI9TVUf36ZWJmnc3WJHGfFcMUyaV/FPtns5C15g/z1w8aM5HMgaPNTK4k0yC
 osUsCaTKp8xkZzh1w8V8Zi4l/k1CTQJG7XR9Buh+IdTAZO18Gb5gMBjw0ikNgw9bMm73XsfBsQF
 KUMkqmkltEmseFpYGAyeUYNSHYttSh8RTOyC8c73lsEECkeACAGZrRUuVAmVaa4btllV44ZE8fH
 jkZ5Clzes9LxNEnhzb/hTQSVglcCFSUJvjbmkZVf4zTSK82WyM8Fg7MJhBkfqaHKsApKjUb89/M
 vmDFAy8RqAgf2opAv1g==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699ca5f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FHHk3UexkictpjMLSY0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hNbRm37d3qiZUeoU3b3IvPNsXrA1IJok
X-Proofpoint-ORIG-GUID: hNbRm37d3qiZUeoU3b3IvPNsXrA1IJok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53205-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B831A17C18E
X-Rspamd-Action: no action

Extend the Qualcomm DSP accelerator (QDA) driver with an RPMsg-based
transport used to discover and manage DSP instances.

This patch introduces:

- A core qda_dev structure with basic device state (rpmsg device,
  device pointer, lock, removal flag, DSP name).
- Logging helpers that integrate with dev_* when a device is available
  and fall back to pr_* otherwise.
- An RPMsg client driver that binds to the Qualcomm FastRPC service and
  allocates a qda_dev instance using devm_kzalloc().
- Basic device initialization and teardown paths wired into the module
  init/exit.

The RPMsg driver currently sets the DSP name from a "label" property in
the device tree, which will be used by subsequent patches to distinguish
between different DSP domains (e.g. ADSP, CDSP).

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Kconfig     |   1 +
 drivers/accel/qda/Makefile    |   4 +-
 drivers/accel/qda/qda_drv.c   |  41 ++++++++++++++-
 drivers/accel/qda/qda_drv.h   |  91 ++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_rpmsg.c | 119 ++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_rpmsg.h |  17 ++++++
 6 files changed, 270 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
index 3c78ff6189e0..484d21ff1b55 100644
--- a/drivers/accel/qda/Kconfig
+++ b/drivers/accel/qda/Kconfig
@@ -7,6 +7,7 @@ config DRM_ACCEL_QDA
 	tristate "Qualcomm DSP accelerator"
 	depends on DRM_ACCEL
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on RPMSG
 	help
 	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
 	  This driver provides a standardized interface for offloading computational
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 573711af1d28..e7f23182589b 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -5,4 +5,6 @@
 
 obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 
-qda-y := qda_drv.o
+qda-y := \
+	qda_drv.o \
+	qda_rpmsg.o \
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 18b0d3fb1598..389c66a9ad4f 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -2,16 +2,53 @@
 // Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/atomic.h>
+#include "qda_drv.h"
+#include "qda_rpmsg.h"
+
+static void cleanup_device_resources(struct qda_dev *qdev)
+{
+	mutex_destroy(&qdev->lock);
+}
+
+void qda_deinit_device(struct qda_dev *qdev)
+{
+	cleanup_device_resources(qdev);
+}
+
+/* Initialize device resources */
+static void init_device_resources(struct qda_dev *qdev)
+{
+	qda_dbg(qdev, "Initializing device resources\n");
+
+	mutex_init(&qdev->lock);
+	atomic_set(&qdev->removing, 0);
+}
+
+int qda_init_device(struct qda_dev *qdev)
+{
+	init_device_resources(qdev);
+
+	qda_dbg(qdev, "QDA device initialized successfully\n");
+	return 0;
+}
 
 static int __init qda_core_init(void)
 {
-	pr_info("QDA: driver initialization complete\n");
+	int ret;
+
+	ret = qda_rpmsg_register();
+	if (ret)
+		return ret;
+
+	qda_info(NULL, "QDA driver initialization complete\n");
 	return 0;
 }
 
 static void __exit qda_core_exit(void)
 {
-	pr_info("QDA: driver exit complete\n");
+	qda_rpmsg_unregister();
+	qda_info(NULL, "QDA driver exit complete\n");
 }
 
 module_init(qda_core_init);
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
new file mode 100644
index 000000000000..bec2d31ca1bb
--- /dev/null
+++ b/drivers/accel/qda/qda_drv.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_DRV_H__
+#define __QDA_DRV_H__
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/rpmsg.h>
+#include <linux/xarray.h>
+
+/* Driver identification */
+#define DRIVER_NAME "qda"
+
+/* struct qda_dev - Main device structure for QDA driver */
+struct qda_dev {
+	/* RPMsg device for communication with remote processor */
+	struct rpmsg_device *rpdev;
+	/* Underlying device structure */
+	struct device *dev;
+	/* Mutex protecting device state */
+	struct mutex lock;
+	/* Flag indicating device removal in progress */
+	atomic_t removing;
+	/* Name of the DSP (e.g., "cdsp", "adsp") */
+	char dsp_name[16];
+};
+
+/**
+ * qda_get_log_device - Get appropriate device for logging
+ * @qdev: QDA device structure
+ *
+ * Returns the most appropriate device structure for logging messages.
+ * Prefers qdev->dev, or returns NULL if the device is being removed
+ * or invalid.
+ */
+static inline struct device *qda_get_log_device(struct qda_dev *qdev)
+{
+	if (!qdev || atomic_read(&qdev->removing))
+		return NULL;
+
+	if (qdev->dev)
+		return qdev->dev;
+
+	return NULL;
+}
+
+/*
+ * Logging macros
+ *
+ * These macros provide consistent logging across the driver with automatic
+ * function name inclusion. They use dev_* functions when a device is available,
+ * falling back to pr_* functions otherwise.
+ */
+
+/* Error logging - always logs and tracks errors */
+#define qda_err(qdev, fmt, ...) do { \
+	struct device *__dev = qda_get_log_device(qdev); \
+	if (__dev) \
+		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
+	else \
+		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
+} while (0)
+
+/* Info logging - always logs, can be filtered via loglevel */
+#define qda_info(qdev, fmt, ...) do { \
+	struct device *__dev = qda_get_log_device(qdev); \
+	if (__dev) \
+		dev_info(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
+	else \
+		pr_info(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
+} while (0)
+
+/* Debug logging - controlled via dynamic debug (CONFIG_DYNAMIC_DEBUG) */
+#define qda_dbg(qdev, fmt, ...) do { \
+	struct device *__dev = qda_get_log_device(qdev); \
+	if (__dev) \
+		dev_dbg(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
+	else \
+		pr_debug(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
+} while (0)
+
+/*
+ * Core device management functions
+ */
+int qda_init_device(struct qda_dev *qdev);
+void qda_deinit_device(struct qda_dev *qdev);
+
+#endif /* __QDA_DRV_H__ */
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
new file mode 100644
index 000000000000..a8b24a99ca13
--- /dev/null
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/module.h>
+#include <linux/rpmsg.h>
+#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include "qda_drv.h"
+#include "qda_rpmsg.h"
+
+static int qda_rpmsg_init(struct qda_dev *qdev)
+{
+	dev_set_drvdata(&qdev->rpdev->dev, qdev);
+	return 0;
+}
+
+/* Utility function to allocate and initialize qda_dev */
+static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
+{
+	struct qda_dev *qdev;
+
+	qdev = devm_kzalloc(&rpdev->dev, sizeof(*qdev), GFP_KERNEL);
+	if (!qdev)
+		return ERR_PTR(-ENOMEM);
+
+	qdev->dev = &rpdev->dev;
+	qdev->rpdev = rpdev;
+
+	qda_dbg(qdev, "Allocated and initialized qda_dev\n");
+	return qdev;
+}
+
+static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
+{
+	/* Dummy function for rpmsg driver */
+	return 0;
+}
+
+static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
+{
+	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
+
+	qda_info(qdev, "Removing RPMsg device\n");
+
+	atomic_set(&qdev->removing, 1);
+
+	mutex_lock(&qdev->lock);
+	qdev->rpdev = NULL;
+	mutex_unlock(&qdev->lock);
+
+	qda_deinit_device(qdev);
+
+	qda_info(qdev, "RPMsg device removed\n");
+}
+
+static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
+{
+	struct qda_dev *qdev;
+	int ret;
+	const char *label;
+
+	qda_dbg(NULL, "QDA RPMsg probe starting\n");
+
+	qdev = alloc_and_init_qdev(rpdev);
+	if (IS_ERR(qdev))
+		return PTR_ERR(qdev);
+
+	ret = of_property_read_string(rpdev->dev.of_node, "label", &label);
+	if (!ret) {
+		strscpy(qdev->dsp_name, label, sizeof(qdev->dsp_name));
+	} else {
+		qda_info(qdev, "QDA DSP label not found in DT\n");
+		return ret;
+	}
+
+	ret = qda_rpmsg_init(qdev);
+	if (ret) {
+		qda_err(qdev, "RPMsg init failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = qda_init_device(qdev);
+	if (ret)
+		return ret;
+
+	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
+	return 0;
+}
+
+static const struct of_device_id qda_rpmsg_id_table[] = {
+	{ .compatible = "qcom,fastrpc" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, qda_rpmsg_id_table);
+
+static struct rpmsg_driver qda_rpmsg_driver = {
+	.probe = qda_rpmsg_probe,
+	.remove = qda_rpmsg_remove,
+	.callback = qda_rpmsg_cb,
+	.drv = {
+		.name = "qcom,fastrpc",
+		.of_match_table = qda_rpmsg_id_table,
+	},
+};
+
+int qda_rpmsg_register(void)
+{
+	int ret = register_rpmsg_driver(&qda_rpmsg_driver);
+
+	if (ret)
+		qda_err(NULL, "Failed to register RPMsg driver: %d\n", ret);
+
+	return ret;
+}
+
+void qda_rpmsg_unregister(void)
+{
+	unregister_rpmsg_driver(&qda_rpmsg_driver);
+}
diff --git a/drivers/accel/qda/qda_rpmsg.h b/drivers/accel/qda/qda_rpmsg.h
new file mode 100644
index 000000000000..348827bff255
--- /dev/null
+++ b/drivers/accel/qda/qda_rpmsg.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_RPMSG_H__
+#define __QDA_RPMSG_H__
+
+#include "qda_drv.h"
+
+/*
+ * Transport layer registration
+ */
+int qda_rpmsg_register(void);
+void qda_rpmsg_unregister(void);
+
+#endif /* __QDA_RPMSG_H__ */

-- 
2.34.1


