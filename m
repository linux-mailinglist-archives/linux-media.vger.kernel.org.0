Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3069248C405
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 13:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353147AbiALMae (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 07:30:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238102AbiALMae (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 07:30:34 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA1DC06173F
        for <linux-media@vger.kernel.org>; Wed, 12 Jan 2022 04:30:33 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id t24so9280502edi.8
        for <linux-media@vger.kernel.org>; Wed, 12 Jan 2022 04:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMyBqSUDkCcX244moqJOyoACTSWTsFlXT0+usdF38Uc=;
        b=M1fdbA6ulSnk0eOrAwZY2FxY0yoxmX9LmqhdBG5zgWo9iECDIlLOhKXOVkr+DZfrHU
         EgKH1RD1c/+Ig2NoCJfTpIA3906Mg9YDB7LzQR0PjnTMbUzsu8eSGTXD0oC2qyUuM3Xm
         ixuUSIkeQPLiiOYdCKWrNax0XPIxBX8+j8DKEeWC6Xr7YfTCpE7oML5NyBN1cPhqMr/X
         z+DubXDzPhWftWZSqglex+yJw6qJoSRwhNJE6KlrVHUUazXCSpiEDTEhfxIGdFDMvdMA
         tmMUsbpzuBtyaeE2ehMcZCegutn3xjkmzHfltcuf/QAM4I+XVD+L/lffRTl9mI2LldC1
         fjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMyBqSUDkCcX244moqJOyoACTSWTsFlXT0+usdF38Uc=;
        b=zl4eXuhZFnTmrm3EEoLE/1nuKhThHJ1IhL4TMoprXqi+jr7gs8qygB6vDh9Tn3koe5
         tNZT4ioEO+6niNiEx+qSB9rwzakIxiOYhG3Zn88Dpt0BU5hIH2P6eGMxPa6hMLKX6AkU
         Nvc6YyGK2/i8CR/A3AXqqn+BTuCFdrJV+SK67dqZa8K5VpDQ0XBcF8lvK/q+NfgHxzQ8
         R0TXW+o8oHABGM0nNpt94pF4yb6ZGloq9zWxhSKguRoTyM0+9NHEqQZMcqOu0H4s1N1T
         EX8QUI56xGUjD/h8eExMl/euL1/NXvJ4DWAyWDqpqFhkisY6XzHKF0uDc+WdpkUm8qei
         OxdQ==
X-Gm-Message-State: AOAM533yEVN/L7cHiDspEJkTLde1jqtGIrxrt6f3CtW3svsh/WZgeMm+
        VqdynMU9UA/2asflKutxUERhCtH/1nhCpArvo6KPADevJ/OxqcRwsDAwwzt2yLXWbF6mB6d5YLK
        i68hoDnsHthpSuyqnK2xAa6YSXQHa3wjmyb1oj8tQnotp+3wwFcH67slAAw+SFes0UjkGE3EL
X-Google-Smtp-Source: ABdhPJzw68UmWoiCziOjxxI/XNCwPMGIGztXt5QGLV4JRvjemWhHPXxrWxQakSIx/A3XDwXCL/TcxQ==
X-Received: by 2002:a05:6402:35d2:: with SMTP id z18mr8579686edc.100.1641990632057;
        Wed, 12 Jan 2022 04:30:32 -0800 (PST)
Received: from nixos.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id hp18sm4473123ejc.120.2022.01.12.04.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 04:30:31 -0800 (PST)
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org
Cc:     Daniel Lundberg Pedersen <dlp@qtec.com>
Subject: [PATCH v2] media: docs: v4l2grab.c.rst: change unintended assignment
Date:   Wed, 12 Jan 2022 13:28:09 +0100
Message-Id: <20220112122809.9244-1-dlp@qtec.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Example should be comparing errno to EINTR instead of doing assignment.

Signed-off-by: Daniel Lundberg Pedersen <dlp@qtec.com>
---
 Documentation/userspace-api/media/v4l/v4l2grab.c.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/v4l2grab.c.rst b/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
index eaa0f95048e7..c98a78d63a8b 100644
--- a/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
@@ -134,7 +134,7 @@ file: media/v4l/v4l2grab.c
 			    tv.tv_usec = 0;
 
 			    r = select(fd + 1, &fds, NULL, NULL, &tv);
-		    } while ((r == -1 && (errno = EINTR)));
+		    } while ((r == -1 && (errno == EINTR)));
 		    if (r == -1) {
 			    perror("select");
 			    return errno;
-- 
2.33.1

