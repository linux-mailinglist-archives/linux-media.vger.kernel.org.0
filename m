Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041BD244417
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 06:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgHNEE3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 00:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgHNEE2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 00:04:28 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE39C061757
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 21:04:28 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 17so3918894pfw.9
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 21:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=54FY878KVj/CSYsO8Dcm5OWJhxN5w6OcdyXWGK9m8HY=;
        b=Yek8F3bP/X1Llmt3D8t+vLpkKc1kjIvnq0GoSs91ylajOApMtD6rzmoOY53kVhIRiw
         xljBhN9ZpCU5mFPj3jF3VE2EoaGCoS4TNdQigUvkmK1RksYtwtryxaJgYra0y/dgU4Dn
         tLPIe6s6kKIq2bF+6dHwnmwDosWZKU/sLzZXWWyt+vtcvQFSSOCFMS6e67h1oc7sdQvv
         G7xUjSnaRWNgnaMVfY+tTRJ4cNMtSoFKapgaR7nhE+pNety7MBXiisHyDB+tcKH8AE3A
         aYqjRreZ4LlanUAtp54YSEwaAScImpmjWkk/w5cmpD1EEpq/9VGDxA5TktYjqfR+Jv6m
         cJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=54FY878KVj/CSYsO8Dcm5OWJhxN5w6OcdyXWGK9m8HY=;
        b=Hp8r2IkJB3MTo7VMOOfBAiZJACBzKXC9Rd3dXNd2eTfyP5F2zbyG5B3wbybfIcy/Sc
         6c50Y5YjBGuQ+OdQLvWr9EzrR6m/jhnIND7jpkmTALn16NNtPlAlx70/GNEYv97Wu2Qf
         3KhhLwuUJ1fGGXIxRK0EjKqGZ2ThxyMbnsZUMuM9w+t3B8dUI/D3zUCpAYapMD0KfKbR
         sC8bJgkT6kNAzWqQLxpC8Sdcn0VGMfBNRqrXUgqRMd8Amrj7hiD/iv16D6yM7j9lbNYC
         zZIcXhQSxf1O65/mbXIfIOI9IzGztdU+iqUqdis8e88yEa7cYnNNXrq6tkPLYZcGVwp8
         pRGg==
X-Gm-Message-State: AOAM532ZyIK7P0OvTgAtQVeAZca5w4D4fKbjWFunv7eJ2+dfFa3iqik7
        cCgdcJR5w3aicqSvvkhUlGDYZSNuK4Y=
X-Google-Smtp-Source: ABdhPJxJDwysbl+rMmWhFPBr/A0dMo93EyIZ391CVQnZ+0t8cq0t0Cov2Pvf4gbIhKXGpqVfunmwwA==
X-Received: by 2002:aa7:9570:: with SMTP id x16mr486020pfq.254.1597377868163;
        Thu, 13 Aug 2020 21:04:28 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id w7sm7362226pfi.164.2020.08.13.21.04.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 21:04:27 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] add missing include for uClibc-ng
Date:   Thu, 13 Aug 2020 21:04:26 -0700
Message-Id: <20200814040426.220237-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes missing va_list

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/libdvbv5/dvb-dev-remote.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/libdvbv5/dvb-dev-remote.c b/lib/libdvbv5/dvb-dev-remote.c
index ebb1bdb77..e4ea3a824 100644
--- a/lib/libdvbv5/dvb-dev-remote.c
+++ b/lib/libdvbv5/dvb-dev-remote.c
@@ -30,6 +30,7 @@
 #include <ctype.h>
 #include <inttypes.h>
 #include <libudev.h>
+#include <stdarg.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <locale.h>
-- 
2.26.2

