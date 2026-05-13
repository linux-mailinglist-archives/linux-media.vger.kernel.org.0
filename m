Return-Path: <linux-media+bounces-61486-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KBoKqWvBGp6NAIAu9opvQ
	(envelope-from <linux-media+bounces-61486-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:06:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87908537AD9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96B2A3028415
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 17:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DD84DB56D;
	Wed, 13 May 2026 17:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXI9H9p6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50FB4ADDA0
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691863; cv=none; b=LHi5ExxSObVhVBm9pb1hd0ZxEsGpSpeISLGFO0vtdEDDpfFh4oy6V0LMu9jVj7MATT3xvcBZ9vLtRrBpPQSODWl3cTFO4D04H1bEHOQ5lzhszg6YGQie5LEdkHLvYkiogeGVUZfC1L67UGkgCniKQPdCM+fW5qw66Zqmi5Vi4cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691863; c=relaxed/simple;
	bh=M03VGnPw3A8DdSISwpvtbeABhaMtWieGENTzbxAaAvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZnNlbE9tZ2ijRjepySUuIRPv+ky45Kir9W90y0C2xe6baX7AhWqPPC6EisZordYkgtqsTs/DKr4r+Fy4cZihUgWUbY0g674D5Zh/LcZbbAjO12aDRNeCJ36njLn4bWa9oxf0VFsAStviOEomT5l5pRv0C+XB1dMj3j5b3ZQPecs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXI9H9p6; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38be5e86918so88145321fa.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778691857; x=1779296657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9CQ8kFrkRqI2OJXhweWy37iYOSF41egtPSUHTO04/H0=;
        b=EXI9H9p6G5DbA24T4/NKm/Yg7bfMqFkiiJsDeSRFkqjqldM9ivE2Kp04455AH65Q4j
         p6ZMV/HuCZsfezPdlSvscTCdXx411KiMihID7OyI2/ilWn6KcLjHi6aypHfHajF7jBJq
         E2vAF2WQvqE5gl5Yq8OW5EfGo5RyINlTF2frmq2yeOdFm4PKzb7+m4QbBCuk8ECDIJx+
         MLBCWNg/J6o/Tz7n9KkvbzhzkPCmPVVirwQxfhKMQGB1f84tPqr0yvKXkylIRCM5qiVB
         ff0AUy/QbpBYhwB+sAJcr6c8rN2PMGiPfQelUFHkZVMfVo3U49A/0P9IWZg8+lyTVAM4
         IOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691857; x=1779296657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CQ8kFrkRqI2OJXhweWy37iYOSF41egtPSUHTO04/H0=;
        b=qN1MwcbJXSzJtKKVJboF0DJWQWXBSOzFx0tVrVmmuIIgJkZAvzUEECpxDylNQPsiQI
         QAk6MuIOiSGcnGcKWbBsMkABKO/2Fo8A+kSZyiRiBcunBGpe4d6tkyVdjpgIu++hkehp
         xg5tMdl6U7DnEULU7RkSTnqxxKTQD22m7DvmgfjDza9ThVHsSSenQ10szfPFx+cTotgj
         6eO2XtE51CsTbY1ilG0u/UMaQjrqq0QFr3/yhSi6gvjhJdpfUfl81IidUcFKgEHcRNr7
         q7/8q364W4Yv9OklmSoWb8Qohm5d0QadGVVrimBm/yZaYJSr7E63X4LH+46g7oT+DxaR
         +kbg==
X-Forwarded-Encrypted: i=1; AFNElJ8/9wwwRMRQIuqPDSUrpXmYEUiWuMAKtJcUSeO+YB08C64N5dstxZNjQkwRC6hltxFWlS55HlUCrCf7AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF3r8/5oK9zgOT2hyqS1Gxlu2wUG7qSwAeM0bVm/53p8fV36vD
	3ptt3aVwy/0y6b5SaKUAHkh6WtluhMa9mh1/XBYH5ZiNZGRPAt2WDgV41iwD4yqTMgwiJA==
X-Gm-Gg: Acq92OFn95RUq0AtFE4NxB+06o+eXbDvOi4zZ2WH3HANezt1SxNW1UIYK1ICkpWVQd6
	8axoL8SuJugUHUvuO6GBQLlm+KYwVb6sGLEI2m2R4QycT4y0fFYtAJ2nxcgqyMc+o0paj0MOFaZ
	+FqM1gh+pp5alQtS5k57vBveQljDCFgbvPGbCCQGkFwFfRUCWKww8cTjC8sZrDzgW3Qi/2NfsCr
	nVaYlIQ+QMrOS/rb9phZsAvIjqv9cY2+415LF1sELiJD2LK0lfOiqTWSXZaIQgC65zCpq5Gxb3S
	kV0AaQ5ILMTuWV0O1bgcBBNePvi+BLcufS8ItxPsNmCweaQiSLaDmzomrwrp0fKV2ol/O4R/P31
	nFb0fAlRnl8JXMiTjb4beradnFNWJfDLbkHGzkbnXX7foXEdo5+H+lLNu3tTO+tMST/FAMZr6/4
	Ox8ugLHABnp5Q9bBHMe/mN7Fkkx3SHwzH9UOtawvcI1tWRPra+MQBE2LJ4ovwBgP2CDBW14NQVc
	Zc=
X-Received: by 2002:a05:651c:1142:b0:391:c48:d30a with SMTP id 38308e7fff4ca-3944eaa0be0mr13018081fa.24.1778691857098;
        Wed, 13 May 2026 10:04:17 -0700 (PDT)
Received: from localhost.localdomain (95-25-161-220.broadband.corbina.ru. [95.25.161.220])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f61078cesm45487401fa.28.2026.05.13.10.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:04:16 -0700 (PDT)
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
Subject: [PATCH v2] staging: media: atomisp: fix trailing statements in input_system.c
Date: Wed, 13 May 2026 20:04:13 +0300
Message-ID: <20260513170413.58469-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 87908537AD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-61486-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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


