Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B708C2DEBF
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 15:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbfE2Nop (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 09:44:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39812 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbfE2Nop (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 09:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5CAxTTfm7ufTvE2adOFPyuvrXvgAeycfcowCWQxk/EA=; b=eJPmz8MhUkO+IJNUAxWN+yhsK
        rrH7AaXVVTE+7ltePTmjQ84QBAYcwPw+SaqQEY/SIYGavnZ0ibXRLkjU9rn+22vgNf4lXjSih7bJd
        +e1hDAF6xph/U68eK7fv1PVRFx0vUczdfhc3zAZL9cit1jInBhALCa6mLAfAo+hJwwzA69jZiq0Hb
        XL+NDFfFjLxeLZICUqWx7qSRisFNs8MGG44eexbCF9ikZtYEzQsKypGPaZg6yWmES0vuog50ksvuZ
        NYvqm9PV1HdW0z9jZHBvIEcjsE1CRWVKNPG8oj9bf2LM/B3QQNcaHUzQv8MwUiIxn/q9+tjgmkap+
        cCCSCzrgQ==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hVysm-0003Db-Tl; Wed, 29 May 2019 13:44:44 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hVysj-0006Ue-Kl; Wed, 29 May 2019 09:44:41 -0400
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org
Subject: [PATCH] media: staging: allegro: cleanup two warnings
Date:   Wed, 29 May 2019 09:44:37 -0400
Message-Id: <5a433fccafc73e1361f65c4423b0099bbd18f67f.1559137474.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sparse complains about two issues when building with i386
and COMPILE_TEST:

	drivers/staging/media/allegro-dvt/allegro-core.c:1849:36: warning: constant 0xffffffff00000000UL is so big it is unsigned long long
	drivers/staging/media/allegro-dvt/allegro-core.c:865:24: error: incompatible types in comparison expression (different type sizes)

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index d007d1778f0e..20b38b737869 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -863,7 +863,7 @@ static ssize_t allegro_mbox_read(struct allegro_dev *dev,
 	 * Skip the header, as was already read to get the size of the body.
 	 */
 	body_no_wrap = min((size_t)header->length,
-			   (mbox->size - (head + sizeof(*header))));
+			   (size_t)(mbox->size - (head + sizeof(*header))));
 	regmap_bulk_read(dev->sram, mbox->data + head + sizeof(*header),
 			 dst + sizeof(*header), body_no_wrap / 4);
 	regmap_bulk_read(dev->sram, mbox->data,
@@ -1846,7 +1846,7 @@ static void allegro_copy_fw_codec(struct allegro_dev *dev,
 		     lower_32_bits(icache_offset));
 
 	dcache_offset =
-	    (dev->firmware.paddr & 0xffffffff00000000UL) - MCU_CACHE_OFFSET;
+	    (dev->firmware.paddr & 0xffffffff00000000ULL) - MCU_CACHE_OFFSET;
 	v4l2_dbg(2, debug, &dev->v4l2_dev,
 		 "dcache_offset: msb = 0x%x, lsb = 0x%x\n",
 		 upper_32_bits(dcache_offset), lower_32_bits(dcache_offset));
-- 
2.21.0

