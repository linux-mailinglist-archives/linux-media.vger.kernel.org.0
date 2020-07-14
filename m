Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0879220069
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 00:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgGNWGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 18:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbgGNWGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 18:06:08 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9EFC061755;
        Tue, 14 Jul 2020 15:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=sEC3GECGGriLAjq682rFs/rAVVPnKopizBAWjalqIgc=; b=VOCBCUt89a4D7coqUDP4q4Cccr
        ED+KkWDYuWrOzBaqCozPChSdegDJYgGVeCHiFm4orMLtE+zEwscLs22ORhsmpofvRjBCt4GTEtqFO
        CZXQHPMLdueztyggn2cxBnefIz2iw73mS2ySbhHflapPUbYH9SAVpssu9OpJqnCjGwO+vEuim6jW9
        z4Z07L8eLYNZtk4aR62ZMUXFd0zpddO0R2XQJSX+VHXyITiG0WrkCQbW6R61hKEfePdAtZIfZ+cqI
        yD6ggsJZ+Zrr3a4JIskFeCyrb+vIYW56LgX8WDbRoBZYEHXB8qldO3OWdl4iQNCXY21wWBKMOHr4f
        VW26v3CA==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jvT3t-0001IZ-A7; Tue, 14 Jul 2020 22:06:05 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 5/5] media/v4l2-subdev.h: drop duplicated word in comment
Date:   Tue, 14 Jul 2020 15:05:53 -0700
Message-Id: <20200714220553.20294-5-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714220553.20294-1-rdunlap@infradead.org>
References: <20200714220553.20294-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Delete the doubled words "the" in comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 include/media/v4l2-subdev.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20200714.orig/include/media/v4l2-subdev.h
+++ linux-next-20200714/include/media/v4l2-subdev.h
@@ -566,9 +566,9 @@ struct v4l2_subdev_ir_parameters {
  *
  * @rx_read: Reads received codes or pulse width data.
  *	The semantics are similar to a non-blocking read() call.
- * @rx_g_parameters: Get the current operating parameters and state of the
+ * @rx_g_parameters: Get the current operating parameters and state of
  *	the IR receiver.
- * @rx_s_parameters: Set the current operating parameters and state of the
+ * @rx_s_parameters: Set the current operating parameters and state of
  *	the IR receiver.  It is recommended to call
  *	[rt]x_g_parameters first to fill out the current state, and only change
  *	the fields that need to be changed.  Upon return, the actual device
@@ -582,9 +582,9 @@ struct v4l2_subdev_ir_parameters {
  *
  * @tx_write: Writes codes or pulse width data for transmission.
  *	The semantics are similar to a non-blocking write() call.
- * @tx_g_parameters: Get the current operating parameters and state of the
+ * @tx_g_parameters: Get the current operating parameters and state of
  *	the IR transmitter.
- * @tx_s_parameters: Set the current operating parameters and state of the
+ * @tx_s_parameters: Set the current operating parameters and state of
  *	the IR transmitter.  It is recommended to call
  *	[rt]x_g_parameters first to fill out the current state, and only change
  *	the fields that need to be changed.  Upon return, the actual device
