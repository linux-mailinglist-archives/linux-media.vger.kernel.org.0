Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD7E26F0A6
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 04:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729168AbgIRCpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 22:45:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:34740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728416AbgIRCKS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 22:10:18 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56045239E5;
        Fri, 18 Sep 2020 02:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600395010;
        bh=pGhwVmzAKmrsyihS5XbA3TPrkvfmkoyMXMpaORXB8ZI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bs9nmPk2y3U1nwhq3PcCX6hd/jefGcDsspWyfp1HA0BM9E7NjnwjbKASUISsPleXW
         CnEGItLH7C78TNnlIXc/onW0PVEAURXKbM0qztEHD7/nomPNxVy8Brmj8KZpmWu9o6
         bWPEg7Hi96dLwKO5OITbFleMNyrWkgJ+a6bHoP/I=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Colin Ian King <colin.king@canonical.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 105/206] media: tda10071: fix unsigned sign extension overflow
Date:   Thu, 17 Sep 2020 22:06:21 -0400
Message-Id: <20200918020802.2065198-105-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020802.2065198-1-sashal@kernel.org>
References: <20200918020802.2065198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit a7463e2dc698075132de9905b89f495df888bb79 ]

The shifting of buf[3] by 24 bits to the left will be promoted to
a 32 bit signed int and then sign-extended to an unsigned long. In
the unlikely event that the the top bit of buf[3] is set then all
then all the upper bits end up as also being set because of
the sign-extension and this affect the ev->post_bit_error sum.
Fix this by using the temporary u32 variable bit_error to avoid
the sign-extension promotion. This also removes the need to do the
computation twice.

Addresses-Coverity: ("Unintended sign extension")

Fixes: 267897a4708f ("[media] tda10071: implement DVBv5 statistics")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/dvb-frontends/tda10071.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda10071.c b/drivers/media/dvb-frontends/tda10071.c
index 097c42d3f8c26..df0c7243eafe4 100644
--- a/drivers/media/dvb-frontends/tda10071.c
+++ b/drivers/media/dvb-frontends/tda10071.c
@@ -483,10 +483,11 @@ static int tda10071_read_status(struct dvb_frontend *fe, enum fe_status *status)
 			goto error;
 
 		if (dev->delivery_system == SYS_DVBS) {
-			dev->dvbv3_ber = buf[0] << 24 | buf[1] << 16 |
-					 buf[2] << 8 | buf[3] << 0;
-			dev->post_bit_error += buf[0] << 24 | buf[1] << 16 |
-					       buf[2] << 8 | buf[3] << 0;
+			u32 bit_error = buf[0] << 24 | buf[1] << 16 |
+					buf[2] << 8 | buf[3] << 0;
+
+			dev->dvbv3_ber = bit_error;
+			dev->post_bit_error += bit_error;
 			c->post_bit_error.stat[0].scale = FE_SCALE_COUNTER;
 			c->post_bit_error.stat[0].uvalue = dev->post_bit_error;
 			dev->block_error += buf[4] << 8 | buf[5] << 0;
-- 
2.25.1

