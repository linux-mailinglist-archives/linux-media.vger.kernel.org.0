Return-Path: <linux-media+bounces-25380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A86A21069
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 19:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DDC73A5891
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4E91FF7A5;
	Tue, 28 Jan 2025 17:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jueoxNfL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824121E991D;
	Tue, 28 Jan 2025 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086907; cv=none; b=GQx9VVsVIYYWk/p7DUNh2R1Ydmyc4dQsrSaQDYY6AKgOA/Tg+q+EidpassuE3eiJcL9e9hRy5D/B8hNnQiWA8ySHQrpxKASE0fWht33kVdhJm2oiN2InjC/5+glsr9VFb6uE/HVgvPOUacnTY9QBzc2VCj2Qq95RZOmciC5nDCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086907; c=relaxed/simple;
	bh=jqC34l8TUma+5J9u0yFb/jeYTwQqzmRRxTpUcH2LfRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kl/tSurW4UaKvm9EQHqq3fzoOujel9Bftk7Khb/E+ZGcjaHoX+AXco8D/gJmzOZDrFjKl8T2t0KKCsibwebcdUpCVTlZNy8eGovEkr1Dth+w2blTy+p/QZDZoGQKIaT1SGQHJaXrn8CWZ29bf/8HQPAenwxSSw31lDi99vQWTRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jueoxNfL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A822BC4CEE5;
	Tue, 28 Jan 2025 17:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086907;
	bh=jqC34l8TUma+5J9u0yFb/jeYTwQqzmRRxTpUcH2LfRE=;
	h=From:To:Cc:Subject:Date:From;
	b=jueoxNfLwTxCa2F3t/wzdtaHtZcyO+uQGgYqX9OtwyMdWPQFmEXHLq3IMnHAqhhgL
	 4nYxRmQsVGzJcYO7CEdPkA4mGW5CnZQPNOxwe3cFn2YzejuuQxoomzsauaF5Av+G7h
	 f/FmsHkchH4JhsH5/IQyWop3WH0RA+CGsXUOIBB3s+70oHaTwETRW9C05JmA5bYuQh
	 If3hg6usJ5qThdx52cUQHuWMN5nI9kNeRq1p8NZNqRxIDYefZ7zoBMBvaBlfPRfSGd
	 Tp/rg5zAoDClMmEHfmHg9X2h+e6lgTpEoj4jC+iwII+tQcn9na5uTKtEPL0jlRxZF9
	 wSr5mMOenNF3A==
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
Subject: [PATCH AUTOSEL 5.15 1/3] media: cxd2841er: fix 64-bit division on gcc-9
Date: Tue, 28 Jan 2025 12:55:02 -0500
Message-Id: <20250128175504.1197685-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.177
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


