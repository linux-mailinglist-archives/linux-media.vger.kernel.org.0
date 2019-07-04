Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 136995FEE2
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 01:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbfGDX56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 19:57:58 -0400
Received: from smtprelay0137.hostedemail.com ([216.40.44.137]:38067 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727644AbfGDX56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jul 2019 19:57:58 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 6ADDB181D33FC;
        Thu,  4 Jul 2019 23:57:57 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::,RULES_HIT:41:355:379:541:800:857:960:973:988:989:1260:1345:1359:1437:1534:1540:1711:1714:1730:1747:1777:1792:2393:2559:2562:3138:3139:3140:3141:3142:3350:3865:3867:3868:3871:4384:5007:6261:8603:10004:10848:11658:11914:12043:12297:12555:12895:13069:13138:13231:13311:13357:14096:14181:14384:14394:14721:21080:21627:21773:30009:30054,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:24,LUA_SUMMARY:none
X-HE-Tag: knife28_6279edf363622
X-Filterd-Recvd-Size: 1637
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Thu,  4 Jul 2019 23:57:56 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 3/8] media: m2m-deinterlace: Fix misuse of strscpy
Date:   Thu,  4 Jul 2019 16:57:43 -0700
Message-Id: <d29e3c34305c1c74648262fe122145aff265225e.1562283944.git.joe@perches.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1562283944.git.joe@perches.com>
References: <cover.1562283944.git.joe@perches.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Probable cut&paste typo - use the correct field size.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/media/platform/m2m-deinterlace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index beb7fd7442fb..dd573d23d0ce 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -436,7 +436,7 @@ static int vidioc_querycap(struct file *file, void *priv,
 {
 	strscpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver));
 	strscpy(cap->card, MEM2MEM_NAME, sizeof(cap->card));
-	strscpy(cap->bus_info, MEM2MEM_NAME, sizeof(cap->card));
+	strscpy(cap->bus_info, MEM2MEM_NAME, sizeof(cap->bus_info));
 	/*
 	 * This is only a mem-to-mem video device. The capture and output
 	 * device capability flags are left only for backward compatibility
-- 
2.15.0

