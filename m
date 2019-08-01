Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A44BF7DA1E
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 13:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730472AbfHALSY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 07:18:24 -0400
Received: from merlin.infradead.org ([205.233.59.134]:50866 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729802AbfHALSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 07:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:References:
        Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MDmpY5EHj8U+zmmNaXw1ntCBz285jVsAmek2qVWzj1E=; b=aABm2nu9jDgmlCzsbre1rsw4Ak
        OGgghGKpUWPzgmQERlBHr4p1a9E55RLrbmCl7sygRMRlKxdRGkxRuG/q6cLXG+g/IqQjwBq9Ec2gw
        VN/Z19p6+0z6ig0KDmmc5kMMTBY+yRwPMkiUAFJyFCxd1ME0rj9DoTSfzREE5MbhDkG3SwnxNa1hy
        Y4MAgAJPBcN9iwYB0sSlJzC+r2OjVPtGOpKnncEc+tz7lUmsXe8JV5TYqL1NGljvl9n3rVnkMhj3d
        QSL4IwHmehgXKVUJ1Z2ueCzl5ouqmiEvAp964LlAwICOMUx8QNsPb6zQYRfd8Hq/MegTAJ3cCSZ1J
        s5vYR+Wg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1ht968-0005fc-GW; Thu, 01 Aug 2019 11:18:17 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
        id 89CC7202975E3; Thu,  1 Aug 2019 13:18:12 +0200 (CEST)
Message-Id: <20190801111541.858088180@infradead.org>
User-Agent: quilt/0.65
Date:   Thu, 01 Aug 2019 13:13:52 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     mingo@kernel.org
Cc:     linux-kernel@vger.kernel.org, peterz@infradead.org,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 4/5] media/ivtv: Reduce default FIFO priority
References: <20190801111348.530242235@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ivtv driver creates a FIFO-99 thread by default, reduce this to
FIFO-1.

FIFO-99 is the very highest priority available to SCHED_FIFO and
it not a suitable default; it would indicate the ivtv work is the
most important work on the machine.

FIFO-1 gets it above all OTHER tasks, which seems high enough lacking
better justification.

Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 drivers/media/pci/ivtv/ivtv-driver.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -738,7 +738,7 @@ static void ivtv_process_options(struct
  */
 static int ivtv_init_struct1(struct ivtv *itv)
 {
-	struct sched_param param = { .sched_priority = 99 };
+	struct sched_param param = { .sched_priority = 1 };
 
 	itv->base_addr = pci_resource_start(itv->pdev, 0);
 	itv->enc_mbox.max_mbox = 2; /* the encoder has 3 mailboxes (0-2) */


