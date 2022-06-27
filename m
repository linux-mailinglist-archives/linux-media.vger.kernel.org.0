Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB3B55B70F
	for <lists+linux-media@lfdr.de>; Mon, 27 Jun 2022 07:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232414AbiF0FA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 01:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbiF0FAy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 01:00:54 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6BA389F
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 22:00:48 -0700 (PDT)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 8735B1B00220;
        Mon, 27 Jun 2022 08:00:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1656306046;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jV39m30CbXj3dSbPgEjcm/JXWsCzMJOS3vGZr3mQARE=;
        b=aGFim8a8RimaqYyVRujpcsQKa2ed7IND/ai8570op9ducWIAOVNk8IPLW2DsVJDfmAl6lw
        jiTnpFLU+ypcfCFhuKd2qnmqkUJ0jRZjBmp0yhQEufSlHX0bIeL0Lfw9MMSf1bCxeyiap0
        c2atxvQNEr/v2ErWvYT1V+R4aerPVON+BqADNQTA57DW2lWD3RU2OtaEvLVXIAXUjcSLe7
        u4LA3aboz8j3MtGWmk9yoOASMdN8KC33C6hGngaWJefPrdmj3OPRNaQDoKyfWvqo7vb+jT
        cFB+J30fP0h5w5epdSEBYcVk+dNNaESZs2WUwGvvWevGqikxbCY/3bWYLjOh5Q==
Date:   Mon, 27 Jun 2022 08:00:45 +0300
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <Yrk5faigZEiZ7KXk@jyty>
References: <cover.1644683294.git.sean@mess.org>
 <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
 <YrhSK5l0uQZT76Fi@jyty>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="l+cVJihQ29r+HlGJ"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrhSK5l0uQZT76Fi@jyty>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1656306046; a=rsa-sha256;
        cv=none;
        b=qGo6KNo+GTEiDsxoGvliLid3EbKKJkaHVdiPU8LxiEkotpvZWmovRuc/t2VZ62jBoCAt5e
        9WUUYx0Jol+jOCap4mSSicjsa08I0OqY6rDWm78MnykujEcnP76/hFhIKM0vGLcr70ZHju
        N5pm7czCzM0c26oLPycl+Uj4eZHhlC95aDgAy3EOx/FlloeEuIDzmRWHtBluqncyfNiGKc
        HH9nRHWdxwZ41i+SoVRjNI07cDHbUGX5ejitukA8B5rH1hrQQgFQCXR4SmRslHlx2eVl9C
        es6B2Yg/Av6L+leonzSbd37Z/CkNs74WykCetALZxv2IK4ovdyDJZ/CkSr5bMA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1656306046;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jV39m30CbXj3dSbPgEjcm/JXWsCzMJOS3vGZr3mQARE=;
        b=id7Ov0da93YBxdYrLcmPOr5Wryd2J//BOKpA7DZFhhcX622aIbh+oMRzivL9BvoCV/PLGu
        Uu/dU8ibow9uiJvdo4XrQGU6hEsCJKY246yYOOzB77k+wjwo9vNeBL4WWxcvthPtqbPAl1
        9kYjJZf4WTX2/KmrTpDajC9jcnW+/BVO36chULvab13ap7CoPIU1vrVSA0lAko4unjcSTu
        uldK5tLYEnvRPS7l0+RURaLjHqSWT6KEkkvKYqA79yTwXeJndmgRtjRPB35dBUkZvIZIyX
        IQE1SW36eweRVKbu9fnSRn118iOSWKWUfL5jFsUNjXPkJdkgWOj7DBtpXjW0Vg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--l+cVJihQ29r+HlGJ
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Sun, Jun 26, 2022 at 03:33:48PM +0300, Marko Mäkelä wrote:
>How about the following improvement? If IR_RX_BC is a simple cursor to 
>the 128-byte IR_RX_BUF, then rtl2832u_rc_query() could avoid sending 
>refresh_tab[] but simply remember where the previous call left off. We 
>could always read the 128 bytes at IR_RX_BUF, and process everything 
>between the previous position reported by IR_RX_BC and the current 
>position reported by IR_RX_BC, and treat buf[] as a ring buffer.

