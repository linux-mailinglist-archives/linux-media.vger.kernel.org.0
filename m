Return-Path: <linux-media+bounces-58043-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDJ2BBwi0Gkp3wYAu9opvQ
	(envelope-from <linux-media+bounces-58043-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 22:25:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D38B398214
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 22:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9F3C30AB464
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 20:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D0D3D75DE;
	Fri,  3 Apr 2026 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3uhYfpz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F1B3D5663
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247710; cv=none; b=J1qWi/xkOG5I3V9ZqqnvWSOlV2amOkbnUDuKOL6F6kyk9esJBwMbh2wxX6z5o8E0XtoLLxUvxwNXiQ7zLoi3RHUtSAASejukBSSawlRSM0E9ikGHNZOTjBQgXt7brb/oxS33jI7AAch5pxMCapDsK9iu4XUEFf/z711SPP+itUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247710; c=relaxed/simple;
	bh=lqfeOXIelwOnodv688mUEvDtFuvrgxN8vTkZBOh4wzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HOCPOZBaWQLEBYcZ3YZ69EAkTsWZrgFntjWES5TTELS3M2BAhWpfqkQu5wr41JP9hcw4JAbFVyBl40pVEgy7/3uEBTAZGC4MRi+uMkzDPle4J8IAdtQPwf6Rd+H685N2Jcj+DXmsEvLY1MhjdkRP58L6THZQxanjdnPmdlahnCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3uhYfpz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483487335c2so22507525e9.2
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 13:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775247706; x=1775852506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyYHglTX34ak+cu/q3/cwkMEi9ygtsEGbb2scfIZmTw=;
        b=e3uhYfpzWZFLoHGcoNq4DfI1RQQUId0YZrLIOUci8YItxYnj4psODc+i+NGfX6vlOE
         rNQeKNk9aJ83C0BooHEbV/MIPtJDoqJGliSspMongbiksfR/fmrofxjO9c8Ht48m1e/2
         sURFWMjtYYXuW6BB28URXm5PTWjAvt2b+xyLePj9ap3fndcVwkJRcg3jREm3OdqaLmQV
         3BunaIdISz2FLSQ4zfu4fKlAg+jW9jgkDLlkvSHpwCD2CjB0ra01wU5aYyygvIldVz+H
         ias3mJz87+5HlRRzP27coXP/JP2EwxSenq1Jq5GQAACiBycb85HupN8ihWLStgRpd5Wm
         nCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247706; x=1775852506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uyYHglTX34ak+cu/q3/cwkMEi9ygtsEGbb2scfIZmTw=;
        b=VGwZ5j91TfNn0fYsLuAXgUFM5cg1koIqiwnjvSS5cVtHXaVmwYVGPJ1XLUmJdDbO7r
         DTM7tYAiXb2ALxvCB5MWpZDbyBn2AnI1rzcRO9p0bH7wv4CgrLB8dxDjpKxDag99/v72
         /i+Q1MwrWPGOtlVu3TXKt+lCqOMLeloGj+zo4SwSLxHhtQFC+++zDhwmbvoLotxFU5ZP
         ob+gvP1pgBvSFbZaTSuMZDvu/Zor3HauiaDxMsja9nrWVilDeWUss5p7ZYm528AkT5bq
         pLogiLo1SzdlPmJhQFXjmMblPv533S073PYDpSPPfyKAh9YueZh/s3U0+md3Z+Mi0XCm
         0LWg==
X-Forwarded-Encrypted: i=1; AJvYcCXs9M0X80sKt0gtxPYHNwzobSBrlmk7bxsxJ18GS9hDhfW0kqoKKjSLnCvAtsLbpmzWdJLe1koE2VQlGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeQctE8ID61eCO0rP3tJYAkC/CLakMeCPTaRpnfy7ubTzP+lOW
	qHyi0nrQabj5XhLB6pg+bn0CXXPxaWfh7VRugUCjN0eo0KYpsYOVKshF
X-Gm-Gg: ATEYQzyeeq31Gfeb9JXNJNwlIAshHgrLEC0E+wMQ6JQ04x88v2CpH2Q3ZMURmalcjbT
	q3WqBBb7AProSgHvOB1ZWEUjFhMOqXLrePBTnnnF6HDaiOWPdmQ1wtnib2DidFYyXpQX1/fmQOF
	AKToYzonFHs+JfGCzy0hO6R4+iBsdRsBHm8ZsnKOUR5J8bCfrkiZYnfeJQ108wNv9Vs9x5tUcmL
	Zxkc29Jy2b0J9lRCe9AyCJZRXEUpS31CoVaeHeLKPY/2/lVZhx0MvR/qc6YVt+LBXEpYI5qzZOM
	PYLbqvdENKwK159nAABGfGqh4aImtcntISg1unK86U8lncwRCTrH2UiDCqvqQwhcl6CCKbmhMkV
	ea5l8zTXdtzwaZMllxz0pygQUUrZZ/pk/3UYmVsYUQm4oivuKC7jyqp8+cjg7gBdJyCZelqWf4b
	qRuKwm+CEcveAcCAJtemwt1iQbP8+hgtLAaFifbVCbS06MuTcBnDZBaHl7MqPYvAFg2eodzVGS5
	3leXoTQH6s8YruVEahZDvVcDZMnmGjiuNqBsAhVwDa2hGNIF4JkZidEb2vYJEytmY8moAMQ5cZM
	3BG/suP8FNYwtrR9jNo=
X-Received: by 2002:a05:600c:1d1c:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-488997d0012mr65551945e9.21.1775247705946;
        Fri, 03 Apr 2026 13:21:45 -0700 (PDT)
Received: from localhost.localdomain (ip-86-49-246-182.bb.vodafone.cz. [86.49.246.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83e906sm305931125e9.8.2026.04.03.13.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:21:45 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	grondon@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v2] staging: atomisp: cleanup parenthesis alignment in pci.
Date: Fri,  3 Apr 2026 22:21:01 +0200
Message-Id: <20260403202101.34849-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CALoEA-z0aGoir4_C8cMyZGguJ-Bp1UUADKxntDgjcseUkzNuag@mail.gmail.com>
References: <CALoEA-z0aGoir4_C8cMyZGguJ-Bp1UUADKxntDgjcseUkzNuag@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58043-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,converted_macc_table.data:url]
X-Rspamd-Queue-Id: 5D38B398214
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Cleanup parenthesis alignment as per checkpatch.pl in the
pci/ directory.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
v2:
 - cleaned up all files in pci/ dir directory
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 178 +++++++++---------
 .../media/atomisp/pci/atomisp_compat_css20.c  |  34 ++--
 .../staging/media/atomisp/pci/atomisp_fops.c  |   4 +-
 .../media/atomisp/pci/atomisp_subdev.c        |  11 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   2 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |   4 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  77 ++++----
 drivers/staging/media/atomisp/pci/sh_css_sp.c |   2 +-
 8 files changed, 158 insertions(+), 154 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d..b22f880cec 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -356,7 +356,7 @@ void atomisp_eof_event(struct atomisp_sub_device *asd, uint8_t exp_id)
 }
 
 static void atomisp_3a_stats_ready_event(struct atomisp_sub_device *asd,
-	uint8_t exp_id)
+					 uint8_t exp_id)
 {
 	struct v4l2_event event = {0};
 
@@ -367,7 +367,7 @@ static void atomisp_3a_stats_ready_event(struct atomisp_sub_device *asd,
 }
 
 static void atomisp_metadata_ready_event(struct atomisp_sub_device *asd,
-	enum atomisp_metadata_type md_type)
+					 enum atomisp_metadata_type md_type)
 {
 	struct v4l2_event event = {0};
 
@@ -2352,8 +2352,8 @@ int atomisp_cp_lsc_table(struct atomisp_sub_device *asd,
 
 	if (IS_ISP2401) {
 		if (copy_from_compatible(&dest_st, source_st,
-					sizeof(struct atomisp_shading_table),
-					from_user)) {
+					 sizeof(struct atomisp_shading_table),
+					 from_user)) {
 			dev_err(asd->isp->dev, "copy shading table failed!");
 			return -EFAULT;
 		}
@@ -2488,29 +2488,29 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		dvs_hor_coef_bytes = asd->params.dvs_hor_coef_bytes;
 		dvs_ver_coef_bytes = asd->params.dvs_ver_coef_bytes;
 		if (copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_real,
-					coefs->hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_imag,
-					coefs->hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_real,
-					coefs->hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_imag,
-					coefs->hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
+					 coefs->hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_real,
-					coefs->ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
+					 coefs->ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_imag,
-					coefs->ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
+					 coefs->ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_real,
-					coefs->ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
+					 coefs->ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_imag,
-					coefs->ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
+					 coefs->ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
 			ia_css_dvs2_coefficients_free(css_param->dvs2_coeff);
 			css_param->dvs2_coeff = NULL;
 			return -EFAULT;
 		}
 	} else {
 		if (copy_from_compatible(&dvs2_coefs, coefs,
-					sizeof(struct ia_css_dvs2_coefficients),
-					from_user)) {
+					 sizeof(struct ia_css_dvs2_coefficients),
+					 from_user)) {
 			dev_err(asd->isp->dev, "copy dvs2 coef failed");
 			return -EFAULT;
 		}
@@ -2544,21 +2544,21 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		dvs_hor_coef_bytes = asd->params.dvs_hor_coef_bytes;
 		dvs_ver_coef_bytes = asd->params.dvs_ver_coef_bytes;
 		if (copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_real,
-					dvs2_coefs.hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.odd_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.odd_imag,
-					dvs2_coefs.hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.odd_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_real,
-					dvs2_coefs.hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.even_real, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->hor_coefs.even_imag,
-					dvs2_coefs.hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
+					 dvs2_coefs.hor_coefs.even_imag, dvs_hor_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_real,
-					dvs2_coefs.ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
+					 dvs2_coefs.ver_coefs.odd_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.odd_imag,
-					dvs2_coefs.ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
+					 dvs2_coefs.ver_coefs.odd_imag, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_real,
-					dvs2_coefs.ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
+					 dvs2_coefs.ver_coefs.even_real, dvs_ver_coef_bytes, from_user) ||
 		    copy_from_compatible(css_param->dvs2_coeff->ver_coefs.even_imag,
-					dvs2_coefs.ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
+					 dvs2_coefs.ver_coefs.even_imag, dvs_ver_coef_bytes, from_user)) {
 			ia_css_dvs2_coefficients_free(css_param->dvs2_coeff);
 			css_param->dvs2_coeff = NULL;
 			return -EFAULT;
@@ -2605,17 +2605,17 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 		struct ia_css_dvs_6axis_config t_6axis_config;
 
 		if (copy_from_compatible(&t_6axis_config, source_6axis_config,
-					sizeof(struct atomisp_dvs_6axis_config),
-					from_user)) {
+					 sizeof(struct atomisp_dvs_6axis_config),
+					 from_user)) {
 			dev_err(asd->isp->dev, "copy morph table failed!");
 			return -EFAULT;
 		}
 
 		if (old_6axis_config &&
 		    (old_6axis_config->width_y != t_6axis_config.width_y ||
-		    old_6axis_config->height_y != t_6axis_config.height_y ||
-		    old_6axis_config->width_uv != t_6axis_config.width_uv ||
-		    old_6axis_config->height_uv != t_6axis_config.height_uv)) {
+		     old_6axis_config->height_y != t_6axis_config.height_y ||
+		     old_6axis_config->width_uv != t_6axis_config.width_uv ||
+		     old_6axis_config->height_uv != t_6axis_config.height_uv)) {
 			ia_css_dvs2_6axis_config_free(css_param->dvs_6axis);
 			css_param->dvs_6axis = NULL;
 
@@ -2631,39 +2631,39 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 		dvs_6axis_config->exp_id = t_6axis_config.exp_id;
 
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
-					t_6axis_config.xcoords_y,
-					t_6axis_config.width_y *
-					t_6axis_config.height_y *
-					sizeof(*dvs_6axis_config->xcoords_y),
-					from_user))
+					 t_6axis_config.xcoords_y,
+					 t_6axis_config.width_y *
+					 t_6axis_config.height_y *
+					 sizeof(*dvs_6axis_config->xcoords_y),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_y,
-					t_6axis_config.ycoords_y,
-					t_6axis_config.width_y *
-					t_6axis_config.height_y *
-					sizeof(*dvs_6axis_config->ycoords_y),
-					from_user))
+					 t_6axis_config.ycoords_y,
+					 t_6axis_config.width_y *
+					 t_6axis_config.height_y *
+					 sizeof(*dvs_6axis_config->ycoords_y),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->xcoords_uv,
-					t_6axis_config.xcoords_uv,
-					t_6axis_config.width_uv *
-					t_6axis_config.height_uv *
-					sizeof(*dvs_6axis_config->xcoords_uv),
-					from_user))
+					 t_6axis_config.xcoords_uv,
+					 t_6axis_config.width_uv *
+					 t_6axis_config.height_uv *
+					 sizeof(*dvs_6axis_config->xcoords_uv),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_uv,
-					t_6axis_config.ycoords_uv,
-					t_6axis_config.width_uv *
-					t_6axis_config.height_uv *
-					sizeof(*dvs_6axis_config->ycoords_uv),
-					from_user))
+					 t_6axis_config.ycoords_uv,
+					 t_6axis_config.width_uv *
+					 t_6axis_config.height_uv *
+					 sizeof(*dvs_6axis_config->ycoords_uv),
+					 from_user))
 			goto error;
 	} else {
 		if (old_6axis_config &&
 		    (old_6axis_config->width_y != source_6axis_config->width_y ||
-		    old_6axis_config->height_y != source_6axis_config->height_y ||
-		    old_6axis_config->width_uv != source_6axis_config->width_uv ||
-		    old_6axis_config->height_uv != source_6axis_config->height_uv)) {
+		     old_6axis_config->height_y != source_6axis_config->height_y ||
+		     old_6axis_config->width_uv != source_6axis_config->width_uv ||
+		     old_6axis_config->height_uv != source_6axis_config->height_uv)) {
 			ia_css_dvs2_6axis_config_free(css_param->dvs_6axis);
 			css_param->dvs_6axis = NULL;
 
@@ -2683,32 +2683,32 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
 
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
-					source_6axis_config->xcoords_y,
-					source_6axis_config->width_y *
-					source_6axis_config->height_y *
-					sizeof(*source_6axis_config->xcoords_y),
-					from_user))
+					 source_6axis_config->xcoords_y,
+					 source_6axis_config->width_y *
+					 source_6axis_config->height_y *
+					 sizeof(*source_6axis_config->xcoords_y),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_y,
-					source_6axis_config->ycoords_y,
-					source_6axis_config->width_y *
-					source_6axis_config->height_y *
-					sizeof(*source_6axis_config->ycoords_y),
-					from_user))
+					 source_6axis_config->ycoords_y,
+					 source_6axis_config->width_y *
+					 source_6axis_config->height_y *
+					 sizeof(*source_6axis_config->ycoords_y),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->xcoords_uv,
-					source_6axis_config->xcoords_uv,
-					source_6axis_config->width_uv *
-					source_6axis_config->height_uv *
-					sizeof(*source_6axis_config->xcoords_uv),
-					from_user))
+					 source_6axis_config->xcoords_uv,
+					 source_6axis_config->width_uv *
+					 source_6axis_config->height_uv *
+					 sizeof(*source_6axis_config->xcoords_uv),
+					 from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_uv,
-					source_6axis_config->ycoords_uv,
-					source_6axis_config->width_uv *
-					source_6axis_config->height_uv *
-					sizeof(*source_6axis_config->ycoords_uv),
-					from_user))
+					 source_6axis_config->ycoords_uv,
+					 source_6axis_config->width_uv *
+					 source_6axis_config->height_uv *
+					 sizeof(*source_6axis_config->ycoords_uv),
+					 from_user))
 			goto error;
 	}
 	css_param->dvs_6axis = dvs_6axis_config;
