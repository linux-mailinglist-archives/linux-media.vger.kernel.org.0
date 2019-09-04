Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D5DA8916
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 21:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730992AbfIDO6f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 10:58:35 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33965 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729919AbfIDO6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 10:58:35 -0400
Received: by mail-pg1-f196.google.com with SMTP id n9so11404828pgc.1;
        Wed, 04 Sep 2019 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=TwLLRd1Csrg25/GdRKWRpgAGYI8XLduRSa0TLBWFWw8=;
        b=Z6Mb4nCMJDwhyogeDbmvTTNBklBShXXSA8J9yLUG3puw8p2g2r1pph57Z2sF/TND8G
         vrKZRFPNcv48L1M0ZimiQ1Eut5XJmvPhRFkUGer6JycQD1wVJPcH7jHxc7Kz61HjN7dY
         pSMyjr8kJyFgvX3aL/KDttuezhz7uJI6AlKYgsyENzAAGWvhVUM8OLUcAmgi4o44voEP
         RDaLXHvKSyvN+BHG7fbPOgQGZnHMUCwnLWUT2ODxUdz8HfckUDV3LohlVvtfycoyqPKG
         wAoL5fvOL93NkYIrsgdQQ0STMzqsP/8Z5FfrLHll1GUL6Vbtcdt8KLVAZXj9SCnFDq6r
         w5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=TwLLRd1Csrg25/GdRKWRpgAGYI8XLduRSa0TLBWFWw8=;
        b=iu3npr954cA+XVDB/R3QqIQG5vzSkOCGosXUBFmqzjjclOH8JKOD+LHEsxNWgFGhnV
         lwiHv5Hzn3bWcMKjy/MjNyWjkTiLb/5jdcabO+veIpAI+plNUp96jlqbW6cD/kJGL5CV
         9VoVMN0EhePjKGLGJk73fkRYyjvuxi9/IfNwqcbxcY7SVcRa6qb7aelIGMKnQXedWjYd
         bbbzsZMQ29aFG34xA1sZxffDGUNT7r0jmYl0+B7VXuyR9qeWE/9Gdo+BukQNhD/jipH+
         km2EDwsURwF20RWDrcZfkVrLmM8h2qhqAcL8Zbk3MslE2hALW5uJgxKmhieEGgEPYg90
         Lq8Q==
X-Gm-Message-State: APjAAAUIjXV2Sl2B2Pap60SX/jv1RTuFvS+CT1WS2cLxfwhiUFLDT732
        HyidH4G6gay8S9e9v0hK08E=
X-Google-Smtp-Source: APXvYqw+5z6Whj96MOlVVCKyYa68koImYmFPdxWacC3ZvQnPNO+gz8dFo9XyIrSWD61/8pZ9WU/G1g==
X-Received: by 2002:a17:90a:7f06:: with SMTP id k6mr5528923pjl.87.1567609114576;
        Wed, 04 Sep 2019 07:58:34 -0700 (PDT)
Received: from nishad ([106.51.235.3])
        by smtp.gmail.com with ESMTPSA id p189sm18009126pfp.163.2019.09.04.07.58.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 07:58:34 -0700 (PDT)
Date:   Wed, 4 Sep 2019 20:28:27 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: Use the correct style for SPDX License Identifier
Message-ID: <20190904145823.GA3749@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch corrects the SPDX License Identifier style
in header files related to I2C controlled media codec drivers.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used)

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46
and some manual changes.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/media/i2c/max2175.h       | 4 ++--
 drivers/media/i2c/saa711x_regs.h  | 2 +-
 drivers/media/i2c/tda1997x_regs.h | 2 +-
 drivers/media/i2c/tvp5150_reg.h   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/max2175.h b/drivers/media/i2c/max2175.h
index 1ece587c153d..4c722ea3e5f1 100644
--- a/drivers/media/i2c/max2175.h
+++ b/drivers/media/i2c/max2175.h
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * Maxim Integrated MAX2175 RF to Bits tuner driver
  *
  * This driver & most of the hard coded values are based on the reference
diff --git a/drivers/media/i2c/saa711x_regs.h b/drivers/media/i2c/saa711x_regs.h
index 44fabe08234d..4b5f6985710b 100644
--- a/drivers/media/i2c/saa711x_regs.h
+++ b/drivers/media/i2c/saa711x_regs.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * SPDX-License-Identifier: GPL-2.0+
  * saa711x - Philips SAA711x video decoder register specifications
  *
  * Copyright (c) 2006 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/i2c/tda1997x_regs.h b/drivers/media/i2c/tda1997x_regs.h
index ecf87534613b..d9b3daada07d 100644
--- a/drivers/media/i2c/tda1997x_regs.h
+++ b/drivers/media/i2c/tda1997x_regs.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2018 Gateworks Corporation
  */
diff --git a/drivers/media/i2c/tvp5150_reg.h b/drivers/media/i2c/tvp5150_reg.h
index 9088186c24d1..f716129adf09 100644
--- a/drivers/media/i2c/tvp5150_reg.h
+++ b/drivers/media/i2c/tvp5150_reg.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  *
  * tvp5150 - Texas Instruments TVP5150A/AM1 video decoder registers
  *
-- 
2.17.1

