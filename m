Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4801334A39C
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 10:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhCZJEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:04:36 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39487 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229768AbhCZJEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:04:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id PiNQl3s4Y43ycPiNTl3AiI; Fri, 26 Mar 2021 10:03:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616749415; bh=9gYBQ0x9ou3bfLqVYYoQqNrc1CRCKA4mF1DWFR906i8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZzwSLavtWUjyKS5FB2ZZ8aO+Fuk2EVK7ub9tFpZISa4yy+AQ57RDRQhHcmYFqni4q
         vTHTS4kdjOmO+30mUJDESton0RxtO0I7nu5rGhodf7JKNVIk23oDp0eUlTxBTzJmFD
         K2zZV7wOndxQG1LuUC6HbLYRn+71p0TMUd/6B4kdOO7k5TLJlHUGR8L6EFvsbEsK6c
         xTxk66IrsjBp7JD6WBgW/jiYHPQAMYU/D4U+blg99cmlnki7rjFpHAm+Bszo2MpKh9
         pFTtZBJJmrkGGmTRoYZ70eKv/AqX/9AFXg69M9j1/dkQMDPZxfCKWyLcuBvW8qbcNZ
         Ti15Lk95A3DDw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] adv7511-v4l2: correctly report EDIDs of 1 block
Message-ID: <9a769617-f555-f14f-1fea-71152b7c9e8f@xs4all.nl>
Date:   Fri, 26 Mar 2021 10:03:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGO0Ie1I1CRcC28cUGfZ3Av/k6pvT594Po4Vyq/hKYhk1sTRehq/FntNvqrMlD1not9JXLajwqdNcECIApfsQrPgwZil3ftzNEl+YR372psGjv/X4/Qt
 fUnLJpne5/TizUTRpsLBTm3zkR8N9XmFx+L6YWVDCxDca5VkXrRMbUGR/E6+RFp9fnHh6HUBW+2MppkxrPFehRECt6e3oBBkFUY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the EDID has an odd number of blocks (usually just 1, but the
same problem occurs with 3 blocks), then VIDIOC_G_EDID reported 2
(or 4) blocks. Fix this.

Signed-off-by: Hans Verkuil <hansverk@cisco.com>
---
 drivers/media/i2c/adv7511-v4l2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 9183003ae22d..992db5c79b13 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1196,21 +1196,21 @@ static int adv7511_get_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 		return -EINVAL;

 	if (edid->start_block == 0 && edid->blocks == 0) {
-		edid->blocks = state->edid.segments * 2;
+		edid->blocks = state->edid.blocks;
 		return 0;
 	}

-	if (state->edid.segments == 0)
+	if (state->edid.blocks == 0)
 		return -ENODATA;

-	if (edid->start_block >= state->edid.segments * 2)
+	if (edid->start_block >= state->edid.blocks)
 		return -EINVAL;

-	if (edid->start_block + edid->blocks > state->edid.segments * 2)
-		edid->blocks = state->edid.segments * 2 - edid->start_block;
+	if (edid->start_block + edid->blocks > state->edid.blocks)
+		edid->blocks = state->edid.blocks - edid->start_block;

 	memcpy(edid->edid, &state->edid.data[edid->start_block * 128],
-			128 * edid->blocks);
+	       128 * edid->blocks);

 	return 0;
 }
-- 
2.29.2

