Return-Path: <linux-media+bounces-21251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9809C3C53
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 11:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F74DB22BC5
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 10:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406FC1865E0;
	Mon, 11 Nov 2024 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTH2oIET"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D5A1A2C29;
	Mon, 11 Nov 2024 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731321710; cv=none; b=uDL2u5OmUut9t6Qgwe7Wm/O1h5H4fqQZWOs/eROUDbfK0RFtMLwVhD7c9eDJBkqtRbAk3M22wEvnLozLVZZtuBEeRWMBxnTdfUu4p0vzqW/KTxFJQaHnAgwzIpENXvLbKY+7XcB7qEAfTKlW8wbFr6SDP1CY18M7depGE6Pp0FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731321710; c=relaxed/simple;
	bh=Z7reAC9X/y5vCqzifvRgCpuOb8WVsq4LFAwfeheOO2M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rj2FeoXH7/IPG2/4pwxExQ8F934nlVstJPHiGu8RvoIfiJ0LF0tlGwRpEsLVJ87tW9hgk6/We2VCZHF/UO7lrq7bX8OgxgiAXO7OSGLlOJYVp630JMAY6llebftn77zEGMcP7UhU2No8cW/tW45TD2mT0yOroGucrOE0UGecSFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTH2oIET; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62064C4CECF;
	Mon, 11 Nov 2024 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731321710;
	bh=Z7reAC9X/y5vCqzifvRgCpuOb8WVsq4LFAwfeheOO2M=;
	h=From:To:Cc:Subject:Date:From;
	b=oTH2oIETJB7lt+BV6XqzkePb48fFwgwkVD400PlCGWdwQHt0FMaKBK4qsFFKwyLpq
	 /TxPasVJkPXKY2qz9uFCRb2A/OZDlYp200YsIp/tfaHlurJnojouul+HhUgXAxkeb1
	 oQQqBL5kUhCfnvBYLOAVR+wEjvFuJ/8qjZGsuk6hDhHBx/9+Gk7Z1zXnIHjgcSLjmt
	 rhYZXgXi7tU2mbbdeSE+reIqmxytScIwyBECtp3dtDGvxiJjEL0p38gzPt1twZy2E6
	 nNZmf8Sagn7G6T3nQiySYSZBXfOe5qvyaoQHCwjmWxfJPiZSP+2ZiTrLn4DPvcXoPT
	 LJCvD1VsPUcIA==
From: Arnd Bergmann <arnd@kernel.org>
To: Abylay Ospan <aospan@amazon.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: cxd2841er: fix 64-bit division on gcc-9
Date: Mon, 11 Nov 2024 11:41:42 +0100
Message-Id: <20241111104145.3735803-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

It appears that do_div() once more gets confused by a complex
expression that ends up not quite being constant despite
__builtin_constant_p() thinking it is:

ERROR: modpost: "__aeabi_uldivmod" [drivers/media/dvb-frontends/cxd2841er.ko] undefined!

Use div_u64() instead, forcing the expression to be evaluated
first, and making it a bit more readable.

Cc: Dan Carpenter <dan.carpenter@linaro.org>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/dvb-frontends/cxd2841er.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
index d925ca24183b..415f1f91cc30 100644
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


