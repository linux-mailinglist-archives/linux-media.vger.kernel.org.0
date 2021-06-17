Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5003ABDA2
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 22:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbhFQUm2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 16:42:28 -0400
Received: from fortimail.online.lv ([81.198.164.220]:38826 "EHLO
        fortimail.online.lv" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbhFQUm1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 16:42:27 -0400
X-Greylist: delayed 604 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Jun 2021 16:42:27 EDT
Received: from mailo-proxy1 (smtp.online.lv [81.198.164.193])
        by fortimail.online.lv  with ESMTP id 15HKUCIN002411-15HKUCIP002411
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 23:30:12 +0300
Received: from mailo-b1 (10.95.60.6) by mailo-proxy1 (Axigen)
 with ESMTPA id 1E6133; Thu, 17 Jun 2021 23:30:12 +0300
Received: from mailo-proxy1 (10.95.60.3) by mailo-b1 (Axigen)
 with ESMTPA id 0AB930; Thu, 17 Jun 2021 23:30:12 +0300
Received: from [10.96.45.191] (80.232.242.31) by mailo-proxy1 (Axigen)
 with ESMTPA id 2B106B; Thu, 17 Jun 2021 23:30:12 +0300
From:   Raimonds Cicans <ray@apollo.lv>
Subject: cx23885: risc op code error - strange solution...
To:     linux-media@vger.kernel.org
Message-ID: <5f01f85e-a8a0-4d79-d7a3-d32d9e4888a5@apollo.lv>
Date:   Thu, 17 Jun 2021 23:30:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------3764067B96C5A62C74F125ED"
Content-Language: en-US
DomainKey-Status: no signature
DKIM-Status: no signature
X-AXIGEN-DK-Result: No records
X-AXIGEN-DKIM-Result: No records
X-FE-Attachment-Name: cx23885-core_risc_KASAN.patch
X-FEAS-SPF: spf-result=pass, ip=81.198.164.193, helo=, mailFrom=ray@apollo.lv
Authentication-Results: fortimail.online.lv;
        spf=pass (online.lv: domain of ray@apollo.lv designates 81.198.164.193 as permitted sender) smtp.mailfrom=ray@apollo.lv
X-FE-Policy-ID: 9:6:0:SYSTEM
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------3764067B96C5A62C74F125ED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

Yet again I try to fight cx23885 driver's "risc op code error" bug.

I found very weird "fix":
If I apply attached patch _AND_ enable KASAN, then problem disappear.
If I disable KASAN or delete _ANY_ new line from patch, then problem 
reappear.

I tried to replace "printk" with delays and with memory barriers, but 
nothing works.

I would like to hear from community any ideas:
1. why this "fix" helps
2. what weird things "printk" can do when KASAN enabled
3. why we need two consecutive "cx23885_irq_get_mask(dev);" commands, 
first of which need strange "companions"
4. what else I can try to use instead of "printk"


Raimonds Cicans

--------------3764067B96C5A62C74F125ED
Content-Type: text/x-patch; charset=UTF-8;
 name="cx23885-core_risc_KASAN.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="cx23885-core_risc_KASAN.patch"

--- /usr/src/linux-5.10.27-gentoo__orig/drivers/media/pci/cx23885/cx23885-core.c	2021-04-03 09:20:56.609971911 +0300
+++ /usr/src/linux-5.10.27-gentoo/drivers/media/pci/cx23885/cx23885-core.c	2021-06-17 22:34:49.503333355 +0300
@@ -1517,6 +1517,10 @@
 	if (debug > 4)
 		cx23885_tsport_reg_dump(port);
 
+	printk(KERN_INFO);
+	cx23885_irq_get_mask(dev);
+	printk(KERN_INFO);
+
 	cx23885_irq_get_mask(dev);
 
 	/* clear dma in progress */

--------------3764067B96C5A62C74F125ED--
