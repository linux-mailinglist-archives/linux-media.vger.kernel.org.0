Return-Path: <linux-media+bounces-36717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1F7AF822F
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C24EA1C87568
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D432BE7B5;
	Thu,  3 Jul 2025 20:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="nt/loDkN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DxlNFusw"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369252BE63B;
	Thu,  3 Jul 2025 20:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575988; cv=none; b=Yz8tymR9wSkxl0OM+Y97ts5TDkcpT5s68ZhFbuX+spXUAVal/5R4gPPnst9ZAnPqTw0zp9u86mH18pb2CWAahJwuxOIoJUTmQ5YG1u75PmfQLJzV50aQ0WKSF5Kthbaqtx/MLqzroBB92b688e9kPirYeAGKL60R7p/WU1nyzB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575988; c=relaxed/simple;
	bh=dg48FhTih0TTsibrV0EcviZBUxo12WoRu/bNHdhUPsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=najYvyIqBiHi6WZ8CtYf3vnMR9Sg1Ct61KAnHN/Tqo6kgnKvFJM7vriJcnapDUqTH/eytRYc/FR4MWOU54sTKCs0AbD7GIcIS9x0j2ksKnaqVNWxbCskdYXO+o3zWhVmwDTYFDyKzPuXxk4EFFYDK8BY/nWNYHS1jQag1sSV7j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=nt/loDkN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DxlNFusw; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C2F8EC1069;
	Thu,  3 Jul 2025 16:53:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 03 Jul 2025 16:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751575985;
	 x=1751662385; bh=BXoXLTyg2pYLKw7qjVi3b54kAucAGBmF49ztH3jCSZk=; b=
	nt/loDkNT8oAnbtAYZZlzdLw7AUKTC7EbshzV8kzVHOilZj+Mh3Avg5mpYA3MFug
	WqBtf8JxGKAstt7b8eW/sPMyK6e2lTmcFrZMOwhKEeDSOKKcWnujcXsn2hA6yakg
	Yunpn/JexxpwJSnLJvU+BugX0zMfafoLlc2Ve1TnRv+HA3dTD60K94K6C0TdTzs2
	BPxibyHgWEJYLddYnXaBUzplKpXMh7sJmyvCc442cFYaP8ri3Lp5aRCwFBUbEnL5
	rozbSPv34z4DLSearofYSt9fzINAcEFwZIABGJzjjNlu4RnhfdWhbQnWiNW4BUYq
	5we/xtofJGY5WPmSurHJ/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751575985; x=
	1751662385; bh=BXoXLTyg2pYLKw7qjVi3b54kAucAGBmF49ztH3jCSZk=; b=D
	xlNFuswpxgELbsVTONfdPwa3Ehda9ORRZgcR4YLs9iF9YeAgO8dF6cKKj376eZo0
	Jrzv3nnaPuEI6IxzzU7FvoQy3ME0OXxRuMk9l6FZcok+ftL6ybwS+cewS5K5+EQM
	qOuNC5z/2IUcxVF4+1LiOHZPIRPeS9341sYKutYH898gmXm9rYQhLSstMi2XMn4h
	F2lssc3CmoX4A+pWKCbJnD43brqBS12gRb7kyxpSfeyX+XICt8QYtLH+ZyP5HTPg
	U4QWsQ+54jCmJw3LmvdnlQnfYhfBtsJZEVyLxGt3GNC2e0F0tlsM1PgsIghaHpMI
	6Yv3Su9uyCJq5yWUevcnw==
X-ME-Sender: <xms:sO1maGqHFmdm6OvzIzo3inAwj2yhSmlJZeddX_maOt7RY8fhb7qZaA>
    <xme:sO1maEoA7yu8jFN9jtKq22-R4zgyHRaS8AGCvMZHgEoM8ObUQVty__DpKGhUJ5Rif
    nYKDsprBOYEvQl4u7c>
X-ME-Received: <xmr:sO1maLPzndYu4-MgbegFe0wSRa9HFKB9yTo9kpW-xYQX9SzT5a5e2VSPvfG18mp81MMrbuyXPWm-MNYT8ryCRYZdXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvuddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilh
    esgihsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:sO1maF4BG3ISlymot6DQUpc2MyROjMbfKC3xtOD5wb8y7nvLUWe3ZQ>
    <xmx:sO1maF7Npdso_hqGJkDnYp8LgWN_Cs8XknRemWbLN7CBXHr6w9qavw>
    <xmx:sO1maFiBqdNibY3DpIBSLjXdTqAFySbFBg9SgU9MTKLWB7X4bAdNbw>
    <xmx:sO1maP6zHmnKeAGOO8sU5KgNkVAgm-e9UhK7XyV-qCok05oufRy-sg>
    <xmx:se1maJsEpqIOguBg59GPZ1o8OYsooH_gnidDKiZrF4mLhL6JCz3tgW9q>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:53:04 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 05/11] media: adv7180: Setup controls every time the device is reset
Date: Thu,  3 Jul 2025 22:52:17 +0200
Message-ID: <20250703205223.2810806-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The device initialization code resets the whole device, thus the initial
controls set at probe are lost as adv7180_init_controls() are called
before init_device(). Additionally the controls where never restored
after the device where reset coming back from suspend.

Solve this by separate the setup of the controls from the creation of
them, and always set them up when the device is reset.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index c2a79eba4dcd..3c7c896a21a4 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -700,7 +700,6 @@ static int adv7180_init_controls(struct adv7180_state *state)
 		v4l2_ctrl_handler_free(&state->ctrl_hdl);
 		return err;
 	}
-	v4l2_ctrl_handler_setup(&state->ctrl_hdl);
 
 	return 0;
 }
@@ -911,6 +910,8 @@ static int init_device(struct adv7180_state *state)
 
 	adv7180_set_field_mode(state);
 
+	__v4l2_ctrl_handler_setup(&state->ctrl_hdl);
+
 	/* register for interrupts */
 	if (state->irq > 0) {
 		/* config the Interrupt pin to be active low */
-- 
2.50.0


