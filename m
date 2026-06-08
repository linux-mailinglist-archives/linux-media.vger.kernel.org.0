Return-Path: <linux-media+bounces-64213-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id axq7NTfkJmr8mQIAu9opvQ
	(envelope-from <linux-media+bounces-64213-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:48:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD696584C7
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:48:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tumelty-co-uk.20251104.gappssmtp.com header.s=20251104 header.b=IOLpcz2t;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64213-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64213-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6BEF3144BDB
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3267A33CEB0;
	Mon,  8 Jun 2026 15:16:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56291330D35
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 15:16:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931802; cv=none; b=H2MOaNjdnFa+4GqKVLNAL5bSty8yYi6lM7Vgu+wLtyExArDqmQtfQ8dSmXXanrVPTQoCZfZYqRSMlsOpBFvJSexlABtWy+HRIFlw3JQ1oXapmN4kmMFkZjXvEUhcrSarXSvR8tux4Zyvfoqcqi1siiFM3zD9j0CnVjPIkXjhFtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931802; c=relaxed/simple;
	bh=+Adic+T2znQgdxxRgMuzaFBipB4oYX5M3eDjZE8lqw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rDQz5PomsT/YX0Cl2Ou+PWSq7E3JaGZeRh4X9Sv3coAmVJGBhA277bjRarSMYiAEUAYa5UTA5OyUVkS1HEMWI3m2E1h/7FK0pxSrhjGBJvuLd79tU58s0e67c0p5WtKYVj37xW6OQ1JhXmcNVSbqmJDDyxRQ8MAPFyN2QEII4tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=IOLpcz2t; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so57684265e9.2
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1780931799; x=1781536599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVHQVd8Cibi1FnHd10mOaHGzwUNox/elwnpPYgAowKg=;
        b=IOLpcz2tVIL24+bIrc2TfFrURulFH8YRSssokXKG7VPmEzya9P4POnuZBezN/1Cp9O
         VXSb/WAoA/Aok10CBld4jevsOdM7s4o8xy3JAlOm7/hW4zgyJ/nCyyxvEL6NlqlVEmJ7
         xAnoniMBwRXdEVFis+n2WBLMjSBbcEgGWI76EHyPzu+QTI2Q8VaN3PQNM3/39PVqmtsU
         Is9LZbBeRkY18wjlu/I3egPc8CqkQc/EWTAlh4Dhczfu8ThjWm3Ke216Vk8wIoqtbJt8
         pYDyZAZmkmn9vRmbDAOJy0x+V3KkfoG2UvuejqOvxTvP/GEGSPOZrk+Lzv/GcG9vFdbz
         abKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780931799; x=1781536599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVHQVd8Cibi1FnHd10mOaHGzwUNox/elwnpPYgAowKg=;
        b=Hc8/GLp2XGnNviefVaOhBbGZVVb552InNlDxVOxYnJdS6KO9eOFyuvp76a4JyvWYLY
         CMQ/rZlK3FwdXWA084VT3XPQP/P2ZNvqkyBCZlU2byWRotVOa02NKwRVZ4himgIufxkC
         t1s3z/S6YnMG2B1d7hloCaWpI+ekrxhT+w9wCkyYx6VOp5IT46p+c+R4M/uGRNZf0TVe
         6ckkXr+sz5sazinH7DcPkuDuwYreL5qPebumlsEpcv70jgSX8GHy99ar5o6X5i83YpXP
         YJcwDR8tcHR+0vo8WTWAEYMYXx2B/2rvwxr9r44WQEopjIm+bx8dcbOWvsOv/V34x1ib
         NbHg==
X-Forwarded-Encrypted: i=1; AFNElJ9KM6fWTHdjjW5Bngmwv2Y/ZxDBmM0Utw2w0a46FN7dCF5h35UTTcNcFWPkffQEzZfbwru2eWAC8GBlyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS5wztmBQH7PMmE5qBTEtxrYhlaE0VKkGabKbcOGNGdV7lVwYf
	EBiNb6majTC8F/sxWl6C01+RgXi4OD+PrtheutXELYiAGiJy3kOTcMzTW032gzaiqis=
X-Gm-Gg: Acq92OHgBmXR3343J04vtX2R639pyqbunrbbqSBVVhhzsiqKFlka3NXfttw6eN5iaKR
	0c/ucAlYVrAHiLb+JnAGxPnLGyBiT7XNgGXs2ABS/J8NsIBP/p1i321nrrs3Ym7b8WvJL+DayKV
	3F2m/UDycw+3jdjBtL2U42EvNE7y79TuKIfLxzHHn1UfDTvhDZ7hxmaeUmHh6FBaU31MFED2LSU
	50XKuXPkx0KDdm+vLDezqs5CGJ5JX5s5YfMYPcSuVxkbUrCRtgXls723vHkI2CAhgJ8E1hrLFAo
	3MCu1mZ/yUADGqNHBHNPmL5ZBUJ1unOjL8OkLliG/kXRzyB6rQm4hZNsTLXUKGevX9jheqTDVFW
	qmeEygnyJoeN5OCNReno1/TMd+ViLE5iy1NvdfrC78Qj/UZrzBN3t462WIyRJfWpMqVBTJaNzcC
	8nKVNxD1nCKmwJaehKeLMnDRA=
X-Received: by 2002:a05:600c:a302:b0:490:c2a3:1781 with SMTP id 5b1f17b1804b1-490c2a317c3mr208748495e9.34.1780931798525;
        Mon, 08 Jun 2026 08:16:38 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fd33sm58630734f8f.35.2026.06.08.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:16:38 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rhys Tumelty <rhys@tumelty.co.uk>
Subject: [PATCH] staging: media: atomisp: fix variable shadowing warnings
Date: Mon,  8 Jun 2026 16:16:17 +0100
Message-ID: <20260608151617.3393471-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[tumelty-co-uk.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-64213-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:dan.carpenter@linaro.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:rhys@tumelty.co.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rhys@tumelty.co.uk,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tumelty.co.uk];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tumelty-co-uk.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[rhys@tumelty.co.uk,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,tumelty.co.uk:email,tumelty.co.uk:mid,tumelty.co.uk:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CD696584C7

Fix local variable shadowing warnings, flagged by a W=2
kernel build, due to -Werror=shadow.

In atomisp_css_stop(), an inner loop 'i' index shadows
an outer unsigned int i. Rename the inner loop index to 'k'

In ia_css_stream_create(), the block-local 'effective_res'
struct shadows an outer local declaration. Rename the
block scoped instance in the loop over pipes to
'pipe_effective_res' to clearly show context.

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
 .../media/atomisp/pci/atomisp_compat_css20.c       |  6 +++---
 drivers/staging/media/atomisp/pci/sh_css.c         | 14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..da945fddb5ea 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1775,10 +1775,10 @@ void atomisp_css_stop(struct atomisp_sub_device *asd, bool in_reset)
 
 	if (!in_reset) {
 		struct atomisp_stream_env *stream_env;
-		int i, j;
+		int k, j;
 
-		for (i = 0; i < ATOMISP_INPUT_STREAM_NUM; i++) {
-			stream_env = &asd->stream_env[i];
+		for (k = 0; k < ATOMISP_INPUT_STREAM_NUM; k++) {
+			stream_env = &asd->stream_env[k];
 			for (j = 0; j < IA_CSS_PIPE_ID_NUM; j++) {
 				ia_css_pipe_config_defaults(
 				    &stream_env->pipe_configs[j]);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index cd1be313c758..44c77179abb8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7971,22 +7971,22 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	}
 
 	for (i = 0; i < num_pipes; i++) {
-		struct ia_css_resolution effective_res;
+		struct ia_css_resolution pipe_effective_res;
 
 		curr_pipe = pipes[i];
 		/* set current stream */
 		curr_pipe->stream = curr_stream;
 		/* take over effective info */
 
-		effective_res = curr_pipe->config.input_effective_res;
-		if (effective_res.height == 0 || effective_res.width == 0) {
-			effective_res = curr_pipe->stream->config.input_config.effective_res;
+		pipe_effective_res = curr_pipe->config.input_effective_res;
+		if (pipe_effective_res.height == 0 || pipe_effective_res.width == 0) {
+			pipe_effective_res = curr_pipe->stream->config.input_config.effective_res;
 
-			curr_pipe->config.input_effective_res = effective_res;
+			curr_pipe->config.input_effective_res = pipe_effective_res;
 		}
 		IA_CSS_LOG("effective_res=%dx%d",
-			   effective_res.width,
-			   effective_res.height);
+			   pipe_effective_res.width,
+			   pipe_effective_res.height);
 	}
 
 	err = ia_css_stream_isp_parameters_init(curr_stream);
-- 
2.54.0


