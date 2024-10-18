Return-Path: <linux-media+bounces-19837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1589E9A34C2
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91DCDB22112
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3368818CC1F;
	Fri, 18 Oct 2024 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoxGKoa8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D606187FE3;
	Fri, 18 Oct 2024 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=gGvLiJSRee36odKdM8lab1TrnH3oWmskecsXjlH8g7/nE+BeyDDm+Cpm00f0jCQS08U5SWcQqohnylqD1OdOC7VsL6T+CdN4nBUyRstqJs6QhkSS+cGijCkCYv6BK32mR2vNAKbANgVJyGzqESRS3kWDkPJ+oryRjEPkqWBKA9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=HfALoVly1ujnpj+hXBkW4Goy8KItNqyAYKrdPlBXqkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LR33+Jx2zb9XXXYqNVuqIikevSFt2Zte7XjE53z/h6x7gL12PLmW9IPU8Fn5tpdJ44/o1i048oDJ7DUJ9vye0TMeaucRtfrtiGye74wzAonlbYVY1QISVhEY3d8pNJlTSucUnIwOWSFfr9YGgS/d3Seb+KRl1xJ09UjO0fgifQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoxGKoa8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70D2C4AF09;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=HfALoVly1ujnpj+hXBkW4Goy8KItNqyAYKrdPlBXqkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hoxGKoa8a8H4gQVzxUWJb8iJMT1OFvpl1Hzhhx7QSiUnV3OuNqTdN1Plloe3for+Y
	 Aa8QPhkXSHwAKX6za4Ga5LDhBX9dlfLKPg2QEieRMo96hPyWUl3h7AKdY4qb0NyQ5h
	 0w6Ix5yR4lxPRtBeWV1lgjPLoOIkv0NYNBpj6kJ9Y3agfIZm/GofC+QXck0P6B4Ob7
	 9tw1nbMUoed9gR0CFxfyAoZPxvGb7DWxBKyg5vJdyfUem5eKctOPk2gpP+b7Etns7z
	 ta0sN+d/e0zE6taF2IhNFFMImd2J7LElJa4BWV099zxxpyUxwq0zummD1EAFgcydpR
	 N8G21WdGnR0zg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005Meb-2LHs;
	Fri, 18 Oct 2024 07:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Manu Abraham <abraham.manu@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 11/13] media: stb0899_algo: initialize cfr before using it
Date: Fri, 18 Oct 2024 07:53:13 +0200
Message-ID: <010d5654f49b0b1e6e9d84a2f40acc0e54894ff3.1729230718.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729230718.git.mchehab+huawei@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The loop at stb0899_search_carrier() starts with a random
value for cfr, as reported by Coverity.

Initialize it to zero, just like stb0899_dvbs_algo() to ensure
that carrier search won't bail out.

Fixes: 8bd135bab91f ("V4L/DVB (9375): Add STB0899 support")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/stb0899_algo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stb0899_algo.c b/drivers/media/dvb-frontends/stb0899_algo.c
index df89c33dac23..40537c4ccb0d 100644
--- a/drivers/media/dvb-frontends/stb0899_algo.c
+++ b/drivers/media/dvb-frontends/stb0899_algo.c
@@ -269,7 +269,7 @@ static enum stb0899_status stb0899_search_carrier(struct stb0899_state *state)
 
 	short int derot_freq = 0, last_derot_freq = 0, derot_limit, next_loop = 3;
 	int index = 0;
-	u8 cfr[2];
+	u8 cfr[2] = {0};
 	u8 reg;
 
 	internal->status = NOCARRIER;
-- 
2.47.0


