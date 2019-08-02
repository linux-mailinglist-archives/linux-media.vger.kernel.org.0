Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 559EE7EFB1
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2019 10:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732202AbfHBI63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Aug 2019 04:58:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59442 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730713AbfHBI63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Aug 2019 04:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/G68ut9V+Igim0AzrVXEipFOU/9WLiFOX2nUkkTzcHQ=; b=KfNlPhD/w0UbDGnpbQ/REn0g5
        6oaHKUks286tOKhZrh0THjEFBcX0GnWm4wlc7dM/dE/tQt/QinHekViEpxBHAU31xJYisJ1ImvD+u
        IqpEAalcoLdPcKZmnjch3UmCNRFXiYYEIyWVAXxuzpRYq7wGWCpdodB3sl596Oi8B8hbx4wfjUce+
        IysR9ne7zYm5MkQSf+qwkFNx6qguUN7IGAqVbbdib3hW3k1mKdN3YbEBD+2ABgfIYhuD4CRQ1BL/p
        KxK3a5Q2hejzudSbGl5ltFHV8NY5bJcueUNA3dmbjdcRMaevhFG8QlFFzqEH3eDnhnJdVgTqSfRAb
        F8fcXznWw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1htTOK-0005K4-Bu; Fri, 02 Aug 2019 08:58:24 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 9C8C32029F4CB; Fri,  2 Aug 2019 10:58:22 +0200 (CEST)
Date:   Fri, 2 Aug 2019 10:58:22 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Andy Walls <andy@silverblocksystems.net>
Cc:     mingo@kernel.org, linux-kernel@vger.kernel.org,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 4/5] media/ivtv: Reduce default FIFO priority
Message-ID: <20190802085822.GA2386@hirez.programming.kicks-ass.net>
References: <20190801111348.530242235@infradead.org>
 <20190801111541.858088180@infradead.org>
 <7970f0e30d1eb83e7067225d07b923863bf1ac50.camel@silverblocksystems.net>
 <20190801123806.GA31398@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801123806.GA31398@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 01, 2019 at 02:38:06PM +0200, Peter Zijlstra wrote:
> If the consumer of the data are RT tasks as well (I hadn't expected that
> from a TV capture device) then I'd propose to use FIFO-50 as default.
> 
> The thing is, the moment you're doing actual proper RT, the admin needs
> to configure things anyway, which then very much includes setting the
> priority of interrupt threads and the like.
> 
> (that is exacty why pretty much everything defaults to FIFO-50)

Is the below acceptible?

---
Subject: media/ivtv: Reduce default FIFO priority
From: Peter Zijlstra <peterz@infradead.org>
Date: Thu Aug  1 12:56:40 CEST 2019

The ivtv driver creates a FIFO-99 thread by default, reduce this to
FIFO-50.

FIFO-99 is the very highest priority available to SCHED_FIFO and
it not a suitable default; it would indicate the ivtv work is the
most important work on the machine.

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
+	struct sched_param param = { .sched_priority = MAX_RT_PRIO / 2 };
 
 	itv->base_addr = pci_resource_start(itv->pdev, 0);
 	itv->enc_mbox.max_mbox = 2; /* the encoder has 3 mailboxes (0-2) */
