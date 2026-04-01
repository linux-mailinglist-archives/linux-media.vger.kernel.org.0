Return-Path: <linux-media+bounces-57888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uElgEaQ8zWn5awYAu9opvQ
	(envelope-from <linux-media+bounces-57888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 17:41:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2CF37D528
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 17:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4310E3050BD0
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 15:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218013CEB88;
	Wed,  1 Apr 2026 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vdbB9F7z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7669A3A9DB2;
	Wed,  1 Apr 2026 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775057762; cv=none; b=FuzfXZeIBsl+CirQmmylNaZlTz3dpvO2LHao7+xZvpvAoWj51WOvCnN6o1MWXS0I1MidQNbX8woJckhq3nebBN5Zv5vo1RbEvLdCaUM8cn+wi/qh+XhLA8psUWGIx2J4LxK7oy6fKqLdFZu6tS9bPRbnQ1HEPF5RgzVYI4jdtgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775057762; c=relaxed/simple;
	bh=62fiRzIlB0LuN2BoHoHtPdkZTJJ0p6SufQDIUY7eSro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U9Rpvl5BPuUrHpQCuhTSkRgHdtTXwevuaDRrr57tU/fRGvINF1MpnI8LifHqLibepkakM0D5uYnr/P8zImRG1wic2D5wNb7ZP0Nkz9mI7XQKDu+zK3yYA5LiSU4n6HCC5vfKJ/FDNUCOqwaDcd5iZGCgPjNb7eyyvwJAITapj+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vdbB9F7z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5D7BE4E;
	Wed,  1 Apr 2026 17:34:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775057675;
	bh=62fiRzIlB0LuN2BoHoHtPdkZTJJ0p6SufQDIUY7eSro=;
	h=From:Date:Subject:To:Cc:From;
	b=vdbB9F7zHabSQcfi7ZBO4x70vJI4suGHMXB/GRd32COapSwpnLWdkp8QArjeYgNCf
	 mcwo1oKmDxBeMqhljCXIr1VyW8ojSgaa6yjNMNOME5A+WKBJ+o29zkTq/AXVAMPGZW
	 OOWGjXOZ+HDLntUtbSaM2nIg3xC8nh13+S/NB1Kc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 01 Apr 2026 17:35:37 +0200
Subject: [PATCH] media: rzv2h-ivc: Wait for frame end in stop_streaming
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-ivc-stop-streaming-v1-1-b7599982c280@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAEg7zWkC/x2MQQqAIBAAvxJ7TrCNEvtKdDDbbA9paEgQ/j3pM
 jCHmRcSRaYEU/NCpMyJg6/StQ3Yw3hHgrfqgBJH2fed4GxFusNVEcmc7J1AqzWiUqscJNTwirT
 z80/npZQPwTjivmQAAAA=
X-Change-ID: 20260331-ivc-stop-streaming-2c992277b050
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5297;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=HBtx5Ghb1fuQs0BuDtBLc5AqBUj4s1eusjaVua2vYCA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpzTtdNQjZkdljoMmJGmPGD5LZFvoPOuCpBNBOx
 3Yt/VgW2cmJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCac07XQAKCRByNAaPFqFW
 PHYzD/9af6mK4uuN4jtatUOnw67FxXbHGXTpV7XMVcgqJy41/7YWfSRPA58zWFXIuwXK1FSlEp0
 oWoYHcpyhO1ygYVJ+MfdeilYNrWvdklcnvRJWiB/9CZ4zmQUwhJ8amFBsBlNfV9HUM9eGUbenq4
 n7G7nXFbSgDOfjDKa+vlFi81HXcbnUfXLueFuPHlPytuhACzJ1JABDEvkok1NPoC1lyDVFovqMx
 uoytE1jyGbk8oxxP0f2/u663YqktQiIJH4gMozRUdyqYU3J05dNK9s4igvBsZZD1ILvdC6P2M4W
 YhKs2W8D/9z2ffVjiXUPb4p0wAkNLLCud2sbrK0q4hJP1ztXAnQATv8rxVi2q9HenVPCx9EHpKK
 fktXlZcLL0bK19p1sB8p9S+FkvGCre6o03c0rsOWB7ejAdY2ag647POfMwL/bYetXQRssLtBNdA
 jQyVZ2ZZE6Oqg7ZgrigAIRK53ASrmnEA0tUe4sfEOWwkkFac55tjK4yCNKrXpl15kbaVIRLavOG
 CUJFlArLaHSFp4J2hOuIb6MypIK9wisoIFP4JaPE7oXi2fQnsaZ6/OssZFfvYTb0jH/8Yp/lETw
 j4gTq1hZXM4o9AlW6k0NjoaaMCH6GHW/45M+5ZYPriDM+15TQAmgAL3eKE0ZlPeeGXL6yVlT7Lv
 clxYA5ohymZH0Gg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57888-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,10bi:email,10bit:email]
