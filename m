Return-Path: <linux-media+bounces-2282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F059E80F983
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 22:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5A491F2130B
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 21:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B6E64155;
	Tue, 12 Dec 2023 21:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jogJziO6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5046413B;
	Tue, 12 Dec 2023 21:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13DFC433C7;
	Tue, 12 Dec 2023 21:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702416993;
	bh=7eLZmT4c+fhFsyeFMw0JfCmjrU8I9lIkdJtLdS55xkI=;
	h=From:To:Cc:Subject:Date:From;
	b=jogJziO6KMjsDBdgTJ3ForpAxZ2uFB69WZGXd3/IfFyg5tI+o5RHURJQ5VRTxE6Fr
	 C7Zbo3zE8fb2bRohJVE808bYOONGZLkZg+KBkwOZb/yHfUpsimO4JHhTJed8xjn6Od
	 F2HFZr0skIQJQRqzTV/DbxXbxZG6TLjbK3B3fG+kEHSmDbz7rMlQSFjus3J1wPqEko
	 RqOhl9hRq8kXc/4jUEJunbPBlWk+qDiAjxoZ9XlsuqqVrTkeEcADCMv/QhZvgLqX1e
	 zZ85U+5FZbgw/vVOC6RlquCAdfIJMGzs6J0yNJuKc0qayPp5USq1o1vZsSITFzKmYm
	 c8mZD3flToCpw==
From: Arnd Bergmann <arnd@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] media: i2c: mt9m114: add CONFIG_COMMON_CLK dependency
Date: Tue, 12 Dec 2023 22:18:04 +0100
Message-Id: <20231212213625.3653558-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

With clang-16, building without COMMON_CLK triggers a range check on
udelay() because of a constant division-by-zero calculation:

ld.lld: error: undefined symbol: __bad_udelay
>>> referenced by mt9m114.c
>>>               drivers/media/i2c/mt9m114.o:(mt9m114_power_on) in archive vmlinux.a

Avoid this by adding a Kconfig dependency that avoids the broken build.

Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index aae05142e191..b224c37bfd77 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -228,6 +228,7 @@ config VIDEO_MT9M111
 
 config VIDEO_MT9M114
 	tristate "onsemi MT9M114 sensor support"
+	depends on COMMON_CLK
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor-level driver for the onsemi MT9M114
-- 
2.39.2


