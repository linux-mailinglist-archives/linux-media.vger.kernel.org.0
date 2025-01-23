Return-Path: <linux-media+bounces-25219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4FBA1A85A
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 18:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CF6516B5C4
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 17:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B4A15746F;
	Thu, 23 Jan 2025 17:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s/4EnnDW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB10214AD38;
	Thu, 23 Jan 2025 17:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651886; cv=none; b=f/F7aepaxXcUPUpsupAM5dH+ZxupVcPtF0IGEy67QbpgqwAvuME2vpWuqMtSZ/SCP0D5mTEp8150esm7Y3fCQiX4nU/dvRXGNptoKwtKYsr2LuiE9+/wuZdbiOUWhLvuDBrEDK9i4j7e11f18ue9FT3CaQBxN1JWuhZcEJ0T20I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651886; c=relaxed/simple;
	bh=Ofhcffi96xVaiPanXXo+FgUHdIeQ2P6FlYUylPJ67I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntcpLIwyj6VhBIN10Dv5YeBQxcYBJaQIMQZbgZMjtWn1HjAu85TUS8QZG2fQ3gqGtOSUg8D/mTBL7zFG5Dwi8EGQsMbA2amz1rKMT/j0qCQPqDpFsDbWZZ/G0zOIneK4YzLlJF9NrSzdyk+MKZIfSoGn2rypQO3E9yfzFmcauWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s/4EnnDW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFD04134C;
	Thu, 23 Jan 2025 18:03:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737651816;
	bh=Ofhcffi96xVaiPanXXo+FgUHdIeQ2P6FlYUylPJ67I4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s/4EnnDWNac7iU3BqsW7S/RAE8Bccl+7Tfgh9qw52HVaR/plONW/aWirNuf5y0paJ
	 rG5usoNlnSqPBuRASjHllMO/BYHqBOuWdlDcOGUT8ft8Rf7bXlfbuAfS9pODjSL4CG
	 ZYTXQQ/1/zo+N2JAISagP13l9M7cVv5J+ksLUkHo=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Thu, 23 Jan 2025 18:04:04 +0100
Subject: [PATCH 3/6] media: vsp1: dl: Use singleshot DL for VSPX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-v4h-iif-v1-3-7b4e5299939f@ideasonboard.com>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
In-Reply-To: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1681;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Ofhcffi96xVaiPanXXo+FgUHdIeQ2P6FlYUylPJ67I4=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnknak3zh1vYQ6DaayWjRYUlThLrTlinxHiI20C
 G7dL2mvNZqJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ5J2pAAKCRByNAaPFqFW
 PKYoD/9tHsCtVRFF3O9klLSPQVWZG9P8lqsdSH8PiFyIUql3KmLV+ELcew+0LXgE7SPHfluUR+C
 +KRXqR+tUduVjRIdER9xBmf6kqnipiLjjUCSBq/C55ebsOhmWPyYRTeUU5JoNYDYRxLxDi3kUcR
 IwK8vO+sgI+4PAX5gExKocJD+FSwSjQUlPEp/pv3his0HIAtNd+SuMawtIJt6cEY3ZbZoVVgi2R
 E/TvFQh2/BzZKpJ+L3owNFu4CwroswNuYemlROqVDq/g4bJItdnZCuDQP9gano38m3XfNhTUh2l
 rOyWrDFJUuxhRdpHdL1hbuSAuuhhPPEmwZnAtNmSJOxCby8GRyMcdGxBJsljSwdT4alt5CKmWQN
 G74iRKAnDelkC0wauUZ0V26YhO4/jmDcxcHyCoDsw/KxC44BEu6b1fZCuWdZiRlFowY88QwnYqQ
 Du2OUY1A0kyhFCpZER+rTO4qogP65tv3aTfvgq+uNPyTpp9hETgr9s9a5bkjAfMHM138YCF34dM
 kFHYT/gTRSGP/cwJp/jjwrpiwJsHZkuW94kxy3fqv6H9nTSXsAl6T1LpaqljQErutOswkGubJwF
 hxasEjWN7a3LX2dysiDrk8viFAygAhusv9k2iH9QBA5EnvM4Ux1tYUnJtm/hkd2UIX17vXl9fy0
 BqjX945HPj+Yz8A==
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
2.47.1


