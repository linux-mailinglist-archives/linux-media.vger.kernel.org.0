Return-Path: <linux-media+bounces-59197-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DgbfFsw052mg5QEAu9opvQ
	(envelope-from <linux-media+bounces-59197-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 10:26:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB97C4381D8
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 10:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05F503070AC6
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 08:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6B939F19F;
	Tue, 21 Apr 2026 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIvpcJLr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66B39E184
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759755; cv=none; b=eGPEe4V5JAvNpOhwAaJVOu4JvAO7X8K4bagLy+zKppuy2jylXsdfwmL0Z95Sd4RQGhOpFl9DPZssBjt+7zKHaiWLk7COBGML9p/V0lU64mPUxe1huV2Wt98mNcUGqsI6MlTMcgGW2grw2kutNAsh/qsgwkT/XnDLiHcXlpaJRcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759755; c=relaxed/simple;
	bh=Uki0VyIZzWUgEtTUOFrRDxzi83GZ+WYr6QhD2SFJK58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g00Z4sKV1i2Iwxwm7dUFYXBU+cJtJlkQILih1xi8j6T9ze2zOLhvKVVztv5yqx1PMfdLhlDskHpm/1wzmdkMzdjUW2ABBTDJvpVwnCps6AQjfhVprfPRrvE+B8hKFvlolqWA912Znx1eqLOlQv0dW6KFCFjEBTuAUzeit7bU5UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIvpcJLr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2adff872068so18655425ad.1
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 01:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776759754; x=1777364554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/hj4BKK23dESNGIUvYCIJ9j5Rat32Tto+NKgW2HPuo=;
        b=RIvpcJLrXNdls9k9lxQ6b/Jbs8lmSWy9gXCgFSkyyii5dhcF1fOu7MEVqn05dVL0UC
         TilGGlbrA4GCtAhgHzPUeFM5xEM6INJOXhCk4PyQQquAT8WhnuFiMVXAwRsbBQlwonZO
         W/UCrPO/1dOHrWRz+0G7b5+roRDEtlxOR/FsQ56bsL1xuf4dPMXioTforywn9nOdMagZ
         pSurdEa7/hImEFCcOTU7CHKQXndQRzMfnqeX31pns9GUwAyE35/L96kWuefCeIGYRcdT
         c89wHuL+36VGU65f9R+UPGwGoICdbOcCApNvjYh4isW/bf9ACzpnT0KYzH3pf2J6gE2L
         1jGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776759754; x=1777364554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J/hj4BKK23dESNGIUvYCIJ9j5Rat32Tto+NKgW2HPuo=;
        b=LXm3VlJKqSjfE1SLfiL62gAdYEyj+OicLNs66CTbxqF5qhWMfL15JuLNeOd64RH+Qb
         ZSBfxWmBQlugIaOVJ11IHcHyE0oXOjMTvG0ZdYVOwvYUCf8B3NSPhTg67RdW+hai+X3M
         p1y9uRnKdGEzQW0URNs5kKhD7xYAWG7sYKOd6wb0g2vfSdVRIBmh/amSLxzN1I/sum6X
         HGoTPEbDhZ0EL2PTyGVXu6Ks5v/m9lBF0sYEMAWlwfRSgzcoJdCoaAz/bk6QEQtolzm1
         XofuWSDcWfUYCir+T8C71YUbxpxLMA5WGDzic2JASRRjlRw6C6gJxDzBy5FdsL2vzmGe
         lMXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FLqWlpu7NDv03SaKwK5MtHwbaVmPnZxAprCulUjkhp8Fb+/MFLxFF52UxPvU7MQ8yqnKYIejnKSnhUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBC43XRd6DiM1w1Lxu0DWjFtNZu6He630Zhe03HUlRVh2sgRU1
	IWdzveWqPKbfjM9rII8W9MqXujKhXaxCGLESWnaCvvsAvSWvIWUgrsMX
X-Gm-Gg: AeBDietywbyi1baihf3dHGLnSbOkNC9vsbCQjlyMYF1+DGoNNaOaqkSb3geVWAUUaXW
	qNRYquCKSRtlXzK+e/ZIHGWoE7c73pleFCzX7Gdof+KTAaGpusXCa+vCca0NGFL9WaWEPzDf6im
	5JsA6S2blmj+dnGZZEB2+mQstE6N01qS7wCGu/Pa8j9BFYOvpxxnYlX6caKKnjKEfmSwFQyJ7dW
	iKosMinJzCYWPqUNPSENgNwVFVZjcAGrWEEJCDb7ZpLXO4Zn2sXuB1H0a/8oPs8yB/PFZj9s8+u
	ekHKcbNCiATB94jykZ4dezn2W0FtEgvqYd+S1S4scEXDLzTlklz+zK182+Bxbvs917AO8nlJ8OK
	usWUd5Wgx/kk8/O1AVSCpAL5z8fzA0A7+LyQwiD5vI/ZtBTIWXFGzzn69PXAuzgneYdYy+oQwqD
	VvBm35kp9QQxBskYuVTgime3hdcfvrABdX+vVz+hhAgEaXnfQvt5rR
X-Received: by 2002:a17:903:200d:b0:2b2:5597:bad4 with SMTP id d9443c01a7336-2b5f9ffa730mr130394005ad.30.1776759753630;
        Tue, 21 Apr 2026 01:22:33 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab2114bsm121369215ad.60.2026.04.21.01.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:22:33 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: andy.shevchenko@gmail.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	debjeetbanerjee48@gmail.com
Subject: [PATCH v3] media: atomisp: csi2: Fix DPCM decompression for source pad format
Date: Tue, 21 Apr 2026 13:52:11 +0530
Message-ID: <20260421082211.74041-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHp75VfxwFW3nWLjKS6TXPHYJsqPJWB6G_M08t6eTkcodOj7zA@mail.gmail.com>
References: <CAHp75VfxwFW3nWLjKS6TXPHYJsqPJWB6G_M08t6eTkcodOj7zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59197-lists,linux-media=lfdr.de];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB97C4381D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The CSI2 source pad format was set by blindly copying the sink pad
format, regardless of whether the sink pad is receiving a DPCM-compressed
mbus code. This was marked with a FIXME comment.

