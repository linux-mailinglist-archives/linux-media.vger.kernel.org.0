Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF41D347A01
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 14:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbhCXNzi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 09:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235776AbhCXNzG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 09:55:06 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F318C061763;
        Wed, 24 Mar 2021 06:55:03 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id z10so18022236qkz.13;
        Wed, 24 Mar 2021 06:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bl+twAxTABzyYq2Klqss4Te0Jt29mShp2MJ9BTS37Kk=;
        b=SP47RER0wtPvVgzy95KQ4pLZMs76Df4F1moWk7n1OHLD6ElO2H/wteAe0TLwhQ3DRY
         lpUTdLIl43m2zAvR2d5tOkv4gVE1GrtF2rfE75oL8r3BIrnqgzdBi09mtSYA4xZuHWIz
         0P0p3azDVo4n5pFS3uMGZBULXru74uE2rMlIf3NcUCIU7gZiOO2Nlk3yyLCp+62tWn5A
         Na76qcpAj5lY7cvR+eur0fUzR23pjtgHtP0Jq+0SVMURlucmalPXzr/yFn7pZl7Zs4GK
         5GKIkl0PhF+Hl3vCbqJYyPseOOZIqNPhDgrglbb+htnfhU2UDLgdeRoY5jMSV9TjtLRK
         0V+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bl+twAxTABzyYq2Klqss4Te0Jt29mShp2MJ9BTS37Kk=;
        b=TaB72kK3T7khwnbkyDZ4QTNwe565a2wtVja7lQoZA1bj88k/LIajcL1tE0e5LCrTjC
         6vgtbkqL/K+/+2tU0s7IpTFk6wPPJapFtfeFAiUSW8c8TKmvye7RdBGvwiTApNtx/LbK
         GDdKD9Wi8Ih/TIWDNLCs5mw3h8pEoH4tSg4MBnEoDvrwtzyw2hzVPiqdSctuzrDTlVXC
         bTV6YgaJruAWgqsmB5CDxr3+iEHO6aqZps6oTQWTwFcm8M3DNst8Z7ZI0Wh2rhFe4V+p
         LEjiB7IRpFC8UALbWOKrRCl5D7PAHROr8o+1TfWluDWKIeW/YvZi9gJco3nrjoMfsaOY
         3+7A==
X-Gm-Message-State: AOAM533LZSvoImE/7qRy3q5+j1MRLPyq7/pjHypKhjYehO6fDH1shckW
        yYAoogWemkFxrWFJ/vwfcro=
X-Google-Smtp-Source: ABdhPJxPieUj7toob6UDD8yMp3VtqUFsKRFjK79RWJFyXQggM3E+g66VFMH1wvf3SvasVQJpWyhvWg==
X-Received: by 2002:a37:9dc1:: with SMTP id g184mr3317778qke.285.1616594102913;
        Wed, 24 Mar 2021 06:55:02 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.36.138])
        by smtp.gmail.com with ESMTPSA id x10sm1390816qtw.17.2021.03.24.06.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 06:55:02 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, unixbhaskar@gmail.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
Subject: [PATCH] media: atomisp-ov2680: A trivial typo fix
Date:   Wed, 24 Mar 2021 19:26:42 +0530
Message-Id: <20210324135642.30054-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


s/miror/mirror/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/staging/media/atomisp/i2c/ov2680.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 49920245e064..889395933099 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -627,7 +627,7 @@ static struct ov2680_reg const ov2680_1296x976_30fps[] = {
 	{0x5706, 0x0c},
 	{0x5707, 0x78},
 	{0x3820, 0xc0},
-	{0x3821, 0x00}, //miror/flip
+	{0x3821, 0x00}, //mirror/flip
 	// {0x5090, 0x0c},
 	{}
 };
--
2.30.1

