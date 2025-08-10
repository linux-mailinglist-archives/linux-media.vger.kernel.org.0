Return-Path: <linux-media+bounces-39291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0EEB1F7A1
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B04BF1899BA7
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B31E6F06B;
	Sun, 10 Aug 2025 01:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yhel62qC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26851335BA
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789513; cv=none; b=pH6dXS8dbQxvYtuVatiVdv/g14L9vJGLrkRMOY6MKu43d8lTZppypv1XGuxDOMPE6XGmZ2QF4IFcXt4bW6fMlSEKnpK2CPhcIpmwxTJUfTWfp/0MoOM8VdPrQfrgvwkI0K/5Ka1f/lxkZyuWh5YkhRZyU9wlQlBz6W2AElTVe1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789513; c=relaxed/simple;
	bh=NWigm93A9K58rTU8h3adMFOJOlUHm1z1Jag75QuHFxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=odwLlnBDE0lBQaNWwXrEdANM1Vh78eJcc5C2D7z5xiz/WXqZ7LIplA24VuQPLQJwwSpcbAR9cUxiRmT8XYizzXN/yq/eY6uPnF7/282qE19IXldFZsUAjR0iKkqOSAnrXo39g720ZgWzn9FwKZC26fDHgIXKLC9ccnQ4QTpwqSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yhel62qC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 85ED019C6;
	Sun, 10 Aug 2025 03:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789459;
	bh=NWigm93A9K58rTU8h3adMFOJOlUHm1z1Jag75QuHFxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yhel62qCiCyGK/9AwPsgCQ2cYIgmi7oQBoms5oC857Sqlt3avAF92uHbRtlNg8LDc
	 28AfCVPGBb45rCtR9SC+zwXSywWVqSofaqvrYkS/WLS5trFsOMl/nmfXdCSaO69Z1e
	 HKPFqv164wIPERgV1tOjnykVd76gIPq/ohj1v5o4=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 18/76] media: rzg2l-cru: Do not set file->private_data
Date: Sun, 10 Aug 2025 04:30:00 +0300
Message-ID: <20250810013100.29776-19-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The RZ G2/L CRU driver sets file->private_data to the driver-specific
structure, but the following call to v4l2_fh_open() overwrites it
with a pointer to the just allocated v4l2_fh.

Remove the mis-leading assignment in the driver.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a8817a7066b2..941badc90ff5 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -1078,7 +1078,6 @@ static int rzg2l_cru_open(struct file *file)
 	if (ret)
 		return ret;
 
-	file->private_data = cru;
 	ret = v4l2_fh_open(file);
 	if (ret)
 		goto err_unlock;
-- 
Regards,

Laurent Pinchart


