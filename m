Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B41418B18
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 22:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhIZUxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 16:53:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:57618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230112AbhIZUxH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 16:53:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 375616103B;
        Sun, 26 Sep 2021 20:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632689491;
        bh=QIH0+cev8bo8hbGLg+SlpuLNpPmJX3/IrRwxc7ssKZk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TaQzjNHbVIQTyk0Qhayu5RyLDtHno1Vu0yybIvfo0SuuN1aSw4AqcbIsMtWrZYqTJ
         p5y9uawxECcvEvvRNJKzX91q/JibCHdbWxEcztuaj6Ki4nyj27XVJEfhYcKg3ryvvg
         Zg4EAqkwhvmcN8COHj4/7TPAtNKaJ6kPxRz7Jln2Nh9Vvn0iQ01s6CtOWLBpmpzZTf
         S07QtVxhRfppGvSb5vAN8J4sg/Qj3usGxraYmIiRilRkQf6yXrxU8JIPiQpWUUeJc3
         NS9NE6VyvT5ER5bs4oG/3DalVwAkbe1deW8A6ypDvSh0SP++iaDnDLGgfNIRgMCLkT
         x9Odb00f6wM1Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mUb7R-001Yb6-8T; Sun, 26 Sep 2021 22:51:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Kuron <michael.kuron@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        pb@linuxtv.org
Subject: [PATCH 2/3] media: dib0700: cleanup start/stop streaming logic
Date:   Sun, 26 Sep 2021 22:51:27 +0200
Message-Id: <065a6fff925a42153671fa5202c81882ca12c59c.1632689033.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632689033.git.mchehab+huawei@kernel.org>
References: <cover.1632689033.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Having two different pathes to start/stop streaming, depending
weather the USB endpoints are 0x82/0x83 or not makes it more
prune to errors.

Unify the logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/usb/dvb-usb/dib0700_core.c | 26 +++++++++++++-----------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index 7ea8f68b0f45..d7c5836b9271 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -583,7 +583,7 @@ int dib0700_download_firmware(struct usb_device *udev, const struct firmware *fw
 int dib0700_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 {
 	struct dib0700_state *st = adap->dev->priv;
-	int ret;
+	int ret, adapt_nr;
 
 	if ((onoff != 0) && (st->fw_version >= 0x10201)) {
 		/* for firmware later than 1.20.1,
@@ -610,24 +610,26 @@ int dib0700_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 
 	st->buf[3] = 0x00;
 
-	deb_info("modifying (%d) streaming state for %d\n", onoff, adap->id);
-
 	st->channel_state &= ~0x3;
+
 	if ((adap->fe_adap[0].stream.props.endpoint != 2)
-			&& (adap->fe_adap[0].stream.props.endpoint != 3)) {
-		deb_info("the endpoint number (%i) is not correct, use the adapter id instead", adap->fe_adap[0].stream.props.endpoint);
-		if (onoff)
-			st->channel_state |=	1 << (adap->id);
+	    && (adap->fe_adap[0].stream.props.endpoint != 3)) {
+		deb_info("the endpoint number (%i) is not correct, use the adapter id instead\n",
+			 adap->fe_adap[0].stream.props.endpoint);
+		adapt_nr = adap->id;
 	} else {
-		if (onoff)
-			st->channel_state |=	1 << (adap->fe_adap[0].stream.props.endpoint-2);
-		else
-			st->channel_state |=	1 << (3-adap->fe_adap[0].stream.props.endpoint);
+		adapt_nr = adap->fe_adap[0].stream.props.endpoint - 2;
 	}
 
+	if (onoff)
+		st->channel_state |= 1 << adapt_nr;
+	else
+		st->channel_state |= 1 << (1 - adapt_nr);
+
 	st->buf[2] |= st->channel_state;
 
-	deb_info("data for streaming: %x %x\n", st->buf[1], st->buf[2]);
+	deb_info("adapter %d, streaming %s: %*ph\n",
+		adapt_nr, onoff ? "ON" : "OFF", 3, st->buf);
 
 	ret = dib0700_ctrl_wr(adap->dev, st->buf, 4);
 	mutex_unlock(&adap->dev->usb_mutex);
-- 
2.31.1

