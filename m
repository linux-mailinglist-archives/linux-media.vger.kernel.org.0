Return-Path: <linux-media+bounces-59435-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA+ZJYln6mnuywIAu9opvQ
	(envelope-from <linux-media+bounces-59435-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 20:40:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F1945625B
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 20:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 487FE3043F8E
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 18:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52B93AEF36;
	Thu, 23 Apr 2026 18:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqDf9HRW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F983AE6EB
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 18:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776969511; cv=none; b=qEtZJaYuTpFvY6E1YsIbZ9noBLFRwp9RUcTW48893OIX4Kh8dftPDLypJNw60YV9QyMlMrQDgOnPh/JypVeARqHz+6CmA0FNsdJpZ/NOfkwE+4LlQX9aLRSukp8Y60aGH6rR1QBPBYZANd4d87801JtYtuEj+5/ohCoNIJeXhyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776969511; c=relaxed/simple;
	bh=+SOrMVVHB5qOMDbPRIZTXf906cveuoXyVwOSqdhGY7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HNqFEE1sh6zTL3nATPsVuMq+cH2bIqNqxVlX72yHZwwkf1K0nQyppkUc1BRq+CEVYie6CTgTGSpGy2h7kEsR2CBUi8AJNxwcASCdezQXm2mP0S0DZA34SfodaD+q7DcJlkFQNC6TFWEtzmtmsQPE9p8giZyAWajAFSBsissc6d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqDf9HRW; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-60fbeeeaa7aso4022044137.0
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776969509; x=1777574309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L22PrPyxffGp1s35EdIqfhlvwug5UudCDFqaIR/CCpM=;
        b=IqDf9HRWMbgPQomjPurq9RmKiyYECNUPC3d6/qo93krOPkaYRRQxrbhTPmliJ+6vFx
         ItWN6sbrmzEJozWHghjPBVoFaHdhugE83hY25cinwZDN9Z7rriw3U5+8+QPFxwTSLFNP
         t14B5mPoUv1F6jIOCQWCHtx0zRZPdJdCqbAZGjgvcs/Dk0GETlmfLONNiQoPBlvxr3mI
         LsStY7FoGC3b9zL0wJaVFIBXJViZ63BDYmv0k5DamwKHvGDbKo5Jx7I6IvL3w/MPrrjz
         jobQcqQH8C2s22AJMhVAFNo2Mddms5DGDRBFM0kUKoKWfurJ/12HeXoXCIwbDWFVGiXq
         m7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776969509; x=1777574309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L22PrPyxffGp1s35EdIqfhlvwug5UudCDFqaIR/CCpM=;
        b=DmQ66CJRIQwnBqKNnoB9RNSbbkR2jHL06zfv6Aglyv/Ql4wlvXAxApBb2E/bqViHSN
         AFER0VThU72Ll4QQ5kez0C5+h4wtimnSaczKOMdXYxiU7yGqIDJU0UYOo6Nf2nh/eJNx
         YFyqm9YXzZhiOB/FgtG22Iqo6ZlWuh0SisjmpbApIEPeY1hzNyYKsFDtlo6CRTCG/UrY
         IdEr97hsKlWJcj0ZicMcYZTDPKACnsMxr+lLcIURUIRLz7WxSgJFslYJfSuw/VtzFjKU
         RRoyTdU81I0jNM8LUbiJ8WPnS1qYvCukB+5s/KbPHWrWkwOVz9o3CGE2ybaw43KFdXi6
         0ggQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rUhWMZtLZVO0fL/ZbxH93wTfcMvRfraq1QJzdjTtu1oQP5BHmMQdvE2CGtOCesvrWBNbsNg/2E9NolQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSDaDNbjFto3c1Z9RioA7CHPfw8imspfEMoX1BDfyiDg2MGsyO
	A1mIxauOm8KEXhOlkl6CGS7Tr6DfnlRtlbGeMgIwpUWGZbJDEVKVP7ww
X-Gm-Gg: AeBDiesK8w2Hb9+1VILzxFbkJrhCaG1CGUrQZ7yib6S/4MfO/NKo6jGY3JSWX6u3Xla
	ORH3NQjVH5/XTh1aEFJRAk8Wvu0yOJseftnXjhU1iirMhO9Ddi2X8EvPF/my0MfuLYsguswYIP1
	7RmcZg9vplIeO//0o5FjUlGFrmrI9Rfv1C7IyYplKM5RhZYiO0YHEbeaQJJt0zLYy4Hq5tIQezE
	YHPrGTtpMUZKpqwHd5JmKFr907Q6FzjfM9n7KOcBnTH2uc9q8/NxCni5cxq68LAS7w/eeWyD+jc
	ZXzJHKTHCpRFoQ7duyOjbbx1VW+u8MvEHgb/mdZMeM6Gy8NGufyApIGw0ZNn9sKx/YqN/63JqyJ
	RBBeQPsqbWwy8ds5R9F+EXbf+1JUcIN42DnqNjivRX5V2P4VY6fOmQOp2eEpSVRhCn9Ofjy7rzL
	3nmz0fo/q285fXhhkdmEFgjh0knXQ8HiCuabapbHWMU1p+WCBd344wUzqAUrI4aSwgu0K/
X-Received: by 2002:a05:6102:b08:b0:610:1c78:9531 with SMTP id ada2fe7eead31-616f71fa1a9mr14232960137.24.1776969508715;
        Thu, 23 Apr 2026 11:38:28 -0700 (PDT)
Received: from localhost.localdomain (recod-gw.ic.unicamp.br. [143.106.7.151])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61745c9e51bsm10788224137.4.2026.04.23.11.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:38:28 -0700 (PDT)
From: Everton Colombo <e.rcolombo2@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Everton Colombo <e.rcolombo2@gmail.com>
Subject: [PATCH] media: atomisp: Remove unnecessary function return
Date: Thu, 23 Apr 2026 15:38:14 -0300
Message-Id: <20260423183814.84729-1-e.rcolombo2@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59435-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.sr.ht,igalia.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ercolombo2@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E8F1945625B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adressed the following checkpath error:
WARNING: void function return statements are not generally useful.

Signed-off-by: Everton Colombo <e.rcolombo2@gmail.com>

---
Hey, this is my first patch! Any feedback would be appreciated!
---
 .../atomisp/pci/hive_isp_css_common/host/sp_private.h     | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
index c69778411f2f..b03ae6658df3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
@@ -21,7 +21,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_store(
 	assert(ID < N_SP_ID);
 	assert(SP_CTRL_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(SP_CTRL_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_SP_C hrt_data sp_ctrl_load(
@@ -51,7 +50,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_setbit(
 	hrt_data	data = sp_ctrl_load(ID, reg);
 
 	sp_ctrl_store(ID, reg, (data | (1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_ctrl_clearbit(
@@ -62,7 +60,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_clearbit(
 	hrt_data	data = sp_ctrl_load(ID, reg);
 
 	sp_ctrl_store(ID, reg, (data & ~(1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store(
@@ -74,7 +71,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store(
 	assert(ID < N_SP_ID);
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store(SP_DMEM_BASE[ID] + addr, data, size);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_load(
@@ -86,7 +82,6 @@ STORAGE_CLASS_SP_C void sp_dmem_load(
 	assert(ID < N_SP_ID);
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	ia_css_device_load(SP_DMEM_BASE[ID] + addr, data, size);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint8(
@@ -98,7 +93,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint8(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint8(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint16(
@@ -110,7 +104,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint16(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint16(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint32(
@@ -122,7 +115,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint32(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint32(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C uint8_t sp_dmem_load_uint8(
-- 
2.34.1


