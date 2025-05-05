Return-Path: <linux-media+bounces-31802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B7DAAB770
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15150465127
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 06:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C0F3A0C42;
	Tue,  6 May 2025 00:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBgeLj9n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6643A0139;
	Mon,  5 May 2025 23:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486926; cv=none; b=TBJq/+q3aJgDmjNyqyBsizP3D2TzmXeu0u0w/0CLoh67koOevaQQXSPaKu6YvnmPlXqTJztDBi3PvrQaK+O+IiHt+r9kwC4+wsRhBJxEQ6wdpGrMwRG4IAjoEU/JY9GqoT0VM5g4l6rp9TdMBDRuxKwEqcg7D+vI89fNMye6QAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486926; c=relaxed/simple;
	bh=CqHcQIWR4iyhbZvCN/kp/XjBSWLQYmqi5+nM57fKEq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y48I75laJ0o27LR1lzhUPnhszowv2+Pdvu9yZ2oywA/c0U/Tk5faDqQ9YCT39z+cCFnGgEwHaraSteDCgnDr1AwmaPvQyod4BxoWLHaGwzbkj1FfllUiP/Bez18IlQXCQX7qMIB0Yri+mF5hRyr0MyC7cK3G8vM1yGSCsVKWDX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qBgeLj9n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C132AC4CEED;
	Mon,  5 May 2025 23:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486925;
	bh=CqHcQIWR4iyhbZvCN/kp/XjBSWLQYmqi5+nM57fKEq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qBgeLj9nO5qAGc1ffchrpk9Et4youUdN9EOuqGm5SIFCg1fvBD6g42/cIEVqn4xxs
	 7l5zq0U+Egq/BASf5BrwZUECkxDuf/KxgbFpofLsvOTZjI9kyxgIAOkbluAjxkldLP
	 i3x77Nl6Y6jdw/l3msBNYR/fiaHL/Smh66O9vEgJG9yc+QmDNeEPRjXRksHef1Nl/r
	 DWqM16ELCkCLlkmqs0dvkMg0YRkcKIJgmopNQvWhhn2NNETiZp8p2w2DMWKvP3SGiW
	 PqLDDq06Z9hLzGuFcpQBTeruxYwSYXhpqAXrPOWOEi9qooBxlbaIV5g+WvvL6CoNFR
	 a1rYDk2iFCtqw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Markus Elfring <elfring@users.sourceforge.net>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 062/153] media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
Date: Mon,  5 May 2025 19:11:49 -0400
Message-Id: <20250505231320.2695319-62-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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
index 88d0188397e7b..28aab5a8336e0 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -811,13 +811,12 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		}
 		tsin->i2c_adapter =
 			of_find_i2c_adapter_by_node(i2c_bus);
+		of_node_put(i2c_bus);
 		if (!tsin->i2c_adapter) {
 			dev_err(&pdev->dev, "No i2c adapter found\n");
-			of_node_put(i2c_bus);
 			ret = -ENODEV;
 			goto err_node_put;
 		}
-		of_node_put(i2c_bus);
 
 		tsin->rst_gpio = of_get_named_gpio(child, "reset-gpios", 0);
 
-- 
2.39.5


