Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37C13719FE
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 18:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbhECQiP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 12:38:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:38706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231644AbhECQhM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 12:37:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4E76613DC;
        Mon,  3 May 2021 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620059773;
        bh=Wh17wluSKUTBOWNzYuYLyW+TL60RDkDmKbWLKi2/MZc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NFN9L4dKHMGYcUHthXxuHmBs47vEJkz29dQm1lHVa5t/6jzo0Qwyq/WiJnF+xMhEe
         qFuHyk79Z2xubr1MDDg8xS/ZqW6T6B+rTtWHY8GhET2nuVSWIdOMKyBJbI/iVcbdtm
         iKWbD3DzWm5bW+t3nWJq0iwnHfyyPtgK4zxTINCLa87I0xeQFYz9OCOtg+JuAQeMBV
         jAGS3du9Oo4C+hT/E1yKzSNjR6PgGk1+hGUPoXtA/ErWOCtTQiJs6akwTr5k09y7s0
         njYJS838s/3bZlsl6s6x2a9LlCs3HXddKehyPmje7ytWwjMKFILRAbv+s4vwN+qrG9
         uEcOmAo30RBrA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Daniel Niv <danielniv3@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 038/134] media: media/saa7164: fix saa7164_encoder_register() memory leak bugs
Date:   Mon,  3 May 2021 12:33:37 -0400
Message-Id: <20210503163513.2851510-38-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163513.2851510-1-sashal@kernel.org>
References: <20210503163513.2851510-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel Niv <danielniv3@gmail.com>

[ Upstream commit c759b2970c561e3b56aa030deb13db104262adfe ]

Add a fix for the memory leak bugs that can occur when the
saa7164_encoder_register() function fails.
The function allocates memory without explicitly freeing
it when errors occur.
Add a better error handling that deallocate the unused buffers before the
function exits during a fail.

Signed-off-by: Daniel Niv <danielniv3@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/pci/saa7164/saa7164-encoder.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index 11e1eb6a6809..1d1d32e043f1 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -1008,7 +1008,7 @@ int saa7164_encoder_register(struct saa7164_port *port)
 		printk(KERN_ERR "%s() failed (errno = %d), NO PCI configuration\n",
 			__func__, result);
 		result = -ENOMEM;
-		goto failed;
+		goto fail_pci;
 	}
 
 	/* Establish encoder defaults here */
@@ -1062,7 +1062,7 @@ int saa7164_encoder_register(struct saa7164_port *port)
 			  100000, ENCODER_DEF_BITRATE);
 	if (hdl->error) {
 		result = hdl->error;
-		goto failed;
+		goto fail_hdl;
 	}
 
 	port->std = V4L2_STD_NTSC_M;
@@ -1080,7 +1080,7 @@ int saa7164_encoder_register(struct saa7164_port *port)
 		printk(KERN_INFO "%s: can't allocate mpeg device\n",
 			dev->name);
 		result = -ENOMEM;
-		goto failed;
+		goto fail_hdl;
 	}
 
 	port->v4l_device->ctrl_handler = hdl;
@@ -1091,10 +1091,7 @@ int saa7164_encoder_register(struct saa7164_port *port)
 	if (result < 0) {
 		printk(KERN_INFO "%s: can't register mpeg device\n",
 			dev->name);
-		/* TODO: We're going to leak here if we don't dealloc
-		 The buffers above. The unreg function can't deal wit it.
-		*/
-		goto failed;
+		goto fail_reg;
 	}
 
 	printk(KERN_INFO "%s: registered device video%d [mpeg]\n",
@@ -1116,9 +1113,14 @@ int saa7164_encoder_register(struct saa7164_port *port)
 
 	saa7164_api_set_encoder(port);
 	saa7164_api_get_encoder(port);
+	return 0;
 
-	result = 0;
-failed:
+fail_reg:
+	video_device_release(port->v4l_device);
+	port->v4l_device = NULL;
+fail_hdl:
+	v4l2_ctrl_handler_free(hdl);
+fail_pci:
 	return result;
 }
 
-- 
2.30.2

