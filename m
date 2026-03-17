Return-Path: <linux-media+bounces-56136-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jGS7EFvMuWmQNwIAu9opvQ
	(envelope-from <linux-media+bounces-56136-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 22:49:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6152B2DE1
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 22:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09A0A300B285
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E6F31F998;
	Tue, 17 Mar 2026 21:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="CWxLioLO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A689521D596
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 21:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773784148; cv=none; b=YoL7lPAV8XQTPZiXZmzNZTS3U/gqWZbtggpy+UZjrWsxJ6SV/0GHBkIVYDh6KEN4tFv3CCEKeHpvGdeIu3ksO+mJsL62BmqLNkLz9LwFqA2EnhWoPud6VLfdfDkxLCDextNT9kyEoGE7aKSvnS2nMAJBMtmToLY5u/YQlH7UUWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773784148; c=relaxed/simple;
	bh=1tjzQ5VFLpqCYf0pbDEgEaTHKnDuhZFcrH0vM0wWp0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NbpMRVPBBFQG3Fu1jJdj2doDgZHB9owUUZzNkTNsmDzFFfMtR0jSu8+2RzbYSR/tdrI2e1EomV9mSd7PsBWP13hacZQDhyY9YKNIZYLNrurolULhw20r/jb1NRX+8tITHFvAsMUn5HoD1OLV2uZtXzA/ZNneKTeobUL6/J1rku0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=CWxLioLO; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64e8ae85700so1409781d50.1
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 14:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773784146; x=1774388946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCRy4XzIrX//OQj0eB7mr9Be2GiHN6WTw6c4NhX2paU=;
        b=CWxLioLOaOQV+M/GBVcmRBx8hS38rj0FAll42GCSfW0IV85IxdgSjah+e94N1dgG24
         JEXi88ZeI+TqA2e5WzShMwXi9knUDUPjIlEgxYN8oCLb/Nlp0Aw0jyOza0zweg/1MQxw
         DmakZoz0HM7t6IBYrPDTfUlkspNkQX7qR9ClDki1llI89JK4mWdaDKdMlOeADo5MsbdR
         7I4tbq7St1ZFbg59nX+rmhzUi224A3pTGAmKxtobB0r3ZetVvS4wrQFoeIi6GJcwIYWs
         fjlB4UsHpCXP1jFqdm+XaQtE1QSmwisDWSZYn+oRq/dMfQ22UJ9Jc1quvA+ETYkTljhb
         +dGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773784146; x=1774388946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BCRy4XzIrX//OQj0eB7mr9Be2GiHN6WTw6c4NhX2paU=;
        b=lfftYmsdiilVezhLC+VNc3UHPqcrVuK/o/BXKouTVX0xMtk8p8I5wirO2D3TJbtOEy
         ujwDzPv5PK2JzBaPCSyrUVGd655S2tAbGY+ZxnjQdutjSTj0uUBC/wHFcHycUc09c/zF
         XZRqsHvy8G+SDJOFlgxxRuXKKN7EntMqXevsKKnPy96MiLht9ats3wAQvIx5JHBk0xpc
         zamd9nGD5yM0A44zmuSYk9/9TenIDiXHd122rtj/kzKXeiAiBDI+biF+wO7DnF4IWd1X
         OxHFkSHmlVLemcFacfggTk1LWiMY9yGS0BVSVGlFD14dct32Is1dPHSbNWzqKBm09y3p
         g/0Q==
X-Gm-Message-State: AOJu0YxsUbvey1SV8RYxCLJy8eBHH5qgJMWG/ZROEgLBLOoSSUWTlUrQ
	diYsgRur/44HmFSd0Kvqo6UyJ/ggdCY/VpCU2vTk82dV0w8RcB+b3nmpnw3IWMqexe6a2HTRaaG
	4NGCWaas=
X-Gm-Gg: ATEYQzwx9DeK/ths/O6x/tDX/20NxFiwnWhek8+XcGGFOhfvH/AzXzbjTYRU1svKPrf
	PHfBsrQWybBD9qt6z8s//5ApKzyHgTx0cNmN5KyJW/zGatc6QVsBasXno/mxLhBQsW04AS9x3la
	6r4h0Y6npdsIP3W7tdexueED0Ks5RML0YVu0t83+n9N1556zcbO0xAbkaidneoquEYbg+aHFtSp
	jPnjIRA7p6fwNG7K6DoS6CMy80dcuZlDE36Ep3/N3Tz0ZyZ/sK1/9ys/MMxj8SNhnWEHfMrRa7l
	5ej5Kl9O7bZfPefyuGkEAHtdi0gn6y+krugJVjOfwb/Uu8rNv3E7Ql9B/pHIyDz7X1y5IJbwHHP
	3ViA4mpCMrq5nFR3gBK5eT/u3jgmWhWq4NQ3aUHqC0zLut+SmxFf8eSq/PH+sDL0B/2U/gE3bHl
	IO+MxTX5H+zq+x5JWOqbI2g8OTZLdiZUFK837yGkq9NMh8Mj+Z9EQrRhI7RSmQEwTTAr+stGDrN
	wKrzmtjC/ayadWoeeFJ5yMj4hkY5g==
X-Received: by 2002:a05:690e:e18:b0:649:e440:26a5 with SMTP id 956f58d0204a3-64e912cf57emr1148500d50.15.1773784146436;
        Tue, 17 Mar 2026 14:49:06 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91a1c4b8sm566144d50.1.2026.03.17.14.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 14:49:05 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH] media: cx23885: Module option to disable analog video
