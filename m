Return-Path: <linux-media+bounces-19100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B429906CA
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5A46287979
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F10C1C7604;
	Fri,  4 Oct 2024 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yu8G66oZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6041AA781;
	Fri,  4 Oct 2024 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053254; cv=none; b=DnhZmDW4TPiXqWm2CtM5Ja7JPfJjaBEZWfn/+wArYWPYXHY0x81OG+vOt2uM6VZUq2sg8RGh4ujujL++vJ3BPWJCsqYwHD7ava1JH07ifvJFn2fzCoo2YDBEQ5As4P6BTd79w2UM0e/FNuWM20WmJC/aVCfmHnjAlwwkUbfNytE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053254; c=relaxed/simple;
	bh=6fdywc+cwHNt5RhThvIeXc9zfPMryohuBnbUtfZSyhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2Cd216rMx0Vu70ZHPLq6jyjFv3ff2gTNoJeMCHXy2puEluDGBH3+uFzhzUTFeaZugdk+nP/EbCa/nK9S2y9c2yKO8SHY/VJRMyAf1jSPSAovgLYytuLU+VNOGnMmTBOCO/Dif6+3iP5fmCLBRn7+nsaul8S/NzTlI/BWs5J0D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yu8G66oZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 425D315A8;
	Fri,  4 Oct 2024 16:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053145;
	bh=6fdywc+cwHNt5RhThvIeXc9zfPMryohuBnbUtfZSyhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yu8G66oZL2cD/WpIpG00Zj0VkW+qsXjxuTERD06uDGYRiKM7c/Avh8oYp7sTHc24u
	 5GaQUmMYx8AcV3rep+FVt8epRsqSAluvQFUGM8NMwXZGaysjZvohYvdPLujdBCzpZI
	 gPfkQhT6KpUrU/TAgVlR2RMwnLkrfWUCU48Qi350=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:41 +0300
Subject: [PATCH 10/13] media: i2c: ds90ub960: Reduce sleep in
 ub960_rxport_wait_locks()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-10-e30a4633c786@ideasonboard.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
In-Reply-To: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=6fdywc+cwHNt5RhThvIeXc9zfPMryohuBnbUtfZSyhk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///vrp6tBCvdYYky9HEEsPvqymb2hMB4DKjcW
 Ci8lHttoI6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//7wAKCRD6PaqMvJYe
 9XS2EACqljzonZYt9wRcN57HrvjAPaCWfqqaU7XQ+edybGxrik46osbv7WcqmXNIlypoQdoWNtZ
 BGmd2fpO91cCA26tBE23RBU259PbfzjOpBSi9ZkuHTDEByDU5pwq/DWaW3kTjEZjPBDvmv5foJ6
 iLOmG/bjJMWXmuHAdtvwdwvuQLXp+AWRPfg93raeJ+7djLA3BV8Gy9RO2zWN0ipJZw8QQ+V4HEw
 c4kjQVhYb8RSnqkgoVGJ25CyMnW/WhncPgOXjAzZVEnvsgGeEEdKVsicY9OC6NePqrDM784xdhl
 7cB3xljZhYTJph2O4H9zRyHqcWJZu91jgHY5ddUuCYi3l0vPBppnHcH02+cOqmln7rN2xx56HIj
 DyTmibLfQKkECNYnjstfHQNm1A0MhkR/34xcmpcqLPOk5ATxwjCAorMqwimmJqwI5Q1hLecivHX
 mT4GAT7ZHdjmacROGSuQ4QN/e+Mq/8oUtR58a1M5cJc5/j0icrPfDBGT4qdb4fy2Ym9R+2kQfYh
 My07nbC0Tm4q5BrDdrMwr1gGpsFri2zClrCu9HvzGGo8ahdAYKBV/KJ0oKgqj3S4foYTH502vJX
 Gs6o+Ww406ncfLMqTrZyX5PPfaQt87vA40aEMObnqYO9EC38U6fhwQDj+k0WEHnXAbcjtVLnDfH
 2ugCKTkZ3fmPj7g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

We currently sleep for 50 ms at the end of each iteration in
ub960_rxport_wait_locks(). This feels a bit excessive, especially as we
always do at least two loops, so there's always at least one sleep, even
if we already have a stable lock.

Change the sleep to 10 ms.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index d4a3759bc568..ab5330db4162 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1575,7 +1575,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 		if (missing == 0)
 			break;
 
-		msleep(50);
+		fsleep(10 * 1000);
 	}
 
 	if (lock_mask)

-- 
2.43.0


