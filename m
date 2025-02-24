Return-Path: <linux-media+bounces-26872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39963A42D90
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 21:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C9F3B26FA
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 20:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBDD20D4ED;
	Mon, 24 Feb 2025 20:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VSgIFIBr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1018248892;
	Mon, 24 Feb 2025 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428406; cv=none; b=Aay+8H2KgfdCQwUkNF28aLemD6w4p9A6Hkzx8p8GxRcTd3ztB14CAEUo09Wbd6xBJQl2BVfxiG62FmrXdTLa+PeIaLpJl1SNgClJTlt9OBFsYIjLwf9RsmdLEM766BN4SIXUef1YNTOrEv3OTeSan4AaJvSeP5PkE3fvXzxC41U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428406; c=relaxed/simple;
	bh=wKQVCD1mwop8tyRfNkYHGt7rxeI11mWS6QNoHD9G8c4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUww6ClqI+fm4Ot+a8HRdqb5dWx9b4xULwt8CFJ+TCEloosJX3ISurOZWtBWuU7Z7O27VuCqIoC/G3mBVdQBrweyUUqFcQmH/3VqEoylFN4c0ra67yyGzj0HWVbnSXhmRFzzqnr5S4TC2X1zmQz2RsOoClBxWrWolEoQz+20jy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VSgIFIBr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E982C8D;
	Mon, 24 Feb 2025 21:18:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740428312;
	bh=wKQVCD1mwop8tyRfNkYHGt7rxeI11mWS6QNoHD9G8c4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VSgIFIBrVZam+2u77+kx+omZUKkQl7YQGXlufLbTCMFDXNdOUBqfVgnqQikLlzVeU
	 C5UHiS9IwAY7bLT7EbWdeId8GiBrjnurojLPCCPzx/C8F8EGyvo1EnXlJyv4PYjz5v
	 pMSWbZzbc0LtUk/VIaQ72bqED9YqYOehTMKmEix8=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 24 Feb 2025 21:19:43 +0100
Subject: [PATCH v2 3/6] media: vsp1: dl: Use singleshot DL for VSPX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-v4h-iif-v2-3-0305e3c1fe2d@ideasonboard.com>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
In-Reply-To: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=wKQVCD1mwop8tyRfNkYHGt7rxeI11mWS6QNoHD9G8c4=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnvNRsS3U4HNCiUiDr58yixv6x+2LTUurF8TWQ6
 t0eauWMODyJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ7zUbAAKCRByNAaPFqFW
 PANWEACPtBk99d240nvH5qGP7lDqICWFPXnW9Z8sMhEAR0+B4sMSnIIgs88U8wSqibdDiVJkG16
 Gg7cMAvSpWz1M8lD1NWhiANEUhb8r4ls1V6/apEuuENbS+eBXpscBdwQq2Vi1EBn3XdCC0vGkIT
 E6LpMhfhhqJmuzKmI58T8YYCxwT2lCNgp1D6OamFBluTniNjXQCZ5PeawAQ/lYoAhUptQv39m1f
 6UgV9KSbltF5nZfMRvDXt66oWKGbfNrai5y1N0KBlpGksafUZsSoNnciMtnX9BoxFnIiD1L+YeN
 pQv53HACqiRFqMn45llXGbdLT2OFiX+xavFjajIEL1k4V0Ffc7qIZeKMsPRE60scDQM+k4AYtsq
 EPgEB2aRCRVXD49Na6FYd1dETkBRYkRHTlfxH4pzrjD5djqcYDR2wcg8VW+f6rUxO3hlLgzMdd2
 DIEYnTO1rZNoHr6KEjic0wOQZ1OR+TyPtnBAIUIXll5tCBQeoRSlcYljB+3GMPU75vrykuuxExW
 qKI0BA3YhlplY3MSzIUseBrjEBAazVZdYLz3MJfk473Wbtinl50A/kYzRWfMv9kxMvBwxUGPTgp
 0g3YzGIS1uwWsccOHluMou1UOMZNgzzr3AWoRvz991oPuA7GR72ruFDXmomiJrU6cFFnuwUhzoo
 kC7aVDAeEVySBag==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The vsp1_dl library allows to program a display list and feed it
continuously to the VSP2. As an alternative operation mode, the library
allows to program the VSP2 in 'single shot' mode, where a display list
is submitted to the VSP on request only.

Currently the 'single shot' mode is only available when the VSP2 is
controlled by userspace, while it works in continuous mode when driven
by DRM, as frames have to be submitted to the display continuously.

For the VSPX use case, where there is no uapi support, we should however
work in single-shot mode as the ISP driver programs the VSPX on
request.

Initialize the display lists in single shot mode in case the VSP1 is
controlled by userspace or in case the pipeline features an IIF entity,
as in the VSPX case.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index ad3fa1c9cc737c92870c087dd7cb8cf584fce41b..b8f0398522257f2fb771b419f34b56e59707476b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
@@ -1099,7 +1099,12 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
 		return NULL;
 
 	dlm->index = index;
-	dlm->singleshot = vsp1->info->uapi;
+	/*
+	 * uapi = single shot mode;
+	 * DRM = continuous mode;
+	 * VSPX = single shot mode;
+	 */
+	dlm->singleshot = (vsp1->info->uapi || vsp1->iif);
 	dlm->vsp1 = vsp1;
 
 	spin_lock_init(&dlm->lock);

-- 
2.48.1


