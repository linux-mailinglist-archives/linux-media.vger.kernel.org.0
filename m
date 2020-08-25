Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2BA251017
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 05:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgHYDvM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 23:51:12 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:34525 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728080AbgHYDvM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 23:51:12 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 61DBC533;
        Mon, 24 Aug 2020 23:51:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 24 Aug 2020 23:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=WiWC9VLvDhbTqDfFonP5liyuoe
        2DAy8cStQbzntWtBs=; b=Hb4WFs4raQrPjfS11aef1h+2/BBjFrk3K3nx+rqdaE
        FD8Xt0UQy4b7K7u2maRhA7hYGHC0FuE9fPFZfwl3sAoSLNc1sQjVGaUMpZ8TYfEy
        V917ffR0QkSwkOiMPAaAWxB/Q+2Q0IelZZZW+21rw8QzkvwuGEHVRI5T5+LVOKq8
        A+4jM390rN0XzQDDC1e7jLEvI2W9MMZINHAkBMHw20a3OO18LUi4VElPM1niPAOG
        9ie8VpGOn/t1rQiW/JHvO3y4pFtSWLqmcotJt8dMm1aJRTHi7OpjKH93n/wlA0pY
        ItnixuQE5i0u4LnIUgJRmx63kiqtrAzwn2tbbvhBZ3QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WiWC9VLvDhbTqDfFo
        nP5liyuoe2DAy8cStQbzntWtBs=; b=LgHJ927PZcm1WUnvPvYSAIx5AhTCIogIF
        qz/yamco+19fzVVSg7q9jPEamtN+aW5dS3m9ylRPjlePisQKBZptUZb3hJW2j+3W
        /PmfmQJuAbjma76w3NLQHUUya9j4VaN5Rsdzn2zBNF/Y3BgzpFJV547qxUo84wZz
        +/9kzlnACRrzUQ3iOjvddA5/65CNaegEPX0t3zgCR+Zu+J3UvOP0Ve+3GbpWm3Pm
        S8M1X/U/WCY1SJbrDw3N0riKw60D64ipp0wDs5v1ueITNwE/i/BLZyvy5Bdzx8be
        A5p7kpCZhTxsEjKpQUfCg+2Joqlo9q5ZsJaDP+/yW6bd92TrJkfTw==
X-ME-Sender: <xms:ropEX1KczkTS8_zSQwYIG3zICO4FrTGeoqmI3D4Ty5TWRPsnnodrMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduledgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepvehhrhhishhtohhphhgvrhcuufhnohifhhhilhhluceotghhrhhi
    sheskhhouggvheegrdhnvghtqeenucggtffrrghtthgvrhhnpeeukeeufeeliedvieeltd
    ehudehledvhfeitdfhfeekjeffkeelheetleehtefhudenucfkphepleelrdduuddrudeh
    kedrfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eptghhrhhisheskhhouggvheegrdhnvght
X-ME-Proxy: <xmx:ropEXxJX-Gtuefnc_JXpJiaSkL_6XLS9jTFt02RkDQe4NbpHCfs97g>
    <xmx:ropEX9uW7-4hRSshHzZf6Kz4ag2QCsE_um1q3uPoNEhfMn2UUgx3Hg>
    <xmx:ropEX2ZpUz6M0troi9cVU7koKjLJK3mJ96mPWe6x7npbgjnELXhRmA>
    <xmx:r4pEX1l_40NFbreup1kJ893Ffd3drkK1sj3KjOBPjFPqVpz3oq8YFg>
Received: from mrgency.lan (99-11-158-33.lightspeed.irvnca.sbcglobal.net [99.11.158.33])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7042D3280060;
        Mon, 24 Aug 2020 23:51:10 -0400 (EDT)
From:   Christopher Snowhill <chris@kode54.net>
To:     linux-media@vger.kernel.org
Cc:     Christopher Snowhill <chris@kode54.net>
Subject: [PATCH] Implements support for the MyGica iGrabber
Date:   Mon, 24 Aug 2020 20:51:08 -0700
Message-Id: <20200825035108.80468-1-chris@kode54.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This small change adds the device identifier for the MyGica iGrabber,
which features an Empia EM2860, a Philips SAA7113, Empia EMP202, and
no tuner. Verified that both the composite and S-Video inputs work
with NTSC source. It does not appear to need any port twiddling on
pre-init.

Signed-off-by: Christopher Snowhill <chris@kode54.net>
---
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

