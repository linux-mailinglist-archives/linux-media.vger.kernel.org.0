Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54FB45B87C
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 11:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240755AbhKXKmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 05:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237614AbhKXKmL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 05:42:11 -0500
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B312C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 02:39:01 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ppg1mdsZ4CMnAppg4mvP8b; Wed, 24 Nov 2021 11:39:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637750340; bh=7o5rAGhOOfdVN/rMBBsB1/dZXwVG7+ZtXo702sGxRKI=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GsXiXUEXOu4GzPxYPNQf7SZokFasT/z+mychqn5kJgS7+Wn2P5bGBbp5g3BXuYW6E
         7IrQFtJ2pZW8nkWp7m3aaBrMwEZ8zx7aQSnMlNcsOn94MJK27jyNnelVmELPAfrvEG
         ouEzznK1K71UiLt3LOgZCBQ5mItF5OTpsTmCPmSaBuW774Eu2uDJ7WrPuUstqERSsy
         7BEDpe2uk5d2zBHJG8yUPhjGU4rlLDA98MjgCjjIQu6IKPqJ2vfK0mfESMtDg9/QTy
         s7JUd7wPu5j5tfwDB4vBcbaDu4yh2b7/TGxIKgrG47FjOpIE4HupviTLG0jgYKA9IF
         HpkTpIoZlbtog==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] cec: safely unhook lists in cec_data
Message-ID: <6049e9e4-0c65-d965-b26e-ada225e536eb@xs4all.nl>
Date:   Wed, 24 Nov 2021 11:38:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAP7KVfM0R0FJ2ExwPmM8F5dNQoMPj1SFjmhugUFMBIz6XE10nCZ1OnwpEm+LIWT4tdy61t9CmTNGfF+oxRuUC2PiqJmeDb6OQi9DG3XK4EaR+JjYp+U
 Wol/4k0wNBnwU/hLedH58EdLuDeXwJgr+DCFak5BermNDhu3M101UzsVhS6t3YaVwBG1I+Uk+2AVm/vyHGFHlTAzLuzbPFJ2VeU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

smatch warns about data->list not being removed from list:

drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list

It is a false warning, but it doesn't hurt to make the code more robust
and safely unhook data->list and data->xfer_list together with a WARN_ON
if this is actually ever needed (this really shouldn't happen).

Note that fixing the data->list warning just replaced it with a new similar warning
for data->xfer_list, so both needed to be addressed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 8 +++++++-
 drivers/media/cec/core/cec-api.c  | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 79fa36de8a04..3eea1d6a9308 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -342,7 +342,7 @@ static void cec_data_completed(struct cec_data *data)
 	 * Without that we would be referring to a closed filehandle.
 	 */
 	if (data->fh)
-		list_del(&data->xfer_list);
+		list_del_init(&data->xfer_list);

 	if (data->blocking) {
 		/*
@@ -898,6 +898,8 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,

 	if (fh)
 		list_add_tail(&data->xfer_list, &fh->xfer_list);
+	else
+		INIT_LIST_HEAD(&data->xfer_list);

 	list_add_tail(&data->list, &adap->transmit_queue);
 	adap->transmit_queue_sz++;
@@ -923,6 +925,10 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,

 	/* The transmit completed (possibly with an error) */
 	*msg = data->msg;
+	if (WARN_ON(!list_empty(&data->list)))
+		list_del(&data->list);
+	if (WARN_ON(!list_empty(&data->xfer_list)))
+		list_del(&data->xfer_list);
 	kfree(data);
 	return 0;
 }
diff --git a/drivers/media/cec/core/cec-api.c b/drivers/media/cec/core/cec-api.c
index 769e6b4cddce..0edb7142afdb 100644
--- a/drivers/media/cec/core/cec-api.c
+++ b/drivers/media/cec/core/cec-api.c
@@ -669,7 +669,7 @@ static int cec_release(struct inode *inode, struct file *filp)

 		data->blocking = false;
 		data->fh = NULL;
-		list_del(&data->xfer_list);
+		list_del_init(&data->xfer_list);
 	}
 	mutex_unlock(&adap->lock);
 	while (!list_empty(&fh->msgs)) {
-- 
2.33.0

