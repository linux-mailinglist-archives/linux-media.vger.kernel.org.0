Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5A9320D50
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 20:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhBUTz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 14:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbhBUTz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 14:55:56 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A10C061574;
        Sun, 21 Feb 2021 11:55:15 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id e17so52120845ljl.8;
        Sun, 21 Feb 2021 11:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HB9B8oIruGylyRqCF6zX0rkKFDgB6LDCYxjHaA5K9kg=;
        b=AjUzG3hKbmjVWAkWPS5fRT3f2IWdAmqa6b92vEdvYU0Abb9HUCEx5/laaG5PG+cIl9
         SiQnKDyfzI4Xn9EKLMRPw+ucu8qLfuNdl+UnJkK9AWDNAZHSTYl6/4qusAKxei8dsEK0
         S3HJAjZGI6GNLbI6O5E2Eu1JSvqB+1+wgj0HoCZL7jL88SUFIWZVN0rdUEOcCOaPIria
         ZyZMzaSIK7XvDt5bNe/3H20tPbNYNQqAVnpfZMKoqmo7KxrJKELv0ZRNJqNK+B9rxnW2
         e1wmWCVmCy80vbwHOBWsgY+akgBpzesFmbARAnllNYkQhHaK4ngChJmx++r7EwlmUrKh
         PdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HB9B8oIruGylyRqCF6zX0rkKFDgB6LDCYxjHaA5K9kg=;
        b=MW7eT9MPyZIdWp7NZIqoq7JQsBvbYLtDbm33YTwkqXfMx8CFUDiQRszpnYF+jc2ivU
         L7ubcdzz0/RrtKX0Gy5J9V7qlU5IDMHnO05PKcQpbLbMm9KCt+l49LyZMaGa3RhKzBpu
         9wHFQ4emvOnOeNx+acMWMMsbigVn/Jqb9Wa1HNbz990QClKDqB3mYJ3uwXtkfLiNSrU2
         gNKAtC9JZdMucEGwer8ueGdwVCZd6wHqYNjqbJ72IB5INsp1i/DvupzhXnebW71JAhZE
         kiHW8uIMfm9Nx5a3fDnctIdCPEgZKLsSbxtdNyepGPYUaKWc9P86LC38PHeB3TL3Bef+
         Cu3A==
X-Gm-Message-State: AOAM5327mu2wtH74aft5L9xaLsiyCovS3VYZMM0jJSXbnfFHOTcG7Sfv
        mn/q+B0SccmEaXrdZmNXPiPvgYKWUinz7w==
X-Google-Smtp-Source: ABdhPJwnohB4eX4R+mXbyruf/El7kUWwd8tGrLgAGnLKkBBsLQPWM6hn1/Grg/87i64DRvz3RNgrFw==
X-Received: by 2002:a2e:3101:: with SMTP id x1mr12299521ljx.412.1613937314274;
        Sun, 21 Feb 2021 11:55:14 -0800 (PST)
Received: from msi.localdomain (vmpool.ut.mephi.ru. [85.143.112.90])
        by smtp.gmail.com with ESMTPSA id q6sm1659850lfn.23.2021.02.21.11.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 11:55:13 -0800 (PST)
From:   Nikolay Kyx <knv418@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nikolay Kyx <knv418@gmail.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: omap4iss: code style - avoid macro argument precedence issues
Date:   Sun, 21 Feb 2021 22:53:08 +0300
Message-Id: <20210221195308.1451-1-knv418@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the following checkpatch.pl check:

CHECK: Macro argument 'i' may be better as '(i)' to avoid precedence issues

in file iss_regs.h

Signed-off-by: Nikolay Kyx <knv418@gmail.com>
---

Additionally some style warnings remain valid here and could be fixed by
another patch.

 drivers/staging/media/omap4iss/iss_regs.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_regs.h b/drivers/staging/media/omap4iss/iss_regs.h
index 09a7375c89ac..cfe0bb075072 100644
--- a/drivers/staging/media/omap4iss/iss_regs.h
+++ b/drivers/staging/media/omap4iss/iss_regs.h
@@ -197,7 +197,7 @@
 #define CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK		(0x1fff << 0)
 #define CSI2_TIMING_STOP_STATE_COUNTER_IO1_SHIFT	0
 
-#define CSI2_CTX_CTRL1(i)				(0x70 + (0x20 * i))
+#define CSI2_CTX_CTRL1(i)				(0x70 + (0x20 * (i)))
 #define CSI2_CTX_CTRL1_GENERIC				BIT(30)
 #define CSI2_CTX_CTRL1_TRANSCODE			(0xf << 24)
 #define CSI2_CTX_CTRL1_FEC_NUMBER_MASK			(0xff << 16)
@@ -210,7 +210,7 @@
 #define CSI2_CTX_CTRL1_PING_PONG			BIT(3)
 #define CSI2_CTX_CTRL1_CTX_EN				BIT(0)
 
-#define CSI2_CTX_CTRL2(i)				(0x74 + (0x20 * i))
+#define CSI2_CTX_CTRL2(i)				(0x74 + (0x20 * (i)))
 #define CSI2_CTX_CTRL2_FRAME_MASK			(0xffff << 16)
 #define CSI2_CTX_CTRL2_FRAME_SHIFT			16
 #define CSI2_CTX_CTRL2_USER_DEF_MAP_SHIFT		13
@@ -222,19 +222,19 @@
 #define CSI2_CTX_CTRL2_FORMAT_MASK			(0x3ff << 0)
 #define CSI2_CTX_CTRL2_FORMAT_SHIFT			0
 
-#define CSI2_CTX_DAT_OFST(i)				(0x78 + (0x20 * i))
+#define CSI2_CTX_DAT_OFST(i)				(0x78 + (0x20 * (i)))
 #define CSI2_CTX_DAT_OFST_MASK				(0xfff << 5)
 
-#define CSI2_CTX_PING_ADDR(i)				(0x7c + (0x20 * i))
+#define CSI2_CTX_PING_ADDR(i)				(0x7c + (0x20 * (i)))
 #define CSI2_CTX_PING_ADDR_MASK				0xffffffe0
 
-#define CSI2_CTX_PONG_ADDR(i)				(0x80 + (0x20 * i))
+#define CSI2_CTX_PONG_ADDR(i)				(0x80 + (0x20 * (i)))
 #define CSI2_CTX_PONG_ADDR_MASK				CSI2_CTX_PING_ADDR_MASK
 
-#define CSI2_CTX_IRQENABLE(i)				(0x84 + (0x20 * i))
-#define CSI2_CTX_IRQSTATUS(i)				(0x88 + (0x20 * i))
+#define CSI2_CTX_IRQENABLE(i)				(0x84 + (0x20 * (i)))
+#define CSI2_CTX_IRQSTATUS(i)				(0x88 + (0x20 * (i)))
 
-#define CSI2_CTX_CTRL3(i)				(0x8c + (0x20 * i))
+#define CSI2_CTX_CTRL3(i)				(0x8c + (0x20 * (i)))
 #define CSI2_CTX_CTRL3_ALPHA_SHIFT			5
 #define CSI2_CTX_CTRL3_ALPHA_MASK			\
 		(0x3fff << CSI2_CTX_CTRL3_ALPHA_SHIFT)
-- 
2.30.1

