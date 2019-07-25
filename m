Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA3874875
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 09:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388534AbfGYHwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 03:52:25 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:58567 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388335AbfGYHwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 03:52:24 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qYY0hC9dQLqASqYY3hS5qC; Thu, 25 Jul 2019 09:52:23 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vivid: fix typo: use -> user
Message-ID: <42f73192-13ec-3d33-8c2e-0f099bb1490e@xs4all.nl>
Date:   Thu, 25 Jul 2019 09:52:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFQPDHA7qsBRr+V26yHUnb9BuHoOevAuMY7ltKiRgoj9aB6+v95Ze4uT0epOGJGmq5iD01njy8Nbip7FHbEnkykVUqFd9VmDQVCnbiJ3QHBQbpPbo8V9
 DSLeoRaWvT3M+ZHZRPl9TBByTH4grUwjT+SqoCXA481ujsA+kPM4PpyvrpdWBwZfrEZG3s3tUzRZCQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo in two comments.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index bc2a176937a4..8e1ebc94943e 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -792,7 +792,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	if (no_error_inj && ccs_cap == -1)
 		ccs_cap = 7;

-	/* if ccs_cap == -1, then the use can select it using controls */
+	/* if ccs_cap == -1, then the user can select it using controls */
 	if (ccs_cap != -1) {
 		dev->has_crop_cap = ccs_cap & 1;
 		dev->has_compose_cap = ccs_cap & 2;
@@ -807,7 +807,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	if (no_error_inj && ccs_out == -1)
 		ccs_out = 7;

-	/* if ccs_out == -1, then the use can select it using controls */
+	/* if ccs_out == -1, then the user can select it using controls */
 	if (ccs_out != -1) {
 		dev->has_crop_out = ccs_out & 1;
 		dev->has_compose_out = ccs_out & 2;
