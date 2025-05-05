Return-Path: <linux-media+bounces-31787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA35AAADA6
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCB671664D3
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FF53BC37A;
	Mon,  5 May 2025 23:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZ7itu3/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7ED3BBDC4;
	Mon,  5 May 2025 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487366; cv=none; b=e9ah/SMJHvror9SCT9ph6vTPRvnRCJJjMbGObuDHGQ/whgmYkwc93uXIYWW1qBVL7KQCX9fKoida6I4tnc/FWK3kZG3qxTSQzPtZhskZTD8XdPn50qY6twRTvRZPG+YnzOeOSg1o4bwthTnHEu7kM3408WE14/b64FT6M9hGvQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487366; c=relaxed/simple;
	bh=dfOTnwW8EMM0rb/gURkfrAF+WWhNq1xDnrQSDySzLdI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ArjaOYgSYN7i2iWD725b/TblcpCLg7tCRF5BNCGJo58FA51alIXMgTKJ/8YGqv4Ipy3xevR4BjZKXt+JnHwXI6nnvJCayupn1J5OhUyDHzsn5cEUMduCmE8DBUjwQUhSqw9w6nKadapkqv9BHReE2LRHwpBYtSRBp6jTjC0tCZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZ7itu3/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3711C4CEED;
	Mon,  5 May 2025 23:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487364;
	bh=dfOTnwW8EMM0rb/gURkfrAF+WWhNq1xDnrQSDySzLdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cZ7itu3/UglnyViyl70NwQstgAgva38MnrNykf1znd73/jIPzXkwvWgUDUQEXmEJE
	 6zCsjRkHyug1BZsMHwn04T427Uao+Q96WgR8oPNZUXaeLzb3gur15h74LW0+1Fh//5
	 Rl++vr7jeV+6fKfOr31MHtjh/pdRkyjZ1HN0t9XyOjZfwOViTKVitTis/t1eiOTCio
	 ekJT5kNZJKqjRPqvwtMIdbS1ig/nhlf4EGB0JQWxqMeQ+6AdnV8sFI4HwSeaqNbaCq
	 VjIj0X/hp8sRG4PCrut2gbe7eTgw4GLwQ0bltbXJtg8HXsZ2Iv46UY5kW/ADY7rV5p
	 ZZds9lfJ505Gw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Markus Elfring <elfring@users.sourceforge.net>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 31/79] media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
Date: Mon,  5 May 2025 19:21:03 -0400
Message-Id: <20250505232151.2698893-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505232151.2698893-1-sashal@kernel.org>
References: <20250505232151.2698893-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
Content-Transfer-Encoding: 8bit

From: Markus Elfring <elfring@users.sourceforge.net>

[ Upstream commit b773530a34df0687020520015057075f8b7b4ac4 ]

An of_node_put(i2c_bus) call was immediately used after a pointer check
for an of_find_i2c_adapter_by_node() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index 69070b7068318..8229fbb88a8db 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -813,13 +813,12 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		}
 		tsin->i2c_adapter =
 			of_find_i2c_adapter_by_node(i2c_bus);
+		of_node_put(i2c_bus);
 		if (!tsin->i2c_adapter) {
 			dev_err(&pdev->dev, "No i2c adapter found\n");
-			of_node_put(i2c_bus);
 			ret = -ENODEV;
 			goto err_clk_disable;
 		}
-		of_node_put(i2c_bus);
 
 		tsin->rst_gpio = of_get_named_gpio(child, "reset-gpios", 0);
 
-- 
2.39.5


