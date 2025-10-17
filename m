Return-Path: <linux-media+bounces-44799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E75BE6839
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0D5C4035A0
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 06:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF96730EF72;
	Fri, 17 Oct 2025 06:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5GSKqGK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2B222128D
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 06:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760680873; cv=none; b=G14UHF5UYPuqEipeU1kIuDgGMPaBFhOGYQWFWZDMX/r+2Gk91cqotDnnPVGoT9TmMUZHeN7zp0xh2sLvPVJlv1T6kTasL9DFAWyRkGfbRpCp7/SsA79NcIn7SlXtlr30i2BYSmsHON15J6Zq0m/7u1iuH6VG+XwBv4A28aigs7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760680873; c=relaxed/simple;
	bh=WZbDY+K8miRSugWtquglgJcWtS5kllg8beeuhZrQBf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKpo9rHUPP+DfWbtLPXZZvDXkaFl9qe9x3oBxJdtuDOWf5lmmiy/j69WSgscSzot2b2CSalgJ2WQ23Ph+/MQXU2q/b3PQNmMjjsatF74SKnzOuIxjJzCDnclsq/YcgZsE6w/QRKzUMF+D2r3Y2unUSeCTg8SB0GU20zhhsymfmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5GSKqGK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F7DC116C6;
	Fri, 17 Oct 2025 06:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760680872;
	bh=WZbDY+K8miRSugWtquglgJcWtS5kllg8beeuhZrQBf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5GSKqGKH6F/JVLDq7duogF6QGWZirZbHi0rADW2khCn3EasHMUi9vHwchD8bxC6e
	 N9n78ho+LfU8hTAnP4RjxD5qZ9fKTHRC+vFaXpkVpTMOyus/9pik6enAtuRvGfvIMh
	 XN192SoCjWbKolYShjKb6mCpoehBCsdCfUeg3UfQFY/SggM80wjkmRoT8NwPQu9WHe
	 XqaIUKL5EPfg2frgnt3iJK5FHAC8Zy8ct5LV31kkGIF/z9D1rEnBelFU8t4e3yNDE8
	 4OAfjxZWRGUfS1aAT1ahSkkwJS2yFzQbHuz5RaNW/6YGKJ6N7YGmH80xQNncKTYPRH
	 6TgXNN27J3yZw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9dWd-0000000029G-1Mox;
	Fri, 17 Oct 2025 08:01:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>
Cc: Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/3] media: imx8mq-mipi-csi2: drop unused module alias
Date: Fri, 17 Oct 2025 08:00:51 +0200
Message-ID: <20251017060051.8204-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251017060051.8204-1-johan@kernel.org>
References: <20251017060051.8204-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver has never supported anything but OF probing so drop the
unused platform module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44..5a5934ce1f84 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -1114,4 +1114,3 @@ module_platform_driver(imx8mq_mipi_csi_driver);
 MODULE_DESCRIPTION("i.MX8MQ MIPI CSI-2 receiver driver");
 MODULE_AUTHOR("Martin Kepplinger <martin.kepplinger@puri.sm>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:imx8mq-mipi-csi2");
-- 
2.49.1


