Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5D141ECD
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 10:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730812AbfFLIP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 04:15:56 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45332 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730781AbfFLIP4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 04:15:56 -0400
Received: by mail-lf1-f66.google.com with SMTP id u10so11337408lfm.12
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 01:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qc0nv++ogxD/fVe1o7jhZAYVkwJMAt6qDg76e6F2/I=;
        b=cj+kgVvf4js2JFhPQnoZZn6kDBqQbBEjXpTJqKyElA40Sc0hD8k86b6bvQXrfo3Izf
         lKZb9SDuXC+VP9hLRUbbU4Qb5jlW7PPZBKg1t8wQpPxQwZWX8Rr+50TW/nNkkPE3GXFl
         2YpPVNPRJBWdRePwfs+UsHEL9F4i0MKZtnvBUlTyZ30v7oWvnZmKPd7/R9eA0oCOFQ6N
         1xgWgrfWL4ec1adbkG+fLIYxhHHtdy0GSgZD0pUWCpauWH+oKXf85OL7zAPPdMbuUjsX
         /vfAGAdJvyUnJli1vuzvfRrs+ssobSJQTpILvHb9kw/BveAfFew0+2R3E30doQ+YVrkd
         WEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qc0nv++ogxD/fVe1o7jhZAYVkwJMAt6qDg76e6F2/I=;
        b=crwe/dmP/IzuE+5I4ScjNPHUOfLGIzk8tm/mXhyLf2WpYZX1mlTwCK4XNJvgSP5kM6
         E4svOBMhYbZI27EZIWzOSXHwpNiEbFwd4ZIgXMotkFKOdEXfI6D3cNLFtXJWNzh0zOcl
         GZ5C7vIM6oDMzGlwxwjatD5umy3whVS1zdiIj1gJS1UyLUkMSqfZbKiDbNoXMdjLPkpE
         xCRVIMBMqjDjmmW6CE2bOrRkafgkmvxz8sQu57qSMAegANVzQp7Ak3ar2tCRncPfBNu0
         PLJI2VGBCFrsZfd6PleWRYxZ3V4x14Qehdza+YGDAtkfP9Qi+IJnr3VNg5ycezDnCoyi
         ohYw==
X-Gm-Message-State: APjAAAUyg7dcSNcVb1relSb95ycsIZVEnzcK26WYwAnnOTUc9lj32sk/
        OMZepXaMP0T7HNHvVf0aluoioQ==
X-Google-Smtp-Source: APXvYqzksCYlTlYuYtnz2FY/MHGMyOOTRXflfdL5X4G+rMVcF1T1+JRvyDF0NKbtoWEywxrpHTOBEw==
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr16801840lfg.152.1560327354568;
        Wed, 12 Jun 2019 01:15:54 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se. [213.112.54.28])
        by smtp.gmail.com with ESMTPSA id 80sm2965455lfz.56.2019.06.12.01.15.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 01:15:53 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     p.zabel@pengutronix.de, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v2 3/3] drivers: media: coda: fix warning same module names
Date:   Wed, 12 Jun 2019 10:15:50 +0200
Message-Id: <20190612081550.2255-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When building with CONFIG_VIDEO_CODA and CONFIG_CODA_FS enabled as
loadable modules, we see the following warning:

warning: same module names found:
  fs/coda/coda.ko
  drivers/media/platform/coda/coda.ko

Rework so media/platform/coda is named coda-vpu. Leaving CODA_FS as is
since that's a well known module.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/media/platform/coda/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/coda/Makefile b/drivers/media/platform/coda/Makefile
index 54e9a73a92ab..5fd5efa35159 100644
--- a/drivers/media/platform/coda/Makefile
+++ b/drivers/media/platform/coda/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-coda-objs := coda-common.o coda-bit.o coda-gdi.o coda-h264.o coda-mpeg2.o coda-mpeg4.o coda-jpeg.o
+coda-vpu-objs := coda-common.o coda-bit.o coda-gdi.o coda-h264.o coda-mpeg2.o coda-mpeg4.o coda-jpeg.o
 
-obj-$(CONFIG_VIDEO_CODA) += coda.o
+obj-$(CONFIG_VIDEO_CODA) += coda-vpu.o
 obj-$(CONFIG_VIDEO_IMX_VDOA) += imx-vdoa.o
-- 
2.20.1

