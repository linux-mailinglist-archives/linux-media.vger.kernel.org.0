Return-Path: <linux-media+bounces-51922-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dsg1FiFif2mUpQIAu9opvQ
	(envelope-from <linux-media+bounces-51922-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 15:24:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FF9C621A
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 15:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2706C300903D
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 14:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F275350A23;
	Sun,  1 Feb 2026 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EePPljYF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547A33D4F8
	for <linux-media@vger.kernel.org>; Sun,  1 Feb 2026 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769955868; cv=none; b=nCC0Z1i/J6NYJFmW+Vb1vIyihuKuAwf0Cm2qvt5hSPU1mTVwS4Kst5lMbHPE3eb0NbzyrcRGGPSKCH/rWE9qdpEActoIamwBYWly4nPPt+Kq8N0NsNg0aWPmb8cHKhCekYy3vXtQbck/MTqncb4aJ96iSuBY/kVY3bqSHwIhldU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769955868; c=relaxed/simple;
	bh=13AkoiTdNyAz1YeVgxEBNel/QyLHuky5VNXheaXheHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KN7ZPOL8/epgoeecsj4Jye2N+QlsXiZE+IdfvmiqPJnPAzXU6RqVStr8PlBdhA7TNZILuXe9n7qtiaHdTg9Vq476+mtaKLRPyZhnU7PJWvz4UTdT5y2A1c9HBGRP9JZ5LW3hj5RkpW6oUe+fKdzXzSBC1j51+kfEj6eNVi6fJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EePPljYF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-81f5381d168so3473392b3a.2
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 06:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769955867; x=1770560667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+9zUqm+raFHNUIjJ3frlwGtuvelVytXrMAJu8jxiT8=;
        b=EePPljYFIQl+t71CEy+0nOWxAULenhVBDfYJKuYwEOuBBod+LExlN3LpcMt55wD7JA
         y7lLTkjsCUT16q92n8Jwb5JYCRVXqEj62MD5vDDRwl1RJjNPncPH5Iauyv0MljkG8u3W
         JcvSC+yMSMVM+HZoiF9pJMdTl+83GEG8lozaD511qtoWJ1WGoEsnuzHDyDiCGXy6/Hgt
         fWiPBUTdAVKPnqzMgb/ev8DwCMPQ1msmCm5ffyRHJt3c5uCjqsqpAmbTRiUotJMeWPut
         qa0XU4RHkCIxTgQLyxgbr5wLsPV3pihu4KjGXcCzx3C1auQHOTaJpseAxMa9OG+rFwrj
         xY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769955867; x=1770560667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+9zUqm+raFHNUIjJ3frlwGtuvelVytXrMAJu8jxiT8=;
        b=AaUpC2gF7V73scYoTVkv5vB8nzI5fKm6LlrX/Q4UIi4u9+qpEVoSf7LZbY85apkgnx
         LsEApJnDjLLzaZDXy0vaBlwqQj+LTnKjXnSHum3GAhzPh1CK1mowJCiFGhmZFrEBFu5N
         +RuGLQU5BHQLzodQmU1rnTFc6xN4ZBJ9c06buk4TivtA4Q8x6yIe/+QN3inzRlLG/Jkn
         vPZRdBSnPhlErvJEkfRlqJJSlwCBHfJhTMIfNAtUzYLfJgKNytWjjz6mTv2HpG444mh/
         TNeF9AXI1e2CgCyDTvZ/5TAbgM7UTXS6W05ub4vddtplibx5O31D89D1nvRE5hO8eSlW
         MW+g==
X-Forwarded-Encrypted: i=1; AJvYcCVsaMeEWQp3ZvYdtSqRF12pRzY9tA+CA3VId6mm0FVgGeEzHGFKSLoBKOmvbHXmCxZkKiN7ntl48Bareg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGyNUGBpHbfW3/mU1RQgwphAKFdzXuiylgFyBmvMEnauCycLxe
	8iKV4kueRCPi4cDHbPySbnkSHFtulWD825mM4q337bGIL30Tn09mZ2z8
X-Gm-Gg: AZuq6aJB9zLPmmTgmy7m3xbRQKFSkdNySHEVmLLjxh46dTLQPaJom6yYdDwjBi6WCyB
	GfL7WUsrnyTNSaPayW4kmzMmcscLjNIx2mTJJPZHjo4lHPQ/X3Qm3xBGVc4+Ylx3meNftFTgjUc
	Sb1vBz6Lo8Y3UCCN6Xv+qMEBBn9hU+2ilfzumMo41mv/iOr63SXIcuKGRBIPa875q9qwlpCladJ
	LOaf0aNj2fOSghiEV60s1lUPdEbVMgmSsGFr+w+Na67Zl6s8YJ50Vf7RHpxYoR4nL8+UfzpTeFD
	VB8uNJGSnvdlMESfLKaVmnhBfAhLrkCeRRgDtG3nIkR11Yp1gJK/mZsZQnEXzcpbIVZgLMrxKt+
	j9WdaXqCzc8jHW2jhV9G6N7//+2yL3wCxKK8qL0uZkrglPizLBmnxSe4NpprGbXcVnP9jMMHIGu
	LyI0MNJ6G6mRBoiA==
X-Received: by 2002:a05:6a00:94f6:b0:820:2f9b:fe37 with SMTP id d2e1a72fcca58-823ab748f60mr8019230b3a.35.1769955866748;
        Sun, 01 Feb 2026 06:24:26 -0800 (PST)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b6b277sm16452661b3a.29.2026.02.01.06.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 06:24:26 -0800 (PST)
From: Adarsh Das <adarshdas950@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove functions doing ftrace like logging
Date: Sun,  1 Feb 2026 19:54:15 +0530
Message-ID: <20260201142415.83595-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-51922-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adarshdas950@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5FF9C621A
X-Rspamd-Action: no action

Remove ia_css_debug_dtrace() calls which only log function entry.
ftrace should be used instead.

Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 .../media/atomisp/pci/ia_css_isp_configs.c    | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
index 38c9c62366d6..1dce9fa926ab 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
@@ -18,8 +18,6 @@ int ia_css_configure_iterator(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -41,8 +39,6 @@ int ia_css_configure_copy_output(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -66,8 +62,6 @@ int ia_css_configure_crop(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -89,8 +83,6 @@ int ia_css_configure_fpn(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -111,8 +103,6 @@ int ia_css_configure_dvs(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -133,8 +123,6 @@ int ia_css_configure_qplane(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -156,8 +144,6 @@ int ia_css_configure_output0(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -179,8 +165,6 @@ int ia_css_configure_output1(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -202,8 +186,6 @@ int ia_css_configure_output(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -225,8 +207,6 @@ int ia_css_configure_raw(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -248,8 +228,6 @@ int ia_css_configure_tnr(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -271,8 +249,6 @@ int ia_css_configure_ref(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
@@ -294,8 +270,6 @@ int ia_css_configure_vf(const struct ia_css_binary *binary,
 	unsigned int offset = 0;
 	unsigned int size   = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
-
 	if (!binary->info->mem_offsets.offsets.config)
 		return 0;
 
-- 
2.52.0


