Return-Path: <linux-media+bounces-3671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 108BD82CF73
	for <lists+linux-media@lfdr.de>; Sun, 14 Jan 2024 02:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8248C1F21EB8
	for <lists+linux-media@lfdr.de>; Sun, 14 Jan 2024 01:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA1CA3F;
	Sun, 14 Jan 2024 01:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gK2jf0Q9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EC37E9
	for <linux-media@vger.kernel.org>; Sun, 14 Jan 2024 01:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4D2C433C7;
	Sun, 14 Jan 2024 01:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705195685;
	bh=mRWMV6DXOmIyKIEPrsw/RN5E91S0KtOhE0j7NVko5tQ=;
	h=From:To:Cc:Subject:Date:From;
	b=gK2jf0Q92Lw9T7ek+tiIkXhC8cr9u+3ZdpvvEzYD9LfsO5qnut1WLxaaCtP70VqQp
	 dP24unMp2l5ac2uWBRG85upUSq1mjN/xub7V72cznMvpqCW4kRGhyPlt8SmC0n2QVh
	 1g3yiqBehGVo+HYwYhCU53Z3R3wpTpgl1zEt8Siec2efEPCf4FN1v9Y5o3Iv5TIdLe
	 h++K9OQEoTYKpW8Ze1SLqO1C1EXi1bO5+FDAczFyx6OwLVf3W1/xkZoZ5ABfFCdQAU
	 QKzBxUK0884ormowvVjw+nq8Bvly+iyZC2zoYB0NkBEqO01AjmpvDZEUb9zt9C5ZMT
	 nwvP3DF10ey1w==
Received: from mchehab by mail.kernel.org with local (Exim 4.96.2)
	(envelope-from <mchehab@kernel.org>)
	id 1rOpIA-00A8B0-1h;
	Sun, 14 Jan 2024 02:28:02 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] [PATCH][TEST] This is just a test patch. Please ignore
Date: Sun, 14 Jan 2024 02:27:54 +0100
Message-ID: <20240114012754.2414683-1-mchehab@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This do-nothing patch is just to check if patchwork is properly
handling patches after its migration to version 3.0.

PLEASE IGNORE.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 159c72cbb5bf..035fceba9dff 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -5,6 +5,8 @@
  * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+/* TEST patch - please ignore */
+
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
-- 
2.43.0


