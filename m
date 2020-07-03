Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95EE214207
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 01:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgGCXzz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 19:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbgGCXzx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 19:55:53 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F98AC061794;
        Fri,  3 Jul 2020 16:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=B7Agd9VFNc/M+6Rnf3JjcxSaSmaMsPDpFgYMSTLxoDU=; b=q5tj3vcuTQeIsLrHIIdmionwkp
        GHt6vJ/BTBDIn7r9lcihRDLyrW7LaE0+PfzfYpTQrzCDtQpCx6p0x1ga7Kzn5w5056JAZb/FGp2wK
        gu1qBSVBVhdDU9AcFhdSS9sYN/HmeaY647b5cMuZW9DLmDfnY5yOdGVudgA8o6WlH6BYGJTh4EQxS
        thKGq9C4QoJbdZDgbDfPnd+LQf/3KRSSom7MckX9rzO+6z9d6uCBCpxIR9JCNFTskEGQVsxaQHE56
        OJWaEwUzMM4stvnY2d/0ryxFs4ZSoF/vpirusKPrwHZgnSmIWhQ4t4eqTfGKhIT56iBz24U/2j1iB
        syRiS8Hg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrVX5-0005uW-0W; Fri, 03 Jul 2020 23:55:51 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 04/11] Documentation: userspace-api/media: dvb/dmx-qbuf: drop doubled word
Date:   Fri,  3 Jul 2020 16:55:29 -0700
Message-Id: <20200703235536.30416-5-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200703235536.30416-1-rdunlap@infradead.org>
References: <20200703235536.30416-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the doubled word "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 Documentation/userspace-api/media/dvb/dmx-qbuf.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/userspace-api/media/dvb/dmx-qbuf.rst
+++ linux-next-20200701/Documentation/userspace-api/media/dvb/dmx-qbuf.rst
@@ -57,7 +57,7 @@ by a :ref:`DMX_QUERYBUF` ioctl will do a
 When ``DMX_QBUF`` is called with a pointer to this structure, it locks the
 memory pages of the buffer in physical memory, so they cannot be swapped
 out to disk. Buffers remain locked until dequeued, until the
-the device is closed.
+device is closed.
 
 Applications call the ``DMX_DQBUF`` ioctl to dequeue a filled
 (capturing) buffer from the driver's outgoing queue.
