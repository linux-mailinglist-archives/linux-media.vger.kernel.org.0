Return-Path: <linux-media+bounces-25363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60941A20FFE
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 897573A7206
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071A61F76BA;
	Tue, 28 Jan 2025 17:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOm6/JLF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015F1F7594;
	Tue, 28 Jan 2025 17:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086857; cv=none; b=Z+OJN1S8eGAgl0QQtfbjKZYoHfQpY7y4tmvuIW2ZbcR4wQq9Zx4iU1aU/eMoR5+SUdjku40qQKWwvMBI2GOPGqqUZegcROODzsHvooRhmTXYxkSY853R7rb0srq4xPcHgfg4EPhy5HnBCk0yUYvoQxAcha9quAF0ZgVGVtBXKws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086857; c=relaxed/simple;
	bh=yNfP5mIHDg5uYOqRD8vIgyvxFJiwGSjFvATMWg+rdEE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bqSYZJrC9txAT735a9RLe1heS0onC3d8L2rkLubPs2TWJRblYirujjqXKGCuy2lV/WOanxKUlqP8c+AoPuEzuV3CeHvgFubfzqdnLTYz2mnz6UVs1xxvqmbguE86AmoTBDnYUSe2ZhQi+HPgym1ewn8bGdDFUqPbgzHo2CVBrvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOm6/JLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF5DC4CED3;
	Tue, 28 Jan 2025 17:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086856;
	bh=yNfP5mIHDg5uYOqRD8vIgyvxFJiwGSjFvATMWg+rdEE=;
	h=From:To:Cc:Subject:Date:From;
	b=TOm6/JLFHxe7um0l8fYsSgpZx805qVIWo/J83GwcB27wFZli2mnUBPcSN12iEBGGu
	 Z2Sy9gbj/3gOGPnIx6G4frM+Bk5Cz62cm/eEeRCuEQxl/1yTcAKOGEkWcaUkxu8QkU
	 1xmUtjkoDAsRVnHZaROzaU8V9hDiaS9FdZoDfaw+azulyLxytvWIAH0oJhFj2dRFMM
	 catW9j22Rby8Gsl0PBRDbbYJgKzITTiCAUCIasf43xzUDe2nlowNqsH30NT5c7yCnt
	 HPyWmoBuFhHBJ4qLqBm9i4jHa19PR9DZr+Es1DdLVT3UxVpD3pJb/RDmTnDibCnhHK
	 87ovDF7Yk/7gg==
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
Subject: [PATCH AUTOSEL 6.12 01/12] media: cxd2841er: fix 64-bit division on gcc-9
Date: Tue, 28 Jan 2025 12:54:03 -0500
Message-Id: <20250128175414.1197295-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
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


