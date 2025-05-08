Return-Path: <linux-media+bounces-32020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C80BAAAF5D8
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 10:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA4AF1BA820B
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 08:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05484262FD1;
	Thu,  8 May 2025 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="loQALdfb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vYDf1a3H"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C320262D0B;
	Thu,  8 May 2025 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693520; cv=none; b=a8gQ3m/4Oo8dUI1V/RLz0k+P9V3bO98nIvFPVfXiDZsF3rOXLkNqJz7nIbpl9W6DbdwbKgo76h7e6KgkSOTjKAINgTxktoZvoFzkTVOREl6PuTA2ofw36iwkTlADcZnSOjkNg01s0HE8XEHfi/eXQSrBNyYMPB4i9eqooRwp2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693520; c=relaxed/simple;
	bh=DfnfwWqbN41u4X4+EL2LFT8tt4D304cSyZSPBIk6RRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pt0pCqX45aqhk//iXlsCkXg3rbPvbTWMi7Ljw4u6oF2Np02llssTn+QFrKBZAoXdlqTrOSx3d8hpTj7Ry/uSWCNbHL+1K4yP1WlRtf0VYZPE5yx2DxCGvZg7AQaJP+Oup1ODR71w104n64rrNj4bvkTA51htKy11y2W73swP3/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=loQALdfb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vYDf1a3H; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 01BF21140179;
	Thu,  8 May 2025 04:38:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 08 May 2025 04:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1746693516; x=1746779916; bh=Oq
	s8zgYjNjyHe30uh7H+v3OUhiBkEOhgMc/PNrB5B5c=; b=loQALdfbCxvGuFx+Jd
	rLBlVYPpjePQeGtq3xZVRi+ADDCAVpAK0Xu6ljZFVmXQxcTaPT0Qq+SxDWr7+JgV
	6HrSUe9huI0lsh9jczP/N8FOrdTjwTRZIUe8yu1Cm/R2vbIMUWhmSTJCWxnVUcAH
	AnlQUAUypn/fuHKECvicKlGuk0sKAQr7DwFz8lzeUM2WVBIkLtsTDbry4xms+UA1
	vcGmobtFFKr5Inbao1OYAMUU+VeO2nQCONDJQ8qc9GLvd/50bzmmqQ1JqQ6zYMPA
	fJ5tVc7KLxAAMzT56mPUcSLtu8PeiPg6qMI+vL53v03l0oIzvctLYdgFNNW17Ql1
	OZZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1746693516; x=1746779916; bh=Oqs8zgYjNjyHe30uh7H+v3OUhiBk
	EOhgMc/PNrB5B5c=; b=vYDf1a3HVCPlosA6Y67Px4aR7BTByozOqgLQ0FHUxAzu
	gXIze8YXWKzDkLr7ePEKwCluoTsK5zbtnaAY6IviiCXPuTYLP2klOWlLTtTVmZEn
	i3xGkIj7rgffWdz9Z/xPD665aa929tZEIr17dtbz9+s/n6Kf36gyGI2/IDsP9r+F
	7vqjJxmxtJOx5ytIrfl+ttXxqALcVDn/MYQ+woRBEIUbLmNDnpF5Ce37WW74oR4Q
	qQwr60z51kayo/U1FXGH0RMhkHICP929DegqO7YUhswtpTQ9KqyOtVAs4wZd4s0g
	+QAiFMjD8/RiRUztYQqJRVwmqc136j2A/js0juUHiA==
X-ME-Sender: <xms:hm0caDQMRwe4LSkNWPZ4qd-ZSx8_gEckp4lWqyTb7698R4emp5WzlA>
    <xme:hm0caEwGHY5-umRIFglGilDfgxmlHFfg_XsNhe4KJC4-yiPphow98oAoGCKCm--iN
    rtSGkUFwWTKIg5W9WU>
X-ME-Received: <xmr:hm0caI1OdEO3dTELHKrfxyTEATsbmT2fY5kK7aFZaPVjlYB_c-w-H0CNywZGw6i6qymv4_7VShpWZVITjaUJ_VHn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeelvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfe
    etgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuihhlseigshegrghllhdrnh
    hlpdhrtghpthhtohepnhhitgholhgrshdrughufhhrvghsnhgvsegtohhllhgrsghorhgr
    rdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvg
    hlrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtg
    hpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdp
    rhgtphhtthhopehmrghtthifmhgrjhgvfihskhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:h20caDCM9yvYTgheYFAtSsnCspV0u5R7XtfWWzNOjhqA_5MrT8JCFg>
    <xmx:h20caMiU3ThURHM6tIjPxnZ7SahySc54hY6bnQdiy2kYkciW-Z0rLw>
    <xmx:h20caHqlSmPXYzR6PL9HZ-UVe31s4bYP6akPvIHW1aHyvplj_AJNQQ>
    <xmx:h20caHiiiSIaFnKFIQfZ_8NPBlN9_LnOVL81pKUAmDxN-pJk9Zsdzw>
    <xmx:jG0caMLMXv7qhPKG5mh2hrUOkJaAJdLOW8OXyIBwMAGqzjDeu52i0MhP>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 May 2025 04:38:30 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: v4l2-common: Reduce warnings about missing V4L2_CID_LINK_FREQ control
Date: Thu,  8 May 2025 10:37:45 +0200
Message-ID: <20250508083745.1697364-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When operating a pipeline with a missing V4L2_CID_LINK_FREQ control this
two line warning is printed each time the pipeline is started. Reduce
this excessive logging by only warning once for the missing control.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 4ee4aa19efe6..09412989f9b3 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -497,10 +497,10 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
 
 		freq = div_u64(v4l2_ctrl_g_ctrl_int64(ctrl) * mul, div);
 
-		pr_warn("%s: Link frequency estimated using pixel rate: result might be inaccurate\n",
-			__func__);
-		pr_warn("%s: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver\n",
-			__func__);
+		pr_warn_once("%s: Link frequency estimated using pixel rate: result might be inaccurate\n",
+			     __func__);
+		pr_warn_once("%s: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver\n",
+			     __func__);
 	}
 
 	return freq > 0 ? freq : -EINVAL;
-- 
2.49.0


