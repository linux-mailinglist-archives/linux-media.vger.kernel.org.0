Return-Path: <linux-media+bounces-19085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D4B990070
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 12:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71D6D28466F
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 10:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A8514A08E;
	Fri,  4 Oct 2024 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5QNRkmW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38143CF74;
	Fri,  4 Oct 2024 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728036169; cv=none; b=PpylCFqIBsIk7/7suFG2eqsCY4FSjWa2BtT+3+sw9B4Blij4FpdGezqjbBFtZdBovZvndHUvTVwQngJyOXfFw1/3WdvSCzqlAYSIg+Szl2alisaVt8ctrGNa7ipBjfSQyjW/qVHJbUeexRIVbvLy6csBrb9Ft0IblxY6NNA+tUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728036169; c=relaxed/simple;
	bh=vr5NqSC5uXNJKkc7DBKfbxu6d6QS50mMwkxzdrdXIoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gX9x0rmfd131ermrwHCwFRqt5HhIy40wYPgf0xN/5z7HCFfcsgAtGd7S/CQ8zklinxo46XnPi7q0L7S6B6Je0q89dGvPFC9cnh4kiWOtFAQ3sZudpmBDBjsVJNIwhJJAH9dEddZccwXeZzn4X7/3RCOirgVSr1iXRBkVOYVDi18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5QNRkmW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A227AC4CEC6;
	Fri,  4 Oct 2024 10:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728036169;
	bh=vr5NqSC5uXNJKkc7DBKfbxu6d6QS50mMwkxzdrdXIoQ=;
	h=From:To:Cc:Subject:Date:From;
	b=T5QNRkmWKnyRRPiX8Lknp2akQ1hc17ws1NDT7jEbQwXVs5Gpyw7t+T9R9zh8u36N2
	 kS9Z1rpen9PVcU/aHC0E5IvrznvFc4ZvDhOv0RMkEeh57riARxQkEAqZZJVTGb0vRI
	 9NqqFkrrT90JMnlAaw1u4xiXZh6WT96KwtDA5i9yACzvdgk+lTKvG9NOyPtVdWVWxf
	 uHzCKKAzLKkk90YTwbR7BUyktJrUMxAi8+oY/dqRHd0VwFOpttVLX9g/110B2yNrVR
	 2A7H0dAl7VRMnITpYVKyzmawtKX53FN1FsJRO7hAGQYMmNMF0vVsvd2i4zipJQrHxA
	 YavTnEXybgMwg==
From: Arnd Bergmann <arnd@kernel.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] media: cec: seco: add HAS_IOPORT dependency
Date: Fri,  4 Oct 2024 10:02:23 +0000
Message-Id: <20241004100223.638190-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This driver is now enabled for compile-testing on architectures
that may not have I/O port access:

drivers/media/cec/platform/seco/seco-cec.c: In function 'smb_word_op.constprop.isra':
include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT

Add a Kconfig dependency again.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/cec/platform/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/Kconfig b/drivers/media/cec/platform/Kconfig
index b672d3142eb7..e40413609f53 100644
--- a/drivers/media/cec/platform/Kconfig
+++ b/drivers/media/cec/platform/Kconfig
@@ -99,7 +99,7 @@ config CEC_TEGRA
 
 config CEC_SECO
 	tristate "SECO Boards HDMI CEC driver"
-	depends on X86 || COMPILE_TEST
+	depends on X86 || (COMPILE_TEST && HAS_IOPORT)
 	depends on PCI && DMI
 	select CEC_CORE
 	select CEC_NOTIFIER
-- 
2.39.2


