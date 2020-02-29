Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D66ED174923
	for <lists+linux-media@lfdr.de>; Sat, 29 Feb 2020 21:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbgB2UPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Feb 2020 15:15:49 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36740 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbgB2UPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Feb 2020 15:15:48 -0500
Received: by mail-ed1-f66.google.com with SMTP id j17so7992897edp.3;
        Sat, 29 Feb 2020 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=83XtZRDQEhO36ly5ioPaY5jSK1t+1NHljrwvavBmBqk=;
        b=knGE8OUZrqbIrAlsvseI4k0JeRr28D7mmyGHwcyFZzDltOtCXXFxTfAweyG9NsW65X
         8pZ6hC1+B13MUGVuP4L5lAfFb/TK1ZONQdWyY0l9xeVKCUbPwPshJET2ajfXhEtng3C3
         gE0SH98RQJZVnfEe0Ev7YCr3ctlf5PMQOuetBixYP51XAlhC0oSVVZyd+IpnlsjtP0d1
         bJLnIzCRhx2VSbdgVIMjkE2EgpiaAEM0D0tgc72pjQ5e3Bw2nW3mcKwqTCxaJHwjgdq9
         k570l1V5Tu3L/fCKau/yJPc+Skld3ukzrLQxE53vt74mexx/oF3E/WJlzEhdA1WEkOUx
         tAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=83XtZRDQEhO36ly5ioPaY5jSK1t+1NHljrwvavBmBqk=;
        b=o3LWsJZ0PkioYoy3aNB8ay8xrR6jSDXhkvIs0oXcDDGywtmQoiDggPTHDg3LiXkob3
         6NAIf4gw4AZbu7VNPAxsNx0+lNhRMsoVwDN1AW3E419G7BNZnpEdAKoV6mkKrGwARGTz
         ADhWs6xn+Yabr/aPYcuPKRMNu4WbEIo7D2KhmN/xLxax5AYgskskWWXlw56b1aBhDqcS
         yBsEyihU9EhIANSNLZmb932dVcpFXBoQVAoeqGdmi/6KFrF7sf/kaVO8P3bGs9SWc8kF
         gP0rM64aCKR78sfRac8mwO7Jnxu3ns8hRidD9RowVm4F/lL8qe5qLMuDRUl3lmTWUTgM
         O0Sg==
X-Gm-Message-State: APjAAAU3+/rVEPnwDOZmCoIBYwPoQBy1w15FLboAg1/ZtWzC0+JP1ql9
        QrQ3Y8IdauOA2Do7IXmaIoHD9dUJ
X-Google-Smtp-Source: APXvYqz4yLC+5Ur+o/5CkW8wsb2ZlX9ZntbPvBZjbeSmbeHoBSDcRQpX/pk56dgeahMl290dTlFD9A==
X-Received: by 2002:aa7:d1d8:: with SMTP id g24mr10282059edp.39.1583007346914;
        Sat, 29 Feb 2020 12:15:46 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2db9:dd00:6db6:cde:1055:4fb5])
        by smtp.gmail.com with ESMTPSA id d2sm531156edr.97.2020.02.29.12.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 12:15:46 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-media@vger.kernel.org, Joe Perches <joe@perches.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: adjust entry to refactoring smiapp.h
Date:   Sat, 29 Feb 2020 21:15:31 +0100
Message-Id: <20200229201531.6004-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 7cbeb2e1bf0c ("media: smiapp: Move definitions under driver
directory") moved the definitions in include/media/i2c/smiapp.h into other
files and removed include/media/i2c/smiapp.h.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: include/media/i2c/smiapp.h

Remove MAINTAINER file entry to this removed file and while at it, update
Sakari's email address in this section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Sakari, please ack this patch.
Mauro, please pick this patch on your branch for linux-next.
applies cleanly on next-20200228

Sakari, I did not find an entry in mailmap to map your iki.fi mail address
to your latest mail address. There are also three further entries with
your iki.fi mail address in MAINTAINERS, that you could change to your
intel address.

 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 09b04505e7c3..33c8932a6756 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15392,11 +15392,10 @@ S:	Odd Fixes
 F:	drivers/net/ethernet/smsc/smc91x.*
 
 SMIA AND SMIA++ IMAGE SENSOR DRIVER
-M:	Sakari Ailus <sakari.ailus@iki.fi>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/smiapp/
-F:	include/media/i2c/smiapp.h
 F:	drivers/media/i2c/smiapp-pll.c
 F:	drivers/media/i2c/smiapp-pll.h
 F:	include/uapi/linux/smiapp.h
-- 
2.17.1

