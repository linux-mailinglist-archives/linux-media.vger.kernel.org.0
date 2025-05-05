Return-Path: <linux-media+bounces-31780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADE5AAABFF
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0199A0A03
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B70C37EA7E;
	Mon,  5 May 2025 23:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaUpI+aS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5508F2EDB36;
	Mon,  5 May 2025 23:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486554; cv=none; b=FgQdjxZRYZPxfVtOr+d/yJYqAPb11rT+2QqmjPSqZYYhUEsTEG9D9Z2Qg8YR6yKNjv+2a2KSWVpxyyE6ZD9gGKPwANL6hm6+wZRQ1srB7EOw8dO4ppGH9ZtSknnJXRyaEyxQyRp7xK0d+ep2bG6lPLenqKcuZNYK0j9x7Ilhg/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486554; c=relaxed/simple;
	bh=jsoHvHLDzA/XTT30/MF/phkHAm8+PsqfqsZss3bnfOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pqLN7LdqXOK9eUrVpJBYWxEDDw+oUJn/2BjqfjvONoEHI6Gf7Joz7XlZ98fJiyjAdUOJAshQXtS3qVZKrT3uPTLBuifkNLNp9BJfZmPhCZaYOoNMn4Xsm2mb7nhY74PAZEXY4JV4WmSnbIECt6oXiuoYM9bzAVIke1xkdYHjDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaUpI+aS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A421C4CEEE;
	Mon,  5 May 2025 23:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486553;
	bh=jsoHvHLDzA/XTT30/MF/phkHAm8+PsqfqsZss3bnfOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oaUpI+aS0ZlRP1r+uvpPVTeNEDKcfYvvVD91kqCn+pRDGLDQJP6jgIcYwnFzjlFTV
	 4c6VP4sriPhuZDVOpbxFVyVLkWOzvwnEfvZ6mSCmSb4uOfnzSZqQ8eDuw4g4/tUwKK
	 gQiSS5xYr+YcZ2x9kr9heYEfwWv5EZm58Yuz4OQFZ46QIEa4VMc51IfZ7TJJwrYicc
	 M7EW/2Izc76qR5+8HWhJQRqBB2ebOXWUWaHjKLdnXGAw5yDnhgG9JfV7ydY4D1cJWp
	 P/BRDOWDO+JOuj2fbVW09c9Gqqh6oC4CuFfd+z51StMkHgJq+HGVxmEVTAdbd8NMeG
	 VdWy2pBREhi8A==
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
Subject: [PATCH AUTOSEL 6.1 087/212] media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
Date: Mon,  5 May 2025 19:04:19 -0400
Message-Id: <20250505230624.2692522-87-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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
index 1dbb89f0ddb8c..b2a977f1ec18a 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -802,13 +802,12 @@ static int c8sectpfe_probe(struct platform_device *pdev)
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


