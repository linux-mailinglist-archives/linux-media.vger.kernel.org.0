Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731E43BA916
	for <lists+linux-media@lfdr.de>; Sat,  3 Jul 2021 17:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbhGCPD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Jul 2021 11:03:26 -0400
Received: from gofer.mess.org ([88.97.38.141]:45647 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229562AbhGCPDY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Jul 2021 11:03:24 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 872C4C6402; Sat,  3 Jul 2021 16:00:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1625324449; bh=BtrZZ6MbcFj9yQGIoSoMHEVONnKHSp0m2Ud31v00gh0=;
        h=From:To:Subject:Date:From;
        b=egqpjz3XLNAfucwDvNlCwAn5VJMl59oJQYTr1JB0tkgyEYzUDUA17ZgCpBJ/ZFavh
         vR6uyrxmDNwvjKXllJdZ1KJ+qgfjaR2/LgCz9elJfLWgfrTLd0R+uM16WQT+h0J0qZ
         OKS03gnSExz9/Coae8NOYxU8jj+vc5BXCOJd5GJBeocJRFePidluVJnb7cL524LRA3
         yfVvjJE+l0C02Jey2cQdeFa9DurEUNdo2w3hpMj4K8Uf7ux4E75HkYS07ll8Wv8c4u
         nuj10rAtKdzvGjBBjw1rVdl5lPnbwQycPthL3cesayVr89ZKyZCHqzBEmyoVsF0Ruh
         jX+TsdfiZjClw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-ctl: print correct transmitter count
Date:   Sat,  3 Jul 2021 16:00:49 +0100
Message-Id: <20210703150049.11917-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/ir-ctl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 3c3bcca1..66a257a7 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -933,7 +933,7 @@ static int lirc_options(struct arguments *args, int fd, unsigned features)
 		if (features & LIRC_CAN_SET_TRANSMITTER_MASK) {
 			rc = ioctl(fd, LIRC_SET_TRANSMITTER_MASK, &args->emitters);
 			if (rc > 0)
-				fprintf(stderr, _("warning: %s: failed to set send transmitters: only %d available\n"), dev, rc);
+				fprintf(stderr, _("warning: %s: failed to set send transmitters: only %d available\n"), dev, ffs(~rc) - 1);
 			else if (rc < 0)
 				fprintf(stderr, _("warning: %s: failed to set send transmitters: %m\n"), dev);
 		} else
@@ -1026,8 +1026,11 @@ static void lirc_features(struct arguments *args, int fd, unsigned features)
 				fprintf(stderr, _("warning: %s: device supports setting transmitter mask but returns 0 as number of transmitters\n"), dev);
 			else if (rc < 0)
 				fprintf(stderr, _("warning: %s: device supports setting transmitter mask but returns: %m\n"), dev);
-			else
-				printf(_(" - Set transmitter (%d available)\n"), rc);
+			else {
+				unsigned count = ffs(~rc) - 1;
+
+				printf(_(" - Set transmitter (%d available)\n"), count);
+			}
 		}
 	} else if (features & LIRC_CAN_SEND_LIRCCODE) {
 		printf(_(" - Device can send using device dependent LIRCCODE mode (not supported)\n"));
-- 
2.31.1