X-Rspamd-Queue-Id: DE2CF37D528
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The rzv2h-ivc driver fails to handle back-2-back streaming sessions that
do not go through a peripheral reset. As the driver uses an autosuspend
delay of 2 seconds, it is quite possible that two consecutive streaming
sessions won't go through a suspend/resume sequence.

If the peripheral is not reset the second streaming session hangs and no
frames are delivered to the ISP.

This is because the stop_streaming() procedure implemented in the driver
doesn't match what's prescribed by the chip datasheet:

1) The chip manual suggests to poll the RZV2H_IVC_FM_INT_STAT_STPEND bit
   of RZV2H_IVC_REG_FM_INT_STA instead of polling on RZV2H_IVC_REG_FM_STOP
   and prescribes to clear the bit after polling has completed

2) More importantly: the RZV2H_IVC_REG_FM_STOP_FSTOP bit has to be set
   on RZV2H_IVC_REG_FM_STOP -only- if a frame transfer to the ISP is in
   progress. Setting the RZV2H_IVC_REG_FM_STOP_FSTOP bit when no frame is
   being transferred causes the polling routine to timeout and the next
   streaming session fails to start

As a frame transfer of an image in 1920x1080@10bi takes 5 milliseconds
at most, it is quite possible that the frame transfer completion interrupt
races with the stop procedure.

Instead of forcing a frame transfer abort, simply wait for the
in-progress transfer to complete by polling the ivc->vvalid_ifp status
variable in an hand-rolled loop that allows to inspect the variable
while holding the spinlock, to allow the irq handler to complete the
current buffer.

With this change, streaming back-2-back without suspending the
peripheral works successfully.

Cc: stable@vger.kernel.org
Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
As detailed in the commit message, re-starting a streaming session
without going through a peripheral reset doesn't currently work.

I initially thought this is because the stop_streaming() procedure
implemented in the rzv2h-ivc driver does not comply with what is
prescribed by the chip manual.

So I went and modified it according to the manual.

Unfortunately, even by following the suggested procedure, once
RZV2H_IVC_REG_FM_STOP is set and a forceful frame transfer abort is
started, the RZV2H_IVC_FM_INT_STAT_STPEND bit takes a long time to
clear, during which is most often times the case the current in-progress
transfer completes by itself. If this happen, then a peripheral
reset is required to restart streaming regardless if I forcefully clear
the RZV2H_IVC_REG_FM_STOP_FSTOP and RZV2H_IVC_FM_INT_STAT_STPEND bits.

I have tried several strategies to properly forcefully stop an
in-progress transfer and handle the potential race betwee the
transfer-complete irq and the polling the RZV2H_IVC_REG_FM_INT_STA
register (which could potentially sleep), but it's still quite easy to
get races between frame completion and the forced stop procedure unless
I hold on to the ivc->spinlock preventing the irq handler to run.

Once I timed the transfer time for a 1920x1080@10bit frame to 5 milli-seconds
at most I decided to simply wait for the current in-progress transfer to
complete, as this seems the most reliable way to be able to re-start
streaming without resetting the peripheral.
---
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 31 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index b167f1bab7ef..932fed38cf3f 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -297,12 +297,33 @@ static int rzv2h_ivc_start_streaming(struct vb2_queue *q, unsigned int count)
 static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
 {
 	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
-	u32 val = 0;
+	unsigned int loop = 5;
 
-	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP, RZV2H_IVC_REG_FM_STOP_FSTOP);
-	readl_poll_timeout(ivc->base + RZV2H_IVC_REG_FM_STOP,
-			   val, !(val & RZV2H_IVC_REG_FM_STOP_FSTOP),
-			   10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
+	/*
+	 * If no frame transfer is in progress, we're done, otherwise, wait for
+	 * the transfer to complete.
+	 *
+	 * Transferring a 1920x1080@10bit frame to the ISP takes less than 5
+	 * msec so sleep for 2.5 msec (+- 25%) and give up after 5 attempts.
+	 */
+	for (; loop > 0; loop--) {
+		unsigned int vvalid_ifp;
+
+		/*
+		 * Inspect the ivc->vvalid_ifp variable holding the spinlock not
+		 * to the race with the rzv2h_ivc_buffer_done() call in the irq
+		 * handler.
+		 */
+		scoped_guard(spinlock_irq, &ivc->spinlock) {
+			vvalid_ifp = ivc->vvalid_ifp;
+		}
+		if (vvalid_ifp < 2)
+			break;
+
+		fsleep(2500);
+	}
+	if (!loop)
+		dev_err(ivc->dev, "Failed to stop streaming\n");
 
 	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
 	video_device_pipeline_stop(&ivc->vdev.dev);

---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20260331-ivc-stop-streaming-2c992277b050

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


