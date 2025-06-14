Return-Path: <linux-media+bounces-34800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B7AD9D65
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 16:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6803B189B393
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 14:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D902E3374;
	Sat, 14 Jun 2025 14:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YsFwBOgP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gW6lf5U5"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA9C2DFA24;
	Sat, 14 Jun 2025 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910585; cv=none; b=uBKf0ZMMWX0dkCXg40nw0N61eaZdrq1JAxAu6k5TyWpVVnHfDzz9HEhAfX4dMPf9r8eHhrLm6pO41AYZl0crK6qGzA1FJ7kjabD2vwlXkonXjvQoAXZKUCDnTB3Tr5weNvRrMh0QQux7Xut4SQ80HTxnEH+xZeChfJkwtHxP3cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910585; c=relaxed/simple;
	bh=KGH5CSdIP2weibyL94KEuSJoXrkh/CqKUDTXEgGO40M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxD4O1NkIl/WCno2yFLMr1+W7QU2CyCyMm52nsVXgqbo8uLizT1sVFjFQjunivEUT4pYAdt15ADoHmhepsh58gdplJsvH4SzQuWjjJSRvKF5YOPUrdoe+5CbNv5zSy4A8kRWzS0j3II355+L45FGWE4Bs6orLNM4gUm9T/oXZpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YsFwBOgP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gW6lf5U5; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 04BD4114013B;
	Sat, 14 Jun 2025 10:16:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 14 Jun 2025 10:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749910583;
	 x=1749996983; bh=bq11b5Mjk9Qzjdb7PAB+0M142DvbpJs/FKBwosq60i4=; b=
	YsFwBOgPEus+UroV/6rL7/FvXxAglKw1oviL6JyR96lgMW4zoZoJszsm7Ky0XlEp
	is1xBY6EiDTvlZIMcJs9UFolxbfpFy9UdkyQMOHd1uLvDrmT42uvL8SO/a3SuAqk
	KfwLzuwn5bGZTpsxDP0xL/BUvrH+9zqPDPad3VBn2GTDBukyJhGisdSApJBBJt5F
	hatPRax3TZ0uPkVgVhZxdDKNhdBT9JXwqsobhXbkQxC1g52bKSXUDGefLgG7sQDO
	ifOqT7TiGsjufWrcbwf4wg0Vc564U4rqfqg9k5U7fb5llbrdTpyxjmme8do9bv6g
	E+tf7gt55bb6914NmfH3tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749910583; x=
	1749996983; bh=bq11b5Mjk9Qzjdb7PAB+0M142DvbpJs/FKBwosq60i4=; b=g
	W6lf5U5ypeYkBIHyJMIKrjDfgnhAC1DUYeaRhgvGbmIZ1oy/FsuQfcwJUcz7V2xF
	NCM6leL/TasK9TVk4K+Uk4sXJYy27mxdmZhouNiOl82eO6Mhqu9tHLVsqD3NvRxA
	6T+QAeLXsb/M4BsR4iwi0dvlYi0caodMhWJtDBHqBGQopgnKfZ5vlCC6q+yJIDJ8
	Da4/fI6GxgrXjv6oIVkI9oWI5VH6zY0eB9UyssgoL4dDc7Xkskr12pdvBKTmXMDh
	7ckAglzKlv2scb3LJeqT6rmrbRmnbSQTTyHJQbTPjgSos34zAIZLQOv7UvbG5c3F
	1DKkL64+M4ippAaq3QzJQ==
X-ME-Sender: <xms:NoRNaK1FaZEgIoFj4GGRdQnsUBsuO39h8nV0aAbWZ9JpQRv6XdWeWQ>
    <xme:NoRNaNE03gegmRoSFQxz5YrOfjhl35ZYEn2ejeSnAFWAytM_JeaKP6Dm6VX_hUzzm
    iHLLvJzpZlyhDJABfo>
