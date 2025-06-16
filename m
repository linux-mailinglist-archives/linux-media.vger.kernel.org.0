Return-Path: <linux-media+bounces-34985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10766ADB6F5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37C483A5D61
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E9A288C06;
	Mon, 16 Jun 2025 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RPsvXvg7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E564F27380B;
	Mon, 16 Jun 2025 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091451; cv=none; b=eW7qhgw19HlGjWVUge4EG+i0SBYxTiLKv4YACvJZ6ZLldkObI9S66/PybrVnl6Kh7dEFm3PFBOZEARFxDbQefH366+0NWc5PaT1FiXK2aZi0ngu5FaOnjCGYzG0ForGD5/TH8eIOkNWLZk1OqCZuvBkyPQEU0lTO5FiCmd4Cyxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091451; c=relaxed/simple;
	bh=QgXJBSQFf7sG4UygYxutmen9Bm3kVzRMUMSk/9Q6Ilg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GYbq1fi73f06vgMT8eJd7wrX8hPpRcJOM5wauH6DYkpr+79wv8C0i4cZ/dGpKyX/CYRM2vnJBqxIZMUPOPkEuJrXYAzYqi5pza2gPMtcviUA/Izbho/7n+iuJZoolytd5H9k9WxgKauqdexwtk98OnpQVPDrXnGVJF3Lb/OOQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RPsvXvg7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-141-184.net.vodafone.it [5.90.141.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 349A7752;
	Mon, 16 Jun 2025 18:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750091436;
	bh=QgXJBSQFf7sG4UygYxutmen9Bm3kVzRMUMSk/9Q6Ilg=;
	h=From:Subject:Date:To:Cc:From;
	b=RPsvXvg7hV78lcu59D86pGPYmwOF/mjBaX+9vn03/Np7kvS+HoopRLkeFWw9PXaoy
	 JzEPvyqsuRnIlHEbfRtx6ZvIhbU1VY0a5XWHTwyYlEH4SjILQHXUR5EmYZCDlzhwjF
	 ETNTBh2RD1vnjk7/w6r/YkVKQV6CPHyZl6AD8pA4=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v2 0/2] media: vsp1: Detect display list wrong usage
 patterns
Date: Mon, 16 Jun 2025 18:30:36 +0200
Message-Id: <20250616-vsp1_dl_list_count-v2-0-7d3f43fb1306@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKxGUGgC/32NUQrCMBBEr1L220iymEr98h5SSpqsdqEmJalBK
 bm7sQfw8w0zbzZIFJkSXJoNImVOHHwFPDRgJ+MfJNhVBpSopcZO5LSowc3DzGkdbHj5VSjdOjw
 bdHpUUIdLpDu/d+mtrzzVaoif/SOrX/pXl5WQ4iRt6ySh1B1e2ZFJwY/BRHe04Ql9KeULlBKMQ
 rsAAAA=
X-Change-ID: 20250529-vsp1_dl_list_count-156d27a2d5b1
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=QgXJBSQFf7sG4UygYxutmen9Bm3kVzRMUMSk/9Q6Ilg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUEa3HhgvyRerQ/e9ErvfmmCEyIxNzNeOkr7e5
 Otn9zlN3VeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFBGtwAKCRByNAaPFqFW
 PLG+EACCoLspxSGfoB/6hopSHTAuNzsq1LTMSCMYNvQw3kgYeGvtAMCaGLUPNBafE6KtaOadF1B
 NJu/L60STUBp628DnyWd635gmVucAlPFMU9rAQT+CuIcXcvcC6eJJz7KlRpHOVi5almGi9BB5Ch
 /zyRkAP1rVnDSCqIfjptA+jsinDNYJAL40KnCZPCmLCKwlOPDq0h0OBGIZn1QxXkiriUkcFQbFb
 652w9TZV26VgRKvt6F1eZPz9RqKEtTealEu/ja1KonQWi7MSjlZaoak01WQ2/7zK1TtPmgNxayW
 50yLa9djnQhjZy3E6orEb8Kk5fWmScIsYjkCk96WYrFgKvVFwGRCNCL0yYDrfM3IlMA36DVJGkF
 /HUIXrdBcVn2JS9F5kIwVe2DZYXlse1lovTlhjT50yeNsW4T9cqVz7Zl6dffyr9yKDFRaQ+y4E3
 sPryOkqBGvsXyLDvij2F5n120+xWBUNjfmI0Qrgh3RfbM8haJWa3Rrom4el6HKedKTP/d5lozPV
 qTEe0ik6bV2finK038jI0qv+zaRr18qswDKrNHtb/Zq1iATKS1PNh9axXzAc1Z6WgMY6ia/Eipq
 2KzrG250GkH8aFjShiGVdGhRtf9DaE0y+nwM6xSQ/UZTyH00kmYN8yHHbY23ccDOFjpqi/JbGGM
 cerpgZ2FLbMps6g==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The VSP1 library driver offers support for programming the VSP
using display lists.

Display lists are created in a pool and users can get them and use them
to program the VSP. Once done the display list shall be returned to
the display list pool.

The correct management of the display list pool is left to the user
of the helpers, and it's helpful to add a few checks to detect invalid
usage patterns, such as a double release or a non-returned display list.

Add two counters to detect double releases of a display list, and a
counter to the display list to make sure that once it is reset all the
display lists have been returned.

Tested with vsp-tests
170 tests: 165 passed, 0 failed, 5 skipped

However I got a (hopefully unrelated) warning:

[  795.547528] [<000000007d841fd6>] vsp1_irq_handler
[  795.552448] Disabling IRQ #43
[  795.653324] vsp1 fea20000.vsp: Underrun occurred at WPF1 (total underruns 1)

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes in v2:
- Use a boolean to keep track of DL state
- minor changes
- Link to v1: https://lore.kernel.org/r/20250529-vsp1_dl_list_count-v1-0-40c6d0e20592@ideasonboard.com

---
Jacopo Mondi (2):
      media: vsp1: vsp1_dl: Detect double list release
      media: vsp1: vsp1_dl: Count display lists

 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
---
base-commit: 4d2c3d70799f5eb210003613766bbd113bbebc1a
change-id: 20250529-vsp1_dl_list_count-156d27a2d5b1

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


