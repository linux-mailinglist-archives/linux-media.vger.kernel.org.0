Return-Path: <linux-media+bounces-34832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D10B5ADA489
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 163811889745
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 23:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B0728135D;
	Sun, 15 Jun 2025 23:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uarof2PP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE852E11A3
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750029107; cv=none; b=TwCE50PBZX9jPATPhefV59Cs8VToqwYZ5YAq6eqYKeMYYE/nWY8RrT6vT2iHkciTrvBM/gEDUvtBvcAOMePTamdla0L4ua9IyNH0Kz1rauzUGZFbnFqx894w7+vOeAox9hVpFybpOO8oNQeiszgOyJj4M77+tdAQUqT2hLFAu0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750029107; c=relaxed/simple;
	bh=o2M8aTJnLUPL1zk8er/JNPhZFreP63h9ZtSwu0XeWgA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=skrq+eN2d+L6mpiBAkMMa0xOuAfS8Ey9/QS3eU/PIkDWAvq6Zb1QSkDcMzC+YsK814SiY/2eGJ6l7pINyLDUon05uJXoj4g2GqHmgBSQ7qUxuKhyMv3ch+6U97GtY7IaDbrVIoUNPDUiRVpJVYylxE2PNDMcyZO09+Le3AL5+yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uarof2PP; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so757900766b.0
        for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 16:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750029104; x=1750633904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IuRC0Xv8GuCK7/0M2ogm1jbfujpFFyPz5eHg0qrJ1d0=;
        b=Uarof2PPigFdrCQ5cQZBLtniVpYV/LhNMvgTznzir7nkiosvEAuIdB0Tlbfa/wTPK0
         DR3kuJOuSkwZItP38epmI26JTk4ewF3nuz06IOs1SUDnx6j6ji8sv5WfV7wDu83GF0Bc
         TlCPZuTno5hLXEWOQS/3PMIU41KVlHFeLNxmKhoj+GMQmdCqpTYeFFpXkpHIYolt0CWM
         8AmsxTFllbLijhbAQAvlBoz5kZopueCwvDkghDK2GitEsYMfGcua2Eal3QC5ZaMyL7Ft
         VyGwoVk/BB9MmzJ/gJ2HwKcRVMSVe4rIGVU6sj5jJjl9GdXWs7Eq3sO55qZeBwOGXI3U
         kiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750029104; x=1750633904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuRC0Xv8GuCK7/0M2ogm1jbfujpFFyPz5eHg0qrJ1d0=;
        b=Aw4Gou/YM1n07GDozfaa1/wo1jAatYa2VbzKj1haftwJrtbTBSz/bM7iepYQpyAhVs
         YzNDEPmHCBM7ZDVsEcYBjRsTArUWU5UqA5cAJwg3F5iYes/zAjQ71TL9F7dg132OKYTD
         0YdXdArRr5r8Ec7odACrA4bReMK2rAlcjD7+xyx1HYDoIjLIb37O5czhAT5gMt6gTcDP
         ZJYu68NWxeDA4eub33phdyA8kmApp2MibZAO+uaZlfbPN2IeDuyi02wb0QapAZ7WROv2
         aNXkkcirHWHwJpFksEdNFnepcXKt6KM5RPNFuA0/HolWySbIJxY956dswt8w5hG+7col
         aIFQ==
X-Gm-Message-State: AOJu0YyQ3wgrs4a3zs0ChcznxmnHpAwr7bSB43YRXiqmstaj5vyWWwM9
	p9ef6Cmkdx654doL841bBOXg2hW/3MUJ1jBb5FiiRiLz80ddur7/f9sK
X-Gm-Gg: ASbGncvVJetTJ9QQ2467b5Udmt9eJq1INRfcNMktvmb3ZyYMDZsoayanIcSaibDnl+n
	eT1P5tbtU5W//BOV/gi0S1ApolVcW79qaw4nQf/u3i+m1WllttDPTIUrHOlfbpiyKlwWAd26+nX
	7gKOjuM4cJy/lvp9+uBxZk+fYgSKcwR5As6IUpvcWOAebrfgoGX+CLeA6L1ntj3a4+dJgkTnw6P
	CnxxKUJ2sdYi/vPAES5ovyySyY7MJFeSMbVBBfUETpebb6p3WxBa93GIqzJtws87pD9vghI8i0Y
	pZ8B0m7JZPyZXSc8uWoI72PM1hKnrhCJR8Lnd8dms8/iSLCu78Fix1bly75es90uYoDluoXz1D8
	ymzeMksObNn8sgKvOdIYt9XO1l9vdFchonhIVO3zWyZ22nv6B5nDilRHH/IoP20NuPb3YE2rZb7
	mXfIcYGHGW1z2XmSLdXU0jgfw=
X-Google-Smtp-Source: AGHT+IFyGA6EW7LECZpZrvsKlkrWn3k+KNaMnoQqSqnxGmyZY0vgQDtyxj8I6kVAvREM6+v/SIhKvw==
X-Received: by 2002:a17:907:ea5:b0:ad8:a935:b905 with SMTP id a640c23a62f3a-adfad437a98mr606897966b.22.1750029104414;
        Sun, 15 Jun 2025 16:11:44 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0704-3500-b0b7-97b6-556d-11c4.cable.dynamic.v6.ziggo.nl. [2001:1c08:704:3500:b0b7:97b6:556d:11c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81baf3esm546347666b.40.2025.06.15.16.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:11:44 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/5] Staging: media: atomisp: i2c: hardcoded function name
Date: Mon, 16 Jun 2025 01:11:39 +0200
Message-Id: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch fix: use func instead of hardcoded function name

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index d35394f1ddbb..f57f2b70909a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -584,7 +584,7 @@ static void gc0310_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 
-	dev_dbg(&client->dev, "gc0310_remove...\n");
+	dev_dbg(&client->dev, "%s...\n", __func__);
 
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
-- 
2.34.1


