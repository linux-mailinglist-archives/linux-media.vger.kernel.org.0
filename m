Return-Path: <linux-media+bounces-60191-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCFbHKkp92lbdAIAu9opvQ
	(envelope-from <linux-media+bounces-60191-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 12:55:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7AF4B52BD
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 12:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F28FC300B9D5
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 10:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805962F6904;
	Sun,  3 May 2026 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrrdfVQE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4C122FE0E
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 10:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777805726; cv=none; b=cGr3qDfBfoqmZ8U8gB+qMWuBn2Rx9dg8mMJ3d0wxN3hfQiAk8yYwM4TPnGtq8fvvlgx4fNWoRQ6h7ce5AqJY4t/pCLo3rVtPOZ/BDjPedIV1L+lkiquCFEJbrWlvCL82CnEsIX8Gh8zFM9FSfyLDH4BTGr/Y1h0wiohBs+moRRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777805726; c=relaxed/simple;
	bh=1hO51x4h8CPdx9jGG2GAutIl/f60gAsDJNQC7HCqxG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeigIV7s9ZG8vrvCv9HHVITxWQ4V8z7felcaTLMXs3dTJ36n2ATfLa+KcEhh9aaxzbSnR7eToQI1aoKqv3U5spEqQVcJU8wn0mlLG5aVtTAazz5CwFepKKrC7+WiV5H9J4xTOTQj9EZOgLkxWUa2aq6f3G5O6xe804Jk+bHGbTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrrdfVQE; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-356337f058aso2016469a91.2
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 03:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777805724; x=1778410524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqeyPpFoIkQJEcRegJwv7jhnh6PyDcMcrJOjjALCVsE=;
        b=nrrdfVQE03r/QAl1FhQf99lCtfm0TKY6FkfXDu1+1L4LFZT49LFYIw0HMoKwT30+H8
         Bt9SDGsTtlYzxoCh436pOU09/RPS2H2kfV9UOhNeea4i2SjpH1oq6lY62kL1PcR7yfz5
         Y6wxxCyZzjknil/vOjIOoTKwinZihsE7g1bYgb8QYSjsQwhy573fjdM3WcLpp4G6dY6R
         v6AETSJBGJk3Ntg3X08P2kYD0fzdXstHjT5DseTB3r6hFPA1ccFz9YKcVeKKZXdQFDjG
         k29hBKmj3NgKPdaQpxyCorkCAlO0OhYEpXfqTBPzUneNAneknwKoClR9mtGAN7kyK/Si
         rgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777805724; x=1778410524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tqeyPpFoIkQJEcRegJwv7jhnh6PyDcMcrJOjjALCVsE=;
        b=j/8n83M+gOKOX8pYUsCdiHSbgjz2XmIEuVvgL9C6f8WpBEFezDM4E0RMnqNRZ+Ol+U
         t+BKHd0SBWXsMZB7X+yHnnvW8/bdrE2mtYP1B0ExGGwcThznG9BQw+KXx40CUKvj2epy
         qal5wAx3lKS1sVpy02Wra60YU8xkYCKU9smAAxCGahhRrwD49m1AQE4TnAzncfvi37Rn
         ZjDQoO4knVxI2yP6y1l1GiPi3xikQHbOzQ6OqaFkQvQ/66Qiojjftw0xbSGmrikj0IMl
         ccws4HZq8F7WPfR1ibLRTEReSsJkOh04aZ0ost3CApNL3K849hw6z3+ZsDL7sEzKSwNs
         Nvtg==
X-Forwarded-Encrypted: i=1; AFNElJ/zSTnZJ1sBHn6PUyQDkAljbAclGwYYnQzFqL63lsnId7sh3Em1z/zWQaCcRVbUWHU58+VUGaONq6x8zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQz6JBZ/G2z64gVqKnQheWA5KreVLYXCkqKXSEkkA8NqpsLRUL
	ShoRnak2DW8zscLubJlt2/GsiEc0GDAyqmxOIFVC0YSby9BFHICbZhKe
X-Gm-Gg: AeBDievNzbi46OMngQkaPsO0UQk1saACFIKLMItq5wLF3v5x4TtQCivXUZsaIvSxdsg
	dp0uhQcgJjnNNUzJ2Xz+tqxfEcN2mbZsTIStZdZOaG8HB8M/PjXU8E5/E+obJuyBrIRQEo7dsnm
	aMApHJwNMG8ee3PgbSzjUkEKln/a75MA1rMvqeyF8x+/E6qIz97cmhkfeChwD4yngTFD4oKni2C
	cHbsdFTkvcXz/mff9HDLnlFqy66gvzx+izUcFkt8tQ1quFz4RzodDtHiaBcV9C2PDGYcA/M/hKD
	BUXFN41rJ+VhKtsms+zflveXSMju0Rfx0W91hj8mDnXAqzyTh3ZCyw65l+mqQ8i4uYjJNOqunDq
	vko+gdXeLiV31Sf5sPzRuqUw9fHzECBTr//nAvEZF0IYIVAdAawCMtjvsux+RyagsbsJ9g7jUnh
	Ht8pVWGfIk3sE48vvI1K7cpJO/4t/CKFJskhEXcUFCVIh/rO7wV41U
X-Received: by 2002:a17:90b:3f0f:b0:35d:ab26:5786 with SMTP id 98e67ed59e1d1-3650ceb4dcamr5990174a91.19.1777805724058;
        Sun, 03 May 2026 03:55:24 -0700 (PDT)
Received: from shirinkaul.localdomain ([122.172.84.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec027690sm7897479a91.13.2026.05.03.03.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 03:55:23 -0700 (PDT)
From: Shirin Kaul <shirin.kaul11@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shirin Kaul <shirin.kaul11@gmail.com>
Subject: [PATCH v2] staging: atomisp: isp: xnr 3.0 fix whitespace issue
Date: Sun,  3 May 2026 10:54:45 +0000
Message-ID: <20260503105445.45058-1-shirin.kaul11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502082516.16302-1-shirin.kaul11@gmail.com>
References: <20260502082516.16302-1-shirin.kaul11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BC7AF4B52BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60191-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shirinkaul11@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Fix spaces by replacing them with tabs in function calls to comply
with kernel coding style with checkpatch.pl.

v2:
- Added trailing commas in arrays
- Fixed indentation
Signed-off-by: Shirin Kaul <shirin.kaul11@gmail.com>
---
 .../kernels/xnr/xnr_3.0/ia_css_xnr3.host.c    | 29 +++++++++----------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
index e90dea58215b..a3ee8827c44d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
@@ -29,21 +29,21 @@
 
 static const s16 x[XNR3_LOOK_UP_TABLE_POINTS] = {
 	1024, 1164, 1320, 1492, 1680, 1884, 2108, 2352,
-	2616, 2900, 3208, 3540, 3896, 4276, 4684, 5120
+	2616, 2900, 3208, 3540, 3896, 4276, 4684, 5120,
 };
 
 static const s16 a[XNR3_LOOK_UP_TABLE_POINTS] = {
 	-7213, -5580, -4371, -3421, -2722, -2159, -6950, -5585,
-	    -4529, -3697, -3010, -2485, -2070, -1727, -1428, 0
-    };
+	-4529, -3697, -3010, -2485, -2070, -1727, -1428, 0,
+};
 
 static const s16 b[XNR3_LOOK_UP_TABLE_POINTS] = {
 	4096, 3603, 3178, 2811, 2497, 2226, 1990, 1783,
-	1603, 1446, 1307, 1185, 1077, 981, 895, 819
+	1603, 1446, 1307, 1185, 1077, 981, 895, 819,
 };
 
 static const s16 c[XNR3_LOOK_UP_TABLE_POINTS] = {
-	1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
+	1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 };
 
 /*
@@ -124,10 +124,9 @@ compute_blending(int strength)
 }
 
 void
-ia_css_xnr3_encode(
-    struct sh_css_isp_xnr3_params *to,
-    const struct ia_css_xnr3_config *from,
-    unsigned int size)
+ia_css_xnr3_encode(struct sh_css_isp_xnr3_params *to,
+		   const struct ia_css_xnr3_config *from,
+		   unsigned int size)
 {
 	int kernel_size = XNR_FILTER_SIZE;
 	int adjust_factor = roundup_pow_of_two(kernel_size);
@@ -179,10 +178,9 @@ ia_css_xnr3_encode(
  * VMEM Encode Function to translate UV parameters from userspace into ISP space
 */
 void
-ia_css_xnr3_vmem_encode(
-    struct sh_css_isp_xnr3_vmem_params *to,
-    const struct ia_css_xnr3_config *from,
-    unsigned int size)
+ia_css_xnr3_vmem_encode(struct sh_css_isp_xnr3_vmem_params *to,
+			const struct ia_css_xnr3_config *from,
+			unsigned int size)
 {
 	unsigned int i, j, base;
 	const unsigned int total_blocks = 4;
@@ -231,9 +229,8 @@ ia_css_xnr3_vmem_encode(
 
 /* Dummy Function added as the tool expects it*/
 void
-ia_css_xnr3_debug_dtrace(
-    const struct ia_css_xnr3_config *config,
-    unsigned int level)
+ia_css_xnr3_debug_dtrace(const struct ia_css_xnr3_config *config,
+			 unsigned int level)
 {
 	(void)config;
 	(void)level;
-- 
2.43.0


