Return-Path: <linux-media+bounces-11939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0818D0162
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ABDF284EC9
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A56C15EFA0;
	Mon, 27 May 2024 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VjioWgbM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AvY+w3M+"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E080715ECE0;
	Mon, 27 May 2024 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816326; cv=none; b=YRajNaUI0Jutgn39dSv3O1tvD6Q+2cqMyKzHYn7liDvmULPoWONmv+oGHJpKg1ddszQBlT8HoVgdJ/+DbD/wrUjyWdOZeLn5W3ef+SBD8g03vFO/Qvem85s9pH6egwJI57zcMfA3z7E+mBaJuS8KDK1hA3iZFRo0uNs/GULv4Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816326; c=relaxed/simple;
	bh=abdND7NQW7nTCshUaGhIpzvOe+Mzp6pcqLlmruI8ces=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EGDx73RYOxOZ3CwFkjuZY1kybdsWGg9Onr7YClFQXprDUDclz95azC7OEZvirq58dpNPN0OUebOp2G+xZWmMQAqGeP4V1er4NQEV6CCUkDv5Em7DA6bXD/gddQ4grZkPo+0DUOWnVCpYeHXus1wDbA7OldhvgXyRi0BQw5Nxo44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VjioWgbM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AvY+w3M+; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id D0BBE1C000A6;
	Mon, 27 May 2024 09:25:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 27 May 2024 09:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1716816323; x=1716902723; bh=IM
	Wa1gdYxbMis1wYUlF3HIoDc4VzWNFsaSDIoSidNGo=; b=VjioWgbMFaiXHlRqfa
	0xD68Ji0M5BkRNVXtHmez9c01fxy73P7jAbb/GH1V2u5Zb3+E5rxtZKJEVJ+vobQ
	MbwSAHedTpnkxiXoimcU2Ewv66bC1qOaz+UDT5cYOYoyZX+TlkA4+lnxoIeWr+eN
	rBvehSqSnbUHlHcOtCrTSRdHSmR7B3lM2sxV9hjq6ws1sAuYoHmZZKRn8x010Wc3
	40HgA0Z7v0eobbB4GaSnkCjyTBdb3txRU7vp8jtjkOEMNeEjuKE4suPxG8Yvdnx1
	S8uHjbEFzTbyybYddDpKhac4R05qjjz+Hc/0EnN+GmfYML3h7vxnAvMn7nLytbma
	W7Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716816323; x=1716902723; bh=IMWa1gdYxbMis
	1wYUlF3HIoDc4VzWNFsaSDIoSidNGo=; b=AvY+w3M+gPNnqHkHjioHVut0N9p0F
	+uC+WP8tmXSP/bWRFt19ITPSp5e7IyG0IcqWwdGQWHdAZODZ54ZtCBTMl/wKGky/
	zAt+BqOnc0jBarlgPDS4WREUDAnkIeVptwA4Vky6o2bo/yWbNN5aDY7j3ZFY3xae
	qm8Yy7gUE3EU3pB9nBiAWMXvmv7TI6y/+lfqG8FMrZK1OzAefiTNY7WDV98/S/FK
	U3xOLD8e8LxKB8tAodpOKbe7OJHyimUz9dICDw39Qo0//Gy9j38sagSjcUNXJcME
	6XnI7qez33Jigi4fDQ3Wulv4bm1zii2TNpLfuUTDfUGLIT2jpZJCCJCQw==
X-ME-Sender: <xms:wolUZpTvAT22b009Zhj3xpTrhAivvqGNMjhlfUgrsdfgCraU74apUA>
    <xme:wolUZiwWeDNFzpOQIRORLe7ieiLNKCemWCo6sVK0caij4uHMf9AnAEwjWsoay2mSp
    3uiLXks9hdYHjc--yI>
X-ME-Received: <xmr:wolUZu1Q_V205luiAb-uoEAjXfToDg-YMOhjB_9fh2KbbFdrfDPy8MtXKsDuo5vbH1DlFiN7Svp768TgW3uPMsAGjDQtpdkkShWH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:w4lUZhDP7wDnTE9i2lebzb9cjWtVq5YGCiZZ-denatP3I-hzGD_6dw>
    <xmx:w4lUZihOJ9l8JrR_J_D7RDTmAbXHuBg8GNV6yk9MUNukhNgdWSYCHg>
    <xmx:w4lUZlrTugPGCLNClIgB4R1G1tI7vzM1Q1HeJ75mxOZiABvuNvCbeg>
    <xmx:w4lUZthqBMa0-b3Tap2D5PAz2UxuOzhGGc7qKgCZdDgMwyXz1CVtgA>
    <xmx:w4lUZkYTO8usSaDBzdxuYIjpdwWkQtu0M3oi_duExtzwe6p_mHVwJALq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:25:21 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-isp: Add support for R-Car V4M
Date: Mon, 27 May 2024 15:25:13 +0200
Message-ID: <20240527132513.1684232-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for R-Car V4M. The ISP Channel Selector is used to route
channels to the different VIN modules. The ISP CS found in the V4M is
very similar to the one found on the V3U device.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-isp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 4512ac338ca5..8ba39e82272b 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -431,6 +431,7 @@ static int risp_probe_resources(struct rcar_isp *isp,
 static const struct of_device_id risp_of_id_table[] = {
 	{ .compatible = "renesas,r8a779a0-isp" },
 	{ .compatible = "renesas,r8a779g0-isp" },
+	{ .compatible = "renesas,r8a779h0-isp" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, risp_of_id_table);
-- 
2.45.1


