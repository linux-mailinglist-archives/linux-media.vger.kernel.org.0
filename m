Return-Path: <linux-media+bounces-16822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75395F41D
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0374A1F2259A
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA21F191F7D;
	Mon, 26 Aug 2024 14:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EFHApiqX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CC118FC7C
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 14:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683444; cv=none; b=l+IVdjGsopPz9lKQFNxWZbQPX7wxIPMx6EK/DAi1plR0QGFu/TzGhSJlQWORs0YdpxbDFyoBXa00krKEXYceco1LzflOXlF7NyilUszV9CLp0ioiQkkRqqb9FUZH/0qQHmP68w0XJi3LYtMgfT6mKm8c92UJoi5JrjgajAcwt+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683444; c=relaxed/simple;
	bh=9oQYutyaMOqF0Dhr+m43f5SOj9YtHMZEAOH2lpITvso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAjz2j16b0kE0ng/d7aiap5qoHTdUQgEJM5EXpEFuqUaq424YtOpZ4qrnluIC/rGa6NSa2S+Fey9lvMRhH4+KC2eUmDO0yqOJflgpi/rhAV8u4F3mqOroMeQbN1iYXgoFiZ/PVIJjJc2PAdFfsamg7VIiRtCKr9pS3Ftomdg8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EFHApiqX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-142-90.net.vodafone.it [5.90.142.90])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D285741;
	Mon, 26 Aug 2024 16:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724683374;
	bh=9oQYutyaMOqF0Dhr+m43f5SOj9YtHMZEAOH2lpITvso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EFHApiqXWYYCvzObALFtXqmxSKvB7Kb7KrUyU9RWvt78uO+MV3H342S5EKJwW+xOO
	 ehuFh17wBg4psCq4ARpuo6yNsM8u1fNAGwqn3mfthx+X0s1bF0JsRqfdyS8XSowxqG
	 7XdStoJe0s7/1U1gD5gf3ttFMEfLdlHfuo8Fh7Sg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/4] media: pisp_be: Drop reference to non-existing function
Date: Mon, 26 Aug 2024 16:43:34 +0200
Message-ID: <20240826144338.463683-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240826144338.463683-1-jacopo.mondi@ideasonboard.com>
References: <20240826144338.463683-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment in the pisp_be driver references to the
 pispbe_schedule_internal() which doesn't exist.

Drop it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 65ff2382cffe..8ba1b9f43ba1 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
 	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
 				     &pispbe->node[MAIN_INPUT_NODE]);
 	if (ret <= 0) {
-		/*
-		 * This shouldn't happen; pispbe_schedule_internal should insist
-		 * on an input.
-		 */
+		/* Shouldn't happen, we have validated an input is available. */
 		dev_warn(pispbe->dev, "ISP-BE missing input\n");
 		hw_en->bayer_enables = 0;
 		hw_en->rgb_enables = 0;
-- 
2.45.2


