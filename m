Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7467846EF9
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2019 10:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbfFOI0L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jun 2019 04:26:11 -0400
Received: from fallback22.m.smailru.net ([94.100.176.132]:41458 "EHLO
        fallback22.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfFOI0K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jun 2019 04:26:10 -0400
X-Greylist: delayed 2311 seconds by postgrey-1.27 at vger.kernel.org; Sat, 15 Jun 2019 04:26:09 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Message-Id:Date:Subject:Cc:To:From; bh=NZ7xqSZZwr1eCoczOURixtqyghD8Goo4kPSXVEszrcQ=;
        b=eS4UYFFdePCEUx+xarhSZf04dnud3Jsi2YD/a2Py/bDZCvv0Sw6KHftNq23csx+l5mfLrekzIDW0cX6sYPJNeTrvlI3AY5URFCQ+mmm4HKyF2uo9/p3PZYzsbnAcXVALlcP1p7wt54wm7UO3UCSt0Q4vgRZzq8KRSS6klgiMkqI=;
Received: from [10.161.17.67] (port=47486 helo=smtpng2.m.smailru.net)
        by fallback22.m.smailru.net with esmtp (envelope-from <andreykosh000@mail.ru>)
        id 1hc3PU-0002eV-KY; Sat, 15 Jun 2019 10:47:36 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Message-Id:Date:Subject:Cc:To:From; bh=NZ7xqSZZwr1eCoczOURixtqyghD8Goo4kPSXVEszrcQ=;
        b=eS4UYFFdePCEUx+xarhSZf04dnud3Jsi2YD/a2Py/bDZCvv0Sw6KHftNq23csx+l5mfLrekzIDW0cX6sYPJNeTrvlI3AY5URFCQ+mmm4HKyF2uo9/p3PZYzsbnAcXVALlcP1p7wt54wm7UO3UCSt0Q4vgRZzq8KRSS6klgiMkqI=;
Received: by smtpng2.m.smailru.net with esmtpa (envelope-from <andreykosh000@mail.ru>)
        id 1hc3PR-0001Ol-RZ; Sat, 15 Jun 2019 10:47:34 +0300
From:   Andrei Koshkosh <andreykosh000@mail.ru>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andrei Koshkosh <andreykosh000@mail.ru>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvbsky: use a single mutex and state buffers for all R/W ops
Date:   Sat, 15 Jun 2019 10:47:28 +0300
Message-Id: <1560584848-10278-1-git-send-email-andreykosh000@mail.ru>
X-Mailer: git-send-email 2.7.4
X-77F55803: 3FFC80838138E3AB5A78504BD2AC29415F63F23068B96592D340142D26E5A2AD4F871D01266C2C0BAA7BE44824A8E890
X-7FA49CB5: 0D63561A33F958A5DE9C03C5AB07920869F2AB6D17B09CADEA1ECB185F66D82E8941B15DA834481FA18204E546F3947C0839144E5BB460BAF6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B55B19328CBC4F849A471835C12D1D977C4224003CC836476C0CAF46E325F83A522CA9DD8327EE4930A3850AC1BE2E735E0AFE302A0308CE02318B5DA399B2AA7731C566533BA786A40A5AABA2AD371193C9F3DD0FB1AF5EB12B0DC9DCFD8E1403C9F3DD0FB1AF5EB4E70A05D1297E1BBCB5012B2E24CD356
X-Mailru-Sender: 689FA8AB762F739359CD701D0F70D3B1EFFF278F0162BBDA04EF5B5499625FC7EC1B5849042ADB87648B0B2FE8089527E13B0FA3D5E9F256A7B6C1515A0AD0BE5FEEDEB644C299C0ED14614B50AE0675
X-Mras: OK
X-77F55803: 6AF0DA0BABFA9FDB7F9F52485CB584D7271FD7DF62800FDCA810FEE225402DC7B23ED1ED492BA22DA1CA62FC8FA672EABD18DB83BCE98094
X-7FA49CB5: 0D63561A33F958A53855C23AFDFEAAE8B4BFE28A7C37969C43478AF22D0A241D8941B15DA834481FA18204E546F3947C744B801E316CB65FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B3733B5EC72352B9FA471835C12D1D977C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F1569AAA11F4ECC86574AF45C6390F7469DAA53EE0834AAEE
X-Mailru-Sender: A5480F10D64C9005CE454BE6AEE84EA23CF0444B96A59535B23ED1ED492BA22DE28E2421BF3B429A9CF37106FBEB56E73DDE9B364B0DF28929FC7850ADD9CF1E225EC17F3711B6CFAE208404248635DF
X-Mras: OK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

---
 drivers/media/usb/dvb-usb-v2/dvbsky.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index c41e10b..0b5da891 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -22,7 +22,7 @@ MODULE_PARM_DESC(disable_rc, "Disable inbuilt IR receiver.");
 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 
 struct dvbsky_state {
-	struct mutex stream_mutex;
+	//struct mutex stream_mutex;
 	u8 ibuf[DVBSKY_BUF_LEN];
 	u8 obuf[DVBSKY_BUF_LEN];
 	u8 last_lock;
@@ -61,16 +61,18 @@ static int dvbsky_stream_ctrl(struct dvb_usb_device *d, u8 onoff)
 {
 	struct dvbsky_state *state = d_to_priv(d);
 	int ret;
-	u8 obuf_pre[3] = { 0x37, 0, 0 };
-	u8 obuf_post[3] = { 0x36, 3, 0 };
+	static u8 obuf_pre[3] = { 0x37, 0, 0 };
+	static u8 obuf_post[3] = { 0x36, 3, 0 };
 
-	mutex_lock(&state->stream_mutex);
-	ret = dvbsky_usb_generic_rw(d, obuf_pre, 3, NULL, 0);
+	mutex_lock(&d->usb_mutex);
+	memcpy(state->obuf, obuf_pre, 3);
+	ret = dvb_usbv2_generic_write_locked(d, state->obuf, 3);
 	if (!ret && onoff) {
 		msleep(20);
-		ret = dvbsky_usb_generic_rw(d, obuf_post, 3, NULL, 0);
+		memcpy(state->obuf, obuf_post, 3);
+		ret = dvb_usbv2_generic_write_locked(d, state->obuf, 3);
 	}
-	mutex_unlock(&state->stream_mutex);
+	mutex_unlock(&d->usb_mutex);
 	return ret;
 }
 
@@ -599,7 +601,7 @@ static int dvbsky_init(struct dvb_usb_device *d)
 	if (ret)
 		return ret;
 	*/
-	mutex_init(&state->stream_mutex);
+	//mutex_init(&state->stream_mutex);
 
 	state->last_lock = 0;
 
-- 
2.7.4

