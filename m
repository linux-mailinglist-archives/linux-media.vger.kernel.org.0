Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0003939366E
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 21:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbhE0TlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 15:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhE0TlD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 15:41:03 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6A0C061574;
        Thu, 27 May 2021 12:39:28 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id s22so1808619ejv.12;
        Thu, 27 May 2021 12:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9kKFsQH6/8hsrP1bGpKk+mHFKlheH0dIynAVi3jusF4=;
        b=tvM+rvReBkNjP4kDXka/o+BhrQYdZwaxNKNsr1AWehp+Z4W9YEUnz68g/bc2DBOJ6y
         fMLGcOf/peTNoZWFX/Oho9Z6YIRGkWnWMLvgXlJCTWsprRzI3Eu9Gs5QPlsUQ9O1/yCP
         osSkVL8pqdyg3XXwkKXX3o5H+MzJjv1ECJUS4/127nxJ8+O8oGfxVbNPUzfvi810apmK
         hPxBqogrZl+DLH0O0qZpSKtrHAqDld0ZcEXFbVu1POcYEB2/GRYKVAs7IlKB9lpxqUwP
         e0htykQd1AouWp0Vn2kMKUO/uMj680JWC96VfuITsXTGpKNDvcnM+qco8q6+tBPayMTz
         EZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9kKFsQH6/8hsrP1bGpKk+mHFKlheH0dIynAVi3jusF4=;
        b=tmW/4jDb0fXr06Pm/rUjchyeY31L/qr239zGpJ/yzi9kXy8xGzj9Q4ttyV8VCDND/N
         0VmJ0/jT6jwMp8WC5JWU+ja4wCR82nMqX9PsX1ecdHiJ5jiiAE13vfAAJuQJNdSI2/J8
         h4OvYFkLwX7N2IcMmYl3TIyTa2orllJ7W5jJ9Y+BwRFIqIaJkoV0iq4kew+6P6BfqF1Y
         7DEAB1IB7oIcVFCeYocdiVkYknGVVlodsImChA5SkiS99WeqhOQCAfSlTSHTJrfbDEsw
         0DK84q49/PLtnKe68aN5NAnSvfSRC/+0wm5FD+CUCRvuxpr5xDbn90FmqM+37/k0vWjN
         2wKg==
X-Gm-Message-State: AOAM530QlDZW19ZiKEO4EkcyLWgqCzqKlYbFOFsDllV+80oUBIWw3gSf
        kNa20nOhHx/dbuD0N7yZwjU=
X-Google-Smtp-Source: ABdhPJwQamej6okxRqBXrf1AurvxV094DH+VNTHHnz83l1S/Gpu1LPlZQr18x5jN6nFU3c1ESySzNg==
X-Received: by 2002:a17:906:7c4b:: with SMTP id g11mr5632032ejp.461.1622144367423;
        Thu, 27 May 2021 12:39:27 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id p25sm1446593eja.35.2021.05.27.12.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 12:39:26 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: media: atomisp: pci: Remove checks before kfree/kvfree
Date:   Thu, 27 May 2021 21:39:22 +0200
Message-Id: <20210527193922.25225-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed checks for pointers != NULL before freeing memory. If kvfree()
and kfree() are given NULL pointers no operations are performed, so
there is no need for the above-mentioned checks. Coccinelle detected the
second of the two unnecessary checks.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index f4ce8ace9d50..5301cc014c7e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -363,10 +363,8 @@ void sh_css_unload_firmware(void)
 		unsigned int i = 0;
 
 		for (i = 0; i < sh_css_num_binaries; i++) {
-			if (fw_minibuffer[i].name)
-				kfree((void *)fw_minibuffer[i].name);
-			if (fw_minibuffer[i].buffer)
-				kvfree(fw_minibuffer[i].buffer);
+			kfree((void *)fw_minibuffer[i].name);
+			kvfree(fw_minibuffer[i].buffer);
 		}
 		kfree(fw_minibuffer);
 		fw_minibuffer = NULL;
-- 
2.31.1

