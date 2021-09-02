Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD303FF021
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 17:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345823AbhIBP0P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 11:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345819AbhIBP0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 11:26:14 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8310C061757
        for <linux-media@vger.kernel.org>; Thu,  2 Sep 2021 08:25:15 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id w17so1850371qta.9
        for <linux-media@vger.kernel.org>; Thu, 02 Sep 2021 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4jdrRo2Pu2n+KICdc/g3z4ledgRonDZH7hDQ1AkdkI=;
        b=17XxOqI3Un/+w4YYWTYFFHJLNsxrfKJ5monKP8mCXAYT68BIbI1vaekrMQNFdfut5C
         F1AAzvtRqUvfmCYW62YSQmmbeNo5670vE8fNqspT41bGtBpkvhwT/xe/CxeDhtHLLLg5
         H1bN+qXZHF6vr7j2eUqCoap3oCdb23MPLD3tJa1B7ihzu6Sdr+jtuvJZ+zUpKMHMjOxp
         sIZag7F9Mv+QH+6MWqqtjPQPcHqCwyz1f97T7+UKDr+A9tpScfgqzzjGle/mL18R76wq
         cuIpIZ2kkcrmW+3TXJs88tLS3d831svTWEWT6KjuSrO+zNl9Y7EBLa0qt+YVapzDgKi3
         qDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4jdrRo2Pu2n+KICdc/g3z4ledgRonDZH7hDQ1AkdkI=;
        b=J2Z8jtxKKAcjh06Swe2Ucv3LSHA0i3pkWKY7UI75OhoR+24ioSZJr7wfT2WFqvR17O
         jWauX388bvZMuCFMGt4Xsw3/6fqP6IITOY6OnTScRSgHrSym8ME8k3VTFMnmjp4vY5EA
         OQiO1JDs/NNO1v4EmMOZYwsEqxg606BM4CbMc7NWwxAxNcB/m3E3AiODZ5Fu0qpowgJu
         NHZD7rezLnS4su/MYhejdFqFrz6GidLZEy/n4vJXJbZdzfsgyfurxFF5LsApNSJQLj3t
         e1QeGwRRnqJZg3eGfS5HWG59yVcvQnLyv8tC0wOgFDk7zaCbAm/XvK/qBJMhRGMJFdjJ
         IEGA==
X-Gm-Message-State: AOAM532ajzO27A3kbat/7WVVGInhtt56Y4WN/RVzMSOxqu6FNuX/fnKt
        24pOas0mUQYH7lTrk8ZYIQQahZPBzikdtQ==
X-Google-Smtp-Source: ABdhPJwV6xMrB0LLnPRpmfnir5ZP6A1IOJonU5qFz1bjz03O21I900gCHMVsaPvI6YK6u7HtUN7cYw==
X-Received: by 2002:a05:622a:40e:: with SMTP id n14mr3517217qtx.168.1630596314367;
        Thu, 02 Sep 2021 08:25:14 -0700 (PDT)
Received: from fedora.. ([196.32.91.248])
        by smtp.gmail.com with ESMTPSA id q22sm1201975qtr.95.2021.09.02.08.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 08:25:13 -0700 (PDT)
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] MAINTAINERS, .mailmap: Update Ezequiel Garcia's email address
Date:   Thu,  2 Sep 2021 12:25:01 -0300
Message-Id: <20210902152501.91300-1-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update the media drivers I maintain to use my personal mail address.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 .mailmap    | 1 +
 MAINTAINERS | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index a35ae244dfda..172c866f633a 100644
--- a/.mailmap
+++ b/.mailmap
@@ -98,6 +98,7 @@ Douglas Gilbert <dougg@torque.net>
 Ed L. Cashin <ecashin@coraid.com>
 Erik Kaneda <erik.kaneda@intel.com> <erik.schmauss@intel.com>
 Evgeniy Polyakov <johnpol@2ka.mipt.ru>
+Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> <ezequiel@collabora.com>
 Felipe W Damasio <felipewd@terra.com.br>
 Felix Kuhling <fxkuehl@gmx.de>
 Felix Moeller <felix@derklecks.de>
diff --git a/MAINTAINERS b/MAINTAINERS
index 524eabe50d79..978a6b55282d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8116,7 +8116,7 @@ T:	git git://linuxtv.org/anttip/media_tree.git
 F:	drivers/media/usb/hackrf/
 
 HANTRO VPU CODEC DRIVER
-M:	Ezequiel Garcia <ezequiel@collabora.com>
+M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 L:	linux-rockchip@lists.infradead.org
@@ -15965,7 +15965,7 @@ F:	include/uapi/linux/rkisp1-config.h
 
 ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
 M:	Jacob Chen <jacob-chen@iotwrt.com>
-M:	Ezequiel Garcia <ezequiel@collabora.com>
+M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 L:	linux-media@vger.kernel.org
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
@@ -15973,7 +15973,7 @@ F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
 F:	drivers/media/platform/rockchip/rga/
 
 ROCKCHIP VIDEO DECODER DRIVER
-M:	Ezequiel Garcia <ezequiel@collabora.com>
+M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 L:	linux-media@vger.kernel.org
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
-- 
2.31.1

