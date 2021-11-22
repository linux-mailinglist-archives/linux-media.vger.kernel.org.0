Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C259458B53
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 10:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239070AbhKVJ30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 04:29:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:59076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234761AbhKVJ3W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 04:29:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDC3E60F5B;
        Mon, 22 Nov 2021 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637573176;
        bh=utrYONIryoh2Eca6ndcd8c6SanN6tqGHUHOVSgYssps=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MDYt3oeJfFqVS6J9tMGhkYNeFHVkpXhkLHoTWEPWwq6zUgsck58Ye1jWaNzi0AUs0
         RA5Ao23dX8z2chZVTdU6NFHKXM7PXGZgj8VH/6f4zNZgWVXoSbNUHUpgnV8OARtMPm
         +U41ga/Ssz2Efu1doWC0ReNDCD4x906ksd/V7cqs33URcFtQiwhFuogtESZOp/uIW8
         cv/KQfhEWC/iF2Uq5euIfa7jrrG6AzgUeSTTkmaJH7/w6zX4/5oEXr2gchiAnmmTHD
         8LoTaqqpXPqIYJb0+Uuk9URVlcsOZv/NpNpbl37SmQMZobsHK+kLX+/qUUumSEHF+T
         i6G6rUnED/Taw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mp5aX-003hiY-69; Mon, 22 Nov 2021 09:26:13 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Evgeny Novikov <novikov@ispras.ru>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Leon Romanovsky <leon@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 08/10] media: marvell-ccic: drop to_cam() unused function
Date:   Mon, 22 Nov 2021 09:26:10 +0000
Message-Id: <dc1b7d18939cffaec84436654b2323f314d25a6a.1637573097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637573097.git.mchehab+huawei@kernel.org>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This function is an alias for container_of() that it is currently
not used, causing clang warnings. So, drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/

 drivers/media/platform/marvell-ccic/cafe-driver.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/cafe-driver.c b/drivers/media/platform/marvell-ccic/cafe-driver.c
index b61b9d9551af..03dcf8bf705e 100644
--- a/drivers/media/platform/marvell-ccic/cafe-driver.c
+++ b/drivers/media/platform/marvell-ccic/cafe-driver.c
@@ -139,13 +139,6 @@ struct cafe_camera {
  */
 #define CAFE_SMBUS_TIMEOUT (HZ)  /* generous */
 
-static inline struct cafe_camera *to_cam(struct v4l2_device *dev)
-{
-	struct mcam_camera *m = container_of(dev, struct mcam_camera, v4l2_dev);
-	return container_of(m, struct cafe_camera, mcam);
-}
-
-
 static int cafe_smbus_write_done(struct mcam_camera *mcam)
 {
 	unsigned long flags;
-- 
2.33.1

