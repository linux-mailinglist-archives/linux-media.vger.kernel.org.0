Return-Path: <linux-media+bounces-36174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9B3AECE19
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85B1B3B1245
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD33235050;
	Sun, 29 Jun 2025 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXAdziQs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84662230BC3;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208574; cv=none; b=QAsALJIREUyqCy0vP6OwSzG4hqA6ekXkomWI8HMyctyEB7H/4cQUOnviVx59BV8eRv7UWUMIDA1+KTQA68+C1r9bekYLJsiCljo5V1bn5WGf9TQtK4vdtes5KIqXahE/uDC1m1qTCmyDAPSvGXpcR19S9Y9iRbBpVLhSmkTuLko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208574; c=relaxed/simple;
	bh=8RBuwyFX+i6bHp5zzF84JTuvvkCicfyrsCbN+9DU7Sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pN+YJu3/P245WGNzXnUdlV9eZfdegMLBv+4Gkc/p+oU5JkBa13tLwgd+hFRRVKDE16VRP+PPeuYr3YePLINgyscVpD7KEYeplHtfWIaD+3HH1VkEjbIENf9eWkX4dykqabBAFeCwRpDXCX6uACcJBnYQhrQP1bhEuF5LWtZV+Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXAdziQs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42E9CC4CEF1;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751208574;
	bh=8RBuwyFX+i6bHp5zzF84JTuvvkCicfyrsCbN+9DU7Sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rXAdziQs+YggUp3QD0cOrUjnmrz0D4N2nvdkuiqFZSkAeN8OecVuWLLoNZQHx1Cdn
	 zCpqQmivSlGLXf8pR0syIBa9u1o0hVo9rhvQNlMps3ub0GzvSDuividIbUiMOJbpzR
	 t01sPjMlRFL3Tk+oGTSW828bSIoZ6yoVQC+V4fS/cEoCKIKE/a8CQ24EtitR4dFo5w
	 3iWiRo3oqhnzRcG+HUJiLzz32m4bdD2AuSd5CRDr1RCeZtIPAtpJyyDxv8kcArRTOZ
	 qSbfnVX8IaxoRmz7D40tylWEQnWl0iRWx4vOVC/SC8HeErRRB5XyEerFMRC4U9ju1n
	 xT7zPsV5LZD0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1F0C83027;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 29 Jun 2025 16:49:21 +0200
Subject: [PATCH 2/5] media: i2c: imx214: Drop dev argument from
 imx214_parse_fwnode()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250629-imx214_fixes-v1-2-873eb94ad635@apitzsch.eu>
References: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
In-Reply-To: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751208572; l=1136;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=H8sbCYlOjaNz8MFSGRXI5+CWm2oj7b1ROZKZiNJw/+w=;
 b=EwHc5RkncTt1il5EMiaBdzTUq8h+sx9f1TwoYqosEzn6OZBYIkW//FTQ34PCkCHngr7JRVZbO
 u2pkNwFoWASAZITq5EHYyKlv9q3/QYXmrfq2mfTd7+iSW/EJkk/lOCr
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The device can be accessed from struct imx214.

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



