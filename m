Return-Path: <linux-media+bounces-55223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFC9BdNtsGmNjAIAu9opvQ
	(envelope-from <linux-media+bounces-55223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:15:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7ED256EF9
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A63B7302B47A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 19:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F81346AF7;
	Tue, 10 Mar 2026 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9rxWBvU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22140DFB8
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 19:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773170121; cv=none; b=Wrr1aqdGaT80K1n2Ut3jaKruL5uRkPNxGETQ+y+erZk8vGjXpk0/GXoCV36ZYZ5wgWms/CFXsWAq8qhG+tDLepG2Wr0LOWZCYaboaN4CcJvnKY6EYmmMIV/6GzlC+pKjDtUnV2h8/jU6MzhBGgBCImHS8xQrDqeeUEx5xQL7SZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773170121; c=relaxed/simple;
	bh=khubhR/tz+wkJW7Jgfi+FWE467NphcnP8NrRFjYmM9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7Z1xfChktZFfTDSgeptobaZxkBZYu5qypEtvJUItIY+ZBt60VyXU07bLdbpTmYjSfflK/E49Iu5cuBZouqFbBJk7IfUbbrS9xSmiTpPmBLgPNT9kfF3Bi8aQnu9g90968JZkVk67LQTADivPUuzrht+KJePoCmdz96e1BaaaWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9rxWBvU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a133b686f7so6232423e87.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 12:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773170118; x=1773774918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kBsVHle5VKFIOQ+pdBj/KNHoPC/WhiJ8MytokdJrbQ=;
        b=c9rxWBvU5Tyj8EykQkSuMtgi8fm9Gd4+p2UfJ82/kV46/rxSxF28z8100UCDQ4Ga67
         TVb+8eQHCpWDFwGESE2nohh4ik0Q8xjhNL+bNnDUu6QKEr/8U9182qXxmUtrTnMYdMeA
         2x2f1kvexi8wPVTOQZtGZWf0F9hiGkhasFAbrYwWSGIT4yLp6osb1xfTCRNCM/hWI9Sh
         dVlgBtoN7/xbU1rfkF9FT3haQcFsILlGN3sVUXc4780nYbOTi6L5krZsNuJoC9feSjhd
         GbygO7L5QIDL3EAzQpcm2Up/n7yk1U6g+JYu4lgq3lZCS2TMjyVGefOeyuV6mIh5V/lT
         +dMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773170118; x=1773774918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+kBsVHle5VKFIOQ+pdBj/KNHoPC/WhiJ8MytokdJrbQ=;
        b=JWJ92t1AC5jICMgslctNqOkQjKhnUuHXeixMBXO875FfpNXp6AEgbXvVNSDz6muXmA
         63fafyGksrQVEDw93bgxE+PhDW0uaN+Qbz4PPX742XjK8XWcfIDKb53Tpj6nbTW+VB1i
         JQgkv/mmeIZS0yWkDvqs85QGTcWF9N2wdtqYUHx2y/GgN2P79gjnwaBauJHa4JC3XUMH
         AGqUhBtn0vvKOuORtSxCbAYvILK/Kk2ya8O8xAadRIrhkpWKW8emhmL/stlkRTGZDY1K
         K7/saYeONWe+QUbn4QXZ2mg45jEDxXOPVcu9jFten9W4XcLnvbcrpNj7U4diRq6vIA8D
         3TuA==
X-Forwarded-Encrypted: i=1; AJvYcCU1GyAq/QnbfNuqgtcSv9xEEdN7VZeknkcYPQsxQqCVqmQUw01ncPPfsmIvpSNGUF+rG6cjxBMF8q5eig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWBfe1RBpr9RnsIe1EOX7Enm3F2d6kE5MpNEZp83Yvi8e+XQ/I
	BiL88ex8TvT2lGuRSnLerSoW+VDpKcOXtkkK0DfPCpCiymdKPfGF+1SO
X-Gm-Gg: ATEYQzyZLMvHv0CPdLSEMoRVHwmhYzoA1gYQKG6xI9geRdfdWrjCJrx4q1tdNtij7og
	gSM7mqbDRQOogqoSMrQVXIqWpHFm4DNvdUBrutmcmBPsXaAn/nZu6GtF32MVXqoDq98lqKcYHdY
	8CjrT7vjBnIOogfRDAV1cJT+/AAIM9NnrQC4jY3xSliTNrzaTa8SDdO6HZT+gGSXwb1tq8lwqOM
	MUGQxiBiBfWtQEFNN/XayRG+MmxriYymItcYTyOFU6n/FYwdPgf7siyBQAd8fXzlCqbyeJnfNbD
	GLi46eNl3Ag2pfCflFrWClnu54OHkyIuE0D7NreSyx3gbzI/5m14/HfRThlWTYNsIFRhxsTnzMs
	eOYhk7h8yyT0kCBNT+cC8oO+AZlcvIYaaqyhgCR0/bdQyf2A4jR8thU9IhZX8dxHNz4PaJfVoc+
	C+vXoRoYX1Rccj6P3VFcg6vmtK9lnPBpOgEOdtomE1Wf/JjXynOxech1EC7H/ZsTRIi1dQr4/ZD
	A==
X-Received: by 2002:a05:6512:64eb:b0:5a1:3b7d:6959 with SMTP id 2adb3069b0e04-5a13cce1786mr4174877e87.36.1773170118122;
        Tue, 10 Mar 2026 12:15:18 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a154269e00sm34271e87.10.2026.03.10.12.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 12:15:17 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: fix block comment style in circbuf.c
Date: Tue, 10 Mar 2026 20:15:02 +0100
Message-ID: <20260310191502.1354-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310151620.905-1-rayfraytech@gmail.com>
References: <20260310151620.905-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1C7ED256EF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-55223-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Fix block comment formatting to comply with kernel coding style:
- Move text from opening '/*' line to a separate continuation line
- Add leading '*' on continuation lines
- Move trailing '*/' to a separate line

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../media/atomisp/pci/base/circbuf/src/circbuf.c     | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index db0b76ea4a29..51bdfe64491e 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -186,7 +186,8 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
 	return cb->elems[pos].val;
 }
 
-/* @brief increase size of a circular buffer.
+/*
+ * @brief increase size of a circular buffer.
  * Use 'CAUTION' before using this function. This was added to
  * support / fix issue with increasing size for tagger only
  * Please refer to "ia_css_circbuf.h" for details.
@@ -205,7 +206,8 @@ bool ia_css_circbuf_increase_size(
 
 	curr_size = cb->desc->size;
 	curr_end = cb->desc->end;
-	/* We assume cb was pre defined as global to allow
+	/*
+	 * We assume cb was pre defined as global to allow
 	 * increase in size
 	 */
 	/* FM: are we sure this cannot cause size to become too big? */
@@ -215,11 +217,13 @@ bool ia_css_circbuf_increase_size(
 	else
 		return false; /* overflow in size */
 
-	/* If elems are passed update them else we assume its been taken
+	/*
+	 * If elems are passed update them else we assume its been taken
 	 * care before calling this function
 	 */
 	if (elems) {
-		/* cb element array size will not be increased dynamically,
+		/*
+		 * cb element array size will not be increased dynamically,
 		 * but pointers to new elements can be added at the end
 		 * of existing pre defined cb element array of
 		 * size >= new size if not already added
-- 
2.43.0


