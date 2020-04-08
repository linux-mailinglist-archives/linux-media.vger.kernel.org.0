Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A18C1A2211
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 14:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgDHMby (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 08:31:54 -0400
Received: from mail-qk1-f181.google.com ([209.85.222.181]:43823 "EHLO
        mail-qk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgDHMby (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 08:31:54 -0400
Received: by mail-qk1-f181.google.com with SMTP id 13so2882504qko.10
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hdc2dfV0wpiCD2hWUiBeZnd92/9DH6KajjiQ3UGaOyA=;
        b=HjZsCLTwv+cgdFqyFdWxt1zM+nVDXn0TY1KLQuv0shoqY51JvW3qZCE+CPUmx01Dq9
         TJxcwLtZ9pbUgRNag+5A5BWPFuDnBtq3krqiaYoDkaPkqrbRs3SxUq+ZdQ61c5646Gm0
         RDHx0g1iPYRwWNJgFGaRSxMxhjFer19ZxvD8r2colBPnhxdEV7eKuDPQ/v6Wv5si7K2H
         At54qLlyslWITa9HbGtP07n8t1q4QRAgBGlz0OxG1wXDckrdeVIIaOfF058/5SYwHSPF
         YDYe88tU6lclMCyCrmdLqQt86G4XQgisqDto0brGMT+9j4n/OAYl/TpelAYtTA0gfruI
         DcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hdc2dfV0wpiCD2hWUiBeZnd92/9DH6KajjiQ3UGaOyA=;
        b=Q57dNpV31ga/b2igTuSvOhTZtOXoUbQ25M4mkkt0V2CKJYnKAfjELCWV83GJ4kq+aj
         CMjY3vop8sxSuKfLg/UCCBg8zuzhYN8BFdlyVTKTMEmrKhOrTxRxL5wWaeWPw9eclQVF
         S7++YZOJ7Tw6oeE5OCxRtcEPgslczfFAIxW10PqoqZ37Arl7je8UstdXXO7YZ1DHM0aN
         QWoXCf5kkxXOPfR9NPFmORyLydVyGeP4tJMFNiZYkHrfS7znAE935yWHvfudPiBpyzIP
         0PHv7BGili6ab/zEw5jydKXVP144IofT4CygkjUJ8e+mAHUeNs6RZZEhDyRn6f9JNH2n
         65qA==
X-Gm-Message-State: AGi0PuY34FsSA59IRwRz2NiSAFthSGjDnL6Ha9qGI+ZPBc5O9DIie6u6
        QX6ZgfhprItZFBovvhaptBY=
X-Google-Smtp-Source: APiQypKumB8nNSx0QbjVJhURhelbtTCOslzPUyGRtPD5TXb9pdbPg9KFBqVQgUjbW+pNQrLxWL+/cw==
X-Received: by 2002:a37:591:: with SMTP id 139mr7189048qkf.281.1586349112810;
        Wed, 08 Apr 2020 05:31:52 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id z40sm9120377qtj.45.2020.04.08.05.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 05:31:52 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/4] media: imx.rst: Provide the OV560 module part number
Date:   Wed,  8 Apr 2020 09:32:14 -0300
Message-Id: <20200408123215.2531-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408123215.2531-1-festevam@gmail.com>
References: <20200408123215.2531-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to improve the documentation, provide the OV5640 MIPI module
part number that is used on the imx6q-sabresd board.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/media/v4l-drivers/imx.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 3b4767f5f422..37b944f12d93 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -641,8 +641,8 @@ connects to i2c bus 1 and the OV5640 to i2c bus 2.
 The device tree for SabreSD includes OF graphs for both the parallel
 OV5642 and the MIPI CSI-2 OV5640, but as of this writing only the MIPI
 CSI-2 OV5640 has been tested, so the OV5642 node is currently disabled.
-The OV5640 module connects to MIPI connector J5 (sorry I don't have the
-compatible module part number or URL).
+The OV5640 module connects to MIPI connector J5. The NXP part number
+for the OV5640 module that connects to the SabreSD board is H120729.
 
 The following example configures a direct conversion pipeline to capture
 from the OV5640, transmitting on MIPI CSI-2 virtual channel 0:
-- 
2.17.1

