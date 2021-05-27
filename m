Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9837392689
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 06:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhE0ElV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 00:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhE0ElV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 00:41:21 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A814C061574
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 21:39:49 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id m8-20020a17090a4148b029015fc5d36343so1625659pjg.1
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 21:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QzwYKqEGxRTAB50ZxFrE+peUygy/9w/R6gSXMiwCKg8=;
        b=HIWyPj+1wNaIyzyTl81JwHe5XT/50cEw1HAO3ANg4M9ViQ2pDGKdzVWDbTAxbt4vhy
         yVatYEs6j8L1TFzlKlV2549lrEgFj/8u4QfN9SPoLvUTuC2PtKgBRZBWqTRTbIVnMyzY
         LP/kMxeehWgTeCU2nZJfCt79kHzhJ1WC2yL8bibpCSGDA9VROHLW3eWGp4Zthb0VCjrQ
         qwn3gsb8Ud/Yfz2mmUEww6owfIjcj4350nrcurayNE7BDvc7I7eI1ZxMkghhmxffrvFD
         viy5W9GXhPLTX78wI0Oqe+iQgyl6ueSYwyTsftn+iaZtBl3iOhAI7m1UPI5MnCtNIF1X
         kkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QzwYKqEGxRTAB50ZxFrE+peUygy/9w/R6gSXMiwCKg8=;
        b=uAS3Cx5zIybwrv738NgG1NG53gB4SEGcTITKtdNZrl1x2djNpQqN86eKpOGs40pbwf
         PbpTIdmSS7zqpt2PkuPaR4UPCNLDBFnB9gFefwmx2vjuogzS9MWYi16xcSkUo9Dlk+7O
         7SGf5bKhR7mGP4kcUqcAWyHQ0qnKtn+Zn2XY6K1K3+0D0IOs0zHatvavoxkBmwge0C56
         XhHHdQ2mPFFIjqyMpnBYICKtepNuX1LwcA2luFrddTAx8y7CSm4bB7R8uJo6EM7OYfg5
         kL7VC8nIZWYYUAjbkcacXG4FcutfUzHesxxoUzlRYcOUEd6Hkgg+as0UoHQpX2SQ4URp
         9E0Q==
X-Gm-Message-State: AOAM533NIEaUTw7uEm328MuwNeJzcUahGMILXKXiFivIUoadfg29rZ1S
        yvxQyZ+nt2+PHfMzFBWmRlZOVSTkS2lxFg==
X-Google-Smtp-Source: ABdhPJz9X8Ngv0FqY3Qt2Qu4FpDkf9MqNQXWVAHksFgr8cVEnBlADp4RTasCV9bPIx2C24bEHTAMRA==
X-Received: by 2002:a17:902:b594:b029:f8:fb4f:f8d3 with SMTP id a20-20020a170902b594b02900f8fb4ff8d3mr1539138pls.25.1622090388330;
        Wed, 26 May 2021 21:39:48 -0700 (PDT)
Received: from ryzen.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id y22sm664991pjj.34.2021.05.26.21.39.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 21:39:47 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] v4l-utils: add missing fallthrough
Date:   Wed, 26 May 2021 21:39:46 -0700
Message-Id: <20210527043946.53108-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wimplicit-fallthrough

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-edid.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
index 0d6625a34..dfaff3388 100644
--- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
@@ -4,6 +4,7 @@
 
 #include <linux/v4l2-subdev.h>
 
+#include "compiler.h"
 #include "v4l2-ctl.h"
 
 /*
@@ -1301,7 +1302,7 @@ void edid_cmd(int ch, char *optarg)
 					 sedid.pad = strtoul(value, nullptr, 0);
 					 break;
 				 }
-				 // fall through
+				 fallthrough;
 			default:
 				 edid_usage();
 				 std::exit(EXIT_FAILURE);
-- 
2.31.1

