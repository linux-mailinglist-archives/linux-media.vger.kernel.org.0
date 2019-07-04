Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5DE5FEDF
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 01:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbfGDX6S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 19:58:18 -0400
Received: from smtprelay0121.hostedemail.com ([216.40.44.121]:36085 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727390AbfGDX57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jul 2019 19:57:59 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id CA77718224D86;
        Thu,  4 Jul 2019 23:57:58 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::,RULES_HIT:41:355:379:541:800:960:973:988:989:1260:1345:1359:1437:1534:1540:1567:1711:1714:1730:1747:1777:1792:2393:2559:2562:3138:3139:3140:3141:3142:3865:4321:4384:5007:6261:8603:10004:10848:11657:11658:11914:12043:12297:12555:12895:13069:13138:13231:13311:13357:14096:14181:14384:14394:14721:21080:21627:30009:30029:30054,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:22,LUA_SUMMARY:none
X-HE-Tag: pig35_62a88801a8023
X-Filterd-Recvd-Size: 1590
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Thu,  4 Jul 2019 23:57:57 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] media: go7007: Fix misuse of strscpy
Date:   Thu,  4 Jul 2019 16:57:44 -0700
Message-Id: <9eb80bdbfdb6a2c33e8a1804e687f5a858036666.1562283944.git.joe@perches.com>
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
 drivers/media/usb/go7007/snd-go7007.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/go7007/snd-go7007.c b/drivers/media/usb/go7007/snd-go7007.c
index 4a449c62fc32..b05fa227ffb2 100644
--- a/drivers/media/usb/go7007/snd-go7007.c
+++ b/drivers/media/usb/go7007/snd-go7007.c
@@ -253,7 +253,7 @@ int go7007_snd_init(struct go7007 *go)
 		return ret;
 	}
 	strscpy(gosnd->card->driver, "go7007", sizeof(gosnd->card->driver));
-	strscpy(gosnd->card->shortname, go->name, sizeof(gosnd->card->driver));
+	strscpy(gosnd->card->shortname, go->name, sizeof(gosnd->card->shortname));
 	strscpy(gosnd->card->longname, gosnd->card->shortname,
 		sizeof(gosnd->card->longname));
 
-- 
2.15.0

