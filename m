Return-Path: <linux-media+bounces-40426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 616C8B2DEA0
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABCF0565085
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D7E261593;
	Wed, 20 Aug 2025 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Khu6/pFl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2C2258ECD;
	Wed, 20 Aug 2025 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755698450; cv=none; b=c1Ty+inWaHdyc5XoshnDJm+ABu+vmue6C8J/LtTNTfCoLb3PpCVJrllZvAg9CuX6jRol+JFtBgP3QyD1aWwVMOFN8QYXCb9M4TIR2oJU/6w5qT5OUbs5H/lK3acY/XR/fA3FDbrKJMub1oaLSKK0XSOGaUOAmkT33UjrKwA24mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755698450; c=relaxed/simple;
	bh=PlDNfW1V70lApHqDVOVBvfQwS0zmGWBN6ms9AbLxFdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRAak+Y564dV6galvUgBp3swehemhu7to33lFna20RvWtI88jpV8KtsSupzlVb+Iq0EEe3wNSdB8VsguQtEpKlg+xcoE+Yt8w4amiATvp2OKbPgWmsS8JUL6x2sDI3L09IjyzzfamA3x18bdXhsZ8rUZhRfYVbmIrg48mDkYpRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Khu6/pFl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6BFBCB0B;
	Wed, 20 Aug 2025 15:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755698387;
	bh=PlDNfW1V70lApHqDVOVBvfQwS0zmGWBN6ms9AbLxFdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Khu6/pFlCYnjFuBFN10ExfiTrLgc1bOqg1zFNwCfmt0hBWuFAgWwjm5at1AfMZ4tH
	 Z2Jou3voiFCYsHNQrIvmfEAn5nYrfctGGTtw07Jst3BQL6U+HEGKyRrdLL2ofhCVc7
	 ZZThKOERzjxSSBXa1W+fx1gFDesjsNZ3y0gSR3Nw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Maud Spierings <maudspierings@gocontroll.com>,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] media: mc: Fix MUST_CONNECT handling for pads with no links
Date: Wed, 20 Aug 2025 17:00:20 +0300
Message-ID: <20250820140021.8026-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250820140021.8026-1-laurent.pinchart@ideasonboard.com>
References: <20250820140021.8026-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit b3decc5ce7d7 ("media: mc: Expand MUST_CONNECT flag to always
require an enabled link") expanded the meaning of the MUST_CONNECT flag
to require an enabled link in all cases. To do so, the link exploration
code was expanded to cover unconnected pads, in order to reject those
that have the MUST_CONNECT flag set. The implementation was however
incorrect, ignoring unconnected pads instead of ignoring connected pads.
Fix it.

Reported-by: Martin Kepplinger-Novaković <martink@posteo.de>
Closes: https://lore.kernel.org/linux-media/20250205172957.182362-1-martink@posteo.de
Reported-by: Maud Spierings <maudspierings@gocontroll.com>
Closes: https://lore.kernel.org/linux-media/20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com
Fixes: b3decc5ce7d7 ("media: mc: Expand MUST_CONNECT flag to always require an enabled link")
Cc: stable@vger.kernel.org # 6.1
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 04d69f042a0e..928613d60e8f 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -696,7 +696,7 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
 		 * (already discovered through iterating over links) and pads
 		 * not internally connected.
 		 */
-		if (origin == local || !local->num_links ||
+		if (origin == local || local->num_links ||
 		    !media_entity_has_pad_interdep(origin->entity, origin->index,
 						   local->index))
 			continue;
-- 
Regards,

Laurent Pinchart


