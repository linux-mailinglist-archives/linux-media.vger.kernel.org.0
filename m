Return-Path: <linux-media+bounces-31766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF06AAA9CD
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 03:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA14A7B1BA8
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F152D0ABB;
	Mon,  5 May 2025 22:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ln06VOsV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55393628DF;
	Mon,  5 May 2025 22:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485153; cv=none; b=mJOJ99EXe0cMvezS2lpjdWLa3noZBUWO73oWalGGfhqQXZVv8atcc/flo6ND9T3cvzqO+PiNoLBGTLWqtsRQcOl8eKCd7/qQvQqDYdZ8igIUJfjdMZ7kOPkzSIBnEgYe/Cqh+WN/T0Frz+ZGVf+EftWJLAHQk4vh5yUJ4TGnReM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485153; c=relaxed/simple;
	bh=g2WEwrfaj+A0D0qzRR2dwBV3cowTvNzMAGlu4M30mDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DV5JFLfAjey7WTxfa1RiS8j+kZlfZVnKoK21r45+1IYBTA1GA+k874IzxVKh2uI/HajCc2Ek9lP9m08ZM9bLdbA3x3OvPstAtUwFt6ZDnEBfonMx5dDS4zc3b0fvLzY8949i9Qip9iNK05KIN3VRBeGaKdP0Xe/+Fmx+h7Xn8c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ln06VOsV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85366C4CEEF;
	Mon,  5 May 2025 22:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485152;
	bh=g2WEwrfaj+A0D0qzRR2dwBV3cowTvNzMAGlu4M30mDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ln06VOsVAt4RPKtyYTk/y6Es1/acfqhb9td1QjOU3dOUBeFZlcmkOaGsEwtWfbbdR
	 mjD9lj3g0mjLXWs5mxVKBGnv5WzJf/q4HoT2DAroEJjn/91ezPPdockb5/bVZPscvf
	 S+q66qCYngBAlCUqw+5zzhf6j/7wY+OgfPgPn1LqnvE1AIXtCqDRoP20XfHfRcHpje
	 fVTUN0KGAI0adVpSmSTWmHPUeew5zqbriEBeR6t/3bvd4guoqHLpbW1H7qwV12H0IS
	 SZr5OzL2m1ckB44/P9MVYVUBRxHZqwJv9IEu4ogfw95+SW8PvmQOz9/PR6B5abi/FQ
	 zwLmHF9yJVG2g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Markus Elfring <elfring@users.sourceforge.net>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	patrice.chotard@foss.st.com,
	mchehab@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 187/486] media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
Date: Mon,  5 May 2025 18:34:23 -0400
Message-Id: <20250505223922.2682012-187-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index 67d3d6e50d2e2..ed3a107965cc9 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -797,13 +797,12 @@ static int c8sectpfe_probe(struct platform_device *pdev)
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
 
 		/* Acquire reset GPIO and activate it */
 		tsin->rst_gpio = devm_fwnode_gpiod_get(dev,
-- 
2.39.5


