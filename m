Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53C5912A59D
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2019 03:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfLYCgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Dec 2019 21:36:53 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:34950 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbfLYCgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Dec 2019 21:36:53 -0500
Received: by mail-pj1-f66.google.com with SMTP id s7so1895352pjc.0;
        Tue, 24 Dec 2019 18:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pdIbOs3lDS1y4SwDmDRq4hIBgk7hg9mVWHE7Ddel5uU=;
        b=dnV1PVKt2H+CsjlMYnYLbstb7q7F2tr2GthayCFodUykVCzuV3+rJuxSKxewzZDEfS
         +fpWJye1uNAyPx2619mh1RhTj+PIVRXpATrD6ootqBJ3hL5A3C6WL0EhUt1t5PcDOywV
         HODmZkrvchjgUdAE4tFFgH+HiIBY/B3FEbnxTEuN7OCyqEeu5pezOYwNqk9Wh5c2JM06
         /hjjTtT7sWGxt/z+8jlxyGU3VMigiP1yePUyJPrjAFAddkl9LT/GeG0IkagmcuZJn6R2
         Y95iL4CYmQ1Ny6chVsIntCfHRHuq52pWlF68tPPrUw/2x46pPhV0WYgAzM0dA6RZW8pF
         04Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pdIbOs3lDS1y4SwDmDRq4hIBgk7hg9mVWHE7Ddel5uU=;
        b=qsC3ATkYvGLtO+KmYl0W/SMPCLj45/OQ54IBHnSL5JCsAKC1Y8pcUZisvFVK9MD/xN
         olX+gKRL5eV/ZKhgL05LrYupvGJ/SdfWUB3V7SpqncUeawDcwsT1N2kHbDln2fKFNF+V
         VpQ65swxM6sFbu9HzX0NzltBVo3XlGaMxMPHypD6ByB+jW5d4kuK1vnGCvqkLQDcUZI7
         OiBI0Om2+ZN7aaRMTXKGx5w7JqPPwr2XYf7m+WMgfwdWRBuOSHliTEAs/a/CviAPNFFE
         7x5jqiOmqmlAQUBnqsOKp30fFtPbr5pX4rc/5kmtuH+0fau8DmeP/EY07zJLn4Ej2AGX
         gJdQ==
X-Gm-Message-State: APjAAAUvHJluv75J4TLOYdeiJ02mKLKvz01PGzYbfwaqiSIfKqvlrLuu
        8yUre0BPCynQKwv7f+aFt4c=
X-Google-Smtp-Source: APXvYqxJq1WbS2DBxAHVPR59NM3DZHjm6j4bnWQpGwhVVbZ07V0gQZ5xhzu5Kt45G8iYbCONeB0dqQ==
X-Received: by 2002:a17:90a:930f:: with SMTP id p15mr10170606pjo.2.1577241412487;
        Tue, 24 Dec 2019 18:36:52 -0800 (PST)
Received: from localhost.localdomain (114-34-112-171.HINET-IP.hinet.net. [114.34.112.171])
        by smtp.gmail.com with ESMTPSA id u18sm27245406pgi.44.2019.12.24.18.36.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 24 Dec 2019 18:36:52 -0800 (PST)
From:   Jun Chen <ptchentw@gmail.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, ptchentw@gmail.com,
        Jun Chen <jun.chen@vatics.com>
Subject: [PATCH] media: uvcvideo: Fix annotation for uvc_video_clock_update()
Date:   Wed, 25 Dec 2019 10:34:17 +0800
Message-Id: <1577241257-9203-1-git-send-email-ptchentw@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jun Chen <jun.chen@vatics.com>

The formula (2) is to convert from SOF to host clock,
it should be fix as
"TS = ((TS2 - TS1) * SOF + TS1 * SOF2 - TS2 * SOF1) / (SOF2 - SOF1)"

Signed-off-by: Jun Chen <jun.chen@vatics.com>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 8fa77a8..a3150da 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -622,7 +622,7 @@ static u16 uvc_video_clock_host_sof(const struct uvc_clock_sample *sample)
  * to avoid losing precision in the division. Similarly, the host timestamp is
  * computed with
  *
- * TS = ((TS2 - TS1) * PTS + TS1 * SOF2 - TS2 * SOF1) / (SOF2 - SOF1)	     (2)
+ * TS = ((TS2 - TS1) * SOF + TS1 * SOF2 - TS2 * SOF1) / (SOF2 - SOF1)	     (2)
  *
  * SOF values are coded on 11 bits by USB. We extend their precision with 16
  * decimal bits, leading to a 11.16 coding.
-- 
1.9.1

