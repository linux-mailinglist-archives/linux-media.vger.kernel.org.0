Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E111BCA48
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 20:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731198AbgD1Ssg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 14:48:36 -0400
Received: from mailomta22-sa.btinternet.com ([213.120.69.28]:62387 "EHLO
        sa-prd-fep-041.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730915AbgD1Ssf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 14:48:35 -0400
X-Greylist: delayed 4892 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Apr 2020 14:48:34 EDT
Received: from sa-prd-rgout-003.btmx-prd.synchronoss.net ([10.2.38.6])
          by sa-prd-fep-045.btinternet.com with ESMTP
          id <20200428172701.RJQE15999.sa-prd-fep-045.btinternet.com@sa-prd-rgout-003.btmx-prd.synchronoss.net>;
          Tue, 28 Apr 2020 18:27:01 +0100
Authentication-Results: btinternet.com;
    auth=pass (LOGIN) smtp.auth=j.oldman998@btinternet.com
X-Originating-IP: [86.162.174.118]
X-OWM-Source-IP: 86.162.174.118 (GB)
X-OWM-Env-Sender: j.oldman998@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduhedriedugdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuueftkffvkffujffvgffngfevqffopdfqfgfvnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffosedttdertdertddtnecuhfhrohhmpeflohhhnhcuqfhlughmrghnuceojhhohhhnrdholhgumhgrnhesphholhgvhhhilhhlrdgtohdruhhkqeenucfkphepkeeirdduiedvrddujeegrdduudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghlohephhgvnhhrhidrhhhomhgvpdhinhgvthepkeeirdduiedvrddujeegrdduudekpdhmrghilhhfrhhomhepoehjohhhnhdrohhlughmrghnsehpohhlvghhihhllhdrtghordhukheqpdhrtghpthhtohepoeguvghvvghlsegurhhivhgvrhguvghvrdhoshhuohhslhdrohhrgheqpdhrtghpthhtohepoehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgheqpdhrtghpthhtohepoehhvhgvrhhkuhhilhesgihsgegrlhhlrdhnlheqpdhrtghpthhtohepoehjohhhnhdrohhlughmrghnsehpohhlvghhihhllhdrtghordhukheqpdhrtghpthhtohepoehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgheqpdhrtghpthhtohepoehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgqedprhgtphhtthhopeeomhgthhgvhhgrsges
        khgvrhhnvghlrdhorhhgqedprhgtphhtthhopeeothhglhigsehlihhnuhhtrhhonhhigidruggvqe
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from henry.home (86.162.174.118) by sa-prd-rgout-003.btmx-prd.synchronoss.net (5.8.340) (authenticated as j.oldman998@btinternet.com)
        id 5E3A268A0DD3C544; Tue, 28 Apr 2020 18:27:01 +0100
From:   John Oldman <john.oldman@polehill.co.uk>
To:     hverkuil@xs4all.nl
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        John Oldman <john.oldman@polehill.co.uk>
Subject: [PATCH] staging: media: usbvision: usbvision-core Correct spelling
Date:   Tue, 28 Apr 2020 18:26:55 +0100
Message-Id: <20200428172655.30227-1-john.oldman@polehill.co.uk>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Correct spelling in comment

Signed-off-by: John Oldman <john.oldman@polehill.co.uk>
---
 drivers/staging/media/usbvision/usbvision-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/usbvision/usbvision-core.c b/drivers/staging/media/usbvision/usbvision-core.c
index f05a5c84dc18..e35dee35b068 100644
--- a/drivers/staging/media/usbvision/usbvision-core.c
+++ b/drivers/staging/media/usbvision/usbvision-core.c
@@ -1268,7 +1268,7 @@ static void usbvision_isoc_irq(struct urb *urb)
 	if (!USBVISION_IS_OPERATIONAL(usbvision))
 		return;
 
-	/* any urb with wrong status is ignored without acknowledgement */
+	/* any urb with wrong status is ignored without acknowledgment */
 	if (urb->status == -ENOENT)
 		return;
 
-- 
2.17.1

