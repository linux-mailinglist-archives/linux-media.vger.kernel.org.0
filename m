Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3D1F313DD
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 19:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfEaRcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 13:32:55 -0400
Received: from goldenrod.birch.relay.mailchannels.net ([23.83.209.74]:49583
        "EHLO goldenrod.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726674AbfEaRcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 13:32:55 -0400
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 1D2905009D4;
        Fri, 31 May 2019 17:32:53 +0000 (UTC)
Received: from pdx1-sub0-mail-a61.g.dreamhost.com (100-96-28-110.trex.outbound.svc.cluster.local [100.96.28.110])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 26E6E501C4C;
        Fri, 31 May 2019 17:32:50 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a61.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.17.2);
        Fri, 31 May 2019 17:32:53 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Trail-Attack: 3449920c5febb152_1559323972770_3933088554
X-MC-Loop-Signature: 1559323972769:1453354573
X-MC-Ingress-Time: 1559323972769
Received: from pdx1-sub0-mail-a61.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a61.g.dreamhost.com (Postfix) with ESMTP id D0CEE80190;
        Fri, 31 May 2019 10:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references; s=
        nextdimension.cc; bh=jPwyNKruUJ5H6V+krhFHjgki2vg=; b=XOyuxnvZTLA
        8I5MlKPfiNkUsDy8T8rV+a7ko/BGSRC9oC0M5hoiGwvXlHbp3bqe5bQ3Uvcg3TCP
        NQUX/DR5is6qXX0wuIRXkSlwgPPWr7IQCleMDXmV7k1X/jtNzjGqUB634IPwypNP
        F/5NjK4Se868pJodW8/fhgRws8JWgD+w=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a61.g.dreamhost.com (Postfix) with ESMTPSA id 1A9318018F;
        Fri, 31 May 2019 10:32:43 -0700 (PDT)
X-DH-BACKEND: pdx1-sub0-mail-a61
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v5 1/4] si2157: add detection of si2177 tuner
Date:   Fri, 31 May 2019 12:32:21 -0500
Message-Id: <1559323944-15639-2-git-send-email-brad@nextdimension.cc>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559323944-15639-1-git-send-email-brad@nextdimension.cc>
References: <1559323944-15639-1-git-send-email-brad@nextdimension.cc>
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 15
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudefuddguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhephffvufffkffojghfsedttdertdertddtnecuhfhrohhmpeeurhgrugcunfhovhgvuceosghrrggusehnvgigthguihhmvghnshhiohhnrdgttgeqnecukfhppeeijedrudelkedrheejrddukeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepieejrdduleekrdehjedrudekkedprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtnecuvehluhhsthgvrhfuihiivgeptd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Works in ATSC and QAM as is, DVB is completely untested.

Firmware required.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Changes since v4:
- No changes
Changes since v3:
- Fix firmware name to be consistent

 drivers/media/tuners/si2157.c      | 6 ++++++
 drivers/media/tuners/si2157_priv.h | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index d389f1f..3d21af5 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -138,6 +138,7 @@ static int si2157_init(struct dvb_frontend *fe)
 	chip_id = cmd.args[1] << 24 | cmd.args[2] << 16 | cmd.args[3] << 8 |
 			cmd.args[4] << 0;
 
+	#define SI2177_A30 ('A' << 24 | 77 << 16 | '3' << 8 | '0' << 0)
 	#define SI2158_A20 ('A' << 24 | 58 << 16 | '2' << 8 | '0' << 0)
 	#define SI2148_A20 ('A' << 24 | 48 << 16 | '2' << 8 | '0' << 0)
 	#define SI2157_A30 ('A' << 24 | 57 << 16 | '3' << 8 | '0' << 0)
@@ -153,6 +154,9 @@ static int si2157_init(struct dvb_frontend *fe)
 	case SI2141_A10:
 		fw_name = SI2141_A10_FIRMWARE;
 		break;
+	case SI2177_A30:
+		fw_name = SI2157_A30_FIRMWARE;
+		break;
 	case SI2157_A30:
 	case SI2147_A30:
 	case SI2146_A10:
@@ -529,6 +533,7 @@ static const struct i2c_device_id si2157_id_table[] = {
 	{"si2157", SI2157_CHIPTYPE_SI2157},
 	{"si2146", SI2157_CHIPTYPE_SI2146},
 	{"si2141", SI2157_CHIPTYPE_SI2141},
+	{"si2177", SI2157_CHIPTYPE_SI2177},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, si2157_id_table);
@@ -550,3 +555,4 @@ MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
 MODULE_LICENSE("GPL");
 MODULE_FIRMWARE(SI2158_A20_FIRMWARE);
 MODULE_FIRMWARE(SI2141_A10_FIRMWARE);
+MODULE_FIRMWARE(SI2157_A30_FIRMWARE);
diff --git a/drivers/media/tuners/si2157_priv.h b/drivers/media/tuners/si2157_priv.h
index 50f8630..e4f4856 100644
--- a/drivers/media/tuners/si2157_priv.h
+++ b/drivers/media/tuners/si2157_priv.h
@@ -50,6 +50,7 @@ struct si2157_dev {
 #define SI2157_CHIPTYPE_SI2157 0
 #define SI2157_CHIPTYPE_SI2146 1
 #define SI2157_CHIPTYPE_SI2141 2
+#define SI2157_CHIPTYPE_SI2177 3
 
 /* firmware command struct */
 #define SI2157_ARGLEN      30
@@ -61,5 +62,5 @@ struct si2157_cmd {
 
 #define SI2158_A20_FIRMWARE "dvb-tuner-si2158-a20-01.fw"
 #define SI2141_A10_FIRMWARE "dvb-tuner-si2141-a10-01.fw"
-
+#define SI2157_A30_FIRMWARE "dvb-tuner-si2157-a30-01.fw"
 #endif
-- 
2.7.4

