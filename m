Return-Path: <linux-media+bounces-61600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFkbOyKnBWrGZQIAu9opvQ
	(envelope-from <linux-media+bounces-61600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:42:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BEB54084B
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F30630CB750
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2076388390;
	Thu, 14 May 2026 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wl4GiMe7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D59C38657D
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755124; cv=none; b=NAs0HpBzo47Z8+fAATlxDGLL20ihtwE5wAQPsUdUq7uw99lXe75xVhgyYVKWG1q25OYDtJzPuDrCRAJYMHm5HWZf6R5uLgO5wB8EVM4QMjTAMUcFvtPGD7ov+gQx+fWJsig/tDYrFcl7otKMR2HuIAsY4tuk7I4Fk0A8tCYk3L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755124; c=relaxed/simple;
	bh=7cf1bTUHeTG8hP3P7+pktX/y94hBOhorO+KD/LMZc2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJe6teCWDiYiIhk+TDP0t7KSUA2qn3iD6KEgI+XdRlMmO8nHUUuTB+96QevMvbpOwrUPiYVA1gV3nn+7DkhFLwdezy2Rf7AQGnW0z45OQHk+XmQUPOHRuEQspfPN5pWN97Kpxo1686D8gQv/wmicMOGw16n3DhO9Vfgr4vHc1PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wl4GiMe7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so7942381e87.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778755119; x=1779359919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ru+7Hoaiuh+KhENOJt2+sFlK6jzOqyzKGqLurDAOQng=;
        b=Wl4GiMe7gbGwjIAw8MRncCK0CdD2DY92w238jHKKVIVPo+Y0laL/re4JOT9sGIVsHt
         Q2hOAFfY1XfcGdvtMhHdazQstrIP1sppMIC8xJmZxKLZvNOq+UJWazxUGlECm0OvX9nX
         7o6Mi5i70UhJn2YLNBhe+eOuUnIH45hzheUNJNojQpmy/SK4rR2h3lUewp4/vqvEyfVX
         u0/VkBEtBXF3HT0wOwGtjG6zSKZVIhM+FVYdv10CUKyJIbUYtRWSWRL492QRxvaycVEG
         ewYFxjSmkVrAbJc67KwftTD8zBxFQeN1OOgtcoQe+kE8BbacewfBlJNayC5YWAFkeHJx
         FRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755119; x=1779359919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ru+7Hoaiuh+KhENOJt2+sFlK6jzOqyzKGqLurDAOQng=;
        b=nFp4NMW1mro4OHoRbScTJn1GJwonZC2mWmQcoXPMIbOPnfCx7Cq5VlY906z2mSo3Ch
         GkaGnolH/9Ak5SC/Xgvqp94wsSxYU4DHyD7fuyBpfF8UU7D4lwExjQCdr13HntdbpuX3
         b9uzxOPyqGupGJVVA63IX+ogLIIUyimxM8EQPHti8w586mPiX3LenGugn8eDv4ywFC8x
         ZLVc0RZddixrPavY75pgwv+clu8f1VZg7utcNIyvazoesWCebqd7mytPdkHzBvlcn0Og
         LZEV5J3ZTKmMNajGr76pflkXplenMi+OzBCLWz/712gM0HitVP3MuXHkwBYKzwRnW/SF
         DnCA==
X-Forwarded-Encrypted: i=1; AFNElJ+KyN96kxLjX7U34CJpfriTDaN40K/a6rMbv6GOhdvYAj5bebt6HhGGzcbrj59HFpynEG0t2qqIBQ4Npw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUsKOM6/cfzp/ln97fs3cyJgGJaKRCoCsxYtrqlfXoS1hc+pza
	bViBXUosmKCA/BkZpWm5hPp9BKxbsc+pbud4zCk5nhUuGYLwCE4numvP
X-Gm-Gg: Acq92OE5TWfnV//a9j/vTOmxKctggDqnEoOeOLpSlv/oseTs43/0H+hP9oPXjNkqqk6
	gKxX4JdQk3Y11hG/rO41GABWYSj34Lbwq2Uu8QFfOJIT7cc2RPnVmpNqxxc64E4w0n/GqCaKUtY
	JczfolQffY2507xtz93nhHgEqzUKIGps644eo07ougnRJn1D8pvZqMFoF9mrnY2RVZ3Sz6DQVXd
	0f+RNlaxCYdGswfRovzi7AWOuuo36atCP/gnQvIClgVdRcQPrg615kl8WJqAXGWmWhv5+5gBHNh
	PYAFJkj3Ffb6ATn3PYcnaDXuGp4X5JjRuHK7dneKAT5iB+amckKI9LkrcL9eQzVuWuEYsKxuakB
	szuP3PcbIEjW+6A+nO5IlF7JC9OoQ9WouvnqKSApOx7/+4GQV3YMoeGq7aYHn+nldYtoZO+8p6o
	Dppg03llkdKmxJ+IzTsTx+gkzZQA+Q89m0PQmWFrOUYKYhnxHBq2Rw4Yb1BGHrnV2kfWV0KPndZ
	Q4exqEXL0p+kw==
X-Received: by 2002:a05:6512:1155:b0:5a8:e5b2:c81f with SMTP id 2adb3069b0e04-5a8ef989b2cmr2500743e87.27.1778755119178;
        Thu, 14 May 2026 03:38:39 -0700 (PDT)
Received: from g-virtual-machine.lan (95-25-161-220.broadband.corbina.ru. [95.25.161.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc66bsm392369e87.53.2026.05.14.03.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:38:38 -0700 (PDT)
From: Igor Pytko <igorpetindev@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Igor Pytko <igorpetindev@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: fix trailing statements in input_system.c
Date: Thu, 14 May 2026 13:38:35 +0300
Message-ID: <20260514103835.13732-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 87BEB54084B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-61600-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Action: no action

Move return statements to a new line to improve code readability
and comply with the Linux kernel coding style.

This patch also fixes several checkpatch.pl errors regarding
trailing statements throughout the file.

Signed-off-by: Igor Pytko <igorpetindev@gmail.com>
---
 .../hive_isp_css_common/host/input_system.c    | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 9f1199c47..86c9d7a48 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -423,7 +423,8 @@ static input_system_err_t input_system_configure_channel(
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		}
 
-		if (error != INPUT_SYSTEM_ERR_NO_ERROR) return error;
+		if (error != INPUT_SYSTEM_ERR_NO_ERROR)
+			return error;
 		// Input switch channel configurations must be combined in united config.
 		config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2]
 		    =
@@ -1094,13 +1095,15 @@ static input_system_err_t input_system_configure_channel_sensor(
 
 	status = set_source_type(&config.source_type, channel.source_type,
 				 &config.source_type_flags);
-	if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+	if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+		return status;
 
 	// Check for conflicts on source (implicitly on multicast, capture unit and input buffer).
 
 	status = set_csi_cfg(&config.csi_value[port], &channel.source_cfg.csi_cfg,
 			     &config.csi_flags[port]);
-	if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+	if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+		return status;
 
 	switch (channel.source_cfg.csi_cfg.buffering_mode) {
 	case INPUT_SYSTEM_FIFO_CAPTURE:
@@ -1109,7 +1112,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_MIPI_PORT0 + port;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_CSI_BACKEND;
 
 		// Shared resource, so it should be blocked.
@@ -1124,7 +1128,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_ACQUISITION_UNIT;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_INPUT_BUFFER;
 
 		// Shared resource, so it should be blocked.
@@ -1139,7 +1144,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_ACQUISITION_UNIT;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_INPUT_BUFFER;
 
 		// Shared resource, so it should be blocked.
-- 
2.43.0


