Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09B537FFF5
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 00:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhEMWEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 18:04:31 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48328 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhEMWEb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 18:04:31 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lhJQL-00078E-TH; Thu, 13 May 2021 22:03:17 +0000
From:   Colin King <colin.king@canonical.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: remove redundant initialization of variable reg_cur
Date:   Thu, 13 May 2021 23:03:17 +0100
Message-Id: <20210513220317.137090-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable reg_cur is being initialized with a value that is never
read, it is being updated later on. The assignment is redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index 7f07a9175815..b9125c295d1d 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -183,7 +183,7 @@ int amvdec_set_canvases(struct amvdec_session *sess,
 	u32 pixfmt = sess->pixfmt_cap;
 	u32 width = ALIGN(sess->width, 32);
 	u32 height = ALIGN(sess->height, 32);
-	u32 reg_cur = reg_base[0];
+	u32 reg_cur;
 	u32 reg_num_cur = 0;
 	u32 reg_base_cur = 0;
 	int i = 0;
-- 
2.30.2

