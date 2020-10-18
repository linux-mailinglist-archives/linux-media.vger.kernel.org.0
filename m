Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDD829197D
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 21:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbgJRTSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 15:18:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:56246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727389AbgJRTSS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 15:18:18 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC48922274;
        Sun, 18 Oct 2020 19:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048697;
        bh=lnUQmhdxI1R7NBgmIqelYj+WNGdFerjAL0lYGwFQWbo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XtBnOZeoFvqBTKestOwQX832jSprAuqFxtkf6ZcsOKv/UcWd0oZbS43RD59j52R/z
         dmmSNVNDPbS4d00jek7DyGaGQg9qTqobXreBCQDaYAi0CQJ6nB6GV3ryheavnFHEUt
         jo7fJJr2ZQHke6r5TLmgScXFglYbhCyRbXFxlY24=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>,
        syzbot+998261c2ae5932458f6c@syzkaller.appspotmail.com,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 008/111] media: ati_remote: sanity check for both endpoints
Date:   Sun, 18 Oct 2020 15:16:24 -0400
Message-Id: <20201018191807.4052726-8-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Oliver Neukum <oneukum@suse.com>

[ Upstream commit a8be80053ea74bd9c3f9a3810e93b802236d6498 ]

If you do sanity checks, you should do them for both endpoints.
Hence introduce checking for endpoint type for the output
endpoint, too.

Reported-by: syzbot+998261c2ae5932458f6c@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/rc/ati_remote.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/rc/ati_remote.c b/drivers/media/rc/ati_remote.c
index 9cdef17b4793f..c12dda73cdd53 100644
--- a/drivers/media/rc/ati_remote.c
+++ b/drivers/media/rc/ati_remote.c
@@ -835,6 +835,10 @@ static int ati_remote_probe(struct usb_interface *interface,
 		err("%s: endpoint_in message size==0? \n", __func__);
 		return -ENODEV;
 	}
+	if (!usb_endpoint_is_int_out(endpoint_out)) {
+		err("%s: Unexpected endpoint_out\n", __func__);
+		return -ENODEV;
+	}
 
 	ati_remote = kzalloc(sizeof (struct ati_remote), GFP_KERNEL);
 	rc_dev = rc_allocate_device(RC_DRIVER_SCANCODE);
-- 
2.25.1

