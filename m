Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4843AB3D4D
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 17:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbfIPPJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 11:09:08 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44248 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727635AbfIPPJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 11:09:08 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so152919pgl.11;
        Mon, 16 Sep 2019 08:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=gPQHTNvA7VuDXeRxVQcsnvI8lesX8I3WICP/DzMSiYA=;
        b=X9AB6LX8ear+nBUcROarvPFa/dSY92+dsdnBbq6OuJfN5drR5C0GanKHH7vQtDAXYa
         yl2IfyVyY84+xfKmNpXyaEhT49twQKWa+ulcxq30ODDdXRVOBnrzUTcpNrXbqKPCic/n
         2TuhyO/N7kX3kCLUg4FfBYzvjGJEDWF0RMqKkhXLfTK4OV7sa22ZhAHp+06svLaRPmzc
         wjKH9wJfvyNWwPWCjBaSLmgrzqr9EfVBlhV0o9qKHNNk7WoFIBnCTHKR5jPVEmY+YXsI
         q7KNZzmgntLbYXYu124ATTrNl15Wcb4XsTH4vOvU5C1h3myLJi/PT7vqaaYDcWiUuBM9
         WMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=gPQHTNvA7VuDXeRxVQcsnvI8lesX8I3WICP/DzMSiYA=;
        b=DPe++fI69iu2q6WsAC46ph5zm9i0Iz1DgTKNUrh6wpmEBohEXCVmJm+dBzIAb94Um3
         D2IwbgYAAYuBpMxKi+6upB7PQ038+zCn85tOBcZif2gRvPExnbzEm6XY9lNz2va/LlJc
         QiRTHcJ1xiS5TKS/tKOCkgaC2Rt+B/i4qVt3O/5CVWzacXns5qoSlzzLisRqfvchU+Jv
         ew9M3V5P32JvLZMd8vh1VXT0ko7dPhdkAZHdctCSvlc4Ha4ukXnTdBMpyBjP19IbSdYy
         sz90fygmcEGXY7q+V+ZNR7iNqq7ycZ/3XMcIZgE/d3AJ9Ni3rPYMTPZSq9MpsqLZZUlN
         +pPA==
X-Gm-Message-State: APjAAAUPCVV/fT9Fs7qSeJaM29IuUQzfXTvHp45MfbDMrbcue0G5YCRr
        v2LrzTItcsEp7jD06oyiqos=
X-Google-Smtp-Source: APXvYqx75Rxk0J+F0t9yVxqH5IyFRwEXIGiE0yHblBYeFHkcESfnNouAoOe8x+jvZ6rv3aKo7xbRIw==
X-Received: by 2002:a17:90a:1c01:: with SMTP id s1mr207884pjs.76.1568646547366;
        Mon, 16 Sep 2019 08:09:07 -0700 (PDT)
Received: from nishad ([106.51.235.3])
        by smtp.gmail.com with ESMTPSA id o64sm65792pjb.24.2019.09.16.08.09.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 08:09:06 -0700 (PDT)
Date:   Mon, 16 Sep 2019 20:39:00 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: usb: tm6000: Use the correct style for SPDX License
 Identifier
Message-ID: <20190916150857.GA25085@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch corrects the SPDX License Identifier style
in header files for TV Master Media USB Adapter drivers.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used)

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/media/usb/tm6000/tm6000-regs.h     | 2 +-
 drivers/media/usb/tm6000/tm6000-usb-isoc.h | 2 +-
 drivers/media/usb/tm6000/tm6000.h          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/tm6000/tm6000-regs.h b/drivers/media/usb/tm6000/tm6000-regs.h
index d10424673db9..6a181f2e7ef2 100644
--- a/drivers/media/usb/tm6000/tm6000-regs.h
+++ b/drivers/media/usb/tm6000/tm6000-regs.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * tm6000-regs.h - driver for TM5600/TM6000/TM6010 USB video capture devices
  *
  * Copyright (c) 2006-2007 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/usb/tm6000/tm6000-usb-isoc.h b/drivers/media/usb/tm6000/tm6000-usb-isoc.h
index b275dbce3a1b..e3c6933f854d 100644
--- a/drivers/media/usb/tm6000/tm6000-usb-isoc.h
+++ b/drivers/media/usb/tm6000/tm6000-usb-isoc.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * tm6000-buf.c - driver for TM5600/TM6000/TM6010 USB video capture devices
  *
  * Copyright (c) 2006-2007 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/usb/tm6000/tm6000.h b/drivers/media/usb/tm6000/tm6000.h
index bf396544da9a..c08c95312739 100644
--- a/drivers/media/usb/tm6000/tm6000.h
+++ b/drivers/media/usb/tm6000/tm6000.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * tm6000.h - driver for TM5600/TM6000/TM6010 USB video capture devices
  *
  * Copyright (c) 2006-2007 Mauro Carvalho Chehab <mchehab@kernel.org>
-- 
2.17.1

