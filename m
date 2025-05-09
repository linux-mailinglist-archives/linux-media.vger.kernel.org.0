Return-Path: <linux-media+bounces-32067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE7BAB0766
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 03:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F17F91BC5B5D
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 01:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5EE78F39;
	Fri,  9 May 2025 01:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="AXAgfyT+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921CD17D2;
	Fri,  9 May 2025 01:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746753476; cv=none; b=S3GCF/hHjJ+nCP4T2m5nhcabyDHy4c/4zxO43/PZ0wjO4uqCbxM4Kyq+aUspdE5g6xBWtgB/WPA4vQic1ReT1XhRestvbeMJRM7uzrJPVIBu7+/G+ZilmBJEOjj0imiwULnG2Bfgoym1nd0BL8H562ZjBNofz8Erv4/qrW7OYxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746753476; c=relaxed/simple;
	bh=8P30E5BnjmQ9M5SWvhiMmyw/gYVGi2MOum18NKNu26w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/NujW0u8MKBqxJU0gdi7dibyLeVLf1v9/XDgAgXMTvbeW6QuUhm+yTa1u0ufPgrqIZcg7IhZY1k0HGIj6Gv/285teT5TNWE5R51nzRu80XG75Ufi3kNRywRoqtynWWeQLCk6KRYpv98x7fEzO7uXtKQrSUvpjldkHzLXT9blG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=AXAgfyT+; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=0kbl/khprjF8mImI+ZP0nZf02/u49AHVsD0wSVfffNE=; b=AXAgfyT+mGKTsg/i
	pSHPxsdYb+720CcDMXjhDl6PEJ6aS9DNRu6mmD8NnF9MZH+LLaTEOdl+Ic7VG62bi7L42p6mPIQy7
	gpKv9JIaCTtl29zi53d/X6Id90j+mO/WOTc+t5+GH6m41TEOhxTaMXHomktlDUSq8YK6eaLA09h5j
	BF6VSL1QOZ3uQAiRjJQUjDiFex+g3MRLSaG5asF+QLBPBbj9/bR44fuiHU+XtGoQ/sFNT0kAAYoOY
	5Vs2Z9M5nh0TwyzU6b+Mg6aFHH31/nR3iYDSkigkQN0TCU8B0FEKkOneAO/U1n0BtHWNegH2pfvbz
	NaLXjTJM5xF8HRlCFQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uDCN5-002Wwd-0m;
	Fri, 09 May 2025 01:17:51 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: saa7164: Remove unused functions
Date: Fri,  9 May 2025 02:17:50 +0100
Message-ID: <20250509011750.292145-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