@@ -2744,8 +2744,8 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
 		struct ia_css_morph_table mtbl;
 
 		if (copy_from_compatible(&mtbl, source_morph_table,
-				sizeof(struct atomisp_morph_table),
-				from_user)) {
+					 sizeof(struct atomisp_morph_table),
+					 from_user)) {
 			dev_err(asd->isp->dev, "copy morph table failed!");
 			return -EFAULT;
 		}
@@ -2758,17 +2758,17 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
 
 		for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 			if (copy_from_compatible(morph_table->coordinates_x[i],
-						(__force void *)source_morph_table->coordinates_x[i],
-						mtbl.height * mtbl.width *
-						sizeof(*morph_table->coordinates_x[i]),
-						from_user))
+						 (__force void *)source_morph_table->coordinates_x[i],
+						 mtbl.height * mtbl.width *
+						 sizeof(*morph_table->coordinates_x[i]),
+						 from_user))
 				goto error;
 
 			if (copy_from_compatible(morph_table->coordinates_y[i],
-						(__force void *)source_morph_table->coordinates_y[i],
-						mtbl.height * mtbl.width *
-						sizeof(*morph_table->coordinates_y[i]),
-						from_user))
+						 (__force void *)source_morph_table->coordinates_y[i],
+						 mtbl.height * mtbl.width *
+						 sizeof(*morph_table->coordinates_y[i]),
+						 from_user))
 				goto error;
 		}
 	} else {
@@ -2782,17 +2782,17 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
 
 		for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 			if (copy_from_compatible(morph_table->coordinates_x[i],
-						(__force void *)source_morph_table->coordinates_x[i],
-						source_morph_table->height * source_morph_table->width *
-						sizeof(*source_morph_table->coordinates_x[i]),
-						from_user))
+						 (__force void *)source_morph_table->coordinates_x[i],
+						 source_morph_table->height * source_morph_table->width *
+						 sizeof(*source_morph_table->coordinates_x[i]),
+						 from_user))
 				goto error;
 
 			if (copy_from_compatible(morph_table->coordinates_y[i],
-						(__force void *)source_morph_table->coordinates_y[i],
-						source_morph_table->height * source_morph_table->width *
-						sizeof(*source_morph_table->coordinates_y[i]),
-						from_user))
+						 (__force void *)source_morph_table->coordinates_y[i],
+						 source_morph_table->height * source_morph_table->width *
+						 sizeof(*source_morph_table->coordinates_y[i]),
+						 from_user))
 				goto error;
 		}
 	}
