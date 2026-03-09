Return-Path: <linux-media+bounces-55020-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEoVNt9Br2mYSwIAu9opvQ
	(envelope-from <linux-media+bounces-55020-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 22:55:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57600241F69
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 22:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A3F83030740
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 21:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D8636DA02;
	Mon,  9 Mar 2026 21:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml6aocSG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A5734B197
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 21:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093335; cv=none; b=skf7JT6Msv6/5cB62K+qC8fQuJYER6eDokFdQ91I5iVG/zOilgyFUpoZ1Vq7R2GXcRuehKeqpmISBWIBA7y33vitJJa8XVb8Wk3GFk/nnl03mZ2ZyI5kuanyTr+3GJ3geb2e049JoEEHmf2vtZL4e/XwbxdkYh79nN7OTsHjqJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093335; c=relaxed/simple;
	bh=gRGiHh5DV1Y4zNvyBsX0nhOwV2mP2uCGq4Xk13dFc6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUkOIioHeQxmzj7WuW6j1pjDl2KK9bmzIiMLUDvTQUEQIQtjN8VrEPjLpPXNNoW2q0WyTKil9UCRkd5qWYRZMuo3+NjU9v8SCd3v5C5IszxrpjYu1Kj9AuLwIxJR6fc11k31ofAI7tV7KhS6rh9OXSLfUU8+y5gFlAJAG7544wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml6aocSG; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a2e62b893so45941011fa.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773093332; x=1773698132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/kta3o08Ez8GWQWGgrupQOAhVskQNRKkeibLAq2u1g=;
        b=ml6aocSGfgAEEEubm5uM5rEEoKBcPe0st0q2Epx4PKLsxaIVgs0TrHIFdf17fudCXF
         SISBOvE60haKd0w5CThuJsTmVHmExlqqtDXd/UuBo+zqn//8ueJI+XI83NdYgiOM5+tu
         UIo64U0p94F6oKOynSWTW7RLEwBiuiG9YEo1WupPlJCIfwzEtA8GZHARcAV5TWwvr2s+
         t0X9cJr4DIS6rgECspzeIIl/JWenJzl9KD2TNaUjtJjMkdyLqCsoxCk7p2duVbiJMy7E
         vBaVSAvuATvcSqpzuez/FKI7o3zyb0KT+KxMdqAsGMgt5Uq2FljHZbqeeixXfOEvXCub
         I/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093332; x=1773698132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/kta3o08Ez8GWQWGgrupQOAhVskQNRKkeibLAq2u1g=;
        b=s0QC2OnX+NcBPaEK7xNY6gak1eNv+uVtaMCF5gfZTaXlDlZbtHRjrzCPKsjIpDuGRT
         u/c5KSBTRZOJcSgy8m4ULhmjMoW7cCLp+hG8m5A/TSkSuH2Z//fKibMQlAZKWI0oGgCd
         uqzGS4+REnIcbB8ynYpld4y7zpBF6GTUqCJ4gUSLMCfcKWcOhL19r55y15I27R20mUeN
         ejkoFx61qdMkxB5mVrqaojs42evxcT3WkOPA3k8BEzoDNoKj3mkwHiMdcY+gG+RbO5ea
         ZVFw7C/3lleCr7xT17V2QP6TCfn0zy2P7LzSpNsFYfStDv/gtfo3D04KnvGAUiB68RiU
         +2VA==
X-Forwarded-Encrypted: i=1; AJvYcCVcitYnxxA40SQo+ApyW8/SJrW8GJH0i0TlkeBWbAPBqdUOPTpzgSAJ3rzvoFzqsuxeMmqYxfwLUu8XwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3JGOTrmF8rEFDcQtBPYb6ZdGGyOc/HUbrziH3LlKd6OceOn8k
	k/0qiCx/NJRj8LERLN0ieQ33znth2+KcxjuTtVQ0fJEuaGChCFK6T7ehp7lw3Q==
X-Gm-Gg: ATEYQzxa9PRl0neXWss6OzLxGabpu8PY+V5cnMEuRsuZ76Qa9gkAkXlZLHhveo/OpW8
	QcaZmh34YQgGnnw/AxyIDoku9bQCb/3vCYm8ZUSpHytNcSdEG7LVRZa3CBrzzBEw42k5Ep2cbRd
	YwC9y+OmU2hZsZWDZqdNi+sTIsSR+IByQyRrbTTpFhNwjMLR18r0U99p6b9TZDqnCkDxQROAf/y
	UE/eQ8VtpNRn/xp0Pdh5Rol4tzpVH/jzucAKawtg3qWjbSprmj/ogkd4MJQ0oH79ULufrcuplqL
	vmp5REJclotqsMubbTv17ZLbtDGebznpjW07ccSaWGC8ssoWrfC1VYlBrCaRZyc8LN1bf3hKMIO
	WbZORAiHvqxNjkUEFRc+K5ckqoBdZ/GKYv/EtNv0Uzhtn5lIU2rtlfB8AOZ7Hay9Ywv16r8x90W
	mIud40kI9km+1UBv51FzCteBkaa4El2wypYzIvoBwHcllhQWS1MaJWbz/vzmeFv83XmYuaQCbKf
	0NbSbeqU1B/
X-Received: by 2002:a2e:a5c3:0:b0:38a:292e:b3f4 with SMTP id 38308e7fff4ca-38a40d9e6bfmr38028031fa.27.1773093332312;
        Mon, 09 Mar 2026 14:55:32 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d072320sm1581821fa.39.2026.03.09.14.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:55:30 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: fix block comment style in refcount.c
Date: Mon,  9 Mar 2026 22:55:16 +0100
Message-ID: <20260309215516.6091-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 57600241F69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-55020-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Fix block comment formatting to comply with kernel coding style:
- Add leading '*' on continuation lines
- Move trailing '*/' to a separate line
- Remove unnecessary braces around single statement block

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../atomisp/pci/base/refcount/src/refcount.c  | 29 ++++++++++---------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 58e4e3173b40..00e8a73f413e 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -16,7 +16,8 @@
 #include "ia_css_debug.h"
 
 /* TODO: enable for other memory aswell
-	 now only for ia_css_ptr */
+ * now only for ia_css_ptr
+ */
 struct ia_css_refcount_entry {
 	u32 count;
 	ia_css_ptr data;
@@ -93,14 +94,15 @@ void ia_css_refcount_uninit(void)
 			    "%s() entry\n", __func__);
 	for (i = 0; i < myrefcount.size; i++) {
 		/* driver verifier tool has issues with &arr[i]
-		   and prefers arr + i; as these are actually equivalent
-		   the line below uses + i
-		*/
+		 * and prefers arr + i; as these are actually equivalent
+		 * the line below uses + i
+		 */
 		entry = myrefcount.items + i;
 		if (entry->data != mmgr_NULL) {
 			/*	ia_css_debug_dtrace(IA_CSS_DBG_TRACE,
-				"ia_css_refcount_uninit: freeing (%x)\n",
-				entry->data);*/
+			 *	"ia_css_refcount_uninit: freeing (%x)\n",
+			 *	entry->data);
+			 */
 			hmm_free(entry->data);
 			entry->data = mmgr_NULL;
 			entry->count = 0;
@@ -173,7 +175,8 @@ bool ia_css_refcount_decrement(s32 id, ia_css_ptr ptr)
 			entry->count -= 1;
 			if (entry->count == 0) {
 				/* ia_css_debug_dtrace(IA_CSS_DBEUG_TRACE,
-				   "ia_css_refcount_decrement: freeing\n");*/
+				 * "ia_css_refcount_decrement: freeing\n");
+				 */
 				hmm_free(ptr);
 				entry->data = mmgr_NULL;
 				entry->id = 0;
@@ -183,7 +186,8 @@ bool ia_css_refcount_decrement(s32 id, ia_css_ptr ptr)
 	}
 
 	/* SHOULD NOT HAPPEN: ptr not managed by refcount, or not
-	   valid anymore */
+	 * valid anymore
+	 */
 	if (entry)
 		IA_CSS_ERROR("id %x, ptr 0x%x entry %p entry->id %x entry->count %d\n",
 			     id, ptr, entry, entry->id, entry->count);
@@ -221,9 +225,9 @@ void ia_css_refcount_clear(s32 id, clear_func clear_func_ptr)
 
 	for (i = 0; i < myrefcount.size; i++) {
 		/* driver verifier tool has issues with &arr[i]
-		   and prefers arr + i; as these are actually equivalent
-		   the line below uses + i
-		*/
+		 * and prefers arr + i; as these are actually equivalent
+		 * the line below uses + i
+		 */
 		entry = myrefcount.items + i;
 		if ((entry->data != mmgr_NULL) && (entry->id == id)) {
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
@@ -238,9 +242,8 @@ void ia_css_refcount_clear(s32 id, clear_func clear_func_ptr)
 				hmm_free(entry->data);
 			}
 
-			if (entry->count != 0) {
+			if (entry->count != 0)
 				IA_CSS_WARNING("Ref count for entry %x is not zero!", entry->id);
-			}
 
 			assert(entry->count == 0);
 
-- 
2.43.0


