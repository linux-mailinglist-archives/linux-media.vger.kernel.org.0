Return-Path: <linux-media+bounces-44806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C8BE6885
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2761219C45F8
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 06:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B361930E83B;
	Fri, 17 Oct 2025 06:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LScaZyq9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1941623EA9B;
	Fri, 17 Oct 2025 06:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760681199; cv=none; b=IMn3iPNend5uEF2S1BJa50c9kULsW8xjG3r2PGVnWhZzMlOTMoZPjSgtBR6+PvLTkTJbM95PsP/XS8CuJm3/pC8DNxaETl8Q3l2dstGvGS8grQoK5/px+G5nB6gSjPEkm8XhD/hR879S0JCxJ7b6pF9VNNWkJXnuiaUlXiUh1iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760681199; c=relaxed/simple;
	bh=HrBJGINM6xksB6tRgv57BbyJn6m7l1J1MI4fT6bbr9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fcBDMkIY4BX2HICfGhQyI7fdSEVB9TLdF2xgRXSf2UkcES12LQNA+7Ua07p+Ycp4Tq35Dl1DMpuRKHfK6WzqVBoFb6/TwVFAvDocAs96UzBdmxwAP2TUmig7Wb67+h9C2a0RPJCqoBnvGBEcCcs04sXdXT1PwnW75K5g9MMtG7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LScaZyq9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9A9C4CEE7;
	Fri, 17 Oct 2025 06:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760681199;
	bh=HrBJGINM6xksB6tRgv57BbyJn6m7l1J1MI4fT6bbr9I=;
	h=From:To:Cc:Subject:Date:From;
	b=LScaZyq9SXG6RwII1C6g6ecGKtNcp4t8Dk4HJeGlk2ypemA+8QzrVgZ7seeMQ9VIu
	 h9Uq9hLXMCNtfoe987fK/UFQENUBwYkYs1G+RhMfZeI8nGOjEBt3K4AL2AEkaa/5fz
	 5pxGHPdCMMbRL1JMcURX+oSh/L5+uQW6mQZ0dj55cFwucYmoOV9jCfovm+KKWUgkya
	 0iDnG/mObCzL64dI/67eAj5QTQGK9p/JJhqv3zUsjaf+RmWbQ2bYNh9GdZdwGV/5AK
	 Qcb67TQgzkDgMFAgyDMn+GezzW4p93r7TkJrzjP0a8NCn/FM4R5pW2Sm2gR2rCwXqw
	 X0Yk7FnOR/VYg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9dbt-000000002Gu-35w7;
	Fri, 17 Oct 2025 08:06:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] media: ir-hix5hd2: drop unused module alias
Date: Fri, 17 Oct 2025 08:06:26 +0200
Message-ID: <20251017060626.8693-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver has never supported anything but OF probing so drop the
unused platform module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/rc/ir-hix5hd2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index afd80d2350c6..edc46828509c 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -402,4 +402,3 @@ module_platform_driver(hix5hd2_ir_driver);
 MODULE_DESCRIPTION("IR controller driver for hix5hd2 platforms");
 MODULE_AUTHOR("Guoxiong Yan <yanguoxiong@huawei.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:hix5hd2-ir");
-- 
2.49.1


