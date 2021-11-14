Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E24144F746
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 09:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhKNI4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 03:56:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhKNI4p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 03:56:45 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A6EC061746;
        Sun, 14 Nov 2021 00:53:51 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id bf8so27773644oib.6;
        Sun, 14 Nov 2021 00:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NB/5ezdcbSJ56kEx6pqPsfQ053xj0Tci+WTj1U5J9ZM=;
        b=NeKNkLtbCsZ+1Q2uV9/IQHLVxWbZZ4HhdHl6GQkMQbOhh6b5Bv+yW7hjfsLm8eeIlf
         w5bVPRHCSLE2fN9T+1uLTyst8b2rc+x4foOc+xvKSdkfqjXI0x6Obbip70iGVOtHo5ck
         UhQ3dfuWvF7wgAN2x3kRkVkjklX/YYxN6DgeU6XmDXHKuqcNh0ygq5uqKY+DNC/NduAb
         Hfzg/TIQKILVHQ14SU7uM0n1xtczz+phrtZCUpznyPAdsoq8Jx8QJ46FY4speGJ1QXS1
         4HyncvXE8W5lzrV267aOyyGqBp22Y98fEJn2jzYn27zm+XeZkSHaugDsCaioB6BXoKR9
         WwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NB/5ezdcbSJ56kEx6pqPsfQ053xj0Tci+WTj1U5J9ZM=;
        b=zjA8hUxIg1l4zrYJFWoe108ZABrVeTHESZ7xoBOZnu5C4qLeSvvULVXg2JtSmDt83q
         dsDx5Xvn4d3n19rkuOElHK7+wzr7HUYV2uaZy4RqmzOBHXlXJvHc0WSH47p7PEe/vpn4
         V2bOfC1CSA6sgtHrz5N+TclPyUZY1i2s5dJFRp3xrQVgwopUUxAHSbO/sLsb3IaNB2o1
         t6XXD2vduSeOt5izUFTbo9guJ5xjLMZdDYZecqA3RM3PQSdqCCi5VwltEXAzoedbTnJK
         E4sqlGdd68T2Ess5oc0MOZoesAcBVOM5NcjANmqcXzfSyMfI1B1FVLFEOC7u+h9E0HSZ
         CVBw==
X-Gm-Message-State: AOAM5316vKONPff6Vd9wHNuLwc6LLA0YA+KZ8AmlsctE470Hvg6Z1ZI7
        BdmRyjMAReoY9WilVM9HeHM=
X-Google-Smtp-Source: ABdhPJwWm6O7uecWqYUnsbK4yQWOJRoGS23BJsLPwvltk1eFdbGcOfhWsjdws8jURkzwtwA2oYY67Q==
X-Received: by 2002:a54:439a:: with SMTP id u26mr24226001oiv.49.1636880031136;
        Sun, 14 Nov 2021 00:53:51 -0800 (PST)
Received: from james-x399.localdomain (71-218-244-53.hlrn.qwest.net. [71.218.244.53])
        by smtp.gmail.com with ESMTPSA id bn41sm1864739oib.18.2021.11.14.00.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 00:53:50 -0800 (PST)
From:   James Hilliard <james.hilliard1@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 1/1] media: uvcvideo: Increase UVC_CTRL_CONTROL_TIMEOUT to 5 seconds.
Date:   Sun, 14 Nov 2021 01:52:36 -0700
Message-Id: <20211114085236.2345589-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some uvc devices appear to require the maximum allowed USB timeout
for GET_CUR/SET_CUR requests.

So lets just bump the UVC control timeout to 5 seconds which is the
same as the usb ctrl get/set defaults:
USB_CTRL_GET_TIMEOUT 5000
USB_CTRL_SET_TIMEOUT 5000

Fixes:
Failed to query (GET_CUR) UVC control 11 on unit 2: -110 (exp. 1).
Failed to query (SET_CUR) UVC control 3 on unit 2: -110 (exp. 2).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index fd4f5ef47dfb..583c51ac3eec 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -189,7 +189,7 @@
 /* Maximum status buffer size in bytes of interrupt URB. */
 #define UVC_MAX_STATUS_SIZE	16
 
-#define UVC_CTRL_CONTROL_TIMEOUT	500
+#define UVC_CTRL_CONTROL_TIMEOUT	5000
 #define UVC_CTRL_STREAMING_TIMEOUT	5000
 
 /* Maximum allowed number of control mappings per device */
-- 
2.25.1

