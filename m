Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2DEAA44F6
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2019 17:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbfHaPL6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Aug 2019 11:11:58 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42871 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfHaPL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Aug 2019 11:11:57 -0400
Received: by mail-pl1-f196.google.com with SMTP id y1so4655783plp.9;
        Sat, 31 Aug 2019 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=wOS24Xc0XJB1BLMFfgH4jspAT3yw9GjM0Xt0KGOqZb8=;
        b=UEx2KeZcdvICEAeiyO3aLM5q6TLcNNP2HyJd7qWWfgWR3LUY5CNoBq3bzYCDf6gmwW
         IzLc59HVMuP9BTnHc9qHFptbh3fw9xOJnwBtXUnI6MRCwxReUcnS1vPpYBcwEFE3NcDs
         kAICnbtx44CBoXh8UzN+f4B2tH7zanM2Tx83altPqvB17QE5aaC9mX9Hzz9bmCbMUdW8
         gcKHYasTK+3/oTJwUOVZbYwpdTDcdOppNFINeCVnCLLEiQ+TqnwW6Ngp0ksG5yfdyXJr
         6ddl68QtuijKTcKlBQM1x7twGQLsN3EwKYwkLc8vUnLTnYxqyMtZC36a6yP6W8pnTrb9
         0Dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=wOS24Xc0XJB1BLMFfgH4jspAT3yw9GjM0Xt0KGOqZb8=;
        b=EP+ZOrBYmSWPictFImSM1GJuxcPt4x1UM2/qC4ya8JNnlDej8/pXRG7XN8vUIdWIc5
         EK8tuxPND9IcqnT7YmnxQ7utdZJtSmoKZDQeRaIIwFGtVO6LP8Z4TM2DDfbjR9QjLPBU
         4h2CGddlOj/CtTeNBd5Z+YrdamIgdVbf3kXNTfoEkxZlqruKdsbch7ynK9MDNOMLViNQ
         s3g3FoB1hOKX1DY06ZJVLUh7b94cthV2Y+pUUasHFEGCqXg2NsRhN5q4Q8osELtSXBwF
         r8xg5cjnxuerakkqQgtPchf6T1PzRfVJrkGfHEDmTk66XkThYbhtHWMVOMZMFzYQMCNT
         ce7A==
X-Gm-Message-State: APjAAAXu0GzlrXcL7p04efK2GaUe10GA/1b/NrfeLjXu1G0pPaEzLucm
        D2N2FypR4ECq7xdwm6AcUZrlbzA+
X-Google-Smtp-Source: APXvYqzgNbpIN9VlSxpGHMugJ9IxHNR1qF/swya0LJHvfmOqZXHGTgBzcaog6lNeXzbXia/MO8mMYw==
X-Received: by 2002:a17:902:581:: with SMTP id f1mr21112561plf.246.1567264317121;
        Sat, 31 Aug 2019 08:11:57 -0700 (PDT)
Received: from nishad ([106.51.235.3])
        by smtp.gmail.com with ESMTPSA id y7sm1670483pfn.131.2019.08.31.08.11.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Aug 2019 08:11:56 -0700 (PDT)
Date:   Sat, 31 Aug 2019 20:41:51 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: siano: Use the correct style for SPDX License
 Identifier
Message-ID: <20190831151147.GA7082@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch corrects the SPDX License Identifier style
in header file related to Siano Mobile Silicon Digital TV.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used)

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/media/common/siano/smsir.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smsir.h b/drivers/media/common/siano/smsir.h
index b2c54c256e86..ada41d5c4e83 100644
--- a/drivers/media/common/siano/smsir.h
+++ b/drivers/media/common/siano/smsir.h
@@ -1,5 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * SPDX-License-Identifier: GPL-2.0+
  *
  * Siano Mobile Silicon, Inc.
  * MDTV receiver kernel modules.
-- 
2.17.1