Date: Tue, 17 Mar 2026 16:49:02 -0500
Message-Id: <20260317214902.3369964-2-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260317214902.3369964-1-brad@nextdimension.cc>
References: <20260317214902.3369964-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56136-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F6152B2DE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Initialized and left to themselves some boards with analog inputs,
on some modern platforms can throw critical errors which prevents
even digital from working thereafter. If analog is never used this
module parameter allows analog to be disabled on a card by card
basis.

It is already possible to disable analog audio.

For example, to disable for Hauppauge QuadHD with analog functionality:

options cx23885 disable_analog_video=56,57

can be placed insode of /etc/modprobe.d/cx23885.conf


Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/pci/cx23885/cx23885-cards.c |  3 +++
 drivers/media/pci/cx23885/cx23885-core.c  | 15 ++++++++++++++-
 drivers/media/pci/cx23885/cx23885-dvb.c   |  6 ++++--
 drivers/media/pci/cx23885/cx23885.h       |  1 +
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-cards.c b/drivers/media/pci/cx23885/cx23885-cards.c
index da23e7dfeef5..95a84709d5a6 100644
--- a/drivers/media/pci/cx23885/cx23885-cards.c
+++ b/drivers/media/pci/cx23885/cx23885-cards.c
@@ -2443,6 +2443,9 @@ void cx23885_card_setup(struct cx23885_dev *dev)
 	case CX23885_BOARD_VIEWCAST_460E:
 	case CX23885_BOARD_AVERMEDIA_CE310B:
 	case CX23885_BOARD_AVERMEDIA_H789C:
+		if (dev->disable_analog)
+			break;
+
 		dev->sd_cx25840 = v4l2_i2c_new_subdev(&dev->v4l2_dev,
 				&dev->i2c_bus[2].i2c_adap,
 				"cx25840", 0x88 >> 1, NULL);
diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 0892a5fd137d..4a8af8b88d84 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -48,6 +48,11 @@ static unsigned int debug;
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "enable debug messages");
 
+static unsigned int disable_analog_video[8] = { 0, 0, 0, 0, 0, 0, 0, 0};
+static int disable_analog_argc;
+module_param_array(disable_analog_video, int, &disable_analog_argc, 0644);
+MODULE_PARM_DESC(disable_analog_video, "disable analog video for card type");
+
 static unsigned int card[]  = {[0 ... (CX23885_MAXBOARDS - 1)] = UNSET };
 module_param_array(card,  int, NULL, 0444);
 MODULE_PARM_DESC(card, "card type");
@@ -924,6 +929,13 @@ static int cx23885_dev_setup(struct cx23885_dev *dev)
 			dev->board = CX23885_BOARD_HAUPPAUGE_QUADHD_DVB_885;
 	}
 
+	for (i = 0; i < disable_analog_argc; i++) {
+		if (disable_analog_video[i] == dev->board) {
+			pr_warn("Disabling analog for board %d\n", dev->board);
+			dev->disable_analog = 1;
+		}
+	}
+
 	/* If the user specific a clk freq override, apply it */
 	if (cx23885_boards[dev->board].clk_freq > 0)
 		dev->clk_freq = cx23885_boards[dev->board].clk_freq;
@@ -1043,7 +1055,8 @@ static int cx23885_dev_setup(struct cx23885_dev *dev)
 		cx23885_gpio_enable(dev, 0x300, 0);
 	}
 
-	if (cx23885_boards[dev->board].porta == CX23885_ANALOG_VIDEO) {
+	if (cx23885_boards[dev->board].porta == CX23885_ANALOG_VIDEO &&
+	    !dev->disable_analog) {
 		if (cx23885_video_register(dev) < 0) {
 			pr_err("%s() Failed to register analog video adapters on VID_A\n",
 			       __func__);
diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/cx23885/cx23885-dvb.c
index 05a7859cbe57..f240ccda40ed 100644
--- a/drivers/media/pci/cx23885/cx23885-dvb.c
+++ b/drivers/media/pci/cx23885/cx23885-dvb.c
@@ -2373,7 +2373,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			port->i2c_client_tuner = client_tuner;
 
 			/* we only attach tuner for analog on the 888 version */
-			if (dev->board == CX23885_BOARD_HAUPPAUGE_QUADHD_DVB) {
+			if (dev->board == CX23885_BOARD_HAUPPAUGE_QUADHD_DVB &&
+			    !dev->disable_analog) {
 				pr_info("%s(): QUADHD_DVB analog setup\n",
 					__func__);
 				dev->ts1.analog_fe.tuner_priv = client_tuner;
@@ -2466,7 +2467,8 @@ static int dvb_register(struct cx23885_tsport *port)
 			port->i2c_client_tuner = client_tuner;
 
 			/* we only attach tuner for analog on the 888 version */
-			if (dev->board == CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC) {
+			if (dev->board == CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC &&
+			    !dev->disable_analog) {
 				pr_info("%s(): QUADHD_ATSC analog setup\n",
 					__func__);
 				dev->ts1.analog_fe.tuner_priv = client_tuner;
diff --git a/drivers/media/pci/cx23885/cx23885.h b/drivers/media/pci/cx23885/cx23885.h
index 8ba1f306238c..8653ee1d9ba6 100644
--- a/drivers/media/pci/cx23885/cx23885.h
+++ b/drivers/media/pci/cx23885/cx23885.h
@@ -404,6 +404,7 @@ struct cx23885_dev {
 	unsigned char              radio_addr;
 	struct v4l2_subdev	   *sd_cx25840;
 	struct work_struct	   cx25840_work;
+	unsigned int		   disable_analog;
 
 	/* Infrared */
 	struct v4l2_subdev         *sd_ir;
-- 
2.35.1


