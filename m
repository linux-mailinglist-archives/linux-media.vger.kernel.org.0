Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2123A69DF3
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 23:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731366AbfGOVYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 17:24:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52810 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730076AbfGOVYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 17:24:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5CB7628B67E
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 1/2] media: Don't default-enable "ancillary driver autoselect" if EMBEDDED
Date:   Mon, 15 Jul 2019 18:23:15 -0300
Message-Id: <20190715212316.352-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212316.352-1-ezequiel@collabora.com>
References: <20190715212316.352-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Admittedly, it's not easy to say what CONFIG_EMBEDDED really should be
doing, just as it's not easy to say what is "embedded".

In any case, the very description of MEDIA_SUBDRV_AUTOSELECT
specifies that embedded systems usually don't want
to enable this autoselect option.

Therefore, drop the default-yes, when the CONFIG_EMBEDDED is chosen.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 21cd9c02960b..8404e80aa38e 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -190,7 +190,7 @@ config MEDIA_SUBDRV_AUTOSELECT
 	depends on HAS_IOMEM
 	select I2C
 	select I2C_MUX
-	default y
+	default y if !EMBEDDED
 	help
 	  By default, a media driver auto-selects all possible ancillary
 	  devices such as tuners, sensors, video encoders/decoders and
-- 
2.22.0

