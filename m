Return-Path: <linux-media+bounces-17294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7656196760F
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 13:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 990591C20E9C
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 11:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5336D183CAD;
	Sun,  1 Sep 2024 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="BosNeXwY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CQLVGJOl"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B2B17E44A;
	Sun,  1 Sep 2024 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725188819; cv=none; b=SCtgg52fMh+ZxKORfJSCJIFI5RzE54nphDVroSSu3tq2+p79E0Zln2HgrzgtAPxHifjZJW7L3Nk1m96YzEY2YtGUxnxrngOVhOKg+DopbHyrtqJ1GXe66+ImgFmY2X5trdMoFPCFmN+nQungtN39//x+5toXqjFFq556GzW+CqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725188819; c=relaxed/simple;
	bh=/vC0N0asLVl0lHN1KwQMzIN2N/apXFXjJJd8qOMfQuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDwqGmcJ0j3nv6cWO5rPoICobQWCGSCdKszIMwEhWHsZbKzR+dITRhvOAeTuiZ/mQRCbD1d0wNrK205f/Y8N8/QL87hZ1q/V9pBPzwwcUSXPstVnVAUv9VkWMZK+GavXgk3XHcOqIVIMFAgzpGdiEBv2OxHs9SHAHhveYm25Bp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=BosNeXwY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CQLVGJOl; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Received: from phl-compute-08.internal (phl-compute-08.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0922511402A7;
	Sun,  1 Sep 2024 07:06:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sun, 01 Sep 2024 07:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1725188817; x=
	1725275217; bh=/t1GxqdzaPNcXcCFcGW0j9sbx/Vl0HCFeyHG4omIRHc=; b=B
	osNeXwY3EoVZ3EsoaT1lXmuSReh1630r8zeANJlXKG8T0735R9LrbvzIFuwrzQoy
	Zln4QISZZe0xNDRbxOjTTZET00XqEJdrxyy1hMho86s1fALEIMiBTRgQEur/QmBO
	4d+Eh8QCgo6M5EjN+Hzw5A3GQJAGfLxsFlx+lUpAYLx5x71ZVoCAua7knvAyReZC
	Vtc+Tpeg6lJD1U53S9SAWPjfcEcIZal4OJycnCreplUMhxn12g9EvoXms5qZWJH9
	EyiR84SNPm0qBIRXqOmkyGmYdf/QCRw0lw+YbfpMoeIEBhAlkM0R3yIfpzQwVGP+
	IbQh9J2nFJu3IyEYjG+vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725188817; x=
	1725275217; bh=/t1GxqdzaPNcXcCFcGW0j9sbx/Vl0HCFeyHG4omIRHc=; b=C
	QLVGJOlkTuF0q7sNNcUoCQO9y8771+Yg/1Os/lkMcHGHgyw+xztRAQN8i/qmid2Q
	9/gfmhr0/fe3pcqnDAiBdFz7rsNtr/3L80AaIGbbRrq7XvDzGXaI79Jsk0826bai
	+Oy0eKFRgnb1KQHfXcVAjKby5TjCYi3YSXn6WEywcBRw+f5izEwi4cZ9uYeWWvR9
	nU/DqmEeaYrpM3GVIqtmdnhY0xZ9bni6r7MATTc5NTF+1DymLwbeO+AtOMjdkWli
	1Vgxpwv82yw9Ixx2EKCgP0EY9Q56BUmRGoTtr211AHpl/BqDgqJv6s4tuWo2P+Fj
	gPnV+nL7TjjmSmFIM4IKg==
X-ME-Sender: <xms:0ErUZg9bu1nWiHzzlkzUDfz2bcdRkLHz2bl_OvX81M8LzoNHAQ30BQ>
    <xme:0ErUZotbX8ROtsdyUTwYFKd_y4xTxRVKPL0afqTaRzHSTptO2K84cRV-G-WJmegXu
    _myeyGh7lcJhO-j5m8>
X-ME-Received: <xmr:0ErUZmA0XS7KPgH5lk6Ydes3kQhVWr8KUjkTImhr228FhW212xSp6EJhVldgaoLuSxMclhfv60F2sv1V6nQ3sZI9cY4Az-Afxcp6Qhk-MB4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeghedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpedvjefgjeeuvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdff
    kedvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvg
    hlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrphgr
    ihhssehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhrtghpthhtohepvggumhhunh
    gurdhrrghilhgvsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhig
    qdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvg
    hvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:0ErUZgf5IEjm7FmmXcvpEgh7Yi4hfdQNJdOpjxxrTTfqSqnmpVSogw>
    <xmx:0ErUZlMWfjamZxnRQo0QBua15LMFquxGsW3FDNmYs5F7LrIt51r8Nw>
    <xmx:0ErUZqmvKIteynr9P8lDLUwVzeTYZxSF--yDqu9z8dHBcIng2EFdIA>
    <xmx:0ErUZnsyjr7AaPttWX-M8yNd3fYYOq0O8d7LqnIbzHSrymXTJCnGIg>
    <xmx:0UrUZofeUihxX0_roXckbHkdtFq-Yt6Y3ygeO6A-XUj2XezUV7R0-Nzn>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Sep 2024 07:06:55 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	apais@linux.microsoft.com,
	edmund.raile@protonmail.com,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFT][PATCH 4/5] firewire: core: non-atomic memory allocation for isochronous event to user client
Date: Sun,  1 Sep 2024 20:06:41 +0900
Message-ID: <20240901110642.154523-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
References: <20240901110642.154523-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the former commits, the callback of isochronous context runs on work
process, thus no need to use atomic memory allocation.

This commit replaces GFP_ATOMIC with GCP_KERNEL in the callback for user
client.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 3ea220d96c31..518eaa073b2b 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -982,7 +982,7 @@ static void iso_callback(struct fw_iso_context *context, u32 cycle,
 	struct client *client = data;
 	struct iso_interrupt_event *e;
 
-	e = kmalloc(sizeof(*e) + header_length, GFP_ATOMIC);
+	e = kmalloc(sizeof(*e) + header_length, GFP_KERNEL);
 	if (e == NULL)
 		return;
 
@@ -1001,7 +1001,7 @@ static void iso_mc_callback(struct fw_iso_context *context,
 	struct client *client = data;
 	struct iso_interrupt_mc_event *e;
 
-	e = kmalloc(sizeof(*e), GFP_ATOMIC);
+	e = kmalloc(sizeof(*e), GFP_KERNEL);
 	if (e == NULL)
 		return;
 
-- 
2.43.0


