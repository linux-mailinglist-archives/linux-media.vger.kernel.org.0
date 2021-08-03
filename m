Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E613DE9A4
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 11:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234840AbhHCJXD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 05:23:03 -0400
Received: from gofer.mess.org ([88.97.38.141]:47473 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234833AbhHCJXD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Aug 2021 05:23:03 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D1A41C6385; Tue,  3 Aug 2021 10:22:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1627982571; bh=zwBYrixLvilIrArb8qHZ3rutY4i8GEk/aWPlQkc9E6I=;
        h=From:To:Subject:Date:From;
        b=T9XWe4iUG2q+WCyDc8VEjZ5DSrEvSK1+S7t+Q+9d7RCaChMPEWyzsLJ4Nx6rvX9Wx
         yn/e+elns58njj/K76laPld7C9B3azbbuEqXIVjgS6Lp/jUgVRpuy2iIcvevnGwJt2
         YisPzLPB1SU9OjqKTdn1R5g0YBv/45x23a5wyqB058EWIHNlOuEAtiNN3TZZWQ8+0P
         E6VWt2ehwJNhQS8K3mRmoCcB6lPQb2KTK9k/S4ekrF9uV5v6pfctGDTin48nQWQ7HE
         adBVvrpDiVF+Yo28eEUgaMTTZSVxP4ugXm2Yjo/guPtIqrPPpw7OpttB8+Cu9K7oac
         ufjuTieCcgqKw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: mceusb: ensure rx resolution can be retrieved
Date:   Tue,  3 Aug 2021 10:22:50 +0100
Message-Id: <20210803092251.8392-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The receiver resolution is not populated. The resolution can be used to for
various purposes like calculating the margins the decoder should use.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mceusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index e03dd1f0144f..28bf78ff246a 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1612,6 +1612,7 @@ static struct rc_dev *mceusb_init_rc_dev(struct mceusb_dev *ir)
 	rc->dev.parent = dev;
 	rc->priv = ir;
 	rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
+	rc->rx_resolution = MCE_TIME_UNIT;
 	rc->min_timeout = MCE_TIME_UNIT;
 	rc->timeout = MS_TO_US(100);
 	if (!mceusb_model[ir->model].broken_irtimeout) {
-- 
2.31.1

