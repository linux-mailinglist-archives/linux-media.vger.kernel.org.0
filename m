Return-Path: <linux-media+bounces-57180-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEWqOCmoxWlUAQUAu9opvQ
	(envelope-from <linux-media+bounces-57180-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 22:42:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8D633C0D8
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 22:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BA8C30E50A0
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 21:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B890D3A7F46;
	Thu, 26 Mar 2026 21:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzjeVxOw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF6A3A7846
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 21:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560910; cv=none; b=TxGwDXdCa0PnhuSTN0wYCFuDx+6fTDCqjaQjxAi/fzB0lD2hr56eavUnor1LmYaysxy7NheDqx7kbi63+y8JjZyAv/VPY4ydGZ4Y6ZtIDsSPnxKHkJp5lqRybll8qrGWi4hF0boXgrE60NfEP0Pax5fV46DPvk+UXtuY/61ns6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560910; c=relaxed/simple;
	bh=CtnwhLDLOxjCXa3BzzxQo5WlhQ17lqydy/Bm6LiQsfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uej02+koEE4OpwB7TuHFx9OOKBif5YMjz52FtDFDu08JRFwWjkiy4I2HNEh/uKP5V+DakFrHQIOi0Ly1YTNo5+lG1+bEVecQ7aPQ6f/cs8/E2m4NRiDXS382jh6NzL2WjFQuFDQO8fDqCMBXnz+PF0/RwamGrCp4vqdkkPmJcX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzjeVxOw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48704db565eso20820735e9.1
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 14:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774560907; x=1775165707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVJ/09f+kraUH4FlZGqso9M+eYHC0bMs9ktLcorknuk=;
        b=GzjeVxOw7tVqok0inhuAyktYGIpLr+DP8o8IKCMu7vtQRWMgoA1hnmCJf5TMU0fwbZ
         wzWuqeySBaJ1MU9kfPFA9o0YIfoSWndIBYd9fL0XNd6AfJdecm+88kI/cmm7mJRi0MN1
         nngY5b3S66SMN7kRha4JlgLBkELkQw/l+XfFGuocXwiiwh6VJ5LLbvYdTSPxG/fmRilb
         YWiplU7t/5Aq/VoI5Ue5iTCcPJxHkL4GQ5dssVWl6g+0ezML5ydzE07F90Xs7RAQiHdG
         tftYhIrAQEFWDRe0uLVhwa3XhhN52bKn9/U1a6/m+1xYVmaQe1WRxEJcMGOSniELp3hN
         A7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560907; x=1775165707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVJ/09f+kraUH4FlZGqso9M+eYHC0bMs9ktLcorknuk=;
        b=HNuV7gR7FTDgxddDqr69UIIDK6MORngiBHbkDDzQFezXnVdx+kE73tL6kCYy7F61Uo
         MboyFgiKJrwHguHfDuZzw2r3rCORq+1G+ebiT2PX4g/867cA9xA8VZcibBmmjR3JL+DD
         Ua3R6G7YWgKwyHrbw5BhDE6+3bCHq2wYEL3Z4uv8sQtBRXZqD26BtPDSbY40WLAaqPjz
         8aWCEcoLE3/AfHIy6rPtHAcMN3GMd2ZacA2ddIrxL34ukeZLN+HydTkaahu+qtEeKx4X
         HW0quZ32l+LiF3SNlYlSg3V0UhLB6zy6A4oxmfLVT2UqtuhDOnA88bVtjJ6Jzv/rbchN
         IjMA==
X-Forwarded-Encrypted: i=1; AJvYcCXeZMLJhhibO/ISle6qUPK7Z+BZ+gwYGX1eyEvCT9tm0B5lG758ne1lJhtxCjVc2ZIOlSRuAcSRGmd2jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrqN69sMNzBkvX/B5TZTItiCXo1q1k8VHGEX31/dqDlSO2hVwt
	JmzZNVHtDB7Uv+ZNL81/oWdmUXg3fAmRk68V+ZKEb0u2WxEuCkB/9qzz
X-Gm-Gg: ATEYQzwPl5pjbAa4CNJRFDgSQQ590mIYXYalNmeL0+DeWCXhUwoWHR5/mMtndM8xhTz
	B2xONqVVjtQ0XP937fKiod0xnEnB4FDXAdcwNKBtwIuzk9Lx/qP0kteUhY9omio4bpVy1T7j2vS
	6t8MzngZU30hXXwDr+0QW9uesndF52QIbalA4QCqiIUPpqhTuGnLM4+Kdd2XAwwERuhPw/rsanj
	5w2ANIU71b+ctFaPi3fRORTc22BIXDeht7k5Iz/V5WsILMpDHwTAOcIa/miD+KBJS7+yVOOnlZ2
	CzSV7lNDFoaIJfygjhWMxB0ECww54qBhac6kEILX9uBOi9XaC0pNzZcz9OGwONwZkRC4V+mwvC2
	gLO0+aE+fEaTPU3WR2yEpCiQkJqvgc5BwHBLcJnE3aDklm+UqDGZ7fFmOjeWpSdy9Ts0klPc7Qt
	v1s01qYZEOViKoKWkcqwYhRgumzIJzNLW+hr0BiIV9gmEnzA==
X-Received: by 2002:a05:600c:c168:b0:485:35a4:939f with SMTP id 5b1f17b1804b1-48727eddeacmr3457045e9.28.1774560906791;
        Thu, 26 Mar 2026 14:35:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1855:4ab5:5c9b:17ff:fe26:9b2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c7cec3sm51106825e9.6.2026.03.26.14.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 14:35:06 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/3] staging: media: atomisp: extract ISP2401 cleanup into helper function
Date: Thu, 26 Mar 2026 22:34:08 +0100
Message-ID: <20260326213442.876745-3-azpijr@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57180-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C8D633C0D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To reduce indentation and improve the readability of
ia_css_stream_destroy(), extract the ISP2401-specific cleanup block into
a new static helper function, ia_css_stream_destroy_isp2401().

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 89 +++++++++++-----------
 1 file changed, 46 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 8d8b82dc59f1..0e848758723f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8189,10 +8189,53 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
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
+		assert(entry);
+		if (entry) {
+			if (!ia_css_pipeline_get_sp_thread_id(
+				ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
+				return;
+
+			terminal = &sh_css_sp_group.pipe_io[sp_thread_id].input;
+
+			for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
+				ia_css_isys_stream_h isys_stream =
+					&terminal->context.virtual_input_system_stream[j];
+				if (stream->config.isys_config[j].valid && isys_stream->valid)
+					ia_css_isys_stream_destroy(isys_stream);
+			}
+		}
+	}
+
+	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
+		for (i = 0; i < stream->num_pipes; i++) {
+			struct ia_css_pipe *entry = stream->pipes[i];
+			/*
+			 * free any mipi frames that are remaining:
+			 * some test stream create-destroy cycles do
+			 * not generate output frames
+			 * and the mipi buffer is not freed in the
+			 * deque function
+			 */
+			if (entry)
+				free_mipi_frames(entry);
+		}
+	}
+	stream_unregister_with_csi_rx(stream);
+}
+
 int
 ia_css_stream_destroy(struct ia_css_stream *stream)
 {
-	int i, j;
+	int i;
 	int err = 0;
 
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
@@ -8206,48 +8249,8 @@ ia_css_stream_destroy(struct ia_css_stream *stream)
 
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
-					for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
-						ia_css_isys_stream_h isys_stream =
-							&sp_pipeline_input_terminal->context.virtual_input_system_stream[j];
-						if (stream->config.isys_config[j].valid && isys_stream->valid)
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


