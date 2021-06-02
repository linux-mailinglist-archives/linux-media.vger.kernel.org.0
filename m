Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385B2398DD9
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 17:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhFBPHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 11:07:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:37176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231416AbhFBPHK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 11:07:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F39F1613E6;
        Wed,  2 Jun 2021 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622646327;
        bh=eRZOupZBFmZ1BZK79Vn+IxtuultSvsJ6g2ZE0mpM3rY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kdn3szau7+7gl1OwRdqarEsQNACxDRuVFXKgV0OeVeYUMZQZYxNLfhdSHyiBPA2aX
         zRMZKno1hhzoHBwcPk8eUswklAvnFirxlQcyN8y63wwPoFlSHzSFXCoE9Gqmbyj9kz
         9P0wzLvIuNk2sSd83lqxcYL0VyiVTv7RrWM6J40O4ZRR5VPpDBHJb9Sz+ySWyD5yhu
         qmG4JySoR42gm91bZb0DUV9zEAON0StdEjNcqGhlFLQtM86SqVqJF9oPogNGZGJc7m
         cCVWRoKYMCfy3iwZ44notNcb3pnA6Ee020nbDpI+hIHpjMQrlb8h5oAngj79ZKdJGL
         3Nq+ti+QiceAw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1loSQu-006Wae-Qg; Wed, 02 Jun 2021 17:05:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/6] media: rtl28xxu: replace a NO-BREAK SPACE character
Date:   Wed,  2 Jun 2021 17:05:19 +0200
Message-Id: <c09e90048bf1cee21c559699aede51bad7814814.1622646256.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622646256.git.mchehab+huawei@kernel.org>
References: <cover.1622646256.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using:

	- U+00a0 (' '): NO-BREAK SPACE

Use a normal white space.

This was probably introduced by some cut-and-paste.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 2c04ed8af0e4..83705730e37e 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1777,7 +1777,7 @@ static int rtl2832u_rc_query(struct dvb_usb_device *d)
 		ir_raw_event_store_with_filter(d->rc_dev, &ev);
 	}
 
-	/* 'flush' ir_raw_event_store_with_filter() */
+	/* 'flush' ir_raw_event_store_with_filter() */
 	ir_raw_event_handle(d->rc_dev);
 exit:
 	return ret;
-- 
2.31.1