@@ -3318,7 +3318,7 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 	   bytes. The RAW frame we use here should always be a 16bit RAW
 	   frame. This is why we bytesperline/2 is equal to the padded with */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
-				       sh_format, padded_width, 0)) {
+				  sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
 		goto err;
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6..281f5b8a50 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -584,7 +584,7 @@ static void __apply_additional_pipe_config(
 }
 
 static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
-	enum ia_css_pipe_id pipe_id)
+					      enum ia_css_pipe_id pipe_id)
 {
 	if (pipe_id == IA_CSS_PIPE_ID_YUVPP)
 		return true;
@@ -1025,7 +1025,7 @@ void atomisp_css_update_isp_params(struct atomisp_sub_device *asd)
 }
 
 void atomisp_css_update_isp_params_on_pipe(struct atomisp_sub_device *asd,
-	struct ia_css_pipe *pipe)
+					   struct ia_css_pipe *pipe)
 {
 	int ret;
 
@@ -1456,8 +1456,8 @@ int atomisp_css_input_set_resolution(struct atomisp_sub_device *asd,
 }
 
 void atomisp_css_input_set_binning_factor(struct atomisp_sub_device *asd,
-	enum atomisp_input_stream_id stream_id,
-	unsigned int bin_factor)
+					  enum atomisp_input_stream_id stream_id,
+					  unsigned int bin_factor)
 {
 	asd->stream_env[stream_id]
 	.stream_config.sensor_binning_factor = bin_factor;
@@ -1908,8 +1908,8 @@ static void __configure_output(struct atomisp_sub_device *asd,
  * downscaling input resolution.
  */
 static void __configure_capture_pp_input(struct atomisp_sub_device *asd,
-	unsigned int width, unsigned int height,
-	enum ia_css_pipe_id pipe_id)
+					 unsigned int width, unsigned int height,
+					 enum ia_css_pipe_id pipe_id)
 {
 	struct atomisp_device *isp = asd->isp;
 	struct atomisp_stream_env *stream_env =
@@ -1960,8 +1960,8 @@ static void __configure_capture_pp_input(struct atomisp_sub_device *asd,
  * yuv downscaling, which needs addtional configurations.
  */
 static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
-	unsigned int width, unsigned int height,
-	enum ia_css_pipe_id pipe_id)
+					 unsigned int width, unsigned int height,
+					 enum ia_css_pipe_id pipe_id)
 {
 	struct atomisp_device *isp = asd->isp;
 	int out_width, out_height, yuv_ds_in_width, yuv_ds_in_height;
@@ -2317,9 +2317,9 @@ int atomisp_css_copy_configure_output(struct atomisp_sub_device *asd,
 }
 
 int atomisp_css_preview_configure_output(struct atomisp_sub_device *asd,
-	unsigned int width, unsigned int height,
-	unsigned int min_width,
-	enum ia_css_frame_format format)
+					 unsigned int width, unsigned int height,
+					 unsigned int min_width,
+					 enum ia_css_frame_format format)
 {
 	__configure_output(asd, ATOMISP_INPUT_STREAM_GENERAL, width, height,
 			   min_width, format, IA_CSS_PIPE_ID_PREVIEW);
@@ -2327,9 +2327,9 @@ int atomisp_css_preview_configure_output(struct atomisp_sub_device *asd,
 }
 
 int atomisp_css_capture_configure_output(struct atomisp_sub_device *asd,
-	unsigned int width, unsigned int height,
-	unsigned int min_width,
-	enum ia_css_frame_format format)
+					 unsigned int width, unsigned int height,
+					 unsigned int min_width,
+					 enum ia_css_frame_format format)
 {
 	__configure_output(asd, ATOMISP_INPUT_STREAM_GENERAL, width, height,
 			   min_width, format, IA_CSS_PIPE_ID_CAPTURE);
@@ -2456,7 +2456,9 @@ int atomisp_css_video_configure_pp_input(
 }
 
 int atomisp_css_offline_capture_configure(struct atomisp_sub_device *asd,
-	int num_captures, unsigned int skip, int offset)
+					  int num_captures,
+					  unsigned int skip,
+					  int offset)
 {
 	int ret;
 
@@ -3355,7 +3357,7 @@ void atomisp_css_set_isp_config_id(struct atomisp_sub_device *asd,
 }
 
 void atomisp_css_set_isp_config_applied_frame(struct atomisp_sub_device *asd,
-	struct ia_css_frame *output_frame)
+					      struct ia_css_frame *output_frame)
 {
 	asd->params.config.output_frame = output_frame;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f2..c51d04af6c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -96,8 +96,8 @@ static int atomisp_buf_init(struct vb2_buffer *vb)
 }
 
 static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
-	enum atomisp_input_stream_id stream_id,
-	enum ia_css_pipe_id css_pipe_id)
+					 enum atomisp_input_stream_id stream_id,
+					 enum ia_css_pipe_id css_pipe_id)
 {
 	struct atomisp_metadata_buf *metadata_buf;
 	enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3d56ca83ec..d707e13ae7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -202,9 +202,10 @@ static int isp_subdev_validate_rect(struct v4l2_subdev *sd, uint32_t pad,
 }
 
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
-	struct v4l2_subdev_state *sd_state,
-	u32 which, uint32_t pad,
-	uint32_t target)
+					  struct v4l2_subdev_state *sd_state,
+					  u32 which,
+					  uint32_t pad,
+					  uint32_t target)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
@@ -841,8 +842,8 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	asd->vfpp = v4l2_ctrl_new_custom(&asd->ctrl_handler,
 					 &ctrl_vfpp, NULL);
 	asd->continuous_viewfinder = v4l2_ctrl_new_custom(&asd->ctrl_handler,
-				     &ctrl_continuous_viewfinder,
-				     NULL);
+							  &ctrl_continuous_viewfinder,
+							  NULL);
 	asd->continuous_raw_buffer_size =
 	    v4l2_ctrl_new_custom(&asd->ctrl_handler,
 				 &ctrl_continuous_raw_buffer_size,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d..33b46bdf24 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -846,7 +846,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	/* Register internal entities */
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
 		ret = atomisp_mipi_csi2_register_entities(&isp->csi2_port[i],
-			&isp->v4l2_dev);
+							  &isp->v4l2_dev);
 		if (ret == 0)
 			continue;
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa..4de35fea38 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4385,7 +4385,7 @@ sh_css_pipe_get_grid_info(struct ia_css_pipe *pipe,
 	} else {
 		memset(&info->dvs_grid, 0, sizeof(info->dvs_grid));
 		memset(&info->dvs_grid.dvs_stat_grid_info, 0,
-			   sizeof(info->dvs_grid.dvs_stat_grid_info));
+		       sizeof(info->dvs_grid.dvs_stat_grid_info));
 	}
 
 	if (binary) {
@@ -4797,7 +4797,7 @@ static int video_start(struct ia_css_pipe *pipe)
 
 	if (pipe->stream->cont_capt) {
 		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(capture_pipe),
-						    &thread_id);
+						 &thread_id);
 		copy_ovrd |= 1 << thread_id;
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11d..a28253784d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1058,8 +1058,8 @@ ia_css_params_store_ia_css_host_data(
 	IA_CSS_ENTER_PRIVATE("");
 
 	hmm_store(ddr_addr,
-		   (void *)(data->address),
-		   (size_t)data->size);
+		  (void *)(data->address),
+		  (size_t)data->size);
 
 	IA_CSS_LEAVE_PRIVATE("void");
 }
