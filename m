Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 733D8226AFA
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 18:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732858AbgGTQiI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 12:38:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44993 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729269AbgGTQiI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 12:38:08 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jxYnk-00007X-BL; Mon, 20 Jul 2020 16:38:04 +0000
From:   Colin King <colin.king@canonical.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: allegro: fix potential null dereference on header
Date:   Mon, 20 Jul 2020 17:38:04 +0100
Message-Id: <20200720163804.340047-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer header is an alias to msg and msg is being null checked.
However, if msg is null then header is also null and this can lead to
a null pointer dereference on the assignment type = header->type. Fix
this by only dereferencing header after the null check on msg.

Addresses-Coverity: ("Dereference before null check")
Fixes: 3de16839669f ("media: allegro: add explicit mail encoding and decoding")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/allegro-dvt/allegro-mail.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
index 4ac65de12463..4496e2a4da5c 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.c
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -462,12 +462,14 @@ allegro_dec_encode_frame(struct mcu_msg_encode_frame_response *msg, u32 *src)
 ssize_t allegro_encode_mail(u32 *dst, void *msg)
 {
 	const struct mcu_msg_header *header = msg;
-	enum mcu_msg_type type = header->type;
+	enum mcu_msg_type type;
 	ssize_t size;
 
 	if (!msg || !dst)
 		return -EINVAL;
 
+	type = header->type;
+
 	switch (type) {
 	case MCU_MSG_TYPE_INIT:
 		size = allegro_enc_init(&dst[1], msg);
-- 
2.27.0

