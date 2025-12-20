Return-Path: <linux-media+bounces-49228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E6CCD2C9E
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 10:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1153230012E2
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 09:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9058D307AC6;
	Sat, 20 Dec 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b="gY4rXmp+"
X-Original-To: linux-media@vger.kernel.org
Received: from sender2-pp-o94.zoho.in (sender2-pp-o94.zoho.in [169.148.134.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EEE30648C;
	Sat, 20 Dec 2025 09:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=169.148.134.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224573; cv=pass; b=dADtmyR4+fmmsNviwF13cyENZH6YFk9/jgv7SBo6t6gQ4YBhtvx6xMJFpz1Q4juSigLhIAmVi0HoAe7wTh/3ZJC4Y6+6ryqqN+jQ9qKMU7WfTABnJ0oya1QWJzoNEgDMon9F65/7NI+eAsC3D0wOdQmFigW8MRRMxeYkhz7qLrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224573; c=relaxed/simple;
	bh=QC4S4A0dxtSyvs5KO9F2gPy6NDsyk4CJhCUlyY3y6e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNLWP3euICVsYq5EWnNE0/+IgwFN9hYcFAMbI7Z5qmk/fK2DBrDVjVTumHuuWT1Y0s7nwPLyLeHx8px94z7ebT65koV9jzI7hSQSj1aPJvPM4oYb0WYK+k1ZPGRv/uYdlf3J65wk7W/Eg5M48LJeod6anzG0HRYt/tgJ4vD0ihk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b=gY4rXmp+; arc=pass smtp.client-ip=169.148.134.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
ARC-Seal: i=1; a=rsa-sha256; t=1766224548; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=I6cE+X8qpmaG7Zue+/sxvdtz7fRv48rJdac6m0n3K+uXdbf9k4mMR1O1VDP2kqDvlFgCvGDg3EGoWt5makWJtjgW1rZwUqDnNuD2BaTJ/Wismh2vpBK2IwH8PkzSaJAa+yjrFIS4WwYnR8hEXf3ywXtOLXyMi1BG8hE1MTDcsI8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1766224548; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OofW2aCYjbNCIjUw/ER8VfAdyT4D8osctIsy0RUyh8A=; 
	b=E1h8+Bo0lRWlI2AleFJPJ2p+qtEzT+xH4XeKeYjTchMb5HzA5z0kExXyShoHOFXI0af3LplMUvX7KjC4+Wj5BhA9R7eABGqDMZhR/adHnztn2gZLyB2lBDFfxwMMS9nyTJnFhhQQaQRxtrMObaNtVu5Yjb2+J0W4R8Uun4ndQXw=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=preyas17@zohomail.in;
	dmarc=pass header.from=<preyas17@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766224548;
	s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OofW2aCYjbNCIjUw/ER8VfAdyT4D8osctIsy0RUyh8A=;
	b=gY4rXmp+O0QLZA/Qt2nNsO3wHodUzu34252WDJbT8Ssfs7rEjRVRkCWCEDKeHlUU
	Q9f6FztJKolnyK9of8LW9dvc8A9Y7q30Fz4hPDQkvjtYICUsw+3HpPNH/rg25hanV1S
	4Oy8xBOPUQYMYZHDI/6+xg7+XoXg/66lvppU7ef0=
Received: by mx.zoho.in with SMTPS id 1766224547246213.87899705220218;
	Sat, 20 Dec 2025 15:25:47 +0530 (IST)
From: Preyas <preyas17@zohomail.in>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Preyas Sharma <preyas17@zohomail.in>
Subject: [PATCH] staging: nvec: replace short udelay with usleep_range
Date: Sat, 20 Dec 2025 09:55:20 +0000
Message-ID: <20251220095521.36992-3-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220095521.36992-1-preyas17@zohomail.in>
References: <20251220095521.36992-1-preyas17@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Preyas Sharma <preyas17@zohomail.in>

Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 263774e6a78c..6ffe5e8656d1 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -648,7 +648,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		break;
 	case 2:		/* first byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
-			udelay(33);
+			usleep_range(33, 66);
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
 					"Read without prior read command\n");
-- 
2.43.0