@@ -2629,7 +2629,7 @@ static void host_lut_store(const void *lut)
 }
 
 int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
-	const void *lut)
+				   const void *lut)
 {
 	int err = 0;
 	bool stream_started = false;
@@ -2670,8 +2670,8 @@ int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 			gdc_lut_convert_to_isp_format((const int(*)[HRT_GDC_N])lut,
 						      interleaved_lut_temp);
 			hmm_store(pipe->scaler_pp_lut,
-				   (int *)interleaved_lut_temp,
-				   sizeof(zoom_table));
+				  (int *)interleaved_lut_temp,
+				  sizeof(zoom_table));
 		}
 	}
 
@@ -2710,7 +2710,7 @@ int sh_css_params_map_and_store_default_gdc_lut(void)
 	gdc_lut_convert_to_isp_format((const int(*)[HRT_GDC_N])zoom_table,
 				      interleaved_lut_temp);
 	hmm_store(default_gdc_lut, (int *)interleaved_lut_temp,
-		   sizeof(zoom_table));
+		  sizeof(zoom_table));
 
 	IA_CSS_LEAVE_PRIVATE("lut(%u) err=%d", default_gdc_lut, err);
 	return err;
@@ -3435,8 +3435,8 @@ sh_css_params_write_to_ddr_internal(
 			return err;
 		}
 		hmm_store(ddr_map->macc_tbl,
-			   converted_macc_table.data,
-			   sizeof(converted_macc_table.data));
+			  converted_macc_table.data,
+			  sizeof(converted_macc_table.data));
 	}
 
 	if (binary->info->sp.enable.dvs_6axis) {
@@ -3483,9 +3483,9 @@ sh_css_params_write_to_ddr_internal(
 				params->pipe_dvs_6axis_config_changed[pipe_id] = true;
 
 				store_dvs_6axis_config(params->pipe_dvs_6axis_config[pipe_id],
-						    binary,
-						    dvs_in_frame_info,
-						    ddr_map->dvs_6axis_params_y);
+						       binary,
+						       dvs_in_frame_info,
+						       ddr_map->dvs_6axis_params_y);
 				params->isp_params_changed = true;
 			}
 		}