saa7164_cmd_signal() last use was removed in 2009 by
commit 39e469ab6dee ("V4L/DVB (12940): SAA7164: IRQ / message timeout
related change")

saa7164_buffer_display() was added in 2010 by
commit add3f580a434 ("[media] saa7164: convert buffering structs to be more
generic")
but is unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/pci/saa7164/saa7164-buffer.c | 20 ----------------
 drivers/media/pci/saa7164/saa7164-cmd.c    | 28 ----------------------
 drivers/media/pci/saa7164/saa7164.h        |  2 --
 3 files changed, 50 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-buffer.c b/drivers/media/pci/saa7164/saa7164-buffer.c
index 89c5b79a5b24..7820e4f47fd5 100644
--- a/drivers/media/pci/saa7164/saa7164-buffer.c
+++ b/drivers/media/pci/saa7164/saa7164-buffer.c
@@ -52,26 +52,6 @@
  *						    | etc
  */
 
-void saa7164_buffer_display(struct saa7164_buffer *buf)
-{
-	struct saa7164_dev *dev = buf->port->dev;
-	int i;
-
-	dprintk(DBGLVL_BUF, "%s()   buffer @ 0x%p nr=%d\n",
-		__func__, buf, buf->idx);
-	dprintk(DBGLVL_BUF, "  pci_cpu @ 0x%p    dma @ 0x%08llx len = 0x%x\n",
-		buf->cpu, (long long)buf->dma, buf->pci_size);
-	dprintk(DBGLVL_BUF, "   pt_cpu @ 0x%p pt_dma @ 0x%08llx len = 0x%x\n",
-		buf->pt_cpu, (long long)buf->pt_dma, buf->pt_size);
-
-	/* Format the Page Table Entries to point into the data buffer */
-	for (i = 0 ; i < SAA7164_PT_ENTRIES; i++) {
-
-		dprintk(DBGLVL_BUF, "    pt[%02d] = 0x%p -> 0x%llx\n",
-			i, buf->pt_cpu, (u64)*(buf->pt_cpu));
-
-	}
-}
 /* Allocate a new buffer structure and associated PCI space in bytes.
  * len must be a multiple of sizeof(u64)
  */
diff --git a/drivers/media/pci/saa7164/saa7164-cmd.c b/drivers/media/pci/saa7164/saa7164-cmd.c
index 42bd8e76005b..a95662776ee8 100644
--- a/drivers/media/pci/saa7164/saa7164-cmd.c
+++ b/drivers/media/pci/saa7164/saa7164-cmd.c
@@ -295,34 +295,6 @@ static int saa7164_cmd_wait(struct saa7164_dev *dev, u8 seqno)
 	return ret;
 }
 
-void saa7164_cmd_signal(struct saa7164_dev *dev, u8 seqno)
-{
-	int i;
-	dprintk(DBGLVL_CMD, "%s()\n", __func__);
-
-	mutex_lock(&dev->lock);
-	for (i = 0; i < SAA_CMD_MAX_MSG_UNITS; i++) {
-		if (dev->cmds[i].inuse == 1) {
-			dprintk(DBGLVL_CMD,
-				"seqno %d inuse, sig = %d, t/out = %d\n",
-				dev->cmds[i].seqno,
-				dev->cmds[i].signalled,
-				dev->cmds[i].timeout);
-		}
-	}
-
-	for (i = 0; i < SAA_CMD_MAX_MSG_UNITS; i++) {
-		if ((dev->cmds[i].inuse == 1) && ((i == 0) ||
-			(dev->cmds[i].signalled) || (dev->cmds[i].timeout))) {
-			dprintk(DBGLVL_CMD, "%s(seqno=%d) calling wake_up\n",
-				__func__, i);
-			dev->cmds[i].signalled = 1;
-			wake_up(&dev->cmds[i].wait);
-		}
-	}
-	mutex_unlock(&dev->lock);
-}
-
 int saa7164_cmd_send(struct saa7164_dev *dev, u8 id, enum tmComResCmd command,
 	u16 controlselector, u16 size, void *buf)
 {
diff --git a/drivers/media/pci/saa7164/saa7164.h b/drivers/media/pci/saa7164/saa7164.h
index eede47b686a3..e1bac1fe19d3 100644
--- a/drivers/media/pci/saa7164/saa7164.h
+++ b/drivers/media/pci/saa7164/saa7164.h
@@ -508,7 +508,6 @@ int saa7164_bus_get(struct saa7164_dev *dev, struct tmComResInfo* msg,
 int saa7164_cmd_send(struct saa7164_dev *dev,
 	u8 id, enum tmComResCmd command, u16 controlselector,
 	u16 size, void *buf);
-void saa7164_cmd_signal(struct saa7164_dev *dev, u8 seqno);
 int saa7164_irq_dequeue(struct saa7164_dev *dev);
 
 /* ----------------------------------------------------------- */
@@ -570,7 +569,6 @@ extern int saa7164_dvb_unregister(struct saa7164_port *port);
 extern struct saa7164_buffer *saa7164_buffer_alloc(
 	struct saa7164_port *port, u32 len);
 extern int saa7164_buffer_dealloc(struct saa7164_buffer *buf);
-extern void saa7164_buffer_display(struct saa7164_buffer *buf);
 extern int saa7164_buffer_activate(struct saa7164_buffer *buf, int i);
 extern int saa7164_buffer_cfg_port(struct saa7164_port *port);
 extern struct saa7164_user_buffer *saa7164_buffer_alloc_user(
-- 
2.49.0


