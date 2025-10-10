Return-Path: <linux-media+bounces-44142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DFCBCB794
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 05:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D922C4F37CB
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 03:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0C6257841;
	Fri, 10 Oct 2025 03:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUnB4Lws"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D66230274;
	Fri, 10 Oct 2025 03:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760065571; cv=none; b=AsGBwm7hxdhTSbIhd9zLKBnUUig09VXIEisgB8xk1hrTItHZWmqZxIrG0DeKjNoZt3KPCu252jcJ7vKJ2Ec6Oah8DJa0Dr6O1/YuY0QauVxNKsD1ZgICiOm34tc8bkODBs9EwyqSUDgaylqTejbRwIL50Gh8I49vpanhp3HE2lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760065571; c=relaxed/simple;
	bh=Yk+IxpgFDi/O4uukQndL+6GJ8/MJq8TqjyKcdlLgPso=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YknOdfgdQRAhuXBMjijRB2iekd8E1A+UHTpOGS+QgSdPtj9pGzcp1C6aBq9d0ZE9snI2WddHDM3WemPjpeZzvDBtwoA3gIbTl4K6BvwH3oCRFQWGBie99xNogl3+jqruXqcAhuuRQ8vRBV3o7Ru5Ty8em3TQhnKsUuBZz4XolQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUnB4Lws; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAFAC19424;
	Fri, 10 Oct 2025 03:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760065571;
	bh=Yk+IxpgFDi/O4uukQndL+6GJ8/MJq8TqjyKcdlLgPso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eUnB4LwsHHoQnJRurWn0xGZ0JOWwXMwsuyTpBETy6XXPBd1nDZoKhKfpgyQJ2hkmn
	 5okw5UYuWsfPmgq429Exx3CIU48s/psB4QPPkXafRIQ16ruimkrr8mYkdP+5tFvJCu
	 TevM+ceO4ZEgE+4l88mWJne7Uko7T/+uPXlKJ8MoT2otJnS8I6DNAghV+iVHQTUuhR
	 p7O28UvQ0s2FpYa5LYXax5d4dpWfQiTlQS4kLJ3HPQcKu7tsokp7kfDO8fbVDD4bVq
	 dVE4FE8ae29cxKm4JA8NaCAO854lpySwre7lY/QkL1pc739F1/Prt0vDjVwLEr6ZC/
	 7FblcJ5pHI8sA==
From: Kees Cook <kees@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-modules@vger.kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 3/3] module: Add compile-time check for embedded NUL characters
Date: Thu,  9 Oct 2025 20:06:09 -0700
Message-Id: <20251010030610.3032147-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010030348.it.784-kees@kernel.org>
References: <20251010030348.it.784-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2355; i=kees@kernel.org; h=from:subject; bh=Yk+IxpgFDi/O4uukQndL+6GJ8/MJq8TqjyKcdlLgPso=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkvKhRWrFv7qexHUptWlfF3/yhvZc33n59/WPLby+DFP hZR+07BjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIloCDL8dzv9IKGhZk3TRFfL 1XVPqzcoTL0Ve36tUmvrqc8rHv0/dJHhf7GmzO9Qw8DDmxWnZedkadR1puwJ2/Jz0puk399iO5O 1mAE=
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

Add a compile-time check using static_assert that compares the full
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
index 6907aedc4f74..915f32f7d888 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -26,6 +26,9 @@
 
 /* Generic info of form tag = "info" */
 #define MODULE_INFO(tag, info)					  \
+	static_assert(						  \
+		sizeof(info) - 1 == __builtin_strlen(info),	  \
+		"MODULE_INFO(" #tag ", ...) contains embedded NUL byte"); \
 	static const char __UNIQUE_ID(modinfo)[]			  \
 		__used __section(".modinfo") __aligned(1)		  \
 		= __MODULE_INFO_PREFIX __stringify(tag) "=" info
-- 
2.34.1


