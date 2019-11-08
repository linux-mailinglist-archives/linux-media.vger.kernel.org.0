Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEA3F56F7
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 21:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387927AbfKHTOr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 14:14:47 -0500
Received: from fallback22.m.smailru.net ([94.100.176.132]:45572 "EHLO
        fallback22.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391190AbfKHTGD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 14:06:03 -0500
X-Greylist: delayed 3008 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Nov 2019 14:06:01 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Message-Id:Date:Subject:Cc:To:From; bh=eVwQbQPhdwy7bQtJufPpgCY/bGitZ6xSTtkn/R+C0pI=;
        b=FLuAbmTsHARi0aMtX/iAXiFNzVW9Tww3ezgnAEWcCXwz6g/x/3X5+uVFUaQ6C168U4APmNC6Q+JFsOiGN6eHlZfEJyQ401X1JIq/brJS7omlCd+J2wBuqKqUw1dL6Be6NPEGstQ7WIJW5EH3BqCzHkXcxrVD7aW9THA4Gg5oE0o=;
Received: from [10.161.17.67] (port=50050 helo=smtpng2.m.smailru.net)
        by fallback22.m.smailru.net with esmtp (envelope-from <andreykosh000@mail.ru>)
        id 1iT8nY-0007WW-3e; Fri, 08 Nov 2019 21:15:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Message-Id:Date:Subject:Cc:To:From; bh=eVwQbQPhdwy7bQtJufPpgCY/bGitZ6xSTtkn/R+C0pI=;
        b=FLuAbmTsHARi0aMtX/iAXiFNzVW9Tww3ezgnAEWcCXwz6g/x/3X5+uVFUaQ6C168U4APmNC6Q+JFsOiGN6eHlZfEJyQ401X1JIq/brJS7omlCd+J2wBuqKqUw1dL6Be6NPEGstQ7WIJW5EH3BqCzHkXcxrVD7aW9THA4Gg5oE0o=;
Received: by smtpng2.m.smailru.net with esmtpa (envelope-from <andreykosh000@mail.ru>)
        id 1iT8nP-00041N-E5; Fri, 08 Nov 2019 21:15:43 +0300
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
Date:   Fri,  8 Nov 2019 21:15:13 +0300
Message-Id: <1573236913-16642-1-git-send-email-andreykosh000@mail.ru>
X-Mailer: git-send-email 2.7.4
X-77F55803: CF41D5CA8C6D3C0C7F9F52485CB584D786C548EC7EDDB260F093E95F051D11E37CDA602523BB6F4D38BDFEA0C676413E08D917D6130B1AFB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE798E404AA3BF6E4FFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374D30FA0D294D462C8638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC47619D9DDD2B63C41B20B3E278204B7A121142EC61A434AA389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C05A64D9A1E9CA65708941B15DA834481FCF19DD082D7633A0E7DDDDC251EA7DABA471835C12D1D977725E5C173C3A84C390BCC82C2C62A6D1117882F4460429728AD0CFFFB425014E40A5AABA2AD3711975ECD9A6C639B01B78DA827A17800CE744971CCE4A759E5C2C5B0C437DA3444775ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF5797B92FCB1594A39500306258E7E6ABB4E4A6367B16DE6309
X-Mailru-Sender: 689FA8AB762F739303AC06854B751545F093E95F051D11E3BEC964DB2BAD3B40EC1B5849042ADB87648B0B2FE8089527E13B0FA3D5E9F256A7B6C1515A0AD0BE5FEEDEB644C299C0ED14614B50AE0675
X-Mras: OK
X-77F55803: 669901E4625912A97F9F52485CB584D7271FD7DF62800FDC9EBF4251B8251AB5037D61E8B975851AEF78FD4E7E9BB93A80C55F9DC28FFF7C
X-7FA49CB5: 0D63561A33F958A501053DC613B33ECE54F1936EDCEA807FA0944BDD01A490B08941B15DA834481FA18204E546F3947C78444BBB7636F62AF6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B55D5BE2F85BDEC5FA471835C12D1D977C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F93F060FBA3C93C613B503F486389A921A5CC5B56E945C8DA
X-Mailru-Sender: A5480F10D64C9005CE454BE6AEE84EA2B7F4AB15CC51E313037D61E8B975851A1E1E156D000DABDB9CF37106FBEB56E73DDE9B364B0DF28929FC7850ADD9CF1E225EC17F3711B6CFAE208404248635DF
X-Mras: OK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Andrei Koshkosh <andreykosh000@mail.ru>
---
 drivers/media/usb/dvb-usb-v2/dvbsky.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index c41e10b..7d36f5f 100644
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
 
@@ -592,15 +593,7 @@ static int dvbsky_identify_state(struct dvb_usb_device *d, const char **name)
 static int dvbsky_init(struct dvb_usb_device *d)
 {
 	struct dvbsky_state *state = d_to_priv(d);
-
-	/* use default interface */
-	/*
-	ret = usb_set_interface(d->udev, 0, 0);
-	if (ret)
-		return ret;
-	*/
-	mutex_init(&state->stream_mutex);
-
+	
 	state->last_lock = 0;
 
 	return 0;
-- 
2.7.4

