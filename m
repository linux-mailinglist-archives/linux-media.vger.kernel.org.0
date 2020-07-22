Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB892298F7
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 15:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbgGVNJJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 09:09:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37182 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgGVNJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 09:09:09 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jyEUZ-0003On-AS; Wed, 22 Jul 2020 13:09:03 +0000
From:   Colin King <colin.king@canonical.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] media: allegro: fix potential null dereference on header
Date:   Wed, 22 Jul 2020 14:09:03 +0100
Message-Id: <20200722130903.818041-1-colin.king@canonical.com>
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
this just using header->type after the null check and removing the need
for type as it is only used once.

Addresses-Coverity: ("Dereference before null check")
Fixes: 3de16839669f ("media: allegro: add explicit mail encoding and decoding")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: remove need for variable type, as suggested by Michael Tretter

---
 drivers/staging/media/allegro-dvt/allegro-mail.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
index 4ac65de12463..9286d2162377 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.c
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -462,13 +462,12 @@ allegro_dec_encode_frame(struct mcu_msg_encode_frame_response *msg, u32 *src)
 ssize_t allegro_encode_mail(u32 *dst, void *msg)
 {
 	const struct mcu_msg_header *header = msg;
-	enum mcu_msg_type type = header->type;
 	ssize_t size;
 
 	if (!msg || !dst)
 		return -EINVAL;
 
-	switch (type) {
+	switch (header->type) {
 	case MCU_MSG_TYPE_INIT:
 		size = allegro_enc_init(&dst[1], msg);
 		break;
-- 
2.27.0

