Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79492FF60D
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 23:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727603AbfKPWjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Nov 2019 17:39:16 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44388 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfKPWjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Nov 2019 17:39:16 -0500
Received: by mail-qt1-f196.google.com with SMTP id o11so15362175qtr.11;
        Sat, 16 Nov 2019 14:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aX8mGPTbdQXT0xNpXs7SlRGxktUQfT895JsrbKFJ2is=;
        b=s3WwVZaoZ/s1vy21izBSUJANSKA+E4NsggLMl8ocwSrvfeVuMfCJQvc0+Gh5kUT33f
         ISrMQsRpqw4vOsncLbf8Yknzfi5fEokDtA4Lxs44otnORpuJ4PehB/RZcEj4gShKivE5
         f3hKAB9FgHweeCN3s2zmf1c4Tn6GLDRVEFgMeobCxgV/Cb+skPJ3R1mz46oTOTi7zZvW
         MP0Icp86vm78vHBb9MjBQVX+Gdj4EMgkii7Ytq0B79JlO5MJktZNOyT+norQiYyL+SWT
         J6zhuJJ9tXwYEMGAlXJLwq+ykqz97+RhstgPhHPPDdZKLOJ79vV+kPHDMseIt/nukBEr
         qMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aX8mGPTbdQXT0xNpXs7SlRGxktUQfT895JsrbKFJ2is=;
        b=CaVNx9iC9yMBrgkYHYbd8Alb3FDBsU47WN5VlDkMBDT6QyNTDho1/XYjmzJXT/V5nt
         4F5AAyBmaz9HiQa3ab+vZIxfqX9oVgYajErKsEO3Jb8093rmaTNZPLd/cP7dLMsmXutn
         /b43Z3LkQGFAtmYng0YcFtviK9bOiZpmFg3jbdNS0UM9KazeEWmDWDohtOe+3JGa267g
         8LG8YXsecDZkzHJQBCqtrWXoFyM187WWOkaKt3z+j+7mB97bzRqSpbErkQQvm+c+i1aP
         PI7hmO30uYMnfLH1kIPJOXL43qoHLTWZpS4SQMlKVwYae/0sfG/u9iToc/5w4zZgxdvg
         YakA==
X-Gm-Message-State: APjAAAXmodfNSlDvIuoZyEU60ya2g3wwJyHpd66ggJB8onC3uiDwPe8+
        v8l03htmQWM2JEUm/x3eBcy72Ggyizw=
X-Google-Smtp-Source: APXvYqyfOaN6y7XbF2PjiITx1gA7m45coaxDcDmUYKeQ3yYfkSGHJTBQlgO2BTs8ZFE4OuiFCIGVnw==
X-Received: by 2002:ac8:3711:: with SMTP id o17mr21147985qtb.159.1573943954606;
        Sat, 16 Nov 2019 14:39:14 -0800 (PST)
Received: from localhost.localdomain ([194.59.251.92])
        by smtp.gmail.com with ESMTPSA id 70sm6174248qkj.48.2019.11.16.14.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 14:39:14 -0800 (PST)
From:   Forest Crossman <cyrozap@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Forest Crossman <cyrozap@gmail.com>, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
Subject: [PATCH] media: cx23885: Add support for AVerMedia CE310B
Date:   Sat, 16 Nov 2019 16:38:40 -0600
Message-Id: <20191116223840.2150-1-cyrozap@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The AVerMedia CE310B is a simple composite + S-Video + stereo audio
capture card, and uses only the CX23888 to perform all of these
functions.

I've tested both video inputs and the audio interface and confirmed that
they're all working. However, there are some issues:

* Sometimes when I switch inputs the video signal turns black and can't
  be recovered until the system is rebooted. I haven't been able to
  determine the cause of this behavior, nor have I found a solution to
  fix it or any workarounds other than rebooting.
* The card sometimes seems to have trouble syncing to the video signal,
  and some of the VBI data appears as noise at the top of the frame, but
  I assume that to be a result of my very noisy RF environment and the
  card's unshielded input traces rather than a configuration issue.