X-ME-Received: <xmr:NoRNaC6bHONfpnRcuzwCr5tlSh1mzcZW6VblByRn5Guf9X7iNRj-hKj_OtgqoOPafQ1jNW2E7xMCSX1c9Hpx5Foc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvuddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlih
    guvghrrdgsvgdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvg
    grshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqd
    hsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrd
    hsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:NoRNaL3S5J3Ul8PVyCATpDHTk629tUTG8PNLmey5-8_m2ykeWSv90w>
    <xmx:NoRNaNFMQzh3Jfp_afouiJvAoU5JV-OKVpl4d_UFm_ZfYMme2FIGpA>
    <xmx:NoRNaE8XPvue_Al8P49OUjXFntgB307sbeLxofN1mIDU3586hXuVKw>
    <xmx:NoRNaCl40jPlhlGcTNMy7biaYuhmJdZj7Rz4N4RV-4xHqo2C7a5KRA>
    <xmx:NoRNaNTGyrxWPdf3upqb12MWWGW7Y1is0NmuKtH0pILnsG-8CyiNHOl1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 10:16:22 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] media: rcar-vin: Generate FRAME_SYNC events
Date: Sat, 14 Jun 2025 16:15:45 +0200
Message-ID: <20250614141545.2860860-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614141545.2860860-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250614141545.2860860-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable the VSYNC Rising Edge Detection interrupt and generate a
FRAME_SYNC event form it. The interrupt is available on all supported
models of the VIN (Gen2, Gen3 and Gen4).

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../media/platform/renesas/rcar-vin/rcar-dma.c  | 17 +++++++++++++++++
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 85e44a00e0fc..a1ae9c9bccc7 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
 
+#include <media/v4l2-event.h>
 #include <media/videobuf2-dma-contig.h>
 
 #include "rcar-vin.h"
@@ -115,10 +116,14 @@
 #define VNFC_S_FRAME		(1 << 0)
 
 /* Video n Interrupt Enable Register bits */
+#define VNIE_VFE		BIT(17)
+#define VNIE_VRE		BIT(16)
 #define VNIE_FIE		BIT(4)
 #define VNIE_EFE		BIT(1)
 
 /* Video n Interrupt Status Register bits */
+#define VNINTS_VFS		BIT(17)
+#define VNINTS_VRS		BIT(16)
 #define VNINTS_FIS		BIT(4)
 #define VNINTS_EFS		BIT(1)
 
@@ -898,6 +903,8 @@ static int rvin_setup(struct rvin_dev *vin)
 
 	/* Progressive or interlaced mode */
 	interrupts = progressive ? VNIE_FIE : VNIE_EFE;
+	/* Enable VSYNC Rising Edge Detection. */
+	interrupts |= VNIE_VRE;
 
 	/* Ack interrupts */
 	rvin_write(vin, interrupts, VNINTS_REG);
@@ -1049,6 +1056,16 @@ static irqreturn_t rvin_irq(int irq, void *data)
 	rvin_write(vin, status, VNINTS_REG);
 	handled = 1;
 
+	/* Signal Start of Frame. */
+	if (status & VNINTS_VRS) {
+		struct v4l2_event event = {
+			.type = V4L2_EVENT_FRAME_SYNC,
+			.u.frame_sync.frame_sequence = vin->sequence,
+		};
+
+		v4l2_event_queue(&vin->vdev, &event);
+	}
+
 	/* Nothing to do if nothing was captured. */
 	capture = vin->format.field == V4L2_FIELD_NONE ||
 		vin->format.field == V4L2_FIELD_ALTERNATE ?
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index db091af57c19..6339de54b02b 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -734,6 +734,8 @@ static int rvin_subscribe_event(struct v4l2_fh *fh,
 				const struct v4l2_event_subscription *sub)
 {
 	switch (sub->type) {
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 2, NULL);
 	case V4L2_EVENT_SOURCE_CHANGE:
 		return v4l2_event_subscribe(fh, sub, 4, NULL);
 	}
-- 
2.49.0