I experimented with this on the 5.19.0-rc3 kernel. With the attached 
patch applied on top of this patch series, "ir-keytables -t" reported 
only one RC5 encoded key-down event. I had to unplug and plug in the 
adapter in order to receive another RC5 event. The refresh command seems 
to be necessary for the device to store and forward further IR data.

>Last time I tested it, the patch was a significant improvement. I think 
>that "perfect" is the enemy of "good enough", and the patch should be 
>included in the kernel.

The remaining problem definitely is a limitation of the interface. There 
is little that can be done to work around it.

	Marko

--l+cVJihQ29r+HlGJ
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="rc_bc_ringbuffer.patch"

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index a83b1107fc7f..04670cec727c 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1711,16 +1711,10 @@ static int rtl2831u_get_rc_config(struct dvb_usb_device *d,
 
 static int rtl2832u_rc_query(struct dvb_usb_device *d)
 {
-	int ret, i, len;
+	int ret, i, end;
 	struct rtl28xxu_dev *dev = d->priv;
 	struct ir_raw_event ev = {};
 	u8 buf[128];
-	static const struct rtl28xxu_reg_val_mask refresh_tab[] = {
-		{IR_RX_IF,               0x03, 0xff},
-		{IR_RX_BUF_CTRL,         0x80, 0xff},
-		{IR_RX_CTRL,             0x80, 0xff},
-	};
-	u32 idle_length;
 
 	/* init remote controller */
 	if (!dev->rc_active) {
@@ -1761,48 +1755,22 @@ static int rtl2832u_rc_query(struct dvb_usb_device *d)
 		goto exit;
 
 	ret = rtl28xxu_rd_reg(d, IR_RX_BC, &buf[0]);
-	if (ret || buf[0] > sizeof(buf))
+	if (ret)
 		goto err;
 
-	len = buf[0];
+	i = dev->rc_bc;
+	end = dev->rc_bc = buf[0] & 0x7f;
 
 	/* read raw code from hw */
-	ret = rtl28xxu_rd_regs(d, IR_RX_BUF, buf, len);
+	ret = rtl28xxu_rd_regs(d, IR_RX_BUF, buf, sizeof buf);
 	if (ret)
 		goto err;
 
-	dev_dbg(&d->intf->dev, "IR_RX_BUF=%*ph\n", len, buf);
-
-	/* if the receiver is not idle yet, do not process */
-	idle_length = 0;
-	if (len > 2) {
-		if (!(buf[len - 1] & 0x80))
-			idle_length += buf[len - 1];
-		if (!(buf[len - 2] & 0x80))
-			idle_length += buf[len - 2];
-	}
-
-	if (idle_length < 0xbf) {
-		/*
-		 * If the IR does not end with a space equal to the idle
-		 * length, then the IR is not complete yet and more is to
-		 * arrive shortly. If we process it and flush the buffer now,
-		 * we end up missing IR.
-		 */
-		dev_dbg(&d->intf->dev, "ignoring idle=%x\n", idle_length);
-		return 0;
-	}
-
-	/* let hw receive new code */
-	for (i = 0; i < ARRAY_SIZE(refresh_tab); i++) {
-		ret = rtl28xxu_wr_reg_mask(d, refresh_tab[i].reg,
-				refresh_tab[i].val, refresh_tab[i].mask);
-		if (ret)
-			goto err;
-	}
+	dev_dbg(&d->intf->dev, "IR_RX_BUF=%d,%*ph\n", end,
+		(int) sizeof buf, buf);
 
 	/* pass data to Kernel IR decoder */
-	for (i = 0; i < len; i++) {
+	for (; i != end; i++, i &= 0x7f) {
 		ev.pulse = buf[i] >> 7;
 		ev.duration = 51 * (buf[i] & 0x7f);
 		ir_raw_event_store_with_filter(d->rc_dev, &ev);
diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.h b/drivers/media/usb/dvb-usb-v2/rtl28xxu.h
index d5e207baa05d..b1abd73a3020 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.h
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.h
@@ -64,6 +64,7 @@ struct rtl28xxu_dev {
 	u8 tuner;
 	char *tuner_name;
 	u8 page; /* integrated demod active register page */
+	u8 rc_bc;
 	struct i2c_adapter *demod_i2c_adapter;
 	bool rc_active;
 	bool new_i2c_write;

--l+cVJihQ29r+HlGJ--
