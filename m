Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F18DE19DE35
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 20:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgDCSxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 14:53:01 -0400
Received: from a1i272.smtp2go.com ([43.228.185.16]:49385 "EHLO
        a1i272.smtp2go.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbgDCSxA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 14:53:00 -0400
X-Greylist: delayed 1153 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Apr 2020 14:53:00 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=smtpservice.net; s=m6sda0.a1-4.dyn; x=1585940880; h=Feedback-ID:
        X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
        List-Unsubscribe; bh=gHr98tVL9aHbHY4xsoNtdTUpIp+dJTf49J1SpMih0O8=; b=kTe03GJa
        8cF86uK7Y4yqaLPZDlikVwVJ0nVe6F+PoE6wRLkcDrPBJYW8Ky3celJPh8LXqyet4+nFFKrhb9mzQ
        0JwQb13w57RRGkprgQFpv6fC/wcF4u9l3UAryTPu1ukmdNmAwAgh+vXmfrOAz5HcpT6M5iYOGm0AX
        vUJZNJw62wYVaECebxtS+Abv9h75p0NYQ2DQ9vt01EBdE0eONeknNA/lIjAQ8riy1gbtrKSz69Fp3
        OeUUQkprYbVCzIwJwKOuYxHAPLnoXYx6qmmR2ywTT1YDnyGzXecKJ463I2NXEt8HcHcCWWEl8OLUE
        67nFclyq4BUMprlwBLFTBG7Xpg==;
Received: from [10.173.255.233] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <paulb@blazebox.homeip.net>)
 id 1jKR8Q-ItkDpC-9a; Fri, 03 Apr 2020 18:33:42 +0000
Received: from [10.162.83.196] (helo=mail.blazebox.homeip.net)
 by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <paulb@blazebox.homeip.net>)
 id 1jKR8P-IbZr7A-Tj; Fri, 03 Apr 2020 18:33:41 +0000
Received: from blazebox.homeip.net (localhost [127.0.0.1])
 by mail.blazebox.homeip.net (Postfix) with ESMTP id 3027961D014;
 Fri,  3 Apr 2020 14:33:41 -0400 (EDT)
X-Virus-Scanned: amavisd-new at blazebox.homeip.net
Received: from mail.blazebox.homeip.net ([127.0.0.1])
 by blazebox.homeip.net (mail.blazebox.homeip.net [127.0.0.1]) (amavisd-new,
 port 10024)
 with LMTP id XOzl195AJHOp; Fri,  3 Apr 2020 14:33:39 -0400 (EDT)
Received: from blaze.homeip.net (blaze
 [IPv6:2001:470:1f07:a3a:dc8:1e2:a6b:6125])
 by mail.blazebox.homeip.net (Postfix) with ESMTP id 989AC61D013;
 Fri,  3 Apr 2020 14:33:39 -0400 (EDT)
Received: by blaze.homeip.net (Postfix, from userid 4444)
 id 2673320B6D07; Fri,  3 Apr 2020 14:34:00 -0400 (EDT)
From:   Paul Blazejowski <paulb@blazebox.homeip.net>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] drivers/dma-buf/Kconfig: correct typo in description
Date:   Fri,  3 Apr 2020 14:33:34 -0400
Message-Id: <20200403183334.11440-1-paulb@blazebox.homeip.net>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: 1MKR8emPZr7jTM.h8GGnwbvF
Feedback-ID: 316702m:316702a3jAEqy:316702serdr6gnuv
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While running `make oldconfig` CONFIG_DMABUF_MOVE_NOTIFY
has a typo in Kconfig description, correct it.

Signed-off-by: Paul Blazejowski <paulb@blazebox.homeip.net>
---
 drivers/dma-buf/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index ef73b678419c..04dd09b1667b 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -43,10 +43,10 @@ config DMABUF_MOVE_NOTIFY
 	bool "Move notify between drivers (EXPERIMENTAL)"
 	default n
 	help
-	  Don''t pin buffers if the dynamic DMA-buf interface is available on both the
+	  Don't pin buffers if the dynamic DMA-buf interface is available on both the
 	  exporter as well as the importer. This fixes a security problem where
 	  userspace is able to pin unrestricted amounts of memory through DMA-buf.
-	  But marked experimental because we don''t jet have a consistent execution
+	  But marked experimental because we don't jet have a consistent execution
 	  context and memory management between drivers.
 
 config DMABUF_SELFTESTS
-- 
2.26.0