Signed-off-by: Forest Crossman <cyrozap@gmail.com>
---
 drivers/media/pci/cx23885/cx23885-cards.c | 24 +++++++++++++++++++++++
 drivers/media/pci/cx23885/cx23885-video.c |  3 ++-
 drivers/media/pci/cx23885/cx23885.h       |  1 +
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx23885/cx23885-cards.c b/drivers/media/pci/cx23885/cx23885-cards.c
index 8644205d3cd3..8e5a2c580821 100644
--- a/drivers/media/pci/cx23885/cx23885-cards.c
+++ b/drivers/media/pci/cx23885/cx23885-cards.c
@@ -801,6 +801,25 @@ struct cx23885_board cx23885_boards[] = {
 		.name		= "Hauppauge WinTV-Starburst2",
 		.portb		= CX23885_MPEG_DVB,
 	},
+	[CX23885_BOARD_AVERMEDIA_CE310B] = {
+		.name		= "AVerMedia CE310B",
+		.porta		= CX23885_ANALOG_VIDEO,
+		.force_bff	= 1,
+		.input          = {{
+			.type   = CX23885_VMUX_COMPOSITE1,
+			.vmux   = CX25840_VIN1_CH1 |
+				  CX25840_NONE_CH2 |
+				  CX25840_NONE0_CH3,
+			.amux   = CX25840_AUDIO7,
+		}, {
+			.type   = CX23885_VMUX_SVIDEO,
+			.vmux   = CX25840_VIN8_CH1 |
+				  CX25840_NONE_CH2 |
+				  CX25840_VIN7_CH3 |
+				  CX25840_SVIDEO_ON,
+			.amux   = CX25840_AUDIO7,
+		} },
+	},
 };
 const unsigned int cx23885_bcount = ARRAY_SIZE(cx23885_boards);
 
@@ -1124,6 +1143,10 @@ struct cx23885_subid cx23885_subids[] = {
 		.subvendor = 0x0070,
 		.subdevice = 0xf02a,
 		.card      = CX23885_BOARD_HAUPPAUGE_STARBURST2,
+	}, {
+		.subvendor = 0x1461,
+		.subdevice = 0x3100,
+		.card      = CX23885_BOARD_AVERMEDIA_CE310B,
 	},
 };
 const unsigned int cx23885_idcount = ARRAY_SIZE(cx23885_subids);
@@ -2348,6 +2371,7 @@ void cx23885_card_setup(struct cx23885_dev *dev)
 	case CX23885_BOARD_DVBSKY_T982:
 	case CX23885_BOARD_VIEWCAST_260E:
 	case CX23885_BOARD_VIEWCAST_460E:
+	case CX23885_BOARD_AVERMEDIA_CE310B:
 		dev->sd_cx25840 = v4l2_i2c_new_subdev(&dev->v4l2_dev,
 				&dev->i2c_bus[2].i2c_adap,
 				"cx25840", 0x88 >> 1, NULL);
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index 8098b15493de..7fc408ee4934 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -257,7 +257,8 @@ static int cx23885_video_mux(struct cx23885_dev *dev, unsigned int input)
 		(dev->board == CX23885_BOARD_MYGICA_X8507) ||
 		(dev->board == CX23885_BOARD_AVERMEDIA_HC81R) ||
 		(dev->board == CX23885_BOARD_VIEWCAST_260E) ||
-		(dev->board == CX23885_BOARD_VIEWCAST_460E)) {
+		(dev->board == CX23885_BOARD_VIEWCAST_460E) ||
+		(dev->board == CX23885_BOARD_AVERMEDIA_CE310B)) {
 		/* Configure audio routing */
 		v4l2_subdev_call(dev->sd_cx25840, audio, s_routing,
 			INPUT(input)->amux, 0, 0);
diff --git a/drivers/media/pci/cx23885/cx23885.h b/drivers/media/pci/cx23885/cx23885.h
index a95a2e4c6a0d..c472498e57c4 100644
--- a/drivers/media/pci/cx23885/cx23885.h
+++ b/drivers/media/pci/cx23885/cx23885.h
@@ -101,6 +101,7 @@
 #define CX23885_BOARD_HAUPPAUGE_STARBURST2     59
 #define CX23885_BOARD_HAUPPAUGE_QUADHD_DVB_885 60
 #define CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC_885 61
+#define CX23885_BOARD_AVERMEDIA_CE310B         62
 
 #define GPIO_0 0x00000001
 #define GPIO_1 0x00000002
-- 
2.24.0

