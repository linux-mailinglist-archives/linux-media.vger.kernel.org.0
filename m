Return-Path: <linux-media+bounces-28267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73703A61E68
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 22:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 390FD7AF3F1
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 21:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AD71FDE1A;
	Fri, 14 Mar 2025 21:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQUCEVSu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A426919049B;
	Fri, 14 Mar 2025 21:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741988343; cv=none; b=TIumhe4Mv3ldwZ0ACc+q1ffHTFmTWd9AWAm+djgc/yK/av4dkY8hrzZ0fjZHfTMzEZALaDVKW9JQz+fqiFodxdiAz9CdlQ7AAINiR/5R7TpshZenvB37TtmnRC+8iieV4Hnhfl+MbIAUOpF/6zqfCpDMjHCcGzIHO2UOoqXLbTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741988343; c=relaxed/simple;
	bh=DV0B++AIxOfovPlHYfMJUXmIqNygA9ue3XHOPrlRLy4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ahzo2fbqnhg8M5F9k2/Tb7dUgcvgd0oiefc3sov0eUIUl9Cfmm1GQyuXfPQqKZlqfjnXzwJPKt99MlWYRLRn8KSzxAu8+R43W6Dl/deK9IJVPMCwniIg2nYqoX3pLNQkfCRZzxx0LaiENVMcLQUvQo8jWbAsxJ2+pwtRhIdqCN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQUCEVSu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915FCC4CEEC;
	Fri, 14 Mar 2025 21:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741988343;
	bh=DV0B++AIxOfovPlHYfMJUXmIqNygA9ue3XHOPrlRLy4=;
	h=From:To:Cc:Subject:Date:From;
	b=cQUCEVSuuop90zHY3cNgMwT7s9LFou0cq/wpxbZMX1+3FlprF01GAgFq0y/D6PGcm
	 I2AewcFm+W8rejzfbeQQhWWSGM3vo7G+cpIjQPZ7ZhaTvEkR7OZft0M8X6F9SOdhFx
	 SwIckM0MLwPuk5Oq3ieYesr5Rg9MyFg7iSgtZ+We9KSUcY4IzMrAmTXfsDR9ZChoeY
	 SSXHquoKc+PMfAQ72nBkqsY2Z1dMdx/4RZYPJUfrHed1eUrV5FIiAM/uEYN52CVtzw
	 yMTJ/BVzye2/gCg3op54GC3b3HYtlpHasVedq7EuuSftBpRdtimWoTXWzkW4dH9oIa
	 UK7D/tojRC5SQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Slawomir Rosek <srosek@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: vivid: fix FB dependency
Date: Fri, 14 Mar 2025 22:38:55 +0100
Message-Id: <20250314213859.3543936-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

It's not enough to have a dependency on CONFIG_FB, as that can be in
a loadable module when vivid itself is builtin:

drivers/media/test-drivers/vivid/vivid-osd.o: in function `vivid_fb_init':
vivid-osd.c:(.text+0xdc0): undefined reference to `fb_alloc_cmap'
vivid-osd.c:(.text+0xe26): undefined reference to `register_framebuffer'

Change the dependency to only allow configurations that can be built,
but change the FB to FB_CORE so this is also possible when using
DRM with FB compatibility rather than full fbdev.

Fixes: 20889ddede38 ("media: vivid: Introduce VIDEO_VIVID_OSD")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/test-drivers/vivid/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
index e95edc0f22bf..cc470070a7a5 100644
--- a/drivers/media/test-drivers/vivid/Kconfig
+++ b/drivers/media/test-drivers/vivid/Kconfig
@@ -32,7 +32,8 @@ config VIDEO_VIVID_CEC
 
 config VIDEO_VIVID_OSD
 	bool "Enable Framebuffer for testing Output Overlay"
-	depends on VIDEO_VIVID && FB
+	depends on VIDEO_VIVID && FB_CORE
+	depends on VIDEO_VIVID=m || FB_CORE=y
 	default y
 	select FB_IOMEM_HELPERS
 	help
-- 
2.39.5


