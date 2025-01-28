Return-Path: <linux-media+bounces-25371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6817A21024
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 19:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFDE7188BBBC
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8461F9EB3;
	Tue, 28 Jan 2025 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoujIjur"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965EC1DFE31;
	Tue, 28 Jan 2025 17:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086878; cv=none; b=j0ZbbQBgUuE5s7x6q1qwKlrbeLJni7Yi88Vyz3qNSwJBwamGe0HOlzlLZ0s6wNHxSpXz9Hc391dIEoiYj4lGjKqobEgssVh1SYz8ByBj6fJfFhMGBotFRxTeHcQUTg4fsbQxNCOvMJG33jKP6Pj6wOYtnyPar3H+w1+92XlI+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086878; c=relaxed/simple;
	bh=yNfP5mIHDg5uYOqRD8vIgyvxFJiwGSjFvATMWg+rdEE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OHVf2qFzaextm9wFgkrAs3u8LhR0z3uLN+9TDBsE9D/IZRWldzcZAzcpXuA3S2vV3tqDbyg0bSE+OH7wDYkiVbR5vp4WOfBFeV3u/BXMo7WBTBNxEVmCw/xCaTLpIshnkouFiqqTSGdJLEjCQ52HxTVVlWcM2E1VBG+/6dFVq5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoujIjur; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42FDC4CED3;
	Tue, 28 Jan 2025 17:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086878;
	bh=yNfP5mIHDg5uYOqRD8vIgyvxFJiwGSjFvATMWg+rdEE=;
	h=From:To:Cc:Subject:Date:From;
	b=WoujIjur22JsE2dXu6+TK2hWWlYBaClRhHfTC5fAUn61mJeENCkLiXOwydosdouZt
	 ueJij3cw+yU5fiQLy/e2Ycgu13OsB3yaxgbD8U0DeEWRE/5kEObuK65raAX1uBcHXK
	 lyo5FBRqH4mElVXOY7hCmxFk42KxHdESESt40ad2Q39psuDzcw7ZuE9jRGSnVxuPiO
	 Q2H0ii4r1VmAUGmVoUcQJ1xhd2x7Rd7QzoBci0GteDICGoyX1kkn/8ZCwvjyDVLPbY
	 uDtkDKzTQvDnjnsHVIddQfxQKV+NBwAmmUtBzFYp3R5jSZaZAC841QZ6cdsQp3xuyY
	 d5/NZgWrCxm4g==
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
Subject: [PATCH AUTOSEL 6.6 01/11] media: cxd2841er: fix 64-bit division on gcc-9
Date: Tue, 28 Jan 2025 12:54:25 -0500
Message-Id: <20250128175435.1197457-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
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
index d925ca24183b5..415f1f91cc307 100644
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


