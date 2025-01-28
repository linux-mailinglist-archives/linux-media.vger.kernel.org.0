Return-Path: <linux-media+bounces-25384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F79A21072
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 19:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E78A03AAF0F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B71A201116;
	Tue, 28 Jan 2025 17:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWa3rRAu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53731DE4DD;
	Tue, 28 Jan 2025 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086919; cv=none; b=a/AKyfSaBlY/zvi2y3mu4xc0sTkwlvQftnM2g5PDaDDdQafUBJ+vO6Ka0ym+AA2+RC3l3iQGSqIi5TIUgZjIY8eP99h/XMqfXl4QEesYu5L04njAL7axX3cLKbE30qJLUXoKbAbaa8IqgrP5EHTwpa7GMjtnExnwPXS4Ff44+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086919; c=relaxed/simple;
	bh=bH1Hk3SR1wNYZLy3YUrWkVHKLJnDu0qsCaR+PNwzdqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nfd/xRqKKJIbYA7IMgw9EuaESY97cCtsKs0S6FkMPDtyHwEo4s55XEJO2t71W6VIL2BcBoKATBepnKA4JzzJLXCyzPJ0BMwnFpap17S0Tjvri9RYmkWHiW9egJt0npmmYl7nf1U2ieShbYGqOzL3L+35GBF+vLTMVCCb50NBtOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWa3rRAu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C640C4CEE4;
	Tue, 28 Jan 2025 17:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086918;
	bh=bH1Hk3SR1wNYZLy3YUrWkVHKLJnDu0qsCaR+PNwzdqg=;
	h=From:To:Cc:Subject:Date:From;
	b=QWa3rRAuvRRtDbgdu1O3V3SiOt7oR/iQ54RR3JOyaf/R2WMIjajCLIyyIv/Z22s9f
	 3r8mUSXrPG3l9evHVkcGJZZM2HJqBCD/sbQbNDvV1AmAee1TFSN8CfX5rQ0l2D0KvI
	 wHgTDXs1jem6JgU++IAhSGf+OyzrYiLtw446AKtMaKx67OWFdWLeUZ+Hba5crjcp6S
	 BhIbnlkI13rtDmLEyiF5ukRaK0LJTYm8TME9STBKaAY8yR07ZmQD576jVuAn63uxZE
	 cICdAg801t/Ir8dwkTgrHXulaBMAy2WQKDufMWkvfsEw3oekP6mOROQ2fHyt7AQVsb
	 t6OSxkUQ3nxAw==
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
Subject: [PATCH AUTOSEL 5.4] media: cxd2841er: fix 64-bit division on gcc-9
Date: Tue, 28 Jan 2025 12:55:16 -0500
Message-Id: <20250128175516.1197785-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.289
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
index 6b495fc36fd0c..51e890554457d 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -310,12 +310,8 @@ static int cxd2841er_set_reg_bits(struct cxd2841er_priv *priv,
 
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


