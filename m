Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4F525104A
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 06:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgHYEEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 00:04:48 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:37585 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725263AbgHYEEr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 00:04:47 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 6041F546;
        Tue, 25 Aug 2020 00:04:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 25 Aug 2020 00:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=ccPkk8Xkl7479/GVD5dW0SRT3Y
        OOMQ1ZvB4Tfo/Sw+M=; b=kjXVixGiAKuGR+hNivc6+Q6ZWgRmiMH1rqtdzdWo4v
        6lzyVndzfBTFigvY8TFBEipWLuL8TaKdALkxS2m/ifJ7VO0nhwJrlo68WBTCjXFE
        5uCvr+5lmgT/UD5eXbkggkZEk9gZtTPSm2NcNv9wbzNUxWyPe2tSVTS0rT1o9w82
        BSoUVpokGeRdqyOzHMhsNAbpgBrzWWi0AasuyeZxcvWMc376rkFJBMJw88dLxJEx
        vmcWQFg7Qg0KS5/UsIs2qxFA0x8mewqzhkXr5O4jPiVVO8VQxNs/DhzUhRnO+tA5
        pvxqKLdEr86o5Cew3VUWLANTFX/b4WfL6vjfV5NBNuLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ccPkk8Xkl7479/GVD
        5dW0SRT3YOOMQ1ZvB4Tfo/Sw+M=; b=FkRq+G3PK0sgaRn2cfKGDyvefyteiC2x8
        KernTGhHD1w5kEmXOj9Jgom4M7rfEbN6lR+smiwLmmvL+FG9oJ9E3HtIesXc83Kv
        uShEBrXymb7p+W+gjZlUex73i1ilUE9cfTDHvgbCJtbMi0gKLJj5eO4hyeYO0s+D
        1cSCJsK664u6SXoF9bzlx/eBqgutiOeGxszxtZ5MOajHRAPZucX2tmnMeGQWiMFY
        qBwh5UsFmnUFvgTcWSURPdZ3mBrx12pD+PTKQWYFG1F4Rha3xYhaua5EGSyW1KAe
        kEFL/h+X/jquslutdeyIgv4/FRgQam+S1xB048bDMo6f9JZVDwKgw==
X-ME-Sender: <xms:3Y1EX45XPDwyHdHA5_820nyNRGwNOR9IB62ssaKX8OWfhba2np5FqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduledgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepvehhrhhishhtohhphhgvrhcuufhnohifhhhilhhluceotghhrhhi
    sheskhhouggvheegrdhnvghtqeenucggtffrrghtthgvrhhnpeeukeeufeeliedvieeltd
    ehudehledvhfeitdfhfeekjeffkeelheetleehtefhudenucfkphepleelrdduuddrudeh
    kedrfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eptghhrhhisheskhhouggvheegrdhnvght
X-ME-Proxy: <xmx:3Y1EX573OP-vXf0lpjZTP76FRMbs0Z2Y-yGOz7G8fBOwh6Fqgori5A>
    <xmx:3Y1EX3e6wRojr6dUKe09pBYLdn5tcQFIlIunecK8yb5OQkky7mLUag>
    <xmx:3Y1EX9K6ms6fKmZE0PzP48rxHZ2_WOzrWjNDHl6CvluIOiW9ipSorA>
    <xmx:3o1EXxXm_qNnU01C_gxrLpviVVdeU9lwO6LBgXElnKpn7zedpf1N5Q>
Received: from mrgency.lan (99-11-158-33.lightspeed.irvnca.sbcglobal.net [99.11.158.33])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1BF1D30600A9;
        Tue, 25 Aug 2020 00:04:45 -0400 (EDT)
From:   Christopher Snowhill <chris@kode54.net>
To:     linux-media@vger.kernel.org
Cc:     Christopher Snowhill <chris@kode54.net>
Subject: [PATCH] media: em28xx: Implement device: MyGica iGrabber
Date:   Mon, 24 Aug 2020 21:04:42 -0700
Message-Id: <20200825040442.81813-1-chris@kode54.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This small change adds the device identifier for the MyGica iGrabber,
which features an Empia EM2860, Philips SAA7113, Empia EMP202, and
no tuner. Verified that both the composite and S-Video inputs work
with NTSC source. It does not appear to need any port twiddling on
pre-init.

Signed-off-by: Christopher Snowhill <chris@kode54.net>
---

Re-sending this, because I kind of flubbed the subject line.

 drivers/media/usb/em28xx/em28xx-cards.c | 22 ++++++++++++++++++++++
 drivers/media/usb/em28xx/em28xx.h       |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index a8c321d11827..5144888ae36f 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2519,6 +2519,26 @@ const struct em28xx_board em28xx_boards[] = {
 			.amux     = EM28XX_AMUX_LINE_IN,
 		} },
 	},
+	/*
+	 * 1f4d:1abe MyGica iGrabber
+	 * (same as several other EM2860 devices)
+	 * Empia EM2860, Philips SAA7113, Empia EMP202, No Tuner
+	 */
+	[EM2860_BOARD_MYGICA_IGRABBER] = {
+		.name         = "MyGica iGrabber",
+		.vchannels    = 2,
+		.tuner_type   = TUNER_ABSENT,
+		.decoder      = EM28XX_SAA711X,
+		.input           = { {
+			.type     = EM28XX_VMUX_COMPOSITE,
+			.vmux     = SAA7115_COMPOSITE0,
+			.amux     = EM28XX_AMUX_LINE_IN,
+		}, {
+			.type     = EM28XX_VMUX_SVIDEO,
+			.vmux     = SAA7115_SVIDEO3,
+			.amux     = EM28XX_AMUX_LINE_IN,
+		} },
+	},
 };
 EXPORT_SYMBOL_GPL(em28xx_boards);
 
@@ -2698,6 +2718,8 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM2860_BOARD_EASYCAP },
 	{ USB_DEVICE(0x1b80, 0xe425),
 			.driver_info = EM2874_BOARD_MAXMEDIA_UB425_TC },
+	{ USB_DEVICE(0x1f4d, 0x1abe),
+			.driver_info = EM2860_BOARD_MYGICA_IGRABBER },
 	{ USB_DEVICE(0x2304, 0x0242),
 			.driver_info = EM2884_BOARD_PCTV_510E },
 	{ USB_DEVICE(0x2013, 0x0251),
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index acbb62397314..55a46faaf7b7 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -151,6 +151,7 @@
 #define EM2882_BOARD_ZOLID_HYBRID_TV_STICK		102
 #define EM2861_BOARD_MAGIX_VIDEOWANDLER2          103
 #define EM28178_BOARD_PCTV_461E_V2                104
+#define EM2860_BOARD_MYGICA_IGRABBER              105
 
 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
-- 
2.28.0

