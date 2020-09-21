Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC46C2720BE
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgIUKYm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbgIUKUf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:35 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BC5C061755
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:35 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id t10so12132450wrv.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FAfzGDJNkDiJ14AHNIUhDwhIpLlD543otONzFuTYMfQ=;
        b=ERaArSVnusIZhh3BpFKhA0YH7Rj3lF6LCWbq+jqxKQnP+9MFEZh1E4yg5l15aO/SH0
         e5e9FkbM8T+nBXr70hn4TRSMMkyAqrK2EvTVKzFR6BFdaN0pykgjpnAQvlhD3xx7Smjm
         hHNyTpdVIwexCovVJDNdKDXac0xAD8tfA2ThaDvsIr8VLhW+AyAV/B58n3MG/w0CLP9D
         hWlyEyXqjFnM8M6wGw9DzDPsAe2pupXq7BeOJ2DJ8T/DnDWEJT7zChK5qPyK0uEcOjGo
         65DikEPIE+20NVDUZpV0wcsHFQ/WVol4ufFxvbz3uaRjLfnIF/qoKTe3uvuaqssVIQnu
         o3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FAfzGDJNkDiJ14AHNIUhDwhIpLlD543otONzFuTYMfQ=;
        b=EdvIaU/9PnZeqzAWQTtGZ8L1lQPZ89IO5GP9qcl1vVCd4AiH1pYXY3ITEJ9ocVeco0
         5HFDshCpL2nU+5TTHsfdorN3VdCFsltQ8SAYAsUL6CiZDeRHD3BBuwSrcbfVqqQRxtS2
         Y1hxFMOTB19lj68J/D0koYzxgfMkR1ov6cGSiY6h+PV3vo8xc2AnXVZtDanI6vVTkXak
         QLFcaTGcSplWyVPrYaxXy9haAgd4ZrsdPFqvhYvQypfocbZhQiJuK++IB5fqEnm8NGeN
         2gfIRSVUSjQKTLoJwTuGBmW/myEngmUASF0fMTQXjpQW8Cdmw9kEIzGznPCZ59QZrofR
         c01Q==
X-Gm-Message-State: AOAM530h1t2PdFDFp2PXb/ds9z64V8ERU5lPnsM3i0RehnwLlv+d3qB8
        iw5577g4yMalSEFWUIvIRkYoUw==
X-Google-Smtp-Source: ABdhPJwRp8fa0HmGYgcCS7nKvEdN1zyxKC4UrtLKMKxQZ5icXeLaTxukOPBl8Aw2G4MO2Lu2ST4EHg==
X-Received: by 2002:adf:f852:: with SMTP id d18mr51733075wrq.245.1600683634013;
        Mon, 21 Sep 2020 03:20:34 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:33 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 02/49] MAINTAINERS: change maintainer of the zoran driver
Date:   Mon, 21 Sep 2020 10:19:37 +0000
Message-Id: <1600683624-5863-3-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add myself as maintainer.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/media/v4l-drivers/zoran.rst  | 22 +++++++---------------
 MAINTAINERS                                | 10 ++++++++++
 drivers/staging/media/zoran/zoran_card.c   |  5 -----
 drivers/staging/media/zoran/zoran_card.h   |  5 -----
 drivers/staging/media/zoran/zoran_device.c |  5 -----
 drivers/staging/media/zoran/zoran_device.h |  5 -----
 6 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/Documentation/media/v4l-drivers/zoran.rst b/Documentation/media/v4l-drivers/zoran.rst
index d2724a863d1d..a0586514cd8a 100644
--- a/Documentation/media/v4l-drivers/zoran.rst
+++ b/Documentation/media/v4l-drivers/zoran.rst
@@ -549,21 +549,13 @@ at high verbosity. See 'Contacting' on how to contact the developers.
 Maintainers/Contacting
 ----------------------
 
