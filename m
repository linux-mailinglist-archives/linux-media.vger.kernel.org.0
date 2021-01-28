Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0BED307BA0
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 18:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbhA1RAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 12:00:30 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:46344 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbhA1Q7w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 11:59:52 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l5AdT-0005DK-CY; Thu, 28 Jan 2021 16:59:11 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: drxj: remove redundant assignments to variable image_to_select
Date:   Thu, 28 Jan 2021 16:59:11 +0000
Message-Id: <20210128165911.644307-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable image_to_select is being initialized with a value that
is never read and it is being updated later with a new value.  The
initialization is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 37b32d9b398d..bf9e4ef35684 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -4775,7 +4775,7 @@ set_frequency(struct drx_demod_instance *demod,
 	bool select_pos_image = false;
 	bool rf_mirror;
 	bool tuner_mirror;
-	bool image_to_select = true;
+	bool image_to_select;
 	s32 fm_frequency_shift = 0;
 
 	rf_mirror = (ext_attr->mirror == DRX_MIRROR_YES) ? true : false;
-- 
2.29.2

