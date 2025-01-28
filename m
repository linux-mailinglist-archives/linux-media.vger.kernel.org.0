Return-Path: <linux-media+bounces-25355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95444A20FCE
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1F23163BF9
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D4C1DE893;
	Tue, 28 Jan 2025 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHqen9k0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962EB4315F;
	Tue, 28 Jan 2025 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086829; cv=none; b=HU+Eed76+nCTu3M5Btd6cp5U7xO/XU6XLh9eCVSU2LKGzuIMSXaCIDyJp0pcCNolTrjchxYbYq2m13rWTk5cDupaQt6G0X4RyExRtvj9t0507/HH/t3KxkWRfq3S9xw26tyhYUiTzOQ6LFW3u+lV2ZwWkQbyAaVgV2WzrUQtQQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086829; c=relaxed/simple;
	bh=yNfP5mIHDg5uYOqRD8vIgyvxFJiwGSjFvATMWg+rdEE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AFaDkbxW+eLwGt9M8u5/Q3dvyaWKrH4kiu3uDS0hJqELYGKrpMWO2Cwm+F/o1Tr26ERSP2Du28e4lZBFLbMuxX74Cvc2ZQx19sjf76XLNCdOxkEnXMou5A4GblFP0feWTjwVBxnAJInuv2OzQvFgCmt6KcUk98hM1hSFpYqxMqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHqen9k0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBEABC4CED3;
	Tue, 28 Jan 2025 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086829;
	bh=yNfP5mIHDg5uYOqRD8vIgyvxFJiwGSjFvATMWg+rdEE=;
	h=From:To:Cc:Subject:Date:From;
	b=KHqen9k06xHd9x1AXewYpCBYlfaUscA79uC7RsGDnr/OveWNsjznxvZTDBZf8vHKj
	 r6x7mF4TZNc6Z7gHCLwN96a1dAIvVfKxQJXUA+DSMDbluOCdIHQdX9zd/qOLHTYa6H
	 fea+BcfLLq7pz8RTkRRS0WqtKwo2Ns8vrdj3q52EDSWazEcbFjhMC8R++R8cD+44Pd
	 WqO8TthVfm5QMNOBHLC1P9qu0+vpd/dUB+dlC8kkOE/AkKP2frrm6tPMwGrqNiep8q
	 sJoq+Ge0Iy63lOnwpHd2Vmb502XqGDas87gTTiNI+VBM2JLzghUFUFlnSewbtAY0IN
	 rvDQJkEUkUyiQ==
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
Subject: [PATCH AUTOSEL 6.13 01/15] media: cxd2841er: fix 64-bit division on gcc-9
Date: Tue, 28 Jan 2025 12:53:32 -0500
Message-Id: <20250128175346.1197097-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
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


