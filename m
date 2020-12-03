Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCE12CD42C
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgLCLDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbgLCLDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:03:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0720C061A4E
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:51 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNs-0002Ko-P8; Thu, 03 Dec 2020 12:02:49 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNr-00CKhX-Pt; Thu, 03 Dec 2020 12:02:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:00:50 +0100
Message-Id: <20201203110106.2939463-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203110106.2939463-1-m.tretter@pengutronix.de>
References: <20201203110106.2939463-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.2
Subject: [PATCH 02/18] media: allegro: add helper to report unsupported fields
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow generators to explicitly signal an error if the C structs contain
unsupported or invalid fields.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/nal-rbsp.c | 5 +++++
 drivers/media/platform/allegro-dvt/nal-rbsp.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/media/platform/allegro-dvt/nal-rbsp.c
index 935ba23844f2..d911322d0efa 100644
--- a/drivers/media/platform/allegro-dvt/nal-rbsp.c
+++ b/drivers/media/platform/allegro-dvt/nal-rbsp.c
@@ -29,6 +29,11 @@ void rbsp_init(struct rbsp *rbsp, void *addr, size_t size,
 	rbsp->error = 0;
 }
 
+void rbsp_unsupported(struct rbsp *rbsp)
+{
+	rbsp->error = -EINVAL;
+}
+
 static int rbsp_read_bits(struct rbsp *rbsp, int n, unsigned int *value);
 static int rbsp_write_bits(struct rbsp *rbsp, int n, unsigned int value);
 
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/media/platform/allegro-dvt/nal-rbsp.h
index 90cc1a4f716d..c72f49fed8d3 100644
--- a/drivers/media/platform/allegro-dvt/nal-rbsp.h
+++ b/drivers/media/platform/allegro-dvt/nal-rbsp.h
@@ -49,6 +49,7 @@ extern struct nal_rbsp_ops read;
 
 void rbsp_init(struct rbsp *rbsp, void *addr, size_t size,
 	       struct nal_rbsp_ops *ops);
+void rbsp_unsupported(struct rbsp *rbsp);
 
 void rbsp_bit(struct rbsp *rbsp, int *value);
 void rbsp_bits(struct rbsp *rbsp, int n, int *value);
-- 
2.20.1

