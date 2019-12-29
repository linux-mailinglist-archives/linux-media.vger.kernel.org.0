Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2C8312C2D7
	for <lists+linux-media@lfdr.de>; Sun, 29 Dec 2019 15:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfL2Orf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Dec 2019 09:47:35 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39867 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfL2Ore (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Dec 2019 09:47:34 -0500
Received: by mail-lf1-f68.google.com with SMTP id y1so23717051lfb.6
        for <linux-media@vger.kernel.org>; Sun, 29 Dec 2019 06:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mq9DTmJBVcHEo9ggrrk2ObQX9SeNJmawOg1L4GOcimU=;
        b=jI3iiKxmmHeALONBicy1W5dL/PatqMbmje7dy04ko/6iNiPgpDHTrJ9dwX5QduIYEO
         zxr6PNpZi11QsmyVVgADXg2J5nlY5evSdijw4brvcXIffsWJ/ZVq7EGY6Cpc3u8dNgpQ
         oZsOFdkSmH9cSFsmRC2aO1KoCvd+9soOIqn9EVhsEPY9RkXNVD9I/hl/aqoCDElJhmUZ
         mmf0RTRfnCV4buO2cqsQKa6aOHAJn7T3WzPzNzULkNiWARl6+Sog6DwjpDe7O8CO/ip7
         DooReM4OvppIoKUbUetPx+GnJSbY69YGQkhl11jOhdMQAN5ci97deRvYKovSDFQ6MK9H
         NcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mq9DTmJBVcHEo9ggrrk2ObQX9SeNJmawOg1L4GOcimU=;
        b=GaiNJD56ePOV80LMsV8CJZCvbV0OZlIs7IVCQqSMZsZFzCvj6WpxMOI9YmQJvmRb8/
         idfD7ZbW3mlyl+o+Jm70U3wLzlOCx2KbYdyS3JcxQiWBvbSRAPV8qHzqRvpJZqo5Pp7n
         LugeLcwc43GJqqv7XTbDk3v6MdZ0Rzl/8vFn9TPut9N7/3Rp9NmUCdy7RfaN6EtD/qlx
         lUX9MhbCONmWw+z2wRlsayCmfUrwIyuprUp7Yl0P0Xuh9B3l6u4dTWVtVGYi7spwpAzl
         v1bCwLRhR4cqO1nVxBMiN8WY4he7aS/eRlWeRCXLN4plvVRUEZJea+u3i7wEjuUQLQW9
         Wc9A==
X-Gm-Message-State: APjAAAV+mire63TqRIrUhT9UjsawVqk/q7y/Qe3ryo95gBW6eY48tYJL
        L/gAhN6QptrFThgH+D4FxrqmZLtAbF0=
X-Google-Smtp-Source: APXvYqx5LMBZqmmxmFRsUGXmCh8W89NYRDFQriUSMU/qlAFStGUXQlJxgRxvEicZfD6h11kb3ghzGQ==
X-Received: by 2002:a19:7502:: with SMTP id y2mr34477637lfe.55.1577630852456;
        Sun, 29 Dec 2019 06:47:32 -0800 (PST)
Received: from localhost.localdomain ([194.29.183.39])
        by smtp.googlemail.com with ESMTPSA id y8sm16217353lji.56.2019.12.29.06.47.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 06:47:31 -0800 (PST)
From:   Tomasz Maciej Nowak <tmn505@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media-build: Fix menuconfig usage
Date:   Sun, 29 Dec 2019 15:47:17 +0100
Message-Id: <20191229144717.6768-1-tmn505@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When using menuconfig to select the drivers, following error will appear:

./Kconfig:2:warning: ignoring unsupported character '.'
./Kconfig:3: syntax error
./Kconfig:2: invalid statement

This is result of f5451582c4 ("kconfig: stop supporting '.' and '/' in
unquoted words") in Linux kernel. Therefore, put the offending line in
double quotes.

Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
---
 v4l/scripts/make_kconfig.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/v4l/scripts/make_kconfig.pl b/v4l/scripts/make_kconfig.pl
index a11f820..69f0c67 100755
--- a/v4l/scripts/make_kconfig.pl
+++ b/v4l/scripts/make_kconfig.pl
@@ -596,7 +596,7 @@ kernelcheck();
 open OUT, ">Kconfig" or die "Cannot write Kconfig file";
 print OUT <<"EOF";
 mainmenu "V4L/DVB menu"
-source Kconfig.kern
+source "Kconfig.kern"
 config VIDEO_KERNEL_VERSION
 	bool "Enable drivers not supported by this kernel"
 	default n
-- 
2.24.1

