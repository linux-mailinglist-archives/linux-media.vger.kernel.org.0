Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F47304CD1
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730867AbhAZW4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:56:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392801AbhAZT10 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 14:27:26 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E3CC061788
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 11:26:45 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id w124so19712702oia.6
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 11:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gnlXVpJnCAkP8W3GA73N34jnD1Oq53YIDVgXQEyvOx0=;
        b=u4fPbD8Ilt8r8Y/Vg8PjdKMVmrfoWn88FqtlxwDrykMkuxCBTA329+98/xtk8OD5jF
         i1mPQgFK1PHzscNl5t+ZSpMXMy4HO1WLVjKJjyhN88ka6f4aWy1XjKF4CUya53zlv5F0
         KuDI44i4WbC/6W0HcCxOt1Yp7MJANxkGbQik/h9HlfOK3tIGaKwqUfKrJkWXhMnYc906
         EYtx5BPkYLn2pCEPqcOQAnsLeSmM4KLos3KYEPVliF8bW6zgs4q3uScw0vAl8qHy6eCe
         neeTy45Qer/95b5jwpQEMAzSrSWuCunA1OavSg4JPNKOOW/Jv9mZE14mFEtMHDYIhG3x
         fU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gnlXVpJnCAkP8W3GA73N34jnD1Oq53YIDVgXQEyvOx0=;
        b=fR6NeRHCPPs5o78Ata+VnPtrahqW4iNNPTyl5t5oQap1NQJkYeGXdcHZU/ewrTsjmK
         Y2829m5GnlVfFh+tPI6D5EoMnyXPJusd74f4+e1DL4fcrlr9pwr/g4/HMCvw6lXHr4gD
         MFafQW9iCMnDT8Nlw3VNFgTl4lgxxlfxxIKFDSZeFmQ9INH2X+bqxOPMMIao2X3IXfs6
         jjPCtow1MCigx8wKYm4EZZTMKQZu+w95pASzDthSYULqiPblNxjpQv9CWkI0FETMoe/I
         xm6HMZCx+YLe2lgurYwJMKt0qMOfH5Dw3fFY9g1hBmwVd74DddsLv6AK++m8k5M8bX/0
         Fx+Q==
X-Gm-Message-State: AOAM532e8fTV8sEIPs2CileUYPQk6gIp6yIf6EW4G8Cq25Eyu2FVytZx
        3vJ6XmlX4kKIFMyqcsoUYHkTsum3U+9/hpo5
X-Google-Smtp-Source: ABdhPJxWp7y0vXebLIkTwFJtMaJQTO/LXG+iMDyBFsyDN4KMxYox6w7/F2aak7e2Hz/Xe5GRcFUHgQ==
X-Received: by 2002:a54:4e03:: with SMTP id a3mr814205oiy.108.1611689205257;
        Tue, 26 Jan 2021 11:26:45 -0800 (PST)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id j8sm4315362oie.47.2021.01.26.11.26.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jan 2021 11:26:44 -0800 (PST)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, sean@mess.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 3/4] em28xx-core: Fix i2c error debug
Date:   Mon, 25 Jan 2021 19:54:15 -0600
Message-Id: <20210126015416.5622-4-brad@nextdimension.cc>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126015416.5622-1-brad@nextdimension.cc>
References: <20200612183937.10952-1-3126054018@nextdimension.cc>
 <20210126015416.5622-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read errors are currently reported as write errors.

An incorrectly received read operation is never reported at all.
Add a debug statement indicating the request mismatch.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v1:
- Was not in v1

 drivers/media/usb/em28xx/em28xx-i2c.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-i2c.c b/drivers/media/usb/em28xx/em28xx-i2c.c
index 592b98b3643a..255395959255 100644
--- a/drivers/media/usb/em28xx/em28xx-i2c.c
+++ b/drivers/media/usb/em28xx/em28xx-i2c.c
@@ -294,6 +294,10 @@ static int em28xx_i2c_recv_bytes(struct em28xx *dev, u16 addr, u8 *buf, u16 len)
 			 "reading from i2c device at 0x%x failed (error=%i)\n",
 			 addr, ret);
 		return ret;
+	} else if (ret != len) {
+		dev_dbg(&dev->intf->dev,
+			"%i bytes read from i2c device at 0x%x requested, but %i bytes written\n",
+				ret, addr, len);
 	}
 	/*
 	 * NOTE: some devices with two i2c buses have the bad habit to return 0
@@ -329,7 +333,7 @@ static int em28xx_i2c_recv_bytes(struct em28xx *dev, u16 addr, u8 *buf, u16 len)
 	}
 
 	dev_warn(&dev->intf->dev,
-		 "write to i2c device at 0x%x failed with unknown error (status=%i)\n",
+		 "read from i2c device at 0x%x failed with unknown error (status=%i)\n",
 		 addr, ret);
 	return -EIO;
 }
-- 
2.28.0

