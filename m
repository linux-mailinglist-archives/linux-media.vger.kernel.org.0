Return-Path: <linux-media+bounces-40427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51925B2DEA3
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9626166958
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F38264A86;
	Wed, 20 Aug 2025 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vj7mZ4Oz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5029E25D540
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755698452; cv=none; b=HDPBSj5xrjhiUIvk5cMUWSPYTteIpE3Gs8RqKKsls+F2zhR+Sb4rayyJfojSXPW8curOtP6A6c9CfLO+8LJfVtkfBaQEf08aPg1XYIW6jXAnWdVHPy8cbXx0D130fS7108D4W4MK8y61W5u6C0ZoMRNlisvNo92T2DrEmuG4u94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755698452; c=relaxed/simple;
	bh=S2EDmzB/CfFMSgy6B8jOkW2Qyh8R/aJX9Xxf5ZzcoZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjE0Psxt0Z41esgnzgD/AEWymz/OyZI9iKjvqXIUePXAeKPklDfDkd7PmcT0hNJSEV7GFw1WRuijjF58YquF+TrEC9SvQOCQ7NT2a3klyYo5FX6F4+BLqgLInvbZVpRSwz1bVt4eqxP7F6GD/f0L1yQhn3G2rJxK8GLuhVYfFAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vj7mZ4Oz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 29D191737;
	Wed, 20 Aug 2025 15:59:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755698389;
	bh=S2EDmzB/CfFMSgy6B8jOkW2Qyh8R/aJX9Xxf5ZzcoZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vj7mZ4OzeQ/UjyBuFuLSn/tF03pi0+y+FsgBRlzeFHDMxCrw5EwGgrgs+vORnKS+v
	 z4U6vbCWSMBER5I/YXnjTTQO7UXBda69ZmjPD57HTH7TUP5bplsmvfTyyi1NJaghul
	 syAWtN4E+f8gG0w8NwQHGUIsOtvJZ67ztijNat+Y=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Maud Spierings <maudspierings@gocontroll.com>,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Subject: [PATCH 2/2] media: mc: Improve unconnected pads debugging message in link exploration
Date: Wed, 20 Aug 2025 17:00:21 +0300
Message-ID: <20250820140021.8026-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250820140021.8026-1-laurent.pinchart@ideasonboard.com>
References: <20250820140021.8026-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When exploring links, a message is printed to indicate unconnected pads
being added. The message prints the entity name only. Print the origin
pad number as well to help with debugging pipeline start issues. While
at it, get the entity name from origin->entity instead of local->entity.
Both point to the same entity, but the former conveys the meaning
better.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 928613d60e8f..df20356fa98b 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -687,8 +687,8 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
 		return 0;
 
 	dev_dbg(walk->mdev->dev,
-		"media pipeline: adding unconnected pads of '%s'\n",
-		local->entity->name);
+		"media pipeline: adding unconnected pads of '%s' reachable from pad %u\n",
+		origin->entity->name, origin->index);
 
 	media_entity_for_each_pad(origin->entity, local) {
 		/*
-- 
Regards,

Laurent Pinchart


