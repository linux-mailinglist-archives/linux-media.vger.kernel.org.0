Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA928AFC4
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 08:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbfHMGQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 02:16:13 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36634 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbfHMGQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 02:16:10 -0400
Received: by mail-wm1-f65.google.com with SMTP id g67so375419wme.1;
        Mon, 12 Aug 2019 23:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XiR40mxLzkY39gMoWHbldefskq7y3+jPi2+rZpG3h6U=;
        b=gXdQ321IO3PXUSHZRxhQo7puYy/kz5gxDK3CL4hRH+nOHYpwZid5Zf2JevmaTrJ/zB
         L3NgKKvXphhaQvpbDQyuL0JKMuH3vkuDfV7DDBXYg7Xr3FC5BGkcXvzLhmiRRCapJBhD
         3G8yYPiBjjHmu/zJg/j21JnIpE9XvhmLPGb0fNGGD7Dk/bo7vewBc9OZvCD/yoYYwONV
         vzSdLDYFAUWlpYKaaMESOs3hJCdrkZ3iz4XM7eKwfYO29ixz7HxNcYV4NIaTwgmPQTG0
         zrxXz661xDqWlB7a5HBeqfXBdwylXr0QBdIBk846P2Ex1cxWu9ZGd12w09kGbpOGXiT4
         SHZA==
X-Gm-Message-State: APjAAAVDEzOVC9+ap1ynXFwzLokDwMUybPqyB3Igvwq8kipzZ+G4876p
        T/q/iau5Xab4XjuwtQYAVdBIanbYlwc=
X-Google-Smtp-Source: APXvYqzDQwrLMXAKGqb9FZbRmn3w7CKgOwWVQcqZ4SbYC8oVnXy2FVD/F5QU1IcDRIwHQ/1UrESj/w==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr1051974wml.77.1565676968383;
        Mon, 12 Aug 2019 23:16:08 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.googlemail.com with ESMTPSA id o16sm24618135wrp.23.2019.08.12.23.16.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 23:16:07 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     linux-kernel@vger.kernel.org
Cc:     Denis Efremov <efremov@linux.com>, joe@perches.com,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Remove zoran driver
Date:   Tue, 13 Aug 2019 09:16:02 +0300
Message-Id: <20190813061602.18087-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cleanup MAINTAINERS from zoran record since the driver was removed.

Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Fixes: 8dce4b265a53 ("media: zoran: remove deprecated driver")
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 MAINTAINERS | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2548dd1efb2d..2ea3f82e256b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17794,14 +17794,6 @@ S:	Maintained
 F:	mm/zpool.c
 F:	include/linux/zpool.h
 
-ZR36067 VIDEO FOR LINUX DRIVER
-L:	mjpeg-users@lists.sourceforge.net
-L:	linux-media@vger.kernel.org
-W:	http://mjpeg.sourceforge.net/driver-zoran/
-T:	hg https://linuxtv.org/hg/v4l-dvb
-S:	Odd Fixes
-F:	drivers/staging/media/zoran/
-
 ZRAM COMPRESSED RAM BLOCK DEVICE DRVIER
 M:	Minchan Kim <minchan@kernel.org>
 M:	Nitin Gupta <ngupta@vflare.org>
-- 
2.21.0

