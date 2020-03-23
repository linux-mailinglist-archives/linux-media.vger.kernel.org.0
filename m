Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0078B190007
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 22:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgCWVKk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 17:10:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40470 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgCWVKk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 17:10:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 527E2296003
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Michael Ira Krufky <mkrufky@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 1/2] media: Allow to enable the media controller API unconditionally
Date:   Mon, 23 Mar 2020 18:10:21 -0300
Message-Id: <20200323211022.28297-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200323211022.28297-1-ezequiel@collabora.com>
References: <20200323211022.28297-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to enable stateless codec drivers, such as cedrus
and hantro, the media controller API needs to be visible.

Remove the dependency on the support intermediate
configuration in order to allow this.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/mc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index 3b9795cfcb36..9382e35211ca 100644
--- a/drivers/media/mc/Kconfig
+++ b/drivers/media/mc/Kconfig
@@ -5,7 +5,6 @@
 
 config MEDIA_CONTROLLER
 	bool "Media Controller API"
-	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
 	help
 	  Enable the media controller API used to query media devices internal
 	  topology and configure it dynamically.
-- 
2.26.0.rc2