When a sensor transmits DPCM-compressed data over MIPI CSI-2 (e.g.
MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8), the Atom ISP hardware decompresses it
before passing it to the ISP pipeline. Therefore the source pad must
expose the uncompressed format (e.g. MEDIA_BUS_FMT_SGRBG10_1X10), not
the compressed one.

atomisp_subdev_uncompressed_code() already implements this mapping via
the compressed_codes[] table in atomisp_subdev.c, which pairs each
DPCM mbus code with its uncompressed counterpart. For codes that are not
DPCM-compressed, the function returns the code unchanged, so this change
is a no-op for all non-DPCM formats.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v3:
- Drop "staging:" prefix in subject (per Andy Shevchenko)

v2:
- Rebased onto latest media tree (fix CI apply failure)
- Fix missing linux-staging recipient (typo in v1)
- Fix indentation
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..e723304bec80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,10 +107,17 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 					     &tmp_ffmt);
 	}
 
-	/* FIXME: DPCM decompression */
-	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
-						  CSI2_PAD_SINK);
-
+	/*
+	 * The source pad must expose the uncompressed format even when the sink
+	 * pad receives DPCM-compressed data. The hardware decompresses DPCM
+	 * (e.g. SGRBG10_DPCM8_1X8 -> SGRBG10_1X10) between sink and source,
+	 * so propagate the sink format but map the mbus code to its uncompressed
+	 * equivalent. atomisp_subdev_uncompressed_code() returns the code
+	 * unchanged for formats that are not DPCM-compressed.
+	 */
+	*actual_ffmt = *__csi2_get_format(csi2, sd_state, which, CSI2_PAD_SINK);
+	actual_ffmt->code = atomisp_subdev_uncompressed_code(actual_ffmt->code);
+	*ffmt = *actual_ffmt;
 	return 0;
 }
 
-- 
2.53.0


