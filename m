Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2860040C4A6
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 13:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbhIOL5V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 07:57:21 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:57538
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232824AbhIOL5U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 07:57:20 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B922B3F0FD;
        Wed, 15 Sep 2021 11:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631706960;
        bh=T3Sy3dbkoW1c6lX4amXfpg9ipcXLCPsjdqsntxzJicU=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=fHLld2aUFMEMnKu7+I0xQkjb6+KKpW7tF7cDixgJujhwrUFIh1Ll46N2E9x2PztK0
         6DOxRgrLeAsK8qTCygcnwz2ZXP52iAozDHt7ogfD77PM1Zyx0WI//txdzV0f2j2EhF
         DasdZ99KP+Le5dBZYS1Ox/iGuFwsV+1xbTIEf7JDl2X4KqO+2lpSjQSFwsSPOEx7fw
         lmkJnjZSYH8z3CJbKAOoMjo4TTB63PRRmdOxXcxK0udEolZcyMEayfhv2uNzF41eQo
         dHj05BK0GG6Yw8kE7KPDr+FD8btMf3hzvpPeP+iirh3GL2QQ4ELvIxonOEdVqgqnpz
         3Ca+BNF93sj7w==
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: mb86a20s: make arrays static const
Date:   Wed, 15 Sep 2021 12:56:00 +0100
Message-Id: <20210915115600.14553-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the read-only arrays on the stack but instead them
static const. Also makes the object code smaller by 154 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  42949	  22424	      0	  65373	   ff5d	media/dvb-frontends/mb86a20s.o

After:
   text	   data	    bss	    dec	    hex	filename
  42731	  22488	      0	  65219	   fec3	media/dvb-frontends/mb86a20s.o

(gcc version 11.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/mb86a20s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/mb86a20s.c b/drivers/media/dvb-frontends/mb86a20s.c
index a7faf0cf8788..b74b9afed9a2 100644
--- a/drivers/media/dvb-frontends/mb86a20s.c
+++ b/drivers/media/dvb-frontends/mb86a20s.c
@@ -444,11 +444,11 @@ static int mb86a20s_get_interleaving(struct mb86a20s_state *state,
 				     unsigned layer)
 {
 	int rc;
-	int interleaving[] = {
+	static const int interleaving[] = {
 		0, 1, 2, 4, 8
 	};
 
-	static unsigned char reg[] = {
+	static const unsigned char reg[] = {
 		[0] = 0x88,	/* Layer A */
 		[1] = 0x8c,	/* Layer B */
 		[2] = 0x90,	/* Layer C */
-- 
2.32.0

