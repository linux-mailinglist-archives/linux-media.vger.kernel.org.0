Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6E72190009
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 22:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgCWVKq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 17:10:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40486 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgCWVKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 17:10:45 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A5D79296002
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
Subject: [PATCH 2/2] media: Remove VIDEO_DEV unneeded dependency
Date:   Mon, 23 Mar 2020 18:10:22 -0300
Message-Id: <20200323211022.28297-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200323211022.28297-1-ezequiel@collabora.com>
References: <20200323211022.28297-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable VIDEO_DEV (which compiles Video4Linux core)
when MEDIA_SUPPORT is selected. This is needed, in order
to be able to enable devices such as stateless codecs.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index b36a41332867..7de472ad07a2 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -93,13 +93,11 @@ source "drivers/media/mc/Kconfig"
 
 #
 # Video4Linux support
-#	Only enables if one of the V4L2 types (ATV, webcam, radio) is selected
 #
 
 config VIDEO_DEV
 	tristate
 	depends on MEDIA_SUPPORT
-	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
 	default y
 
 config VIDEO_V4L2_SUBDEV_API
-- 
2.26.0.rc2

