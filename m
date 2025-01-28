Return-Path: <linux-media+bounces-25382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE8DA2104D
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 19:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0CA81690C5
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2158200115;
	Tue, 28 Jan 2025 17:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqnS6CNH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5408A1FFC56;
	Tue, 28 Jan 2025 17:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086913; cv=none; b=r9C4kmY5Sa9DpdxOkytRGwsCk3rf13dwEEdAx3RtpZO/IG6xCUxyPVDw7wtddRBVe0SvtrYsir4yD+v/sS0+QJ4MrR1K9RXpPVz5KsWLvesCXqBn9WWe7A9V+IVr7ZUWdrSPMnpld2FLCjPOTb7O+iL9KVQ5o1I8L5+FH8MKIgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086913; c=relaxed/simple;
	bh=Ofs7/mnLkbiZcf/m1/djoR4isCbvUivYL9RuLk15om8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=guavov+kGhi9QeuTD84yFDUjUG0ENALjf8QFDNRRCVnrLKNYum7kDQocMed9kYQDUe4OEGJJW1VgtklMgYQ+EGTYFKfBLMzQv1ruvRjhzaVkcRjAZ4BcVCnq+m8EuykoiIkx4tC8xoG86TwIXStmtlFCPTgpHlqCCAgkRJ8RTPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqnS6CNH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9935DC4CED3;
	Tue, 28 Jan 2025 17:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086912;
	bh=Ofs7/mnLkbiZcf/m1/djoR4isCbvUivYL9RuLk15om8=;
	h=From:To:Cc:Subject:Date:From;
	b=hqnS6CNHk0kYySLl14CRPfNr3clKi6pPfr6WA2Mu4RB1tyKVIYzfJ0M4r19UmfuQu
	 QADpwrKB9m+eXtsh7RBJAIhVudrDACkRy3C6vsq1IGMk5m2VLW2USI6jECjhkr47Sz
	 CkH9POU9Ys9OYGctoXkVlyBRgC5ftyXRxaeXNwZfzPGG61cga4Uo2Zr59hRfdnij9b
	 dDU0xpuX0bVQhuujpX9QYPL+BTAk1e0y4vMh26sQeaBnbBzWZPPSvY7lOrDWy9HJEO
	 uuLRVoW+tNeJzw/bLBalXsTwgxc1MwlQNm7kFdYgSjYlc0FAI2wb5Ow9StqBrxUrwE
	 Nzu8aJcNpiC2Q==
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
Subject: [PATCH AUTOSEL 5.10 1/3] media: cxd2841er: fix 64-bit division on gcc-9
Date: Tue, 28 Jan 2025 12:55:08 -0500
Message-Id: <20250128175510.1197735-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.233
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
index 493ba8b6b8f62..b2c251135ce1c 100644
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


