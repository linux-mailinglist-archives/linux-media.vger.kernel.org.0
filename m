Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0DB42DDC0
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 17:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbhJNPOr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 11:14:47 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:41788
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232204AbhJNPOo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 11:14:44 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id D343C40013;
        Thu, 14 Oct 2021 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634224355;
        bh=8xwz+QO6zjXKM+v74uWvYq9Z9yoCObRA1yTs9d8sDDI=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=ApQ2YrxAKDVLw42dD5cLUJ3/ymUYA/Y7ZptOas1LNaOWgxMXh1qDEITvpY0eU7WlS
         2SGdIQYfus8IGaRdWFUfyhlHn/+Xd2HvugGL9+LRfho4n8FbW3tPmLM1QBv7ls39GG
         nEp1cxxb+wZUw4xF9h6hQxX7LPXz4dviZFpsC61p9WpM35pefPReNm1yzsk6z1uEJk
         ea/YTQShVC7qMMg58kxEib+Rw1SiXfXlaAHdVDDZ9wDPdVvjpNMh19N8BQEwahFmeQ
         cU8q51UxPSZL3nXL0aYUo8qSsv97aFKhW0TAMjAMSk+e3NTTff3bxcEW/6r8fp+Q5L
         Zi4nnnJaD5ekQ==
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: drivers: cx24113: remove redundant variable r
Date:   Thu, 14 Oct 2021 16:12:35 +0100
Message-Id: <20211014151235.62671-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable r is being assigned values but it is never being
used. The variable is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/cx24113.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cx24113.c b/drivers/media/dvb-frontends/cx24113.c
index 60a9f70275f7..dd55d314bf9a 100644
--- a/drivers/media/dvb-frontends/cx24113.c
+++ b/drivers/media/dvb-frontends/cx24113.c
@@ -378,7 +378,7 @@ static void cx24113_set_nfr(struct cx24113_state *state, u16 n, s32 f, u8 r)
 
 static int cx24113_set_frequency(struct cx24113_state *state, u32 frequency)
 {
-	u8 r = 1; /* or 2 */
+	u8 r;
 	u16 n = 6;
 	s32 f = 0;
 
-- 
2.32.0

