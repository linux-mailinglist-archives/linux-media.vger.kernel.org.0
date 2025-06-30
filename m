Return-Path: <linux-media+bounces-36340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 453ECAEE74D
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 21:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5415B44181B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 19:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAB32EE299;
	Mon, 30 Jun 2025 19:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7KngRev"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44572EBDFC;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310422; cv=none; b=KuPTjBH5EFP9s0RZK30QTAyztpCzuOsKNa2AvOtkLrjQ3GHf9aksUDk6mgHegtG/CiOGdGght8X7xN4aUIRiZoWVrM+iEpRHR8MCWjF5n7WWm8Q8cYS/VfI19Z6f+58UZJWg7yHipY5ZyOW3HGOtuO6PlhNxi5DnCEIX8vC0xxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310422; c=relaxed/simple;
	bh=PWNLGqQvd1xRaJ5tWni10l1Xvs3GUdrsPLnEj/U5JIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVpCgSKBWV3nzz2oTLO2GuJF01ag3ZZB0SgMJmPJRNDOHonCnGHAfQVZ5D+x+CI8XPROht2KCEZByf7S/pNkHm0GUMqUYFYkh1V8SqNMywcVlk0gOwOdIJcJmpQh5KnaQLlRw8nhGk6HvyY701KiOKPbYH7ZxCYVInkvUijm/eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7KngRev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AC02C4CEEB;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751310421;
	bh=PWNLGqQvd1xRaJ5tWni10l1Xvs3GUdrsPLnEj/U5JIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R7KngRevJvHozRN14ltrrY+EfTzJG15+PGQ1zLP9X+cNSy81anFQZJYgGK3Iq8pmo
	 kp3WZQn0r/8ASewE2YHU5vPY38G9h3pRMVJ4Kj/nKMhtFCUwQAIaYT25pz+t4tjMUd
	 tydlPlgEy7LAmg64W0X+qDNd9x6gBGRS52N+fxfAx092OIdRlMZMjoKuN7y18bcde5
	 LTZYwf5HaVcJ5oPTzcQNglEZXVPek1aXjJyl4ED10UU8R6mhKX9nTwVPaM0wP2I3qt
	 pKaFL2v0CutA40LrOY1pbw+ROZ+iZ1uFGgx07rISx28bmGfrxyEGDk1sdo7IpejjCh
	 T5xpxZx9ve/jA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B9FC83033;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 30 Jun 2025 21:05:22 +0200
Subject: [PATCH v2 2/5] media: i2c: imx214: Drop dev argument from
 imx214_parse_fwnode()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250630-imx214_fixes-v2-2-cd1a76c412c0@apitzsch.eu>
References: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
In-Reply-To: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Markus Elfring <Markus.Elfring@web.de>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751310420; l=1203;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=8u7kv1mgw/QKJdeWTXhTPT8LKCS1xuLLRvq/xmXOvBo=;
 b=ToWSc5B6DJjGz2WMGw4W7TFI5mokx8CV8T18Q5O6VEdbrQF/Yx96+MnE0ZCf301wY3Txnm9OY
 czNV4TdIxIyCGsfRZ4dg0F21bhGjVLEo2YA8lunnMFZzAX8YastMotQ
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The device can be accessed from struct imx214.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 8e9b5c9c93b0888f3d6be857168711edaf050db3..d9193bafa3cbb8fec2679200c38d30077d1b11bd 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1324,10 +1324,11 @@ static int imx214_identify_module(struct imx214 *imx214)
 	return 0;
 }
 
-static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214)
+static int imx214_parse_fwnode(struct imx214 *imx214)
 {
 	struct v4l2_fwnode_endpoint *bus_cfg = &imx214->bus_cfg;
 	struct fwnode_handle *endpoint;
+	struct device *dev = imx214->dev;
 	unsigned int i;
 	int ret;
 
@@ -1415,7 +1416,7 @@ static int imx214_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
 				     "failed to initialize CCI\n");
 
-	ret = imx214_parse_fwnode(dev, imx214);
+	ret = imx214_parse_fwnode(imx214);
 	if (ret)
 		return ret;
 

-- 
2.50.0



