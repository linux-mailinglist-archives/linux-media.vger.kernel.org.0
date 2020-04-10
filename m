Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D885A1A414F
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 06:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgDJEBl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 00:01:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726650AbgDJDr0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Apr 2020 23:47:26 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A4FC214DB;
        Fri, 10 Apr 2020 03:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586490446;
        bh=MnuWYLFkdb1YHimhXS6d0CxSVI1WAlx/FlXUz917YfU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ReroZd5ySQK0xS1Kgv1IK+3YgMYzeMXYzYRids5u71oK47smkxSlLAoAd2WSJpSm5
         VoDg2UvWxV9WQxMmRdDZx9S/0qwvmYggRDDkKectDdhc4Zc3HCu4maEknJAigILXLV
         s+6YwieRjJq8KP8KUwE2LKQ+lIWlD0j7e+cNhhdA=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>, rdunlap@infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 42/68] media: i2c: video-i2c: fix build errors due to 'imply hwmon'
Date:   Thu,  9 Apr 2020 23:46:07 -0400
Message-Id: <20200410034634.7731-42-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200410034634.7731-1-sashal@kernel.org>
References: <20200410034634.7731-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Matt Ranostay <matt.ranostay@konsulko.com>

[ Upstream commit 64d4fc9926f09861a35d8f0f7d81f056e6d5af7b ]

Fix build fault when CONFIG_HWMON is a module, and CONFIG_VIDEO_I2C
as builtin. This is due to 'imply hwmon' in the respective Kconfig.

Issue build log:

ld: drivers/media/i2c/video-i2c.o: in function `amg88xx_hwmon_init':
video-i2c.c:(.text+0x2e1): undefined reference to `devm_hwmon_device_register_with_info

Cc: rdunlap@infradead.org
Fixes: acbea6798955 (media: video-i2c: add hwmon support for amg88xx)
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/video-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 078141712c887..0b977e73ceb29 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -255,7 +255,7 @@ static int amg88xx_set_power(struct video_i2c_data *data, bool on)
 	return amg88xx_set_power_off(data);
 }
 
-#if IS_ENABLED(CONFIG_HWMON)
+#if IS_REACHABLE(CONFIG_HWMON)
 
 static const u32 amg88xx_temp_config[] = {
 	HWMON_T_INPUT,
-- 
2.20.1

