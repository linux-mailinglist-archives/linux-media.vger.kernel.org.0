Return-Path: <linux-media+bounces-44140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CCABCB77F
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 05:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A32D4405493
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 03:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0B7256C76;
	Fri, 10 Oct 2025 03:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFfugLm5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6892E1EB9F2;
	Fri, 10 Oct 2025 03:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760065571; cv=none; b=DIznOgVTJ6tS8olQ+akR/VGcOV5y777keT3OAagMjTggCmQFXVU8Jln0xbSHhpxCPq2CvczlS7ZxWpcLtCkvVMSWlQXxB5u3VONpreoJAeB8tKG+Cu0Sz/32A5EMxqaZ4pt2FB5gulAqZFEbhhUKsVSr/zEbQozNlFyQXc7TGhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760065571; c=relaxed/simple;
	bh=lVfiq1OSL8S/sRpiegclboUq/wYdhhM+UXtqjZveTCI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rouJRWusr72ccmiyG1HVGP/kovo6VXCupUAvoAJ5jz5bPIbf9L7m66ukoziRS5qeFUPT2lQQPImomT9+/FYGGOw1EGMS/96Y7QSUfH+R5//TGfRBtDv76asZbtxGPmECPCVuj9aG43JqfPzWYhLOBLaNUwvSRTq5CwTn5svvx+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFfugLm5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E85C4CEF5;
	Fri, 10 Oct 2025 03:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760065570;
	bh=lVfiq1OSL8S/sRpiegclboUq/wYdhhM+UXtqjZveTCI=;
	h=From:To:Cc:Subject:Date:From;
	b=XFfugLm5Njy/AiBfQr6jHPytsyF0w4NmutF3J1WVEhIWjUN1b5kXjyZyh0/sbT7Br
	 EA5idOT9LpS7O46M8rKW73cBGsrzkOjJQ6VH/taa+Y16FJv1cKFaBDLhcmTQo2hx8o
	 /uyAY/RGdLVpOJm7crL5yQpxajYs1dTZHS4R/UUXZ0DhCB74lF4CIo0+EvSCJ8/RoP
	 pzNji/xA+ciySzqztWy4/aJGAHDD9mU/dLy9NPQie6S7Vc+ej2jZXo3OlA7oWfcva/
	 gDR145I7hDaXZCxObkOMl1ygRjEs7t7iY88r4XdiODYtvuktTjtMnHcFAr0SKb5b5p
	 mG/5tQV2zAjnA==
From: Kees Cook <kees@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 0/3] module: Add compile-time check for embedded NUL characters
Date: Thu,  9 Oct 2025 20:06:06 -0700
Message-Id: <20251010030348.it.784-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2564; i=kees@kernel.org; h=from:subject:message-id; bh=lVfiq1OSL8S/sRpiegclboUq/wYdhhM+UXtqjZveTCI=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkvKuSNWrd2eD8/WLz4tHTS7bquST47nMOKVeY8irznW rfnnFxxRykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwER2+zD8M73EsirbK8u8O25F 5OkF/x6Em3zwOMxrLXpZOdh6itAmXkaGKXoZP2Intqw+XP96noqUlNWBr1unx+dNOnVIp4/zbVc rMwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

 v2:
 - use static_assert instead of _Static_assert
 - add Hans's Reviewed-by's
 v1: https://lore.kernel.org/lkml/20251008033844.work.801-kees@kernel.org/

Hi!

A long time ago we had an issue with embedded NUL bytes in MODULE_INFO
strings[1]. While this stands out pretty strongly when you look at the
code, and we can't do anything about a binary module that just plain lies,
we never actually implemented the trivial compile-time check needed to
detect it.

Add this check (and fix 2 instances of needless trailing semicolons that
this change exposed).

Note that these patches were produced as part of another LLM exercise.
This time I wanted to try "what happens if I ask an LLM to go read
a specific LWN article and write a patch based on a discussion?" It
pretty effortlessly chose and implemented a suggested solution, tested
the change, and fixed new build warnings in the process.

Since this was a relatively short session, here's an overview of the
prompts involved as I guided it through a clean change and tried to see
how it would reason about static_assert vs _Static_assert. (It wanted
to use what was most common, not what was the current style -- we may
want to update the comment above the static_assert macro to suggest
using _Static_assert directly these days...)

  I want to fix a weakness in the module info strings. Read about it
  here: https://lwn.net/Articles/82305/

  Since it's only "info" that we need to check, can you reduce the checks
  to just that instead of all the other stuff?

  I think the change to the comment is redundent, and that should be
  in a commit log instead. Let's just keep the change to the static assert.

  Is "static_assert" the idiomatic way to use a static assert in this
  code base? I've seen _Static_assert used sometimes.

  What's the difference between the two?

  Does Linux use C11 by default now?

  Then let's not use the wrapper any more.

  Do an "allmodconfig all -s" build to verify this works for all modules
  in the kernel.


Thanks!

-Kees

[1] https://lwn.net/Articles/82305/

Kees Cook (3):
  media: dvb-usb-v2: lmedm04: Fix firmware macro definitions
  media: radio: si470x: Fix DRIVER_AUTHOR macro definition
  module: Add compile-time check for embedded NUL characters

 include/linux/moduleparam.h                   |  3 +++
 drivers/media/radio/si470x/radio-si470x-i2c.c |  2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c        | 12 ++++++------
 3 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.34.1


