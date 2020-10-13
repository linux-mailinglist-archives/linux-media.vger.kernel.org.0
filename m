Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F7B28D069
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 16:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730123AbgJMOja (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 10:39:30 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:52400 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729656AbgJMOj0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 10:39:26 -0400
Message-Id: <20201013143731.704783731@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602599964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=a1AkYZbMaX1Ip/6DiYMtAdKuae5XYIyVZnWdexQvoAI=;
        b=E0Diahv1lXwkaiuX7osORu/gGHy+OH+vrt2WfUnNkb/EZ4N/z3Jyb1B/xliYIpJlR67qSP
        SYFY/RSiw/7yODuTjOh68qHTkIf/l+ZdfLt8wAxTop/p1bUv4ivyCLV4gfOlk5jO1tMGgs
        lost/0xfuj1w8ujbNgM+QPQFz3GzsIKU8jNtpQMrSjNj+9fPF0qq0p1d0oN+l5vZjnoi/s
        +dMP5sRzydTxi6wp+ZHsADHWBcK4AazZjfyKxD2+ffmI1JrVQ+YDwOcFnpb290TCLxcgRV
        Q7ftcXPaxT8A7oWjA/1wIgs3PAOX1krKqniP44gZd5+L30JO27g+6+1aUvemJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602599964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=a1AkYZbMaX1Ip/6DiYMtAdKuae5XYIyVZnWdexQvoAI=;
        b=9ZtFqq8wRih8Z7DchJqH8jYtRdOVzPS8eoB3lEj+pAREQYoG3MiBkveu0h9MR0bJiqk2Wb
        jZerbbemLqBG+ODQ==
Date:   Tue, 13 Oct 2020 16:26:18 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-usb@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [patch 2/4] media: omap3isp: Remove misleading comment
References: <20201013142616.118697527@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

in_interrupt() covers hard and soft interrupt servicing and bottom half
disabled contexts, which is semantically ill defined.

The comment for __ccdc_lsc_configure() "Context: in_interrupt()" is
therefore as useful as "Context: unknown'. Remove it.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org

---
 drivers/media/platform/omap3isp/ispccdc.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- a/drivers/media/platform/omap3isp/ispccdc.c
+++ b/drivers/media/platform/omap3isp/ispccdc.c
@@ -299,11 +299,10 @@ static int ccdc_lsc_busy(struct isp_ccdc
 			     ISPCCDC_LSC_BUSY;
 }
 
-/* __ccdc_lsc_configure - Apply a new configuration to the LSC engine
+/*
+ * __ccdc_lsc_configure - Apply a new configuration to the LSC engine
  * @ccdc: Pointer to ISP CCDC device
  * @req: New configuration request
- *
- * context: in_interrupt()
  */
 static int __ccdc_lsc_configure(struct isp_ccdc_device *ccdc,
 				struct ispccdc_lsc_config_req *req)

