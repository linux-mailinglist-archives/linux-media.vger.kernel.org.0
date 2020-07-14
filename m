Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9590B22006C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 00:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgGNWGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 18:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgGNWF7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 18:05:59 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1807C061755;
        Tue, 14 Jul 2020 15:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=/Mw4Z/fdkdR21K8cVbS9hUaN8eUG/lijb7MyGVaN9cg=; b=zNenY+Y1724E0C4bswxis7qE2v
        6Mv0BctQYlcT2mjZX3hZpFIDMHu/2wP7W3ve0qdUR8PwVA3vUrao706zumXA1MmABvgYe1wUVeCOX
        sFERBozJg56oPM/9r4bLGy3ht0W6i2j6vz364q1DgJaSOWMcdGwRdSnOe02GNvXXoJXyl/wxRRnU6
        tAFJCIT1if6ixk3Y4qI331GwiyjBMMLIpZLZ7380Qe+jtqZ0w+JciE7gj77M1qE20x7vz0Pnr5TQI
        0f6KXfnv7J9B/7ABDeyh+FX8BCl9s2bRTTF6d+RT1TCzQA666myuCOWh7cHF6LN/DUwdlCctvhghx
        BsrRNb5w==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jvT3l-0001IZ-1m; Tue, 14 Jul 2020 22:05:57 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/5] media/media-device.h: drop duplicated word in comment
Date:   Tue, 14 Jul 2020 15:05:49 -0700
Message-Id: <20200714220553.20294-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Delete the doubled word "the" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 include/media/media-device.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200714.orig/include/media/media-device.h
+++ linux-next-20200714/include/media/media-device.h
@@ -128,7 +128,7 @@ struct media_device_ops {
  *
  * Use-case: find tuner entity connected to the decoder
  * entity and check if it is available, and activate the
- * the link between them from @enable_source and deactivate
+ * link between them from @enable_source and deactivate
  * from @disable_source.
  *
  * .. note::
