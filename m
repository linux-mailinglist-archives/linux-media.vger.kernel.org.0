Return-Path: <linux-media+bounces-59434-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BxTIQZj6mmrygIAu9opvQ
	(envelope-from <linux-media+bounces-59434-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 20:20:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC5D456074
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 20:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3061C3055400
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 18:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68CF2D8DC3;
	Thu, 23 Apr 2026 18:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gsr.dev header.i=@gsr.dev header.b="w2ZBvWBU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zkt5lHKR"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0253242B5;
	Thu, 23 Apr 2026 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776968156; cv=none; b=C4gJEQK5OxtRHSjlhMTg4zLwfM+9wVNGebp0+vOfVk4QtTrk8GGXMtSoxMQySjvZJ75Ep81XZi4uDQlafZ49mcbMUaqS/k+0tej8DKi4VbC1NO7sC48gLy2dAnEreyOTchnP8iF7AaV4eH3YUr7WCnE9rIbUWl3e5hkDkKvdSCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776968156; c=relaxed/simple;
	bh=TuwvV+RyokbmYEO6n6+zKaIau11VzF6p+2Sf0SVU4Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcQVrHNK5GF5f0STUOT15cbbH6jD9GPDPQCwtbh2iJ3pMv2ZjP7qSOoS1QDj1LhAd5cP4c1A7HwwtzVMG52KciDoz1Ngvq28iyglvivb7oOqJZP8x/RX/wcTkzSj8nFNDetu1tk/0w7QKJdpN/cySUJnPrlF5+u5SmEbyTriuoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gsr.dev; spf=pass smtp.mailfrom=gsr.dev; dkim=pass (2048-bit key) header.d=gsr.dev header.i=@gsr.dev header.b=w2ZBvWBU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Zkt5lHKR; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gsr.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gsr.dev
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 1A54BEC05A0;
	Thu, 23 Apr 2026 14:15:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 23 Apr 2026 14:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gsr.dev; h=cc:cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1776968153; x=1777054553; bh=ETgBNVmoQFZ3xzfi8N5xI
	mcJjAJ8nd9qWxKYJ9yE4AU=; b=w2ZBvWBUZTk9ZbLzrC+m5YPMav+2tEUtgJUBp
	NdcepH0JpihqeeoGxfV/tv05KfmgnouayctFGqy+d1MXSfzEV2n/maiFXvplz5Gh
	wfAeEyatxl7g4MBNInpIlK0dQtQbYFi+wkEju5gWNFY7rHAp8ovz6b1bzseTjetw
	Xvh4nAjTuUdJcTOw7dvrva/QX7TFTS0kr7ir4aTlX8A+wBmHAyR5D0QZtZWU1g+8
	XiCq4X1UTwGnpUbj8wTV/PV4EkdU40dkSW5/LuY8cNv+QV59uF5hq6Rc0Zrprw3m
	aKBwpQV9gHoBtAd0J6kknQdwVfkG0Tn7OsITToriTxGhV/bkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776968153; x=1777054553; bh=ETgBNVmoQFZ3xzfi8N5xImcJjAJ8nd9qWxK
	YJ9yE4AU=; b=Zkt5lHKRhzNRyKtnqcXe0Z2BYjr4K9oZIVWY0iMB9b6/tfxvjmC
	Wht1FdsuS9u9N66mjXlvOYZbo3sdpNbmCOqcAFSxH+ePUNpjDZ9OaxmOriOkDHMc
	tjlLgDbY902FW/CYV329rkgaYe0unW12RLne6lkQyc/Es+OD1FguyNfPYIrVyPP1
	/ZeirlEC15H4BKM+dwR3FwOysQh9SMR5vqc3PEzLJAkJM3xTSYzSWVACQM6ovttr
	TQSZcpmH0NTxFUuYYK+pDJCEp3RBPf4zU0WoqRHO45jauFfTd6Jxhiow6abEz62B
	pLqOVW7J/zy1TIslh7yt3+ZDV9O++6APY4g==
X-ME-Sender: <xms:2GHqaWfpUeYPfDor-E3fH77LMrZXgor2IeBzGEElhz7xvKEBFxiucw>
    <xme:2GHqaRwoNVjzn16Ga6obnJwrl-b4P0LD-_F_N_0U5w1l4u1cjfEOekqrF4UnoyU-y
    coF7Rn8pneL3CjYWtP0ow7DWqjVDyf_cXOFzsVYRWK_1EvX0zkq0PA>
X-ME-Received: <xmr:2GHqaWzSBdnu8l7SNnTdNAKNzVTSJfppTVoPjTLnp97VTpmzaatUoM-jbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeijeekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecuogfuohhrthgvugftvggtihhpvdculdegtddmnecujfgurh
    ephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepifgrsghrihgvlhcuufgr
    nhgthhgvshcuoehgrggsrhhivghlsehgshhrrdguvghvqeenucggtffrrghtthgvrhhnpe
    dugfeftefggeduiefgheeffefggeetleejteeihfelkefhteeugeelfeeileeugfenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrggsrhhivg
    hlsehgshhrrdguvghvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugidqshhtrghgihhngheslhhishhtshdrlhhinhhugidrug
    gvvhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdho
    rhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnugihsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopeimlhhktggrmhhpsdhprghttghhvghssehlihhsthhs
    rdhsrhdrhhht
X-ME-Proxy: <xmx:2GHqaaZxFnG2NLMDz5RSzTtijlZg5sbC7v3uQaX9kXjQujGI-TV7VA>
    <xmx:2GHqaX2VStMSvIYfHOtrktolRs7XyPNpAj0ZQLMoGq3-VpL1th--_g>
    <xmx:2GHqacdytoA6dL0M7vVYtq7nf-AzaK5SxUOQHzR1l4ZOAjr4Oe5n_A>
    <xmx:2GHqaULKMZdGudFx_VMt0DamDcvrSmVBqVzz566iLas8L7NFrLbAPQ>
    <xmx:2WHqaRoFF0ZoUTtQKRNwERvBZ3YmGz06N6bW2lsUUzWrYNO7o_TOh7AW>
Feedback-ID: i4f594605:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Apr 2026 14:15:50 -0400 (EDT)
From: Gabriel Sanches <gabriel@gsr.dev>
To: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Gabriel Sanches <gabriel@gsr.dev>
Subject: [PATCH] media: atomisp: Use negation to check for NULL
Date: Thu, 23 Apr 2026 15:14:36 -0300
Message-ID: <20260423181443.46566-1-gabriel@gsr.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gsr.dev:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gsr.dev:+,messagingengine.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59434-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[gsr.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gabriel@gsr.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gsr.dev:email,gsr.dev:dkim,gsr.dev:mid,messagingengine.com:dkim]
X-Rspamd-Queue-Id: BFC5D456074
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix checkpath error 'CHECK: Comparison to NULL could be written
"!gmin_subdevs[i].subdev"' in atomisp_gmin_platform.c:650.

Signed-off-by: Gabriel Sanches <gabriel@gsr.dev>
---

Hey, this is my first patch ever. I would appreciate any
feedback. Thanks!
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..620924614ee3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -647,7 +647,7 @@ static struct gmin_subdev *find_free_gmin_subdev_slot(void)
 	unsigned int i;
 
 	for (i = 0; i < MAX_SUBDEVS; i++)
-		if (gmin_subdevs[i].subdev == NULL)
+		if (!gmin_subdevs[i].subdev)
 			return &gmin_subdevs[i];
 	return NULL;
 }
-- 
2.52.0


