Return-Path: <linux-media+bounces-25378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBD5A21057
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 19:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2407D3AB001
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6CD1FCD00;
	Tue, 28 Jan 2025 17:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wfw8hzQE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD981FBEA7;
	Tue, 28 Jan 2025 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086897; cv=none; b=oqBAs6qY3lfN0/yR3hXjqDjmCY05Jo00n4aylZO89GdjJDGDEjquiWyoDQIuN6ony6XZXu8TgGnhfMrdXNnKSm0IqHcoYZ83Jzfxkp5tLxDU/xs3I7rvFEBnKmukhYnh4mZNBrVdxwvS/sZ4YdWRh2tGSiYt0hf3AnTFHU3dr18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086897; c=relaxed/simple;
	bh=jqC34l8TUma+5J9u0yFb/jeYTwQqzmRRxTpUcH2LfRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WT8/WOadJpEcbYtpXmtc6y4eddSgkdzNp1opyYfo5dv2o5tNCj/6BY8alLObQc6zgFjsreJxEcVlDmpSXlUoRAa8eTTBvpHDa3dErqYzw/qAVyi2nf0+a8AfdTzLxb/rKbxbqv+molLQYPu2vNQYre0MJJrtE7+DBvkQ9jQB0Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wfw8hzQE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF00C4CED3;
	Tue, 28 Jan 2025 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086897;
	bh=jqC34l8TUma+5J9u0yFb/jeYTwQqzmRRxTpUcH2LfRE=;
	h=From:To:Cc:Subject:Date:From;
	b=Wfw8hzQEaDlrh2zD1cQJqPu9yWo/k08A9YxMrL2IacpydT1AwNJ6nuSmsLGRUI32w
	 /hf5D6drAdIjnKMV1Uh6l0kkHnqlWb/6oEOaOIShekS0LIzQ4xHMcwO459DJofcdPT
	 nuLPUeQXZoveQv9g3zc3LGz6UjyZA8mYeVAlSuGxXxM+eMLvlu15D9wa0Uk4qRPsLf
	 8O6Pm39nfbFMUleQuIIXMlMry5dI/Bgjh4185OQtywDsHhwwsABaj2ZJ9VhXAnV+21
	 oZqkmhsl/ZvbogXcLTNUMiXG0mwzmPcuyIhFPE9DeUaLoPPUDie1iwWU/uFZPe5sCE
	 Y2W/VohCRUlxA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	aospan@amazon.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 1/5] media: cxd2841er: fix 64-bit division on gcc-9
Date: Tue, 28 Jan 2025 12:54:50 -0500
Message-Id: <20250128175455.1197603-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.127
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 8d46603eeeb4c6abff1d2e49f2a6ae289dac765e ]

It appears that do_div() once more gets confused by a complex
expression that ends up not quite being constant despite
__builtin_constant_p() thinking it is:

ERROR: modpost: "__aeabi_uldivmod" [drivers/media/dvb-frontends/cxd2841er.ko] undefined!

Use div_u64() instead, forcing the expression to be evaluated
first, and making it a bit more readable.

Cc: Dan Carpenter <dan.carpenter@linaro.org>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/linux-media/CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com/
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/linux-media/CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
[hverkuil: added Closes tags]
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/dvb-frontends/cxd2841er.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
index e9d1eef40c627..798da50421368 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -311,12 +311,8 @@ static int cxd2841er_set_reg_bits(struct cxd2841er_priv *priv,
 
 static u32 cxd2841er_calc_iffreq_xtal(enum cxd2841er_xtal xtal, u32 ifhz)
 {
-	u64 tmp;
-
-	tmp = (u64) ifhz * 16777216;
-	do_div(tmp, ((xtal == SONY_XTAL_24000) ? 48000000 : 41000000));
-
-	return (u32) tmp;
+	return div_u64(ifhz * 16777216ull,
+		       (xtal == SONY_XTAL_24000) ? 48000000 : 41000000);
 }
 
 static u32 cxd2841er_calc_iffreq(u32 ifhz)
-- 
2.39.5


