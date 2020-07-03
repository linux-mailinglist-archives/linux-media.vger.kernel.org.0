Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E9A214205
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 01:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgGCXzw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 19:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgGCXzv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 19:55:51 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D673FC061794;
        Fri,  3 Jul 2020 16:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=1fQd92ew+IWLvkr0rRhrWawGLOzUR/lh62pUtOg+q1c=; b=TxNXNsy1aiE0Wn/MjQENoNKScR
        TlG2lqPAauXMIodVdBi1OTbE56+aA1hIqclczJYRfK8griSGAmZbEzQrzH2MtkWRmms+KVUgnAg1e
        E04lg275OdaSaqA9/yYaLBweAv8mrbnYEeemNqjiHGOAxaqtNKVfHPW0pWZGjsUNvRRC9eg79SWcU
        +AMj75LXqNN/RhVc6Zdz22EQIGiBgTX8mxbJF9HVfL/+HNBhr31/tmG/Gn5k2kPb0s0P8qNgrR2vx
        OQcv7PEBnlL9ucb4VrUGm2nIcnfkPAwpllIIMk4Js9agR+lttVFWU9x5Y0MBd+2+Kn6L3GgkbROVP
        CXNyRDAQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrVX2-0005uW-Hc; Fri, 03 Jul 2020 23:55:49 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 03/11] Documentation: userspace-api/media: dvb/demux: drop doubled word
Date:   Fri,  3 Jul 2020 16:55:28 -0700
Message-Id: <20200703235536.30416-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200703235536.30416-1-rdunlap@infradead.org>
References: <20200703235536.30416-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the doubled word "and".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 Documentation/userspace-api/media/dvb/demux.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/userspace-api/media/dvb/demux.rst
+++ linux-next-20200701/Documentation/userspace-api/media/dvb/demux.rst
@@ -18,7 +18,7 @@ digital TV. If the driver and hardware s
 implemented at the hardware. Otherwise, the Kernel provides a software
 emulation.
 
-It can be accessed through ``/dev/adapter?/demux?``. Data types and and
+It can be accessed through ``/dev/adapter?/demux?``. Data types and
 ioctl definitions can be accessed by including ``linux/dvb/dmx.h`` in
 your application.
 
