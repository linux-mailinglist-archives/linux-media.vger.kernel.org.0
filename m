Return-Path: <linux-media+bounces-43891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFB7BC3439
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 06:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C823019E03EA
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 04:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920E02BEC32;
	Wed,  8 Oct 2025 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vv68HgJE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3DC2BE036;
	Wed,  8 Oct 2025 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759895978; cv=none; b=QKNNI6lcPxlYpI/MSkHO2+UKoYCDJRRNNWJO0qoKJWwGccPq4CH9siOJQQLgmNINYzqIq0ksrhRsyfzET6BdKdHVm+6nCE16Cox+SzHSi4Plpkd+iO6Q5XapfXmOuNlr39ni9JWIaTKVg3EuggDPzBkYZJpoaywuBlaqawKS95o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759895978; c=relaxed/simple;
	bh=/WAB5MfGBmvDQJ4UC5RStzDxPybbW2rZG0FUWgjN0gw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=htJMMPFPHhEjIrtlrMTR7cXRhXzF8t+dOEc8QNZHTi9Zx0Zrodzx8BrT0LDU+IBpB0VjpnIr2Kehze6RU0ZIgSDGI292SYUtvc6hw2/a3xMpSOwIV4bymjT+xz2zCAqhm/ctNr7PD0PwnzLA/oDOZWUeb9Su4VG6y76TQeYTwF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vv68HgJE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71941C4CEFF;
	Wed,  8 Oct 2025 03:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759895978;
	bh=/WAB5MfGBmvDQJ4UC5RStzDxPybbW2rZG0FUWgjN0gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vv68HgJEsyCeLlY8CO4rpXYMTZapQDaiwnzYkzOfGL29Dn3s6aStlzvCbpwhrBlL/
	 CfWgaTDopGP1F6nXuYhlbbn41NqciR20Znai7B9MwubAibXGr9Dz/9EMD7IvkidBVK
	 nwvVFT5cpF2QVG+TqTzqGmQ4zmxJGqi70XndFFiM2/f57IVFlUWLu8zk34X6LfMC9N
	 HVsmL3cxSshslfXFudgva2eG15BipiayRAiWJseHZX04CifVTjVoWQ9Q/kCfGc4QXt
	 nz08kCPJ07Wth2JBr/t8Haklzb4OxnTBZH/gOursbDQipObCMGg+dYGBMT4bpC0bEa
	 8JBCa4fcAtArQ==
From: Kees Cook <kees@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-modules@vger.kernel.org,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH 3/3] module: Add compile-time check for embedded NUL characters
Date: Tue,  7 Oct 2025 20:59:35 -0700
Message-Id: <20251008035938.838263-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008033844.work.801-kees@kernel.org>
References: <20251008033844.work.801-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=kees@kernel.org; h=from:subject; bh=/WAB5MfGBmvDQJ4UC5RStzDxPybbW2rZG0FUWgjN0gw=; b=owGbwMvMwCVmps19z/KJym7G02pJDBlPHy7beiD4Ye+RjYysL/hj7gZ84zy1yMJs5jQdha1RK 7UXnZ0Z1lHKwiDGxSArpsgSZOce5+Lxtj3cfa4izBxWJpAhDFycAjCR7L2MDB8vy8zWENNNkJ6l kDW/8JyFxXLLUI5uj105ImpJyRc/7wCqEFluxNv3JOZG473PE7o1t+8W6/mkvqlCdoZ1xY9HiZV cAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Long ago, the kernel module license checks were bypassed by embedding a
NUL character in the MODULE_LICENSE() string[1]. By using a string like
"GPL\0proprietary text", the kernel would only read "GPL" due to C string
termination at the NUL byte, allowing proprietary modules to avoid kernel
tainting and access GPL-only symbols.

The MODULE_INFO() macro stores these strings in the .modinfo ELF
section, and get_next_modinfo() uses strcmp()-family functions
which stop at the first NUL. This split the embedded string into two
separate .modinfo entries, with only the first part being processed by
license_is_gpl_compatible().

Add a compile-time check using _Static_assert that compares the full
string length (sizeof - 1) against __builtin_strlen(), which stops at
the first NUL. If they differ, compilation fails with a clear error
message.

While this check can still be circumvented by modifying the ELF binary
post-compilation, it prevents accidental embedded NULs and forces
intentional abuse to require deliberate binary manipulation rather than
simple source-level tricks.

Build tested with test modules containing both valid and invalid license
strings. The check correctly rejects:

    MODULE_LICENSE("GPL\0proprietary")

while accepting normal declarations:

    MODULE_LICENSE("GPL")

Link: https://lwn.net/Articles/82305/ [1]
Suggested-by: Rusty Russell <rusty@rustcorp.com.au>
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>
Cc: Daniel Gomez <da.gomez@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: <linux-modules@vger.kernel.org>
---
 include/linux/moduleparam.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 6907aedc4f74..160f1678fafa 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -26,6 +26,9 @@
 
 /* Generic info of form tag = "info" */
 #define MODULE_INFO(tag, info)					  \
+	_Static_assert(						  \
+		sizeof(info) - 1 == __builtin_strlen(info),	  \
+		"MODULE_INFO(" #tag ", ...) contains embedded NUL byte"); \
 	static const char __UNIQUE_ID(modinfo)[]			  \
 		__used __section(".modinfo") __aligned(1)		  \
 		= __MODULE_INFO_PREFIX __stringify(tag) "=" info
-- 
2.34.1


