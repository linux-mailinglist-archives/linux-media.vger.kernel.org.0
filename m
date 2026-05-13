Return-Path: <linux-media+bounces-61362-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIMROXI5BGoqFgIAu9opvQ
	(envelope-from <linux-media+bounces-61362-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:42:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6339052FD2D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86094301725A
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 08:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53353E51C2;
	Wed, 13 May 2026 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="it/A9Ma7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9C43988FA
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778661723; cv=none; b=TjRAc/oxj41pbQnHyn+ueTvkeSZ6dWeGnFasEge8czOYIu8HA4ZvFq189lhuSjwj5B2jWAQloLS/yZyNTb7NUXgB2Qgintd46vBp4hgJUg1zryudSvisnTOHUAF6A7OQA0hXgQBLqRFWDJiMXwjQ8goHBMbFamtV/heXWTC9f9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778661723; c=relaxed/simple;
	bh=rEgCi6WbSL8Xo+YaQq/VpnJLI0p0KP0P0boReoNJ/GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D9n00eoXtCdz4tEACp/JtspTrmHYoeHNEXK7z+7Z4gP75eU8EPHgPiuPXTp9/g8ppDrFCRnRBdftRWYjEKBYoimX+ZznDcTIJ8O+/WZKn8vt88pOBFxel9s1ytDRtFKZP3DJmnfPfWK19zflGPvxpOrYvHzvSwW12osLxjfZu5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=it/A9Ma7; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a8891febd2so7782334e87.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 01:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778661709; x=1779266509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mI5ZtFaAxbXxSmMeyL6G67aMq2kdYFf+5RyhkuotiDo=;
        b=it/A9Ma7ERNcKp1iQao/w/uBIsiQ9WkGlmYFdgMi8ISKb33XuGvHcx8G/k49bciSC3
         J5AF3Zh90n5XIUCSrYZPWFjITop9DILXaP9FEg+LaRSNKz/XE0tSBenG2PDzRBNf57rz
         OOqB7ZdKgdlWjeFUEnXkQgTbbh3tYoUIWzwp5ZrIy9NwDQLLJHKnAHG5uTabbvnwP152
         uGxs/2FU5e4A/Ezv4rG2Rp61RbWtWDLaBGWUSMxZRzTxy4ZdaZTNmRnHuDaNXevHEi1K
         4FFcjUciOMsqfierCDWfyGKlxuQJVo54gGWL1mNgjWk1+ImWkZmwa2d01X63tJMQXt0I
         b+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661709; x=1779266509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI5ZtFaAxbXxSmMeyL6G67aMq2kdYFf+5RyhkuotiDo=;
        b=nqGczxRAiCnvRq8n/iCdZ3mk6XGuMkHD5JfoF+IDocRNfhmfMXrVF+lFcYtNB4fu1t
         jxKa2wpu0X2CHC2u2KpxGdIkymHpklqFm9regJrG5zO3S/oOGrMj3Qipk80q6cfBVDkM
         tE/vaSS6IGFKsCveD5l68UVzOIf2RUFzRHu6XqVevQC/L/ETGsJYWRNJEQidIzRq8M78
         w3SXU4ONud69Ocbn6pkgIYqLHjQ0dUSoraMnRV94Qexj3tZqL6vzWvWIBuawARNTcA4+
         svaL21goB0bEpAylyHxWUqkkN/mjuyRRtbPRF9gLN0p9etMLZYsoh0pvfpgrWILW135T
         0diw==
X-Forwarded-Encrypted: i=1; AFNElJ8G/tkmMZy4coWrvWeR+zVPAB/KXvohCXcAiVouXkGRJboGjtcBMcfLwvWpwk4zaNl2mC2NgTRPehHQkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6dVY6veZW9aYgMT2DXomNXHpqmHz+1QELyw9fUWjqr9PfSghc
	EFWwu/Rz6Wx5u+qxPzs/lnVxHiHZz+GqoECz9Jg/WZ39GBXuyXAp1Z7P
X-Gm-Gg: Acq92OFSdTGPfiwH8713Iut5Y6Z5tYygX54MUVM0pdMdTQsNwG6eeVyMPrIzOFiNWWS
	1ak6gn155BVmgGVq2ov7EID+grEGQDfIhd2wAVuW/2JoJ7eU5kKm9WRZHY58ZgFWmL1GvNg3TqB
	E4863Nkjl/x3ow2Lse324xTN8pdGFj01h9XxSCvoffV/l74e8+gUMicQFva42mvd7QCaUhKhnAE
	uqWqFgUnFlHLsknBnAIafkdm5UTrHRRbKq6qCwfz3eKw5lK+wqsfQxdNBi7SV0feKEC/IYNlQhL
	bxPflKqvmCtfG/+lbM7wim0gnflDloVsihRK/di0ja43D5fU78tRhVA/TDEUwhmiKmZs5I29GIx
	7JQGcjkyWH5GpGjKjQBFLFXgm0HgKoVe255DBqkVUGzolf79sXb+pBIYZNhxiKLdJdLrxfUVEdl
	YkMQOIFn0Cq6PuiW+PofYA57uNYe4nokWlP9rUGjvxq3GZ2bkgQwe6uv7/dQ0F43T51qontqFaB
	/4=
X-Received: by 2002:a05:6512:15a1:b0:5a8:6e50:b16a with SMTP id 2adb3069b0e04-5a8ef9a29f8mr881136e87.34.1778661709267;
        Wed, 13 May 2026 01:41:49 -0700 (PDT)
Received: from localhost.localdomain (95-25-161-220.broadband.corbina.ru. [95.25.161.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95664easm3846493e87.70.2026.05.13.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:41:48 -0700 (PDT)
From: IgorpetinDev <igorpetindev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	IgorpetinDev <igorpetindev@gmail.com>
Subject: [PATCH] staging: atomisp: fix trailing statements in input_system.c
Date: Wed, 13 May 2026 11:41:46 +0300
Message-ID: <20260513084146.57706-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6339052FD2D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-61362-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Change-Id: Id89273d4ac76e8155aa6b1600d1f223407e0412f
Signed-off-by: IgorpetinDev <igorpetindev@gmail.com>
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


