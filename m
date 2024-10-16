Return-Path: <linux-media+bounces-19736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C61099A071B
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AA011C22648
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1FD2076CD;
	Wed, 16 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lstqbken"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D145206E84;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=Y2IXH+ulOn1VDknCYxJETbrIhk6G2Prq1qUE52przT7lAiMqH/rMotQN0IFuAh9DUrCixrSd028rMPlGquoo9jEnifiAkyNBye4yW5OPI77+JwlbYEdSoLOZt3H501VHL7pG0ogW5ce5UQS0FQkufkvcJzXoOBRZpzDO2QReErA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=Y+m0IthLg3u7yCjeAZDbNuZ1g4iek7tN6vPFOcl1koE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmNoPhL09aWnW6eSFeD/GD7Hxmb6dWrPYgdTGnCmQciGW5fUQ3I70Lmwpq5TFg2nJgl6JPrMfdAXjnkEao+D5EXi2+grdUcPOzOVOgCvm+aQU7rIVaO+y0XVsrty6TOyf1FTRCcMNSax2pPw3tt1wmIIDqLDHoLDavvD9nrZCaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lstqbken; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4073C4CED0;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=Y+m0IthLg3u7yCjeAZDbNuZ1g4iek7tN6vPFOcl1koE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LstqbkenFPU1P+OOL0SsFM+AsVqiV6wOxMSYEz/dPKEOcoC04Gl7gCWX1RrGrRrlu
	 r65s0aq1C4u5173cWZvQwFanEl+wc5XVQkXAKtqKCpxSrWKObHGocSbzY0MYp5PcFs
	 dE+4YrT5pq7k0WPy7f3NZQOV97qHWcO7stfRcxyTov//KIh1lyGb05UePMKmok/+gb
	 0O9H8ZXiPs8T5X/4yJyLOHTpA5KoE3TIZRJH5qV+i3yb3DeB/4C98igsq4tsvTZnBA
	 yvZxsF8m5En/iuVlrXTK0M+hcHolH+tO/j2674ukaSLasmdBmVhME60Xe6b/u8ymuu
	 r9bhJyVOisSwQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004YmU-1ulY;
	Wed, 16 Oct 2024 12:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Zhipeng Lu <alexious@zju.edu.cn>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 02/13] media: v4l2-tpg: prevent the risk of a division by zero
Date: Wed, 16 Oct 2024 12:22:18 +0200
Message-ID: <953ea061a4fbe43b10f15308aa8d792afb493e44.1729074076.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729074076.git.mchehab+huawei@kernel.org>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The logic at tpg_precalculate_line() blindly rescales the
buffer even when scaled_witdh is equal to zero. If this ever
happens, this will cause a division by zero.

Instead, add a WARN_ON() to trigger such cases and return
without doing any precalculation.

Fixes: 63881df94d3e ("[media] vivid: add the Test Pattern Generator")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index c86343a4d0bf..a22f31515d7e 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -1795,6 +1795,9 @@ static void tpg_precalculate_line(struct tpg_data *tpg)
 	unsigned p;
 	unsigned x;
 
+	if (WARN_ON(tpg->src_width == 0))
+		return;
+
 	switch (tpg->pattern) {
 	case TPG_PAT_GREEN:
 		contrast = TPG_COLOR_100_RED;
-- 
2.47.0


