Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8A2218B02
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 17:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729921AbgGHPSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 11:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729910AbgGHPSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 11:18:23 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA2DC061A0B;
        Wed,  8 Jul 2020 08:18:23 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 95B47BC116;
        Wed,  8 Jul 2020 15:18:19 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     zzam@gentoo.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] Replace HTTP links with HTTPS ones: SI2165 MEDIA DRIVER
Date:   Wed,  8 Jul 2020 17:18:13 +0200
Message-Id: <20200708151813.14958-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.


 drivers/media/dvb-frontends/si2165.c | 2 +-
 drivers/media/dvb-frontends/si2165.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/si2165.c b/drivers/media/dvb-frontends/si2165.c
index 3fdaef1935ef..ebee230afb7b 100644
--- a/drivers/media/dvb-frontends/si2165.c
+++ b/drivers/media/dvb-frontends/si2165.c
@@ -5,7 +5,7 @@
  *  Copyright (C) 2013-2017 Matthias Schwarzott <zzam@gentoo.org>
  *
  *  References:
- *  http://www.silabs.com/Support%20Documents/TechnicalDocs/Si2165-short.pdf
+ *  https://www.silabs.com/Support%20Documents/TechnicalDocs/Si2165-short.pdf
  */
 
 #include <linux/delay.h>
diff --git a/drivers/media/dvb-frontends/si2165.h b/drivers/media/dvb-frontends/si2165.h
index 0b19317f3a31..adc5e18754ad 100644
--- a/drivers/media/dvb-frontends/si2165.h
+++ b/drivers/media/dvb-frontends/si2165.h
@@ -5,7 +5,7 @@
  * Copyright (C) 2013-2017 Matthias Schwarzott <zzam@gentoo.org>
  *
  * References:
- *   http://www.silabs.com/Support%20Documents/TechnicalDocs/Si2165-short.pdf
+ *   https://www.silabs.com/Support%20Documents/TechnicalDocs/Si2165-short.pdf
  */
 
 #ifndef _DVB_SI2165_H
-- 
2.27.0

