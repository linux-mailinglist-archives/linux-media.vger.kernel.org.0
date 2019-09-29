Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC8CDC13E3
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2019 10:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbfI2IFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Sep 2019 04:05:03 -0400
Received: from fallback18.mail.ru ([185.5.136.250]:54112 "EHLO
        fallback18.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbfI2IFD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Sep 2019 04:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Message-Id:Date:Subject:Cc:To:From; bh=61a8VvzuJLVRvgj/y8WDqa759TJZDGbkVwWi3YKsILk=;
        b=qyvTBly6P3bY6JMte5HdnH1+ZKjM9sEvZ+PM/BOl5WCqmj/fKQP3UTNDYXgDCQfWfmseFKIXVl4q3YcyHVz1iJRu8lue8798cblQLE8FJKIkj8tk3nMQkHVdVqSjmQRKJhQTFQfpyQDxPNOzjssEJ+4ugLSKdSU2d/Tz7Wg9k7E=;
Received: from [10.161.100.15] (port=58086 helo=smtpng3.m.smailru.net)
        by fallback18.m.smailru.net with esmtp (envelope-from <andreykosh000@mail.ru>)
        id 1iEUCS-0000iX-DQ; Sun, 29 Sep 2019 11:05:00 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Message-Id:Date:Subject:Cc:To:From; bh=61a8VvzuJLVRvgj/y8WDqa759TJZDGbkVwWi3YKsILk=;
        b=qyvTBly6P3bY6JMte5HdnH1+ZKjM9sEvZ+PM/BOl5WCqmj/fKQP3UTNDYXgDCQfWfmseFKIXVl4q3YcyHVz1iJRu8lue8798cblQLE8FJKIkj8tk3nMQkHVdVqSjmQRKJhQTFQfpyQDxPNOzjssEJ+4ugLSKdSU2d/Tz7Wg9k7E=;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from <andreykosh000@mail.ru>)
        id 1iEUCJ-00052u-5n; Sun, 29 Sep 2019 11:04:51 +0300
From:   Andrei Koshkosh <andreykosh000@mail.ru>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andrei Koshkosh <andreykosh000@mail.ru>,
        linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Jan Pieter van Woerkom <jp@jpvw.nl>,
        =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] media: dvbsky: use a single mutex and state buffers for all R/W ops
Date:   Sun, 29 Sep 2019 11:04:05 +0300
Message-Id: <1569744245-23030-1-git-send-email-andreykosh000@mail.ru>
X-Mailer: git-send-email 2.7.4
X-77F55803: 2D1AD755E866B1545A78504BD2AC2941A61359CF0AD36FC0B135F8510420F1D93A86C3D027D1C80282A6CBF2A3B387CE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E61612FB1FB8A919EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CD877809B688EA868638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC2F074859904BBCD9BA54080B8E2616A90A031FEF788ADDF4389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C05A64D9A1E9CA65708941B15DA834481FCF19DD082D7633A0E7DDDDC251EA7DABA471835C12D1D977725E5C173C3A84C390BCC82C2C62A6D1117882F4460429728AD0CFFFB425014E40A5AABA2AD3711975ECD9A6C639B01B78DA827A17800CE71E79D001AB00117447C4BABD0925318B75ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF57285124B2A10EEC6C00306258E7E6ABB4E4A6367B16DE6309
X-Mailru-Sender: 689FA8AB762F739303AC06854B751545C64EF7A825FA5A97967DEE4CBCD4108FEC1B5849042ADB87648B0B2FE8089527E13B0FA3D5E9F256A7B6C1515A0AD0BE5FEEDEB644C299C0ED14614B50AE0675
X-Mras: OK
X-77F55803: 669901E4625912A97F9F52485CB584D7271FD7DF62800FDC22C2679BEE9317514E57A9610849DBCB933AD4F01543077417D899E2A0A66AC9
X-7FA49CB5: 0D63561A33F958A5005BC3E0E0A915E48BF2F6F3BA512F27B8336824E80207238941B15DA834481FA18204E546F3947C78444BBB7636F62AF6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B55D5BE2F85BDEC5FA471835C12D1D977C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F05F538519369F3743B503F486389A921A5CC5B56E945C8DA
X-Mailru-Sender: A5480F10D64C90052060E016933BC039A8F0687CE85A16726B7AB1A8EB50CD91662C540C2CCA2F9DD4B93D0BF3EA581BC77752E0C033A69EA7E5F91E6B0D0F4EE05E346907A1D06F3453F38A29522196
X-Mras: OK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Andrei Koshkosh <andreykosh000@mail.ru>
---
 drivers/media/usb/dvb-usb-v2/dvbsky.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index c41e10b..6a118a0 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -22,7 +22,6 @@ MODULE_PARM_DESC(disable_rc, "Disable inbuilt IR receiver.");
 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 
 struct dvbsky_state {
-	struct mutex stream_mutex;
 	u8 ibuf[DVBSKY_BUF_LEN];
 	u8 obuf[DVBSKY_BUF_LEN];
 	u8 last_lock;
@@ -61,16 +60,18 @@ static int dvbsky_stream_ctrl(struct dvb_usb_device *d, u8 onoff)
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
 
@@ -599,7 +600,6 @@ static int dvbsky_init(struct dvb_usb_device *d)
 	if (ret)
 		return ret;
 	*/
-	mutex_init(&state->stream_mutex);
 
 	state->last_lock = 0;
 
-- 
2.7.4

