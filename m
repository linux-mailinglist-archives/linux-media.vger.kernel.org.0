Return-Path: <linux-media+bounces-56689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCEOCX8UwWn5QQQAu9opvQ
	(envelope-from <linux-media+bounces-56689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:22:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE712EFF2C
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1D703020A4F
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7260E38B148;
	Mon, 23 Mar 2026 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUUmnCx6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD13138B12B
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261302; cv=none; b=cLpwsIwVhq+rIQ0KqsaApUtuiTelmp3lgANdyTgVwXsVlmT/kLDYflrbboUmxZZn1jQzLCiCgl8GQtLAOj3zwgtfJXp52YHMXQt+fUO3NT8MsauLn6ijlGJix87O28ncO6IFXUjBlzWlzQJnqoXjFKTAvEoaMI4UuezDra6EWwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261302; c=relaxed/simple;
	bh=oyYmDhz2o0YqRLTrMThZ+tgQUswO+2MnVLqzo195x7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdYxLRwSiPA06klOWaiqosfGUDDLlG+QauV7A09UmLtJhHOdzaKSZ5kcAYhjufwDAmERyTQugDhsdW8ykKBC7BKZ0NB9U0T4JXuowEokywCjox5A4aNBQpggZqmzIVgZyNu6sG5PPKd5oXWqc2UedK+T5pRI/NysGDa6UfXe/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUUmnCx6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82a7ebc729dso3197b3a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261301; x=1774866101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBTauTdEu7jFyGoe5VcEyiFFsMZZfriVIFl5j/2ktlU=;
        b=JUUmnCx6vaKQ2g+tvGu4GPd0EwVuUfehhsJfWHmGwDFyWO20f+B7hArhn6BPExVWOh
         pj3sM4PfJ+3ruNYwvzYS8+zwJGzgeiOCQ1+dFP+tfb23dHBcz9QgnCwD9Xqh7uyzBXn3
         oYq+ZeNjJRAXHoYdd1ixEIRcnpKKnZBkmc+6hIs1DDj1bIxBatssriauon9XaKxtKmc3
         lB8JgawgoT7dmRVxNFijfakjgBnu2l7vxnt9NHUHKTHnVPVMKnliF5EMvgkFaAux5qiV
         4qfsubgmLHUc8rwaYVAlNEcqWBUklj6+ARdwf9N6rpPZzdiMCCbHsk+RnCl8z/824WbA
         20FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261301; x=1774866101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PBTauTdEu7jFyGoe5VcEyiFFsMZZfriVIFl5j/2ktlU=;
        b=suOctxQ0Rg1j2NwUILVmLkfpGtJCrR7JR7NtNAlJhgZvsWVIcHFSb6fdSNXQ+Xabgn
         yLwjiGUGRKfLCzlJX9L+/h3HAetjnjvxGLf3MXtDDHfo4e/pn5yQmDw5k5v+lpF4N7EG
         zFdyMRTup9q0pa1uvrwg3IyMPy+Mb0IYDnXcTHE+efQeqgsVdGEicX2neB62zSJ0jSGx
         OkMzQdHaMGxhFJdEeiAeu7nmfXTBRxnGN/8Rz3OzeAJDbUWdY1FcGR1u77JAzOtiZepd
         76KcIR/54DDZDuHfU6yu73XkQ9jbPQt2Jm3zGq3CUKccoajVHb/45dvwgZ99XsTeKNIM
         O/yw==
X-Forwarded-Encrypted: i=1; AJvYcCWpdD1562PaAJlkYNouoZ+k5uaP3wHlu6Zd/eWYx79aMSoA17jRwL9zmUjYrO8AakUDLY7hpA/TMg5IrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxThpXlV0INzns5WIsJdUJSss5joXiuJPA6Dy6ia5LmvMQ2CUYz
	x0Bt9S99o3nzcdnCyfp8mw8oZxLmyeCnCjYVAH2cd0WR8vPHnr3XhTgQ
X-Gm-Gg: ATEYQzxxDiNYKjkvcSOCNj2jv56PhFSRJxIMzARVua7h6uXmQYk/utCI+INA23a1XK/
	25gUAGx32yA9xMVny8rpg+tN4p3Cpg9fDqOtBAy/8HDNrJyGKyF5Cer7kdrf/TWaOx/WLBcaq/A
	RF1t1VOo9yhJK0XYgpnHjFyJaNfBsFPk8soEkFb9m3tBLNrBeEUd+OfTiVezCimQ9KTWc1zBRHS
	SFm3VtZoSAN0QdL+EwxkjrWMMwLzJLE7PT6w6pmYnERMyCBnzNQJw3MGaW6bQoszR2PpRSJLGZe
	rcLflhrTZQcgeEgc+Fs2xKPg/Zqa/bKh+wWmX/CDSgIa3n8sr8dJRgTEZFJnehoUSRxPBOlBoDL
	LXF6oN94z4VuVjxn2vIPHFhq2w7xgNl9pZQ8oR/M3jfGSq/CD/ttxeifquZWJHNGhYIpmNHYIWR
	nvb7yxi2D8gm0To+vif2MNLip/u+0=
X-Received: by 2002:a05:6a00:2d05:b0:82a:6125:728f with SMTP id d2e1a72fcca58-82a8c22de9emr9575183b3a.10.1774261301159;
        Mon, 23 Mar 2026 03:21:41 -0700 (PDT)
Received: from localhost ([2401:4900:797e:96d8:eb0e:7887:769c:9c5f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be31f7sm10172012b3a.26.2026.03.23.03.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:21:40 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: dan.carpenter@linaro.org
Cc: andy@kernel.org,
	anushkabadhe@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2] staging: atomisp: vf_1.0: fix open brace placement
Date: Mon, 23 Mar 2026 15:51:04 +0530
Message-ID: <20260323102104.44021-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <acENTtTMsD-xca2O@stanley.mountain>
References: <acENTtTMsD-xca2O@stanley.mountain>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56689-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,linux.intel.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[anushkabadhe@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: BCE712EFF2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix open brace placement on function definitions and control statements
to comply with kernel coding style.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Changes in v2:
- Wrapped commit message at 74 characters
- Verified patch using checkpatch.pl
 .../atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c   | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index 3c675063c4a7..940b5767954c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -49,7 +49,8 @@ int
 sh_css_vf_downscale_log2(
     const struct ia_css_frame_info *out_info,
     const struct ia_css_frame_info *vf_info,
-    unsigned int *downscale_log2) {
+    unsigned int *downscale_log2)
+{
 	unsigned int ds_log2 = 0;
 	unsigned int out_width;
 
@@ -65,8 +66,7 @@ sh_css_vf_downscale_log2(
 	* test for the height since the vmem buffers only put restrictions on
 	* the width of a line, not on the number of lines in a frame.
 	*/
-	while (out_width >= vf_info->res.width)
-	{
+	while (out_width >= vf_info->res.width) {
 		ds_log2++;
 		out_width /= 2;
 	}
@@ -86,7 +86,8 @@ configure_kernel(
     const struct ia_css_frame_info *out_info,
     const struct ia_css_frame_info *vf_info,
     unsigned int *downscale_log2,
-    struct ia_css_vf_configuration *config) {
+    struct ia_css_vf_configuration *config)
+{
 	int err;
 	unsigned int vf_log_ds = 0;
 
-- 
2.43.0


