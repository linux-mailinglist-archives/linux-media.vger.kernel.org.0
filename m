Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7725418E5C0
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2020 02:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbgCVBSo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Mar 2020 21:18:44 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45221 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbgCVBSo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Mar 2020 21:18:44 -0400
Received: by mail-pg1-f194.google.com with SMTP id m15so5171013pgv.12
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2020 18:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZhcVXavKm4qU8HuOAU5vF5jPHsoWTLIQplf2gcwPPbc=;
        b=fczfvIP/mRpX8IC9gKNhww4lN/lmMuHA2OwluGe6S9YGVwCWBIpEI1HObN0d3Nbx1r
         IAiwUsO+XH9P5lpBEkEP2uq/5PRFhrko1Ucf7/H2Y43g0SbYtef/Uw/4nQqBcaZsU0jB
         ze0CUIb7NanlOmnL0NIgaeokO+eqFrBUyzl/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZhcVXavKm4qU8HuOAU5vF5jPHsoWTLIQplf2gcwPPbc=;
        b=VAcnYfjmWz7oGDzOcr1WFwiLpc13be0zQiGwXQrpt+jOd8OGevvPcZ5xHG9nTuK8HH
         i8m+OZPemnaOQlVuEUz+SfwJ5CBiVL4V9FBNC2SHg+0V7LdNOJevtpSbUABSupujReaH
         qgCQRbgnAmwKCQBSYCT95A9tJxU2PSF1ib6XfR7qdVH2vFWBYQSmFjo6K0sP3as6D+qX
         5qU/gmLmsjXs6hfZ1RKB/TWc1Dn8XiL8KUPy/aZ9kyu7SLR2fKrBSpTo1FVjZOC+Po2K
         kTYJpTOzQiqIvqTmnJo6vi+ZR2iP4jK6amQxhQZmbEhPQbuF5SOIyDVDg/cwzxLZODJN
         +fvg==
X-Gm-Message-State: ANhLgQ27aQCabkFKaWjGLK7M6MbcOEkBJVZIhd6oNqzkasdi5h+2dqoz
        fcZX1JUMVh2EbXVPv5ggB7AW2niM4RttzHs9
X-Google-Smtp-Source: ADFU+vv42NLoMenBCnfmdziF1spjTy4Fw+uvPHeHRO+ceNSAIWA0uUl/tJZQMXC3t2z8s4LJNX3wmw==
X-Received: by 2002:a63:584c:: with SMTP id i12mr15203811pgm.276.1584839921401;
        Sat, 21 Mar 2020 18:18:41 -0700 (PDT)
Received: from localhost.localdomain ([64.120.89.6])
        by smtp.gmail.com with ESMTPSA id h26sm9424380pfr.134.2020.03.21.18.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 18:18:41 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>, rdunlap@infradead.org
Subject: [PATCH] media: i2c: video-i2c: fix build errors due to 'imply hwmon'
Date:   Sat, 21 Mar 2020 18:18:33 -0700
Message-Id: <20200322011833.231963-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix build fault when CONFIG_HWMON is a module, and CONFIG_VIDEO_I2C
as builtin. This is due to 'imply hwmon' in the respective Kconfig.

Issue build log:

ld: drivers/media/i2c/video-i2c.o: in function `amg88xx_hwmon_init':
video-i2c.c:(.text+0x2e1): undefined reference to `devm_hwmon_device_register_with_info

Cc: rdunlap@infradead.org
Fixes: acbea6798955 (media: video-i2c: add hwmon support for amg88xx)
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/media/i2c/video-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 3c770ecd4bf7..b34eff4745e3 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -255,7 +255,7 @@ static int amg88xx_set_power(struct video_i2c_data *data, bool on)
 	return amg88xx_set_power_off(data);
 }
 
-#if IS_ENABLED(CONFIG_HWMON)
+#if IS_ENABLED(CONFIG_HWMON) && !(IS_MODULE(CONFIG_HWMON) && IS_BUILTIN(CONFIG_VIDEO_I2C))
 
 static const u32 amg88xx_temp_config[] = {
 	HWMON_T_INPUT,
-- 
2.25.1

