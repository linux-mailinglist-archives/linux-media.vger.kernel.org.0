Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA6B1F6745
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 13:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgFKL5Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 07:57:16 -0400
Received: from ns.iliad.fr ([212.27.33.1]:46058 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726407AbgFKL5Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 07:57:16 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 0761B21869;
        Thu, 11 Jun 2020 13:57:14 +0200 (CEST)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id E2EC021860;
        Thu, 11 Jun 2020 13:57:13 +0200 (CEST)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, Brad Love <brad@nextdimension.cc>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Antti Palosaari <crope@iki.fi>,
        Jan Pieter van Woerkom <jp@jpvw.nl>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [RFC PATCH][DO NOT COMMIT] media: dvb_frontend: Support concurrent
 DVB-T/DVB-T2 scan
Message-ID: <4c32558d-3be7-9a57-b655-65c744c1e532@free.fr>
Date:   Thu, 11 Jun 2020 13:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jun 11 13:57:14 2020 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some demodulators (e.g. si2168) are able to scan for DVB-T and DVB-T2
signals concurrently. Use SYS_DVBT_AUTO for this purpose.
---
This is a Request For Comments from media maintainers and users :-)

One issue: suppose DVB Project publishes DVB-T3 in a few years.
Today's demods might handle T/T2, but they won't handle T3, while users
may expect SYS_DVBT_AUTO to mean "all DVB-T standards".

Therefore, perhaps the delsys name should be explicit,
like SYS_DVBT_DVBT2 or SYS_DVBT_1_2.
Then if/when DVB_T3 appears, we can add SYS_DVBT_1_2_3 ???

Or maybe use the FE_CAN_2G_MODULATION and hypothetical FE_CAN_3G_MODULATION

Or maybe, with several standards having a v2 and possibly v3 in the future,
delivery system might move to a bitmask approach? (API issues though)

Reference to related implementation:
https://patchwork.kernel.org/patch/10744999/
---
 drivers/media/dvb-frontends/si2168.c | 2 +-
 include/uapi/linux/dvb/frontend.h    | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 14b93a7d3358..8578b8917955 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -624,7 +624,7 @@ static int si2168_deselect(struct i2c_mux_core *muxc, u32 chan)
 }
 
 static const struct dvb_frontend_ops si2168_ops = {
-	.delsys = {SYS_DVBT, SYS_DVBT2, SYS_DVBC_ANNEX_A},
+	.delsys = {SYS_DVBT, SYS_DVBT2, SYS_DVBT_AUTO, SYS_DVBC_ANNEX_A},
 	.info = {
 		.name = "Silicon Labs Si2168",
 		.frequency_min_hz      =  48 * MHz,
diff --git a/include/uapi/linux/dvb/frontend.h b/include/uapi/linux/dvb/frontend.h
index 4f9b4551c534..3a6348748041 100644
--- a/include/uapi/linux/dvb/frontend.h
+++ b/include/uapi/linux/dvb/frontend.h
@@ -600,6 +600,8 @@ enum fe_rolloff {
  *	Terrestrial TV: DVB-T
  * @SYS_DVBT2:
  *	Terrestrial TV: DVB-T2
+ * @SYS_DVBT_AUTO:
+ *	Terrestrial TV: Autodetect DVB-T gen
  * @SYS_ISDBT:
  *	Terrestrial TV: ISDB-T
  * @SYS_ATSC:
@@ -645,6 +647,7 @@ enum fe_delivery_system {
 	SYS_DVBT2,
 	SYS_TURBO,
 	SYS_DVBC_ANNEX_C,
+	SYS_DVBT_AUTO,
 };
 
 /* backward compatibility definitions for delivery systems */
-- 
2.17.1
