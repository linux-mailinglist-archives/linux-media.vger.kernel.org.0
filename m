Return-Path: <linux-media+bounces-31795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893CAAB319
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 06:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4CBB188A2E7
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E7A20D51A;
	Tue,  6 May 2025 00:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbegpUTf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDF32DBB21;
	Mon,  5 May 2025 23:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486017; cv=none; b=lfK7onktrOV7SXGlO8/Fpp8tCMQvL4Up5HLufTWMIOq8MmCuLx1L0FRnLvw6TEX7YZBoJOJHoroHF1OZb/8Itr01uQmjBWIHY1z20i62t9k9E4KYWhqNqfhWOnc5Y5vYQGsUq7bWrgd1k+m6Csb2u/khOZ0Fpq0ew4kLAVFe06A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486017; c=relaxed/simple;
	bh=nsZXeQ0fo60DthHx1T6W+Gn8kKU2FQWZ87vEbmadKCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CV2XIifMDvjWmgZ6UF9x0yyIhbfiEU2snHfouCbIA8EzCmAFASc0DG72iLNYXMsqNQT+eripRycrprUSAamZD6kZpxISwgdQysLq6SuOtEcMXnzml/kbZ9OImD5mSEZiGiitFKMYiIrn0BYEeV0Xv9W34g/4Sq3yI0sSuwmNQvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbegpUTf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC11C4CEF2;
	Mon,  5 May 2025 23:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486017;
	bh=nsZXeQ0fo60DthHx1T6W+Gn8kKU2FQWZ87vEbmadKCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NbegpUTfbJGh1rBHvrGFqzXoi5sCiep/LlyCfhnlmZbC9/mQbVtD2FGMZom8pA4CN
	 5OkAsIcQkk6rseQDqUwv8MBR+fD/6JcyhBkE/boFvr7kQv8IxoyuB6E5GCv9K+4rui
	 aq2gQERsd1KjoK0cGEgmltVp7IVyCXV/sclm4wdEv4ioFzdjg+Nim4z+3epxXrKSKV
	 nzQ5tSiP8998TWvPCLFxm8ApGl6e5caK0aGocpkU25gZntVBc9WI2PTzsCoJEm+n+i
	 mVR4YF+ukfIRf0KnrqJJQDCigZFMj//sPMX2xdWwIjTzOEyiKueLe2HbwhyRp+1Ijt
	 kATdYusR5Mzbg==
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
Subject: [PATCH AUTOSEL 6.6 112/294] media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
Date: Mon,  5 May 2025 18:53:32 -0400
Message-Id: <20250505225634.2688578-112-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 5dc1f908b49bd..9aa484126a0dd 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -806,13 +806,12 @@ static int c8sectpfe_probe(struct platform_device *pdev)
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


