Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A42474270
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 13:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbhLNMZi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 07:25:38 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:48860 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233872AbhLNMZh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 07:25:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D7D9FB818CA
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 12:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91458C34601;
        Tue, 14 Dec 2021 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639484735;
        bh=01Ugw2BRJAlL+eMD7Peiw93L9oYMAuyYavuzZsBxkA0=;
        h=From:To:Cc:Subject:Date:From;
        b=Y9Nr9Ndvgs5BfMWWTtjwgT1h5IkfZ8jkzejuPCl2OnEzmcDWYiN/Dice2M7T5hSMP
         k/FlUaUVfaev1o2KVejD/x1rmT/DUNwFf0BYa/WMsDwKOY9J1e4KpwedASuOSOgao1
         fZI426bq04z8KvumNZRyIgeFmpzIBjh+5iitaW8zQlRUwIFoUgjHPrPhUSBNH/nzTl
         Nv5Ss8Skqmi7RoixjASwrleZLwa3ll94pOOAmGdG13uwaGteJBeJ5SNjE/NZKe2/Tr
         qen4qAb4WxQvt1VjaX4NJFdQip/3pI3bDCJrl0LqNJ854nfPKSS0MoQRwSZBibjyA0
         7LYDEjvUKmH4Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mx6s9-002O1k-Ej; Tue, 14 Dec 2021 13:25:33 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stefan Seyfried <stefan.seyfried@googlemail.com>
Subject: [PATCH] libdvbv5: dvb-scan: fix DVB-S2 checks for DVB-S tuning
Date:   Tue, 14 Dec 2021 13:25:23 +0100
Message-Id: <20211214122523.569011-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When DVB-S2 tunning is requested, the tuner may report both
DVB-S and DVB-S2 frequencies. There's a logic that tries to
discover if the channel is either S or S2, but such logic is
incomplete, causing problems.

Fix it, doing a complete check for DVB-S compatible parameters.

Reported-by: Stefan Seyfried <stefan.seyfried@googlemail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 lib/libdvbv5/dvb-scan.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/lib/libdvbv5/dvb-scan.c b/lib/libdvbv5/dvb-scan.c
index 5c8aca96df33..5bbeec1fa4fc 100644
--- a/lib/libdvbv5/dvb-scan.c
+++ b/lib/libdvbv5/dvb-scan.c
@@ -1118,9 +1118,33 @@ static void add_update_nit_dvbs(struct dvb_table_nit *nit,
 			     dvbs_dvbc_dvbs_freq_inner[d->fec]);
 	dvb_store_entry_prop(new, DTV_ROLLOFF,
 			     dvbs_rolloff[d->roll_off]);
-	if (d->roll_off != 0)
-		dvb_store_entry_prop(new, DTV_DELIVERY_SYSTEM,
-				     SYS_DVBS2);
+
+	/*
+	 * Check if the returned parameters are really DVB-S or not
+	 *
+	 * DVB-S supports only 0.35 roll-off, with QPSK and
+	 * Red-Solomon FEC 1/2, 2/3, 3/4, 5/6, 7/8. If anythign else is
+	 * reported, then it is DVB-S2.
+	 */
+
+	if ((d->roll_off != 0 && d->roll_off != ROLLOFF_35) ||
+	    (d->modulation_system != 0 && d->modulation_system != QPSK)) {
+		dvb_store_entry_prop(new, DTV_DELIVERY_SYSTEM, SYS_DVBS2);
+		return;
+	}
+
+	switch (d->fec) {
+	case FEC_NONE:
+	case FEC_AUTO:
+	case FEC_1_2:
+	case FEC_2_3:
+	case FEC_3_4:
+	case FEC_5_6:
+	case FEC_7_8:
+		return;
+	default:
+		dvb_store_entry_prop(new, DTV_DELIVERY_SYSTEM, SYS_DVBS2);
+	}
 }
 
 static void add_update_nit_isdbs(struct dvb_table_nit *nit,
-- 
2.33.1

