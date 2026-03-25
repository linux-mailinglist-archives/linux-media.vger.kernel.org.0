Return-Path: <linux-media+bounces-57096-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DvvIzlqxGlEzAQAu9opvQ
	(envelope-from <linux-media+bounces-57096-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 00:05:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2929732D3B3
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 00:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 717503016AF3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 23:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F11339D6F0;
	Wed, 25 Mar 2026 23:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pE0mNjgV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D114396580
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 23:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479910; cv=none; b=s7MupJj4mV0C4ZkhxFbk7GejA0lWZvRotqduQTSpJUoEwsRGaHvGhYYvtMK+IN1ieAhGRdFe8o3PDx9zWQSJ/tILNZZRbdTHYeDxfxSahDgFs0QcFsrWtZs3Ia61x0ZyrjSQu/81BJ52BuuxPag6JoTY4k9pSuLSKNyjTSpLlYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479910; c=relaxed/simple;
	bh=rf3vPXa7x1VywS4MiMkGOUIsNiVXVvgwlwYOCkZNs/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L29Zvedpzvo1iGrxBF+6PUs1cvKh4xBqy0tDzdBgtozUl9ihDmIRw6+3frs4QG/IKSTUV+v44v7wi0GXgD9QropCe9XqUwNUdL71RJEahJXY1aALQ7aXijIM2gTzfLdWkxpAlhyTuKYUV5/9Q5VKTGC0Y9Y1YdYDUB6DA8luhX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pE0mNjgV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b97c44417ffso34271366b.2
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 16:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774479907; x=1775084707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jiwFETKkt3NdDNZkVN46Gf8wVpkOW4mHE9IXrg+0ugk=;
        b=pE0mNjgVJCH9WorPmcw0aPCC8x/RexjssFR1MdiY1AY93sJ76VaRWs8Cgret4xR5Zw
         hJEyCCURw3c4tGHIiHA227v0eaXIwYKjeVGYlXkbj6uFCKJCYPcR6jx5NSoEnXZrcS6t
         VEZ5QRqJdL0VSbRm3zN7H3mb5uG4NkFi+R1mcSR/6tsjj2rxzzSY/sJD3x9/SiL4eH3Y
         VKPgqUm+DSLgDcVO3yfn5lZd2r0oVuvqVwhs/kQZJrsCsmGdvia9IELxNbZypKT+Qauq
         cKb/6JngcUITGK3m9fsQt9cPm8Mg2fJL21LLD7oiO+odJPKCD20oozFIXgEWzCKkjzHH
         8VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774479907; x=1775084707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiwFETKkt3NdDNZkVN46Gf8wVpkOW4mHE9IXrg+0ugk=;
        b=Pw0SdhtB1XisC432A4KI/+i3yN4FgZBh2jQ1TTdFMRYWfYw0wBkLjvMJ5ztEuYc0re
         Zzl++azOn5hXZ9zfxXAy06pXp3OE5AV1pVnBZ9XwCGFm1I6pcGuXcNY+eK8TzzOeljHS
         upuWWTeH49Q3HwgeZA81qaUV1h32JQIGi96kR4plzA0XZaJ/tva1fswa4wfcZXlEbdF0
         hSU0kpmd5MzvbCZf33A7WAWSr8xQElGvaM9RvPTatMsF50IIJDQBMSSGmQIMKIBBs63A
         NO3RXFGQv5Fnqa6DY7MyoaLpHQbRlr92OH68niqZnPBZinvuVdQwGZQXPK0V1FQfUCxE
         7MOw==
X-Forwarded-Encrypted: i=1; AJvYcCVl5AyHxcxe7KxAojDpuilyOYmObYU59P0YPceO6sXOQAJyfbHopOyFwkkjddT9hFCPht5alobP3V+OFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuiJ9ZtXRGOMyWbsNqbHGttCMYdf1W+3kU8OMYlSqUY3asXdnQ
	OVQccATB4pRH5e+VnU94OJL/S/sMgwXUCP37mcnFgGQj1AFqQCpDBv6e
X-Gm-Gg: ATEYQzyHNSVVbE4hw0DtubVLMCzvj0tzt0aDuNs3bENjQbfinQrtH48iZr9NgOxzNt2
	9mbHtHFggBtJPTTFP4v/2j6KUc1E6wigwuiArxS48g0+GWdtIUWXVZqjL8lmgOp/BtK1PQePJmX
	muikO3IINj7uxajlK88LnZYhNsZHeRoLZm0fsXbrrG7XiTYnYgWN+wKsG9C4CInrOImdVk/FyzS
	UklrBWTLW6SoXpjAwcM1q6g9zNwjI3i0E7cfVD9Yy4x1gUfhgC1EQ9AK0xkLOf+NvB5YBhUaEjY
	qoOxrWrTrT8QDkUzVMuwNDq88osgKYwo27WYMRrfQr2rr5xOv98glC081HalvFQEHFkCiHrdFI8
	MM9KzxEEkkh4B4Pm+tZz1zuRixQLnVdjtmEjI+Ed2WCQ2f8vwHE+s4suw2ltowToTuC9XdhmALK
	KlyfnHAGG6zxDfGFEBudYbTk7TjtCJY5Kh8C41YW5kAF4xCw==
X-Received: by 2002:a17:907:8694:b0:b96:996c:8605 with SMTP id a640c23a62f3a-b9a3f1adbd8mr393398866b.23.1774479906060;
        Wed, 25 Mar 2026 16:05:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:185f:dfa7:bca5:80ff:fe60:41d2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef860sm35371766b.48.2026.03.25.16.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:05:05 -0700 (PDT)
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
Subject: [PATCH] staging: media: atomisp: refactor ia_css_stream_destroy
Date: Thu, 26 Mar 2026 00:04:48 +0100
Message-ID: <20260325230453.848584-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57096-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2929732D3B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor the ISP2401 cleanup logic into a separate helper
function.

Fix a logic bug where the loop variable 'i' was being shadowed and
overwritten by a nested loop, potentially causing incorrect cleanup
behavior.

Replace an early 'return -EINVAL' with 'continue' within the cleanup
loop. In a destruction path, it is better to proceed with cleaning up as
many resources as possible rather than aborting early, which would
result in memory leaks for the remaining pipes.

Remove 'assert(entry)' in favor of an explicit null pointer check ('if
(!entry) continue;'). This avoids a macro-based assertions and ensuring
the system remains stable even if a pointer is unexpectedly null during
cleanup.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 89 ++++++++++++----------
 1 file changed, 47 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..076a75c9d0fb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8189,6 +8189,51 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	return err;
 }
 
+static void ia_css_stream_destroy_isp2401(struct ia_css_stream *stream)
+{
+	int i, j;
+
+	for (i = 0; i < stream->num_pipes; i++) {
+		struct ia_css_pipe *entry = stream->pipes[i];
+		unsigned int sp_thread_id;
+		struct sh_css_sp_pipeline_terminal *terminal;
+
+		if (!entry)
+			continue;
+
+		/* get the SP thread id */
+		if (!ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(entry),
+						      &sp_thread_id))
+			continue;
+
+		/* get the target input terminal */
+		terminal = &sh_css_sp_group.pipe_io[sp_thread_id].input;
+
+		for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
+			ia_css_isys_stream_h isys_stream =
+				&terminal->context.virtual_input_system_stream[j];
+
+			if (stream->config.isys_config[j].valid && isys_stream->valid)
+				ia_css_isys_stream_destroy(isys_stream);
+		}
+	}
+
+	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
+		for (i = 0; i < stream->num_pipes; i++) {
+			/*
+			 * free any mipi frames that are remaining:
+			 * some test stream create-destroy cycles do
+			 * not generate output frames
+			 * and the mipi buffer is not freed in the
+			 * deque function
+			 */
+			if (stream->pipes[i])
+				free_mipi_frames(stream->pipes[i]);
+		}
+	}
+	stream_unregister_with_csi_rx(stream);
+}
+
 int
 ia_css_stream_destroy(struct ia_css_stream *stream)
 {
@@ -8206,48 +8251,8 @@ ia_css_stream_destroy(struct ia_css_stream *stream)
 
 	if ((stream->last_pipe) &&
 	    ia_css_pipeline_is_mapped(stream->last_pipe->pipe_num)) {
-		if (IS_ISP2401) {
-			for (i = 0; i < stream->num_pipes; i++) {
-				struct ia_css_pipe *entry = stream->pipes[i];
-				unsigned int sp_thread_id;
-				struct sh_css_sp_pipeline_terminal *sp_pipeline_input_terminal;
-
-				assert(entry);
-				if (entry) {
-					/* get the SP thread id */
-					if (!ia_css_pipeline_get_sp_thread_id(
-							ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
-						return -EINVAL;
-
-					/* get the target input terminal */
-					sp_pipeline_input_terminal =
-						&sh_css_sp_group.pipe_io[sp_thread_id].input;
-
-					for (i = 0; i < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; i++) {
-						ia_css_isys_stream_h isys_stream =
-							&sp_pipeline_input_terminal->context.virtual_input_system_stream[i];
-						if (stream->config.isys_config[i].valid && isys_stream->valid)
-							ia_css_isys_stream_destroy(isys_stream);
-					}
-				}
-			}
-
-			if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
-				for (i = 0; i < stream->num_pipes; i++) {
-					struct ia_css_pipe *entry = stream->pipes[i];
-					/*
-					 * free any mipi frames that are remaining:
-					 * some test stream create-destroy cycles do
-					 * not generate output frames
-					 * and the mipi buffer is not freed in the
-					 * deque function
-					 */
-					if (entry)
-						free_mipi_frames(entry);
-				}
-			}
-			stream_unregister_with_csi_rx(stream);
-		}
+		if (IS_ISP2401)
+			ia_css_stream_destroy_isp2401(stream);
 
 		for (i = 0; i < stream->num_pipes; i++) {
 			struct ia_css_pipe *curr_pipe = stream->pipes[i];
-- 
2.53.0


