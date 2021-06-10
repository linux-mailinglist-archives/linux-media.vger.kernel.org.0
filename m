Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 086173A364E
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 23:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhFJVrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 17:47:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:54276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230487AbhFJVrA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 17:47:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19B1F613CA;
        Thu, 10 Jun 2021 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623361503;
        bh=P0W2KJ4lzuzwWS6G/VqMgKtWboi7bu1bEPiy8Gk27bA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bk+P31Vcczg79DOEhKZYLisjfWMS1pomZiAAU6ijgXlVDNL419cxL0Ic3e+ajxpQt
         VEjQUmlUnmuaAr8tbZ7uFUohE9EEY5zJawTfyO3VJbC6FIVu1WHSYXTmCNWQKn4uEU
         lbjRyvYti+7w2lUQd1e4/Z60ZbjyvwvO3zAHllXBscZo02phLxDMk4PwEDE4O3aJM0
         TLSZXLCuNjMu+OgbFSaZjGf2brQPx/kszy4OaIIwIegN1hLeYeFrUisfbe5n7pLGEI
         EmaT9Th2KRaqom9BjblutrBcd2+TRIYjkMVeFFVUyqVjKJlC5noWmWQ1uUZtM12TmZ
         l4tsbpLM8WL3Q==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 4/7] media: v4l2-core: return -ENODEV from ioctl when not registered
Date:   Thu, 10 Jun 2021 23:43:02 +0200
Message-Id: <20210610214305.4170835-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610214305.4170835-1-arnd@kernel.org>
References: <20210610214305.4170835-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

I spotted a minor difference is handling of unregistered devices
between native and compat ioctls: the native handler never tries
to call into the driver if a device is not marked as registered.

I did not check whether this can cause issues in the kernel, or
just a different between return codes, but it clearly makes
sense that both should behave the same way.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 0ca75f6784c5..47aff3b19742 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -1244,6 +1244,9 @@ long v4l2_compat_ioctl32(struct file *file, unsigned int cmd, unsigned long arg)
 	if (!file->f_op->unlocked_ioctl)
 		return ret;
 
+	if (!video_is_registered(vdev))
+		return -ENODEV;
+
 	if (_IOC_TYPE(cmd) == 'V' && _IOC_NR(cmd) < BASE_VIDIOC_PRIVATE)
 		ret = file->f_op->unlocked_ioctl(file, cmd,
 					(unsigned long)compat_ptr(arg));
-- 
2.29.2

