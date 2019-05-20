Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7FA2394D
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 16:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732721AbfETODr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 10:03:47 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39484 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731582AbfETODr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 10:03:47 -0400
Received: by mail-wr1-f67.google.com with SMTP id w8so14774460wrl.6
        for <linux-media@vger.kernel.org>; Mon, 20 May 2019 07:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cF0K4L8IFyt0+npCv+nWw+tKu23CAdmttAOFwktWaxI=;
        b=ze4d8D2uXvGMxOxR01bwm1YogLCVWYOJq0Jf2Vip/qog0Nbrf/1dqaj8YjuJWp9olk
         4nwg+kLlBqesT9srjiDvGEh7Z2ibNod1qCM0EmMxCRdZFYKpg0YsD65d4cRdl3FeUume
         fX8sGCdRwlatBale2V+RaHJJKQTqN+m9osMvO9dkZStg5cJD29VswcNZwRpMFziFPRBY
         /nkYJcl6n6mAgvfEiGeGdNDZxbdCzMRd43F6DleTA6+sLDAGXTeiYZW0HsGcfZGzXPfN
         JMvGlgf1JzulyCF5TAr40vsV9w3sZZLsEVfJJvgiPeX3NoyFQ3bzFvd6j0nkxJJJ0C//
         x/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cF0K4L8IFyt0+npCv+nWw+tKu23CAdmttAOFwktWaxI=;
        b=svkpuDPqK2eZpIGmCZpEtnz14VLX/9DAfXzYzBUYoFYwWE/pJnNooyUhxU1F0qHXf3
         +OVnCyMtq6E4x42zaw0XzOzBg7SyUfV0b/K5FFtuZgPk2VcGjTYtxWPobKDx3JEGf3Gf
         3uGxP0Mqjmyb2+yLn+2Tnx0MHpiwsdsuseKTKocwsk35f8GYx1yNIC627Kx7IsAhghfC
         dZN8dhvYcr4VIKP2ABo4q2k9faVOFdn0JR8ghA03MWpHTu35L+M++MXbKOALMmYzfYEe
         NvNL18H9+u8uK3EwJ0gSdazBRrY/9N4BvFz3VDW88op+rJvN+77syyoHS2mUWnVeaIHF
         67sQ==
X-Gm-Message-State: APjAAAW6po1+Uib15+aPTWVxKw8wD+dpZe1HQjunlcZc/U9LdIwOXAgR
        YJ0IltzIaqtfuuW9cyOzOTNA/w==
X-Google-Smtp-Source: APXvYqyLfHunGtz7iQDXkgCWa8G285wjhmipCjPg2pvdogZ/30BdgiGfT3HEUmBIyRB1mcfglKOuXQ==
X-Received: by 2002:adf:dcc4:: with SMTP id x4mr20656573wrm.107.1558361026012;
        Mon, 20 May 2019 07:03:46 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c131sm18134032wma.31.2019.05.20.07.03.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:03:45 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] media: rc: meson-ir: update with SPDX Licence identifier
Date:   Mon, 20 May 2019 16:03:43 +0200
Message-Id: <20190520140343.29971-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/rc/meson-ir.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 9914c83fecb9..02914da8cce5 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -1,14 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Driver for Amlogic Meson IR remote receiver
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <linux/device.h>
-- 
2.21.0

