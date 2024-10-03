Return-Path: <linux-media+bounces-19065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF198F5BC
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 20:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92F9528334E
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 18:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9229C1AB531;
	Thu,  3 Oct 2024 18:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="K2zfvg0i"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EABD1AB507;
	Thu,  3 Oct 2024 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727978569; cv=none; b=qHBlwM10DJeVPf5dJuyXV+uXV6vHTZu2Oq5/maO/bat77MNDKxew8vx2IrHClhbzSa0diBU0cKRUSnTxyCXZUvAIKYz3myotc8NZuRyhnjvWY/JPZ+2BpbJAX0CPIXwSz+wUJDNZ2PjXbe9gsuXYsU37W2qe5YBhCLVDnYPDa6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727978569; c=relaxed/simple;
	bh=BwQl95qn8NQHVnbYBOg3nyDaq+TN5ZnTOOCyjX7yN3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CmNcph9J+naspNMDPF7iJdbrieugjFFvbVM4gA9SqQK9c+VDF5U8j/9rW6UCwV82Rsfcxk366gDG7cAGSPaJ2VNIUrf28LAgW5ShEidFbgI6vYyuiQpxDCp1Qoqo9Jm0xwffHxjkbtekY6DCT3Zf1mCDP6850gnoWg1HrPYNiEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=K2zfvg0i; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id wQ1HsjqreQ2lWwQ1Hs9Yfl; Thu, 03 Oct 2024 19:53:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1727978025;
	bh=BD85zUf1cnOXS4ei1Z72y4kXkRVVXUgHE87cq6s1DA0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=K2zfvg0iyqieGGioeJQw1CQ6c2xARmb/fILtfGpLXxRq2FP/GptyJ7GbCpN3xc0Mo
	 ihOf7kTg0pnZ9JcziMh5uB+qkF2Ev8WbHnnCoMDo7udKzj2Qw3Pixku2melLuC8HTu
	 ExnYbqJz5eQOEWYLB/szY9OsIDpuOAlKjlxNcKcdmr5JpVqAXZ0WY1ubdYaAxYkcaJ
	 NdQG5eyQlHdSdP7m1E+g/lA2obglXBJfQmdKeppjyTOLZqnmDwDTyTYSQ8OXpEznGJ
	 xy5d40WWeAT4lL9RZKjXp5i5o+yyTiQC3WNg5aUDOroOGJudTrJ9V/Xs1ZveeKl/9f
	 WeCZb69sGkHxg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 03 Oct 2024 19:53:45 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: vgxy61: Fix an error handling path in vgxy61_detect()
Date: Thu,  3 Oct 2024 19:53:15 +0200
Message-ID: <666ac169157f0af1c2e1d47926b68870cb39d587.1727977974.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If cci_read() fails, 'st' is set to 0 in cci_read(), so we return success,
instead of the expected error code.

Fix it and return the expected error.

Fixes: 9a6d7f2ba2b9 ("media: i2c: st-vgxy61: Convert to CCI register access helpers")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/i2c/vgxy61.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
index 30378e962016..8034e21051be 100644
--- a/drivers/media/i2c/vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -1617,7 +1617,7 @@ static int vgxy61_detect(struct vgxy61_dev *sensor)
 
 	ret = cci_read(sensor->regmap, VGXY61_REG_NVM, &st, NULL);
 	if (ret < 0)
-		return st;
+		return ret;
 	if (st != VGXY61_NVM_OK)
 		dev_warn(&client->dev, "Bad nvm state got %u\n", (u8)st);
 
-- 
2.46.2


