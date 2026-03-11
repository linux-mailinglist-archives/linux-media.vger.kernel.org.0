Return-Path: <linux-media+bounces-55420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA5LARqHsWmjCwAAu9opvQ
	(envelope-from <linux-media+bounces-55420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:15:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FFB2663F2
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E70FF30143EC
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 15:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590022D5925;
	Wed, 11 Mar 2026 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4Xam2a6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C183314D0
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242039; cv=none; b=UrEDe5k6y4iTDp0Lq6LDyHhSl2VdRtjDi9Jix0DzVqTmBxqem16MUJph9UnxTdzlQSy4YlZt7hikCxz3nglw8kW7ivLLjkXhhDRqu8CmQC9c/iWMABPUnpn8TZ0krbxe5TvT/Xq5jhDriYTE/Y3vBYhqjZQ3UcHGRsV7i9tt9wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242039; c=relaxed/simple;
	bh=XD45q+33d1RCd5CzmKC9Ts8w30QzxVbqLnlMN0Zwgk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kHLiuUM0BrWKo7Gg722hqnUhg8bmiHOcSjBaDoUwiRbzeX0EzST7odBlM28ZOsDApUw02Jk0I8/agYys5yCq2xlZpKFKa57fd6eOW6yBIUbdzh7MJJxBqeCULF6M6OluhAvkkEd5K7KL2C9F8XwcFou+FJDdMu8tt7lNB06eF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4Xam2a6; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c73bd024a0dso1292932a12.1
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773242036; x=1773846836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=84SjFZaTIYWd1JD1S1Qs8NOutRXunKp9VX/f1s94fpE=;
        b=M4Xam2a6mAThhluCMeUwHb16PDlcvM2ZTV6Q9rWQevSqYBAdjTq8XjW2VVD6gxWwC1
         bZo+Ofn/QJx9V60HyQcsgsf/8gOZ15iZAPayoQ0/EzAQ+motgnut6Youtm5jvJ02FnKP
         HSB2NsneC3Lv/cVz6dGUxrZYF4Jo7QFe4Q3AJouKdwwwoXGSblPJ2dWesiA/HGyWvekx
         jIOtnDUCMSOThko2kO3V6xDUfWvwbttD7/eonyjx+fCxbGxqxXinV6TyQ7WbFxTMf0Eb
         uq4vEnJo87y7bknSPTUAbunYk1x6FatI+i/d1sTjpzuqAkj+C8P2Xp79qSTuWftQErBJ
         Hoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242036; x=1773846836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84SjFZaTIYWd1JD1S1Qs8NOutRXunKp9VX/f1s94fpE=;
        b=r99iqMY3bDlgrZRjYeb+4hUCiD7cG4aRHX3MGOxEpUN8F7e2SrEmsRiBOY7wJHOLm1
         5MKTxLSA8NDUNpcuMMeMgjMj2MoNB/eC7imZw15F/C+1ZjPdyCy6o7N3fFiDZiV6GLFb
         BAPsAMmP/FSjXPo9U/NLnfQ7kK3hZGDvS8WYXuo7PgHda3OOzLFiB78hMw1MZR75lQC2
         iQLa1AbuIH7EAkP+Inro1E4zlj4e4bc2mXomsqQaiZ8PxXYGil8jzI3mNXpZOyso0ENk
         qOfF4HZWaMgy2jKsy9+Qt6XIzQRdYYGlaKtKKV5Tz1jhaE8j9K84nrcYAYtpmYEAbU75
         QSQg==
X-Forwarded-Encrypted: i=1; AJvYcCWFp0O6dK1rOqGCkB8Oql/oeSQnEexXGVS66Q49kosSC9subwnXMUxoav+k06eZENbv2PQyxcHedJQB4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3TD9SvtExaeXH0q8ErxFetQdtuGiuXkQTgiLmh9lbs1OTaHP
	ypI5YFFOYK4EQnXyFZOooJegeAAgjLW3h66BjwijC+QabUdwYCq95UGn
X-Gm-Gg: ATEYQzyqhSdUllyVwXgx0H9FGhiLOWHI7lKoxLJuB9cHvBSAeJla983uGcgMVe4zqTW
	4Y72wi1figLy98vtiwprvVvlWbXc7Qfe8ahYbnfEXzbZXO9jzRigy2UYJwN5ONCA7MAAlXJDsDq
	0oZdCSQ2SGQDS4RGPMcyPm8qOPt4MvhYtLd5JsMnRV4mK+OAsACE15OrQAkV/URbkKUjihdPDTi
	/Edpv9UFcHgsrDvT0nO9BIOWe6xUHltotkhFZ34a52HKz0kTxMQVdddfPzjK7AVZr46xXrWGFm5
	+Zqgw47P3CrbVD96vj1GKt8v/ZWoxfCKlBwitHORzGz/ZUDHlmfWeW/Sugpy4RPVg055mOP4LE8
	ChmTSoQUq+hUORcWOQwhp8R/Hxhx1QShr1T7573J9iLZgeI4szXRePMnuXp0r1T80KsddWisdsy
	TuH95Tc0uTS39re/izkQoaop728d1M6cU88OfKQPLd9uM=
X-Received: by 2002:a17:903:3510:b0:2ad:cede:3a1a with SMTP id d9443c01a7336-2aeae8cace5mr29932705ad.39.1773242035695;
        Wed, 11 Mar 2026 08:13:55 -0700 (PDT)
Received: from kalyani.. ([2401:4900:88f6:f504:2b46:93ec:f6d1:99e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae247cbesm28897575ad.29.2026.03.11.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:13:54 -0700 (PDT)
From: Kalyani Patra <kalyanipatra2003@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Simona Toaca <simona.toaca@nxp.com>,
	d-gole@ti.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Kalyani Patra <kalyanipatra2003@gmail.com>
Subject: [PATCH v2] staging: atomisp: fix brace style and trailing whitespace in isp_param.c
Date: Wed, 11 Mar 2026 20:43:02 +0530
Message-ID: <20260311151302.105992-1-kalyanipatra2003@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,nxp.com,ti.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-55420-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kalyanipatra2003@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72FFB2663F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix checkpatch errors related to brace placement and remove trailing
whitespace in isp_param.c.

Reported by scripts/checkpatch.pl.

Signed-off-by: Kalyani Patra <kalyanipatra2003@gmail.com>
---
 .../atomisp/pci/runtime/isp_param/src/isp_param.c    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 251dd75a7613..f21797598cd5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -97,13 +97,13 @@ int
 ia_css_isp_param_allocate_isp_parameters(
     struct ia_css_isp_param_host_segments *mem_params,
     struct ia_css_isp_param_css_segments *css_params,
-    const struct ia_css_isp_param_isp_segments *mem_initializers) {
+    const struct ia_css_isp_param_isp_segments *mem_initializers)
+{
 	int err = 0;
 	unsigned int mem, pclass;
 
 	pclass = IA_CSS_PARAM_CLASS_PARAM;
-	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++) {
 		for (pclass = 0; pclass < IA_CSS_NUM_PARAM_CLASSES; pclass++) {
 			u32 size = 0;
 
@@ -175,11 +175,11 @@ int
 ia_css_isp_param_copy_isp_mem_if_to_ddr(
     struct ia_css_isp_param_css_segments *ddr,
     const struct ia_css_isp_param_host_segments *host,
-    enum ia_css_param_class pclass) {
+    enum ia_css_param_class pclass)
+{
 	unsigned int mem;
 
-	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++) {
 		size_t       size	  = host->params[pclass][mem].size;
 		ia_css_ptr ddr_mem_ptr  = ddr->params[pclass][mem].address;
 		char	    *host_mem_ptr = host->params[pclass][mem].address;
-- 
2.43.0


