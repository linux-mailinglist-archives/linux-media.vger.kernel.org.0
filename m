Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A382819032B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 02:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgCXBHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 21:07:53 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44629 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgCXBHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 21:07:53 -0400
Received: by mail-lf1-f65.google.com with SMTP id j188so7975855lfj.11
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 18:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2pkQX7j6qoDZod+Z0vGCMQ7YUFeCQyefjno1RHbQn6k=;
        b=apUjfDGCAuDsoao++DShvwuITPLZxVukpRBArd/c24FV+3U8RpNjdsYFhBbSN+rLq5
         8GF740uYD8kfPpMrFVyo6x1Hsi4Ybd/Yty6UVBU0qnLhSS65yLjNK8wKgcHlPsu1mmdN
         5TLNaeMSOgpo5kdQx8QuVFCGv+qd0A+yVszJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2pkQX7j6qoDZod+Z0vGCMQ7YUFeCQyefjno1RHbQn6k=;
        b=AwHrWcWcap19kB1kRkEdELe9eq+rxeLqWOXF2qGjvsqdHxL+IpTeNMc3MSLyPL2eW9
         VCGnpP/mDezJ8McEnBvFN5kPaFd9myxSNcx4gdIm2FuR6ni92nrljOM0I8CY+rZZM+nG
         sML0xo6GPu12JYUpYxrh7h1zMBjB+H73J52eHcxdlSnFzC6xuDS/LWMEWmu5/Tx8lCkF
         +kDCSDtPoQBJXaacL29I+TggU3IBVnn48TW5ORroBAaSSx1z5PHjbOcOQBP/e+XGVRNX
         1NbJctQnP/YIXrj34nL/bhJQDhrBsbZw2mz/wkZEGCtEezGc3jfr0h6M4Mzr4RqIhQzs
         aLZA==
X-Gm-Message-State: ANhLgQ0Ce1LnhlpSqOJ8sW5ls+MyJQYZFZb4PYLBvZwGg9OUamWlvXoz
        h5eTowzSWif3jSS3asJ/w+kw/qAJKLkL3w==
X-Google-Smtp-Source: ADFU+vvmE26irlPUyD0BBDYCnjsnrq3VfpSlnMbrbidQbc7BT/CezZ6y37Jy2i1KZPWNIah2r9EWHg==
X-Received: by 2002:ac2:5508:: with SMTP id j8mr14661744lfk.31.1585012070754;
        Mon, 23 Mar 2020 18:07:50 -0700 (PDT)
Received: from virtualbox.ipredator.se (anon-49-219.vpn.ipredator.se. [46.246.49.219])
        by smtp.gmail.com with ESMTPSA id h26sm9333843ljj.4.2020.03.23.18.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 18:07:50 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>, rdunlap@infradead.org
Subject: [PATCH v2] media: i2c: video-i2c: fix build errors due to 'imply hwmon'
Date:   Mon, 23 Mar 2020 18:07:41 -0700
Message-Id: <20200324010741.393632-1-matt.ranostay@konsulko.com>
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
index 3c770ecd4bf7..0465832a4090 100644
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
2.25.1

