Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2624A4B990B
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 07:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235456AbiBQGQJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 01:16:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235318AbiBQGQH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 01:16:07 -0500
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907A82A228B
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 22:15:52 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 62E1E580215;
        Thu, 17 Feb 2022 01:08:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 17 Feb 2022 01:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:date:date:from:from:in-reply-to:in-reply-to:message-id
        :references:reply-to:sender:subject:subject:to:to; s=fm2; bh=cqr
        v/dOrN6fuOfAAOyBkzAfK/pv+WlNEuU+tCqC0PwE=; b=EiVoKN6gLzpmfI47yfQ
        +vtXxIngEqzT8T+u8RPsv8Ceic5qaNKlUNpyF53OKnDm12G7f+ZR8XoreYDotIz7
        f6b26LJXLv85JZOVyEDHHTwTT+7ZUCr2AyXDYko+rq/3/XUZgSuStQa2aEC6vBor
        sw1XPZMJ0ActGzmZGwtm4FPHlHeJomEde9dreOrHxnjrJRVhijzz5Wj5gbrxDsC/
        gK53tYPjEFPECD0zNdmKgkwMrlMWmkog9ATtRXAKZXoDbjhuGyWOfAEfA+AXZGtI
        LYEjNcG3KUWc/wZ5k39uSm0HHcycp+xV0MNS5CsLhL4tO/MI9dcVY3uZLsCux+A1
        PLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:date:date:from:from:in-reply-to
        :in-reply-to:message-id:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=cqrv/dOrN6fuOfAAOyBkzAfK/pv+WlNEuU+tCqC0P
        wE=; b=gdDcIAx8N/s3lUceOMv18gEY352XW0VyMD4zOwbyI9d0w5t7AxA8739jO
        cgVPNRLZlWDo8s+IXGDD6gyoPR3tonZVQ9CrDBOXyiQaPRGDNxtn4oyryq8ZAOK9
        V0IA/wiUgwjF1wnr3Mklq4PHyl5WqF/niafeoV353Xa89gb7b2lUJcMTpsJIQiDU
        ZqY6MHvhMFIl15pXwOV2gSIAUVDOhEOXidHZDj6ZjKFkJ58ngrYumhJAYSNGrzwz
        plhU8ZZTakC36R+R4N3+BSJa9ftTT1xuLfZKXzSm/lJOOPdcfCpdZYAhqcqcRVJT
        xYhV8a9M/lxi51iER8kPkeQoeLncg==
X-ME-Sender: <xms:TeYNYjpYtRC6Cd8pbd6aC9Tma2m-QI1J5TVEm_dBWZlg7IaVzAJeBw>
    <xme:TeYNYtrI6PMPBMLdb8zZa4VflKehRYkK8mFToaPJ5X0KleYXc_U0KpDzj8KOeBgTA
    BiZXqUhieCHpuGj6lA>
X-ME-Received: <xmr:TeYNYgO56SrjANGGqVESE3sUnWUeFgVUsV3srTKuHcpEta0qeIzOhgQMC_LP5sERDVPfCVco8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeejgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfsedttdertdertd
    dtnecuhfhrohhmpeffrghfnhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghs
    thhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepheduvdefhfeutdekhedvjeekve
    ejhedvheelfffftedvledvveeghfehhfffffdtnecuvehluhhsthgvrhfuihiivgepuden
    ucfrrghrrghmpehmrghilhhfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:TeYNYm7kY6-N4uPiCV49RXWjutFmdpDF-QRYXfTbAx38zg9IHCu7eA>
    <xmx:TeYNYi7bbqKV0mZhURQoyzv3EVJsjo6iWaxLghhTn6wlyILd680hTA>
    <xmx:TeYNYuhCbTUXm2XzT0dkhrZOPWh4kFEzEcRWTVZGK1HZoLldI-WlxA>
    <xmx:TeYNYrH8Ei_KT0fkPeb_L7ZibrAWxnkZCrVnMPeNLiwUxaKIk6lCxA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Feb 2022 01:08:10 -0500 (EST)
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de, dafna@fastmail.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com
Subject: [PATCH v3 3/4] media: stk1160: move transfer_buffer and urb to same struct 'stk1160_urb'
Date:   Thu, 17 Feb 2022 08:07:23 +0200
Message-Id: <20220217060724.7763-4-dafna@fastmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220217060724.7763-1-dafna@fastmail.com>
References: <20220217060724.7763-1-dafna@fastmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Instead of having two separated arrays, one for the urbs and
one for their buffers, have one array of a struct containing both.
In addition, the array is just 16 pointers, no need to dynamically
allocate it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/media/usb/stk1160/stk1160-v4l.c   |  2 +-
 drivers/media/usb/stk1160/stk1160-video.c | 52 ++++++++---------------
 drivers/media/usb/stk1160/stk1160.h       | 11 ++---
 3 files changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index 1aa953469402..ebf245d44005 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -232,7 +232,7 @@ static int stk1160_start_streaming(struct stk1160 *dev)
 
 	/* submit urbs and enables IRQ */
 	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
