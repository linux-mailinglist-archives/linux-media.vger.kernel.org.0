Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9399201C3A
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 22:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391706AbgFSUPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 16:15:39 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:20030 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391592AbgFSUPi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 16:15:38 -0400
Received: from [192.168.1.91] (unknown [77.207.133.132])
        (Authenticated sender: marc.w.gonzalez)
        by smtp4-g21.free.fr (Postfix) with ESMTPSA id 66DF919F4C8;
        Fri, 19 Jun 2020 22:15:20 +0200 (CEST)
Subject: Re: Scanning for TV channels over DVB-T and DVB-T2
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     linux-media <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jan Pieter van Woerkom <jp@jpvw.nl>,
        Brad Love <brad@nextdimension.cc>,
        Antti Palosaari <crope@iki.fi>
Cc:     LKML <linux-kernel@vger.kernel.org>
References: <11fbc112-c410-8c67-9bcb-9450924d12ef@free.fr>
 <4904d37d-1cd4-b8f3-9c3c-82eb4569bca7@free.fr>
 <778d08be-b606-018a-c2bc-164fbbc33615@free.fr>
Message-ID: <71c3a7c3-0661-c4ac-6f72-8409fa38211b@free.fr>
Date:   Fri, 19 Jun 2020 22:15:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <778d08be-b606-018a-c2bc-164fbbc33615@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/06/2020 17:22, Marc Gonzalez wrote:

> FTR, on IRC, Brad pointed out this patch of his:
> https://patchwork.kernel.org/patch/10744999/

I suggest the following patch on top of Brad's patch:

Author: Marc Gonzalez <marc.w.gonzalez@free.fr>
Date:   Fri Jun 19 22:09:26 2020 +0200

    si2168: wait for carrier lock before next step

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 31d3dc0216c2..e127e842f671 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -152,6 +152,11 @@ static int si2168_ts_bus_ctrl(struct dvb_frontend *fe, int acquire)
 	return ret;
 }
 
+static bool carrier_locked(struct si2168_cmd *cmd)
+{
+	return cmd->args[2] & BIT(1);
+}
+
 static int si2168_read_status(struct dvb_frontend *fe, enum fe_status *status)
 {
 	struct i2c_client *client = fe->demodulator_priv;
@@ -180,6 +185,9 @@ static int si2168_read_status(struct dvb_frontend *fe, enum fe_status *status)
 		if (ret)
 			goto err;
 
+		if (!carrier_locked(&cmd))
+			goto parse_response;
+
 		if ((cmd.args[3] & 0x0f) == 7)
 			sys = SYS_DVBT2;
 	}
@@ -206,27 +214,10 @@ static int si2168_read_status(struct dvb_frontend *fe, enum fe_status *status)
 	}
 
 	ret = si2168_cmd_execute(client, &cmd);
-	if (dvbt_auto_plp && (ret == -EREMOTEIO)) {
-		/* In auto-PLP mode it is possible to read 0x8701 while
-		 * the frontend is in switchover transition. This causes
-		 * a status read failure, due to incorrect system. Check
-		 * the other sys if we hit this race condition.
-		 */
-		if (sys == SYS_DVBT) {
-			memcpy(cmd.args, "\x50\x01", 2); /* DVB-T2 */
-			cmd.wlen = 2;
-			cmd.rlen = 14;
-			ret = si2168_cmd_execute(client, &cmd);
-		} else if (sys == SYS_DVBT2) {
-			memcpy(cmd.args, "\xa0\x01", 2); /* DVB-T */
-			cmd.wlen = 2;
-			cmd.rlen = 13;
-			ret = si2168_cmd_execute(client, &cmd);
-		}
-	}
 	if (ret)
 		goto err;
 
+parse_response:
 	switch ((cmd.args[2] >> 1) & 0x03) {
 	case 0x01:
 		*status = FE_HAS_SIGNAL | FE_HAS_CARRIER;

