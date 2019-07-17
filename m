Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2800D6BDDA
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 16:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfGQOJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 10:09:37 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37691 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfGQOJh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 10:09:37 -0400
Received: by mail-lf1-f67.google.com with SMTP id c9so16578385lfh.4
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=kaWcOT8T+KSXDRlP7d1Sy+89HMvlHdNWlBmmeaX1Ra8=;
        b=dL4SEpTGX/ngKWygtGkODclXiRzKgEWqnKQck8BeSRpLX8Fn6KUIfOiVffCGxmmswf
         Uxr1m/YoRjp+Xr1MOUM6Z2opsKK89UPwN+QgIOH3BgI/ZLYT2HZleUtgQtE33kmej2jh
         pAueIU+HMvy5AoCSMpL2koGDMdLXV1fLIuccM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=kaWcOT8T+KSXDRlP7d1Sy+89HMvlHdNWlBmmeaX1Ra8=;
        b=mcn3VvHErBrTCuhnXGUPynLvHDq483wNLsz4EJMYJ2l8+gR+UttibInc22soEjI5D1
         BDsfrJIx+C11KNr31zwogIvmXXmFawWRJdocjKXWNAalf8IjZsXNEaH5hwkJsqcZkqA4
         i2YI+Xq4d7EFSgNwsUSqkawrfP+NKAFjbkisW3V1KYCuwhg+oMBaViDOkMjbbprYrzax
         wIuAs5GhTR0UJXd0wnbUWVOjkgGrIYrz/JkNc1wnNqm1fnSHbX7v49h9EmCCPR6HTLmp
         iRFtfcbILkC8HNyK3kdHAV+8qHftcyx0LZeGRhxD0RsneAttR95iVISs3jkgxL8/R0m5
         bHuw==
X-Gm-Message-State: APjAAAUXhoEbYkLRenwxT8qLWpgYV3ODmQOJGmBh8KXyIJZAdBDnL4eZ
        yLcdOiI62LRXXXKxQ3FDCGOI8Q==
X-Google-Smtp-Source: APXvYqwF3WgPkqs+Px5oxYI48v57W4Ei3OacwDVIw5KkyeL7BsYvE07r7h/sq13Zn4lsZDq404fLvg==
X-Received: by 2002:ac2:5bc7:: with SMTP id u7mr18342073lfn.167.1563372575327;
        Wed, 17 Jul 2019 07:09:35 -0700 (PDT)
Received: from [192.168.1.2] (178-37-168-43.adsl.inetia.pl. [178.37.168.43])
        by smtp.gmail.com with ESMTPSA id j3sm3485074lfp.34.2019.07.17.07.09.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 07:09:34 -0700 (PDT)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
Subject: [PATCH v2 RESEND] media: dvb_frontend.h: Fix shifting signed 32-bit
 value problem
Message-ID: <0d5dae7b-e6e5-27ea-ba6d-59065f0c6edf@eng.ucsd.edu>
Date:   Wed, 17 Jul 2019 07:09:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix DVBFE_ALGO_RECOVERY and DVBFE_ALGO_SEARCH_ERROR use BIT macro which
fixes undefined behavior error by certain compilers. 

Also changed all other bit shifted definitions to use macro for better
readability. 

Signed-off-by: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
---
 Changes in V2:
 + Added BIT macro to all bit shifted definitions
 - Removed U cast on 31 bit shifted definition
 Changes in V1:
 + Added U cast to shifting 31 bits

 include/media/dvb_frontend.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
index f05cd7b94a2c..0d76fa4551b3 100644
--- a/include/media/dvb_frontend.h
+++ b/include/media/dvb_frontend.h
@@ -41,6 +41,7 @@
 #include <linux/delay.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/bitops.h>
 
 #include <linux/dvb/frontend.h>
 
@@ -141,10 +142,10 @@ struct analog_parameters {
  *	These devices have AUTO recovery capabilities from LOCK failure
  */
 enum dvbfe_algo {
-	DVBFE_ALGO_HW			= (1 <<  0),
-	DVBFE_ALGO_SW			= (1 <<  1),
-	DVBFE_ALGO_CUSTOM		= (1 <<  2),
-	DVBFE_ALGO_RECOVERY		= (1 << 31)
+	DVBFE_ALGO_HW			= BIT(0),
+	DVBFE_ALGO_SW			= BIT(1),
+	DVBFE_ALGO_CUSTOM		= BIT(2),
+	DVBFE_ALGO_RECOVERY		= BIT(31),
 };
 
 /**
@@ -170,12 +171,12 @@ enum dvbfe_algo {
  *	The frontend search algorithm was requested to search again
  */
 enum dvbfe_search {
-	DVBFE_ALGO_SEARCH_SUCCESS	= (1 <<  0),
-	DVBFE_ALGO_SEARCH_ASLEEP	= (1 <<  1),
-	DVBFE_ALGO_SEARCH_FAILED	= (1 <<  2),
-	DVBFE_ALGO_SEARCH_INVALID	= (1 <<  3),
-	DVBFE_ALGO_SEARCH_AGAIN		= (1 <<  4),
-	DVBFE_ALGO_SEARCH_ERROR		= (1 << 31),
+	DVBFE_ALGO_SEARCH_SUCCESS	= BIT(0),
+	DVBFE_ALGO_SEARCH_ASLEEP	= BIT(1),
+	DVBFE_ALGO_SEARCH_FAILED	= BIT(2),
+	DVBFE_ALGO_SEARCH_INVALID	= BIT(3),
+	DVBFE_ALGO_SEARCH_AGAIN		= BIT(4),
+	DVBFE_ALGO_SEARCH_ERROR		= BIT(31),
 };
 
 /**
-- 
2.20.1