@@ -3538,20 +3538,20 @@ sh_css_params_write_to_ddr_internal(
 		for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 			buff_realloced |=
 			    reallocate_buffer(virt_addr_tetra_x[i],
-					    virt_size_tetra_x[i],
-					    morph_plane_bytes(binary),
-					    params->morph_table_changed,
-					    &err);
+					      virt_size_tetra_x[i],
+					      morph_plane_bytes(binary),
+					      params->morph_table_changed,
+					      &err);
 			if (err) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
 				return err;
 			}
 			buff_realloced |=
 			    reallocate_buffer(virt_addr_tetra_y[i],
-					    virt_size_tetra_y[i],
-					    morph_plane_bytes(binary),
-					    params->morph_table_changed,
-					    &err);
+					      virt_size_tetra_y[i],
+					      morph_plane_bytes(binary),
+					      params->morph_table_changed,
+					      &err);
 			if (err) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
 				return err;
@@ -3578,15 +3578,15 @@ sh_css_params_write_to_ddr_internal(
 
 			for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 				store_morph_plane(table->coordinates_x[i],
-						table->width,
-						table->height,
-						*virt_addr_tetra_x[i],
-						binary->morph_tbl_aligned_width);
+						  table->width,
+						  table->height,
+						  *virt_addr_tetra_x[i],
+						  binary->morph_tbl_aligned_width);
 				store_morph_plane(table->coordinates_y[i],
-						table->width,
-						table->height,
-						*virt_addr_tetra_y[i],
-						binary->morph_tbl_aligned_width);
+						  table->width,
+						  table->height,
+						  *virt_addr_tetra_y[i],
+						  binary->morph_tbl_aligned_width);
 			}
 			if (id_table)
 				ia_css_morph_table_free(id_table);
