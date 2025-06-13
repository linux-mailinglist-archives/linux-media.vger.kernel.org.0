Return-Path: <linux-media+bounces-34780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C1CAD9173
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4601A16C5D0
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2081F473A;
	Fri, 13 Jun 2025 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bl24jeOt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JtEZa3xx"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C4C1F4CA0;
	Fri, 13 Jun 2025 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828930; cv=none; b=SFHn0yglOakN0QBhzzBwoe+KkFghCOs+ieMaQBZTG15MvcKBbo229iBkRtg5xrMcFS5SXGXVfjReIadhLUYMPToUzu21NfUzFN/uYPFN3JsMXT8HHoQbrUaH8/6A5tv5Xg3IgLsvUADu6A6QQ2GxLAHdDonNWQnMwkkg+5XqH9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828930; c=relaxed/simple;
	bh=2VoijQcvMb0erSKivpn2w7xlyMVhZjFrHyShMS2rrHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C2MOekoYZhf1yYujsWLPYBG+NaGTWjV4FoGUgM8JjRZ1gvDa8zoz5sd/ofyinA/QtdBbsXPaoeSWGZ2QBdr/07fKbusHBz9Sg244m+0LGpUk2JC5nJ1duB6twWQE+cTauTvC/BrkQJiUT9AUENZhbSBdY5RGQ66dAkWCL1h+fGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bl24jeOt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JtEZa3xx; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E7CC811400DA;
	Fri, 13 Jun 2025 11:35:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 13 Jun 2025 11:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749828927;
	 x=1749915327; bh=PNeSmA3zroOfB2N9H0+ia+xVRROWT92UCl98nlwcU88=; b=
	bl24jeOthUDTBYspyJcEzdf99pOe4BJDQ3dGCRHvvFI/ZxXXj1boRMgy+8BXJig9
	1xJi91UP7kxegYWPk3NFB4M7aOMIYSoOEPREMBL3UPxhuGR0275NOAJgqiCOcdZb
	DVRM3V/Mh8fhCrn4Ccibi1QSSZFH9T6shx27ZGuULfZlZcVaVf+d21cvgvXnyvqo
	rRAg4oKmvZD49Z2Madt84t0r6/OrIxH+YWZqxm50E8y1CNomunuw+zLprn/v8GbJ
	0AxXgUFHNPYCY7V0glthqrU8coVMOmhR7EDdeZtoPO1owTMQHxM4Fv3R6XqQHjKU
	yhNEeHJcXrB7ZZA8VyVIIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749828927; x=
	1749915327; bh=PNeSmA3zroOfB2N9H0+ia+xVRROWT92UCl98nlwcU88=; b=J
	tEZa3xxxRehzAZdMtfW4lCrGGAIGD/36ghZvGRWLisvPVmWUItXiP4BxHoUmlrhW
	nCso0h7+YTCzE7qTlqqLFkE7M6z3Kysc+nojzDllxeBZMpQDMg3c/jTm0Z22glWv
	7BypWkwjHCVVcX3Cg/NOAl/dbR9SfzxfNMjTB/KrrNyav+gm9vrqpK5ZXi2IhLN1
	WcYZ5svC+p/ZqVbmz8gRP33I7I+Fp7wU2x9lUVcAcxCyIUfHAx1HS2oDpyP2GXQS
	GoSecSmBbdQaux140cdtk0tApdgUwpocI13YqyG3KhlNLVaWJosrlPgyVsGCE3bP
	dmXoOf3xNPsD69Bg7e3BQ==
X-ME-Sender: <xms:P0VMaHgBXApEcORFn3IjLmYCnaISdBRdgtvOkLsa-mFxnwpnEcJrUg>
    <xme:P0VMaECMFMXcbH9IcymIs9HvfMBqr9r-vBQp6bU6-oYc6URmUC4tLIfJSbBLFYvUt
    t0e3s6IrUOTMZcjIAg>
X-ME-Received: <xmr:P0VMaHGPISIUID4Yj3p2SfkvAzE66hn-Qy9-ICl4iwOtogD5M0SHxPmQrnC2Or_4Oq1VGNnNa_yYNz0Ooqa08qEp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurh
    gvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    oheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:P0VMaEQFOS4dHyfOy5rLJUzgZuW3Hx40WOUNJj70iC94_mtF_HUm-Q>
    <xmx:P0VMaEwa9vfAWSmmgK_oXgf4Xhf2yaWQ64ACK2grFsRlhjQVbK9szg>
    <xmx:P0VMaK4WYFZUQI6SCmaqa0trXXaFcaViBj8cRlzfdoo1O4Ux-dWx1Q>
    <xmx:P0VMaJyNT1oATHV18oAXdWBBzH-wecd2Ngih4GELUHEIo2O1OwY5bQ>
    <xmx:P0VMaMMuf9dLvN6UTaATC0T4UAaZSK6_u-RhK7cNG-08WLctS2QEedf7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:27 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v6 10/13] media: rcar-vin: Remove NTSC workaround
Date: Fri, 13 Jun 2025 17:34:31 +0200
Message-ID: <20250613153434.2001800-11-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Gen2 where sub-devices where not exposed to user-space the field
TB/BT ordering was controlled by a hack in the VIN driver. Before
converting it to media device model where the subdevice is exposed
remove that hack.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v5
- Fix spelling in commit message.

* Changes since v4
- Broken out from larger patch.
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 5c08ee2c9807..4fb33359bb0f 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -700,9 +700,6 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_FIELD_INTERLACED:
 		/* Default to TB */
 		vnmc = VNMC_IM_FULL;
-		/* Use BT if video standard can be read and is 60 Hz format */
-		if (!vin->info->use_mc && vin->std & V4L2_STD_525_60)
-			vnmc = VNMC_IM_FULL | VNMC_FOC;
 		break;
 	case V4L2_FIELD_INTERLACED_TB:
 		vnmc = VNMC_IM_FULL;
-- 
2.49.0


