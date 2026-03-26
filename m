Return-Path: <linux-media+bounces-57181-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EfsBb2mxWlUAQUAu9opvQ
	(envelope-from <linux-media+bounces-57181-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 22:35:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B84A933BF90
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 22:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99D4B3061BCA
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 21:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7023A7F4D;
	Thu, 26 Mar 2026 21:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyP7rAtZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0173A16A2
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560917; cv=none; b=WGmL6mraiHn/3+mW8m9UZUdzY0XafgJJSdrMRJvptKFIOUZIGc7o1diWZyB+GyfPTwFsAr7F1Wl1rEKQWnvU/b4gyYMEBtCHSTjKvca+BFzgxJ06xqkaVEE7YFJ3Czn11NzwgRXfEfpmsjxJMskmRV3oEsY9o6aGOv+urnmq0S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560917; c=relaxed/simple;
	bh=ez5aAwkAd5qsck46sQ1rbD1CCA7NFpeVTS9fL0whzBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kSP4vNSzAtnI5JhR2qozmSXGFom41VShs2YG0QMLbFbhgL07nyM1XRgrSIQ7nRrRVcXwX9jg8evCIBYR8fqifQvK7LzgQIlcS9EJraM9auqwVM5fm+n78j/JoEKV/QuwW+6+gOVOKG8heREw0VdgfYhBJRB3Y+PCYJYPXRehKtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyP7rAtZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so14906965e9.2
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 14:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774560915; x=1775165715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmSa6Nj2pzOSB63unXnRZ4rb/ic4PWoX2DWS6MyutAs=;
        b=JyP7rAtZ6AvNrXU/zmfVtBbjRZ9pE+MjUTYZFsOxzfri5GYv0PerZSXIJBLEam1c5c
         bhbEGiWhoO4XkouyQsrR1Cr+jxSLrBIs4VheO5ATjI5FUQPGjT3DefxbIgbWICOZ8ttd
         sz6WhOBbjtnSmto0kj1IA9/fQkWEQNgRr+uqLhTxOLbKpr+5vj/ysWVNmUHBdwfMB+YK
         cZ/Q3BBkROFcRdQqIGEHYXph3X90t3EZDddkQSguc26lZJMojix6HeFraptWnHcarfeY
         gTeFivrNomPDkZaXp0ILhdsO6PGDzvBjk5kHepY7vHwzLTawgXWbecSCY8i3MJzjyBos
         MmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560915; x=1775165715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fmSa6Nj2pzOSB63unXnRZ4rb/ic4PWoX2DWS6MyutAs=;
        b=de8aBoXHOOKGOJD9ov5eKijTnsHFjezyFuDWGtcKg9OTTZ8/UKHlytApFXbRk0pQJK
         MKUsyY9buSH8RB6SW8jHPl8PCc/NAdZjUN3QzFIGlPfRX1iPyBESijsSSHbAibUUNU0p
         teDtwvV9+UGemSEkjQ8uTcR4tpKHZNlJRbfuI3YN2lH6lH6qmgwrWPrOtfngmlphKrxL
         5znAMhAfvdjg+Va94wL479/ee/Y/7F/4UrX+/NdsF6YkETiwSLTjqxGhgEAqeUxkBAFB
         QW2KKJo74k8sEvviNhlID/XIN47n+hG/x7Ksvyq8yxjBtzK734QSNLP7xP8TZC4OTA3S
         iUIg==
X-Forwarded-Encrypted: i=1; AJvYcCVSYICNP8s2sdDbmvFSTpuyXPqJyJX3V8ILRYKy1dcHqUXYv9SIPVlRzUvJVQU0H78xYWBi7fjnlFq31w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPxXsma3EKeUw3pWEbiInjBQ0knbzH3cM2WBJSxRP1nuwzRMiI
	YeGTcHJ3rZiBU8nf2dt/1Y4ea59/5vqeRpCx59ntp9A3khHTaToQAejgcvjnYZs2
X-Gm-Gg: ATEYQzwwZpjsCszp6VyuWDkQHVXH70jkxgK3B3Ap7QtQDgdUyXIZ+zioiqKCAmCmiWX
	FpD2lcEhRcKfkmlzpjOyyM944jqqwwOdpa+3U5V+SIDh91lBj9tiwb0H83D5ZTRA+VZZD43JhpW
	LMH9xxWhGn4Jpxdi84oF7w2opelqBrw0424USJYa5sJD/x3HwpkSsx3TqmB0P2sQtMOgj+X03BZ
	yzE99NO2thCmBXmNUp7MnlwTQFj8X4i8C09W5uHcwRYHgFWDra8fOGw3QmeFXVm7lrNFZs2fSZw
	8OvDQ0TYUQ+GXS0xDb5Zi1iC6C+G4p4cRIIh39TJNabkVHoGBlfWBBUoUFdkS3NlNo2i8vvDad6
	j37taJpo+2HFXQIQvm/nNrUzd3KW2RQksMHN5qxT5CPb1VFB1ZU1VCZloMWrA5GlcPHObzE9xzi
	WVuZuV+9oqDnjTgu9gyvmZ+/e9x3s7pJ5JL5tAX5vpSCTBsg==
X-Received: by 2002:a05:600c:a44:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-48727efc11dmr2581025e9.9.1774560914810;
        Thu, 26 Mar 2026 14:35:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1855:4ab5:5c9b:17ff:fe26:9b2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c7cec3sm51106825e9.6.2026.03.26.14.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 14:35:14 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: media: atomisp: improve cleanup robustness in ia_css_stream_destroy_isp2401()
Date: Thu, 26 Mar 2026 22:34:09 +0100
Message-ID: <20260326213442.876745-4-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326213442.876745-1-azpijr@gmail.com>
References: <20260326213442.876745-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57181-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
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
X-Rspamd-Queue-Id: B84A933BF90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the 'assert(entry)' call. In the atomisp driver, assert() is a
wrapper around BUG(), which intentionally crashes the entire kernel.
This is dangerous and inappropriate for a simple null pointer check
during stream teardown. Replace it with a safe 'if (!entry) continue;'
check.

Change the early 'return' to a 'continue'. In a destruction
path, it is better to proceed with cleaning up as many resources as
possible rather than aborting early, which would result in memory leaks
for the remaining pipes.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 27 +++++++++++-----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 0e848758723f..8c368940acd8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8198,26 +8198,25 @@ static void ia_css_stream_destroy_isp2401(struct ia_css_stream *stream)
 		unsigned int sp_thread_id;
 		struct sh_css_sp_pipeline_terminal *terminal;
 
-		assert(entry);
-		if (entry) {
-			if (!ia_css_pipeline_get_sp_thread_id(
+		if (!entry)
+			continue;
+
+		if (!ia_css_pipeline_get_sp_thread_id(
 				ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
-				return;
+			continue;
 
-			terminal = &sh_css_sp_group.pipe_io[sp_thread_id].input;
+		terminal = &sh_css_sp_group.pipe_io[sp_thread_id].input;
 
-			for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
-				ia_css_isys_stream_h isys_stream =
-					&terminal->context.virtual_input_system_stream[j];
-				if (stream->config.isys_config[j].valid && isys_stream->valid)
-					ia_css_isys_stream_destroy(isys_stream);
-			}
+		for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
+			ia_css_isys_stream_h isys_stream =
+				&terminal->context.virtual_input_system_stream[j];
+			if (stream->config.isys_config[j].valid && isys_stream->valid)
+				ia_css_isys_stream_destroy(isys_stream);
 		}
 	}
 
 	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 		for (i = 0; i < stream->num_pipes; i++) {
-			struct ia_css_pipe *entry = stream->pipes[i];
 			/*
 			 * free any mipi frames that are remaining:
 			 * some test stream create-destroy cycles do
@@ -8225,8 +8224,8 @@ static void ia_css_stream_destroy_isp2401(struct ia_css_stream *stream)
 			 * and the mipi buffer is not freed in the
 			 * deque function
 			 */
-			if (entry)
-				free_mipi_frames(entry);
+			if (stream->pipes[i])
+				free_mipi_frames(stream->pipes[i]);
 		}
 	}
 	stream_unregister_with_csi_rx(stream);
-- 
2.53.0


