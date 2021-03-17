Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07BF333FB9F
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 00:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbhCQXDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 19:03:33 -0400
Received: from gateway22.websitewelcome.com ([192.185.47.100]:45756 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229723AbhCQXD1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 19:03:27 -0400
X-Greylist: delayed 1329 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Mar 2021 19:03:27 EDT
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id C288419E49
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 17:41:16 -0500 (CDT)
Received: from gator3086.hostgator.com ([50.87.144.121])
        by cmsmtp with SMTP
        id MeqqlIl3vb8LyMeqqlnDOS; Wed, 17 Mar 2021 17:41:16 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sensoray.com; s=default; h=Message-Id:Date:Subject:Cc:To:From:Sender:
        Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PWkJ4oGtfXpPi3sjnJ/M1SpHqocBADhTPLfK4c0TuWo=; b=fhtV3Ewgs6RMoubGJEUhxiWPCl
        do5nAw9Ii0ARkAo3G9CnFp4vNP7Cw23nZYAR2qDBSLcxKfOcIrBD0PYxl14Ax9nH+RGZiY95orQ8f
        pUtF1WWu9WBJL76Bzvt7AK/vz1VItswsUragTYXmt2B8V2m554MtxhWTiIiJ1W16rlXA=;
Received: from 97-120-57-254.ptld.qwest.net ([97.120.57.254]:41972 helo=localhost.localdomain)
        by gator3086.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <dean@sensoray.com>)
        id 1lMeqp-0016Yu-Ox; Wed, 17 Mar 2021 17:41:15 -0500
From:   Dean Anderson <dean@sensoray.com>
To:     linux-usb@vger.kernel.org, balbi@kernel.org
Cc:     Dean Anderson <dean@sensoray.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH] usb: gadget/function/f_fs string table fix for multiple languages
Date:   Wed, 17 Mar 2021 15:41:09 -0700
Message-Id: <20210317224109.21534-1-dean@sensoray.com>
X-Mailer: git-send-email 2.17.1
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3086.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sensoray.com
X-BWhitelist: no
X-Source-IP: 97.120.57.254
X-Source-L: No
X-Exim-ID: 1lMeqp-0016Yu-Ox
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 97-120-57-254.ptld.qwest.net (localhost.localdomain) [97.120.57.254]:41972
X-Source-Auth: dean@sensoray.com
X-Email-Count: 6
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes bug with the handling of more than one language in
the string table in f_fs.c.
str_count was not reset for subsequent language codes.
str_count-- "rolls under" and processes u32 max strings on
the processing of the second language entry.
The existing bug can be reproduced by adding a second language table
to the structure "strings" in tools/usb/ffs-test.c.

Signed-off-by: Dean Anderson <dean@sensoray.com>
---
 drivers/usb/gadget/function/f_fs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 801a8b668..10a5d9f0f 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2640,6 +2640,7 @@ static int __ffs_data_got_strings(struct ffs_data *ffs,
 
 	do { /* lang_count > 0 so we can use do-while */
 		unsigned needed = needed_count;
+		u32 str_per_lang = str_count;
 
 		if (len < 3)
 			goto error_free;
@@ -2675,7 +2676,7 @@ static int __ffs_data_got_strings(struct ffs_data *ffs,
 
 			data += length + 1;
 			len -= length + 1;
-		} while (--str_count);
+		} while (--str_per_lang);
 
 		s->id = 0;   /* terminator */
 		s->s = NULL;
-- 
2.17.1