@@ -3597,15 +3597,15 @@ sh_css_params_write_to_ddr_internal(
 	for (mem = 0; mem < N_IA_CSS_MEMORIES; mem++) {
 		const struct ia_css_isp_data *isp_data =
 		    ia_css_isp_param_get_isp_mem_init(&binary->info->sp.mem_initializers,
-						    IA_CSS_PARAM_CLASS_PARAM, mem);
+						      IA_CSS_PARAM_CLASS_PARAM, mem);
 		size_t size = isp_data->size;
 
 		if (!size) continue;
 		buff_realloced = reallocate_buffer(&ddr_map->isp_mem_param[stage_num][mem],
-						&ddr_map_size->isp_mem_param[stage_num][mem],
-						size,
-						params->isp_mem_params_changed[pipe_id][stage_num][mem],
-						&err);
+						   &ddr_map_size->isp_mem_param[stage_num][mem],
+						   size,
+						   params->isp_mem_params_changed[pipe_id][stage_num][mem],
+						   &err);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
@@ -3761,8 +3761,8 @@ ia_css_ptr sh_css_store_sp_stage_to_ddr(
 {
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
 	hmm_store(xmem_sp_stage_ptrs[pipe][stage],
-		   &sh_css_sp_stage,
-		   sizeof(struct sh_css_sp_stage));
+		  &sh_css_sp_stage,
+		  sizeof(struct sh_css_sp_stage));
 	return xmem_sp_stage_ptrs[pipe][stage];
 }
 