-		rc = usb_submit_urb(dev->isoc_ctl.urb[i], GFP_KERNEL);
+		rc = usb_submit_urb(dev->isoc_ctl.urb_ctl[i].urb, GFP_KERNEL);
 		if (rc) {
 			stk1160_err("cannot submit urb[%d] (%d)\n", i, rc);
 			goto out_uninit;
diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 92c8b1fba2b0..f3c0497a8539 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -347,7 +347,7 @@ void stk1160_cancel_isoc(struct stk1160 *dev)
 		 * We don't care for NULL pointer since
 		 * usb_kill_urb allows it.
 		 */
-		usb_kill_urb(dev->isoc_ctl.urb[i]);
+		usb_kill_urb(dev->isoc_ctl.urb_ctl[i].urb);
 	}
 
 	stk1160_dbg("all urbs killed\n");
@@ -366,30 +366,25 @@ void stk1160_free_isoc(struct stk1160 *dev)
 
 	for (i = 0; i < num_bufs; i++) {
 
-		urb = dev->isoc_ctl.urb[i];
+		urb = dev->isoc_ctl.urb_ctl[i].urb;
 		if (urb) {
 
-			if (dev->isoc_ctl.transfer_buffer[i]) {
+			if (dev->isoc_ctl.urb_ctl[i].transfer_buffer) {
 #ifndef CONFIG_DMA_NONCOHERENT
 				usb_free_coherent(dev->udev,
 					urb->transfer_buffer_length,
-					dev->isoc_ctl.transfer_buffer[i],
+					dev->isoc_ctl.urb_ctl[i].transfer_buffer,
 					urb->transfer_dma);
 #else
-				kfree(dev->isoc_ctl.transfer_buffer[i]);
+				kfree(dev->isoc_ctl.urb_ctl[i].transfer_buffer);
 #endif
 			}
 			usb_free_urb(urb);
-			dev->isoc_ctl.urb[i] = NULL;
+			dev->isoc_ctl.urb_ctl[i].urb = NULL;
 		}
-		dev->isoc_ctl.transfer_buffer[i] = NULL;
+		dev->isoc_ctl.urb_ctl[i].transfer_buffer = NULL;
 	}
 
-	kfree(dev->isoc_ctl.urb);
-	kfree(dev->isoc_ctl.transfer_buffer);
-
-	dev->isoc_ctl.urb = NULL;
-	dev->isoc_ctl.transfer_buffer = NULL;
 	dev->isoc_ctl.num_bufs = 0;
 
 	stk1160_dbg("all urb buffers freed\n");
@@ -429,19 +424,6 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 
 	dev->isoc_ctl.buf = NULL;
 	dev->isoc_ctl.max_pkt_size = dev->max_pkt_size;
-	dev->isoc_ctl.urb = kcalloc(num_bufs, sizeof(void *), GFP_KERNEL);
-	if (!dev->isoc_ctl.urb) {
-		stk1160_err("out of memory for urb array\n");
-		return -ENOMEM;
-	}
-
-	dev->isoc_ctl.transfer_buffer = kcalloc(num_bufs, sizeof(void *),
-						GFP_KERNEL);
-	if (!dev->isoc_ctl.transfer_buffer) {
-		stk1160_err("out of memory for usb transfers\n");
-		kfree(dev->isoc_ctl.urb);
-		return -ENOMEM;
-	}
 
 	/* allocate urbs and transfer buffers */
 	for (i = 0; i < num_bufs; i++) {
@@ -449,15 +431,17 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 		urb = usb_alloc_urb(max_packets, GFP_KERNEL);
 		if (!urb)
 			goto free_i_bufs;
-		dev->isoc_ctl.urb[i] = urb;
+		dev->isoc_ctl.urb_ctl[i].urb = urb;
 
 #ifndef CONFIG_DMA_NONCOHERENT
-		dev->isoc_ctl.transfer_buffer[i] = usb_alloc_coherent(dev->udev,
-			sb_size, GFP_KERNEL, &urb->transfer_dma);
+		dev->isoc_ctl.urb_ctl[i].transfer_buffer =
+			usb_alloc_coherent(dev->udev, sb_size, GFP_KERNEL,
+					   &urb->transfer_dma);
 #else
-		dev->isoc_ctl.transfer_buffer[i] = kmalloc(sb_size, GFP_KERNEL);
+		dev->isoc_ctl.urb_ctl[i].transfer_buffer =
+			kmalloc(sb_size, GFP_KERNEL);
 #endif
-		if (!dev->isoc_ctl.transfer_buffer[i]) {
+		if (!dev->isoc_ctl.urb_ctl[i].transfer_buffer) {
 			stk1160_err("cannot alloc %d bytes for tx[%d] buffer\n",
 				sb_size, i);
 
@@ -466,14 +450,14 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 				goto free_i_bufs;
 			goto nomore_tx_bufs;
 		}
-		memset(dev->isoc_ctl.transfer_buffer[i], 0, sb_size);
+		memset(dev->isoc_ctl.urb_ctl[i].transfer_buffer, 0, sb_size);
 
 		/*
 		 * FIXME: Where can I get the endpoint?
 		 */
 		urb->dev = dev->udev;
 		urb->pipe = usb_rcvisocpipe(dev->udev, STK1160_EP_VIDEO);
-		urb->transfer_buffer = dev->isoc_ctl.transfer_buffer[i];
+		urb->transfer_buffer = dev->isoc_ctl.urb_ctl[i].transfer_buffer;
 		urb->transfer_buffer_length = sb_size;
 		urb->complete = stk1160_isoc_irq;
 		urb->context = dev;
@@ -508,8 +492,8 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 	 * enough to work fine, so we just free the extra urb,
 	 * store the allocated count and keep going, fingers crossed!
 	 */
-	usb_free_urb(dev->isoc_ctl.urb[i]);
-	dev->isoc_ctl.urb[i] = NULL;
+	usb_free_urb(dev->isoc_ctl.urb_ctl[i].urb);
+	dev->isoc_ctl.urb_ctl[i].urb = NULL;
 
 	stk1160_warn("%d urbs allocated. Trying to continue...\n", i);
 
diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
index a70963ce8753..0c355bb078c1 100644
--- a/drivers/media/usb/stk1160/stk1160.h
+++ b/drivers/media/usb/stk1160/stk1160.h
@@ -84,6 +84,11 @@ struct stk1160_buffer {
 	unsigned int pos;		/* current pos inside buffer */
 };
 
+struct stk1160_urb {
+	struct urb *urb;
+	char *transfer_buffer;
+};
+
 struct stk1160_isoc_ctl {
 	/* max packet size of isoc transaction */
 	int max_pkt_size;
@@ -91,11 +96,7 @@ struct stk1160_isoc_ctl {
 	/* number of allocated urbs */
 	int num_bufs;
 
-	/* urb for isoc transfers */
-	struct urb **urb;
-
-	/* transfer buffers for isoc transfer */
-	char **transfer_buffer;
+	struct stk1160_urb urb_ctl[STK1160_NUM_BUFS];
 
 	/* current buffer */
 	struct stk1160_buffer *buf;
-- 
2.17.1

