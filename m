Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70721C9E1D
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 00:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgEGWAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 18:00:42 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44014 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgEGWAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 18:00:42 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jWoZM-0002Ol-K8; Thu, 07 May 2020 22:00:40 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-frontends: remove redundant initialization of variable status
Date:   Thu,  7 May 2020 23:00:40 +0100
Message-Id: <20200507220040.66476-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable status is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/drxk_hard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 0a4875b391d9..7e8e5c308d1c 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -1093,7 +1093,7 @@ static int init_hi(struct drxk_state *state)
 
 static int mpegts_configure_pins(struct drxk_state *state, bool mpeg_enable)
 {
-	int status = -1;
+	int status;
 	u16 sio_pdr_mclk_cfg = 0;
 	u16 sio_pdr_mdx_cfg = 0;
 	u16 err_cfg = 0;
-- 
2.25.1