@@ -3772,8 +3772,8 @@ ia_css_ptr sh_css_store_isp_stage_to_ddr(
 {
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
 	hmm_store(xmem_isp_stage_ptrs[pipe][stage],
-		   &sh_css_isp_stage,
-		   sizeof(struct sh_css_isp_stage));
+		  &sh_css_isp_stage,
+		  sizeof(struct sh_css_isp_stage));
 	return xmem_isp_stage_ptrs[pipe][stage];
 }
 
@@ -3810,7 +3810,7 @@ static int ref_sh_css_ddr_address_map(
 			to_addrs.addrs[i] = mmgr_NULL;
 		else
 			to_addrs.addrs[i] = ia_css_refcount_increment(IA_CSS_REFCOUNT_PARAM_BUFFER,
-					    in_addrs.addrs[i]);
+								      in_addrs.addrs[i]);
 	}
 
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -3834,7 +3834,8 @@ static int write_ia_css_isp_parameter_set_info_to_ddr(
 	succ = (*out != mmgr_NULL);
 	if (succ)
 		hmm_store(*out,
-			   me, sizeof(struct ia_css_isp_parameter_set_info));
+			  me,
+			  sizeof(struct ia_css_isp_parameter_set_info));
 	else
 		err = -ENOMEM;
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 6da151e7a8..8559d37822 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1464,7 +1464,7 @@ sh_css_update_host2sp_num_mipi_frames(unsigned int num_frames)
 
 void
 sh_css_update_host2sp_cont_num_raw_frames(unsigned int num_frames,
-	bool set_avail)
+					  bool set_avail)
 {
 	const struct ia_css_fw_info *fw;
 	unsigned int HIVE_ADDR_host_sp_com;
-- 
2.34.1


