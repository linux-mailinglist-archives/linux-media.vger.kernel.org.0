Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C075221421B
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 01:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgGCXz6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 19:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgGCXz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 19:55:56 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F7CC061794;
        Fri,  3 Jul 2020 16:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=5JgPLYhidepVsUvfsvPeR7vaaCRxGv4auJRjV9RJFZY=; b=3kcrbYo59z7B381JN+rsnt1SJq
        G4+2arvwiBb1HNgBYMFSocrsuebkB9sXw/IPD9IGRRWAVYdS7FrdpSSfwfqQb6nqSbHFoz5l7emNq
        gvKnwFs62QnfOHG2nbcEDDnFbRDfb6mPtOGOzXv+sv3vUXjV3+n5M2P4XhiYv3XXPorJ2/Yf5YyKm
        yQIy0Qaymu1Pe9qlrg2qlm7DF7FmVcXJyhENBGIAC4Zdi5sOyufkgQkgYqAhg+oPB6KLilLH7XMGF
        ovReyDp5pDo6PcC9HSvzkJJyTFKiW3cytCO9xbS4ysNEVt5BTUnXiqGympm99R1VBRujQmm2dhczq
        hlsfJjag==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrVX7-0005uW-FB; Fri, 03 Jul 2020 23:55:54 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 05/11] Documentation: userspace-api/media: dvb/net: drop doubled word
Date:   Fri,  3 Jul 2020 16:55:30 -0700
Message-Id: <20200703235536.30416-6-rdunlap@infradead.org>
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
 Documentation/userspace-api/media/dvb/net.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/userspace-api/media/dvb/net.rst
+++ linux-next-20200701/Documentation/userspace-api/media/dvb/net.rst
@@ -30,7 +30,7 @@ types that are present on the transport
 virtual ``dvb?_?`` network interfaces, and will be controlled/routed via
 the standard ip tools (like ip, route, netstat, ifconfig, etc).
 
-Data types and and ioctl definitions are defined via ``linux/dvb/net.h``
+Data types and ioctl definitions are defined via ``linux/dvb/net.h``
 header.
 
 
