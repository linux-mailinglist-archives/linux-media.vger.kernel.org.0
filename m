Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937D283D20
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 00:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfHFWBl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Aug 2019 18:01:41 -0400
Received: from merlin.infradead.org ([205.233.59.134]:37282 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfHFWBk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Aug 2019 18:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=j7p6yu1zYMTbxVSuHys2Gu71VuuXWlVpRq95oDO3UQQ=; b=ilSYD6l49w70pOQDzbwknDICh4
        3RqLwV+7YZ9vt2Nt5TqtBej4kyBb8FDVExbPnQdqgC4iH233950VSfQqjNB1jqHAT9agQqcnKggn1
        1Zj+e/DRtxdb9fGWC+wjeN1rKk4H27vzRfcqE9whwEC0CjcSTXaM2BoueIuSDq3lvqSjA2ECelyIM
        2tlGQsuvq5kXjrSe3L1ZyRnls4OKCJRU4265dM8v5Z/85emI35hRc5RIi0SSunTggjT3Nwxi3s/Rc
        k6S8Qor94c5Scxoa/ndlHLKBrI3Fde3zRX9s/Br16ZzzMAAY/1bh6aw1QEk5NclR3ToDDtm079Kgw
        +sLJYttg==;
Received: from [208.71.200.96] (helo=[172.16.195.104])
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hv7WV-0007y4-6u; Tue, 06 Aug 2019 22:01:39 +0000
To:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] media/platform: fsl-viu.c: fix build for MICROBLAZE
Message-ID: <6dad6b40-19b9-b2da-3549-0484f961ea2f@infradead.org>
Date:   Tue, 6 Aug 2019 15:01:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

arch/microblaze/ defines out_be32() and in_be32(), so don't do that
again in the driver source.

Fixes these build warnings:

../drivers/media/platform/fsl-viu.c:36: warning: "out_be32" redefined
../arch/microblaze/include/asm/io.h:50: note: this is the location of the previous definition
../drivers/media/platform/fsl-viu.c:37: warning: "in_be32" redefined
../arch/microblaze/include/asm/io.h:53: note: this is the location of the previous definition

Fixes: 29d750686331 ("media: fsl-viu: allow building it with COMPILE_TEST")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 drivers/media/platform/fsl-viu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-53-rc3.orig/drivers/media/platform/fsl-viu.c
+++ lnx-53-rc3/drivers/media/platform/fsl-viu.c
@@ -32,7 +32,7 @@
 #define VIU_VERSION		"0.5.1"
 
 /* Allow building this driver with COMPILE_TEST */
-#ifndef CONFIG_PPC
+#if !defined(CONFIG_PPC) && !defined(CONFIG_MICROBLAZE)
 #define out_be32(v, a)	iowrite32be(a, (void __iomem *)v)
 #define in_be32(a)	ioread32be((void __iomem *)a)
 #endif

