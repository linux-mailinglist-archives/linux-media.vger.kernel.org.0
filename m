Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE662143BC
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 05:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgGDDqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 23:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728051AbgGDDqh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 23:46:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E970BC061794;
        Fri,  3 Jul 2020 20:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=U9mKbOAg3310yWA876tLatVC/VjWDPAN5b9UMcsJebQ=; b=DXYvobCAAGspRYUmR/pIBkFojR
        Y0QJR6HZvC5rVKxM6EVEb6wfhxDfsFxIko7jLalsq/WBiN5Rpr31FtfZw7MB+7Ye50Kcf0SlCemdz
        nYvGYbf5FCe3XhS1CUh33YFrJbbHAkiWrIEhPOFurKyik2aU4gOyjwfSIvys2ldJlGWoWzmDsuZog
        rqjaWWO8PNIMSeGpLj+SwMIuoZHBwHzN8CeyAGktrUmE/UHJHBX2csPyNLThIibIRUkY5tqwCHF7u
        R19W6vfagl4wgd+u9M5sQeN7CREEJIse2zJ9ZOQRPwDmdNNJu2EL41en8YOubjZwAyBUrJV8QoVzO
        UVgo5mNw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrZ8M-0001Xb-5x; Sat, 04 Jul 2020 03:46:34 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        linux-iio@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Jon Mason <jdmason@kudzu.us>,
        Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>, linux-ntb@googlegroups.com,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Ira Weiny <ira.weiny@intel.com>, linux-nvdimm@lists.01.org,
        linux-usb@vger.kernel.org, Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH 16/17] Documentation/driver-api: media/v4l2-controls: drop doubled words
Date:   Fri,  3 Jul 2020 20:45:01 -0700
Message-Id: <20200704034502.17199-17-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200704034502.17199-1-rdunlap@infradead.org>
References: <20200704034502.17199-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the doubled words "type" and "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 Documentation/driver-api/media/v4l2-controls.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200701.orig/Documentation/driver-api/media/v4l2-controls.rst
+++ linux-next-20200701/Documentation/driver-api/media/v4l2-controls.rst
@@ -335,7 +335,7 @@ current and new values:
 	union v4l2_ctrl_ptr p_new;
 	union v4l2_ctrl_ptr p_cur;
 
-If the control has a simple s32 type type, then:
+If the control has a simple s32 type, then:
 
 .. code-block:: c
 
@@ -349,7 +349,7 @@ Within the control ops you can freely us
 themselves. The p_char pointers point to character buffers of length
 ctrl->maximum + 1, and are always 0-terminated.
 
-Unless the control is marked volatile the p_cur field points to the the
+Unless the control is marked volatile the p_cur field points to the
 current cached control value. When you create a new control this value is made
 identical to the default value. After calling v4l2_ctrl_handler_setup() this
 value is passed to the hardware. It is generally a good idea to call this
