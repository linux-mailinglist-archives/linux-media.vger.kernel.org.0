Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF9248B294
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 17:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238722AbiAKQuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 11:50:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238250AbiAKQuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 11:50:17 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25E2C06173F
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 08:50:16 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id i5so16063321edf.9
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 08:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMyBqSUDkCcX244moqJOyoACTSWTsFlXT0+usdF38Uc=;
        b=P5fV/SAwTMtjTEDyJvGdRQz5pcLTlm0KpC8KNN3YgcBBiEj7ySD1EHMZKzPqqGIzdx
         t0Wnp+VcAus9QS5o8p0vEOl6GRrjgkN3I55bC2Ww6ChmB9AKDqq7k34lC9GN5SpX3Wz0
         Wh1L1j+tru7FttKCisQby+UWSBJ+p3TaXna6OOTabqYWYSfCoep1SqGOO4caltq4zywI
         pDnaAWncghvGlL+oQ2bRmTThMGHJgxCahF8R8Zk+MK37m67ZK2hgDWCCk4HR53YSqcWO
         D8zTOJqita67Dpju8jRtgsMfGf2qwy3QpYdghflAxyIBXjXEECmPdP7pT+USx6C6hLac
         6/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMyBqSUDkCcX244moqJOyoACTSWTsFlXT0+usdF38Uc=;
        b=BnRZVHTXKiclrP5h6ZFb7RxuKwvpznVxKH5Vx3BBCZuCCLvR85Iwc1fEKC8V1srAuj
         o6spMXwNYWjrTUf42NNZmqMAkLbZYOKbEOzdv/qY9YUnOJS6XDVd7jgfWx6VT2ToFBw0
         pbsxt3w5OVj0uisYHCCeeoXobfyrzVkyTvy4u3b77dQetZP4aS3B5LdbHqSirCHc3Inp
         2jDRl3S6AiWae8IZYqhz+ywy/8W4JUYedJxYdPLch+xkrDKpxqJP1WP1OSaBxpf9YOhY
         QqTvNsOV+0htL+ck6dEGhFeoj4p5xZN9Volk1hq4oUaC9LvulLowZCbPRjJCIEvs9X1d
         zbSw==
X-Gm-Message-State: AOAM531fmoXQbwbmWaDGVEFiQYA4QJ51XnI/DFfuHnGf5ImRcVfY3FFK
        qPJ5/jvCJhbpTvR6EY5hGDlV5DGCOHBvtKhT4SphoHFLfrvqat2Wjsa2ihlGQRA9d6YY2dxym9a
        sG12EXjjcrGAoqcVqKDmALIM1/xxgMkuvUQ13zXoBZY8igjJXxxvzxvH3J0RIEWoQQVklk3cQ
X-Google-Smtp-Source: ABdhPJyNxhys/XeiIEmG8rLddYA0cyvaK877WVVKaRgmF8iDA3W9HcPjATYUa97jQwvVBotSsEcbMA==
X-Received: by 2002:a50:f105:: with SMTP id w5mr5170189edl.222.1641919814965;
        Tue, 11 Jan 2022 08:50:14 -0800 (PST)
Received: from nixos.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z18sm5351365edc.76.2022.01.11.08.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:50:14 -0800 (PST)
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org
Cc:     Daniel Lundberg Pedersen <dlp@qtec.com>
Subject: [PATCH] media: docs: Change unintended assignment in v4l
Date:   Tue, 11 Jan 2022 17:48:55 +0100
Message-Id: <20220111164855.147487-1-dlp@qtec.com>
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

