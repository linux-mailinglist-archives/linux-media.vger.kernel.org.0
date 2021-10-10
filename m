Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC0042836B
	for <lists+linux-media@lfdr.de>; Sun, 10 Oct 2021 21:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhJJTkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Oct 2021 15:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbhJJTki (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Oct 2021 15:40:38 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3420C061570;
        Sun, 10 Oct 2021 12:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=D36anXYT66Tw0vGET6GPozDF3jPQy6fMETODmwssbmY=; b=Zqkwie5kC+sD6J+m8V4GOx3jVJ
        /rUqhnK1X3WUXMqNGNjFUP5SLZKv1mW+vc6OdFKA4VB6Z8q8HmvlCCykfYPawWUzPYKxgaenqFg33
        OCfTKRf1qjxe6cvrXmrWZyiGOcWzkZyY/UxsuJeq7Ay3HViBJor4cMdqW7uJiZWfTXEIlm280BjMz
        mXpJiXv9sJK+sWm4X+hodeXj8MzT0b/OsqvGVfgO2Zfww+1F/Qjb+SEaZkYfYWby3cUyMUJ9JHJwq
        zDpVexOAoxOs/l5RzDuucEdwg+eqrxSzmtWIap3Rvgg/qHXdigIUGFg1O3rCaR1ew9DChVok4iF2N
        2oRgFBEw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mZeeb-007JXi-6r; Sun, 10 Oct 2021 19:38:37 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-um@lists.infradead.org,
        Richard Weinberger <richard@nod.at>
Subject: [PATCH] media: ivtv: fix build for UML
Date:   Sun, 10 Oct 2021 12:38:36 -0700
Message-Id: <20211010193836.32300-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prevent the use of page table macros and types from 2 conflicting
places. This fixes multiple build errors and warnings, e.g.:

../arch/x86/include/asm/pgtable_64_types.h:21:34: error: conflicting types for ‘pte_t’
 typedef struct { pteval_t pte; } pte_t;
                                  ^~~~~
In file included from ../include/linux/mm_types_task.h:16:0,
                 from ../include/linux/mm_types.h:5,
                 from ../include/linux/buildid.h:5,
                 from ../include/linux/module.h:14,
                 from ../drivers/media/pci/ivtv/ivtv-driver.h:40,
                 from ../drivers/media/pci/ivtv/ivtvfb.c:29:
../arch/um/include/asm/page.h:57:39: note: previous declaration of ‘pte_t’ was here
 typedef struct { unsigned long pte; } pte_t;

../arch/x86/include/asm/pgtable_types.h:284:43: error: expected ‘)’ before ‘prot’
 static inline pgprot_t pgprot_nx(pgprot_t prot)
                                           ^
../include/linux/pgtable.h:914:26: note: in definition of macro ‘pgprot_nx’
 #define pgprot_nx(prot) (prot)
                          ^~~~
In file included from ../arch/x86/include/asm/memtype.h:6:0,
                 from ../drivers/media/pci/ivtv/ivtvfb.c:40:
../arch/x86/include/asm/pgtable_types.h:288:0: warning: "pgprot_nx" redefined
 #define pgprot_nx pgprot_nx

../arch/x86/include/asm/page_types.h:11:0: warning: "PAGE_SIZE" redefined
 #define PAGE_SIZE  (_AC(1,UL) << PAGE_SHIFT)
 
In file included from ../include/linux/mm_types_task.h:16:0,
                 from ../include/linux/mm_types.h:5,
                 from ../include/linux/buildid.h:5,
                 from ../include/linux/module.h:14,
                 from ../drivers/media/pci/ivtv/ivtv-driver.h:40,
                 from ../drivers/media/pci/ivtv/ivtvfb.c:29:
../arch/um/include/asm/page.h:14:0: note: this is the location of the previous definition
 #define PAGE_SIZE (_AC(1, UL) << PAGE_SHIFT)

Fixes: 68f5d3f3b654 ("um: add PCI over virtio emulation driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
---
 drivers/media/pci/ivtv/ivtvfb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20211007.orig/drivers/media/pci/ivtv/ivtvfb.c
+++ linux-next-20211007/drivers/media/pci/ivtv/ivtvfb.c
@@ -36,7 +36,7 @@
 #include <linux/fb.h>
 #include <linux/ivtvfb.h>
 
-#ifdef CONFIG_X86_64
+#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
 #include <asm/memtype.h>
 #endif
 
@@ -1157,7 +1157,7 @@ static int ivtvfb_init_card(struct ivtv
 {
 	int rc;
 
-#ifdef CONFIG_X86_64
+#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
 	if (pat_enabled()) {
 		if (ivtvfb_force_pat) {
 			pr_info("PAT is enabled. Write-combined framebuffer caching will be disabled.\n");
