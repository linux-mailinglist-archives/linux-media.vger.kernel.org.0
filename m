Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F528B2FB1
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2019 13:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729778AbfIOLPG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 07:15:06 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46729 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfIOLPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 07:15:05 -0400
Received: by mail-pf1-f194.google.com with SMTP id q5so20686449pfg.13;
        Sun, 15 Sep 2019 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=XhFre/QK5MclL/7MBSxWJYR/qUHvDgMj7qi+Mpvzm0U=;
        b=eZvUsQS9El9tw17hndYdKaxOFFYebB1jhsqmXMFmb9cgrldzp2KTvVDm5Y2zrjMfJB
         aml4Zy++mNXNObMIMJARQchv+BdyrN769O0Er9H3CB/cZe+FvI0Z2F4PTSsGsh+76BER
         EahTA4xT1lg+kpEEwIYcV7MeLfIiRuHLhvGvhMysC10xl6+tcvYpXWAroDJOKxlZf9po
         pXvm/QV/eI3d210X76cBagHfFh52FtKBq/KynFvRGN+L1uxY4J3yrdr9jOI8k3pVJVbl
         FRc9ZTl91Y/H3ZRoGCmO4gSNZjrEJ2WdQvRzfk1JKNH5SbhsOh5fg2hQb4p0fgHpjien
         zKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=XhFre/QK5MclL/7MBSxWJYR/qUHvDgMj7qi+Mpvzm0U=;
        b=d5TEGB3FsXLOszwHmnOWeHEO16p23bSZHKJtAdp59fMjgFuFEOEZLYcmRfxVLPqylj
         +ET3aol8aCh6OfXV/68vdNd7Kygp3eseo4A50HOTKvWOASwmgAnLrBc04gECbefqqFUy
         FEGjHBxhhgu6+n/L90of+8UTKxnEtGUycCEx2eeVTMcUFsdIA7id7+X6QBXpVucHzpN8
         4MVUpyLDS+qqgpzWUgC0hRcx34EmxLdhwLp2Xf9H/uVB5r1knys4ithd5mfoRp06iU7y
         yrzHOOvwOy6529FNHIYctKgrqKUEyq1pBQlUx3O3G4pOeHxZvVKxy9euZgocICrxhTXW
         i9xw==
X-Gm-Message-State: APjAAAU2aYMc3DFxOMqzQ5P78uF65imSmkYgLgEMWzR2R7vCz430/MUL
        uHIDo+Es/MCcJbsBFZBh34rm1gHPOlg=
X-Google-Smtp-Source: APXvYqyYc1M4x8WB1QEQTGtYeO47iUVQUv3vdDUnUsze4qxOvh5yF8iRljkPmSEZ2iP51ZMM+JUv8w==
X-Received: by 2002:a17:90a:37d1:: with SMTP id v75mr15434425pjb.33.1568546105006;
        Sun, 15 Sep 2019 04:15:05 -0700 (PDT)
Received: from nishad ([106.51.235.3])
        by smtp.gmail.com with ESMTPSA id 69sm43051568pfb.145.2019.09.15.04.15.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Sep 2019 04:15:04 -0700 (PDT)
Date:   Sun, 15 Sep 2019 16:44:58 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: tuners: Use the correct style for SPDX License
 Identifier
Message-ID: <20190915111454.GA22020@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch corrects the SPDX License Identifier style
in header file related to media Drivers for Analog TV Tuners.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used)

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/media/tuners/tuner-xc2028-types.h | 2 +-
 drivers/media/tuners/tuner-xc2028.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/tuners/tuner-xc2028-types.h b/drivers/media/tuners/tuner-xc2028-types.h
index 50d017a4822a..fcca39d3e006 100644
--- a/drivers/media/tuners/tuner-xc2028-types.h
+++ b/drivers/media/tuners/tuner-xc2028-types.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * tuner-xc2028_types
  *
  * This file includes internal tipes to be used inside tuner-xc2028.
diff --git a/drivers/media/tuners/tuner-xc2028.h b/drivers/media/tuners/tuner-xc2028.h
index 7b58bc06e35c..2dd45d0765d7 100644
--- a/drivers/media/tuners/tuner-xc2028.h
+++ b/drivers/media/tuners/tuner-xc2028.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * SPDX-License-Identifier: GPL-2.0
  * tuner-xc2028
  *
  * Copyright (c) 2007-2008 Mauro Carvalho Chehab <mchehab@kernel.org>
-- 
2.17.1

