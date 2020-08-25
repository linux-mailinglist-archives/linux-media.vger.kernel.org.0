Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EACC725111C
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 06:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729002AbgHYE63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 00:58:29 -0400
Received: from smtprelay0089.hostedemail.com ([216.40.44.89]:49330 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728858AbgHYE5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 00:57:23 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 079EE18029120;
        Tue, 25 Aug 2020 04:57:22 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:541:800:960:973:988:989:1260:1311:1314:1345:1359:1437:1515:1534:1541:1711:1714:1730:1747:1777:1792:2393:2559:2562:3138:3139:3140:3141:3142:3350:3867:3868:3871:4250:5007:6119:6261:10004:10848:11026:11657:11658:11914:12043:12297:12438:12555:12895:13069:13311:13357:13894:14181:14384:14394:14721:21080:21433:21627:21774:30054,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: grape42_3f0c59a27059
X-Filterd-Recvd-Size: 1932
Received: from joe-laptop.perches.com (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Tue, 25 Aug 2020 04:57:20 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 21/29] media: atomisp: Avoid comma separated statements
Date:   Mon, 24 Aug 2020 21:56:18 -0700
Message-Id: <83f22b4ca8b26d301894638c5b8c571ac0004a5e.1598331149.git.joe@perches.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use semicolons and braces.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 6ba817f15655..52b9fb18c87f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -410,8 +410,10 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 
 		if (atomisp_subdev_format_conversion(isp_sd,
 						     isp_sd->capture_pad)
-		    && crop[pad]->width && crop[pad]->height)
-			crop[pad]->width -= padding_w, crop[pad]->height -= padding_h;
+		    && crop[pad]->width && crop[pad]->height) {
+			crop[pad]->width -= padding_w;
+			crop[pad]->height -= padding_h;
+		}
 
 		/* if subdev type is SOC camera,we do not need to set DVS */
 		if (isp->inputs[isp_sd->input_curr].type == SOC_CAMERA)
-- 
2.26.0

