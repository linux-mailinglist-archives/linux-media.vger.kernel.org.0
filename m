Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF2535FDFD
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 22:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbfGDU6T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 16:58:19 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35440 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfGDU6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 16:58:19 -0400
Received: by mail-lj1-f196.google.com with SMTP id x25so477689ljh.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2019 13:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=kaWcOT8T+KSXDRlP7d1Sy+89HMvlHdNWlBmmeaX1Ra8=;
        b=KZG459qzCfFpjjcyPjltODY9KHxY7Ksf3ptXJGrrwixRi+P2LVc37qpMlLZWYYpAyl
         HdVyPmC4A/wFQlJSm3pIFCKwL2Ey2C4sgyVR5llRL35ZyWXhY2SE60INjRNsd3lZ5utm
         sW7palrxgQB+BbEsFzHlr/Rj0hWd4+xYFWkj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=kaWcOT8T+KSXDRlP7d1Sy+89HMvlHdNWlBmmeaX1Ra8=;
        b=num8EOLBR//C0Ymwdmt2lwS+m7gAhQzz4da2gIKaac5aQeowT9li16Zw9KCA3fuiKe
         ZpPMdbr9au9QmZA8dOSh+I3rOtNk/MnPYwVW55PeRcZgf4xZWiTINQLiTKypfaAQ4ytp
         XnptlwEUIKwIhkujj5nT/9aFg41+3EZFdnYMv5tMwVGjPzC9AP1+lZsGIwCt7hqRa862
         lbIsGMTWnp7cwWPZRfrb3SB1izbnPezlHFgmqHeTRQMvwkA/Y3Br/g/hQqtoWmdAIVoU
         Fcv0l/oKZq3DybRxunPuns0iIZBQF+4uw+hO6e3hO7ORfZPdaDuT4Sax32jz6WU7Gv0s
         bsQA==
X-Gm-Message-State: APjAAAWZjnEhOXOoZOwSXPsXZSLXoT2pDTQraID5FOtuKUiq5bt0cYjN
        Nnoukh61jr/hxgmqJIvQ2F81MWUhzEs=
X-Google-Smtp-Source: APXvYqy6DxlR3BJsDf8tnWYMrAZCxUjn4r75QRNoiRjv9Z5MS0qFRQfisfAGuXuHEknEFwt+vsLyZg==
X-Received: by 2002:a2e:b0f0:: with SMTP id h16mr78772ljl.21.1562273897101;
        Thu, 04 Jul 2019 13:58:17 -0700 (PDT)
Received: from luke-XPS-13 (77-255-206-190.adsl.inetia.pl. [77.255.206.190])
        by smtp.gmail.com with ESMTPSA id f10sm1044907lfh.82.2019.07.04.13.58.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 13:58:16 -0700 (PDT)
Date:   Thu, 4 Jul 2019 13:58:12 -0700
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] media: dvb_frontend.h: Fix shifting signed 32-bit value
 problem
Message-ID: <20190704205812.GA28496@luke-XPS-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

