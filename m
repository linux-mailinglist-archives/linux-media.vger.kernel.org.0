Return-Path: <linux-media+bounces-55204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHgvDo0+sGmohQIAu9opvQ
	(envelope-from <linux-media+bounces-55204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:53:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C100254070
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 134B331B22BD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7972D199D8;
	Tue, 10 Mar 2026 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEN1WH3/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDBB2EA754
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155812; cv=none; b=LpA8dm1fjGKbOVAou4JCDK0IBKJwC1LVnBDiAI+6eeFEKaqJOpcaMGYqvyIKw9tXPt1klEWQPXI4BGGeIKPEfxHFmfSQJLfFMfGCg2dTplnph37x3kwWmJoDLdOuy9CgW048k0u5PCUCcMCT0rvq/oeHnqQh1Gc7gR08bzFk/8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155812; c=relaxed/simple;
	bh=JY4siVVVZNw6dLN+yhSjmXaYBYaIqrpsP0bqJxBhQlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbtoQK7DpHNRj6GS3IZG6MAk/o76YzABUFXhyvvoi5l7bigjvTCY6m9CGZFzodC0vwgnq8s1iOtUtY/MDXDotM6Ai/Zt7iAZUO4C3aFeb3GW/sufmXmB+ZCjjVP/REiEZgkXQZM6s1mOJKJ3648IRwUFrAvSgX1Rb/WGcTqnybw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEN1WH3/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59dcdf60427so7951316e87.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773155809; x=1773760609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgFBQGsuaCat101Xr/8EJ/BXTvPaV1AbFX/4sWHX6pE=;
        b=gEN1WH3/GvIT8Lad1lGkt7csGigzOMHM/0OtNGi7HqjPt6zeQnznDZEo8oDME/zLRA
         asb8YVAuF70pjhtx/2t9RxLCdxuWLHEj0G+T7iGPPBnFveHpe/ThDcqjDsVd87fI3ZbC
         HzAnn7SVdNtov9rzdj8ffp6xj+QsTMg29nqPpKlSXWmeC16eOQovFB1D6h9vO5m6DN62
         RAVJ3woQVWG5twFWVkllMloy7H6XQqxCSdHRq/x3z7FajASAV8y2woKkKlMXKyaiAdfT
         2RR5joAC7AQ8tIlIQQ2koonvuHiVlUgbXStMx30JR3toTKFc1pxPzb6fwKNc8MPOZyGv
         mEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155809; x=1773760609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HgFBQGsuaCat101Xr/8EJ/BXTvPaV1AbFX/4sWHX6pE=;
        b=Fg6YQXn2jgzCWvdlw71qMlvi2hWBX3j6ptyyNgyioRtY755ewh96RU6Kexw9zaVV94
         TF5UuYK2KfC0RiGAslURIwSYb/2G8+TNbmQh1JiglnFHfhOlkzbSbzi2feQHZEnAp/uS
         +HVMksJjEUAcmh9CE2GQ8RKIElcPfX4FGHk3g1rep29fl4yggh+bykbDEL7hpCtdzKt/
         EBKRQv0u8jYoWKBmWlvjE6OXEwYqZ7kWsY3XcrxcEnmUowLfAgrwR5ylndmzSCLd6izz
         QxBWaXw+QlO7SQaW+mWEOY5kBJ4YtgQz6XO8K3vvuqRvVyLvQaXWKfLMzIOuLCNXP6/n
         IJbA==
X-Forwarded-Encrypted: i=1; AJvYcCVO9YJNV7IDKD/QuRFYS5Q0urT8kWGxNG/x9JuJWbOeC0ccRdKo3fNLp84Yq5ZLQEqulMgHfEbI8j4kWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRl2nYGcP2di/ecq7r3tYCJeYBxrFGhwFI7F8J8StjqTxey10+
	nXVuMNaKobe6mGnEM44XX5eop/0PkAElZls4hPLrUuvYexeNXaowpIT9
X-Gm-Gg: ATEYQzyfR3X6N0nZn/XN7zaVFPPtVoWay64DiExz7KiFBEIRndS6VinXI4CUCsEX/Lw
	eAAjN9rpZT7eXMLycIayV3208XPX+juYuJOso3i4+veNfwhbRPqY3xmTUIfUQB2133mt+JO2VN5
	1TBtEzUvRicG0gwT4wkg/jp2njpFu25SuwE+1Al7QpOa//vm4PboaZqxpiuEqUwroVX16x98erZ
	iGZhE8lmPQ55IxhBhxNGfPHKInSWQFgs7EwLisvXtdvVUw30Z3ZPukhhb1BxmM5rxPKFuzlcShd
	lX0bIb1kRAs2Xwbdnq70rqBethfFkFFH2Dg1bwcFSr7HVBC28AHi37lLBPdJ0qs10+Qa/8yEled
	ILqonelPm/5O6D76JYb56Spi6vw2nCoLfVUk1b7iI9duGTsjeEpZxa9CA0XLKct8F2Ior8EAWNX
	THGbRKw3FHyyLaf0940Tzk+EIDi7GsQNXUi0eIQ0+kg9oBUF8ZKNOZSJw119ALbmDs
X-Received: by 2002:ac2:4c4c:0:b0:5a1:3eed:9a3b with SMTP id 2adb3069b0e04-5a13eed9c10mr4105426e87.23.1773155808415;
        Tue, 10 Mar 2026 08:16:48 -0700 (PDT)
Received: from T6NXCV08J99224A.admin.jenseneducation.se ([185.154.228.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cd2dsm2812165e87.10.2026.03.10.08.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:16:47 -0700 (PDT)
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
Subject: [PATCH v2] staging: media: atomisp: fix block comment style in circbuf.c
Date: Tue, 10 Mar 2026 16:16:20 +0100
Message-ID: <20260310151620.905-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309213024.5733-1-rayfraytech@gmail.com>
References: <20260309213024.5733-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C100254070
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
	TAGGED_FROM(0.00)[bounces-55204-lists,linux-media=lfdr.de];
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
- Add leading '*' on continuation lines
- Move trailing '*/' to a separate line

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