-The driver is currently maintained by Laurent Pinchart and Ronald Bultje
-(<laurent.pinchart@skynet.be> and <rbultje@ronald.bitfreak.net>). For bug
-reports or questions, please contact the mailinglist instead of the developers
-individually. For user questions (i.e. bug reports or how-to questions), send
-an email to <mjpeg-users@lists.sf.net>, for developers (i.e. if you want to
-help programming), send an email to <mjpeg-developer@lists.sf.net>. See
-http://www.sf.net/projects/mjpeg/ for subscription information.
-
-For bug reports, be sure to include all the information as described in
-the section 'It hangs/crashes/fails/whatevers! Help!'. Please make sure
-you're using the latest version (http://mjpeg.sf.net/driver-zoran/).
-
-Previous maintainers/developers of this driver include Serguei Miridonov
-<mirsev@cicese.mx>, Wolfgang Scherr <scherr@net4you.net>, Dave Perks
-<dperks@ibm.net> and Rainer Johanni <Rainer@Johanni.de>.
+Previous maintainers/developers of this driver are
+- Laurent Pinchart <laurent.pinchart@skynet.be>
+- Ronald Bultje rbultje@ronald.bitfreak.net
+- Serguei Miridonov <mirsev@cicese.mx>
+- Wolfgang Scherr <scherr@net4you.net>
+- Dave Perks <dperks@ibm.net>
+- Rainer Johanni <Rainer@Johanni.de>
 
 Driver's License
 ----------------
diff --git a/MAINTAINERS b/MAINTAINERS
index d3126fc2cca2..f2ece9826be3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19233,6 +19233,16 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/zonefs.git
 F:	Documentation/filesystems/zonefs.rst
 F:	fs/zonefs/
 
+ZR36067 VIDEO FOR LINUX DRIVER
+M:	Corentin Labbe <clabbe@baylibre.com>
+L:	mjpeg-users@lists.sourceforge.net
+L:	linux-media@vger.kernel.org
+S:	Maintained
+W:	http://mjpeg.sourceforge.net/driver-zoran/
+Q:	https://patchwork.linuxtv.org/project/linux-media/list/
+F:	drivers/staging/media/zoran/
+F:	Documentation/media/v4l-drivers/zoran.rst
+
 ZPOOL COMPRESSED PAGE STORAGE API
 M:	Dan Streetman <ddstreet@ieee.org>
 L:	linux-mm@kvack.org
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index ea10523194e8..d2f82894e8ee 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -7,11 +7,6 @@
  *
  * Copyright (C) 2000 Serguei Miridonov <mirsev@cicese.mx>
  *
- * Currently maintained by:
- *   Ronald Bultje    <rbultje@ronald.bitfreak.net>
- *   Laurent Pinchart <laurent.pinchart@skynet.be>
- *   Mailinglist      <mjpeg-users@lists.sf.net>
- *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
diff --git a/drivers/staging/media/zoran/zoran_card.h b/drivers/staging/media/zoran/zoran_card.h
index 0cdb7d34926d..53ed511ce546 100644
--- a/drivers/staging/media/zoran/zoran_card.h
+++ b/drivers/staging/media/zoran/zoran_card.h
@@ -7,11 +7,6 @@
  *
  * Copyright (C) 2000 Serguei Miridonov <mirsev@cicese.mx>
  *
- * Currently maintained by:
- *   Ronald Bultje    <rbultje@ronald.bitfreak.net>
- *   Laurent Pinchart <laurent.pinchart@skynet.be>
- *   Mailinglist      <mjpeg-users@lists.sf.net>
- *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 22b27632762d..04162be80420 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -7,11 +7,6 @@
  *
  * Copyright (C) 2000 Serguei Miridonov <mirsev@cicese.mx>
  *
- * Currently maintained by:
- *   Ronald Bultje    <rbultje@ronald.bitfreak.net>
- *   Laurent Pinchart <laurent.pinchart@skynet.be>
- *   Mailinglist      <mjpeg-users@lists.sf.net>
- *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
diff --git a/drivers/staging/media/zoran/zoran_device.h b/drivers/staging/media/zoran/zoran_device.h
index a507aaad4ebb..816d48b09be9 100644
--- a/drivers/staging/media/zoran/zoran_device.h
+++ b/drivers/staging/media/zoran/zoran_device.h
@@ -7,11 +7,6 @@
  *
  * Copyright (C) 2000 Serguei Miridonov <mirsev@cicese.mx>
  *
- * Currently maintained by:
- *   Ronald Bultje    <rbultje@ronald.bitfreak.net>
- *   Laurent Pinchart <laurent.pinchart@skynet.be>
- *   Mailinglist      <mjpeg-users@lists.sf.net>
- *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
-- 
2.26.2

