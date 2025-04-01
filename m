Return-Path: <linux-media+bounces-29157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3857A77D93
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 16:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F035161699
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 14:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BEF204F73;
	Tue,  1 Apr 2025 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WBQbccFz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219D5204C20;
	Tue,  1 Apr 2025 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517345; cv=none; b=VgryuGGki+GT+AgIhCiVo5GEIANQvKVOKv5ggIXH3mHxcpHTItxjs4DJmnMo7bGz+LCH0NFtNHAi8PgSz9RcfSOdlVEMZTzAILPOOI7zR8Oi0+BNKbp8mvdbvqiX+f6L01fbhqVJmtfRqKq8xlF1gbxfTF8J7l/nLJEcY5QURW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517345; c=relaxed/simple;
	bh=Yajun6kMjbV9z3AGrMVZcN4ap3LqbMRdasdkVLXWuJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXvVU4KUFsjN1xQ9vfhxSAvJk4X3pE2Cr2hr/ts/nlic7YOrZiliD1ioF05LhY9qKTrM+O96mOcEsuRwIPjqTrfywXGoNZmYaoMhdaTmu30+UHDHzCYp5MJPhiBYy90xhFvGHteUtj3JxJGbea2hfVOfNs1zcgdgLSehE3oTPrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WBQbccFz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.101] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78CB811E5;
	Tue,  1 Apr 2025 16:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743517219;
	bh=Yajun6kMjbV9z3AGrMVZcN4ap3LqbMRdasdkVLXWuJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WBQbccFzWKXQW93XoFtMi0kN4cgmPILm6Y60gAHfB1ooonW5DyCPHSwZ++QB7qngu
	 A1fAA/BjWDbKui+RQAVOpQ1eo3ws6jEQoVHUrzU8ET/QyE3royuFTNlkACBapoONLQ
	 TAU7lI7Y28TkH2ajOEGUe8LibMh5cd/hAsaQoFJc=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Tue, 01 Apr 2025 16:22:02 +0200
Subject: [PATCH v7 2/5] media: vsp1: dl: Use singleshot DL for VSPX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250401-v4h-iif-v7-2-cc547c0bddd5@ideasonboard.com>
References: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
In-Reply-To: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Yajun6kMjbV9z3AGrMVZcN4ap3LqbMRdasdkVLXWuJA=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn6/aRdVUMZTY1B2+i19/NQ234BboI2WkiaE0dU
 S6Ls+MQ/vaJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ+v2kQAKCRByNAaPFqFW
 PDWlD/4w9giCSu3yHwp5tU47EdXZTY2p6+7aNQHhdgD9OG9dNzmUq4Wdt/qbjbw4UIjPRp7r0jC
 4JAYY2a8OIx3OLazDNMF+vRvnINen+cYGxr0hAFVAqiVi20yfQoXnWaZxS9D/ns4TjzWnY24Kzg
 1HCGKcw6TVAO8tjC1aPT4t4O/NdjsMOPsWN7iIYJL0q9JUU9igq4t8SQ0Uy+IUwI2Asm/BxhM/2
 kunl6lMZE5E2y4kBn2eaW2UxdoNcXBl7xRVlXwMeetDO21z8klDprqsoO+1NwM0okCINn93Nunw
 qvdyLYY0YwCygft5Go6fHpoqdyxreMx1hAQKg6Ub7LuUFM7K+eRB5q9x4Qe3+BO4D/pmt/EfVvf
 KjtDQeLkIjXB/7/36ys35wkeoBCn7bg/H00jPL7aFa+u7/2dfimWJ+YtSZB5qU7RvspK1gH+ecD
 +BKAaaKqF8NO0pHPm3HhZoD7A5udrE+dOSWa2xX8YMpOZPw1myo4xyiH7ydPu6BdmXoVPyzU2qk
 b1xnNSFXRaIGGIt7U4DNAe4/gIGbM6WCAclbFSVv1cQty86+LAo0Au5KsH0ma5jHnXljUYzPo5G
 dLggQhnerupL8797lfLSzoBoxLJuzV18w192xZ5HMeSDRLGJ61A8k9lSbW0XbhNkuWxpmV9F9u0
 VMY43vHFzeOz+Iw==
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

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v2->v3:
 - Drop () in condition
---
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index ad3fa1c9cc73..bb8228b19824 100644
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
+	dlm->singleshot = vsp1->info->uapi || vsp1->iif;
 	dlm->vsp1 = vsp1;
 
 	spin_lock_init(&dlm->lock);

-- 
2.48.1


