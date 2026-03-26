Return-Path: <linux-media+bounces-57179-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFGXJhyoxWlUAQUAu9opvQ
	(envelope-from <linux-media+bounces-57179-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 22:41:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0662E33C0CB
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 22:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A45730E1003
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 21:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73AF341062;
	Thu, 26 Mar 2026 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPLU4xig"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDDC37756B
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 21:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560909; cv=none; b=iuAukcjaBo5a0cc16QniDNmLGZn0HEUkrgtGwgPWcH8/iabv4GOkn3mf4J6eVZZHIyMK2S4H8b/jmrxlNZine8w2dZpgkKniQ0ndSicmjgUIsqqrGG7OjPAtDHEzUjiDua752yf/NWhnnQUbXqAKGQO04ZrGVwnqIAmeJw2Iwp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560909; c=relaxed/simple;
	bh=wsgHtGMsL0z+O6CPRZuHTu3FEglSadQqIuS8210B1hE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q96L5yTAKHFwZEVGlXBVtMWeGekVb/YykKZgkeK9m0TRWwpgP2ryNZenV/H/KriExuE9ZK3v+y2oLy5UlYP6VmvcQh2TCydHeqU6G7j6iNJ59m/DbalqJnpZZdt2XH4WzdnruZlI95ZQACUdnUc1wrvHy5FG3IIJTMZ72l40oeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPLU4xig; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so18095195e9.1
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 14:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774560903; x=1775165703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8VUbdY2qRvrHENEWIeYirIdqjJOGNjoUNh/2XerUPo=;
        b=lPLU4xiggr674XcEQtD8m2F6fBBqAB/BU8hnm9Wee8oT9taqkcuIML+NpjtNgFBTgz
         lD+RRT5HE0HUWo2owGnsPf72EkV+5N3hPB0DFpqqGIAWaLbZaSwPi0WeyC7dglv/OnbQ
         C6M4qkzoJ+PZMRjj7Q+9Kv3HPSH9r0ItM+tXwQKYzx2yLxFgYQCxWLkFAlxCZl+s3q29
         ubhK0VPx7vTOgZXyJF+sZ/0kf/iaFe/7ofhvLOpPVxBIJorURk/elrFwvMEPSQKeOdUO
         jlbga0X3W+V6F+AJhcCVCGTI7anVWFFEx5fzavHjIB+7QktJL/skIUNB+0ultuIx5wSS
         +zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560903; x=1775165703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8VUbdY2qRvrHENEWIeYirIdqjJOGNjoUNh/2XerUPo=;
        b=pdpcG1hDyVMPgC7XrioWWActNk5Lrun4c7+FEUgZ7Xk8xwHP0mm0X5AYgIv5a+0y0C
         KrAFUfRDcXedH+zrgr1TKpxSnQv09NohvTUWZM+ad6KxibYxz0lo93RtjH3b/gNRN3d2
         7ZiLyhGrkv0DTEjlIcX8WAMp79MFDpaXHozl5IuKn+RxiipQhNRr+ze5CMMOKu6GrLDY
         macBYuAHxfiXV6WtjjAJv6M0g8ljJHFvTEFS30IILNtfsm9STk0IwQD/+6GjII3YPCKQ
         kQbve5s/O+loZW81eVKZihU2okQp1wJHOy/fB0H+rKpU9FkifvavCcOxZeTVtyWR5yHc
         uoTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkJly1HnrYx30n0RJBamaYUNMc6pESLPKQHAH/akSuLzrlztUVAQKRUyqfCyytXtQgfktnU2G0XF1ZgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiIP4OKGsFgoO02slkaNS15IJhaQ5IQiub6nbKH+ry49gVvTQo
	GZ+EmCbfyrDF4MjAuhxLlM2UiSN545RRvqp3OC5IRqgPgH4eHuYp6m6P
X-Gm-Gg: ATEYQzycxYzEhdihWrBpvMMn3ee8EVJhsDhOVWTHQguKI+BbC5Hslr4MHfLThSKD1Ka
	aheWLFSNxT0WPWhQqkSwOSXiIiJrLwG1MTJ1vhehG+gjpbwYQ3HcunlHvHucKIawr2l+PuUL3Ww
	ygw8kFth+ibNKV7Ds3aTP6fKilZK8bT4MI2Es6kVnATQtbECtHU9Z4JOqye7Ztl4cKvXi2sBOtx
	J06nUT/kw/j+CjSqnx4I+4BaQOyNcT9bHpBHdWhvLSwL+VbO0qRwbGfDSRVU1McXLEpOISqcc9x
	peE1XZ8euB8nTxFH5aBk11/BItkhuUClkiAuo7/RzvzOTf99wGxnYrHIIr+TObspmDgGXCiXR+Q
	pb22Wt3C+LSd5z1qhQEMdXB8WWU0wAIPgAKHP0TAJlLfSxhMBEotquFrLhZ1gxtqSvsRU4md6xO
	T2eom4AqfTkrgdfeP6RNsWg2JpIPItNNbJQmt536gBVQ+2tg==
X-Received: by 2002:a05:600c:4ed3:b0:487:2b7:18d1 with SMTP id 5b1f17b1804b1-48727f0eb50mr3476355e9.33.1774560902310;
        Thu, 26 Mar 2026 14:35:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1855:4ab5:5c9b:17ff:fe26:9b2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c7cec3sm51106825e9.6.2026.03.26.14.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 14:35:02 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] staging: media: atomisp: fix loop shadowing in ia_css_stream_destroy()
Date: Thu, 26 Mar 2026 22:34:07 +0100
Message-ID: <20260326213442.876745-2-azpijr@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-57179-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0662E33C0CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The nested loop inside the IS_ISP2401 block incorrectly uses the same
variable 'i' as the outer loop. This shadows the outer loop variable
and causes premature termination or skipped array elements.

Change the inner loop to use a new variable 'j' to prevent this.

Fixes: 113401c67386 ("media: atomisp: sh_css: Removed #ifdef ISP2401 to make code generic")
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..8d8b82dc59f1 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8192,7 +8192,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 int
 ia_css_stream_destroy(struct ia_css_stream *stream)
 {
-	int i;
+	int i, j;
 	int err = 0;
 
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
@@ -8223,10 +8223,10 @@ ia_css_stream_destroy(struct ia_css_stream *stream)
 					sp_pipeline_input_terminal =
 						&sh_css_sp_group.pipe_io[sp_thread_id].input;
 
-					for (i = 0; i < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; i++) {
+					for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
 						ia_css_isys_stream_h isys_stream =
-							&sp_pipeline_input_terminal->context.virtual_input_system_stream[i];
-						if (stream->config.isys_config[i].valid && isys_stream->valid)
+							&sp_pipeline_input_terminal->context.virtual_input_system_stream[j];
+						if (stream->config.isys_config[j].valid && isys_stream->valid)
 							ia_css_isys_stream_destroy(isys_stream);
 					}
 				}
-- 
2.53.0


