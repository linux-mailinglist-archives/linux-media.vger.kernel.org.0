Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 336084299D
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 16:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439823AbfFLOmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 10:42:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49790 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439755AbfFLOmY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 10:42:24 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hb4SA-0005uh-Fq; Wed, 12 Jun 2019 14:42:18 +0000
From:   Colin King <colin.king@canonical.com>
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-media@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: media: meson: remove redundant initialization of mpeg12
Date:   Wed, 12 Jun 2019 15:42:18 +0100
Message-Id: <20190612144218.26149-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer mpeg12 is being initialized however that value is never
read and mpeg12 is being re-assigned almost immediately afterwards.
Remove the redundant initialization.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 5398fbf7ce20..48869cc3d973 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -63,7 +63,7 @@ static void codec_mpeg12_recycle(struct amvdec_core *core, u32 buf_idx)
 static int codec_mpeg12_start(struct amvdec_session *sess)
 {
 	struct amvdec_core *core = sess->core;
-	struct codec_mpeg12 *mpeg12 = sess->priv;
+	struct codec_mpeg12 *mpeg12;
 	int ret;
 
 	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
-- 
2.20.1

