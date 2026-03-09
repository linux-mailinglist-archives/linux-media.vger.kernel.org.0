Return-Path: <linux-media+bounces-55019-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFdlMSM9r2mDSgIAu9opvQ
	(envelope-from <linux-media+bounces-55019-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 22:35:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD2F241C71
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 22:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82ABF3195F46
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 21:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2437536AB5F;
	Mon,  9 Mar 2026 21:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hW49fdlu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBBE357A3F
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091845; cv=none; b=T93oB3yh3P5oKr2tNVCZXIVW6iK7vu+5toZkBvzQs4rYiWlW5eKuUJ8rQG8lbRbclIbKoYpMAuO2iqfznc/rc1VqT/mshhswW/e7mcZLhbi+3vbj3oKH+Q3J0lF/jGMOlLgOyS77IO9OKmvPzBkOh6vuERkqjdlojUyXtzg2oPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091845; c=relaxed/simple;
	bh=yka7phzLnONh6hl9LHa4rhg61vq9mVyx09pSbZVKhmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jiEzu5Hw/1oWLn/8nYCCfjC0eCmKK3TufhGifd17sL5C/hd+erOb+YT7V4RDtO4mwYtdroB94LhWymsPoUWgHSKUY++5XO1vt2U/eUsjZxlE7O5nzy2GjioYLhaMoNArBMYW6Jw1WfHK1RPetxQ8RmEwaDneGF64ocaXamxm6D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hW49fdlu; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a46657a9fso23362281fa.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773091842; x=1773696642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUXcmvYUC1iJtrOU7nBokPHcMTtgoScFkvovIKTazVc=;
        b=hW49fdlui35cvy71Vm8+v026atoHtJz2MSX00F5RewLDv8y9R11cCzrb76A+wvtETG
         8brzftfJ/ImT/HXSIIPYbEcjXD+gigVR55V0g6RVWKgMD4t/rfIaWRHKtXSUgX9/X5TJ
         qafO3N6UXIHr//OpZNlO6ciGqgTd/rBNdsP3RCWXNv4IYMTeF1wAPQPBggZknEHMByJo
         kyi+/pGOMxz7u+txxNec5823QjtAXnyodECAdDJeAqNYaETnDdyBbbsjY6n9sijI6Y4U
         rz/ZCsTU86CSYaoj+lAe93ZmxUSTUSL0ntkbbAd/Wh/tFP06UgCrXhnYbQ0C+K/4d2Os
         px0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091842; x=1773696642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUXcmvYUC1iJtrOU7nBokPHcMTtgoScFkvovIKTazVc=;
        b=ZknFOwvUWx7VpoeMJzS126ld1SWrw4GF2k0VlJl7cvAT6w4ygZwH7o6ZEd8F6ttHJu
         fAfOrv0NP6+wtVnl0KVHUUIvLqs9QnVPJ158WTDoMVEUZsdYW6zBNix++JDfQNislJFr
         pk7bfjsXz4oyIPlPb++Zg8+Ho6RrwuzCOnd3p7pN92uULPXFZ3bq95N0Z3ky03KMYMZu
         5sRpDcN1jjfIL3nCSoVHhm/DNH2WAfN5CVGtLtBRUlKLJZOvQNVsyydT+LH1Z+5Y9YK+
         7u4juSZ3XTSC9hnuLutHjT70pzUeOU047g13CNTnjKvUL4pLwL8NwcuuVs1pkAuv+aki
         MSHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfHAsqkksRBis+Vx48v9Dk6bEXowrayPr4mU6GRjYP5Bu6lnh9HRZ8yi0ciuPVHeAslbQ59lm/BslAUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTdZsqD7edIwnrP6wxG+DRglR9B5uXKEVEFRjBMlHCf6h8n+fD
	LDjFjoi5S8tsWEoMxEwTswFIqo2hhoUK7JfaYf8RBwOGli1v6KWVF5Qq
X-Gm-Gg: ATEYQzx6siW/KKUJciC6xSXbJKWbdPEuzoypspT4h+KiMFu3AqCCqmMV067odVaRxX8
	yh1DpiiEdKaLjsxp1gZ4ie7days4wWvdz2yP/rzufQ13yP7o+wZsuwTUpGmmSxx3y4YfuIagtOa
	QX75m0zfkodcpNBwqxuV0Byph9bGBCHN2wmUzjI1koidZa/iARI1G4XSnzk+EnthbYMAZ9bSzqW
	TmTibQpa1Sg0RR0fOXYZC4OwPLPIubaT/NgxEwxHo7ND2rgBXIgPdUkL8+S2iRBmvTelzggYNG7
	2HjqiuszcWp/xUge5IY9eXv5iciHv3dOZZu8XUfYiJuMxbOdWiU0g5m4deJXSY2sGI67EQzWJWA
	uHFKshOQiFo9Hau92XJtEhLQatdLFJwreIPkAHhszc1aU0COXX7qFwRVwUdI8Vy/z3lynTgxEhr
	f9PUvst8t86en2y3tZ24zUCZaTMmCnv65GZh0HRBpW3zPfEdfLToOeHHJsZb++Jp3J9J4x1R4lx
	Q==
X-Received: by 2002:a2e:bd06:0:b0:38a:4106:5147 with SMTP id 38308e7fff4ca-38a410656cemr35586661fa.14.1773091842115;
        Mon, 09 Mar 2026 14:30:42 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d046d27sm1243231fa.28.2026.03.09.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:30:41 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: fix block comment style in circbuf.c
Date: Mon,  9 Mar 2026 22:30:24 +0100
Message-ID: <20260309213024.5733-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6DD2F241C71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-55019-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../media/atomisp/pci/base/circbuf/src/circbuf.c  | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index cb34d0b5abb5..db0b76ea4a29 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -192,9 +192,9 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
  * Please refer to "ia_css_circbuf.h" for details.
  */
 bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
-    unsigned int sz_delta,
-    ia_css_circbuf_elem_t *elems)
+	ia_css_circbuf_t *cb,
+	unsigned int sz_delta,
+	ia_css_circbuf_elem_t *elems)
 {
 	u8 curr_size;
 	u8 curr_end;
@@ -206,7 +206,8 @@ bool ia_css_circbuf_increase_size(
 	curr_size = cb->desc->size;
 	curr_end = cb->desc->end;
 	/* We assume cb was pre defined as global to allow
-	 * increase in size */
+	 * increase in size
+	 */
 	/* FM: are we sure this cannot cause size to become too big? */
 	if (((uint8_t)(cb->desc->size + (uint8_t)sz_delta) > cb->desc->size) &&
 	    ((uint8_t)sz_delta == sz_delta))
@@ -215,12 +216,14 @@ bool ia_css_circbuf_increase_size(
 		return false; /* overflow in size */
 
 	/* If elems are passed update them else we assume its been taken
-	 * care before calling this function */
+	 * care before calling this function
+	 */
 	if (elems) {
 		/* cb element array size will not be increased dynamically,
 		 * but pointers to new elements can be added at the end
 		 * of existing pre defined cb element array of
-		 * size >= new size if not already added */
+		 * size >= new size if not already added
+		 */
 		for (i = curr_size; i <  cb->desc->size; i++)
 			cb->elems[i] = elems[i - curr_size];
 	}
-- 
2.43.0


