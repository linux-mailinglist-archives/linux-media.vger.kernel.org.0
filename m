Return-Path: <linux-media+bounces-43890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D23B1BC3436
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 06:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1A1319E01BB
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 04:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8788E2BEC2C;
	Wed,  8 Oct 2025 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PY1/AsgV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A1D2BE035;
	Wed,  8 Oct 2025 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759895978; cv=none; b=UbQ0LhISUDUtYWvsYHrVAAt9Tu7rvDhMqWS9RVIF2oun+AnrxtGKc+n0cFE9VnjwMBHV3SJsGfyR8CcF07UlN68F7zBCuRBvEFYQntl304sDSARveSox+lHx2DagXwvJ7E2AjKEbjho5arJ9PevL6ieKsldR9Xq2WDZVqlHFiFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759895978; c=relaxed/simple;
	bh=SYBRK9Is6hze7pc/EZVMKBQ2vZCW72GwF2tZk/9Hvxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X/Uzpix6nYn++O110Qu20DP81DmLAodNHAK4U+0JILP6GzjZWPbWaeH9vXpc6zv61gpssGCka60MnDzfIxqUSZ2ZD9GhKjpTvoOE2H2gqBAtBnwZsvzPYp7Tkl+54J54rv0s82HAJCKnJ6bU4pQTZ1/VG/yk8VyT8Kt7Ls3zxRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PY1/AsgV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B775C113D0;
	Wed,  8 Oct 2025 03:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759895978;
	bh=SYBRK9Is6hze7pc/EZVMKBQ2vZCW72GwF2tZk/9Hvxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PY1/AsgVHhpY4bWXsNkg+CrG/U3KzIYEBun6QR/Ei+nhfs4UqBqsyu1ZKuN/iuLCM
	 j7liF/0UCvsOLAxYDs/FLZHG2Z64/wQ+or8QyjC6K4vd7DqdoRYgWWhzWxDXvO2dcy
	 7LPHtB/UugSgKobT6dlX5NCR1P8QfvJIenRKNDxtaZFDHpoDT3PyM/or+9RxVagZhV
	 MYhRK9YIZ8cDpPbCGlrm3mWykfWQL8yxpDJzetwXSEriqC3ogOoiQwiHL1WXG1jOZN
	 t/aMR9uvK0l/GVROq2y+nUArgZCBdppgHhbwyS+jO/Ii7X61FmDr3Qr8JDhDRGt7cs
	 bumUE4TtPbSDA==
From: Kees Cook <kees@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-media@vger.kernel.org,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH 2/3] media: radio: si470x: Fix DRIVER_AUTHOR macro definition
Date: Tue,  7 Oct 2025 20:59:34 -0700
Message-Id: <20251008035938.838263-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008033844.work.801-kees@kernel.org>
References: <20251008033844.work.801-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1678; i=kees@kernel.org; h=from:subject; bh=SYBRK9Is6hze7pc/EZVMKBQ2vZCW72GwF2tZk/9Hvxk=; b=owGbwMvMwCVmps19z/KJym7G02pJDBlPHy7LFHPVe8133XsWQwTv1OhnWkxLZmSls7q47Tn38 rDbYqOzHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABMRf8nIMHn/rTvCh2Wb+w4K vP0Qkf9gS3PFVF+zb4516RMncWW3cTL8s3dKMLug9ZxrE/Oe2U/mBdpuWNDPoKOwQrTm8takW25 WDAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The DRIVER_AUTHOR macro incorrectly included a semicolon in its
string literal definition. Right now, this wasn't causing any real
problem, but coming changes to the MODULE_INFO() macro make this more
sensitive. Specifically, when used with MODULE_AUTHOR(), this created
syntax errors during macro expansion:

    MODULE_AUTHOR(DRIVER_AUTHOR);

expands to:

    MODULE_INFO(author, "Joonyoung Shim <jy0922.shim@samsung.com>";)
                                                                  ^
                                                       syntax error

Remove the trailing semicolon from the DRIVER_AUTHOR definition.
Semicolons should only appear at the point of use, not in the macro
definition.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: <linux-media@vger.kernel.org>
---
 drivers/media/radio/si470x/radio-si470x-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index cdd2ac198f2c..3932a449a1b1 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -10,7 +10,7 @@
 
 
 /* driver definitions */
-#define DRIVER_AUTHOR "Joonyoung Shim <jy0922.shim@samsung.com>";
+#define DRIVER_AUTHOR "Joonyoung Shim <jy0922.shim@samsung.com>"
 #define DRIVER_CARD "Silicon Labs Si470x FM Radio"
 #define DRIVER_DESC "I2C radio driver for Si470x FM Radio Receivers"
 #define DRIVER_VERSION "1.0.2"
-- 
2.34.1


