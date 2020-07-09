Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6AC21A9BF
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 23:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgGIV3x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 17:29:53 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:35872 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726193AbgGIV3x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jul 2020 17:29:53 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 1EB38BC0D1;
        Thu,  9 Jul 2020 21:29:49 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     isely@pobox.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] PVRUSB2 VIDEO4LINUX DRIVER: Replace HTTP links with HTTPS ones
Date:   Thu,  9 Jul 2020 23:29:43 +0200
Message-Id: <20200709212943.27437-1-grandmaster@al2klimov.de>
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


 Documentation/driver-api/media/drivers/pvrusb2.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/drivers/pvrusb2.rst b/Documentation/driver-api/media/drivers/pvrusb2.rst
index 83bfaa531ea8..cbd9359c247a 100644
--- a/Documentation/driver-api/media/drivers/pvrusb2.rst
+++ b/Documentation/driver-api/media/drivers/pvrusb2.rst
@@ -20,7 +20,7 @@ last known snapshot and evolved the driver to the state it is in
 here.
 
 More information on this driver can be found at:
-http://www.isely.net/pvrusb2.html
+https://www.isely.net/pvrusb2.html
 
 
 This driver has a strong separation of layers.  They are very
-- 
2.27.0

