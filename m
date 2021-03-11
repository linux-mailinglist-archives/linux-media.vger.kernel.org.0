Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5282337360
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 14:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbhCKNFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 08:05:46 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:46019 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233188AbhCKNFn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 08:05:43 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KL0UlP2b65C8yKL0XleWkW; Thu, 11 Mar 2021 14:05:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615467941; bh=1VLDvoUeByWqGKve7M1tWlCP9LyDaZueJX5AXgX6AD4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LM8TYmXT41KkK0wvYxWgnJETi+RL+1yROAh0+k36DBU4f0zj766qsjvGZiRoKIMDg
         TAA41+PxLA/dNREvXTL45rfgCx9UHK8oh2nvq3mYko5a8/oHTnTEF9v7Budh3I2FXC
         tOu6SCICeS4Q7E2vKFqR5z6dCA0tOeHIFLQy94kwTCZjywyalt9viSqf0JyVhsN9IO
         dSqUGlDWhI6jTs80yQ8Pk4rlnNIzq9of0n1ubOWwefsOLoDDC2TzrMn7G7wEaVCaTT
         Y7/DUhVWjdgjdz+2Zx/BXdM/aMDw3rEYS8aGp+LlnSWusrrHoMNdRrgZmEI9ilpZ7L
         I00C4YxA5RDvw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-dev.c: show which events are requested by poll()
Message-ID: <a006a02c-8f93-b5f0-c898-b4e1227dc41b@xs4all.nl>
Date:   Thu, 11 Mar 2021 14:05:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOO0w3TOUOfBDOIwuxEDEBFkAe0rZ7PeLFV22OsN8AMAyeq4o4wfJat2gQ2dyLgopwWRZGp062wYKLa3O+mKhN+ElYrirtg4QRsG5Osik3INCccjKg16
 KmVTK+zd0+MRTVAzcAaNH8amIloCJanoTxKFhhhvKBK+kDxTwKk92qUciBixbiylHiooI7c5VBndAfZT9KlEtSPaf8ikZnmR6Vs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This helps debugging poll problems.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index b6a72d297775..7d0edf3530be 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -350,8 +350,9 @@ static __poll_t v4l2_poll(struct file *filp, struct poll_table_struct *poll)
 			res = vdev->fops->poll(filp, poll);
 	}
 	if (vdev->dev_debug & V4L2_DEV_DEBUG_POLL)
-		dprintk("%s: poll: %08x\n",
-			video_device_node_name(vdev), res);
+		dprintk("%s: poll: %08x %08x\n",
+			video_device_node_name(vdev), res,
+			poll_requested_events(poll));
 	return res;
 }

